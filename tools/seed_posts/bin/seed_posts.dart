// ignore_for_file: avoid_print
//
// 批量发布带图片的动态（测试/种子数据）
//
// 用法:
//   cd tools/seed_posts && dart pub get && dart run bin/seed_posts.dart
//   dart run bin/seed_posts.dart --count 10
//   dart run bin/seed_posts.dart --token <access_token>
//
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:protobuf/protobuf.dart';

import '../../../packages/network/lib/src/generated/app/v1/auth.pb.dart';
import '../../../packages/network/lib/src/generated/app/v1/client.pb.dart';
import '../../../packages/network/lib/src/generated/app/v1/common.pb.dart';
import '../../../packages/network/lib/src/generated/app/v1/post.pb.dart';

const kProtobufContentType = 'application/x-protobuf';

const defaultBaseUrl =
    'https://featuring-liquid-meyer-did.trycloudflare.com';
const defaultWechatCode = 'mock_wx_1212324';
const defaultCount = 10;

const apiWechatLogin = '/api/v1/auth/wechat/login';
const apiPostImageUploadToken = '/api/v1/posts/image/upload-token';
const apiPosts = '/api/v1/posts';

final posts = [
  (
    title: '晨间咖啡',
    content: '一杯手冲开启新的一天，香气里藏着小小的仪式感。',
    seed: 'coffee-morning',
  ),
  (
    title: '城市漫步',
    content: '周末在老街随手拍，阳光洒在砖墙上，时间好像慢了下来。',
    seed: 'city-walk',
  ),
  (
    title: '阅读时光',
    content: '最近在读一本关于设计思维的书，每页都有新启发。',
    seed: 'reading-time',
  ),
  (
    title: '健身打卡',
    content: '今天完成了 5 公里慢跑，汗水是最好的奖励。',
    seed: 'workout-run',
  ),
  (
    title: '美食分享',
    content: '尝试做了番茄意面，简单调味也能很满足。',
    seed: 'food-pasta',
  ),
  (
    title: '旅行记忆',
    content: '翻相册看到海边的照片，蓝色让人瞬间放松。',
    seed: 'travel-sea',
  ),
  (
    title: '植物角落',
    content: '给阳台的绿植换了新盆，希望它们继续野蛮生长。',
    seed: 'plant-corner',
  ),
  (
    title: '音乐推荐',
    content: '循环播放一张爵士专辑，适合深夜整理思绪。',
    seed: 'music-jazz',
  ),
  (
    title: '摄影练习',
    content: '练习逆光构图，光影对比比滤镜更有故事感。',
    seed: 'photo-light',
  ),
  (
    title: '星空夜话',
    content: '抬头看见清晰的星空，提醒自己别总低头看手机。',
    seed: 'night-sky',
  ),
];

Future<void> main(List<String> args) async {
  final options = parseArgs(args);
  final client = PbClient(baseUrl: options.baseUrl, token: options.token);

  if (client.token == null || client.token!.isEmpty) {
    stdout.writeln('正在登录 (mock 微信)...');
    await client.login(options.wechatCode);
    stdout.writeln('登录成功');
  }

  final count = min(options.count, posts.length);
  stdout.writeln('准备发布 $count 条带图动态...\n');

  var success = 0;
  for (var i = 0; i < count; i++) {
    final draft = posts[i];
    stdout.write('[${i + 1}/$count] ${draft.title} ... ');
    try {
      final postId = await publishPost(client: client, draft: draft, index: i);
      success++;
      stdout.writeln('成功 (post_id=$postId)');
    } catch (e) {
      stdout.writeln('失败: $e');
    }
    if (i < count - 1) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
  }

  stdout.writeln('\n完成: $success/$count 条发布成功');
  exit(success == count ? 0 : 1);
}

class PbClient {
  PbClient({required this.baseUrl, String? token})
      : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 30),
          ),
        ),
        token = token {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final auth = this.token;
          if (auth != null && auth.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $auth';
          }
          handler.next(options);
        },
      ),
    );
  }

  final String baseUrl;
  final Dio dio;
  String? token;

  Future<void> login(String wechatCode) async {
    final response = await postPb<WechatLoginResponse, WechatLoginRequest>(
      apiWechatLogin,
      request: WechatLoginRequest(
        code: wechatCode,
        clientInfo: ClientInfo(deviceId: 'seed-posts-script', clientIp: ''),
      ),
      message: WechatLoginResponse.new,
    );
    final accessToken = response.token.accessToken;
    if (accessToken.isEmpty) {
      throw StateError('登录成功但未返回 access_token');
    }
    token = accessToken;
    stdout.writeln('  用户: ${response.user.nickname} (${response.user.id})');
  }

  Future<T> postPb<T extends GeneratedMessage, R extends GeneratedMessage>(
    String path, {
    required R request,
    required T Function() message,
  }) async {
    final response = await dio.post<List<int>>(
      path,
      data: request.writeToBuffer(),
      options: Options(
        contentType: kProtobufContentType,
        responseType: ResponseType.bytes,
        headers: {'Accept': kProtobufContentType},
      ),
    );
    return unpackResponse(response, message);
  }

  T unpackResponse<T extends GeneratedMessage>(
    Response<List<int>?> response,
    T Function() message,
  ) {
    final bytes = response.data;
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Empty protobuf response');
    }
    final api = ApiResponse.fromBuffer(bytes);
    if (api.code != 0) {
      throw StateError(
        'code=${api.code} message=${api.message} traceId=${api.traceId}',
      );
    }
    if (!api.hasData()) {
      throw StateError('ApiResponse missing data field');
    }
    return api.data.unpackInto(message());
  }
}

Future<String> publishPost({
  required PbClient client,
  required ({String title, String content, String seed}) draft,
  required int index,
}) async {
  final imageBytes = await downloadImage(draft.seed, index);
  final publicUrl = await uploadImage(
    client: client,
    imageBytes: imageBytes,
    fileName: 'post_${draft.seed}.jpg',
  );

  final response = await client.postPb<CreatePostResponse, CreatePostRequest>(
    apiPosts,
    request: CreatePostRequest()
      ..content = '${draft.title}\n\n${draft.content}'
      ..imageUrls.add(publicUrl)
      ..visibility = PostVisibility.PUBLIC,
    message: CreatePostResponse.new,
  );

  return response.post.postId.toString();
}

Future<Uint8List> downloadImage(String seed, int index) async {
  final url = 'https://picsum.photos/seed/$seed-$index/1080/1080';
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
      followRedirects: true,
      validateStatus: (status) => status != null && status < 400,
    ),
  );
  final response = await dio.get<List<int>>(
    url,
    options: Options(responseType: ResponseType.bytes),
  );
  final data = response.data;
  if (data == null || data.isEmpty) {
    throw StateError('下载图片失败: $url');
  }
  return Uint8List.fromList(data);
}

Future<String> uploadImage({
  required PbClient client,
  required Uint8List imageBytes,
  required String fileName,
}) async {
  const contentType = 'image/jpeg';
  final tokenResponse = await client.postPb<
      CreatePostImageUploadResponse,
      CreatePostImageUploadRequest>(
    apiPostImageUploadToken,
    request: CreatePostImageUploadRequest(
      fileName: fileName,
      contentType: contentType,
    ),
    message: CreatePostImageUploadResponse.new,
  );

  await client.dio.put<void>(
    tokenResponse.uploadUrl,
    data: imageBytes,
    options: Options(headers: {'Content-Type': contentType}),
  );

  if (tokenResponse.publicUrl.isEmpty) {
    throw StateError('上传成功但未返回 public_url');
  }
  return tokenResponse.publicUrl;
}

({String baseUrl, String? token, int count, String wechatCode}) parseArgs(
  List<String> args,
) {
  var baseUrl = defaultBaseUrl;
  String? token;
  var count = defaultCount;
  var wechatCode = defaultWechatCode;

  for (var i = 0; i < args.length; i++) {
    switch (args[i]) {
      case '--base-url':
        if (i + 1 >= args.length) usage('--base-url 需要参数');
        baseUrl = args[++i];
      case '--token':
        if (i + 1 >= args.length) usage('--token 需要参数');
        token = args[++i];
      case '--count':
        if (i + 1 >= args.length) usage('--count 需要参数');
        count = int.tryParse(args[++i]) ?? usage('--count 必须是数字');
      case '--wechat-code':
        if (i + 1 >= args.length) usage('--wechat-code 需要参数');
        wechatCode = args[++i];
      case '--help':
      case '-h':
        usage();
      default:
        usage('未知参数: ${args[i]}');
    }
  }

  if (count <= 0) usage('--count 必须大于 0');
  return (
    baseUrl: baseUrl,
    token: token,
    count: count,
    wechatCode: wechatCode,
  );
}

Never usage([String? message]) {
  if (message != null) stderr.writeln('错误: $message\n');
  stderr.writeln('''
用法: dart run bin/seed_posts.dart [选项]

选项:
  --count <n>           发布条数，默认 $defaultCount
  --token <token>       直接使用 access_token，跳过登录
  --base-url <url>      API 基址，默认 $defaultBaseUrl
  --wechat-code <code>  mock 微信 code，默认 $defaultWechatCode
  -h, --help            显示帮助
''');
  exit(message == null ? 0 : 1);
}
