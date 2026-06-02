#set page(paper: "us-letter", margin: (x: 0.6in, y: 0.55in))
#set text(font: "New Computer Modern", size: 10pt)
#set par(justify: true, leading: 0.55em)
#show heading.where(level: 2): set text(size: 11pt, weight: "bold")

#align(center)[
  #text(size: 18pt, weight: "bold")[Lakshyaraj Singh Rao] \
  #text(size: 9.5pt)[
    Backend Engineer · AI Infrastructure · Eval Systems \
    Mumbai, India · #link("mailto:raolakshyaraj@gmail.com")[raolakshyaraj at gmail.com] · #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app] · #link("https://github.com/ykstorm")[github.com/ykstorm]
  ]
]

#line(length: 100%, stroke: 0.4pt)

== Summary

Backend engineer specializing in production AI infrastructure: provenance-first RAG, mid-stream LLM guardrails, and eval harnesses that block bad merges. Author of three published npm packages under the \u{40}ykstormsorg scope and a public GitHub Action that posts PR comments and blocks merges on AI behavior regression.

== Open-Source Projects
*Goldset* — Three-runner AI eval framework (goldenDataset, llmJudge, structural) shipped as a public GitHub Action. PR comment diffs the delta; structural-assertion failures block merge. Single bundled dist/action.cjs (938 KB) — no install at consumer side. #link("https://github.com/ykstorm/goldset")[github.com/ykstorm/goldset] · #link("https://www.npmjs.com/package/@ykstormsorg/goldset")[npm]

_TypeScript · esbuild · OpenAI · Anthropic · Apache 2.0_

*Anchor* — Provenance-first RAG layer with cosine-floor refusal. Returns chunks when similarity >= 0.30; returns refused: true and zero chunks below floor. Idempotent upsert on (sourceType, sourceId). #link("https://anchor-iota-ten.vercel.app")[anchor-iota-ten.vercel.app]

_TypeScript · Next.js 15 · Postgres + pgvector · Prisma 7 · OpenAI text-embedding-3-small_

*Tripwire* — Mid-stream LLM safety. Token-by-token rule engine aborts the response stream on rule trip. Sub-millisecond decision per chunk, zero buffering on happy path. #link("https://github.com/ykstorm/tripwire")[github.com/ykstorm/tripwire]

_TypeScript · Node async iterators · streaming abort_

*Quickdraw* — LLM streaming benchmark CLI. Captures TTFT, tokens-per-second, and dollar-per-1K across OpenAI and Anthropic. Nightly run at 03:00 UTC diffs vs baseline. #link("https://github.com/ykstorm/quickdraw")[github.com/ykstorm/quickdraw]

_TypeScript · OpenAI SDK · Anthropic SDK_

*Stackup* — Production-style Kubernetes locally in 10 minutes via single make up target. ArgoCD + Argo Rollouts + Grafana + Prometheus on kind cluster. #link("https://github.com/ykstorm/stackup")[github.com/ykstorm/stackup]

_Helm · ArgoCD · kind · Bash_

*Codecraft* — In-browser IDE running real Node.js via WebContainers, Monaco for editing, local Ollama for AI completions. Zero cloud roundtrip required. #link("https://codecraft-ai.vercel.app")[codecraft-ai.vercel.app]

_WebContainers · Monaco · Ollama · Next.js_

== In Progress

*Backend Platform Module Suite* — BullMQ-backed idempotent job queue + retry-safe webhook receiver + Terraform module for one-click stack provisioning. Targeting backend-platform roles at Supabase, Trigger.dev, Razorpay.

== Experience

*Freelance Backend & AI Engineer* — Remote · Mar 2025 – Present
Production AI features for client projects: RAG pipelines, LLM streaming, eval harnesses, and CI/CD pipelines. Multiple deployments live; client specifics under NDA.

== Technical Skills

- *Languages*: TypeScript, Python, Rust (learning)
- *Backend*: Node.js, Postgres, pgvector, Prisma 7, BullMQ, Redis
- *Infra*: Docker, Kubernetes, Terraform, GitHub Actions, Vercel
- *AI / Retrieval*: OpenAI, Anthropic, pgvector, Ollama, eval harnesses, RAG

== Education

Manipal University Jaipur — B.Tech, Computer Science · Graduating 2026

== Recognition

- 3 npm packages published under the \u{40}ykstormsorg scope
- Goldset listed on GitHub Marketplace (Continuous Integration)
- 6 open-source repos under Apache 2.0 with working demos
- Anchor live demo + playground at anchor-iota-ten.vercel.app

#align(center)[
  #text(size: 8pt)[
    Latest version: #link("https://github.com/ykstorm/resume")[github.com/ykstorm/resume]
  ]
]