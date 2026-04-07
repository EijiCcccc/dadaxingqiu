import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";

export default function PrivacyPolicy() {
  const navigate = useNavigate();

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
          <h1 className="text-lg font-semibold text-white">隐私政策</h1>
        </div>
      </div>

      <div className="px-6 py-6">
        <div className="prose prose-invert max-w-none">
          <div className="text-gray-300 space-y-6 text-sm leading-relaxed">
            <section>
              <h2 className="text-white text-lg font-semibold mb-3">
                搭搭星球隐私政策
              </h2>
              <p className="text-gray-400">
                搭搭星球（以下简称"我们"）非常重视用户的隐私保护。本隐私政策将向您说明我们如何收集、使用、存储和保护您的个人信息。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">
                1. 我们收集的信息
              </h3>
              <p className="text-gray-400 mb-2">我们可能收集以下信息：</p>
              <ul className="text-gray-400 list-disc list-inside space-y-1 ml-2">
                <li>账号信息：昵称、头像、性别等基本资料</li>
                <li>个人标签：您选择的兴趣标签</li>
                <li>使用信息：浏览记录、消息记录等</li>
                <li>设备信息：设备型号、操作系统版本等</li>
              </ul>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">
                2. 信息使用目的
              </h3>
              <p className="text-gray-400">我们使用收集的信息用于：</p>
              <ul className="text-gray-400 list-disc list-inside space-y-1 ml-2">
                <li>为您提供和改进服务</li>
                <li>推荐合适的社交伙伴</li>
                <li>保障平台安全和防范风险</li>
                <li>遵守法律法规要求</li>
              </ul>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">3. 信息共享</h3>
              <p className="text-gray-400">
                我们不会向第三方出售或出租您的个人信息。仅在以下情况下，我们可能共享您的信息：
              </p>
              <ul className="text-gray-400 list-disc list-inside space-y-1 ml-2">
                <li>获得您的明确同意</li>
                <li>遵守法律法规或监管要求</li>
                <li>与服务提供商合作提供服务</li>
              </ul>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">4. 信息安全</h3>
              <p className="text-gray-400">
                我们采用业界标准的安全措施保护您的个人信息，包括数据加密、访问控制等技术手段。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">5. 您的权利</h3>
              <p className="text-gray-400">您有权：</p>
              <ul className="text-gray-400 list-disc list-inside space-y-1 ml-2">
                <li>访问、更正、删除您的个人信息</li>
                <li>撤回对个人信息处理的同意</li>
                <li>注销账号</li>
              </ul>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">6. 联系我们</h3>
              <p className="text-gray-400">
                如您对本隐私政策有任何疑问，请通过应用内的意见反馈功能联系我们。
              </p>
            </section>

            <div className="text-gray-500 text-xs mt-8 pt-6 border-t border-gray-800">
              最后更新时间：2024年3月10日
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
