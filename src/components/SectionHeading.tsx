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
