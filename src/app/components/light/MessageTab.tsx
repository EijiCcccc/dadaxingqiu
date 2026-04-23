import { useState, useMemo } from "react";
import { useNavigate } from "react-router";
import { motion } from "motion/react";
import { Users, Pin } from "lucide-react";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "../ui/alert-dialog";

const mockChats = [
  {
    id: 1,
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    username: "星辰漫步",
    lastMessage: "晚上一起打游戏吗？",
    time: "18:30",
    unread: 2,
    isPinned: true,
  },
  {
    id: 2,
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop",
    username: "宇宙旅行者",
    lastMessage: "那部电影真的超级好看！",
    time: "17:45",
    unread: 0,
    isPinned: false,
  },
  {
    id: 3,
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop",
    username: "月光女神",
    lastMessage: "周末去新开的咖啡店吧～",
    time: "15:20",
    unread: 1,
    isPinned: true,
  },
  {
    id: 4,
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    username: "星际探险",
    lastMessage: "明天健身房见！",
    time: "昨天",
    unread: 0,
    isPinned: false,
  },
  {
    id: 5,
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop",
    username: "流星雨",
    lastMessage: "新画的同人图你看看怎么样",
    time: "昨天",
    unread: 0,
    isPinned: false,
  },
  {
    id: 6,
    avatar: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop",
    username: "银河系长",
    lastMessage: "这个bug终于修好了哈哈",
    time: "周二",
    unread: 0,
    isPinned: false,
  },
  {
    id: 7,
    avatar: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop",
    username: "彗星少女",
    lastMessage: "[语音消息]",
    time: "周一",
    unread: 0,
    isPinned: false,
  },
];

export default function LightMessageTab() {
  const [chats, setChats] = useState(mockChats);
  const [deleteDialogOpen, setDeleteDialogOpen] = useState(false);
  const [chatToDelete, setChatToDelete] = useState<number | null>(null);
  const navigate = useNavigate();

  // Sort chats: pinned first, then by original order
  const sortedChats = useMemo(() => {
    return [...chats].sort((a, b) => {
      if (a.isPinned === b.isPinned) return 0;
      return a.isPinned ? -1 : 1;
    });
  }, [chats]);

  const handleDeleteClick = (chatId: number) => {
    setChatToDelete(chatId);
    setDeleteDialogOpen(true);
  };

  const confirmDelete = () => {
    if (chatToDelete !== null) {
      setChats(chats.filter((chat) => chat.id !== chatToDelete));
      setDeleteDialogOpen(false);
      setChatToDelete(null);
    }
  };

  const cancelDelete = () => {
    setDeleteDialogOpen(false);
    setChatToDelete(null);
  };

  return (
    <div className="min-h-screen">
      {/* Header */}
      <div className="sticky top-0 bg-purple-100/80 backdrop-blur-lg border-b border-purple-200/50 px-4 py-4">
        <div className="flex items-center justify-between">
          <h1 className="text-xl font-bold text-purple-900">消息</h1>
          <button
            onClick={() => navigate("/light/contacts")}
            className="w-10 h-10 flex items-center justify-center rounded-full hover:bg-purple-200/50 transition-colors -mr-2"
          >
            <Users className="w-6 h-6 text-purple-900" />
          </button>
        </div>
      </div>

      {/* Chat List */}
      <div>
        {sortedChats.map((chat) => (
          <div key={chat.id} className="relative overflow-hidden border-b border-purple-100/50">
            {/* Delete Button - Hidden on right side */}
            <div className="absolute right-0 top-0 bottom-0 w-20 bg-red-500 flex items-center justify-center">
              <button
                onClick={(e) => {
                  e.stopPropagation();
                  handleDeleteClick(chat.id);
                }}
                className="w-full h-full"
              >
                <span className="text-white text-sm font-medium">删除</span>
              </button>
            </div>

            {/* Swipeable Chat Item */}
            <motion.div
              drag="x"
              dragConstraints={{ left: -80, right: 0 }}
              dragElastic={0.1}
              dragMomentum={false}
              onDragEnd={(e, info) => {
                if (info.offset.x < -60) {
                  handleDeleteClick(chat.id);
                }
              }}
              onClick={() => navigate(`/light/chat/${chat.id}`)}
              className={`flex items-center gap-3 px-4 py-3 backdrop-blur-sm cursor-pointer relative transition-colors ${
                chat.isPinned
                  ? "bg-purple-100/60 active:bg-purple-100/80"
                  : "bg-white/40 active:bg-white/60"
              }`}
            >
              {/* Avatar */}
              <div className="relative flex-shrink-0">
                <img
                  src={chat.avatar}
                  alt={chat.username}
                  className="w-12 h-12 rounded-full object-cover"
                />
                {chat.unread > 0 && (
                  <div className="absolute -top-1 -right-1 w-5 h-5 bg-purple-400 rounded-full flex items-center justify-center text-white text-xs">
                    {chat.unread}
                  </div>
                )}
              </div>

              {/* Content */}
              <div className="flex-1 min-w-0">
                <div className="flex items-center justify-between mb-1">
                  <div className="flex items-center gap-1.5 min-w-0">
                    {chat.isPinned && (
                      <Pin className="w-3.5 h-3.5 text-gray-500 flex-shrink-0" />
                    )}
                    <h3 className="text-gray-900 font-medium text-sm truncate">{chat.username}</h3>
                  </div>
                  <span className="text-gray-500 text-xs flex-shrink-0">{chat.time}</span>
                </div>
                <p className="text-gray-600 text-sm truncate">{chat.lastMessage}</p>
              </div>
            </motion.div>
          </div>
        ))}
      </div>

      {/* Delete Confirmation Dialog */}
      <AlertDialog open={deleteDialogOpen} onOpenChange={setDeleteDialogOpen}>
        <AlertDialogContent className="bg-white border-purple-200 max-w-xs">
          <AlertDialogHeader>
            <AlertDialogTitle className="text-gray-900 text-center">删除后不可恢复，是否确定？</AlertDialogTitle>
            <AlertDialogDescription className="sr-only">
              此操作将永久删除该对话，且无法恢复
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter className="flex-row gap-3 sm:flex-row">
            <AlertDialogCancel
              onClick={cancelDelete}
              className="flex-1 bg-gray-100 hover:bg-gray-200 text-gray-900 border-gray-200 rounded-lg"
            >
              取消
            </AlertDialogCancel>
            <AlertDialogAction
              onClick={confirmDelete}
              className="flex-1 bg-red-500 hover:bg-red-600 text-white rounded-lg"
            >
              确定
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}