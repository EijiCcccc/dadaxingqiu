import { useNavigate } from "react-router";
import { ArrowLeft } from "lucide-react";

export default function UserAgreement() {
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
          <h1 className="text-lg font-semibold text-white">用户协议</h1>
        </div>
      </div>

      <div className="px-6 py-6">
        <div className="prose prose-invert max-w-none">
          <div className="text-gray-300 space-y-6 text-sm leading-relaxed">
            <section>
              <h2 className="text-white text-lg font-semibold mb-3">
                欢迎使用搭搭星球
              </h2>
              <p className="text-gray-400">
                在使用搭搭星球服务之前，请您仔细阅读并充分理解本协议。您点击"同意"或使用搭搭星球服务，即表示您已阅读并同意接受本协议的全部内容。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">1. 服务说明</h3>
              <p className="text-gray-400">
                搭搭星球是一个面向年轻人的社交平台，旨在帮助用户寻找志同道合的伙伴。我们提供用户资料展示、消息交流等功能。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">2. 用户行为规范</h3>
              <p className="text-gray-400">
                用户在使用搭搭星球服务时，应遵守法律法规，不得发布违法、违规、不良信息。用户应对自己的行为负责，不得侵犯他人合法权益。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">3. 隐私保护</h3>
              <p className="text-gray-400">
                我们重视用户隐私保护，会采取合理措施保护用户个人信息安全。详细内容请参见《隐私政策》。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">4. 免责声明</h3>
              <p className="text-gray-400">
                搭搭星球仅作为社交平台，用户之间的交流行为由用户自行负责。我们不对用户之间的纠纷承担责任。
              </p>
            </section>

            <section>
              <h3 className="text-white font-semibold mb-2">5. 协议修改</h3>
              <p className="text-gray-400">
                我们有权根据需要修改本协议，修改后的协议将在应用内公布。继续使用服务即表示您接受修改后的协议。
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
