import { useState } from "react";
import { useNavigate, useParams } from "react-router";
import { ArrowLeft, ChevronRight } from "lucide-react";
import { Switch } from "../components/ui/switch";
import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogHeader,
  AlertDialogTitle,
} from "../components/ui/alert-dialog";

export default function ChatSettings() {
  const navigate = useNavigate();
  const { userId } = useParams();
  const [isPinned, setIsPinned] = useState(false);
  const [remark, setRemark] = useState("星辰漫步");
  const [showRemarkDialog, setShowRemarkDialog] = useState(false);
  const [remarkInput, setRemarkInput] = useState(remark);
  const [showBlockDialog, setShowBlockDialog] = useState(false);
  const [isFollowing, setIsFollowing] = useState(true);

  const handleSaveRemark = () => {
    if (remarkInput.trim()) {
      setRemark(remarkInput.trim());
      setShowRemarkDialog(false);
    }
  };

  const handleBlock = () => {
    console.log("拉入黑名单");
    setShowBlockDialog(false);
    navigate(-1);
  };

  const handleUnfollow = () => {
    setIsFollowing(false);
    console.log("取消关注");
  };

  const handleFollow = () => {
    setIsFollowing(true);
    console.log("关注");
  };

  return (
    <div className="min-h-screen bg-[#1a1a1a] max-w-md mx-auto">
      {/* Header */}
      <div className="sticky top-0 z-10 bg-[#1a1a1a]/95 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center px-4 h-14">
          <button
            onClick={() => navigate(-1)}
            className="p-2 -ml-2 text-white hover:bg-gray-800/50 rounded-full transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <h1 className="text-lg font-medium text-white ml-2">聊天设置</h1>
        </div>
      </div>

      {/* Settings List */}
      <div className="p-4 space-y-4">
        {/* Basic Settings Group */}
        <div className="bg-[#252525] rounded-2xl overflow-hidden">
          {/* Pin Chat */}
          <div className="flex items-center justify-between px-4 py-4 border-b border-gray-800/30">
            <span className="text-white text-base">聊天置顶</span>
            <Switch checked={isPinned} onCheckedChange={setIsPinned} />
          </div>

          {/* Set Remark */}
          <button
            onClick={() => {
              setRemarkInput(remark);
              setShowRemarkDialog(true);
            }}
            className="w-full flex items-center justify-between px-4 py-4 border-b border-gray-800/30 hover:bg-gray-800/30 transition-colors"
          >
            <span className="text-white text-base">设置备注</span>
            <div className="flex items-center gap-2">
              <span className="text-gray-500 text-sm">{remark}</span>
              <ChevronRight className="w-5 h-5 text-gray-600" />
            </div>
          </button>

          {/* Set Chat Background */}
          <button
            onClick={() => console.log("设置聊天背景")}
            className="w-full flex items-center justify-between px-4 py-4 hover:bg-gray-800/30 transition-colors"
          >
            <span className="text-white text-base">设置当前聊天背景</span>
            <ChevronRight className="w-5 h-5 text-gray-600" />
          </button>
        </div>

        {/* Danger Zone Group */}
        <div className="bg-[#252525] rounded-2xl overflow-hidden">
          {/* Delete Conversation */}
          <button
            onClick={() => console.log("删除对话")}
            className="w-full flex items-center justify-between px-4 py-4 border-b border-gray-800/30 hover:bg-gray-800/30 transition-colors"
          >
            <span className="text-white text-base">删除对话</span>
            <ChevronRight className="w-5 h-5 text-gray-600" />
          </button>

          {/* Report User */}
          <button
            onClick={() => navigate(`/dark/user/${userId}`)}
            className="w-full flex items-center justify-between px-4 py-4 border-b border-gray-800/30 hover:bg-gray-800/30 transition-colors"
          >
            <span className="text-white text-base">举报用户</span>
            <ChevronRight className="w-5 h-5 text-gray-600" />
          </button>

          {/* Block User */}
          <button
            onClick={() => setShowBlockDialog(true)}
            className="w-full flex items-center justify-between px-4 py-4 hover:bg-gray-800/30 transition-colors"
          >
            <span className="text-white text-base">拉入黑名单</span>
            <ChevronRight className="w-5 h-5 text-gray-600" />
          </button>
        </div>

        {/* Unfollow/Follow Button */}
        <button
          onClick={isFollowing ? handleUnfollow : handleFollow}
          className="w-full bg-[#252525] hover:bg-[#2a2a2a] text-white text-base py-4 rounded-2xl transition-colors"
        >
          {isFollowing ? "取消关注" : "关注"}
        </button>
      </div>

      {/* Remark Dialog */}
      <AlertDialog open={showRemarkDialog} onOpenChange={setShowRemarkDialog}>
        <AlertDialogContent className="bg-[#252525] border-gray-800/50 max-w-sm rounded-2xl">
          <AlertDialogHeader>
            <AlertDialogTitle className="text-white text-lg font-medium text-center">
              设置备注
            </AlertDialogTitle>
            <AlertDialogDescription className="sr-only">
              请输入备注名，不超过10个字
            </AlertDialogDescription>
          </AlertDialogHeader>
          <div className="py-4">
            <input
              type="text"
              value={remarkInput}
              onChange={(e) => {
                if (e.target.value.length <= 10) {
                  setRemarkInput(e.target.value);
                }
              }}
              placeholder="请填写备注，不超过10个字"
              className="w-full bg-[#1a1a1a] text-white placeholder-gray-500 rounded-lg px-4 py-3 text-sm outline-none focus:ring-2 focus:ring-purple-500/50 border border-gray-700/50"
            />
          </div>
          <div className="flex gap-3">
            <button
              onClick={() => setShowRemarkDialog(false)}
              className="flex-1 py-3 border border-gray-700 text-white rounded-full hover:bg-gray-800/50 transition-colors"
            >
              取消
            </button>
            <button
              onClick={handleSaveRemark}
              disabled={!remarkInput.trim()}
              className="flex-1 py-3 bg-purple-500 text-white rounded-full hover:bg-purple-600 disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
            >
              确定
            </button>
          </div>
        </AlertDialogContent>
      </AlertDialog>

      {/* Block Confirmation Dialog */}
      <AlertDialog open={showBlockDialog} onOpenChange={setShowBlockDialog}>
        <AlertDialogContent className="bg-[#252525] border-gray-800/50 max-w-sm rounded-2xl">
          <AlertDialogHeader>
            <AlertDialogTitle className="sr-only">确认拉黑</AlertDialogTitle>
            <AlertDialogDescription className="text-white text-center text-base leading-relaxed py-4">
              拉入黑名单后，你将不再收到对方消息，可在设置中进行管理。是否确定？
            </AlertDialogDescription>
          </AlertDialogHeader>
          <div className="flex gap-3">
            <button
              onClick={() => setShowBlockDialog(false)}
              className="flex-1 py-3 border border-gray-700 text-white rounded-full hover:bg-gray-800/50 transition-colors"
            >
              取消
            </button>
            <button
              onClick={handleBlock}
              className="flex-1 py-3 bg-purple-500 text-white rounded-full hover:bg-purple-600 transition-colors"
            >
              确定
            </button>
          </div>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}
