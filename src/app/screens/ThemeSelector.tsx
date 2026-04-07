import { useNavigate } from "react-router";
import { Sun, Moon, Sparkles } from "lucide-react";
import { Button } from "../components/ui/button";

export default function ThemeSelector() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-100 via-pink-100 to-blue-100 flex flex-col items-center justify-center px-6">
      {/* Logo */}
      <div className="mb-12 relative">
        <div className="w-32 h-32 bg-gradient-to-br from-purple-500 via-pink-500 to-blue-500 rounded-full flex items-center justify-center shadow-2xl shadow-purple-500/50 animate-pulse">
          <Sparkles className="w-16 h-16 text-white" />
        </div>
        <div className="absolute -top-3 -right-3 w-10 h-10 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full shadow-lg shadow-yellow-400/50"></div>
        <div className="absolute -bottom-2 -left-2 w-6 h-6 bg-gradient-to-br from-blue-400 to-cyan-500 rounded-full shadow-lg shadow-blue-400/50"></div>
      </div>

      {/* App Name */}
      <h1 className="text-5xl font-bold bg-gradient-to-r from-purple-600 via-pink-600 to-blue-600 bg-clip-text text-transparent mb-3 tracking-wide">
        搭搭星球
      </h1>
      <p className="text-gray-600 mb-16 text-base">选择你喜欢的主题</p>

      {/* Theme Selection */}
      <div className="w-full max-w-sm space-y-4">
        <Button
          onClick={() => navigate("/login")}
          className="w-full h-16 bg-gradient-to-r from-gray-900 to-gray-800 hover:from-gray-800 hover:to-gray-700 text-white rounded-2xl text-lg font-medium shadow-2xl shadow-gray-900/50 transition-all hover:scale-105"
        >
          <Moon className="w-6 h-6 mr-3" />
          深色主题
        </Button>

        <Button
          onClick={() => navigate("/light/login")}
          className="w-full h-16 bg-gradient-to-r from-white to-gray-50 hover:from-gray-50 hover:to-gray-100 text-gray-900 rounded-2xl text-lg font-medium shadow-2xl shadow-gray-300/50 border-2 border-gray-200 transition-all hover:scale-105"
        >
          <Sun className="w-6 h-6 mr-3" />
          亮色主题
        </Button>
      </div>

      {/* Footer */}
      <div className="mt-16 text-center">
        <p className="text-gray-500 text-xs">
          © 2024 搭搭星球 All Rights Reserved
        </p>
      </div>
    </div>
  );
}