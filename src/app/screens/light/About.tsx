import { useNavigate } from "react-router";
import { ArrowLeft, Sparkles } from "lucide-react";

export default function LightAbout() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gray-50 max-w-md mx-auto flex flex-col">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-white/80 backdrop-blur-lg border-b border-gray-200">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-gray-900" />
          </button>
          <h1 className="text-lg font-semibold text-gray-900">关于搭搭星球</h1>
        </div>
      </div>

      <div className="flex-1 flex flex-col items-center justify-center px-4 py-8">
        {/* Logo - Same as Login page */}
        <div className="mb-6 relative">
          <div className="w-24 h-24 bg-gradient-to-br from-purple-500 via-pink-500 to-blue-500 rounded-full flex items-center justify-center shadow-2xl shadow-purple-500/50">
            <Sparkles className="w-12 h-12 text-white" />
          </div>
          <div className="absolute -top-2 -right-2 w-8 h-8 bg-gradient-to-br from-yellow-400 to-orange-500 rounded-full shadow-lg shadow-yellow-400/50"></div>
          <div className="absolute -bottom-1 -left-1 w-5 h-5 bg-gradient-to-br from-blue-400 to-cyan-500 rounded-full shadow-lg shadow-blue-400/50"></div>
        </div>

        {/* App Name */}
        <h2 className="text-gray-900 text-2xl font-bold mb-2">搭搭星球</h2>

        {/* Version */}
        <p className="text-gray-600 text-sm mb-8">版本号：1.0.0</p>

        {/* Copyright */}
        <p className="text-gray-500 text-xs mt-16">
          © 2024 搭搭星球 All Rights Reserved
        </p>

        {/* Links - Single row */}
        <div className="flex items-center gap-2 text-xs text-gray-500 mt-4">
          <button
            onClick={() => navigate("/light/user-agreement")}
            className="text-purple-600 hover:text-purple-700 transition-colors"
          >
            用户协议
          </button>
          <span>·</span>
          <button
            onClick={() => navigate("/light/privacy-policy")}
            className="text-purple-600 hover:text-purple-700 transition-colors"
          >
            隐私政策
          </button>
        </div>
      </div>
    </div>
  );
}
