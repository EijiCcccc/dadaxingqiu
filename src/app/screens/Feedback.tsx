import { useState } from "react";
import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";
import { Button } from "../components/ui/button";

export default function Feedback() {
  const navigate = useNavigate();
  const [feedback, setFeedback] = useState("");
  const [contact, setContact] = useState("");

  const handleSubmit = () => {
    if (feedback.trim()) {
      // Submit feedback logic here
      alert("感谢您的反馈！");
      navigate(-1);
    }
  };

  return (
    <div className="min-h-screen bg-gray-950 max-w-md mx-auto">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-gray-950/80 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-800/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-white" />
          </button>
          <h1 className="text-lg font-semibold text-white">意见反馈</h1>
        </div>
      </div>

      <div className="px-6 py-6">
        {/* Feedback Input */}
        <div className="mb-6">
          <label className="block text-white text-base font-medium mb-3">
            您的反馈
          </label>
          <textarea
            value={feedback}
            onChange={(e) => setFeedback(e.target.value)}
            placeholder="请告诉我们您的意见或建议..."
            className="w-full h-40 bg-gray-900/60 border border-gray-800 rounded-2xl px-4 py-3 text-white placeholder:text-gray-500 text-base resize-none focus:outline-none focus:border-purple-500 focus:ring-2 focus:ring-purple-500/20"
          />
          <div className="text-right mt-2">
            <span
              className={`text-sm ${
                feedback.length > 500 ? "text-red-400" : "text-gray-500"
              }`}
            >
              {feedback.length}/500
            </span>
          </div>
        </div>

        {/* Contact Input */}
        <div className="mb-8">
          <label className="block text-white text-base font-medium mb-3">
            联系方式（选填）
          </label>
          <input
            type="text"
            value={contact}
            onChange={(e) => setContact(e.target.value)}
            placeholder="邮箱或手机号，以便我们回复您"
            className="w-full h-14 bg-gray-900/60 border border-gray-800 rounded-2xl px-4 text-white placeholder:text-gray-500 text-base focus:outline-none focus:border-purple-500 focus:ring-2 focus:ring-purple-500/20"
          />
        </div>

        {/* Submit Button */}
        <Button
          onClick={handleSubmit}
          disabled={!feedback.trim() || feedback.length > 500}
          className="w-full h-14 bg-gradient-to-r from-purple-600 to-blue-600 hover:from-purple-700 hover:to-blue-700 text-white rounded-full text-base font-medium shadow-lg shadow-purple-500/30 disabled:opacity-50 disabled:cursor-not-allowed"
        >
          提交反馈
        </Button>

        {/* Tips */}
        <div className="mt-6 bg-gray-900/40 border border-gray-800/50 rounded-2xl p-4">
          <h3 className="text-white text-sm font-medium mb-2">温馨提示</h3>
          <ul className="text-gray-400 text-xs space-y-1.5">
            <li>• 我们会认真查看每一条反馈</li>
            <li>• 留下联系方式可以获得问题处理进度通知</li>
            <li>• 请勿提交包含个人敏感信息的内容</li>
          </ul>
        </div>
      </div>
    </div>
  );
}
