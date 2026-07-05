#set page(paper: "us-letter", margin: (x: 0.45in, y: 0.34in))
#set text(font: ("Liberation Sans", "DejaVu Sans"), size: 8.0pt)
#set par(justify: true, leading: 0.4em)

#let accent = rgb("#1a73e8")
#let muted = rgb("#666666")
#let tag-fill = rgb("#f0f4f8")
#let tag-stroke = rgb("#d9e1ec")

#show heading.where(level: 2): it => block(below: 0.2em, above: 0.32em)[
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
    #text(size: 22pt, weight: "bold")[#link("https://lakshyaraj-dev.vercel.app")[Lakshyaraj Singh Rao]] \
    #v(0.04em)
    #text(size: 10pt, fill: accent)[#link("https://github.com/ykstorm/anvil")[Backend Engineer] · #link("https://github.com/ykstorm/tripwire")[AI Infrastructure] · #link("https://codecraft-ai-tau.vercel.app")[Full-Stack] · #link("https://github.com/ykstorm/stackup")[DevOps]]
  ],
  [
    #text(size: 9pt, fill: muted)[
      Mumbai, India · Open to Bangalore / Remote \
      #link("https://homesty.ai")[homesty.ai] · #link("mailto:raolakshyaraj@gmail.com")[raolakshyaraj\u{40}gmail.com] \
      #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app] · #link("https://github.com/ykstorm")[GitHub] · #link("https://linkedin.com/in/lakshyaraj-singh-rao-840273152")[LinkedIn] · #link("https://www.npmjs.com/~ykstormsorg")[npm]
    ]
  ]
)

#v(0.4em)
#line(length: 100%, stroke: 0.6pt)

== Summary

I build the reliability layer that lets AI systems run in production without supervision — refusal when retrieval fails, abort when output goes off-script, eval-gating before merge, idempotency under webhook re-delivery. Co-Founder and sole engineer on Homesty.ai LLP since Nov 2025, serving real traffic on Next.js 15 + pgvector + GPT-4o. Four #link("https://www.npmjs.com/~ykstormsorg")[\u{40}ykstormsorg] npm packages (one with SLSA provenance) and a public #link("https://github.com/marketplace/actions/goldset-ai-eval-gate")[GitHub Marketplace Action] — extracted from what production actually broke.

== Experience

#project-header(link("https://homesty.ai")[Homesty.ai LLP], "Co-Founder & Founding Engineer") · Remote · Nov 2025 – Present
- Sole engineer on a live buyer-side real-estate AI: Next.js 15, Postgres + pgvector, Prisma, GPT-4o and Claude streaming, behind rate limiting, intent routing, and Sentry. Built the chat path around refusal-first retrieval and a mid-stream guardrail — the AI declines when it has no grounded source rather than improvising, which in real estate is a liability, not a UX choice. Both patterns were hardened into standalone OSS (Anchor, Tripwire).
#h(0pt) #tag[Next.js 15] #tag[Postgres + pgvector] #tag[Prisma 7] #tag[GPT-4o] #tag[Claude] #tag[Sentry] #tag[Docker]

== Projects

#project-header("Anchor", "Creator") · #link("https://anchor-iota-ten.vercel.app/playground")[anchor-iota-ten.vercel.app/playground]
- Every RAG demo breaks when retrieval finds nothing useful — the AI just makes things up. *Anchor is the RAG layer that refuses instead of guessing: above the similarity floor it returns chunks with provenance; below, it returns `refused: true`.* Built into a real-estate production app where a hallucination is a lawsuit. Live playground; **p50 2.6 ms retrieval at 100k vectors** (HNSW), measured in CI.
#h(0pt) #tag[Postgres + pgvector] #tag[Prisma 7] #tag[Next.js 15] #tag[OpenAI embeddings]
#v(0.06em)
#project-header("Codecraft", "Creator") · #link("https://codecraft-ai-tau.vercel.app")[codecraft-ai-tau.vercel.app]
- "Try-it" links die when users have to install Node and clone the repo. *Codecraft runs a real Vite + React dev server inside the browser tab — edit code in Monaco, type `npm install dayjs` in the terminal, watch the preview hot-reload in under 2 seconds.* No backend, no install; the COOP/COEP cross-origin-isolation boundary unlocks `SharedArrayBuffer`, and an IndexedDB snapshot cache drops repeat-visit boots under 20s.
#h(0pt) #tag[WebContainers] #tag[Monaco] #tag[xterm] #tag[Vite] #tag[COOP/COEP]
#v(0.06em)
#project-header("Anvil", "Creator") · #link("https://github.com/ykstorm/anvil")[github.com/ykstorm/anvil]
- Stripe sends the same webhook three times when the internet hiccups, and your worker double-charges users. *Anvil is the dedup + retry + dead-letter pipeline that handles every webhook source (Stripe, GitHub, Twilio) so your worker never repeats.* `\u{40}ykstormsorg/anvil` v0.1.1 on npm with SLSA provenance; Terraform module + Helm chart. **~10.5k req/s ingress, constant-time HMAC verify (0.9% timing delta)** — measured in CI.
#h(0pt) #tag[TypeScript] #tag[BullMQ] #tag[Redis] #tag[Express] #tag[Terraform] #tag[Helm]
#v(0.06em)
#project-header("Tripwire", "Creator") · #link("https://github.com/ykstorm/tripwire")[github.com/ykstorm/tripwire]
- Once an LLM token reaches the user it's already wrong — post-hoc moderation runs after the damage. *Tripwire watches each token mid-stream and kills the response on rule trip: PII leaks, prompt-injection, fabricated facts.* Drop in as an OpenAI-compatible proxy (one URL change) or a library — **~4.7 µs per chunk** (measured in CI), zero buffering on the happy path. `\u{40}ykstormsorg/tripwire` v1.1.0 on npm + Docker at `ghcr.io/ykstorm/tripwire`.
#h(0pt) #tag[TypeScript] #tag[Node async iterators] #tag[streaming abort] #tag[Docker]
#v(0.06em)
#project-header("Goldset", "Creator · Maintainer") · #link("https://github.com/ykstorm/goldset")[github.com/ykstorm/goldset]
- "Did my prompt change break anything?" — today you eyeball outputs in a notebook and ship a guess. *Goldset is CI for AI: three eval runners (golden answers, LLM judge, structural assertions) run on every PR, post a delta-vs-base comment, and block merge on regression.* `\u{40}ykstormsorg/goldset` v0.2.4 on npm + GitHub Marketplace; deterministic runners clear **1k cases in ~3 ms**, so the gate never blocks a PR.
#h(0pt) #tag[TypeScript] #tag[esbuild] #tag[OpenAI] #tag[Anthropic] #tag[GitHub Actions]
#v(0.06em)
#project-header("Stackup", "Creator") · #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]
- Production Kubernetes patterns cost \$200+/month on cloud, and most "K8s tutorials" stop at `kubectl run nginx`. *Stackup runs the full production stack on your laptop in ~15 minutes: ArgoCD GitOps app-of-apps, Argo Rollouts canary with real Prometheus success-rate analysis, kube-prometheus-stack monitoring.* **Canary verified live: 25→50→75→100% with the ≥0.95 analysis gate passing 3×.**
#h(0pt) #tag[Kubernetes] #tag[ArgoCD] #tag[Helm] #tag[kind] #tag[Grafana]
#v(0.06em)
#project-header("Quickdraw", "Creator") · #link("https://github.com/ykstorm/quickdraw")[github.com/ykstorm/quickdraw]
- Every AI provider claims to be "fastest" — but fast on what prompts, what network, what time of day? *Quickdraw measures real LLM streaming on your prompts: TTFT, tokens/sec, p50/p95/p99, and cost per 1K across OpenAI + Anthropic.* `quickdraw diff` catches regressions between nightly runs. `\u{40}ykstormsorg/quickdraw` v1.0.3 on npm with SLSA build provenance.
#h(0pt) #tag[TypeScript] #tag[OpenAI] #tag[Anthropic] #tag[CLI]

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

== Education

*Manipal University Jaipur* — B.Tech, Computer Science · Graduating 2026 \
#text(size: 8pt, fill: muted)[Coursework: Distributed Systems · Database Internals · Networks · Machine Learning Foundations.] \
*Devagiri CMI Public School*, Calicut — CBSE Class XII, 84% \
*Vidya Kendra*, Calicut — CBSE Class X, 94%