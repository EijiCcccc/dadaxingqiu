import { useState } from "react";
import { useNavigate, useParams } from "react-router";
import { ArrowLeft, MoreVertical, Mic, Smile, Plus, Image, Camera, Heart, X } from "lucide-react";
import {
  AlertDialog,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogHeader,
  AlertDialogTitle,
} from "../components/ui/alert-dialog";

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

export default function ChatConversation() {
  const navigate = useNavigate();
  const { userId } = useParams();
  const [messages, setMessages] = useState<Message[]>(mockMessages);
  const [inputMessage, setInputMessage] = useState("");
  const [longPressMessage, setLongPressMessage] = useState<number | null>(null);
  const [longPressTimer, setLongPressTimer] = useState<NodeJS.Timeout | null>(null);
  const [showMorePanel, setShowMorePanel] = useState(false);
  const [isRecordingVoice, setIsRecordingVoice] = useState(false);
  const [recordingTime, setRecordingTime] = useState(0);
  const [recordingTimer, setRecordingTimer] = useState<NodeJS.Timeout | null>(null);
  const [showEmojiPanel, setShowEmojiPanel] = useState(false);
  const [showIntimacyDialog, setShowIntimacyDialog] = useState(false);

  // 亲密度数据
  const intimacyLevel = 1688;
  const receivedMessages = 542;
  const sentMessages = 1146;

  // 常用表情列表
  const emojis = [
    "😀", "😃", "😄", "😁", "😆", "😅", "🤣", "😂",
    "🙂", "🙃", "😉", "😊", "😇", "🥰", "😍", "🤩",
    "😘", "😗", "😚", "😙", "😋", "😛", "😜", "🤪",
    "😝", "🤑", "🤗", "🤭", "🤫", "🤔", "🤐", "🤨",
    "😐", "😑", "😶", "😏", "😒", "🙄", "😬", "🤥",
    "😌", "😔", "😪", "🤤", "😴", "😷", "🤒", "🤕",
    "🤢", "🤮", "🤧", "🥵", "🥶", "😵", "🤯", "🤠",
    "🥳", "😎", "🤓", "🧐", "😕", "😟", "🙁", "☹️",
    "😮", "😯", "😲", "😳", "🥺", "😦", "😧", "😨",
    "😰", "😥", "😢", "😭", "😱", "😖", "😣", "😞",
    "😓", "😩", "😫", "🥱", "😤", "😡", "😠", "🤬",
    "👍", "👎", "👊", "✊", "🤛", "🤜", "🤞", "✌️",
    "🤟", "🤘", "👌", "🤏", "👈", "👉", "👆", "👇",
    "☝️", "👏", "🙌", "👐", "🤲", "🤝", "🙏", "✍️",
    "💪", "🦵", "🦶", "👂", "🦻", "👃", "🧠", "🦷",
    "❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍"
  ];

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

  const handleStartRecording = () => {
    setIsRecordingVoice(true);
    setRecordingTime(0);
    const timer = setInterval(() => {
      setRecordingTime((prev) => prev + 1);
    }, 1000);
    setRecordingTimer(timer);
  };

  const handleStopRecording = () => {
    if (recordingTimer) {
      clearInterval(recordingTimer);
      setRecordingTimer(null);
    }

    if (recordingTime > 0) {
      // 发送语音消息
      const newMessage: Message = {
        id: messages.length + 1,
        type: "user",
        content: `[语音 ${recordingTime}"]`,
        sender: {
          name: "我",
          avatar: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100&h=100&fit=crop",
        },
      };
      setMessages([...messages, newMessage]);
    }

    setIsRecordingVoice(false);
    setRecordingTime(0);
  };

  const handleEmojiSelect = (emoji: string) => {
    setInputMessage(inputMessage + emoji);
    setShowEmojiPanel(false);
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

  return (
    <div className="min-h-screen bg-[#1a1a1a] flex flex-col max-w-md mx-auto">
      {/* Top Navigation */}
      <div className="sticky top-0 z-10 bg-[#252525]/95 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center justify-between h-16 px-4">
          <div className="flex items-center gap-2 flex-1 min-w-0">
            <button
              onClick={() => navigate(-1)}
              className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-700/50 transition-colors -ml-2 flex-shrink-0"
            >
              <ArrowLeft className="w-6 h-6 text-white" />
            </button>
            <h1 className="text-lg font-semibold text-white truncate">{otherUser.name}</h1>
          </div>
          <div className="flex items-center gap-2 flex-shrink-0">
            {/* Intimacy Level */}
            <button
              onClick={() => setShowIntimacyDialog(true)}
              className="flex items-center gap-1.5 px-2.5 py-1 rounded-full bg-gradient-to-br from-pink-500/20 via-rose-500/20 to-red-500/20 hover:from-pink-500/30 hover:via-rose-500/30 hover:to-red-500/30 border border-pink-500/40 transition-all hover:scale-105 active:scale-95 shadow-lg shadow-pink-500/20"
            >
              <div className="relative">
                <Heart className="w-4 h-4 text-pink-400 fill-pink-400 drop-shadow-[0_0_8px_rgba(244,114,182,0.6)]" />
                <Heart className="w-4 h-4 text-pink-300 fill-pink-300 absolute inset-0 animate-pulse opacity-50" />
              </div>
              <span className="text-sm font-semibold bg-gradient-to-r from-pink-300 to-rose-300 bg-clip-text text-transparent drop-shadow-sm">{intimacyLevel}</span>
            </button>
            <button
              onClick={() => navigate(`/dark/chat-settings/${userId}`)}
              className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-gray-700/50 transition-colors -mr-2"
            >
              <MoreVertical className="w-6 h-6 text-white rotate-90" />
            </button>
          </div>
        </div>
      </div>

      {/* Messages Area */}
      <div className="flex-1 overflow-y-auto px-4 py-6 space-y-3">
        {messages.map((message) => {
          if (message.type === "system") {
            return (
              <div key={message.id} className="flex justify-center">
                <span className="text-xs text-gray-500 px-3 py-1.5 bg-[#252525] rounded-full">
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
                      ? "bg-gradient-to-r from-purple-500 to-pink-500 text-white rounded-tr-sm"
                      : "bg-[#252525] text-white rounded-tl-sm"
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
                    } -translate-y-full mb-2 bg-[#2a2a2a] backdrop-blur-sm rounded-xl shadow-2xl border border-gray-700/50 overflow-hidden z-20`}
                    onClick={(e) => e.stopPropagation()}
                  >
                    <button
                      onClick={() => handleCopyMessage(message.id)}
                      className="w-full px-5 py-3 text-sm text-white hover:bg-gray-700/80 text-left whitespace-nowrap transition-colors"
                    >
                      复制
                    </button>
                    {isUser && (
                      <button
                        onClick={() => handleRecallMessage(message.id)}
                        className="w-full px-5 py-3 text-sm text-white hover:bg-gray-700/80 text-left whitespace-nowrap border-t border-gray-700/30 transition-colors"
                      >
                        撤回
                      </button>
                    )}
                    <button
                      onClick={() => handleDeleteMessage(message.id)}
                      className="w-full px-5 py-3 text-sm text-red-400 hover:bg-gray-700/80 text-left whitespace-nowrap border-t border-gray-700/30 transition-colors"
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
      <div className="sticky bottom-0 bg-[#252525]/95 backdrop-blur-lg border-t border-gray-800/50 safe-area-inset-bottom">
        <div className="px-4 py-3">
          <div className="flex items-center gap-2">
            {/* Voice Button */}
            <button
              onTouchStart={handleStartRecording}
              onTouchEnd={handleStopRecording}
              onMouseDown={handleStartRecording}
              onMouseUp={handleStopRecording}
              onMouseLeave={() => {
                if (isRecordingVoice) handleStopRecording();
              }}
              className={`p-2 rounded-full transition-colors ${
                isRecordingVoice ? "bg-purple-500 text-white" : "text-gray-400 hover:text-white hover:bg-gray-700/50"
              }`}
            >
              <Mic className="w-5 h-5" />
            </button>

            {/* Input */}
            <input
              type="text"
              value={inputMessage}
              onChange={(e) => setInputMessage(e.target.value)}
              onKeyPress={(e) => e.key === "Enter" && handleSend()}
              onFocus={() => setShowMorePanel(false)}
              placeholder="输入消息..."
              className="flex-1 bg-[#1a1a1a] text-white placeholder-gray-500 rounded-lg px-4 py-2.5 text-[15px] leading-[1.5] outline-none focus:ring-2 focus:ring-purple-500/50 transition-all border border-gray-700/50"
            />

            {/* Emoji Button */}
            {!inputMessage.trim() && (
              <button
                onClick={() => {
                  setShowEmojiPanel(!showEmojiPanel);
                  setShowMorePanel(false);
                }}
                className="p-2 text-gray-400 hover:text-white hover:bg-gray-700/50 rounded-full transition-colors"
              >
                <Smile className="w-5 h-5" />
              </button>
            )}

            {/* More Button */}
            {!inputMessage.trim() && (
              <button
                onClick={() => {
                  setShowMorePanel(!showMorePanel);
                  setShowEmojiPanel(false);
                }}
                className="p-2 text-gray-400 hover:text-white hover:bg-gray-700/50 rounded-full transition-colors"
              >
                <Plus className="w-5 h-5" />
              </button>
            )}

            {/* Send Button */}
            {inputMessage.trim() && (
              <button
                onClick={handleSend}
                className="bg-gradient-to-r from-purple-500 to-pink-500 text-white px-5 py-2.5 rounded-lg font-medium text-[15px] hover:from-purple-600 hover:to-pink-600 active:scale-95 transition-all"
              >
                发送
              </button>
            )}
          </div>
        </div>

        {/* Emoji Panel */}
        {showEmojiPanel && (
          <div className="px-4 pb-4 pt-2 bg-[#252525]/95 border-t border-gray-800/50">
            <div className="grid grid-cols-8 gap-2 max-h-64 overflow-y-auto">
              {emojis.map((emoji, index) => (
                <button
                  key={index}
                  onClick={() => handleEmojiSelect(emoji)}
                  className="text-2xl p-2 hover:bg-gray-700/50 rounded-lg transition-colors"
                >
                  {emoji}
                </button>
              ))}
            </div>
          </div>
        )}

        {/* More Panel */}
        {showMorePanel && (
          <div className="px-4 pb-4 pt-2 bg-[#252525]/95">
            <div className="grid grid-cols-4 gap-4">
              <button
                onClick={() => {
                  console.log("选择照片");
                  setShowMorePanel(false);
                }}
                className="flex flex-col items-center gap-2 p-4 rounded-xl bg-[#1a1a1a] hover:bg-[#2a2a2a] transition-colors"
              >
                <div className="w-12 h-12 bg-purple-500/20 rounded-full flex items-center justify-center">
                  <Image className="w-6 h-6 text-purple-400" />
                </div>
                <span className="text-xs text-gray-400">照片</span>
              </button>
              <button
                onClick={() => {
                  console.log("拍摄");
                  setShowMorePanel(false);
                }}
                className="flex flex-col items-center gap-2 p-4 rounded-xl bg-[#1a1a1a] hover:bg-[#2a2a2a] transition-colors"
              >
                <div className="w-12 h-12 bg-purple-500/20 rounded-full flex items-center justify-center">
                  <Camera className="w-6 h-6 text-purple-400" />
                </div>
                <span className="text-xs text-gray-400">拍摄</span>
              </button>
            </div>
          </div>
        )}
      </div>

      {/* Voice Recording Indicator */}
      {isRecordingVoice && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-sm">
          <div className="bg-[#2a2a2a] rounded-2xl p-8 flex flex-col items-center gap-4 shadow-2xl">
            <div className="w-20 h-20 bg-purple-500 rounded-full flex items-center justify-center animate-pulse">
              <Mic className="w-10 h-10 text-white" />
            </div>
            <div className="text-white text-lg font-medium">
              {Math.floor(recordingTime / 60)}:{(recordingTime % 60).toString().padStart(2, '0')}
            </div>
            <div className="text-gray-400 text-sm">松开发送，上滑取消</div>
          </div>
        </div>
      )}

      {/* Click outside to close long press menu */}
      {longPressMessage !== null && (
        <div
          className="fixed inset-0 z-10"
          onClick={() => setLongPressMessage(null)}
        />
      )}

      {/* Intimacy Detail Dialog */}
      <AlertDialog open={showIntimacyDialog} onOpenChange={setShowIntimacyDialog}>
        <AlertDialogContent className="bg-gradient-to-br from-pink-50 via-rose-50 to-pink-100 backdrop-blur-xl border border-pink-200/50 max-w-[320px] rounded-3xl shadow-2xl shadow-pink-200/20 overflow-hidden">
          {/* Decorative gradient overlay */}
          <div className="absolute inset-0 bg-gradient-to-br from-pink-100/30 via-transparent to-rose-100/30 pointer-events-none" />

          <div className="absolute top-3 right-3 z-10">
            <button
              onClick={() => setShowIntimacyDialog(false)}
              className="w-8 h-8 flex items-center justify-center rounded-full bg-white/80 hover:bg-white backdrop-blur-sm transition-colors border border-pink-200"
            >
              <X className="w-4 h-4 text-gray-600" />
            </button>
          </div>

          <AlertDialogHeader>
            <AlertDialogTitle className="sr-only">亲密度详情</AlertDialogTitle>
            <AlertDialogDescription className="sr-only">
              查看亲密度详细信息
            </AlertDialogDescription>
          </AlertDialogHeader>

          <div className="relative pt-6 pb-5 px-5">
            {/* Title with heart icon */}
            <div className="flex items-center justify-center gap-2 mb-5">
              <Heart className="w-5 h-5 text-pink-500 fill-pink-500 drop-shadow-[0_0_10px_rgba(244,114,182,0.4)]" />
              <h3 className="text-lg font-bold bg-gradient-to-r from-pink-500 via-rose-500 to-pink-500 bg-clip-text text-transparent">
                亲密度详情
              </h3>
            </div>

            <div className="space-y-3">
              {/* Intimacy Level - Featured */}
              <div className="bg-gradient-to-br from-pink-100 to-rose-100 backdrop-blur-sm rounded-2xl p-4 border border-pink-200 shadow-lg">
                <div className="flex items-center justify-between">
                  <span className="text-gray-700 text-base font-medium">亲密度</span>
                  <div className="flex items-center gap-2">
                    <Heart className="w-4 h-4 text-pink-500 fill-pink-500" />
                    <span className="text-2xl font-bold bg-gradient-to-r from-pink-500 to-rose-500 bg-clip-text text-transparent">
                      {intimacyLevel}
                    </span>
                  </div>
                </div>
              </div>

              {/* Stats */}
              <div className="space-y-2">
                <div className="flex items-center justify-between py-2.5 px-3.5 bg-white/80 backdrop-blur-sm rounded-xl border border-pink-200/50">
                  <span className="text-gray-700 text-sm">收到消息</span>
                  <span className="text-lg font-semibold text-gray-900">{receivedMessages}</span>
                </div>
                <div className="flex items-center justify-between py-2.5 px-3.5 bg-white/80 backdrop-blur-sm rounded-xl border border-pink-200/50">
                  <span className="text-gray-700 text-sm">发送消息</span>
                  <span className="text-lg font-semibold text-gray-900">{sentMessages}</span>
                </div>
              </div>

              {/* Tip */}
              <div className="text-center pt-2 pb-1">
                <p className="text-gray-600 text-xs leading-relaxed">
                  持续聊天可增加亲密度哦！
                </p>
              </div>
            </div>
          </div>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}