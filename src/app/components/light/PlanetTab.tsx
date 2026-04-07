import Masonry, { ResponsiveMasonry } from "react-responsive-masonry";
import LightUserCard from "./UserCard";

const mockUsers = [
  {
    id: 1,
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop",
    nickname: "星辰漫步",
    gender: "female" as const,
    tags: ["找聊天搭子", "游戏", "夜猫子"],
  },
  {
    id: 2,
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop",
    nickname: "宇宙旅行者",
    gender: "male" as const,
    tags: ["电影", "音乐", "美食"],
  },
  {
    id: 3,
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=200&h=200&fit=crop",
    nickname: "月光女神",
    gender: "female" as const,
    tags: ["读书", "咖啡", "旅行", "摄影"],
  },
  {
    id: 4,
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=200&h=200&fit=crop",
    nickname: "星际探险",
    gender: "male" as const,
    tags: ["运动", "健身"],
  },
  {
    id: 5,
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200&h=200&fit=crop",
    nickname: "流星雨",
    gender: "female" as const,
    tags: ["动漫", "二次元", "cosplay", "绘画"],
  },
  {
    id: 6,
    avatar: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=200&h=200&fit=crop",
    nickname: "银河系长",
    gender: "male" as const,
    tags: ["编程", "科技", "游戏"],
  },
  {
    id: 7,
    avatar: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200&h=200&fit=crop",
    nickname: "彗星少女",
    gender: "female" as const,
    tags: ["唱歌", "跳舞", "美妆"],
  },
  {
    id: 8,
    avatar: "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?w=200&h=200&fit=crop",
    nickname: "行星猎人",
    gender: "male" as const,
    tags: ["摄影", "旅行", "户外", "露营"],
  },
  {
    id: 9,
    avatar: "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200&h=200&fit=crop",
    nickname: "星云梦境",
    gender: "female" as const,
    tags: ["瑜伽", "冥想", "养生"],
  },
  {
    id: 10,
    avatar: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=200&h=200&fit=crop",
    nickname: "黑洞探索",
    gender: "male" as const,
    tags: ["篮球", "足球", "电竞"],
  },
];

export default function LightPlanetTab() {
  return (
    <div>
      {/* Header */}
      <div className="sticky top-0 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50 px-4 py-4 mb-4">
        <h1 className="text-xl font-bold text-purple-900 mb-1">探索星球</h1>
        <p className="text-purple-700 text-sm">发现志同道合的星际搭子</p>
      </div>

      {/* Masonry Grid */}
      <div className="px-4">
        <ResponsiveMasonry columnsCountBreakPoints={{ 350: 2, 750: 2 }}>
          <Masonry gutter="16px">
            {mockUsers.map((user) => (
              <LightUserCard key={user.id} user={user} />
            ))}
          </Masonry>
        </ResponsiveMasonry>
      </div>
    </div>
  );
}