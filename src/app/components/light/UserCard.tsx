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

export default function LightUserCard({ user }: UserCardProps) {
  const navigate = useNavigate();

  const handleCardClick = () => {
    navigate(`/light/user/${user.id}`);
  };

  return (
    <div
      onClick={handleCardClick}
      className="bg-white rounded-2xl overflow-hidden border border-gray-200 hover:border-purple-400 transition-all cursor-pointer shadow-sm hover:shadow-md"
    >
      {/* Avatar */}
      <div className="relative aspect-square">
        <img src={user.avatar} alt={user.nickname} className="w-full h-full object-cover" />
      </div>

      {/* Info */}
      <div className="p-3">
        <div className="flex items-center gap-2 mb-3">
          <h3 className="text-gray-900 font-medium text-sm">{user.nickname}</h3>
          {user.gender === "male" ? (
            <Mars className="w-4 h-4 text-blue-500" />
          ) : (
            <Venus className="w-4 h-4 text-pink-500" />
          )}
        </div>

        {/* Tags */}
        <div className="flex flex-wrap gap-1.5">
          {user.tags.map((tag, index) => (
            <span
              key={index}
              className="px-2.5 py-1 bg-gray-100 text-gray-600 rounded-full text-xs border border-gray-200"
            >
              {tag}
            </span>
          ))}
        </div>
      </div>
    </div>
  );
}