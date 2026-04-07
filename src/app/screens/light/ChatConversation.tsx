import { useState } from "react";
import { useNavigate, useParams } from "react-router";
import { ArrowLeft, MoreVertical, X } from "lucide-react";
import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogHeader,
  AlertDialogTitle,
} from "../../components/ui/alert-dialog";

type Message = {
  id: number;
  type: "user" | "other" | "system";
  content: string;
  time?: string;
  sender?: {
    name: string;
    avatar: string;
  };
};

const mockMessages: Message[] = [
  {
    id: 1,
    type: "system",
    content: "12:30",
  },
  {
    id: 2,
    type: "other",
    content: "在吗？周末一起去看电影吧！",
    sender: {
      name: "星辰漫步",
      avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    },
  },
  {
    id: 3,
    type: "user",
    content: "好啊，看什么电影？",
    sender: {
      name: "我",
      avatar: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop",
    },
  },
  {
    id: 4,
    type: "other",
    content: "听说新上映的科幻片不错，要不要一起去看？",
    sender: {
      name: "星辰漫步",
      avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    },
  },
  {
    id: 5,
    type: "user",
    content: "可以啊，周六下午怎么样？",
    sender: {
      name: "我",
      avatar: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop",
    },
  },
  {
    id: 6,
    type: "system",
    content: "星辰漫步撤回了一条消息",
  },
  {
    id: 7,
    type: "other",
    content: "周六下午完美！我们14:00在影院门口见？",
    sender: {
      name: "星辰漫步",
      avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    },
  },
];

export default function LightChatConversation() {
  const navigate = useNavigate();
  const { userId } = useParams();
  const [messages, setMessages] = useState<Message[]>(mockMessages);
  const [inputMessage, setInputMessage] = useState("");
  const [showMoreMenu, setShowMoreMenu] = useState(false);
  const [showReportDialog, setShowReportDialog] = useState(false);
  const [reportContent, setReportContent] = useState("");
  const [longPressMessage, setLongPressMessage] = useState<number | null>(null);
  const [longPressTimer, setLongPressTimer] = useState<NodeJS.Timeout | null>(null);

  const otherUser = {
    name: "星辰漫步",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
  };

  const handleSend = () => {
    if (inputMessage.trim()) {
      const newMessage: Message = {
        id: messages.length + 1,
        type: "user",
        content: inputMessage,
        sender: {
          name: "我",
          avatar: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop",
        },
      };
      setMessages([...messages, newMessage]);
      setInputMessage("");
    }
  };

  const handleLongPressStart = (messageId: number) => {
    const timer = setTimeout(() => {
      setLongPressMessage(messageId);
    }, 500);
    setLongPressTimer(timer);
  };

  const handleLongPressEnd = () => {
    if (longPressTimer) {
      clearTimeout(longPressTimer);
      setLongPressTimer(null);
    }
  };

  const handleCopyMessage = (messageId: number) => {
    const message = messages.find((m) => m.id === messageId);
    if (message && message.content) {
      navigator.clipboard.writeText(message.content);
    }
    setLongPressMessage(null);
  };

  const handleRecallMessage = (messageId: number) => {
    setMessages(
      messages.map((m) =>
        m.id === messageId
          ? { id: m.id, type: "system", content: "你撤回了一条消息" }
          : m
      )
    );
    setLongPressMessage(null);
  };

  const handleDeleteMessage = (messageId: number) => {
    setMessages(messages.filter((m) => m.id !== messageId));
    setLongPressMessage(null);
  };

  const handleReport = () => {
    setShowMoreMenu(false);
    setShowReportDialog(true);
  };

  const handleSubmitReport = () => {
    console.log("Report submitted:", reportContent);
    setReportContent("");
    setShowReportDialog(false);
  };

  return (
    <div className="min-h-screen bg-gradient-to-b from-purple-100 via-pink-50/30 to-white flex flex-col max-w-md mx-auto">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50">
        <div className="flex items-center justify-between h-16 px-4">
          <button
            onClick={() => navigate(-1)}
            className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-purple-200/50 transition-colors -ml-2"
          >
            <ArrowLeft className="w-6 h-6 text-purple-900" />
          </button>
          <h1 className="text-lg font-semibold text-purple-900">{otherUser.name}</h1>
          <button
            onClick={() => setShowMoreMenu(true)}
            className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-purple-200/50 transition-colors -mr-2"
          >
            <MoreVertical className="w-6 h-6 text-purple-900 rotate-90" />
          </button>
        </div>
      </div>

      {/* Messages Area */}
      <div className="flex-1 overflow-y-auto px-4 py-6 space-y-3">
        {messages.map((message) => {
          if (message.type === "system") {
            return (
              <div key={message.id} className="flex justify-center">
                <span className="text-xs text-gray-500 px-3 py-1.5 bg-gray-200/80 rounded-full">
                  {message.content}
                </span>
              </div>
            );
          }

          const isUser = message.type === "user";

          return (
            <div
              key={message.id}
              className={`flex gap-2.5 ${isUser ? "flex-row-reverse" : "flex-row"}`}
            >
              {/* Avatar */}
              <img
                src={message.sender?.avatar}
                alt={message.sender?.name}
                className="w-10 h-10 rounded-full object-cover flex-shrink-0"
              />

              {/* Message Bubble */}
              <div
                className="relative"
                onTouchStart={() => handleLongPressStart(message.id)}
                onTouchEnd={handleLongPressEnd}
                onMouseDown={() => handleLongPressStart(message.id)}
                onMouseUp={handleLongPressEnd}
                onMouseLeave={handleLongPressEnd}
              >
                <div
                  className={`max-w-[260px] px-3.5 py-2.5 rounded-lg ${
                    isUser
                      ? "bg-gradient-to-r from-purple-400 to-pink-400 text-white rounded-tr-sm"
                      : "bg-white text-gray-900 rounded-tl-sm border border-purple-200"
                  }`}
                >
                  <p className="text-[15px] leading-[1.5] break-words">
                    {message.content}
                  </p>
                </div>

                {/* Long Press Action Menu */}
                {longPressMessage === message.id && (
                  <div
                    className={`absolute top-0 ${
                      isUser ? "right-0 mr-2" : "left-0 ml-2"
                    } -translate-y-full mb-2 bg-white/95 backdrop-blur-sm rounded-xl shadow-2xl border border-gray-200 overflow-hidden z-20`}
                    onClick={(e) => e.stopPropagation()}
                  >
                    <button
                      onClick={() => handleCopyMessage(message.id)}
                      className="w-full px-5 py-3 text-sm text-gray-900 hover:bg-gray-100 text-left whitespace-nowrap transition-colors"
                    >
                      复制
                    </button>
                    {isUser && (
                      <button
                        onClick={() => handleRecallMessage(message.id)}
                        className="w-full px-5 py-3 text-sm text-gray-900 hover:bg-gray-100 text-left whitespace-nowrap border-t border-gray-100 transition-colors"
                      >
                        撤回
                      </button>
                    )}
                    <button
                      onClick={() => handleDeleteMessage(message.id)}
                      className="w-full px-5 py-3 text-sm text-red-500 hover:bg-gray-100 text-left whitespace-nowrap border-t border-gray-100 transition-colors"
                    >
                      删除
                    </button>
                  </div>
                )}
              </div>
            </div>
          );
        })}
      </div>

      {/* Bottom Input Area */}
      <div className="sticky bottom-0 bg-white/80 backdrop-blur-lg border-t border-purple-200/50 px-4 py-3 safe-area-inset-bottom">
        <div className="flex items-center gap-2.5">
          <input
            type="text"
            value={inputMessage}
            onChange={(e) => setInputMessage(e.target.value)}
            onKeyPress={(e) => e.key === "Enter" && handleSend()}
            placeholder="输入消息..."
            className="flex-1 bg-white text-gray-900 placeholder-gray-400 rounded-lg px-4 py-2.5 text-[15px] leading-[1.5] outline-none focus:ring-2 focus:ring-purple-400/50 border border-purple-200 transition-all"
          />
          <button
            onClick={handleSend}
            disabled={!inputMessage.trim()}
            className="bg-purple-500 text-white px-5 py-2.5 rounded-lg font-medium text-[15px] hover:bg-purple-600 active:scale-95 transition-all disabled:opacity-40 disabled:cursor-not-allowed disabled:active:scale-100"
          >
            发送
          </button>
        </div>
      </div>

      {/* More Menu - Bottom Sheet */}
      {showMoreMenu && (
        <>
          <div
            className="fixed inset-0 bg-black/40 backdrop-blur-sm z-40 animate-in fade-in duration-200"
            onClick={() => setShowMoreMenu(false)}
          />
          <div className="fixed bottom-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-lg rounded-t-3xl max-w-md mx-auto animate-in slide-in-from-bottom duration-300 border-t border-gray-200">
            <div className="py-4">
              <div className="w-10 h-1 bg-gray-300 rounded-full mx-auto mb-4" />
              <button
                onClick={handleReport}
                className="w-full px-6 py-4 text-gray-900 text-base font-medium hover:bg-gray-100 transition-colors text-center"
              >
                举报
              </button>
              <div className="h-px bg-gray-200 my-2" />
              <button
                onClick={() => setShowMoreMenu(false)}
                className="w-full px-6 py-4 text-gray-600 text-base hover:bg-gray-100 transition-colors text-center"
              >
                取消
              </button>
            </div>
          </div>
        </>
      )}

      {/* Report Dialog */}
      <AlertDialog open={showReportDialog} onOpenChange={setShowReportDialog}>
        <AlertDialogContent className="bg-white/95 backdrop-blur-lg border-gray-200 max-w-sm rounded-2xl">
          <div className="absolute top-4 right-4">
            <button
              onClick={() => setShowReportDialog(false)}
              className="w-9 h-9 flex items-center justify-center rounded-full hover:bg-gray-100 transition-colors"
            >
              <X className="w-5 h-5 text-gray-600" />
            </button>
          </div>
          <AlertDialogHeader>
            <AlertDialogTitle className="text-gray-900 text-xl font-semibold mb-4">
              举报
            </AlertDialogTitle>
            <AlertDialogDescription className="sr-only">
              请输入举报内容
            </AlertDialogDescription>
          </AlertDialogHeader>
          <div className="space-y-4">
            <textarea
              value={reportContent}
              onChange={(e) => setReportContent(e.target.value)}
              placeholder="请输入举报内容"
              className="w-full h-32 bg-gray-100 text-gray-900 placeholder-gray-500 rounded-xl px-4 py-3 text-[15px] leading-[1.5] outline-none focus:ring-2 focus:ring-purple-500/50 resize-none transition-all"
            />
            <button
              onClick={handleSubmitReport}
              disabled={!reportContent.trim()}
              className="w-full bg-purple-600 text-white py-3.5 rounded-xl font-semibold text-base hover:bg-purple-700 active:scale-[0.98] transition-all disabled:opacity-40 disabled:cursor-not-allowed disabled:active:scale-100"
            >
              提交
            </button>
          </div>
        </AlertDialogContent>
      </AlertDialog>

      {/* Click outside to close long press menu */}
      {longPressMessage !== null && (
        <div
          className="fixed inset-0 z-10"
          onClick={() => setLongPressMessage(null)}
        />
      )}
    </div>
  );
}