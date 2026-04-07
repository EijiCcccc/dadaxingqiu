import 'package:dio/dio.dart';
import 'package:protobuf/protobuf.dart';

import 'generated/app/v1/common.pb.dart';

/// Content-Type for protobuf
const String kProtobufContentType = 'application/x-protobuf';

/// Dio 客户端封装
/// 提供统一的 HTTP 实例、拦截器、错误处理
///
/// 业务接口响应体为 [ApiResponse]（`code` / `message` / `trace_id` / `timestamp` / `data`）。
/// 成功时 `code == 0`，`data` 为 **`google.protobuf.Any`**（`type_url` + `value`）；
/// 使用 [AnyMixin.unpackInto] 解包到 [message] 对应的具体响应类型。
class DioClient {
  DioClient({
    String? baseUrl,
    Map<String, dynamic>? headers,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl ?? '',
            headers: headers ?? {},
            connectTimeout: connectTimeout ?? const Duration(seconds: 10),
            receiveTimeout: receiveTimeout ?? const Duration(seconds: 10),
          ),
        ) {
    _dio.interceptors.addAll([
      _LogInterceptor(),
      _ErrorInterceptor(),
    ]);
  }

  final Dio _dio;

  Dio get dio => _dio;

  static DioException _apiBusinessException(
    RequestOptions requestOptions,
    Response<dynamic>? response,
    ApiResponse api,
  ) {
    return DioException(
      requestOptions: requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error:
          'code=${api.code} message=${api.message} traceId=${api.traceId} timestamp=${api.timestamp}',
    );
  }


  static DioException _missingDataException(
    RequestOptions requestOptions,
    Response<dynamic>? response,
  ) {
    return DioException(
      requestOptions: requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'ApiResponse missing data field',
    );
  }

  /// [ApiResponse.data] 为 `google.protobuf.Any` 时，解包到 [message] 创建的实例。
  static T _unpackAnyData<T extends GeneratedMessage>(
    RequestOptions requestOptions,
    Response<dynamic>? response,
    ApiResponse api,
    T Function() message,
  ) {
    if (!api.hasData()) {
      throw _missingDataException(requestOptions, response);
    }
    return api.data.unpackInto(message());
  }

  static void _ensureBytes(Response<List<int>?> res) {
    if (res.data == null || res.data!.isEmpty) {
      throw DioException(
        requestOptions: res.requestOptions,
        type: DioExceptionType.badResponse,
        response: res,
        error: 'Empty protobuf response',
      );
    }
  }

  /// GET 请求：响应为 [ApiResponse]，成功后从 `data`（Any）解包为 [T]
  Future<T> getPb<T extends GeneratedMessage>(
    String path, {
    required T Function() message,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.get<List<int>>(
      path,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        responseType: ResponseType.bytes,
        headers: {
          ...?options?.headers,
          'Accept': kProtobufContentType,
        },
      ),
      cancelToken: cancelToken,
    );
    _ensureBytes(res);
    final api = ApiResponse.fromBuffer(res.data!);
    if (api.code != 0) {
      throw _apiBusinessException(res.requestOptions, res, api);
    }
    return _unpackAnyData(res.requestOptions, res, api, message);
  }

  /// POST：请求体为 protobuf，响应为 [ApiResponse]
  Future<T> postPb<T extends GeneratedMessage, R extends GeneratedMessage>(
    String path, {
    required R request,
    required T Function() message,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.post<List<int>>(
      path,
      data: request.writeToBuffer(),
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        contentType: kProtobufContentType,
        responseType: ResponseType.bytes,
        headers: {
          ...?options?.headers,
          'Accept': kProtobufContentType,
        },
      ),
      cancelToken: cancelToken,
    );
    _ensureBytes(res);
    final api = ApiResponse.fromBuffer(res.data!);
    if (api.code != 0) {
      throw _apiBusinessException(res.requestOptions, res, api);
    }
    return _unpackAnyData(res.requestOptions, res, api, message);
  }

  /// PUT：请求体为 protobuf，响应为 [ApiResponse]
  Future<T> putPb<T extends GeneratedMessage, R extends GeneratedMessage>(
    String path, {
    required R request,
    required T Function() message,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.put<List<int>>(
      path,
      data: request.writeToBuffer(),
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        contentType: kProtobufContentType,
        responseType: ResponseType.bytes,
        headers: {
          ...?options?.headers,
          'Accept': kProtobufContentType,
        },
      ),
      cancelToken: cancelToken,
    );
    _ensureBytes(res);
    final api = ApiResponse.fromBuffer(res.data!);
    if (api.code != 0) {
      throw _apiBusinessException(res.requestOptions, res, api);
    }
    return _unpackAnyData(res.requestOptions, res, api, message);
  }

  /// 附加 Bearer Token（从 [readToken] 读取，无 token 则不设置）
  void attachAuthTokenInterceptor(String? Function() readToken) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = readToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }
}

/// 日志拦截器（调试用）
class _LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // ignore: avoid_print
    print('[Dio] ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    // ignore: avoid_print
    print('[Dio] ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // ignore: avoid_print
    print('[Dio] Error: ${err.message}');
    handler.next(err);
  }
}

/// 错误拦截器
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 可在此统一转换业务错误码、弹 Toast 等
    handler.next(err);
  }
}
