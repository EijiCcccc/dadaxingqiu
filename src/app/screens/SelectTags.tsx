import { useState } from "react";
import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";
import { Button } from "../components/ui/button";

const tagGroups = [
  {
    title: "A类型标签",
    tags: [
      "找聊天搭子",
      "找游戏搭子",
      "找运动搭子",
      "找学习搭子",
      "找饭搭子",
      "找旅行搭子",
    ],
  },
  {
    title: "B类型标签",
    tags: [
      "电影",
      "音乐",
      "游戏",
      "动漫",
      "读书",
      "美食",
      "旅行",
      "摄影",
      "运动",
      "健身",
    ],
  },
  {
    title: "C类型标签",
    tags: [
      "夜猫子",
      "早起鸟",
      "社交达人",
      "i人",
      "e人",
      "咖啡爱好者",
      "猫奴",
      "狗奴",
      "宅家",
      "户外",
    ],
  },
];

export default function SelectTags() {
  const navigate = useNavigate();
  const [selectedTags, setSelectedTags] = useState<string[]>([]);

  const toggleTag = (tag: string) => {
    if (selectedTags.includes(tag)) {
      setSelectedTags(selectedTags.filter((t) => t !== tag));
    } else {
      setSelectedTags([...selectedTags, tag]);
    }
  };

  const handleEnter = () => {
    navigate("/dark/home");
  };

  return (
    <div className="min-h-screen bg-[#1a1a1a] max-w-md mx-auto pb-24">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-[#252525]/80 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-700/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-white" />
          </button>
          <h1 className="text-lg font-semibold text-white">请选择个人标签</h1>
        </div>
      </div>

      <div className="px-6 py-8">
        {/* Tag Groups */}
        <div className="space-y-8">
          {tagGroups.map((group, groupIndex) => (
            <div key={groupIndex}>
              <h2 className="text-white text-base font-medium mb-4">
                {group.title}
              </h2>
              <div className="flex flex-wrap gap-3">
                {group.tags.map((tag, tagIndex) => (
                  <button
                    key={tagIndex}
                    onClick={() => toggleTag(tag)}
                    className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all ${
                      selectedTags.includes(tag)
                        ? "bg-gradient-to-r from-purple-500 to-pink-500 text-white shadow-lg shadow-purple-400/30"
                        : "bg-[#252525] text-gray-400 border border-gray-700/50 hover:border-gray-600"
                    }`}
                  >
                    {tag}
                  </button>
                ))}
              </div>
            </div>
          ))}
        </div>

        {/* Bottom Button */}
        <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-gradient-to-t from-[#1a1a1a] via-[#1a1a1a] to-transparent p-6 pt-8">
          <Button
            onClick={handleEnter}
            disabled={selectedTags.length === 0}
            className="w-full h-14 bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600 text-white rounded-full text-base font-medium shadow-lg shadow-purple-400/30 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            进入搭搭星球
          </Button>
        </div>
      </div>
    </div>
  );
}