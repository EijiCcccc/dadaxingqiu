import { Mars, Venus } from "lucide-react";
import { useNavigate } from "react-router";

interface User {
  id: number;
  avatar: string;
  nickname: string;
  gender: "male" | "female";
  tags: string[];
}

interface UserCardProps {
  user: User;
}

export default function UserCard({ user }: UserCardProps) {
  const navigate = useNavigate();

  const handleCardClick = () => {
    navigate(`/dark/user/${user.id}`);
  };

  return (
    <div
      onClick={handleCardClick}
      className="bg-gradient-to-br from-[#2a2a2a] to-[#252525] rounded-2xl overflow-hidden border border-gray-800/50 hover:border-purple-500/50 transition-all cursor-pointer shadow-lg"
    >
      {/* Avatar */}
      <div className="relative aspect-square">
        <img src={user.avatar} alt={user.nickname} className="w-full h-full object-cover" />
      </div>

      {/* Info */}
      <div className="p-3">
        <div className="flex items-center gap-2 mb-3">
          <h3 className="text-white font-medium text-sm">{user.nickname}</h3>
          {user.gender === "male" ? (
            <Mars className="w-4 h-4 text-blue-400" />
          ) : (
            <Venus className="w-4 h-4 text-pink-400" />
          )}
        </div>

        {/* Tags */}
        <div className="flex flex-wrap gap-1.5">
          {user.tags.map((tag, index) => (
            <span
              key={index}
              className="px-2.5 py-1 bg-gray-800/60 text-gray-400 rounded-full text-xs border border-gray-700/50"
            >
              {tag}
            </span>
          ))}
        </div>
      </div>
    </div>
  );
}