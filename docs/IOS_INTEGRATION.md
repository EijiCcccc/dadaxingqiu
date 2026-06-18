# 搭搭星球 iOS 联调说明

## 1. 联调地址

当前联调根地址：

- `https://laboratories-watershed-shareware-shade.trycloudflare.com`

辅助检查地址：

- 健康检查：`https://laboratories-watershed-shareware-shade.trycloudflare.com/healthz`
- 浏览器体验页：`https://laboratories-watershed-shareware-shade.trycloudflare.com/playground`

说明：

- 这是临时联调地址。
- 如果突然不可用，请先联系后端确认服务或 tunnel 是否重启。

## 2. 协议文件

Proto 文件目录：

- `/api/proto/app/v1`

当前主要文件：

- `client.proto`
- `common.proto`
- `auth.proto`
- `user.proto`
- `explore.proto`
- `post.proto`
- `account.proto`
- `feedback.proto`
- `im.proto`
- `contact.proto`
- `chat.proto`

当前后端代码版本：

- `8ca9f2e826ecfd568c313b6aea2eb89f21a5a207`

## 3. 统一约定

客户端业务接口统一使用：

- `HTTP + Protobuf`

请求头：

- `Content-Type: application/x-protobuf`
- `Accept: application/x-protobuf`

登录后需要带：

- `Authorization: Bearer {access_token}`

响应最外层统一都是：

- `app.v1.ApiResponse`

成功时重点看：

- `code = 0`
- `data`

`data` 使用的是 `google.protobuf.Any`，但里面承载的是当前接口对应的实际业务消息。也就是说：

- 登录接口把 `data` 解成 `WechatLoginResponse`
- 资料接口把 `data` 解成 `UserProfile` 或 `UpdateMyProfileResponse`
- 设置接口把 `data` 解成 `SettingsInfo`
- IM 登录接口把 `data` 解成 `GetIMSessionResponse`
- 通讯录接口把 `data` 解成对应的 `GetContactFriendsResponse`、`GetContactFollowingResponse` 或 `GetContactFollowersResponse`
- 聊天设置接口把 `data` 解成对应的聊天 message，例如 `GetChatSettingsResponse`、`UpdateChatPinResponse`
- 具体对应关系以本文第 4 节接口表为准

失败时重点看：

- `code`
- `message`
- `trace_id`

`code` 是响应 body 里的业务码，不是 HTTP 状态码。只要 `code != 0`，即使 HTTP 状态是 `200`，也要按失败处理；此时 `data` 可能为空。

响应头补充：

- `X-Trace-ID`：与响应体里的 `trace_id` 对应，可用于排查问题

HTTP 状态语义：

- 大多数业务错误仍返回 `HTTP 200`，要以响应体里的 `code` 为准
- 请求体不是合法 protobuf 时，返回 `HTTP 400`
- `Content-Type` 不正确时，返回 `HTTP 415`
- 路径或方法不匹配时，才会出现真正的 `HTTP 404`

## 4. 当前可联调接口表

| 功能 | 方法 | 路径 | 是否需要登录 | 请求消息 | `data` 实际类型 |
|---|---|---|---|---|---|
| 微信登录 | `POST` | `/api/v1/auth/wechat/login` | 否 | `WechatLoginRequest` | `WechatLoginResponse` |
| 刷新登录 | `POST` | `/api/v1/auth/token/refresh` | 否 | `RefreshTokenRequest` | `RefreshTokenResponse` |
| 退出登录 | `POST` | `/api/v1/auth/logout` | 是 | `LogoutRequest` | `LogoutResponse` |
| 获取他人主页摘要 | `GET` | `/api/v1/users/{user_id}/summary` | 是 | 无 body | `OtherUserSummary` |
| 获取我的资料 | `GET` | `/api/v1/users/me` | 是 | 无 body | `UserProfile` |
| 获取头像上传凭证 | `POST` | `/api/v1/users/me/avatar/upload-token` | 是 | `CreateAvatarUploadRequest` | `CreateAvatarUploadResponse` |
| 修改我的资料 | `PUT` | `/api/v1/users/me/profile` | 是 | `UpdateMyProfileRequest` | `UpdateMyProfileResponse` |
| 获取标签列表 | `GET` | `/api/v1/tags` | 是 | 无 body | `GetTagsResponse` |
| 保存我的标签 | `PUT` | `/api/v1/users/me/tags` | 是 | `UpdateMyTagsRequest` | `UpdateMyTagsResponse` |
| 获取探索列表 | `GET` | `/api/v1/explore/cards?page=1&page_size=6` | 是 | 无 body，参数走 query | `GetExploreCardsResponse` |
| 获取我的主页摘要 | `GET` | `/api/v1/me/summary` | 是 | 无 body | `MySummary` |
| 获取设置页信息 | `GET` | `/api/v1/settings` | 是 | 无 body | `SettingsInfo` |
| 获取版本信息 | `GET` | `/api/v1/settings/version` | 否 | 无 body | `GetVersionResponse` |
| 提交反馈 | `POST` | `/api/v1/feedback` | 是 | `SubmitFeedbackRequest` | `SubmitFeedbackResponse` |
| 获取好友动态 | `GET` | `/api/v1/posts/friends` | 是 | 无 body | `GetFriendPostsResponse` |
| 获取广场动态 | `GET` | `/api/v1/posts/square` | 是 | 无 body | `GetSquarePostsResponse` |
| 发布动态 | `POST` | `/api/v1/posts` | 是 | `CreatePostRequest` | `CreatePostResponse` |
| 获取动态图片上传凭证 | `POST` | `/api/v1/posts/image/upload-token` | 是 | `CreatePostImageUploadRequest` | `CreatePostImageUploadResponse` |
| 获取动态详情 | `GET` | `/api/v1/posts/{post_id}` | 是 | 无 body | `GetPostDetailResponse` |
| 获取动态评论列表 | `GET` | `/api/v1/posts/{post_id}/comments` | 是 | 无 body | `GetPostCommentsResponse` |
| 获取动态点赞列表 | `GET` | `/api/v1/posts/{post_id}/likes` | 是 | 无 body | `GetPostLikesResponse` |
| 动态点赞 | `POST` | `/api/v1/posts/like` | 是 | `LikePostRequest` | `LikePostResponse` |
| 取消动态点赞 | `POST` | `/api/v1/posts/unlike` | 是 | `UnlikePostRequest` | `UnlikePostResponse` |
| 发表评论 | `POST` | `/api/v1/posts/comments` | 是 | `CreatePostCommentRequest` | `CreatePostCommentResponse` |
| 回复评论 | `POST` | `/api/v1/posts/comments/reply` | 是 | `ReplyPostCommentRequest` | `ReplyPostCommentResponse` |
| 删除评论 | `POST` | `/api/v1/posts/comments/delete` | 是 | `DeletePostCommentRequest` | `DeletePostCommentResponse` |
| 删除动态 | `POST` | `/api/v1/posts/delete` | 是 | `DeletePostRequest` | `DeletePostResponse` |
| 修改动态可见性 | `POST` | `/api/v1/posts/visibility` | 是 | `UpdatePostVisibilityRequest` | `UpdatePostVisibilityResponse` |
| 获取动态消息 | `GET` | `/api/v1/posts/notifications` | 是 | 无 body | `GetPostNotificationsResponse` |
| 获取动态未读数 | `GET` | `/api/v1/posts/notifications/unread` | 是 | 无 body | `GetPostUnreadCountResponse` |
| 标记动态消息已读 | `POST` | `/api/v1/posts/notifications/read` | 是 | `MarkPostNotificationsReadRequest` | `MarkPostNotificationsReadResponse` |
| 关注用户 | `POST` | `/api/v1/follows` | 是 | `FollowUserRequest` | `FollowUserResponse` |
| 取消关注 | `POST` | `/api/v1/follows/delete` | 是 | `UnfollowUserRequest` | `UnfollowUserResponse` |
| 查询关注关系 | `GET` | `/api/v1/follows/{target_user_id}` | 是 | 无 body | `GetFollowRelationResponse` |
| 获取腾讯 IM 登录信息 | `GET` | `/api/v1/im/session` | 是 | 无 body | `GetIMSessionResponse` |
| 获取会话补充信息 | `GET` | `/api/v1/im/conversations/meta?peer_user_ids=2001,2002` | 是 | 无 body，参数走 query | `GetIMConversationMetaResponse` |
| 获取亲密度详情 | `GET` | `/api/v1/im/intimacy/{peer_user_id}` | 是 | 无 body | `GetIMIntimacyResponse` |
| 获取好友列表 | `GET` | `/api/v1/contacts/friends?page=1&page_size=20` | 是 | 无 body，参数走 query | `GetContactFriendsResponse` |
| 获取关注列表 | `GET` | `/api/v1/contacts/following?page=1&page_size=20` | 是 | 无 body，参数走 query | `GetContactFollowingResponse` |
| 获取粉丝列表 | `GET` | `/api/v1/contacts/followers?page=1&page_size=20` | 是 | 无 body，参数走 query | `GetContactFollowersResponse` |
| 获取聊天设置 | `GET` | `/api/v1/chats/{peer_user_id}/settings` | 是 | 无 body | `GetChatSettingsResponse` |
| 设置聊天置顶 | `PUT` | `/api/v1/chats/{peer_user_id}/pin` | 是 | `UpdateChatPinRequest` | `UpdateChatPinResponse` |
| 设置用户备注 | `PUT` | `/api/v1/users/{target_user_id}/remark` | 是 | `UpdateUserRemarkRequest` | `UpdateUserRemarkResponse` |
| 获取聊天背景上传凭证 | `POST` | `/api/v1/chats/{peer_user_id}/background/upload-token` | 是 | `CreateChatBackgroundUploadRequest` | `CreateChatBackgroundUploadResponse` |
| 设置或取消聊天背景 | `PUT` | `/api/v1/chats/{peer_user_id}/background` | 是 | `UpdateChatBackgroundRequest` | `UpdateChatBackgroundResponse` |
| 删除对话业务状态 | `POST` | `/api/v1/chats/{peer_user_id}/delete` | 是 | `DeleteChatConversationRequest` | `DeleteChatConversationResponse` |

### 4.1 分页约定

以下接口的分页参数统一走 query：

- `/api/v1/posts/friends`
- `/api/v1/posts/square`
- `/api/v1/posts/{post_id}/comments`
- `/api/v1/posts/{post_id}/likes`
- `/api/v1/posts/notifications`
- `/api/v1/contacts/friends`
- `/api/v1/contacts/following`
- `/api/v1/contacts/followers`

统一规则：

- `page` 默认 `1`，最小 `1`
- `page_size` 默认 `20`，最大 `50`
- 超过 `50` 时按 `50` 处理
- 响应里的 `page`、`page_size`、`has_more` 要和请求与实际返回条数对齐

## 5. 建议联调顺序

建议按这个顺序接：

1. 微信登录
2. 获取我的资料
3. 修改资料
4. 获取标签列表
5. 保存个人标签
6. 获取探索列表
7. 获取我的主页摘要
8. 获取设置页信息
9. 获取版本信息
10. 提交反馈
11. 获取腾讯 IM 登录信息
12. 登录腾讯 IM SDK
13. 拉取腾讯 IM SDK 会话列表
14. 调用会话补充信息接口补齐用户资料和业务状态
15. 联调通讯录、聊天设置、备注、置顶、聊天背景

### 5.1 动态、关注与消息

本节是联调速查，字段与业务规则以 `docs/SPEC.md` 和 `api/proto/app/v1/post.proto` 为准，避免重复文档漂移。

联调这部分时，建议先确认下面几条规则：

- 动态草稿只存在 iOS 本地，不会先写入服务端。
- `SQUARE_ONLY` 的可见范围不是“列表里藏掉就行”，详情直链也必须按同样规则校验。
- 点赞取消后，对应消息不再展示。
- 评论删除后，消息要保留，但内容统一显示为 `该评论已删除`。
- 动态删除后，消息也要保留；用户点进去时，详情接口返回 `4040`，客户端按“内容已删除”处理。
- 进入动态消息页并调用 `GET /api/v1/posts/notifications` 后，本次返回的消息会自动标记为已读，不需要额外再调一次已读接口。
- 动态消息有图时优先展示第一张图片缩略图；无图时展示文案开头片段。

动态相关数字值速查：

| 字段 | 数值 | 含义 |
| --- | --- | --- |
| `PostVisibility` / `posts.visibility` | `0` | 未指定，创建和修改时不要传 |
| `PostVisibility` / `posts.visibility` | `1` | 仅自己可见 |
| `PostVisibility` / `posts.visibility` | `2` | 所有人可见 |
| `PostVisibility` / `posts.visibility` | `3` | 仅好友可见 |
| `PostVisibility` / `posts.visibility` | `4` | 仅广场可见，互关好友不可见 |
| `posts.status` | `0` | 正常动态 |
| `posts.status` | `1` | 已删除动态 |
| `post_comments.status` | `0` | 正常评论 |
| `post_comments.status` | `1` | 已删除评论，展示 `该评论已删除` |
| `post_likes.status` | `1` | 有效点赞 |
| `post_likes.status` | `2` | 已取消点赞 |
| `post_notifications.type` | `0` | 点赞动态 |
| `post_notifications.type` | `1` | 评论动态 |
| `post_notifications.type` | `2` | 回复评论 |
| `post_notifications.status` | `1` | 有效消息 |
| `post_notifications.status` | `2` | 无效消息，不展示 |
| `follow_relations.status` | `1` | 有效关注 |
| `follow_relations.status` | `2` | 已取消关注 |

### 5.2 IM、通讯录与聊天设置

本期 IM 使用腾讯云即时通信 IM。后端只提供登录凭证、账号同步、会话补充资料、通讯录和聊天设置；普通文本、图片、语音、表情包消息都由腾讯 IM SDK 发送和接收。

iOS 推荐接入顺序：

1. 调用 `GET /api/v1/im/session`。
2. 使用返回的 `sdk_app_id`、`user_sig`，以及业务 `user_id` 的十进制字符串登录腾讯 IM SDK。
3. 用腾讯 IM SDK 拉取会话列表、最近消息、未读数、已读状态。
4. 从会话列表中取对端业务用户 ID，批量调用 `GET /api/v1/im/conversations/meta?peer_user_ids=...`。
5. 用服务端返回的 `display_name`、头像、备注、置顶、背景、亲密度等字段补齐 UI。

边界说明：

- 服务端不提供普通消息发送接口。
- 服务端不返回腾讯 IM 最近消息、未读数、已读状态，这些以腾讯 IM SDK 为准。
- 图片、语音、表情包消息不要上传到本服务端，按腾讯 IM SDK 的消息能力处理。
- 腾讯 IM `UserID` 与业务 `user_id` 的十进制字符串一致，服务端不再单独返回 `im_user_id`。
- UserSig 由服务端生成，客户端不得持有腾讯 IM `secret_key`。
- `expire_at` 是 UserSig 过期 Unix 秒时间戳；接近过期时重新调用 `/api/v1/im/session`。

会话补充信息：

- 路径：`GET /api/v1/im/conversations/meta?peer_user_ids=2001,2002`
- `peer_user_ids` 是逗号分隔的业务用户 ID，最多 100 个。
- 返回顺序不保证和请求顺序完全一致，客户端应按 `user_id` 做映射。
- `display_name` 已经按备注优先计算，列表展示优先用它。
- `is_pinned`、`pinned_at`、`chat_background_url`、`is_deleted` 是当前登录用户自己的业务状态。

通讯录：

- `GET /api/v1/contacts/friends`：只返回互关用户，按亲密度优先。
- `GET /api/v1/contacts/following`：当前用户关注的人。
- `GET /api/v1/contacts/followers`：关注当前用户的人。
- 三个接口都使用 `page`、`page_size` query 参数。

聊天设置：

- `GET /api/v1/chats/{peer_user_id}/settings` 获取聊天设置页需要的汇总信息。
- `PUT /api/v1/chats/{peer_user_id}/pin` 设置或取消置顶，请求字段是 `is_pinned`。
- `PUT /api/v1/users/{target_user_id}/remark` 设置备注；`remark_name` 为空字符串表示清除备注。
- `POST /api/v1/chats/{peer_user_id}/background/upload-token` 获取聊天背景上传凭证。
- `PUT /api/v1/chats/{peer_user_id}/background` 保存或清除聊天背景；`background_url` 为空字符串表示清除背景。
- `POST /api/v1/chats/{peer_user_id}/delete` 只记录服务端业务状态；腾讯 IM SDK 侧的会话删除仍由客户端按 SDK 能力处理。

亲密度：

- `GET /api/v1/im/intimacy/{peer_user_id}` 返回当前用户视角下的发送数、接收数和亲密度。
- 亲密度由腾讯 IM 单聊发送后回调驱动更新，不由客户端手动上报。
- 计算口径是双方成功单聊消息数的较小值。

## 6. 关键字段说明

### 6.1 微信登录

请求字段：

- `code`
- `client_info.device_id`
- `client_info.client_ip`

说明：

- 当前支持 mock 微信联调。
- `client_info.device_id` 请稳定传递，同一设备刷新 token 和退出登录都依赖它。
- `client_info.client_ip` 为可选字段；如果客户端不传，服务端会自动取请求来源 IP。
- 当前建议测试 code 使用稳定字符串，不要每次随机变。
- 推荐格式：`mock_wx_demo01`、`mock_wx_demo02`
- 同一个测试用户请重复使用同一个 code，否则服务端会把它当成不同用户。

响应里重点关注：

- `token.access_token`
- `token.refresh_token`
- `next_step`

`next_step` 当前可能值：

- `complete_profile`
- `select_tags`
- `home`

### 6.1.1 ClientInfo

认证链路统一使用：

```proto
message ClientInfo {
  string device_id = 1;
  string client_ip = 2;
}
```

当前已使用到 `ClientInfo` 的请求：

- `WechatLoginRequest`
- `RefreshTokenRequest`
- `LogoutRequest`

注意：

- 刷新 token 和退出登录时，请继续传登录时同一设备的 `client_info.device_id`
- 如果设备 ID 不一致，刷新或退出会失败

### 6.2 获取 / 修改资料

`UpdateMyProfileRequest` 重点字段：

- `nickname`
- `gender`
- `avatar_url`

说明：

- 如果要上传头像，先调用 `POST /api/v1/users/me/avatar/upload-token`。
- 头像上传凭证请求体字段是：
  - `file_name`
  - `content_type`
- 成功后响应会返回：
  - `object_key`
  - `upload_url`
  - `public_url`
  - `expires_in`
- 客户端拿到 `upload_url` 后，直接对 OSS 发起 `PUT` 上传。
- 上传成功后，再调用 `PUT /api/v1/users/me/profile`，把 `avatar_url` 保存成返回的 `public_url`。
- `gender = 0` 表示未设置，`gender = 1` 表示男，`gender = 2` 表示女；修改资料时当前只提交 `1` 或 `2`。
- 修改成功后，响应里会返回最新资料字段。
- 同时会返回 `next_step`。
- 获取资料接口是 `GET /api/v1/users/me`
- 获取他人主页摘要接口是 `GET /api/v1/users/{user_id}/summary`
- 修改资料接口是 `PUT /api/v1/users/me/profile`
- 不要把获取资料错调成 `POST /api/v1/users/me/profile`
- 他人主页摘要只返回公开展示字段，当前 `online_status` 固定为 `unknown`

### 6.3 标签

获取标签列表返回：

- `groups`

每组包含：

- `type`
- `title`
- `required`
- `min_select`
- `max_select`
- `items`

保存标签请求：

- `tag_ids`

说明：

- 这是整体覆盖，不是增量追加。
- 保存成功后会返回最新标签和 `next_step`。

### 6.4 探索

请求参数走 query：

- `page`
- `page_size`

说明：

- 只有完成资料和标签后，探索接口才会正常返回结果。
- 当前返回字段足够直接渲染卡片：
  - `user_id`
  - `nickname`
  - `gender`
  - `avatar_url`
  - `tags`
- `page` 和 `page_size` 走 URL query，不走 protobuf body

### 6.5 设置 / 版本

设置页接口返回：

- `theme_sync_enabled`
- `privacy_policy_url`
- `user_agreement_url`
- `about_url`
- `feedback_enabled`

版本接口返回：

- `latest_version`
- `force_update`
- `download_url`
- `release_notes`

### 6.6 反馈

请求字段：

- `content`
- `contact`

说明：

- 需要登录态。
- 成功后返回 `submitted = true`。

## 7. 当前未开放

当前暂不联调：

- Apple 登录
- 真实拉黑拦截
- 服务端代发普通聊天消息
- 服务端自建 IM 消息历史、未读数、已读状态

## 8. 排错建议

如果接口失败，请优先提供以下信息给后端：

- 请求路径
- 请求时间
- 返回的 `code`
- 返回的 `message`
- 返回的 `trace_id`

常见判断方式：

- 如果 `HTTP 200` 但 `code != 0`，这是业务错误，不是网络层错误
- 如果 `HTTP 400`，优先检查 protobuf body 是否正确编码
- 如果 `HTTP 415`，优先检查 `Content-Type` 和 `Accept`
- 如果 `HTTP 404`，优先检查路径和方法是否写对

## 9. 常用错误码

以下都是响应 body 里的 `ApiResponse.code`。

| `code` | 含义 | iOS 处理建议 |
| --- | --- | --- |
| `0` | 成功 | 正常读取并解包 `data` |
| `4000` | 参数错误 | 检查本地参数、protobuf body、表单校验 |
| `4010` | AccessToken 无效或过期 | 先尝试刷新登录；刷新失败再回登录页 |
| `4011` | RefreshToken 无效或过期 | 直接回登录页 |
| `4030` | 风控拦截或无权限访问 | 按场景提示不可操作、不可见或风控提示 |
| `4031` | 账号封禁 | 阻断主流程，提示账号不可用 |
| `4040` | 资源不存在 | 展示不存在、已删除，或返回上一页 |
| `4290` | 请求限流 | 提示稍后再试，不要立即重复请求 |
| `5000` | 服务端内部错误 | 展示通用失败提示，并记录 `trace_id` |
| `5001` | 第三方服务异常 | 展示通用失败提示，可稍后重试 |

## 10. 最小联调目标

如果只想先打通主链路，优先完成这 5 步：

1. 登录
2. 修改资料
3. 获取标签
4. 保存标签
5. 获取探索列表
