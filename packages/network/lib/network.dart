/// 网络层包 - DioClient 与 `app.v1` Protobuf 生成类型
///
/// - DioClient: get/post/put、getPb/postPb/postPbDirect（Protobuf）
/// - 业务接口调用由各 feature 的 Repository 完成，使用 core 的 ApiPath
library network;

export 'src/dio_client.dart';
// account：设置 / 主页摘要等
export 'src/generated/app/v1/account.pb.dart';
export 'src/generated/app/v1/auth.pb.dart';
export 'src/generated/app/v1/client.pb.dart';
export 'src/generated/app/v1/common.pb.dart';
export 'src/generated/app/v1/explore.pb.dart';
export 'src/generated/app/v1/feedback.pb.dart';
export 'src/generated/app/v1/user.pb.dart';
