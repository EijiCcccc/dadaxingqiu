import { useNavigate, useParams } from "react-router";
import { ArrowLeft, Mars, Venus } from "lucide-react";
import { Button } from "../../components/ui/button";

// Mock user data
const mockUserData: { [key: string]: any } = {
  "1": {
    id: 1,
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
    nickname: "星辰漫步",
    gender: "female",
    userId: "搭搭星球_12847563",
    personalTags: ["找聊天搭子", "找游戏搭子", "夜猫子", "旅行", "电影", "摄影"],
    additionalTags: ["温柔", "有趣", "爱笑"],
    hasChattedBefore: false,
  },
  "2": {
    id: 2,
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
    nickname: "宇宙旅行者",
    gender: "male",
    userId: "搭搭星球_87423156",
    personalTags: ["电影", "音乐", "美食", "咖啡"],
    additionalTags: [],
    hasChattedBefore: true,
  },
  "3": {
    id: 3,
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
    nickname: "月光女神",
    gender: "female",
    userId: "搭搭星球_93847261",
    personalTags: ["读书", "咖啡", "旅行", "摄影", "美食", "艺术"],
    additionalTags: ["文艺", "知性", "优雅"],
    hasChattedBefore: false,
  },
};

export default function LightUserProfile() {
  const navigate = useNavigate();
  const { userId } = useParams();
  const user = mockUserData[userId || "1"] || mockUserData["1"];

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white max-w-md mx-auto">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50">
        <div className="flex items-center h-14 px-4">
          <button
            onClick={() => navigate(-1)}
            className="w-9 h-9 flex items-center justify-center rounded-full hover:bg-purple-200/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-5 h-5 text-purple-900" />
          </button>
        </div>
      </div>

      <div className="px-4 py-6 space-y-6">
        {/* SECTION 1 — User Information */}
        <div className="flex items-center gap-4">
          {/* Avatar */}
          <div className="flex-shrink-0">
            <img
              src={user.avatar}
              alt={user.nickname}
              className="w-16 h-16 rounded-full object-cover ring-2 ring-purple-400"
            />
          </div>

          {/* User Details */}
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <h1 className="text-purple-900 text-xl font-semibold">{user.nickname}</h1>
              {user.gender === "male" ? (
                <Mars className="w-5 h-5 text-blue-500 flex-shrink-0" />
              ) : (
                <Venus className="w-5 h-5 text-pink-500 flex-shrink-0" />
              )}
            </div>
            <p className="text-purple-600 text-sm">ID: {user.userId}</p>
          </div>
        </div>

        {/* SECTION 2 — Personal Tags */}
        <div className="space-y-3">
          <h2 className="text-purple-900 text-base font-medium">个人标签</h2>
          <div className="bg-white rounded-2xl p-4 border border-purple-200 shadow-sm">
            <div className="flex flex-wrap gap-2">
              {user.personalTags.map((tag: string, index: number) => (
                <span
                  key={index}
                  className="px-4 py-2 bg-purple-50 text-purple-600 rounded-full text-sm border border-purple-200"
                >
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>

        {/* SECTION 3 — Additional Tags */}
        <div className="space-y-3">
          <h2 className="text-purple-900 text-base font-medium">Ta的标签</h2>
          <div className="bg-white rounded-2xl p-4 border border-purple-200 shadow-sm min-h-[64px] flex items-center">
            {user.additionalTags.length > 0 ? (
              <div className="flex flex-wrap gap-2 w-full">
                {user.additionalTags.map((tag: string, index: number) => (
                  <span
                    key={index}
                    className="px-4 py-2 bg-purple-50 text-purple-600 rounded-full text-sm border border-purple-200"
                  >
                    {tag}
                  </span>
                ))}
              </div>
            ) : (
              <p className="text-purple-500 text-sm text-center w-full">Ta还没有标签哦</p>
            )}
          </div>
        </div>

        {/* SECTION 4 — Action Button */}
        <div className="pt-4 pb-6">
          {user.hasChattedBefore ? (
            <Button className="w-full h-14 bg-white hover:bg-purple-50 text-purple-900 border border-purple-200 rounded-full text-base font-medium">
              跟Ta聊天
            </Button>
          ) : (
            <Button className="w-full h-14 bg-gradient-to-r from-purple-400 to-pink-400 hover:from-purple-500 hover:to-pink-500 text-white rounded-full text-base font-medium shadow-lg shadow-purple-400/30">
              打个招呼
            </Button>
          )}
        </div>
      </div>
    </div>
  );
}