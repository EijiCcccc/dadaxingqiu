import { useState } from "react";
import { useNavigate } from "react-router";
import { Plus, Bell } from "lucide-react";
import LightFeedCard from "./FeedCard";

// Mock data for feeds
const mockFriendsFeeds = [
  {
    id: "1",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    nickname: "星辰",
    gender: "female" as const,
    content: "今天看到了超级美的日落，心情也变得明朗起来 🌅",
    images: [
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
    ],
    likes: 42,
    comments: 8,
    timestamp: "2小时前",
  },
  {
    id: "2",
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop",
    nickname: "逐梦",
    gender: "male" as const,
    content: "分享一下今天做的咖啡拉花，第一次尝试还不错 ☕️",
    images: [
      "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=400&h=400&fit=crop",
    ],
    likes: 68,
    comments: 15,
    timestamp: "5小时前",
  },
  {
    id: "3",
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop",
    nickname: "月影",
    gender: "female" as const,
    content: "周末去爬山了，空气真好！推荐大家也去感受一下大自然的美好 🌲",
    images: [
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1454496522488-7a8e488e8606?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
    ],
    likes: 95,
    comments: 23,
    timestamp: "昨天",
  },
];

const mockPublicFeeds = [
  {
    id: "4",
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    nickname: "星河",
    gender: "male" as const,
    content: "刚入手了新相机，试拍了几张，效果还不错 📷",
    images: [
      "https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1472214103451-9374bd1c798e?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=400&h=400&fit=crop",
    ],
    likes: 156,
    comments: 34,
    timestamp: "3小时前",
  },
  {
    id: "5",
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop",
    nickname: "清风",
    gender: "female" as const,
    content: "在家做了顿大餐，手艺越来越好了 🍳✨",
    images: [
      "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&h=400&fit=crop",
    ],
    likes: 88,
    comments: 19,
    timestamp: "6小时前",
  },
  {
    id: "6",
    avatar: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop",
    nickname: "晨曦",
    gender: "male" as const,
    content: "健身打卡第100天！坚持就是胜利 💪",
    images: [
      "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&h=400&fit=crop",
    ],
    likes: 203,
    comments: 47,
    timestamp: "8小时前",
  },
  {
    id: "7",
    avatar: "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=100&h=100&fit=crop",
    nickname: "云舒",
    gender: "female" as const,
    content: "今天的天空好美，分享给大家～",
    images: [
      "https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
      "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=400&h=400&fit=crop",
    ],
    likes: 124,
    comments: 28,
    timestamp: "昨天",
  },
];

export default function LightFeedTab() {
  const navigate = useNavigate();
  const [activeSubTab, setActiveSubTab] = useState<"friends" | "public">("friends");

  const currentFeeds = activeSubTab === "friends" ? mockFriendsFeeds : mockPublicFeeds;

  return (
    <div className="flex flex-col h-full">
      {/* Header */}
      <div className="bg-gradient-to-b from-purple-100 via-pink-50/30 to-white sticky top-0 z-10">
        <div className="px-4 pt-6 pb-3">
          <div className="flex items-center justify-between mb-4">
            <div className="flex gap-6 flex-1">
            <button
              onClick={() => setActiveSubTab("friends")}
              className="relative pb-2"
            >
              <span
                className={`text-xl font-bold transition-colors ${
                  activeSubTab === "friends" ? "text-gray-900" : "text-gray-500"
                }`}
              >
                嗒伴圈
              </span>
              {activeSubTab === "friends" && (
                <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-purple-600 rounded-full" />
              )}
            </button>
            <button
              onClick={() => setActiveSubTab("public")}
              className="relative pb-2"
            >
              <span
                className={`text-xl font-bold transition-colors ${
                  activeSubTab === "public" ? "text-gray-900" : "text-gray-500"
                }`}
              >
                广场
              </span>
              {activeSubTab === "public" && (
                <div className="absolute bottom-0 left-0 right-0 h-0.5 bg-purple-600 rounded-full" />
              )}
            </button>
            </div>
            <button
              onClick={() => navigate("/light/feed-notifications")}
              className="relative p-2 text-gray-500 hover:text-gray-900 hover:bg-purple-100/50 rounded-full transition-colors"
            >
              <Bell className="w-6 h-6" />
              {/* Notification Badge */}
              <span className="absolute top-0.5 right-0.5 min-w-[18px] h-[18px] px-1 bg-red-500 text-white text-[10px] font-medium rounded-full flex items-center justify-center">
                3
              </span>
            </button>
          </div>
        </div>
      </div>

      {/* Feed List */}
      <div className="flex-1 overflow-y-auto px-4 pt-4 pb-20">
        {currentFeeds.map((feed) => (
          <LightFeedCard key={feed.id} {...feed} />
        ))}
      </div>

      {/* Floating Create Button */}
      <button
        onClick={() => navigate("/light/create-feed")}
        className="fixed bottom-24 right-4 w-14 h-14 bg-purple-600 hover:bg-purple-700 text-white rounded-full shadow-lg flex items-center justify-center transition-all hover:scale-110 z-10"
      >
        <Plus className="w-6 h-6" />
      </button>
    </div>
  );
}
