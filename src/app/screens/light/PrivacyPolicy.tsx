import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";

export default function LightPrivacyPolicy() {
  const navigate = useNavigate();

  return (
    <div className="min-h-screen bg-gray-50 max-w-md mx-auto">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-white/80 backdrop-blur-lg border-b border-gray-200">
        <div className="flex items-center justify-center h-16 px-4 relative">
          <button
            onClick={() => navigate(-1)}
            className="absolute left-4 w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-gray-900" />
          </button>
          <h1 className="text-lg font-semibold text-gray-900">隐私政策</h1>
        </div>
      </div>

      <div className="px-6 py-6">
        <div className="prose max-w-none">
          <div className="text-gray-700 space-y-6 text-sm leading-relaxed">
            <section>
              <h2 className="text-gray-900 text-lg font-semibold mb-3">
                隐私政策
              </h2>
              <p className="text-gray-600">
                搭搭星球（以下简称"我们"）非常重视您的隐私保护。本隐私政策将帮助您了解我们如何收集、使用和保护您的个人信息。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">1. 信息收集</h3>
              <p className="text-gray-600">
                我们会收集您主动提供的信息，包括但不限于：昵称、性别、头像、个人标签等。这些信息用于创建您的个人资料，以便其他用户了解您。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">2. 信息使用</h3>
              <p className="text-gray-600">
                我们收集的信息将用于：提供和改进服务、展示个人资料、实现用户匹配、处理消息通信等功能。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">3. 信息保护</h3>
              <p className="text-gray-600">
                我们采取合理的技术和管理措施保护您的个人信息安全，防止信息泄露、滥用或未经授权访问。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">4. 信息共享</h3>
              <p className="text-gray-600">
                除法律法规要求外，我们不会向第三方分享您的个人信息。您的公开资料（如昵称、头像、标签）将对其他用户可见。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">5. 您的权利</h3>
              <p className="text-gray-600">
                您有权访问、修改、删除您的个人信息。如需行使这些权利，请通过应用内的相关功能操作或联系我们。
              </p>
            </section>

            <section>
              <h3 className="text-gray-900 font-semibold mb-2">6. 政策更新</h3>
              <p className="text-gray-600">
                我们可能会不时更新本隐私政策。更新后的政策将在应用内公布，继续使用服务即视为接受更新后的政策。
              </p>
            </section>

            <section className="pt-4 border-t border-gray-200">
              <p className="text-gray-500 text-xs">
                本隐私政策最后更新时间：2024年3月10日
              </p>
            </section>
          </div>
        </div>
      </div>
    </div>
  );
}
