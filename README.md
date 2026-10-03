# Resume

Source for my resume, written in [Typst](https://typst.app). A GitHub Actions
workflow compiles `resume.typ` on every push to `master` and commits the
resulting `resume.pdf` back to the repository, so the PDF in the tree is always
built from the current source.

Download: [resume.pdf](resume.pdf)

## Editing

1. Edit `resume.typ`.
2. Push to `master`. The workflow installs Typst, runs
   `typst compile resume.typ resume.pdf`, uploads the PDF as a build artifact,
   and commits it.

To build locally, install Typst (`brew install typst`,
`winget install Typst.Typst`, or a release from
[github.com/typst/typst](https://github.com/typst/typst)) and run:

```bash
typst compile resume.typ resume.pdf
```

`typst watch resume.typ` rebuilds on save while editing.

## Contents

Summary, experience at Homesty.ai, four projects (Anvil, Anchor, Tripwire,
Stackup), skills, and education. Single column, US letter, one page. The
fonts are Liberation Sans with DejaVu Sans as the fallback; both ship with
the Ubuntu runner the workflow uses.

## License

The resume text is all rights reserved. The build setup (workflow and Typst
layout) is MIT.
