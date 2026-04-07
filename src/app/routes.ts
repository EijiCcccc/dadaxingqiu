import { createBrowserRouter } from "react-router";
import Login from "./screens/Login";
import CompleteProfile from "./screens/CompleteProfile";
import SelectTags from "./screens/SelectTags";
import Home from "./screens/Home";
import UserProfile from "./screens/UserProfile";
import ChatConversation from "./screens/ChatConversation";
import EditProfile from "./screens/EditProfile";
import EditTags from "./screens/EditTags";
import Settings from "./screens/Settings";
import About from "./screens/About";
import UserAgreement from "./screens/UserAgreement";
import PrivacyPolicy from "./screens/PrivacyPolicy";
import Feedback from "./screens/Feedback";

// Light theme imports
import LightLogin from "./screens/light/Login";
import LightCompleteProfile from "./screens/light/CompleteProfile";
import LightSelectTags from "./screens/light/SelectTags";
import LightHome from "./screens/light/Home";
import LightUserProfile from "./screens/light/UserProfile";
import LightChatConversation from "./screens/light/ChatConversation";
import LightEditProfile from "./screens/light/EditProfile";
import LightEditTags from "./screens/light/EditTags";
import LightSettings from "./screens/light/Settings";
import LightAbout from "./screens/light/About";
import LightUserAgreement from "./screens/light/UserAgreement";
import LightPrivacyPolicy from "./screens/light/PrivacyPolicy";
import LightFeedback from "./screens/light/Feedback";

export const router = createBrowserRouter([
  // Default route - Light theme
  {
    path: "/",
    Component: LightLogin,
  },
  
  // Dark theme routes
  {
    path: "/dark/login",
    Component: Login,
  },
  {
    path: "/dark/complete-profile",
    Component: CompleteProfile,
  },
  {
    path: "/dark/select-tags",
    Component: SelectTags,
  },
  {
    path: "/dark/home",
    Component: Home,
  },
  {
    path: "/dark/user/:userId",
    Component: UserProfile,
  },
  {
    path: "/dark/chat/:userId",
    Component: ChatConversation,
  },
  {
    path: "/dark/edit-profile",
    Component: EditProfile,
  },
  {
    path: "/dark/edit-tags",
    Component: EditTags,
  },
  {
    path: "/dark/settings",
    Component: Settings,
  },
  {
    path: "/dark/about",
    Component: About,
  },
  {
    path: "/dark/user-agreement",
    Component: UserAgreement,
  },
  {
    path: "/dark/privacy-policy",
    Component: PrivacyPolicy,
  },
  {
    path: "/dark/feedback",
    Component: Feedback,
  },
  
  // Light theme routes
  {
    path: "/light",
    Component: LightLogin,
  },
  {
    path: "/light/login",
    Component: LightLogin,
  },
  {
    path: "/light/complete-profile",
    Component: LightCompleteProfile,
  },
  {
    path: "/light/select-tags",
    Component: LightSelectTags,
  },
  {
    path: "/light/home",
    Component: LightHome,
  },
  {
    path: "/light/user/:userId",
    Component: LightUserProfile,
  },
  {
    path: "/light/chat/:userId",
    Component: LightChatConversation,
  },
  {
    path: "/light/edit-profile",
    Component: LightEditProfile,
  },
  {
    path: "/light/edit-tags",
    Component: LightEditTags,
  },
  {
    path: "/light/settings",
    Component: LightSettings,
  },
  {
    path: "/light/about",
    Component: LightAbout,
  },
  {
    path: "/light/user-agreement",
    Component: LightUserAgreement,
  },
  {
    path: "/light/privacy-policy",
    Component: LightPrivacyPolicy,
  },
  {
    path: "/light/feedback",
    Component: LightFeedback,
  },
]);