export function AppIcon({ className = "w-32 h-32" }: { className?: string }) {
  return (
    <svg 
      className={className}
      viewBox="0 0 1024 1024" 
      fill="none" 
      xmlns="http://www.w3.org/2000/svg"
    >
      {/* Background with rounded corners */}
      <rect width="1024" height="1024" rx="230" fill="url(#bgGradient)"/>
      
      {/* Decorative stars in background */}
      <g opacity="0.4">
        <circle cx="180" cy="200" r="12" fill="white"/>
        <circle cx="820" cy="180" r="10" fill="white"/>
        <circle cx="150" cy="750" r="14" fill="white"/>
        <circle cx="850" cy="800" r="11" fill="white"/>
        <circle cx="300" cy="120" r="8" fill="white"/>
        <circle cx="750" cy="880" r="9" fill="white"/>
        
        {/* Small sparkles */}
        <path d="M 200 350 L 208 358 L 200 366 L 192 358 Z" fill="white"/>
        <path d="M 750 280 L 758 288 L 750 296 L 742 288 Z" fill="white"/>
        <path d="M 250 700 L 258 708 L 250 716 L 242 708 Z" fill="white"/>
        <path d="M 800 650 L 808 658 L 800 666 L 792 658 Z" fill="white"/>
      </g>
      
      {/* Left Planet (Purple/Pink) - larger one */}
      <g transform="translate(340, 460)">
        {/* Main planet body with gradient */}
        <ellipse cx="0" cy="0" rx="180" ry="170" fill="url(#planet1Gradient)"/>
        
        {/* Highlight on top */}
        <ellipse cx="-40" cy="-50" rx="50" ry="40" fill="white" opacity="0.25"/>
        <ellipse cx="-30" cy="-45" rx="25" ry="20" fill="white" opacity="0.4"/>
        
        {/* Ring around planet */}
        <ellipse cx="0" cy="-10" rx="200" ry="50" fill="none" stroke="url(#ringGradient1)" strokeWidth="20" opacity="0.8"/>
        
        {/* Cute blush */}
        <ellipse cx="-70" cy="30" rx="28" ry="18" fill="#FF9ECD" opacity="0.5"/>
        <ellipse cx="70" cy="30" rx="28" ry="18" fill="#FF9ECD" opacity="0.5"/>
        
        {/* Eyes - bigger and cuter */}
        <g>
          {/* Left eye */}
          <ellipse cx="-50" cy="-10" rx="20" ry="24" fill="white"/>
          <ellipse cx="-48" cy="-5" rx="15" ry="18" fill="#2D1B47"/>
          <ellipse cx="-52" cy="-12" rx="8" ry="10" fill="white" opacity="0.9"/>
          
          {/* Right eye */}
          <ellipse cx="50" cy="-10" rx="20" ry="24" fill="white"/>
          <ellipse cx="52" cy="-5" rx="15" ry="18" fill="#2D1B47"/>
          <ellipse cx="48" cy="-12" rx="8" ry="10" fill="white" opacity="0.9"/>
        </g>
        
        {/* Cute smile */}
        <path d="M -55 35 Q 0 70 55 35" stroke="#2D1B47" strokeWidth="10" fill="none" strokeLinecap="round"/>
        
        {/* Small decorative dots on planet surface */}
        <circle cx="-120" cy="-80" r="8" fill="#9D5DCE" opacity="0.3"/>
        <circle cx="-100" cy="90" r="10" fill="#9D5DCE" opacity="0.3"/>
        <circle cx="110" cy="-60" r="7" fill="#9D5DCE" opacity="0.3"/>
      </g>
      
      {/* Right Planet (Light Purple) - smaller one */}
      <g transform="translate(630, 530)">
        {/* Main planet body with gradient */}
        <ellipse cx="0" cy="0" rx="150" ry="145" fill="url(#planet2Gradient)"/>
        
        {/* Highlight on top */}
        <ellipse cx="-30" cy="-40" rx="40" ry="32" fill="white" opacity="0.3"/>
        <ellipse cx="-25" cy="-38" rx="20" ry="16" fill="white" opacity="0.5"/>
        
        {/* Ring around planet */}
        <ellipse cx="0" cy="-5" rx="170" ry="42" fill="none" stroke="url(#ringGradient2)" strokeWidth="16" opacity="0.85"/>
        
        {/* Cute blush */}
        <ellipse cx="-58" cy="25" rx="24" ry="15" fill="#D4A5F5" opacity="0.5"/>
        <ellipse cx="58" cy="25" rx="24" ry="15" fill="#D4A5F5" opacity="0.5"/>
        
        {/* Eyes - slightly smaller but still cute */}
        <g>
          {/* Left eye */}
          <ellipse cx="-42" cy="-8" rx="18" ry="22" fill="white"/>
          <ellipse cx="-40" cy="-4" rx="13" ry="16" fill="#2D1B47"/>
          <ellipse cx="-43" cy="-10" rx="7" ry="9" fill="white" opacity="0.9"/>
          
          {/* Right eye */}
          <ellipse cx="42" cy="-8" rx="18" ry="22" fill="white"/>
          <ellipse cx="44" cy="-4" rx="13" ry="16" fill="#2D1B47"/>
          <ellipse cx="41" cy="-10" rx="7" ry="9" fill="white" opacity="0.9"/>
        </g>
        
        {/* Cute smile */}
        <path d="M -45 30 Q 0 58 45 30" stroke="#2D1B47" strokeWidth="8" fill="none" strokeLinecap="round"/>
        
        {/* Small decorative dots on planet surface */}
        <circle cx="-95" cy="-65" r="7" fill="#B794D6" opacity="0.3"/>
        <circle cx="-85" cy="75" r="8" fill="#B794D6" opacity="0.3"/>
        <circle cx="90" cy="-50" r="6" fill="#B794D6" opacity="0.3"/>
      </g>
      
      {/* Sparkle effects around planets */}
      <g opacity="0.8">
        <path d="M 280 320 L 290 330 L 280 340 L 270 330 Z" fill="white"/>
        <path d="M 740 420 L 750 430 L 740 440 L 730 430 Z" fill="white"/>
        <path d="M 320 580 L 328 588 L 320 596 L 312 588 Z" fill="white"/>
        <path d="M 720 640 L 728 648 L 720 656 L 712 648 Z" fill="white"/>
      </g>
      
      {/* Small hearts floating between planets */}
      <g opacity="0.7">
        <path d="M 480 480 Q 475 475 470 480 Q 465 485 470 490 Q 475 495 480 490 Q 485 485 480 480 Z" fill="#FFB3D9"/>
        <path d="M 520 520 Q 517 517 514 520 Q 511 523 514 526 Q 517 529 520 526 Q 523 523 520 520 Z" fill="#E8B5F0"/>
      </g>
      
      {/* Gradients definitions */}
      <defs>
        {/* Background gradient - purple to pink */}
        <linearGradient id="bgGradient" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#7C3AED" stopOpacity="1" />
          <stop offset="50%" stopColor="#A855F7" stopOpacity="1" />
          <stop offset="100%" stopColor="#D946EF" stopOpacity="1" />
        </linearGradient>
        
        {/* Planet 1 gradient - pink/purple */}
        <radialGradient id="planet1Gradient" cx="30%" cy="30%">
          <stop offset="0%" stopColor="#E9B5F5" stopOpacity="1" />
          <stop offset="50%" stopColor="#D996E8" stopOpacity="1" />
          <stop offset="100%" stopColor="#C77FDB" stopOpacity="1" />
        </radialGradient>
        
        {/* Planet 2 gradient - lighter purple */}
        <radialGradient id="planet2Gradient" cx="30%" cy="30%">
          <stop offset="0%" stopColor="#DEC9F0" stopOpacity="1" />
          <stop offset="50%" stopColor="#C9AEE3" stopOpacity="1" />
          <stop offset="100%" stopColor="#B794D6" stopOpacity="1" />
        </radialGradient>
        
        {/* Ring gradient 1 */}
        <linearGradient id="ringGradient1" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stopColor="#F5D0FE" stopOpacity="0.4" />
          <stop offset="50%" stopColor="#E9B5F5" stopOpacity="0.8" />
          <stop offset="100%" stopColor="#F5D0FE" stopOpacity="0.4" />
        </linearGradient>
        
        {/* Ring gradient 2 */}
        <linearGradient id="ringGradient2" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" stopColor="#E9D5FF" stopOpacity="0.4" />
          <stop offset="50%" stopColor="#DEC9F0" stopOpacity="0.8" />
          <stop offset="100%" stopColor="#E9D5FF" stopOpacity="0.4" />
        </linearGradient>
      </defs>
    </svg>
  );
}
