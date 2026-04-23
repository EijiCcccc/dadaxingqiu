import { useState } from "react";
import { useNavigate } from "react-router";
import { ArrowLeft, Plus, X, Check } from "lucide-react";
import { Sheet, SheetContent, SheetTrigger, SheetTitle, SheetDescription } from "../../components/ui/sheet";

type Visibility = "all" | "friends" | "square" | "private";

const visibilityOptions: { value: Visibility; label: string }[] = [
  { value: "all", label: "所有人可见" },
  { value: "friends", label: "仅好友可见" },
  { value: "square", label: "仅广场可见（好友不可见）" },
  { value: "private", label: "仅自己可见" },
];

export default function LightCreateFeed() {
  const navigate = useNavigate();
  const [content, setContent] = useState("");
  const [images, setImages] = useState<string[]>([]);
  const [visibility, setVisibility] = useState<Visibility>("all");
  const [showVisibilityMenu, setShowVisibilityMenu] = useState(false);
  const [showExitDialog, setShowExitDialog] = useState(false);

  const maxLength = 500;
  const maxImages = 9;

  const handleAddImage = () => {
    if (images.length >= maxImages) return;
    // 模拟图片上传
    const mockImage = `https://images.unsplash.com/photo-${Date.now()}?w=400&h=400&fit=crop`;
    setImages([...images, mockImage]);
  };

  const handleRemoveImage = (index: number) => {
    setImages(images.filter((_, i) => i !== index));
  };

  const handlePublish = () => {
    console.log("发布动态", { content, images, visibility });
    navigate(-1);
  };

  const handleBack = () => {
    if (content.trim() || images.length > 0) {
      setShowExitDialog(true);
    } else {
      navigate(-1);
    }
  };

  const canPublish = content.trim().length > 0 || images.length > 0;

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col max-w-md mx-auto">
      {/* Header */}
      <div className="sticky top-0 z-10 bg-white border-b border-gray-200">
        <div className="flex items-center justify-between px-4 h-14">
          <button
            onClick={handleBack}
            className="p-2 -ml-2 text-gray-900 hover:bg-purple-100/50 rounded-full transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <h1 className="text-lg font-medium text-gray-900">编辑动态</h1>
          <button
            onClick={handlePublish}
            disabled={!canPublish}
            className={`px-4 py-1.5 rounded-full text-sm font-medium transition-colors ${
              canPublish
                ? "bg-purple-600 hover:bg-purple-700 text-white"
                : "bg-gray-200 text-gray-400 cursor-not-allowed"
            }`}
          >
            发布
          </button>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 p-4 bg-white">
        {/* Text Input */}
        <div className="mb-6">
          <textarea
            value={content}
            onChange={(e) => {
              if (e.target.value.length <= maxLength) {
                setContent(e.target.value);
              }
            }}
            placeholder="分享今天的新鲜事吧~"
            className="w-full bg-transparent text-gray-900 text-base placeholder:text-gray-400 outline-none resize-none min-h-[140px]"
          />
          <div className="text-right text-xs text-gray-500 mt-1">
            {content.length}/{maxLength}
          </div>
        </div>

        {/* Image Grid */}
        <div className="mb-6">
          <div className="grid grid-cols-3 gap-3">
            {images.map((img, index) => (
              <div key={index} className="relative aspect-square">
                <img
                  src={img}
                  alt={`Upload ${index + 1}`}
                  className="w-full h-full object-cover rounded-lg"
                />
                <button
                  onClick={() => handleRemoveImage(index)}
                  className="absolute -top-2 -right-2 w-6 h-6 bg-white hover:bg-gray-100 rounded-full flex items-center justify-center shadow-md border border-gray-200 transition-colors"
                >
                  <X className="w-4 h-4 text-gray-700" />
                </button>
              </div>
            ))}
            {images.length < maxImages && (
              <button
                onClick={handleAddImage}
                className="aspect-square rounded-lg bg-gray-100 hover:bg-gray-200 flex items-center justify-center transition-colors"
              >
                <Plus className="w-8 h-8 text-gray-400" />
              </button>
            )}
          </div>
        </div>

        {/* Visibility Setting */}
        <div className="border-t border-gray-200">
          <Sheet open={showVisibilityMenu} onOpenChange={setShowVisibilityMenu}>
            <SheetTrigger asChild>
              <button className="flex items-center justify-between w-full py-4 hover:bg-gray-50 transition-colors">
                <span className="text-gray-500 text-sm">谁可以看</span>
                <div className="flex items-center gap-2">
                  <span className="text-gray-900 text-sm">
                    {visibilityOptions.find((opt) => opt.value === visibility)?.label}
                  </span>
                  <span className="text-gray-400">&gt;</span>
                </div>
              </button>
            </SheetTrigger>
          <SheetContent side="bottom" className="bg-transparent border-none p-0">
            <SheetTitle className="sr-only">谁可以看</SheetTitle>
            <SheetDescription className="sr-only">选择动态的可见范围</SheetDescription>
            <div className="flex flex-col gap-2 px-4 pb-8">
              <div className="bg-white rounded-2xl overflow-hidden">
                {visibilityOptions.map((option, index) => (
                  <button
                    key={option.value}
                    onClick={() => {
                      setVisibility(option.value);
                      setShowVisibilityMenu(false);
                    }}
                    className={`w-full py-4 px-4 text-center text-base hover:bg-gray-50 transition-colors flex items-center justify-center gap-2 ${
                      index !== visibilityOptions.length - 1 ? "border-b border-gray-200" : ""
                    }`}
                  >
                    {visibility === option.value && <Check className="w-5 h-5 text-purple-600" />}
                    <span className={visibility === option.value ? "text-gray-900" : "text-gray-500"}>
                      {option.label}
                    </span>
                  </button>
                ))}
              </div>
              <button
                onClick={() => setShowVisibilityMenu(false)}
                className="w-full bg-white rounded-2xl py-4 text-center text-gray-900 text-base hover:bg-gray-50 transition-colors"
              >
                取消
              </button>
            </div>
          </SheetContent>
        </Sheet>
        </div>
      </div>

      {/* Bottom Warning */}
      <div className="px-4 py-6 bg-white text-center text-xs text-gray-500 leading-relaxed border-t border-gray-200">
        禁止发布色情、谩骂、引战、第三方平台等违规内容
        <br />
        多次发布违规内容将被禁言或封号，将按取证流程
      </div>

      {/* Exit Confirmation Dialog */}
      {showExitDialog && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
          <div className="bg-white rounded-2xl p-6 mx-4 max-w-sm w-full">
            <p className="text-gray-900 text-center mb-6">是否保存当前动态？</p>
            <div className="flex gap-3">
              <button
                onClick={() => {
                  setShowExitDialog(false);
                  navigate(-1);
                }}
                className="flex-1 py-3 border border-gray-300 text-gray-700 rounded-full hover:bg-gray-50 transition-colors"
              >
                取消
              </button>
              <button
                onClick={() => {
                  setShowExitDialog(false);
                  navigate(-1);
                }}
                className="flex-1 py-3 bg-purple-600 text-white rounded-full hover:bg-purple-700 transition-colors"
              >
                确定
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
