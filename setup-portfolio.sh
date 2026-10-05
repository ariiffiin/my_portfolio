#!/usr/bin/env bash
# Portfolio setup: writes every project file into a fresh create-next-app project.
# Run from the project root (the folder that contains package.json).
set -euo pipefail

if [ ! -f package.json ] || [ ! -d src/app ]; then
  echo "Run this from the project root (the folder that contains package.json and src/app)."
  exit 1
fi

mkdir -p "public/cv"
base64 -d > "public/cv/Ariffin-Samsu-CV.pdf" <<'__B64__'
JVBERi0xLjQKMSAwIG9iago8PCAvVHlwZSAvQ2F0YWxvZyAvUGFnZXMgMiAwIFIgPj4KZW5kb2JqCjIgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9LaWRzIFszIDAgUl0gL0NvdW50IDEgPj4KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2UgL1BhcmVudCAyIDAgUiAvTWVkaWFCb3ggWzAgMCA2MTIgNzkyXSAvQ29udGVudHMgNCAwIFIgL1Jlc291cmNlcyA8PCAvRm9udCA8PCAvRjEgNSAwIFIgPj4gPj4gPj4KZW5kb2JqCjQgMCBvYmoKPDwgL0xlbmd0aCAxMDQgPj4Kc3RyZWFtCkJUIC9GMSAxNCBUZiA2MCA3NDAgVGQgKFJlcGxhY2UgdGhpcyBmaWxlIHdpdGggeW91ciBDViAoa2VlcCB0aGUgZmlsZSBuYW1lIEFyaWZmaW4tU2Ftc3UtQ1YucGRmKS4pIFRqIEVUCmVuZHN0cmVhbQplbmRvYmoKNSAwIG9iago8PCAvVHlwZSAvRm9udCAvU3VidHlwZSAvVHlwZTEgL0Jhc2VGb250IC9IZWx2ZXRpY2EgPj4KZW5kb2JqCnhyZWYKMCA2CjAwMDAwMDAwMDAgNjU1MzUgZiAKMDAwMDAwMDAwOSAwMDAwMCBuIAowMDAwMDAwMDU4IDAwMDAwIG4gCjAwMDAwMDAxMTUgMDAwMDAgbiAKMDAwMDAwMDI0MSAwMDAwMCBuIAowMDAwMDAwMzk2IDAwMDAwIG4gCnRyYWlsZXIKPDwgL1NpemUgNiAvUm9vdCAxIDAgUiA+PgpzdGFydHhyZWYKNDY2CiUlRU9GCg==
__B64__
echo "wrote public/cv/Ariffin-Samsu-CV.pdf"
mkdir -p "public/projects"
: > "public/projects/.gitkeep"
echo "wrote public/projects/.gitkeep"
mkdir -p "src/app"
cat > "src/app/globals.css" <<'__EOF__'
@import "tailwindcss";

/* Colors: change these values to restyle the whole site. */
@theme {
  --color-canvas: #0b1220;
  --color-surface: #111b2e;
  --color-surface-2: #17243b;
  --color-line: #263550;
  --color-ink: #e8eef7;
  --color-muted: #9aaac1;
  --color-accent: #2dd4bf;
  --color-on-accent: #042f2a;
}

/* Fonts are loaded in layout.tsx and exposed as CSS variables. */
@theme inline {
  --font-sans: var(--font-plex), ui-sans-serif, system-ui, sans-serif;
  --font-display: var(--font-bricolage), var(--font-plex), ui-sans-serif,
    system-ui, sans-serif;
}

html {
  scroll-behavior: smooth;
  background: var(--color-canvas);
}

body {
  background: var(--color-canvas);
  color: var(--color-ink);
  font-family: var(--font-sans);
  line-height: 1.6;
}

::selection {
  background: var(--color-accent);
  color: var(--color-on-accent);
}

:focus-visible {
  outline: 2px solid var(--color-accent);
  outline-offset: 3px;
  border-radius: 4px;
}

@media (prefers-reduced-motion: reduce) {
  html {
    scroll-behavior: auto;
  }
  * {
    transition-duration: 0.01ms !important;
  }
}
__EOF__
echo "wrote src/app/globals.css"
mkdir -p "src/app"
cat > "src/app/icon.svg" <<'__EOF__'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64"><rect width="64" height="64" rx="14" fill="#0b1220"/><text x="32" y="42" text-anchor="middle" font-family="Arial, Helvetica, sans-serif" font-size="28" font-weight="700" fill="#2dd4bf">AS</text></svg>
__EOF__
echo "wrote src/app/icon.svg"
mkdir -p "src/app"
cat > "src/app/layout.tsx" <<'__EOF__'
import type { Metadata, Viewport } from "next";
import type { ReactNode } from "react";
import { Bricolage_Grotesque, IBM_Plex_Sans } from "next/font/google";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { site } from "@/data/site";
import "./globals.css";

const bricolage = Bricolage_Grotesque({
  variable: "--font-bricolage",
  subsets: ["latin"],
  display: "swap",
});

const plex = IBM_Plex_Sans({
  variable: "--font-plex",
  subsets: ["latin"],
  weight: ["400", "500", "600"],
  display: "swap",
});

const pageTitle = site.seoTitle;

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: { default: pageTitle, template: `%s | ${site.name}` },
  description: site.description,
  openGraph: {
    title: pageTitle,
    description: site.description,
    url: site.url,
    siteName: site.name,
    type: "website",
  },
  twitter: {
    card: "summary",
    title: pageTitle,
    description: site.description,
  },
};

export const viewport: Viewport = {
  themeColor: "#0b1220",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en" className={`${bricolage.variable} ${plex.variable}`}>
      <body className="min-h-screen antialiased">
        <a
          href="#main"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[60] focus:rounded-lg focus:bg-accent focus:px-4 focus:py-2 focus:font-medium focus:text-on-accent"
        >
          Skip to content
        </a>
        <Navbar />
        {children}
        <Footer />
      </body>
    </html>
  );
}
__EOF__
echo "wrote src/app/layout.tsx"
mkdir -p "src/app"
cat > "src/app/page.tsx" <<'__EOF__'
import Hero from "@/components/Hero";
import About from "@/components/About";
import Projects from "@/components/Projects";
import Contact from "@/components/Contact";

export default function Home() {
  return (
    <main id="main">
      <Hero />
      <About />
      <Projects />
      <Contact />
    </main>
  );
}
__EOF__
echo "wrote src/app/page.tsx"
mkdir -p "src/components"
cat > "src/components/About.tsx" <<'__EOF__'
import Container from "@/components/Container";
import SectionHeading from "@/components/SectionHeading";
import { certifications, education, experience } from "@/data/experience";
import { site } from "@/data/site";
import { skillGroups } from "@/data/skills";

export default function About() {
  return (
    <section
      id="about"
      aria-labelledby="about-title"
      className="scroll-mt-16 border-t border-line py-20 sm:py-28"
    >
      <Container>
        <SectionHeading
          id="about-title"
          title="About me"
          description="From the fab floor to dashboards."
        />

        <div className="mt-12 grid gap-12 lg:grid-cols-[0.9fr_1.1fr] lg:gap-16">
          <div>
            <p className="max-w-prose text-lg leading-relaxed">{site.bio}</p>

            <h3 className="mt-10 font-display text-xl font-semibold">Education</h3>
            <p className="mt-3 font-medium">{education.program}</p>
            <p className="text-muted">
              {education.school}, {education.note}
            </p>

            <h3 className="mt-10 font-display text-xl font-semibold">
              Certifications
            </h3>
            <ul className="mt-3 space-y-2 text-muted">
              {certifications.map((item) => (
                <li key={item}>{item}</li>
              ))}
            </ul>
          </div>

          <div>
            <h3 className="font-display text-xl font-semibold">Experience</h3>
            <ol className="relative mt-6 space-y-10 border-l border-line pl-8">
              {experience.map((job) => (
                <li key={job.company} className="relative">
                  <span
                    className="absolute -left-[2.4rem] top-2 h-3 w-3 rounded-full border-2 border-accent bg-canvas"
                    aria-hidden="true"
                  />
                  <h4 className="font-display text-lg font-semibold">{job.role}</h4>
                  <p className="text-muted">
                    {job.company}, {job.period}
                  </p>
                  <ul className="mt-3 list-disc space-y-1.5 pl-5 text-muted marker:text-accent">
                    {job.points.map((point) => (
                      <li key={point}>{point}</li>
                    ))}
                  </ul>
                </li>
              ))}
            </ol>
          </div>
        </div>

        <div className="mt-16">
          <h3 className="font-display text-xl font-semibold">Skills</h3>
          <div className="mt-6 grid gap-6 md:grid-cols-3">
            {skillGroups.map((group) => (
              <div
                key={group.name}
                className="rounded-2xl border border-line bg-surface p-6"
              >
                <h4 className="font-display text-lg font-semibold">{group.name}</h4>
                <ul className="mt-4 flex flex-wrap gap-2">
                  {group.items.map((item) => (
                    <li
                      key={item}
                      className="rounded-full border border-line bg-surface-2 px-3 py-1 text-sm"
                    >
                      {item}
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
        </div>
      </Container>
    </section>
  );
}
__EOF__
echo "wrote src/components/About.tsx"
mkdir -p "src/components"
cat > "src/components/ButtonLink.tsx" <<'__EOF__'
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
__EOF__
echo "wrote src/components/ButtonLink.tsx"
mkdir -p "src/components"
cat > "src/components/Contact.tsx" <<'__EOF__'
import ButtonLink from "@/components/ButtonLink";
import Container from "@/components/Container";
import { GitHubIcon, LinkedInIcon, MailIcon } from "@/components/icons";
import SectionHeading from "@/components/SectionHeading";
import { site } from "@/data/site";

export default function Contact() {
  return (
    <section
      id="contact"
      aria-labelledby="contact-title"
      className="scroll-mt-16 border-t border-line py-20 sm:py-28"
    >
      <Container>
        <div className="rounded-2xl border border-line bg-surface p-8 sm:p-12">
          <SectionHeading
            id="contact-title"
            title="Contact"
            description="I am looking for a data analyst role. Email is the fastest way to reach me."
          />
          <p className="mt-6 text-lg">{site.email}</p>
          <div className="mt-6 flex flex-col gap-3 sm:flex-row">
            <ButtonLink href={`mailto:${site.email}`}>
              <MailIcon className="h-5 w-5" />
              Send an email
            </ButtonLink>
            <ButtonLink href={site.linkedin} variant="secondary">
              <LinkedInIcon className="h-5 w-5" />
              LinkedIn
            </ButtonLink>
            <ButtonLink href={site.github} variant="secondary">
              <GitHubIcon className="h-5 w-5" />
              GitHub
            </ButtonLink>
          </div>
        </div>
      </Container>
    </section>
  );
}
__EOF__
echo "wrote src/components/Contact.tsx"
mkdir -p "src/components"
cat > "src/components/Container.tsx" <<'__EOF__'
import type { ReactNode } from "react";

export default function Container({ children }: { children: ReactNode }) {
  return <div className="mx-auto w-full max-w-6xl px-5 sm:px-8">{children}</div>;
}
__EOF__
echo "wrote src/components/Container.tsx"
mkdir -p "src/components"
cat > "src/components/Footer.tsx" <<'__EOF__'
import Container from "@/components/Container";
import { site } from "@/data/site";

export default function Footer() {
  return (
    <footer className="border-t border-line py-8">
      <Container>
        <div className="flex flex-col gap-3 text-sm text-muted sm:flex-row sm:items-center sm:justify-between">
          <p>
            Copyright {new Date().getFullYear()} {site.name}. Built with Next.js and
            Tailwind CSS.
          </p>
          <a href="#home" className="transition-colors hover:text-ink">
            Back to top
          </a>
        </div>
      </Container>
    </footer>
  );
}
__EOF__
echo "wrote src/components/Footer.tsx"
mkdir -p "src/components"
cat > "src/components/Hero.tsx" <<'__EOF__'
import ButtonLink from "@/components/ButtonLink";
import Container from "@/components/Container";
import { DownloadIcon } from "@/components/icons";
import { certifications } from "@/data/experience";
import { site } from "@/data/site";

// Decorative control chart: a nod to statistical process control,
// the habit from engineering that carries into data work.
function ControlChart() {
  const points = [
    [60, 98],
    [100, 84],
    [140, 106],
    [180, 92],
    [220, 100],
    [260, 80],
    [300, 70],
    [340, 52],
    [380, 24],
  ];
  const line = points.map(([x, y]) => `${x},${y}`).join(" ");
  const last = points[points.length - 1];

  return (
    <svg
      viewBox="0 0 420 190"
      className="h-auto w-full"
      role="presentation"
      aria-hidden="true"
    >
      <g className="stroke-line" strokeWidth="1.5">
        <line x1="0" y1="36" x2="420" y2="36" strokeDasharray="6 6" />
        <line x1="0" y1="96" x2="420" y2="96" />
        <line x1="0" y1="156" x2="420" y2="156" strokeDasharray="6 6" />
      </g>
      <g className="fill-muted" fontSize="11">
        <text x="4" y="30">UCL</text>
        <text x="4" y="90">Mean</text>
        <text x="4" y="150">LCL</text>
      </g>
      <polyline
        points={line}
        fill="none"
        className="stroke-accent"
        strokeWidth="2.5"
        strokeLinejoin="round"
        strokeLinecap="round"
      />
      {points.slice(0, -1).map(([x, y]) => (
        <circle key={x} cx={x} cy={y} r="3.5" className="fill-canvas stroke-accent" strokeWidth="2" />
      ))}
      <circle cx={last[0]} cy={last[1]} r="9" className="fill-accent/20" />
      <circle cx={last[0]} cy={last[1]} r="5" className="fill-accent" />
    </svg>
  );
}

export default function Hero() {
  return (
    <section id="home" aria-labelledby="hero-title" className="scroll-mt-20">
      <Container>
        <div className="grid items-center gap-12 py-16 sm:py-24 lg:grid-cols-[1.1fr_0.9fr] lg:gap-16 lg:py-28">
          <div>
            <p className="inline-flex items-center gap-2 rounded-full border border-line bg-surface px-3 py-1 text-sm text-muted">
              <span className="h-2 w-2 rounded-full bg-accent" aria-hidden="true" />
              {site.availability}
            </p>
            <h1
              id="hero-title"
              className="mt-6 font-display text-5xl font-semibold leading-[1.02] tracking-tight sm:text-6xl lg:text-7xl"
            >
              {site.name}
            </h1>
            <p className="mt-4 font-display text-xl text-accent sm:text-2xl">
              {site.title}
            </p>
            <p className="mt-6 max-w-xl text-lg leading-relaxed text-muted">
              {site.tagline}
            </p>
            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <ButtonLink href="#projects">View Projects</ButtonLink>
              <ButtonLink href={site.cvPath} variant="secondary" download>
                <DownloadIcon className="h-5 w-5" />
                Download CV
              </ButtonLink>
            </div>
          </div>

          <div className="rounded-2xl border border-line bg-surface p-6 sm:p-8">
            <div className="flex items-center gap-4">
              <div
                className="flex h-14 w-14 shrink-0 items-center justify-center rounded-full bg-accent font-display text-xl font-semibold text-on-accent"
                aria-hidden="true"
              >
                {site.initials}
              </div>
              <div>
                <p className="font-medium">{site.location}</p>
                <p className="text-sm text-muted">{certifications[0]}</p>
              </div>
            </div>
            <div className="mt-6">
              <ControlChart />
            </div>
            <p className="mt-4 text-sm text-muted">
              Process control habits from the fab, applied to business data.
            </p>
          </div>
        </div>
      </Container>
    </section>
  );
}
__EOF__
echo "wrote src/components/Hero.tsx"
mkdir -p "src/components"
cat > "src/components/Navbar.tsx" <<'__EOF__'
"use client";

import { useEffect, useState } from "react";
import ButtonLink from "@/components/ButtonLink";
import { CloseIcon, DownloadIcon, MenuIcon } from "@/components/icons";
import { site } from "@/data/site";

const links = [
  { label: "Home", href: "#home" },
  { label: "About", href: "#about" },
  { label: "Projects", href: "#projects" },
  { label: "Contact", href: "#contact" },
];

export default function Navbar() {
  const [open, setOpen] = useState(false);

  // Close the mobile menu with the Escape key.
  useEffect(() => {
    if (!open) return;
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === "Escape") setOpen(false);
    };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [open]);

  return (
    <header className="sticky top-0 z-50 border-b border-line bg-canvas/85 backdrop-blur">
      <div className="mx-auto flex h-16 w-full max-w-6xl items-center justify-between px-5 sm:px-8">
        <a href="#home" className="font-display text-lg font-semibold tracking-tight">
          {site.name}
        </a>

        <nav aria-label="Main" className="hidden items-center gap-8 md:flex">
          <ul className="flex items-center gap-8">
            {links.map((link) => (
              <li key={link.href}>
                <a
                  href={link.href}
                  className="text-muted transition-colors hover:text-ink"
                >
                  {link.label}
                </a>
              </li>
            ))}
          </ul>
          <ButtonLink href={site.cvPath} variant="secondary" size="sm" download>
            <DownloadIcon className="h-4 w-4" />
            Download CV
          </ButtonLink>
        </nav>

        <button
          type="button"
          className="inline-flex h-10 w-10 items-center justify-center rounded-lg border border-line text-ink transition-colors hover:border-accent md:hidden"
          aria-expanded={open}
          aria-controls="mobile-menu"
          aria-label={open ? "Close menu" : "Open menu"}
          onClick={() => setOpen((value) => !value)}
        >
          {open ? <CloseIcon /> : <MenuIcon />}
        </button>
      </div>

      {open ? (
        <nav
          id="mobile-menu"
          aria-label="Mobile"
          className="border-t border-line bg-canvas md:hidden"
        >
          <ul className="mx-auto flex max-w-6xl flex-col px-5 py-3 sm:px-8">
            {links.map((link) => (
              <li key={link.href}>
                <a
                  href={link.href}
                  onClick={() => setOpen(false)}
                  className="block rounded-lg px-2 py-3 text-lg text-ink transition-colors hover:text-accent"
                >
                  {link.label}
                </a>
              </li>
            ))}
            <li className="py-3">
              <ButtonLink
                href={site.cvPath}
                variant="secondary"
                download
                className="w-full"
              >
                <DownloadIcon className="h-5 w-5" />
                Download CV
              </ButtonLink>
            </li>
          </ul>
        </nav>
      ) : null}
    </header>
  );
}
__EOF__
echo "wrote src/components/Navbar.tsx"
mkdir -p "src/components"
cat > "src/components/ProjectCard.tsx" <<'__EOF__'
import Image from "next/image";
import ButtonLink from "@/components/ButtonLink";
import type { Project } from "@/data/projects";

export default function ProjectCard({ project }: { project: Project }) {
  return (
    <article className="flex flex-col overflow-hidden rounded-2xl border border-line bg-surface transition-colors hover:border-accent">
      <div className="relative aspect-[16/9] bg-surface-2">
        {project.image ? (
          <Image
            src={project.image}
            alt={project.imageAlt ?? project.title}
            fill
            sizes="(min-width: 768px) 50vw, 100vw"
            className="object-cover"
          />
        ) : (
          <div className="flex h-full w-full items-center justify-center p-6 text-center text-sm text-muted">
            Screenshot placeholder. Add an image to public/projects.
          </div>
        )}
      </div>

      <div className="flex flex-1 flex-col p-6">
        <div className="flex items-start justify-between gap-4">
          <h3 className="font-display text-xl font-semibold">{project.title}</h3>
          <span className="shrink-0 rounded-full border border-line px-3 py-0.5 text-sm text-muted">
            {project.status}
          </span>
        </div>

        <p className="mt-3 text-muted">{project.problem}</p>
        <p className="mt-3">{project.result}</p>

        <ul className="mt-4 flex flex-wrap gap-2">
          {project.tools.map((tool) => (
            <li
              key={tool}
              className="rounded-full border border-line bg-surface-2 px-3 py-1 text-sm"
            >
              {tool}
            </li>
          ))}
        </ul>

        <div className="mt-6 flex flex-wrap gap-3 pt-2">
          {project.links.map((link) => (
            <ButtonLink
              key={link.label}
              href={link.href}
              variant="secondary"
              size="sm"
            >
              {link.label}
            </ButtonLink>
          ))}
        </div>
      </div>
    </article>
  );
}
__EOF__
echo "wrote src/components/ProjectCard.tsx"
mkdir -p "src/components"
cat > "src/components/Projects.tsx" <<'__EOF__'
import Container from "@/components/Container";
import ProjectCard from "@/components/ProjectCard";
import SectionHeading from "@/components/SectionHeading";
import { projects } from "@/data/projects";

export default function Projects() {
  return (
    <section
      id="projects"
      aria-labelledby="projects-title"
      className="scroll-mt-16 border-t border-line py-20 sm:py-28"
    >
      <Container>
        <SectionHeading
          id="projects-title"
          title="Projects"
          description="Each project starts with a business question and ends with something a decision maker can use."
        />
        <div className="mt-12 grid gap-6 md:grid-cols-2">
          {projects.map((project) => (
            <ProjectCard key={project.slug} project={project} />
          ))}
        </div>
      </Container>
    </section>
  );
}
__EOF__
echo "wrote src/components/Projects.tsx"
mkdir -p "src/components"
cat > "src/components/SectionHeading.tsx" <<'__EOF__'
type SectionHeadingProps = {
  id: string;
  title: string;
  description?: string;
};

export default function SectionHeading({ id, title, description }: SectionHeadingProps) {
  return (
    <div className="max-w-2xl">
      <h2
        id={id}
        className="font-display text-3xl font-semibold tracking-tight sm:text-4xl"
      >
        {title}
      </h2>
      {description ? <p className="mt-3 text-lg text-muted">{description}</p> : null}
    </div>
  );
}
__EOF__
echo "wrote src/components/SectionHeading.tsx"
mkdir -p "src/components"
cat > "src/components/icons.tsx" <<'__EOF__'
// Small inline icons, so the site needs no icon package.

type IconProps = { className?: string };

const base = {
  width: 20,
  height: 20,
  viewBox: "0 0 24 24",
  "aria-hidden": true,
  focusable: false,
} as const;

export function MailIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <rect x="3" y="5" width="18" height="14" rx="2" />
      <path d="m3 7 9 6 9-6" />
    </svg>
  );
}

export function LinkedInIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="currentColor">
      <path d="M20.45 20.45h-3.56v-5.57c0-1.33-.03-3.04-1.85-3.04-1.86 0-2.14 1.45-2.14 2.94v5.67H9.34V9h3.41v1.56h.05c.48-.9 1.64-1.85 3.37-1.85 3.6 0 4.27 2.37 4.27 5.46v6.28ZM5.34 7.43a2.06 2.06 0 1 1 0-4.12 2.06 2.06 0 0 1 0 4.12ZM7.12 20.45H3.56V9h3.56v11.45Z" />
    </svg>
  );
}

export function GitHubIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="currentColor">
      <path d="M12 .5a11.5 11.5 0 0 0-3.64 22.41c.58.1.79-.25.79-.56v-2c-3.2.7-3.88-1.37-3.88-1.37-.52-1.33-1.28-1.69-1.28-1.69-1.05-.71.08-.7.08-.7 1.15.08 1.76 1.19 1.76 1.19 1.03 1.76 2.7 1.25 3.36.96.1-.75.4-1.25.73-1.54-2.55-.29-5.24-1.28-5.24-5.69 0-1.26.45-2.28 1.18-3.09-.12-.29-.51-1.46.11-3.05 0 0 .97-.31 3.17 1.18a11 11 0 0 1 5.78 0c2.2-1.49 3.17-1.18 3.17-1.18.63 1.59.23 2.76.11 3.05.74.81 1.18 1.83 1.18 3.09 0 4.42-2.69 5.39-5.25 5.68.41.36.78 1.06.78 2.14v3.17c0 .31.21.67.8.56A11.5 11.5 0 0 0 12 .5Z" />
    </svg>
  );
}

export function DownloadIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round" strokeLinejoin="round">
      <path d="M12 4v11" />
      <path d="m7 11 5 5 5-5" />
      <path d="M5 20h14" />
    </svg>
  );
}

export function MenuIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round">
      <path d="M4 7h16M4 12h16M4 17h16" />
    </svg>
  );
}

export function CloseIcon({ className }: IconProps) {
  return (
    <svg {...base} className={className} fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round">
      <path d="M6 6l12 12M18 6 6 18" />
    </svg>
  );
}
__EOF__
echo "wrote src/components/icons.tsx"
mkdir -p "src/data"
cat > "src/data/experience.ts" <<'__EOF__'
// Sample content: check the job titles, dates, and bullet points,
// then add real results (numbers help recruiters).

export type Job = {
  role: string;
  company: string;
  period: string;
  points: string[];
};

export const experience: Job[] = [
  {
    role: "Process Engineer, STI CMP module",
    company: "GlobalFoundries Fab7, Singapore",
    period: "Add dates",
    points: [
      "Supported the STI CMP module in a high-volume semiconductor fab.",
      "Reviewed process and tool data to spot drift and support yield decisions.",
      "Worked with equipment and integration teams to resolve process issues.",
    ],
  },
  {
    role: "Asset Integrity Engineer",
    company: "DNV Malaysia",
    period: "Add dates",
    points: [
      "Worked on asset integrity management for industrial facilities.",
      "Organized inspection and condition data to support maintenance planning.",
      "Wrote reports that helped clients prioritize risk and maintenance work.",
    ],
  },
];

export const education = {
  school: "Universiti Sains Malaysia (USM)",
  program: "Chemical Engineering",
  note: "CGPA 3.61",
};

export const certifications: string[] = [
  "Lean Six Sigma Yellow Belt",
  "Google Data Analytics Professional Certificate",
];
__EOF__
echo "wrote src/data/experience.ts"
mkdir -p "src/data"
cat > "src/data/projects.ts" <<'__EOF__'
// To add a project, copy one block and edit it.
// Screenshot: save an image in public/projects/ (for example cost-of-living.png),
// then set  image: "/projects/cost-of-living.png"  and  imageAlt: "..."
// Links: replace "#" with the real GitHub or demo URL.
// Status: change "In progress" to "Complete" when a project is finished.

export type ProjectLink = {
  label: string;
  href: string;
};

export type Project = {
  slug: string;
  title: string;
  status: "In progress" | "Complete";
  problem: string;
  result: string;
  tools: string[];
  links: ProjectLink[];
  image?: string;
  imageAlt?: string;
};

export const projects: Project[] = [
  {
    slug: "cost-of-living-dashboard",
    title: "Malaysia Cost of Living Dashboard",
    status: "In progress",
    problem:
      "Which states and shopping channels feel food inflation the most, and where can households save?",
    result:
      "A Power BI dashboard on PriceCatcher data, with a one-page PDF report.",
    tools: ["Excel", "Power Query", "Power BI"],
    links: [{ label: "View on GitHub", href: "#" }],
  },
  {
    slug: "pricecatcher-pipeline",
    title: "PriceCatcher Data Pipeline",
    status: "In progress",
    problem:
      "How can public retail price data become a clean, tested, analysis-ready warehouse table?",
    result:
      "An end-to-end pipeline with ingestion, transformation, quality checks, and analytics layers.",
    tools: ["Python", "SQL", "BigQuery"],
    links: [{ label: "View on GitHub", href: "#" }],
  },
  {
    slug: "nba-stats-pipeline",
    title: "NBA Player Trends Pipeline",
    status: "In progress",
    problem:
      "Which players show sustainable production and a growing role before a breakout gets noticed?",
    result:
      "A daily-refreshed pipeline and Power BI dashboard tracking hot and cold streaks and role changes.",
    tools: ["Python", "nba_api", "Power BI"],
    links: [{ label: "View on GitHub", href: "#" }],
  },
  {
    slug: "motosound-sense",
    title: "MotoSound Sense",
    status: "In progress",
    problem:
      "Can a motorcycle's engine sound point a rider toward the likely mechanical issue?",
    result:
      "A web app for recording, trimming, and analyzing engine sound clips.",
    tools: ["Lovable", "Audio analysis"],
    links: [
      { label: "View live demo", href: "#" },
      { label: "View on GitHub", href: "#" },
    ],
  },
];
__EOF__
echo "wrote src/data/projects.ts"
mkdir -p "src/data"
cat > "src/data/site.ts" <<'__EOF__'
// Edit this file to change your name, links, and contact details.
// Every component reads from here, so you only change things once.

export const site = {
  name: "Ariffin Samsu",
  initials: "AS",
  title: "Data Analyst | Chemical Engineer",
  seoTitle: "Ariffin Samsu, Data Analyst and Chemical Engineer",
  availability: "Open to data analyst roles",
  tagline:
    "I turn process and operational data into decisions with SQL, Python, Excel, and Power BI.",
  location: "Kuala Lumpur, Malaysia",
  bio: "I am a chemical engineer turned data analyst with three years of experience in semiconductor process engineering and asset integrity management. I use SQL, Python, Excel, and Power BI to turn operational data into decisions. I am looking for a data analyst role where engineering discipline and analytics work together.",

  email: "m.ariffin211@gmail.com",
  linkedin: "https://www.linkedin.com/in/mm-ariffin11",
  // TODO: replace with your own GitHub profile URL.
  github: "https://github.com/",

  // The CV file lives in public/cv/. Replace the PDF there and keep this name.
  cvPath: "/cv/Ariffin-Samsu-CV.pdf",

  // TODO: update after you deploy to Vercel. Used for SEO and link previews.
  url: "https://ariffin-portfolio.vercel.app",
  description:
    "Portfolio of Ariffin Samsu, a data analyst and chemical engineer in Kuala Lumpur. SQL, Python, Excel, and Power BI projects built on real datasets.",
};
__EOF__
echo "wrote src/data/site.ts"
mkdir -p "src/data"
cat > "src/data/skills.ts" <<'__EOF__'
export type SkillGroup = {
  name: string;
  items: string[];
};

export const skillGroups: SkillGroup[] = [
  {
    name: "Data analysis",
    items: [
      "SQL",
      "Python",
      "Excel",
      "Power Query",
      "Power BI",
      "Data cleaning",
      "Dashboards",
    ],
  },
  {
    name: "Engineering",
    items: [
      "Process engineering",
      "Asset integrity management",
      "Semiconductor manufacturing",
      "Lean Six Sigma",
    ],
  },
  {
    name: "Workflow",
    items: ["GitHub", "Data pipelines", "Scheduled automation"],
  },
];
__EOF__
echo "wrote src/data/skills.ts"

# The starter favicon would clash with the new icon.svg.
rm -f src/app/favicon.ico
echo ""
echo "Done. Now run: npm run dev"
