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
