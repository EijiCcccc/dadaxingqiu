import { useState } from "react";
import { useNavigate } from "react-router";
import { ArrowLeft, Heart } from "lucide-react";

type ContactUser = {
  id: number;
  avatar: string;
  nickname: string;
  gender: "male" | "female";
  intimacy?: number;
};

const mockFriends: ContactUser[] = [
  {
    id: 1,
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    nickname: "星辰漫步",
    gender: "female",
    intimacy: 1688,
  },
  {
    id: 2,
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop",
    nickname: "宇宙旅行者",
    gender: "male",
    intimacy: 856,
  },
  {
    id: 3,
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop",
    nickname: "月光女神",
    gender: "female",
    intimacy: 642,
  },
  {
    id: 4,
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    nickname: "星际探险",
    gender: "male",
    intimacy: 523,
  },
];

const mockFollowing: ContactUser[] = [
  {
    id: 5,
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop",
    nickname: "流星雨",
    gender: "female",
  },
  {
    id: 6,
    avatar: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop",
    nickname: "银河系长",
    gender: "male",
  },
];

const mockFollowers: ContactUser[] = [
  {
    id: 7,
    avatar: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop",
    nickname: "彗星少女",
    gender: "female",
  },
  {
    id: 8,
    avatar: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop",
    nickname: "逐梦",
    gender: "male",
  },
];

export default function LightContacts() {
  const navigate = useNavigate();
  const [activeTab, setActiveTab] = useState<"friends" | "following" | "followers">("friends");

  const getCurrentList = () => {
    switch (activeTab) {
      case "friends":
        return mockFriends;
      case "following":
        return mockFollowing;
      case "followers":
        return mockFollowers;
    }
  };

  const getGenderColor = (gender: "male" | "female") => {
    return gender === "male" ? "text-blue-500" : "text-pink-500";
  };

  const getGenderSymbol = (gender: "male" | "female") => {
    return gender === "male" ? "♂" : "♀";
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white max-w-md mx-auto">
      {/* Header */}
      <div className="sticky top-0 z-10 bg-white/95 backdrop-blur-lg border-b border-purple-200/50">
        <div className="flex items-center px-4 h-14">
          <button
            onClick={() => navigate(-1)}
            className="p-2 -ml-2 text-purple-900 hover:bg-purple-100/50 rounded-full transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <h1 className="text-lg font-medium text-purple-900 ml-2">通讯录</h1>
        </div>

        {/* Tabs */}
        <div className="flex items-center border-b border-purple-200/30">
          <button
            onClick={() => setActiveTab("friends")}
            className={`flex-1 py-3 text-sm font-medium transition-colors relative ${
              activeTab === "friends"
                ? "text-purple-900"
                : "text-gray-500"
            }`}
          >
            好友 {mockFriends.length}
            {activeTab === "friends" && (
              <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-12 h-0.5 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full" />
            )}
          </button>
          <button
            onClick={() => setActiveTab("following")}
            className={`flex-1 py-3 text-sm font-medium transition-colors relative ${
              activeTab === "following"
                ? "text-purple-900"
                : "text-gray-500"
            }`}
          >
            关注 {mockFollowing.length}
            {activeTab === "following" && (
              <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-12 h-0.5 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full" />
            )}
          </button>
          <button
            onClick={() => setActiveTab("followers")}
            className={`flex-1 py-3 text-sm font-medium transition-colors relative ${
              activeTab === "followers"
                ? "text-purple-900"
                : "text-gray-500"
            }`}
          >
            粉丝 {mockFollowers.length}
            {activeTab === "followers" && (
              <div className="absolute bottom-0 left-1/2 -translate-x-1/2 w-12 h-0.5 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full" />
            )}
          </button>
        </div>
      </div>

      {/* Contact List */}
      <div className="divide-y divide-purple-200/30">
        {getCurrentList().map((user) => (
          <div
            key={user.id}
            onClick={() => navigate(`/light/user/${user.id}`)}
            className="flex items-center gap-3 px-4 py-3 hover:bg-purple-100/30 transition-colors cursor-pointer"
          >
            {/* Avatar */}
            <img
              src={user.avatar}
              alt={user.nickname}
              className="w-12 h-12 rounded-full object-cover flex-shrink-0"
            />

            {/* Info */}
            <div className="flex-1 min-w-0">
              <div className="flex items-center gap-2 mb-1">
                <h3 className="text-purple-900 font-medium text-sm truncate">
                  {user.nickname}
                </h3>
                <span className={`text-sm ${getGenderColor(user.gender)}`}>
                  {getGenderSymbol(user.gender)}
                </span>
              </div>
              {activeTab === "friends" && user.intimacy && (
                <div className="flex items-center gap-1.5">
                  <Heart className="w-3.5 h-3.5 text-pink-500 fill-pink-500" />
                  <span className="text-xs text-pink-500 font-medium">
                    亲密度 {user.intimacy}
                  </span>
                </div>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
