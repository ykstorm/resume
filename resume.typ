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

Backend-focused engineer building production AI infrastructure. Four #link("https://www.npmjs.com/~ykstormsorg")[\u{40}ykstormsorg] npm packages (one with build provenance) and a public #link("https://github.com/marketplace/actions/goldset")[GitHub Marketplace Action]. Patterns from a solo production AI deployment, extracted into seven open-source repos: RAG, LLM safety, eval, benchmarking, Kubernetes/GitOps, webhook reliability.

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
- Idempotent webhook → BullMQ worker pipeline: HMAC-SHA256 constant-time verify, dedupe by `sha256(signature + payload)`, retry backoff [1s, 5s, 30s, 5m], dead-letter replay via a separate consumer.
- Five design contracts proven by tests in CI (Redis-backed). Ships a Terraform module + Helm chart. Published as `\u{40}ykstormsorg/anvil` v0.1.0 on npm with build provenance.
#h(0pt) #tag[TypeScript] #tag[BullMQ] #tag[Redis] #tag[Express] #tag[Terraform] #tag[Helm]
#v(0.1em)
#project-header("Goldset", "Creator · Maintainer") · #link("https://github.com/ykstorm/goldset")[github.com/ykstorm/goldset]
- Three eval runners — golden dataset, LLM-as-judge, and structural assertions — packaged as a public GitHub Action with a pluggable judge (OpenAI / Anthropic).
- Runs the suite on every PR, posts a delta-vs-base comment, and blocks the merge on regression. Published as `\u{40}ykstormsorg/goldset` v0.2.0 on npm + GitHub Marketplace.
#h(0pt) #tag[TypeScript] #tag[esbuild] #tag[OpenAI] #tag[Anthropic] #tag[GitHub Actions]
#v(0.1em)
#project-header("Anchor", "Creator") · #link("https://anchor-iota-ten.vercel.app/playground")[anchor-iota-ten.vercel.app/playground]
- Provenance-first RAG with cosine-floor refusal. API returns `{ chunks, sources, refused }` — chunks above the floor, refused below, with a deduped sources array per response.
- Postgres + pgvector via `docker compose up`; one-command quickstart from a clean clone. Live playground renders the retrieval decision for any query.
#h(0pt) #tag[Postgres + pgvector] #tag[Prisma 7] #tag[Next.js 15] #tag[OpenAI embeddings]

#v(0.1em)
#project-header("Tripwire", "Creator") · #link("https://github.com/ykstorm/tripwire")[github.com/ykstorm/tripwire]
- Mid-stream LLM safety. Token-by-token rule engine aborts the response stream on rule trip, before the bad token reaches the user.
- Sub-millisecond decision per chunk; zero buffering on happy path. Ships an OpenAI-compatible sidecar proxy (`POST /v1/chat/completions`) that streams through the guard and aborts mid-stream on a rule trip. Published as `\u{40}ykstormsorg/tripwire` on npm.
#h(0pt) #tag[TypeScript] #tag[Node async iterators] #tag[streaming abort]

#v(0.1em)
#project-header("Quickdraw", "Creator") · #link("https://github.com/ykstorm/quickdraw")[github.com/ykstorm/quickdraw]
- LLM streaming benchmark CLI. TTFT, tokens/sec, p50/p95/p99, and cost per 1K across OpenAI + Anthropic. `quickdraw diff` flags regressions between runs. Published as `\u{40}ykstormsorg/quickdraw` v1.0.2 on npm with SLSA build provenance.
#h(0pt) #tag[TypeScript] #tag[OpenAI] #tag[Anthropic] #tag[CLI]

#v(0.1em)
#project-header("Stackup", "Creator") · #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]
- Kubernetes GitOps lab on a kind cluster: ArgoCD app-of-apps, Argo Rollouts canary, and kube-prometheus-stack. Helm charts + manifests validated in CI.
#h(0pt) #tag[Kubernetes] #tag[ArgoCD] #tag[Helm] #tag[kind] #tag[Grafana]

#v(0.1em)
#project-header("Codecraft", "Creator") · #link("https://codecraft-ai-tau.vercel.app")[codecraft-ai-tau.vercel.app]
- Boots a real Vite + React dev server inside the browser tab via WebContainers — no backend, no install. Editable Monaco wired to the WebContainer FS (debounced writes, sub-2s HMR); an interactive xterm runs real shell commands; an IndexedDB snapshot cache drops repeat-visit boot under 20s. The COOP/COEP cross-origin-isolation boundary is what makes `SharedArrayBuffer` and the in-tab runtime work.
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