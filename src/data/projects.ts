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
