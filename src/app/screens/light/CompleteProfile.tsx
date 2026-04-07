import { useState } from "react";
import { useNavigate } from "react-router";
import { Camera, ArrowLeft } from "lucide-react";
import { Button } from "../../components/ui/button";
import { Input } from "../../components/ui/input";

export default function LightCompleteProfile() {
  const navigate = useNavigate();
  const [nickname, setNickname] = useState("");
  const [gender, setGender] = useState<"male" | "female" | null>(null);
  const [avatar, setAvatar] = useState<string | null>(null);

  const handleNext = () => {
    navigate("/light/select-tags");
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white max-w-md mx-auto pb-24">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-purple-200/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-purple-900" />
          </button>
          <h1 className="text-lg font-semibold text-purple-900">请完善个人资料</h1>
        </div>
      </div>

      <div className="px-6 py-8">
        {/* Avatar Selector */}
        <div className="flex flex-col items-center mb-10">
          <button className="w-28 h-28 rounded-full bg-white border-2 border-dashed border-purple-400 flex items-center justify-center hover:border-purple-500 transition-colors mb-3 shadow-lg shadow-purple-200">
            {avatar ? (
              <img src={avatar} alt="Avatar" className="w-full h-full rounded-full object-cover" />
            ) : (
              <Camera className="w-10 h-10 text-purple-500" />
            )}
          </button>
          <span className="text-sm text-purple-700">点击上传头像</span>
        </div>

        {/* Nickname Input */}
        <div className="mb-8">
          <label className="block text-purple-900 text-base font-medium mb-3">
            昵称
          </label>
          <Input
            type="text"
            placeholder="请输入昵称"
            value={nickname}
            onChange={(e) => setNickname(e.target.value)}
            className="h-14 bg-white border-purple-200 text-purple-900 placeholder:text-purple-400 rounded-xl text-base focus:border-purple-500 focus:ring-purple-500/20"
          />
        </div>

        {/* Gender Selection */}
        <div className="mb-8">
          <label className="block text-purple-900 text-base font-medium mb-3">
            性别
          </label>
          <div className="flex gap-4">
            <button
              onClick={() => setGender("male")}
              className={`flex-1 h-14 rounded-xl text-base font-medium transition-all ${
                gender === "male"
                  ? "bg-gradient-to-r from-blue-400 to-blue-500 text-white shadow-lg shadow-blue-400/30"
                  : "bg-white text-purple-700 border border-purple-200 hover:border-purple-300"
              }`}
            >
              男
            </button>
            <button
              onClick={() => setGender("female")}
              className={`flex-1 h-14 rounded-xl text-base font-medium transition-all ${
                gender === "female"
                  ? "bg-gradient-to-r from-pink-400 to-pink-500 text-white shadow-lg shadow-pink-400/30"
                  : "bg-white text-purple-700 border border-purple-200 hover:border-purple-300"
              }`}
            >
              女
            </button>
          </div>
        </div>

        {/* Next Button */}
        <Button
          onClick={handleNext}
          disabled={!nickname || !gender}
          className="w-full h-14 bg-gradient-to-r from-purple-400 to-pink-400 hover:from-purple-500 hover:to-pink-500 text-white rounded-full text-base font-medium shadow-lg shadow-purple-400/30 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          下一步
        </Button>
      </div>
    </div>
  );
}