import { useState } from "react";
import { useNavigate, useParams } from "react-router";
import { ArrowLeft, MoreVertical, Heart, MessageCircle, Smile } from "lucide-react";
import { Avatar, AvatarImage, AvatarFallback } from "../components/ui/avatar";
import { Tabs, TabsList, TabsTrigger, TabsContent } from "../components/ui/tabs";
import { Sheet, SheetContent, SheetTrigger, SheetTitle, SheetDescription } from "../components/ui/sheet";

// Mock data
const mockFeedDetail = {
  id: "1",
  avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
  nickname: "星辰",
  gender: "female" as const,
  content: "今天看到了超级美的日落，心情也变得明朗起来 🌅",
  images: [
    "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop",
  ],
  likes: 42,
  comments: 8,
  timestamp: "2小时前",
};

const mockComments = [
  {
    id: "1",
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop",
    nickname: "逐梦",
    gender: "male" as const,
    content: "太美了！在哪里拍的？",
    time: "1小时前",
    replyTo: null,
  },
  {
    id: "2",
    avatar: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop",
    nickname: "星辰",
    gender: "female" as const,
    content: "在海边公园拍的～",
    time: "50分钟前",
    replyTo: "逐梦",
  },
  {
    id: "3",
    avatar: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop",
    nickname: "月影",
    gender: "female" as const,
    content: "好想去看日落",
    time: "30分钟前",
    replyTo: null,
  },
  {
    id: "4",
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    nickname: "星河",
    gender: "male" as const,
    content: "我也想去！",
    time: "25分钟前",
    replyTo: "月影",
  },
];

const mockLikes = [
  {
    id: "1",
    avatar: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop",
    nickname: "星河",
    gender: "male" as const,
  },
  {
    id: "2",
    avatar: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&h=100&fit=crop",
    nickname: "清风",
    gender: "female" as const,
  },
  {
    id: "3",
    avatar: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop",
    nickname: "晨曦",
    gender: "male" as const,
  },
];

export default function FeedDetail() {
  const navigate = useNavigate();
  const { feedId } = useParams();
  const [liked, setLiked] = useState(false);
  const [likeCount, setLikeCount] = useState(mockFeedDetail.likes);
  const [showInput, setShowInput] = useState(false);
  const [inputValue, setInputValue] = useState("");
  const [showMoreMenu, setShowMoreMenu] = useState(false);

  const handleLike = () => {
    if (liked) {
      setLiked(false);
      setLikeCount(likeCount - 1);
    } else {
      setLiked(true);
      setLikeCount(likeCount + 1);
    }
  };

  const handleSend = () => {
    if (inputValue.trim()) {
      console.log("发送评论:", inputValue);
      setInputValue("");
      setShowInput(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#1a1a1a] flex flex-col max-w-md mx-auto">
      {/* Header */}
      <div className="sticky top-0 z-10 bg-[#1a1a1a]/95 backdrop-blur-lg border-b border-gray-800/50">
        <div className="flex items-center justify-between px-4 h-14">
          <button
            onClick={() => navigate(-1)}
            className="p-2 -ml-2 text-white hover:bg-gray-800/50 rounded-full transition-colors"
          >
            <ArrowLeft className="w-5 h-5" />
          </button>
          <h1 className="text-lg font-medium text-white">动态详情</h1>
          <Sheet open={showMoreMenu} onOpenChange={setShowMoreMenu}>
            <SheetTrigger asChild>
              <button className="p-2 -mr-2 text-white hover:bg-gray-800/50 rounded-full transition-colors">
                <MoreVertical className="w-5 h-5" />
              </button>
            </SheetTrigger>
            <SheetContent side="bottom" className="bg-transparent border-none p-0">
              <SheetTitle className="sr-only">操作选项</SheetTitle>
              <SheetDescription className="sr-only">选择对动态的操作</SheetDescription>
              <div className="flex flex-col gap-2 px-4 pb-8">
                <div className="bg-[#252525] rounded-2xl overflow-hidden">
                  <div className="py-3 text-center text-gray-500 text-sm border-b border-gray-800/50">
                    操作选项
                  </div>
                  <button
                    onClick={() => {
                      setShowMoreMenu(false);
                      console.log("对谁可见");
                    }}
                    className="w-full py-4 text-center text-purple-500 text-base border-b border-gray-800/50 hover:bg-gray-800/30 transition-colors"
                  >
                    对谁可见
                  </button>
                  <button
                    onClick={() => {
                      setShowMoreMenu(false);
                      console.log("删除动态");
                    }}
                    className="w-full py-4 text-center text-purple-500 text-base hover:bg-gray-800/30 transition-colors"
                  >
                    删除动态
                  </button>
                </div>
                <button
                  onClick={() => setShowMoreMenu(false)}
                  className="w-full bg-[#252525] rounded-2xl py-4 text-center text-white text-base hover:bg-gray-800/50 transition-colors"
                >
                  取消
                </button>
              </div>
            </SheetContent>
          </Sheet>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-y-auto pb-24">
        {/* Feed Content */}
        <div className="p-4 border-b border-gray-800/50">
          <div className="flex items-start gap-3 mb-3">
            <Avatar className="w-12 h-12 ring-2 ring-purple-500/20">
              <AvatarImage src={mockFeedDetail.avatar} />
              <AvatarFallback className="bg-purple-500/20 text-purple-400">
                {mockFeedDetail.nickname[0]}
              </AvatarFallback>
            </Avatar>
            <div className="flex-1">
              <div className="flex items-center gap-2 mb-1">
                <span className="text-white font-medium">{mockFeedDetail.nickname}</span>
                <span
                  className={`text-xs px-2 py-0.5 rounded-full ${
                    mockFeedDetail.gender === "male"
                      ? "bg-blue-500/20 text-blue-400"
                      : "bg-pink-500/20 text-pink-400"
                  }`}
                >
                  {mockFeedDetail.gender === "male" ? "♂" : "♀"}
                </span>
              </div>
              <span className="text-xs text-gray-500">{mockFeedDetail.timestamp}</span>
            </div>
          </div>

          <p className="text-gray-300 mb-3 leading-relaxed">{mockFeedDetail.content}</p>

          {mockFeedDetail.images.length > 0 && (
            <div className="grid grid-cols-3 gap-2 mb-3">
              {mockFeedDetail.images.map((img, index) => (
                <div
                  key={index}
                  className="relative aspect-square rounded-lg overflow-hidden bg-[#252525]"
                >
                  <img src={img} alt={`Image ${index + 1}`} className="w-full h-full object-cover" />
                </div>
              ))}
            </div>
          )}
        </div>

        {/* Tabs */}
        <Tabs defaultValue="comments" className="flex-1">
          <TabsList className="w-full bg-[#1a1a1a] rounded-none h-auto p-0 px-4 pt-4 pb-3">
            <TabsTrigger
              value="comments"
              className="bg-transparent border-none shadow-none data-[state=active]:bg-transparent data-[state=active]:text-white data-[state=active]:font-semibold rounded-none text-gray-500 px-0 mr-6 text-base"
            >
              评论
            </TabsTrigger>
            <TabsTrigger
              value="likes"
              className="bg-transparent border-none shadow-none data-[state=active]:bg-transparent data-[state=active]:text-white data-[state=active]:font-semibold rounded-none text-gray-500 px-0 text-base"
            >
              点赞
            </TabsTrigger>
          </TabsList>

          <TabsContent value="comments" className="mt-0">
            <div>
              {mockComments.map((comment) => (
                <div key={comment.id} className="px-4 py-3">
                  <div className="flex gap-3">
                    <Avatar className="w-10 h-10 flex-shrink-0">
                      <AvatarImage src={comment.avatar} />
                      <AvatarFallback className="bg-purple-500/20 text-purple-400">
                        {comment.nickname[0]}
                      </AvatarFallback>
                    </Avatar>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2 mb-1">
                        <span className="text-white text-sm font-medium">{comment.nickname}</span>
                        <span
                          className={`text-xs px-1.5 py-0.5 rounded-full ${
                            comment.gender === "male"
                              ? "bg-blue-500/20 text-blue-400"
                              : "bg-pink-500/20 text-pink-400"
                          }`}
                        >
                          {comment.gender === "male" ? "♂" : "♀"}
                        </span>
                      </div>
                      <p className="text-gray-300 text-sm leading-relaxed mb-1">
                        {comment.replyTo && (
                          <>
                            <span className="text-gray-500">回复 </span>
                            <span className="text-white font-semibold">{comment.replyTo}</span>
                            <span className="text-gray-500">: </span>
                          </>
                        )}
                        {comment.content}
                      </p>
                      <span className="text-xs text-gray-500">{comment.time}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </TabsContent>

          <TabsContent value="likes" className="mt-0">
            <div>
              {mockLikes.map((like) => (
                <div key={like.id} className="px-4 py-3 flex items-center gap-3">
                  <Avatar className="w-12 h-12">
                    <AvatarImage src={like.avatar} />
                    <AvatarFallback className="bg-purple-500/20 text-purple-400">
                      {like.nickname[0]}
                    </AvatarFallback>
                  </Avatar>
                  <div className="flex-1">
                    <div className="flex items-center gap-2">
                      <span className="text-white font-medium">{like.nickname}</span>
                      <span
                        className={`text-xs px-2 py-0.5 rounded-full ${
                          like.gender === "male"
                            ? "bg-blue-500/20 text-blue-400"
                            : "bg-pink-500/20 text-pink-400"
                        }`}
                      >
                        {like.gender === "male" ? "♂" : "♀"}
                      </span>
                    </div>
                  </div>
                  <button className="px-4 py-1.5 bg-purple-500 hover:bg-purple-600 text-white rounded-full text-sm transition-colors">
                    私聊感谢
                  </button>
                </div>
              ))}
            </div>
          </TabsContent>
        </Tabs>
      </div>

      {/* Bottom Input Bar */}
      <div className="fixed bottom-0 left-0 right-0 max-w-md mx-auto bg-[#252525]/95 backdrop-blur-lg border-t border-gray-800/50">
        {!showInput ? (
          <div className="flex items-center gap-3 px-4 py-3">
            <button
              onClick={() => setShowInput(true)}
              className="flex-1 bg-[#1a1a1a] text-gray-500 text-sm px-4 py-2.5 rounded-full text-left"
            >
              说点什么...
            </button>
            <button
              onClick={handleLike}
              className={`flex items-center gap-1.5 px-3 py-2 rounded-full transition-colors ${
                liked ? "text-purple-500" : "text-gray-400 hover:text-purple-400"
              }`}
            >
              <Heart className={`w-5 h-5 ${liked ? "fill-purple-500" : ""}`} />
              <span className="text-sm">{likeCount}</span>
            </button>
            <button className="flex items-center gap-1.5 px-3 py-2 text-gray-400 hover:text-purple-400 rounded-full transition-colors">
              <MessageCircle className="w-5 h-5" />
              <span className="text-sm">{mockFeedDetail.comments}</span>
            </button>
          </div>
        ) : (
          <div className="px-4 py-3">
            <div className="flex items-center gap-2">
              <div className="flex-1 flex items-center gap-2 bg-[#1a1a1a] rounded-full px-4 py-2.5">
                <input
                  type="text"
                  value={inputValue}
                  onChange={(e) => setInputValue(e.target.value)}
                  placeholder="说点什么..."
                  className="flex-1 bg-transparent text-white text-sm outline-none placeholder:text-gray-500"
                  autoFocus
                />
                <button className="text-gray-400 hover:text-purple-400 transition-colors flex-shrink-0">
                  <Smile className="w-5 h-5" />
                </button>
              </div>
              <button
                onClick={handleSend}
                disabled={!inputValue.trim()}
                className="px-6 py-2.5 bg-purple-500 hover:bg-purple-600 disabled:bg-gray-700 disabled:text-gray-500 text-white rounded-full text-sm font-medium transition-colors"
              >
                发送
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
