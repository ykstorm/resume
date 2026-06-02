#set page(paper: "us-letter", margin: (x: 0.55in, y: 0.5in))
#set text(font: "New Computer Modern", size: 9.5pt)
#set par(justify: true, leading: 0.5em)
#show heading.where(level: 2): set text(size: 11pt, weight: "bold", fill: rgb("#1a3a5c"))

#align(center)[
  #text(size: 22pt, weight: "bold")[Lakshyaraj Singh Rao] \
  #v(0.05em)
  #text(size: 10pt, fill: rgb("#1a73e8"))[Backend Engineer · AI Infrastructure · Eval Systems] \
  #v(0.15em)
  #text(size: 9.5pt)[
    Mumbai → Remote · #link("mailto:balveer767@gmail.com")[balveer767\u{40}gmail.com] · #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app] · #link("https://github.com/ykstorm")[github.com/ykstorm] · #link("https://linkedin.com/in/lakshyaraj")[linkedin.com/in/lakshyaraj]
  ]
]

#v(0.3em)
#line(length: 100%, stroke: 0.4pt)

== Summary

Backend engineer specializing in production AI infrastructure: provenance-first RAG (Anchor), mid-stream LLM guardrails (Tripwire), and CI-blocking eval harnesses (Goldset). Author of three npm packages under \u{40}ykstormsorg and a public GitHub Action listed on the GitHub Marketplace. Apache 2.0 by default.

== Technical Skills

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1.2em,
  [
    *Languages* \
    TypeScript, Python, \
    Rust (learning), SQL
  ],
  [
    *Backend / Data* \
    Node.js, Postgres, \
    pgvector, Prisma 7, \
    BullMQ, Redis
  ],
  [
    *Infra / DevOps / AI* \
    Docker, Kubernetes, \
    Terraform, GitHub Actions, \
    OpenAI, Anthropic, Ollama
  ]
)

== Open-Source Projects

*Goldset* — Three-runner AI eval framework (goldenDataset · llmJudge · structural) shipped as a public GitHub Action. PR comment diffs the delta; structural-assertion failures block merge. 938 KB self-contained esbuild bundle — zero install at consumer side. \
_Published: #link("https://www.npmjs.com/package/@ykstormsorg/goldset")[\u{40}ykstormsorg/goldset v0.2.0] · GitHub Marketplace (Continuous Integration)_ \
_TypeScript · esbuild · OpenAI · Anthropic · Apache 2.0_

*Anchor* — Provenance-first RAG with cosine-floor refusal. Returns chunks when similarity >= 0.30; returns refused: true and zero chunks below floor. Idempotent upsert keyed on (sourceType, sourceId). 60 embeddings across 16 RERA-verified projects in demo corpus. \
_Live: #link("https://anchor-iota-ten.vercel.app/playground")[anchor-iota-ten.vercel.app/playground]_ \
_TypeScript · Postgres + pgvector · Prisma 7 · Next.js 15 · OpenAI text-embedding-3-small_

*Tripwire* — Mid-stream LLM safety. Token-by-token rule engine aborts the response stream on rule trip — user never sees a bad response finish rendering. Sub-millisecond decision per chunk, zero buffering on happy path. \
_Published: #link("https://www.npmjs.com/package/@ykstormsorg/tripwire")[\u{40}ykstormsorg/tripwire]_ \
_TypeScript · Node async iterators · streaming abort_

*Quickdraw* — LLM streaming benchmark CLI capturing TTFT, tokens-per-second, and dollar-per-1K across OpenAI and Anthropic. Nightly run at 03:00 UTC diffs vs. baseline; results auto-committed to repo. \
_Published: #link("https://www.npmjs.com/package/@ykstormsorg/quickdraw")[\u{40}ykstormsorg/quickdraw]_ \
_TypeScript · OpenAI SDK · Anthropic SDK · GitHub Actions cron_

*Stackup* — Local Kubernetes lab spinning up via single make up in under 10 minutes. ArgoCD + Argo Rollouts + Grafana + Prometheus on kind cluster — production-shaped stack for learning, not for HA workloads. \
_Code: #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]_ \
_Helm · ArgoCD · kind · Bash_

*Codecraft* — In-browser IDE prototype. WebContainers running real Node.js + Monaco editor + Ollama for local AI completions. Landing + auth shell deployed; IDE workspace in active build. \
_Live: #link("https://codecraft-ai.vercel.app")[codecraft-ai.vercel.app]_ \
_WebContainers · Monaco · xterm · Next.js_

== In Progress

*Anvil — Backend Platform Module Suite* — Idempotent BullMQ job queue + retry-safe webhook receiver with exponential backoff and dead-letter handling + Terraform module (Postgres + Redis + worker pool) + Helm chart. Targeting backend-platform roles at Supabase, Trigger.dev, Razorpay-tier.

== Experience

*Freelance Backend & AI Engineer* — Remote · Mar 2025 – Present \
Production AI features for client projects: RAG pipelines (pgvector + Prisma), LLM streaming with guardrails, CI eval harnesses, Docker + GitHub Actions deploy pipelines. Multiple deployments live; client specifics under NDA.

== Education

*Manipal University Jaipur* — B.Tech, Computer Science · Graduating 2026 \
Coursework: Distributed Systems, Database Internals, ML Foundations, Networks

== Recognition

- 3 npm packages published under #link("https://www.npmjs.com/~ykstormsorg")[\u{40}ykstormsorg] scope: goldset, quickdraw, tripwire
- Goldset listed on GitHub Marketplace (Continuous Integration category)
- 6 open-source repositories under Apache 2.0 with working demos
- Portfolio site with live npm + GitHub activity at #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app]

#v(0.5em)
#align(center)[
  #text(size: 8pt, fill: rgb("#666666"))[
    Latest version: #link("https://github.com/ykstorm/resume")[github.com/ykstorm/resume]
  ]
]