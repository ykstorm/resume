#set page(paper: "us-letter", margin: (x: 0.55in, y: 0.5in))
#set text(font: ("Liberation Sans", "DejaVu Sans"), size: 9.5pt)
#set par(justify: true, leading: 0.55em)

#let accent = rgb("#1a73e8")
#let muted = rgb("#666666")
#let tag-fill = rgb("#f0f4f8")
#let tag-stroke = rgb("#d9e1ec")

#show heading.where(level: 2): it => block(below: 0.4em, above: 0.8em)[
  #text(size: 11pt, weight: "bold", fill: accent, tracking: 0.8pt, upper(it.body))
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
      Mumbai → Remote \
      #link("mailto:balveer767@gmail.com")[balveer767\u{40}gmail.com] \
      #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app] · #link("https://github.com/ykstorm")[GitHub] · #link("https://linkedin.com/in/lakshyaraj")[LinkedIn] · #link("https://www.npmjs.com/~ykstormsorg")[npm]
    ]
  ]
)

#v(0.4em)
#line(length: 100%, stroke: 0.6pt)

== Summary

Backend-focused engineer building production AI infrastructure. Three published npm packages (#link("https://www.npmjs.com/package/@ykstormsorg/goldset")[\u{40}ykstormsorg/goldset], #link("https://www.npmjs.com/package/@ykstormsorg/quickdraw")[quickdraw], #link("https://www.npmjs.com/package/@ykstormsorg/tripwire")[tripwire]) and a public #link("https://github.com/marketplace/actions/goldset")[GitHub Marketplace Action]. Pulled production patterns from a freelance commission-AI deployment into six Apache-2.0 OSS repositories covering RAG, mid-stream guardrails, eval harnesses, streaming benchmarks, k8s, and in-browser IDE.

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

#project-header("Goldset", "Creator · Maintainer") · #link("https://github.com/ykstorm/goldset")[github.com/ykstorm/goldset]
- Three-runner AI eval framework (goldenDataset · llmJudge · structural assertions) shipped as a public GitHub Action.
- PR comment diffs the delta on every push; structural-assertion failures block merge.
- Single bundled 938 KB dist/action.cjs (esbuild) — zero install at consumer side.
- Published as `\u{40}ykstormsorg/goldset` v0.2.0 on npm and listed on GitHub Marketplace (Continuous Integration).
#h(0pt) #tag[TypeScript] #tag[esbuild] #tag[OpenAI] #tag[Anthropic] #tag[GitHub Actions]
#v(0.3em)
#project-header("Anchor", "Creator") · #link("https://anchor-iota-ten.vercel.app/playground")[anchor-iota-ten.vercel.app/playground]
- Provenance-first RAG layer with cosine-floor refusal. Returns chunks when similarity >= 0.30; returns refused: true and zero chunks below floor.
- Idempotent upsert keyed on (sourceType, sourceId) — safe to re-run without duplicates.
- Live demo with 60 embeddings across 16 RERA-verified real-estate projects.
- Adaptive K (precision queries -> K=6, recall queries -> K=10) with provenance array on every response.
#h(0pt) #tag[Postgres + pgvector] #tag[Prisma 7] #tag[Next.js 15] #tag[OpenAI embeddings]

#v(0.3em)
#project-header("Tripwire", "Creator") · #link("https://github.com/ykstorm/tripwire")[github.com/ykstorm/tripwire]
- Mid-stream LLM safety. Token-by-token rule engine aborts the response stream on rule trip.
- Sub-millisecond decision per chunk; zero buffering on happy path.
- User never sees a bad response finish rendering — abort happens before the next token reaches them.
- Published as `\u{40}ykstormsorg/tripwire` on npm.
#h(0pt) #tag[TypeScript] #tag[Node async iterators] #tag[streaming abort]

#v(0.3em)
#project-header("Quickdraw", "Creator") · #link("https://github.com/ykstorm/quickdraw")[github.com/ykstorm/quickdraw]
- LLM streaming benchmark CLI. Captures TTFT, tokens-per-second, and dollar-per-1K tokens.
- Nightly run at 03:00 UTC across OpenAI + Anthropic; diffs vs. baseline and commits results to repo.
- Published as `\u{40}ykstormsorg/quickdraw` on npm.
#h(0pt) #tag[TypeScript] #tag[OpenAI SDK] #tag[Anthropic SDK] #tag[GHA cron]

#v(0.3em)
#project-header("Stackup", "Creator") · #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]
- Local Kubernetes lab spinning up in under 10 minutes via single make up target.
- ArgoCD + Argo Rollouts + Grafana + Prometheus on kind cluster — production-shaped stack for learning.
#h(0pt) #tag[Kubernetes] #tag[ArgoCD] #tag[Helm] #tag[kind] #tag[Grafana]

#v(0.3em)
#project-header("Codecraft", "Creator · In Build") · #link("https://codecraft-ai.vercel.app")[codecraft-ai.vercel.app]
- In-browser IDE prototype. WebContainers running real Node.js + Monaco editor + Ollama for local AI completions.
- Landing + auth shell deployed; IDE workspace modules in active build.
#h(0pt) #tag[WebContainers] #tag[Monaco] #tag[xterm] #tag[Next.js] #tag[Ollama]

== In Progress

*Anvil — Backend Platform Module Suite* — Idempotent BullMQ job queue + retry-safe webhook receiver with exponential backoff and dead-letter handling + Terraform module (Postgres + Redis + worker pool) + Helm chart. Targeting backend-platform roles at Supabase, Trigger.dev, Razorpay-tier.

== Freelance Work

#project-header("Homesty.ai", "Solo Backend & AI Engineer") · Remote · Mar 2025 – Present
- Built production buyer-side AI assistant on Next.js 15 + Postgres + pgvector + Prisma + GPT-4o + Claude streaming.
- Implemented 8-stage chat pipeline: per-IP rate limit -> intent classifier -> RAG retrieval -> streaming -> post-stream audit -> DB log.
- Designed 5-layer anti-fabrication architecture; the patterns shipped as the Anchor + Tripwire OSS repositories.
- 16 RERA-verified projects indexed across two Ahmedabad micro-markets.
#h(0pt) #tag[Next.js 15] #tag[Postgres + pgvector] #tag[Prisma 7] #tag[GPT-4o] #tag[Claude] #tag[Sentry] #tag[Docker]

== Education

*Manipal University Jaipur* — B.Tech, Computer Science · Graduating 2026 \
Relevant coursework: Distributed Systems, Database Internals, Networks, ML Foundations

== Recognition

- Three npm packages published under #link("https://www.npmjs.com/~ykstormsorg")[\u{40}ykstormsorg] scope
- Goldset listed on GitHub Marketplace (Continuous Integration)
- Six Apache 2.0 open-source repositories with working demos
- Portfolio with live npm + GitHub activity at #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app]

#v(0.5em)
#align(center)[
  #text(size: 8pt, fill: muted)[
    Latest version: #link("https://github.com/ykstorm/resume")[github.com/ykstorm/resume] · Apache 2.0
  ]
]