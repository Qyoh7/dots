# markdown.css

This repository contains a collection of CSS stylesheets for rendering markdown
files as pretty PDFs via Pandoc/WeasyPrint.

To render a markdown file with the Beryl theme using Pandoc:

```shell
pandoc --pdf-engine weasyprint --css ./themes/beryl.css -o output.pdf input.md
```

*WeasyPrint is the default PDF engine as of Pandoc 3.4. If you're running
Pandoc 3.4 or higher, you can omit the `--pdf-engine weasyprint` parameter.*

## Themes

Below are examples of each theme provided in this repository.

### Beryl

- [Headings, inline markup, blockquotes, lists](./examples/beryl-typography.png)
- [Code blocks, tables](./examples/beryl-data.png)
- [Callouts](./examples/beryl-callouts.png)

### Stain

- [Headings, inline markup, blockquotes, lists](./examples/stain-typography.png)
- [Code blocks, tables](./examples/stain-data.png)

### Mark

- [Headings, inline markup, blockquotes, lists](./examples/mark-typography.png)
- [Code blocks, tables](./examples/mark-data.png)

### Lotus

- [Headings, inline markup, blockquotes, lists](./examples/lotus-typography.png)
- [Code blocks, tables](./examples/lotus-data.png)

## Callouts

The Beryl theme supports callouts, implemented entirely in CSS.

- [Markdown syntax example](./examples/beryl-callouts.md)
- [Generated PDF example](./examples/beryl-callouts.png)

## Page layout

These stylesheets use US Letter size pages by default. You can configure the
page size and margins by modifying the `@page` rule near the top of each CSS
file.

To use A4 size pages instead:

```css
@page {
  size: A4;
  margin: 0.5in;
  background-color: var(--bg-color);
}
```

## Generating examples

The example images in this repo are generated using the
[Nushell](https://www.nushell.sh/) script
[./render-examples.nu](./render-examples.nu).
