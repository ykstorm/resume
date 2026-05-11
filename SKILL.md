# resume-latex — LaTeX Resume Writing Skill

## Overview
Build professional LaTeX resumes using GitHub Actions + blang/latex Docker image. No local LaTeX installation needed. Push `.tex` file → GitHub Actions auto-compiles PDF.

## Quick Start

### 1. Write your resume
Edit `lakshyaraj_resume.tex` in the repo.

### 2. Push to GitHub
```bash
git add -A && git commit -m "chore: update resume" && git push
```
GitHub Actions auto-runs `xelatex` twice (needed for ToC/cross-refs) and outputs `lakshyaraj_resume.pdf`.

### 3. Download the PDF
- Go to: `github.com/ykstorm/resume/actions`
- Click latest workflow run → Artifacts → resume.pdf

---

## Template Structure

```
resume-latex/
├── lakshyaraj_resume.tex      # Main .tex file (edit this)
├── .github/
│   └── workflows/
│       └── build.yml          # CI: xelatex compile
└── README.md
```

---

## LaTeX Key Concepts

### Classes
- `\documentclass[11pt, a4paper]{article}` — standard resume class
- `article` = clean, minimal, ATS-friendly

### Packages (loaded in preamble)
```latex
\usepackage[T1]{fontenc}                    % Font encoding
\usepackage[utf8]{inputenc}                 % UTF-8 support
\usepackage[margin=1.4cm]{geometry}         % Page margins
\usepackage{enumitem}                       % Bullet list control
\usepackage[hidelinks]{hyperref}            % Clickable links
\usepackage{xcolor}                         % Color support
\usepackage{fancyhdr}                       % Header/footer
\usepackage{fontspec}                       % Custom fonts (xelatex)
\usepackage{multicol}                        % Multi-column layout
\usepackage{microtype}                     % Typography fine-tuning
```

### Custom Commands (defined in template)
```latex
\resumeSection{Section Name}   % Blue uppercase section header with rule below
\contact{text}                  % Gray contact line
```

### Colors (customizable)
```latex
\definecolor{primary}{HTML}{2563EB}    % blue-600 (accent color)
\definecolor{darktext}{HTML}{1E293B}   % slate-800 (body text)
\definecolor{lighttext}{HTML}{64748B}  % slate-500 (secondary text)
\definecolor{border}{HTML}{E2E8F0}     % slate-200 (rules/lines)
```

### Fonts (xelatex)
```latex
\setmainfont{Helvetica Neue}
\setsansfont{Helvetica Neue}
```
For fallback: `Arial`, `TeX Gyre Heros`, or system fonts.

---

## Section Pattern

```latex
\section*{SECTION NAME}     % non-numbered section
\hline                        % horizontal rule below heading
\begin{itemize}
  \item Bullet content here
\end{itemize}
```

### Itemize customization
```latex
\setlist{itemsep=0pt, topsep=3pt, leftmargin=14pt, label=\textbullet}
```

---

## Common Fixes

### URLs
```latex
\url{https://example.com}    % clickable URL
```
For email: `\hrefmailto{raolakshyaraj@gmail.com}` (define custom command)

### Em-dashes (in source use ---)
```latex
\textemdash{} or --- in source
```

### Thin spaces
```latex
\quad  % em space
\;     % thin space
```

### Newlines in tabular
```latex
\\[4pt]  % line break with 4pt spacing
```

---

## GitHub Actions Workflow

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container: blang/latex:ubuntu
    steps:
      - uses: actions/checkout@v4
      - run: xelatex -halt-on-error -interaction=nonstopmode resume.tex
      - run: xelatex -halt-on-error -interaction=nonstopmode resume.tex  # twice for refs
      - uses: actions/upload-artifact@v4
        with:
          name: resume
          path: resume.pdf
```

**Why run twice:** First pass resolves ToC/label refs, second pass finalizes page numbers.

---

## Best Practices

1. **Use `pagenumbering{gobble}`** — removes page numbers (cleaner for resumes)
2. **Use `\pagenumbering{gobble}`** in preamble
3. **Two-column skills section** — saves vertical space
4. **Project links** — always include npm/GitHub/live URLs
5. **MIT License badge** — mention in each project block
6. **No page numbers** — cleaner for digital resumes
7. **UTF-8 encoding** — ensures special characters (·, —, ©) render correctly
8. ** ATS-safe** — use `\pdfgentounicode=1` (if using pdflatex), avoid tables/cross-refs

---

## References

- **posquit0/Awesome-CV** — most starred LaTeX resume template (27K stars)
  - GitHub: github.com/posquit0/Awesome-CV
  - Features: two-column layout, colored section headers, photo support
- **sb2nov/resume** — clean article class, MIT licensed, 6.6K stars
  - GitHub: github.com/sb2nov/resume
- **Deedy-Resume** — Harvard-format, open font, 5K stars
  - GitHub: github.com/deedy/Deedy-Resume

---

## Troubleshooting

| Error | Fix |
|-------|-----|
| `fontspec requires xelatex` | Use `blang/latex:ubuntu` container in CI |
| Missing glyphs | Use `T1` fontenc + `\usepackage[utf8]{inputenc}` |
| Page numbers showing | Add `\pagenumbering{gobble}` to preamble |
| Hyperlinks broken | Use `[hidelinks]` option with hyperref |
| Overflow text | Reduce margin or font size, use `\small` inside fbox |

---

## Version
Updated: 2026-05-11