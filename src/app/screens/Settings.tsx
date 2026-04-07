import { useNavigate } from "react-router";
import { ArrowLeft, ChevronRight } from "lucide-react";
import { Button } from "../components/ui/button";
import { Switch } from "../components/ui/switch";
import { useState } from "react";

export default function Settings() {
  const navigate = useNavigate();
  const [showLogoutDialog, setShowLogoutDialog] = useState(false);
  const [isLightTheme, setIsLightTheme] = useState(false);

  const handleThemeToggle = (checked: boolean) => {
    setIsLightTheme(checked);
    if (checked) {
      // Switch to light theme
      navigate("/light/home");
    } else {
      // Already in dark theme, do nothing
    }
  };

  const handleLogout = () => {
    // Logout logic here
    navigate("/");
  };

  const menuItems = [
    { title: "隐私政策", path: "/dark/privacy-policy" },
    { title: "用户协议", path: "/dark/user-agreement" },
    { title: "意见反馈", path: "/dark/feedback" },
    { title: "关于搭搭星球", path: "/dark/about" },
  ];

  return (
    <div className="min-h-screen bg-gray-950 max-w-md mx-auto pb-24">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-gray-950/80 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-800/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-white" />
          </button>
          <h1 className="text-lg font-semibold text-white">设置</h1>
        </div>
      </div>

      <div className="px-4 py-6 space-y-4">
        {/* Theme Switch */}
        <div className="bg-gray-900/60 backdrop-blur-sm rounded-2xl border border-gray-800/50">
          <div className="flex items-center justify-between px-4 py-4">
            <span className="text-white font-medium">亮色主题</span>
            <Switch
              checked={isLightTheme}
              onCheckedChange={handleThemeToggle}
            />
          </div>
        </div>

        {/* Menu Items */}
        <div className="bg-gray-900/60 backdrop-blur-sm rounded-2xl border border-gray-800/50 overflow-hidden divide-y divide-gray-800/50">
          {menuItems.map((item, index) => (
            <button
              key={index}
              onClick={() => navigate(item.path)}
              className="w-full flex items-center justify-between px-4 py-4 hover:bg-gray-800/30 transition-colors"
            >
              <span className="text-white font-medium">{item.title}</span>
              <ChevronRight className="w-5 h-5 text-gray-500" />
            </button>
          ))}
        </div>
      </div>

      {/* Logout Button - Fixed at bottom */}
      <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-gradient-to-t from-gray-950 via-gray-950 to-transparent p-6 pt-8">
        <Button
          onClick={() => setShowLogoutDialog(true)}
          className="w-full h-14 bg-gray-900/60 hover:bg-gray-800/60 text-white rounded-2xl text-base font-medium border border-gray-800/50"
        >
          退出登录
        </Button>
      </div>

      {/* Logout Confirmation Dialog */}
      {showLogoutDialog && (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm flex items-center justify-center z-50 px-4">
          <div className="bg-gray-900 rounded-2xl p-6 w-full max-w-xs border border-gray-800">
            <h3 className="text-white text-lg font-semibold text-center mb-6">
              确认退出
            </h3>
            <p className="text-gray-400 text-center mb-8">
              确认要退出当前账号？
            </p>
            <div className="space-y-3">
              <Button
                onClick={handleLogout}
                className="w-full h-12 bg-gradient-to-r from-purple-600 to-blue-600 hover:from-purple-700 hover:to-blue-700 text-white rounded-xl text-base font-medium"
              >
                确定
              </Button>
              <Button
                onClick={() => setShowLogoutDialog(false)}
                className="w-full h-12 bg-gray-800 hover:bg-gray-750 text-white rounded-xl text-base font-medium"
              >
                取消
              </Button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}