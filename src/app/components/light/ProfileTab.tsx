import { ChevronRight, Settings, Edit3 } from "lucide-react";
import { useNavigate } from "react-router";

export default function LightProfileTab() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen">
      {/* Header */}
      <div className="sticky top-0 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50 px-4 py-4 mb-4">
        <h1 className="text-xl font-bold text-purple-900">我的</h1>
      </div>

      {/* Profile Card */}
      <div className="px-4 mb-4">
        <div className="bg-white/60 backdrop-blur-md rounded-2xl p-5 border border-purple-200/50 shadow-sm">
          <div className="flex items-start gap-4">
            {/* Avatar */}
            <div className="relative flex-shrink-0">
              <img
                src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&h=200&fit=crop"
                alt="Profile"
                className="w-20 h-20 rounded-full object-cover border-2 border-purple-400"
              />
              <div className="absolute -bottom-1 -right-1 w-5 h-5 bg-gradient-to-br from-green-400 to-emerald-500 rounded-full border-2 border-white"></div>
            </div>

            {/* Info */}
            <div className="flex-1 flex flex-col justify-between h-20">
              <div>
                <h2 className="text-gray-900 text-xl font-bold mb-1">星标旅人</h2>
                <div className="flex items-center gap-1.5">
                  <span className="text-blue-500 text-sm">♂</span>
                  <span className="text-blue-500 text-sm">男</span>
                </div>
              </div>
              {/* Tags */}
              <div className="flex flex-wrap gap-2">
                <span className="px-3 py-1 bg-purple-50 text-purple-600 text-xs rounded-full border border-purple-200/50">
                  游戏
                </span>
                <span className="px-3 py-1 bg-purple-50 text-purple-600 text-xs rounded-full border border-purple-200/50">
                  音乐
                </span>
                <span className="px-3 py-1 bg-purple-50 text-purple-600 text-xs rounded-full border border-purple-200/50">
                  旅行
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Menu Items */}
      <div className="px-4">
        <div className="bg-white/60 backdrop-blur-md rounded-2xl border border-purple-200/50 shadow-sm overflow-hidden divide-y divide-purple-100/50">
          <button
            onClick={() => navigate("/light/edit-profile")}
            className="w-full flex items-center justify-between px-4 py-4 hover:bg-white/80 transition-colors"
          >
            <div className="flex items-center gap-3">
              <div className="w-9 h-9 bg-purple-50 rounded-lg flex items-center justify-center">
                <Edit3 className="w-4.5 h-4.5 text-purple-600" />
              </div>
              <span className="text-gray-900 font-medium">编辑资料</span>
            </div>
            <ChevronRight className="w-5 h-5 text-gray-400" />
          </button>

          <button
            onClick={() => navigate("/light/settings")}
            className="w-full flex items-center justify-between px-4 py-4 hover:bg-white/80 transition-colors"
          >
            <div className="flex items-center gap-3">
              <div className="w-9 h-9 bg-purple-50 rounded-lg flex items-center justify-center">
                <Settings className="w-4.5 h-4.5 text-purple-600" />
              </div>
              <span className="text-gray-900 font-medium">设置</span>
            </div>
            <ChevronRight className="w-5 h-5 text-gray-400" />
          </button>
        </div>
      </div>
    </div>
  );
}