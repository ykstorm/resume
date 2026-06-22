#set page(paper: "us-letter", margin: (x: 0.45in, y: 0.34in))
#set text(font: ("Liberation Sans", "DejaVu Sans"), size: 8.3pt)
#set par(justify: true, leading: 0.5em)

#let accent = rgb("#1a73e8")
#let muted = rgb("#666666")
#let tag-fill = rgb("#f0f4f8")
#let tag-stroke = rgb("#d9e1ec")

#show heading.where(level: 2): it => block(below: 0.3em, above: 0.5em)[
  #text(size: 10.5pt, weight: "bold", fill: accent, tracking: 0.8pt, upper(it.body))
  #v(-0.4em)
  #line(length: 100%, stroke: 0.5pt + accent)
]

#let tag(content) = box(
  inset: (x: 4pt, y: 1.5pt),
  outset: (y: 1pt),
  fill: tag-fill,
  stroke: 0.4pt + tag-stroke,
  radius: 2pt,
)[#text(size: 8pt, font: "DejaVu Sans Mono", fill: rgb("#334155"))[#content]]

#let project-header(name, role) = [
  *#name* #h(0.4em)
  #box(inset: (x: 5pt, y: 1pt), fill: rgb("#e8f1ff"), radius: 3pt)[
    #text(size: 8pt, fill: accent)[#role]
  ]
]

// ─── HEADER ──────────────────────────────────────────────────────────────
#grid(
  columns: (2fr, 1fr),
  align: (left + bottom, right + bottom),
  [
    #text(size: 22pt, weight: "bold")[Lakshyaraj Singh Rao] \
    #v(0.1em)
    #text(size: 10pt, fill: accent)[Backend Engineer · AI Infrastructure · Full-Stack · DevOps]
  ],
  [
    #text(size: 9pt, fill: muted)[
      Mumbai, India · Open to Bangalore / Remote \
      #link("mailto:raolakshyaraj@gmail.com")[raolakshyaraj\u{40}gmail.com] \
      #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app] · #link("https://github.com/ykstorm")[GitHub] · #link("https://linkedin.com/in/lakshyaraj-singh-rao-840273152")[LinkedIn] · #link("https://www.npmjs.com/~ykstormsorg")[npm]
    ]
  ]
)

#v(0.4em)
#line(length: 100%, stroke: 0.6pt)

== Summary

I build the reliability layer that lets AI systems run in production without supervision — refusal when retrieval fails, abort when output goes off-script, eval-gating before merge, idempotency under webhook re-delivery. Co-Founder and sole engineer on Homesty.ai LLP since Nov 2025, serving real traffic on Next.js 15 + pgvector + GPT-4o. Four #link("https://www.npmjs.com/~ykstormsorg")[\u{40}ykstormsorg] npm packages (one with SLSA provenance) and a public #link("https://github.com/marketplace/actions/goldset")[GitHub Marketplace Action] — extracted from what production actually broke.

== Technical Skills

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1.2em,
  [
    *Languages* \
    TypeScript · JavaScript \
    Python · SQL \
    Rust (learning)
  ],
  [
    *Backend / Data* \
    Node.js · Express · Next.js \
    PostgreSQL · pgvector \
    Prisma 7 · Redis · BullMQ
  ],
  [
    *Infra / AI* \
    Docker · Kubernetes · Helm \
    Terraform · GitHub Actions · Vercel \
    OpenAI · Anthropic · Ollama
  ]
)

== Open-Source Projects

#project-header("Anvil", "Creator") · #link("https://github.com/ykstorm/anvil")[github.com/ykstorm/anvil]
- Stripe sends the same webhook three times when the internet hiccups, and your worker double-charges users. *Anvil is the dedup + retry + dead-letter pipeline that handles every webhook source (Stripe, GitHub, Twilio) so your worker never repeats.*
- Drop-in library, `\u{40}ykstormsorg/anvil` v0.1.0 on npm with build provenance. Ships a Terraform module for production and a Helm chart for Kubernetes. Five design contracts proven by tests in CI.
#h(0pt) #tag[TypeScript] #tag[BullMQ] #tag[Redis] #tag[Express] #tag[Terraform] #tag[Helm]
#v(0.1em)
#project-header("Goldset", "Creator · Maintainer") · #link("https://github.com/ykstorm/goldset")[github.com/ykstorm/goldset]
- "Did my prompt change break anything?" — today you eyeball outputs in a notebook and ship a guess. *Goldset is CI for AI: three eval runners (golden answers, LLM judge, structural assertions) run on every PR, post a delta-vs-base comment, and block merge on regression.*
- Pluggable OpenAI / Anthropic judge. Published as `\u{40}ykstormsorg/goldset` v0.2.0 on npm + GitHub Marketplace.
#h(0pt) #tag[TypeScript] #tag[esbuild] #tag[OpenAI] #tag[Anthropic] #tag[GitHub Actions]
#v(0.1em)
#project-header("Anchor", "Creator") · #link("https://anchor-iota-ten.vercel.app/playground")[anchor-iota-ten.vercel.app/playground]
- Every RAG demo breaks when retrieval finds nothing useful — the AI just makes things up. *Anchor is the RAG layer that refuses instead of guessing: above the similarity floor it returns chunks with provenance; below, it returns `refused: true`.*
- Built into a real-estate production app where a hallucination is a lawsuit. Live playground, one-command Docker setup.
#h(0pt) #tag[Postgres + pgvector] #tag[Prisma 7] #tag[Next.js 15] #tag[OpenAI embeddings]

#v(0.1em)
#project-header("Tripwire", "Creator") · #link("https://github.com/ykstorm/tripwire")[github.com/ykstorm/tripwire]
- Once an LLM token reaches the user it's already wrong — post-hoc moderation runs after the damage. *Tripwire watches each token mid-stream and kills the response on rule trip: PII leaks, prompt-injection, fabricated facts.*
- Drop in as an OpenAI-compatible proxy (change one URL) or import as a library. Sub-millisecond per chunk; zero buffering on the happy path. Published as `\u{40}ykstormsorg/tripwire` on npm.
#h(0pt) #tag[TypeScript] #tag[Node async iterators] #tag[streaming abort]

#v(0.1em)
#project-header("Quickdraw", "Creator") · #link("https://github.com/ykstorm/quickdraw")[github.com/ykstorm/quickdraw]
- Every AI provider claims to be "fastest" — but fast on what prompts, what network, what time of day? *Quickdraw measures real LLM streaming on your prompts: TTFT, tokens/sec, p50/p95/p99, and cost per 1K across OpenAI + Anthropic.* `quickdraw diff` catches regressions between nightly runs. Published as `\u{40}ykstormsorg/quickdraw` v1.0.2 on npm with SLSA build provenance.
#h(0pt) #tag[TypeScript] #tag[OpenAI] #tag[Anthropic] #tag[CLI]

#v(0.1em)
#project-header("Stackup", "Creator") · #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]
- Production Kubernetes patterns cost \$200+/month on cloud, and most "K8s tutorials" stop at `kubectl run nginx`. *Stackup runs the full production stack on your laptop in ~15 minutes: ArgoCD GitOps app-of-apps, Argo Rollouts canary with real Prometheus success-rate analysis, kube-prometheus-stack monitoring.* Real progressive delivery, free.
#h(0pt) #tag[Kubernetes] #tag[ArgoCD] #tag[Helm] #tag[kind] #tag[Grafana]

#v(0.1em)
#project-header("Codecraft", "Creator") · #link("https://codecraft-ai-tau.vercel.app")[codecraft-ai-tau.vercel.app]
- "Try-it" links die when users have to install Node, clone the repo, and run `npm install`. *Codecraft runs a real Vite + React dev server inside the browser tab — edit code in Monaco, type `npm install dayjs` in the terminal, watch the preview hot-reload in under 2 seconds.* No backend, no install; the COOP/COEP cross-origin-isolation boundary unlocks `SharedArrayBuffer`, and an IndexedDB snapshot cache drops repeat-visit boots under 20s.
#h(0pt) #tag[WebContainers] #tag[Monaco] #tag[xterm] #tag[Vite] #tag[COOP/COEP]

== Experience

#project-header("Homesty.ai LLP", "Co-Founder & Sole Engineer") · Remote · Nov 2025 – Present
- Sole engineer on a live buyer-side real-estate AI: Next.js 15, Postgres + pgvector, Prisma, GPT-4o and Claude streaming, behind rate limiting, intent routing, and Sentry.
- Built the chat path around refusal-first retrieval and a mid-stream guardrail — the AI declines when it has no grounded source rather than improvising, which in real estate is a liability, not a UX choice. Both patterns were hardened into standalone OSS (Anchor, Tripwire).
#h(0pt) #tag[Next.js 15] #tag[Postgres + pgvector] #tag[Prisma 7] #tag[GPT-4o] #tag[Claude] #tag[Sentry] #tag[Docker]

== Education

*Manipal University Jaipur* — B.Tech, Computer Science · Graduating 2026 \
CMI Public School, Calicut (CBSE XII, 84%) · Vidya Kendra, Calicut (CBSE X, 94%)

#place(bottom)[
  #align(center)[
    #text(size: 8pt, fill: muted)[
      Latest version: #link("https://github.com/ykstorm/resume")[github.com/ykstorm/resume] · Apache 2.0
    ]
  ]
]