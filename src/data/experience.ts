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
    period: "Oct 2022 - Aug 2024",
    points: [
      "Supported the STI CMP module in a high-volume semiconductor fab.",
      "Reviewed process and tool data to spot drift and support yield decisions.",
      "Worked with equipment and integration teams to resolve process issues.",
    ],
  },
  {
    role: "Asset Integrity Engineer",
    company: "DNV Malaysia",
    period: "Nov 2024 - Feb 2026",
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
