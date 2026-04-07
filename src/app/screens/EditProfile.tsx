import { useState } from "react";
import { useNavigate } from "react-router";
import { Camera, ArrowLeft, Mars, Venus } from "lucide-react";
import { Button } from "../components/ui/button";
import { Input } from "../components/ui/input";

export default function EditProfile() {
  const navigate = useNavigate();
  const [nickname, setNickname] = useState("星标旅人");
  const [gender, setGender] = useState<"male" | "female">("male");
  const [selectedTags, setSelectedTags] = useState<string[]>([
    "游戏",
    "音乐",
    "旅行",
  ]);

  const handleSave = () => {
    // Save logic here
    navigate(-1);
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
          <h1 className="text-lg font-semibold text-white">编辑个人资料</h1>
        </div>
      </div>

      <div className="px-6 py-8">
        {/* Avatar Selector */}
        <div className="flex flex-col items-center mb-10">
          <button className="w-28 h-28 rounded-full bg-[#252525] border-2 border-dashed border-purple-500/50 flex items-center justify-center hover:border-purple-500 transition-colors mb-3 relative overflow-hidden shadow-lg shadow-purple-500/20">
            <img
              src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop"
              alt="Profile"
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 hover:opacity-100 transition-opacity">
              <Camera className="w-10 h-10 text-white" />
            </div>
          </button>
          <span className="text-sm text-gray-400">点击替换头像</span>
        </div>

        {/* Nickname Input */}
        <div className="mb-8">
          <label className="block text-white text-base font-medium mb-3">
            昵称
          </label>
          <Input
            type="text"
            placeholder="当前昵称"
            value={nickname}
            onChange={(e) => setNickname(e.target.value)}
            className="h-14 bg-[#252525] border-gray-700/50 text-white placeholder:text-gray-500 rounded-xl text-base focus:border-purple-500 focus:ring-purple-500/20"
          />
        </div>

        {/* Gender Selection */}
        <div className="mb-8">
          <label className="block text-white text-base font-medium mb-3">
            性别
          </label>
          <div className="flex gap-4">
            <button
              onClick={() => setGender("male")}
              className={`flex-1 h-14 rounded-xl text-base font-medium transition-all flex items-center justify-center gap-2 ${
                gender === "male"
                  ? "bg-white text-blue-500 border-2 border-blue-500"
                  : "bg-[#252525] text-gray-400 border border-gray-700/50 hover:border-gray-600"
              }`}
            >
              <Mars className="w-5 h-5" />
              <span>男</span>
            </button>
            <button
              onClick={() => setGender("female")}
              className={`flex-1 h-14 rounded-xl text-base font-medium transition-all flex items-center justify-center gap-2 ${
                gender === "female"
                  ? "bg-white text-pink-500 border-2 border-pink-500"
                  : "bg-[#252525] text-gray-400 border border-gray-700/50 hover:border-gray-600"
              }`}
            >
              <Venus className="w-5 h-5" />
              <span>女</span>
            </button>
          </div>
        </div>

        {/* Personal Tags Section */}
        <div className="mb-8">
          <div className="flex items-center justify-between mb-3">
            <label className="block text-white text-base font-medium">
              个人标签
            </label>
            <button
              onClick={() => navigate("/dark/edit-tags")}
              className="text-purple-400 text-sm font-medium hover:text-purple-300 transition-colors"
            >
              修改
            </button>
          </div>
          <div className="bg-gradient-to-br from-[#2a2a2a] to-[#252525] border border-gray-800/50 rounded-xl p-4 min-h-[120px] shadow-lg">
            <div className="flex flex-wrap gap-2">
              {selectedTags.map((tag, index) => (
                <span
                  key={index}
                  className="px-4 py-2 bg-purple-500/20 text-purple-300 text-sm rounded-full border border-purple-500/30"
                >
                  {tag}
                </span>
              ))}
            </div>
          </div>
        </div>

        {/* Save Button */}
        <Button
          onClick={handleSave}
          className="w-full h-14 bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600 text-white rounded-full text-base font-medium shadow-lg shadow-purple-400/30"
        >
          保存
        </Button>
      </div>
    </div>
  );
}