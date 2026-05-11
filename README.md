# Lakshyaraj Singh Rao — LaTeX Resume

Professional resume built with LaTeX + GitHub Actions. No local LaTeX installation needed.

**Live:** [github.com/ykstorm/resume](https://github.com/ykstorm/resume)

---

## Edit & Build

1. Edit `lakshyaraj_resume.tex`
2. Push to `main` → GitHub Actions auto-runs `xelatex` and outputs `resume.pdf`
3. Download from: `github.com/ykstorm/resume/actions`

---

## What This Is

A clean, professional LaTeX resume using the standard `article` class. Two-column skills section, blue accent (#2563EB), MIT license on all projects. ATS-safe format.

---

## Tech Stack

- **LaTeX** — xelatex via `blang/latex:ubuntu` Docker image
- **GitHub Actions** — auto-compile on push
- **fontspec** — system fonts (Helvetica Neue / Arial fallback)
- **multicol** — two-column skills layout

---

## Sections

- Summary
- Skills (2-column)
- Open Source Projects (5 projects, all MIT licensed)
- Experience (Homesty.ai)
- Education

---

*Last updated: 2026-05-11*