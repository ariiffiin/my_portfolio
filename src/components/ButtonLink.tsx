import type { ReactNode } from "react";

type ButtonLinkProps = {
  href: string;
  children: ReactNode;
  variant?: "primary" | "secondary";
  size?: "md" | "sm";
  download?: boolean;
  className?: string;
};

const variants = {
  primary:
    "bg-accent text-on-accent hover:bg-white border border-transparent",
  secondary:
    "border border-line bg-surface text-ink hover:border-accent hover:text-accent",
};

const sizes = {
  md: "px-5 py-3 text-base",
  sm: "px-4 py-2 text-sm",
};

export default function ButtonLink({
  href,
  children,
  variant = "primary",
  size = "md",
  download,
  className = "",
}: ButtonLinkProps) {
  const external = href.startsWith("http");
  return (
    <a
      href={href}
      download={download}
      target={external ? "_blank" : undefined}
      rel={external ? "noopener noreferrer" : undefined}
      className={`inline-flex items-center justify-center gap-2 rounded-lg font-medium transition-colors ${variants[variant]} ${sizes[size]} ${className}`}
    >
      {children}
    </a>
  );
}
