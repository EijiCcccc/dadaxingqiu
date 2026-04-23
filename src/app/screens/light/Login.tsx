import { useNavigate } from "react-router";
import { Sparkles } from "lucide-react";
import { Button } from "../../components/ui/button";
import { AppIcon } from "../../components/AppIcon";

export default function LightLogin() {
  const navigate = useNavigate();

  const handleLogin = () => {
    navigate("/light/complete-profile");
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white flex flex-col items-center justify-center px-6">
      {/* Space background effect */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-20 left-10 w-2 h-2 bg-purple-400 rounded-full animate-pulse"></div>
        <div className="absolute top-40 right-20 w-1 h-1 bg-pink-400 rounded-full animate-pulse delay-75"></div>
        <div className="absolute top-60 left-1/4 w-1.5 h-1.5 bg-purple-300 rounded-full animate-pulse delay-150"></div>
        <div className="absolute bottom-40 right-1/3 w-1 h-1 bg-pink-300 rounded-full animate-pulse"></div>
        <div className="absolute bottom-60 left-1/2 w-2 h-2 bg-purple-400 rounded-full animate-pulse delay-100"></div>
      </div>

      <div className="relative z-10 flex flex-col items-center">
        {/* Logo */}
        <div className="mb-8 relative">
          <div className="w-32 h-32 rounded-3xl overflow-hidden shadow-2xl shadow-purple-400/50">
            <AppIcon />
          </div>
        </div>

        {/* App Name */}
        <h1 className="text-4xl font-bold text-purple-900 mb-2 tracking-wide">嗒伴</h1>
        <p className="text-purple-700 mb-16 text-sm">找到你的星际搭子</p>

        {/* Login Buttons */}
        <div className="w-full max-w-sm space-y-4">
          <Button
            onClick={handleLogin}
            className="w-full h-14 bg-white hover:bg-gray-50 text-purple-900 rounded-full text-base font-medium shadow-lg border border-purple-200"
          >
            <svg className="w-6 h-6 mr-2" viewBox="0 0 24 24" fill="currentColor">
              <path d="M8.691 2.188C3.891 2.188 0 5.476 0 9.53c0 2.212 1.17 4.203 3.002 5.55a.59.59 0 0 1 .213.665l-.39 1.48c-.019.07-.048.141-.048.213 0 .163.13.295.29.295a.326.326 0 0 0 .167-.054l1.903-1.114a.864.864 0 0 1 .717-.098 10.16 10.16 0 0 0 2.837.403c.276 0 .543-.027.811-.05-.857-2.578.157-4.972 1.932-6.446 1.703-1.415 3.882-1.98 5.853-1.838-.576-3.583-4.196-6.348-8.596-6.348zM5.785 5.991c.642 0 1.162.529 1.162 1.18a1.17 1.17 0 0 1-1.162 1.178A1.17 1.17 0 0 1 4.623 7.17c0-.651.52-1.18 1.162-1.18zm5.813 0c.642 0 1.162.529 1.162 1.18a1.17 1.17 0 0 1-1.162 1.178 1.17 1.17 0 0 1-1.162-1.178c0-.651.52-1.18 1.162-1.18zm5.34 2.867c-1.797-.052-3.746.512-5.28 1.786-1.72 1.428-2.687 3.72-1.78 6.22.942 2.453 3.666 4.229 6.884 4.229.826 0 1.622-.12 2.361-.336a.722.722 0 0 1 .598.082l1.584.926a.272.272 0 0 0 .14.047c.134 0 .24-.111.24-.247 0-.06-.023-.12-.038-.177l-.327-1.233a.582.582 0 0 1 .178-.555c1.529-1.119 2.498-2.764 2.498-4.543-.001-3.81-3.455-7.007-7.058-7.199zm-2.602 4.528c.54 0 .97.44.97.987 0 .545-.43.985-.97.985a.976.976 0 0 1-.97-.985c0-.546.43-.987.97-.987zm4.949 0c.54 0 .97.44.97.987 0 .545-.43.985-.97.985a.976.976 0 0 1-.97-.985c0-.546.43-.987.97-.987z"/>
            </svg>
            微信登录
          </Button>

          <Button
            onClick={handleLogin}
            className="w-full h-14 bg-purple-500 hover:bg-purple-600 text-white rounded-full text-base font-medium shadow-lg shadow-purple-400/30"
          >
            <svg className="w-6 h-6 mr-2" viewBox="0 0 24 24" fill="currentColor">
              <path d="M17.05 20.28c-.98.95-2.05.8-3.08.35-1.09-.46-2.09-.48-3.24 0-1.44.62-2.2.44-3.06-.35C2.79 15.25 3.51 7.59 9.05 7.31c1.35.07 2.29.74 3.08.8 1.18-.24 2.31-.93 3.57-.84 1.51.12 2.65.72 3.4 1.8-3.12 1.87-2.38 5.98.48 7.13-.57 1.5-1.31 2.99-2.54 4.09l.01-.01zM12.03 7.25c-.15-2.23 1.66-4.07 3.74-4.25.29 2.58-2.34 4.5-3.74 4.25z"/>
            </svg>
            Apple 登录
          </Button>
        </div>

        {/* Terms and Privacy */}
        <div className="mt-12 flex items-center gap-1 text-purple-700">
          <span className="text-xs">登录即同意</span>
          <button className="text-xs text-purple-800 hover:text-purple-900 transition-colors">《用户协议》</button>
          <span className="text-xs">、</span>
          <button className="text-xs text-purple-800 hover:text-purple-900 transition-colors">《隐私政策》</button>
        </div>
      </div>
    </div>
  );
}