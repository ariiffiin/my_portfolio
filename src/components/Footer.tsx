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
