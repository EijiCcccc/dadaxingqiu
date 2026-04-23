import { useState } from "react";
import { Globe, MessageCircle, User, Grid2x2 } from "lucide-react";
import PlanetTab from "../components/PlanetTab";
import MessageTab from "../components/MessageTab";
import ProfileTab from "../components/ProfileTab";
import FeedTab from "../components/FeedTab";

export default function Home() {
  const [activeTab, setActiveTab] = useState<"planet" | "message" | "feed" | "profile">("planet");

  return (
    <div className="min-h-screen bg-[#1a1a1a] flex flex-col max-w-md mx-auto">
      {/* Content Area */}
      <div className="flex-1 overflow-y-auto pb-20">
        {activeTab === "planet" && <PlanetTab />}
        {activeTab === "feed" && <FeedTab />}
        {activeTab === "message" && <MessageTab />}
        {activeTab === "profile" && <ProfileTab />}
      </div>

      {/* Bottom Tab Bar */}
      <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-[#252525]/95 backdrop-blur-lg border-t border-gray-800/50">
        <div className="flex items-center justify-around h-16 px-4">
          <button
            onClick={() => setActiveTab("planet")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "planet" ? "text-purple-500" : "text-gray-500"
            }`}
          >
            <Globe className="w-6 h-6" />
            <span className="text-xs">星球</span>
          </button>

          <button
            onClick={() => setActiveTab("feed")}
            className={`relative flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "feed" ? "text-purple-500" : "text-gray-500"
            }`}
          >
            <div className="relative">
              <Grid2x2 className="w-6 h-6" />
              {/* Red Dot */}
              <span className="absolute -top-1 -right-1 w-2 h-2 bg-red-500 rounded-full"></span>
            </div>
            <span className="text-xs">广场</span>
          </button>

          <button
            onClick={() => setActiveTab("message")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "message" ? "text-purple-500" : "text-gray-500"
            }`}
          >
            <MessageCircle className="w-6 h-6" />
            <span className="text-xs">消息</span>
          </button>

          <button
            onClick={() => setActiveTab("profile")}
            className={`flex flex-col items-center justify-center flex-1 gap-1 transition-colors ${
              activeTab === "profile" ? "text-purple-500" : "text-gray-500"
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