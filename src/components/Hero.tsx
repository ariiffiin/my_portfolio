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
