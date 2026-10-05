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
