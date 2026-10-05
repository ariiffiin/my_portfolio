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
