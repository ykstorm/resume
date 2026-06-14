# Lakshyaraj Singh Rao — Resume

Resume source, written in [Typst](https://typst.app). GitHub Actions compiles it
to `resume.pdf` on every push to `main` and commits the PDF back to the repo, so
the latest PDF is always in the tree.

**Download:** [`resume.pdf`](resume.pdf) · or grab the artifact from the
[Actions tab](https://github.com/ykstorm/resume/actions/workflows/build.yml).

---

## Edit + build

1. Edit `resume.typ`.
2. Push to `main`.
3. Actions installs the Typst binary, runs `typst compile resume.typ resume.pdf`,
   uploads the PDF as an artifact, and commits it back to the repo.

No local toolchain required.

Local build, if you want it:

```bash
# one-shot
typst compile resume.typ resume.pdf

# live preview while editing
typst watch resume.typ
```

Install Typst from [github.com/typst/typst](https://github.com/typst/typst) or
`brew install typst` / `winget install Typst.Typst`.

---

## What's in the resume

- Summary — backend engineer, AI infrastructure, DevOps
- Skills — tagged, grouped by area
- Open source — anchor, tripwire, goldset, quickdraw, stackup, codecraft-ai (all Apache 2.0)
- Experience — sole engineer on Homesty.ai
- Education — Manipal University Jaipur, B.Tech Computer Science, graduating 2026

---

## Stack

- **Typst** — `typst compile`, `us-letter`, Liberation Sans / DejaVu fonts via `#set text`
- **GitHub Actions** — `.github/workflows/build.yml`, triggers on push to `main`/`master`
- Single-column flow so ATS parsers read it cleanly

---

## License

Content (the resume itself): all rights reserved.
Build pipeline (workflow + Typst config): MIT.
