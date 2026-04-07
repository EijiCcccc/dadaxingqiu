import { useState } from "react";
import { Globe, MessageCircle, User } from "lucide-react";
import LightPlanetTab from "../../components/light/PlanetTab";
import LightMessageTab from "../../components/light/MessageTab";
import LightProfileTab from "../../components/light/ProfileTab";

export default function LightHome() {
  const [activeTab, setActiveTab] = useState<"planet" | "message" | "profile">("planet");

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white flex flex-col max-w-md mx-auto">
      {/* Content Area */}
      <div className="flex-1 overflow-y-auto pb-20">
        {activeTab === "planet" && <LightPlanetTab />}
        {activeTab === "message" && <LightMessageTab />}
        {activeTab === "profile" && <LightProfileTab />}
      </div>

      {/* Bottom Tab Bar */}
      <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-purple-100/80 backdrop-blur-lg border-t border-purple-200/50">
        <div className="flex items-center justify-around h-16 px-4">
          <button
            onClick={() => setActiveTab("planet")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "planet" ? "text-purple-600" : "text-gray-500"
            }`}
          >
            <Globe className="w-6 h-6" />
            <span className="text-xs">星球</span>
          </button>

          <button
            onClick={() => setActiveTab("message")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "message" ? "text-purple-600" : "text-gray-500"
            }`}
          >
            <MessageCircle className="w-6 h-6" />
            <span className="text-xs">消息</span>
          </button>

          <button
            onClick={() => setActiveTab("profile")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "profile" ? "text-purple-600" : "text-gray-500"
            }`}
          >
            <User className="w-6 h-6" />
            <span className="text-xs">我的</span>
          </button>
        </div>
      </div>
    </div>
  );
}