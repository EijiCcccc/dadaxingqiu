import { useState } from "react";
import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";
import { Button } from "../../components/ui/button";

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

export default function LightEditTags() {
  const navigate = useNavigate();
  const [selectedTags, setSelectedTags] = useState<string[]>([
    "游戏",
    "音乐",
    "旅行",
  ]);

  const toggleTag = (tag: string) => {
    if (selectedTags.includes(tag)) {
      setSelectedTags(selectedTags.filter((t) => t !== tag));
    } else {
      setSelectedTags([...selectedTags, tag]);
    }
  };

  const handleConfirm = () => {
    navigate(-1);
  };

  return (
    <div className="min-h-screen bg-gray-50 max-w-md mx-auto pb-24">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-white/80 backdrop-blur-lg border-b border-gray-200">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-gray-900" />
          </button>
          <h1 className="text-lg font-semibold text-gray-900">编辑个人标签</h1>
        </div>
      </div>

      <div className="px-6 py-8">
        {/* Tag Groups */}
        <div className="space-y-8">
          {tagGroups.map((group, groupIndex) => (
            <div key={groupIndex}>
              <h2 className="text-gray-900 text-base font-medium mb-4">
                {group.title}
              </h2>
              <div className="flex flex-wrap gap-3">
                {group.tags.map((tag, tagIndex) => (
                  <button
                    key={tagIndex}
                    onClick={() => toggleTag(tag)}
                    className={`px-5 py-2.5 rounded-full text-sm font-medium transition-all ${
                      selectedTags.includes(tag)
                        ? "bg-gradient-to-r from-purple-600 to-blue-600 text-white shadow-lg shadow-purple-500/30"
                        : "bg-white text-gray-600 border border-gray-200 hover:border-gray-300"
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
        <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-gradient-to-t from-gray-50 via-gray-50 to-transparent p-6 pt-8">
          <Button
            onClick={handleConfirm}
            disabled={selectedTags.length === 0}
            className="w-full h-14 bg-gradient-to-r from-purple-600 to-blue-600 hover:from-purple-700 hover:to-blue-700 text-white rounded-full text-base font-medium shadow-lg shadow-purple-500/30 disabled:opacity-50 disabled:cursor-not-allowed"
          >
            确认
          </Button>
        </div>
      </div>
    </div>
  );
}
