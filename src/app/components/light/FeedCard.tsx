import { Heart, MessageCircle, UserPlus } from "lucide-react";
import { Avatar, AvatarImage, AvatarFallback } from "../ui/avatar";
import { useState } from "react";
import { useNavigate } from "react-router";

interface FeedCardProps {
  id: string;
  avatar: string;
  nickname: string;
  gender: "male" | "female";
  content: string;
  images?: string[];
  likes: number;
  comments: number;
  timestamp: string;
}

export default function LightFeedCard({
  id,
  avatar,
  nickname,
  gender,
  content,
  images = [],
  likes,
  comments,
  timestamp,
}: FeedCardProps) {
  const navigate = useNavigate();
  const [liked, setLiked] = useState(false);
  const [likeCount, setLikeCount] = useState(likes);

  const handleLike = (e: React.MouseEvent) => {
    e.stopPropagation();
    if (liked) {
      setLiked(false);
      setLikeCount(likeCount - 1);
    } else {
      setLiked(true);
      setLikeCount(likeCount + 1);
    }
  };

  const handleCardClick = () => {
    navigate(`/light/feed/${id}`);
  };

  const handleGreeting = (e: React.MouseEvent) => {
    e.stopPropagation();
    console.log("打招呼");
  };

  const getImageGridClass = () => {
    if (images.length === 0) return "";
    if (images.length === 1) return "grid-cols-1";
    if (images.length === 2) return "grid-cols-2";
    return "grid-cols-3";
  };

  return (
    <div onClick={handleCardClick} className="bg-white rounded-2xl p-4 mb-3 shadow-sm cursor-pointer hover:shadow-md transition-shadow">
      {/* Header */}
      <div className="flex items-center gap-3 mb-3">
        <Avatar className="w-12 h-12 ring-2 ring-purple-500/20">
          <AvatarImage src={avatar} />
          <AvatarFallback className="bg-purple-100 text-purple-600">
            {nickname[0]}
          </AvatarFallback>
        </Avatar>
        <div className="flex-1">
          <div className="flex items-center gap-2">
            <span className="text-gray-900 font-medium">{nickname}</span>
            <span
              className={`text-xs px-2 py-0.5 rounded-full ${
                gender === "male"
                  ? "bg-blue-100 text-blue-600"
                  : "bg-pink-100 text-pink-600"
              }`}
            >
              {gender === "male" ? "♂" : "♀"}
            </span>
          </div>
          <span className="text-xs text-gray-500">{timestamp}</span>
        </div>
        <button onClick={handleGreeting} className="flex items-center gap-1.5 px-3 py-1.5 bg-purple-600 hover:bg-purple-700 text-white rounded-full text-sm font-medium transition-colors">
          <UserPlus className="w-4 h-4" />
          <span>打招呼</span>
        </button>
      </div>

      {/* Content */}
      <p className="text-gray-700 mb-3 leading-relaxed">{content}</p>

      {/* Images */}
      {images.length > 0 && (
        <div className={`grid ${getImageGridClass()} gap-2 mb-3`}>
          {images.map((img, index) => (
            <div
              key={index}
              className={`relative aspect-square rounded-lg overflow-hidden bg-gray-100 ${
                images.length === 1 ? "aspect-video" : ""
              }`}
            >
              <img
                src={img}
                alt={`Image ${index + 1}`}
                className="w-full h-full object-cover"
              />
            </div>
          ))}
        </div>
      )}

      {/* Actions */}
      <div className="flex items-center gap-6 pt-3 border-t border-gray-200">
        <button
          onClick={handleLike}
          className={`flex items-center gap-2 transition-colors ${
            liked ? "text-purple-600" : "text-gray-500 hover:text-purple-600"
          }`}
        >
          <Heart className={`w-5 h-5 ${liked ? "fill-purple-600" : ""}`} />
          <span className="text-sm">{likeCount}</span>
        </button>

        <button onClick={(e) => e.stopPropagation()} className="flex items-center gap-2 text-gray-500 hover:text-purple-600 transition-colors">
          <MessageCircle className="w-5 h-5" />
          <span className="text-sm">{comments}</span>
        </button>
      </div>
    </div>
  );
}
