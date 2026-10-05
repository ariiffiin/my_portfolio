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
