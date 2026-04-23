import { useNavigate } from "react-router";
import { ArrowLeft, MessageCircle } from "lucide-react";
import { Avatar, AvatarImage, AvatarFallback } from "../../components/ui/avatar";

// Mock notification data
const mockNotifications = [
  {
    id: "1",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    nickname: "星辰",
    gender: "female" as const,
    action: "赞了你的瞬间",
    time: "3小时前",
    feedId: "1",
    feedPreview: {
      type: "image" as const,
      content: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=100&h=100&fit=crop",
    },
  },
  {
    id: "2",
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop",
    nickname: "逐梦",
    gender: "male" as const,
    action: "赞了你的瞬间",
    time: "4小时前",
    feedId: "2",
    feedPreview: {
      type: "text" as const,
      content: "今天天气真好，适合出去走走～",
    },
  },
  {
    id: "3",
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop",
    nickname: "月影",
    gender: "female" as const,
    action: "评论了你的瞬间",
    time: "5小时前",
    feedId: "3",
    feedPreview: {
      type: "image" as const,
      content: "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=100&h=100&fit=crop",
    },
  },
  {
    id: "4",
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    nickname: "星河",
    gender: "male" as const,
    action: "赞了你的瞬间",
    time: "1天前",
    feedId: "4",
    feedPreview: {
      type: "text" as const,
      content: "分享一些最近的生活感悟，希望大家都能找到属于自己的快乐",
    },
  },
];

export default function LightFeedNotifications() {
  const navigate = useNavigate();

  const handleChat = (e: React.MouseEvent, userId: string) => {
    e.stopPropagation();
    navigate(`/light/chat/${userId}`);
  };

  const handleFeedClick = (feedId: string) => {
    navigate(`/light/feed/${feedId}`);
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white max-w-md mx-auto">
      {/* Header */}
      <div className="sticky top-0 z-10 bg-white/95 backdrop-blur-lg border-b border-purple-200/50">
        <div className="flex items-center px-4 h-14">
          <button
            onClick={() => navigate(-1)}
            className="p-2 -ml-2 text-gray-900 hover:bg-purple-100/50 rounded-full transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <h1 className="text-lg font-medium text-gray-900 ml-2">动态消息</h1>
        </div>
      </div>

      {/* Notification List */}
      <div>
        {mockNotifications.map((notification) => (
          <div
            key={notification.id}
            onClick={() => handleFeedClick(notification.feedId)}
            className="flex items-start gap-3 p-4 border-b border-gray-200 hover:bg-purple-50/50 transition-colors cursor-pointer bg-white"
          >
            {/* Avatar */}
            <Avatar className="w-12 h-12 flex-shrink-0">
              <AvatarImage src={notification.avatar} />
              <AvatarFallback className="bg-purple-100 text-purple-600">
                {notification.nickname[0]}
              </AvatarFallback>
            </Avatar>

            {/* Content */}
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 mb-1">
                <span className="text-gray-900 text-sm font-medium">{notification.nickname}</span>
                <span
                  className={`text-xs px-1.5 py-0.5 rounded-full ${
                    notification.gender === "male"
                      ? "bg-blue-100 text-blue-600"
                      : "bg-pink-100 text-pink-600"
                  }`}
                >
                  {notification.gender === "male" ? "♂" : "♀"}
                </span>
              </div>
              <p className="text-gray-600 text-sm mb-1">{notification.action}</p>
              <span className="text-gray-500 text-xs">{notification.time}</span>

              {/* Private Message Button */}
              <button
                onClick={(e) => handleChat(e, notification.id)}
                className="mt-2 flex items-center gap-1.5 px-3 py-1.5 bg-purple-100 hover:bg-purple-200 text-purple-600 rounded-full text-xs transition-colors"
              >
                <MessageCircle className="w-3.5 h-3.5" />
                <span>私聊感谢</span>
              </button>
            </div>

            {/* Feed Preview */}
            <div className="w-14 h-14 flex-shrink-0 rounded-lg overflow-hidden bg-gray-100">
              {notification.feedPreview.type === "image" ? (
                <img
                  src={notification.feedPreview.content}
                  alt="Preview"
                  className="w-full h-full object-cover"
                />
              ) : (
                <div className="w-full h-full flex items-center justify-center p-2">
                  <p className="text-gray-500 text-xs line-clamp-3 leading-tight">
                    {notification.feedPreview.content}
                  </p>
                </div>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
