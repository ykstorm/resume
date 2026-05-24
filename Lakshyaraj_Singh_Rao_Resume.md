# Lakshyaraj Singh Rao

**Full-Stack Engineer · AI Systems · Backend · DevOps**

Mumbai, India · raolakshyaraj@gmail.com · [linkedin.com/in/lakshyaraj](https://linkedin.com/in/lakshyaraj) · [github.com/ykstorm](https://github.com/ykstorm)

---

## SUMMARY

Backend-focused engineer who ships production AI products end-to-end. Solo-built and operates Homesty.ai — a live, commission-generating real-estate AI platform — with a 5-layer anti-fabrication system, 165 production deployments, and 0 critical Sentry classes firing under live traffic. Comfortable across the full stack: REST API design, Prisma ORM, RAG infrastructure, Docker, CI/CD, observability.

---

## TECHNICAL SKILLS

**Languages:** TypeScript, JavaScript (ES6+), C++, SQL
**Backend:** Node.js, Express.js, Next.js 15, REST APIs, JWT Auth, Prisma ORM, Zod
**AI / LLM:** GPT-4o, Claude Sonnet, Vercel AI SDK, RAG (pgvector), Streaming, Prompt Engineering
**Databases:** PostgreSQL (Neon), pgvector, MongoDB, Redis (Upstash), RabbitMQ
**DevOps & Cloud:** Docker, Docker Compose, GitHub Actions, Vercel, AWS EC2, Kubernetes, ArgoCD
**Observability:** Sentry, Prometheus, Grafana, Winston, Playwright, Vitest

---

## EXPERIENCE

### Founding Engineer & Co-Founder — Homesty AI Technology LLP
*Mumbai, India · Mar 2026 – Present · Entity incorporating May 2026 · [homesty.ai](https://homesty.ai)*

Solo engineer on the production stack. End-to-end ownership: system prompt design, RAG infrastructure, full-stack development, security, observability, incident response. Co-founded with Balvir Singh Rao (operations and legal).

- Shipped buyerchat to production: Next.js 15 + Postgres + pgvector + Prisma 7 + GPT-4o + Claude + Sentry + Upstash Redis + Docker. 16 RERA-verified projects indexed for South Bopal and Shela, Ahmedabad.
- 165 production deployments. 0 critical Sentry classes firing under live traffic. 159 unit tests passing. Live commission model.
- Engineered 5-layer anti-fabrication architecture: PART 0 hard-stop rules + onChunk markdown abort + 17-class regex audit + source-provenance API blockade + GUARD_LIST RAG grounding.
- Closed 8 production hallucination classes including OTP-simulation, fabricated entity names, and invented founding years.
- 8-stage chat pipeline: per-IP rate limit → intent classifier → RAG retrieval → GPT-4o streaming → post-stream audit → DB log + Sentry alert.
- Built 7-module Decision Engine: scores projects against buyer preferences, generates Strong Buy / Buy with Conditions / Avoid tags with honest concern disclosures.
- pgvector retriever with 600ms timeout + 0.30 cosine floor (silently drops weak matches instead of feeding garbage to the model).
- Security: prompt injection protection, PII stripping, origin checks, PRICING_LOCKED canonical surface, per-IP capture rate limiting.

---

## PROJECTS

### [rag-starter](https://github.com/ykstorm/rag-starter)
Production RAG template extracted from buyerchat. pgvector retrieval, embed-writer, cosine-floor, provenance API for grounded citations. Apache 2.0.

### [guardrail-proxy](https://github.com/ykstorm/guardrail-proxy)
Streaming LLM safety. Mid-chunk abort when audit catches violation — user never sees a bad response finish rendering. 17-class regex audit, PII scrub. Apache 2.0.

### [devops-showcase](https://github.com/ykstorm/devops-showcase)
Kubernetes + ArgoCD GitOps stack. Canary deploys, Prometheus, Grafana. Apache 2.0.

### [k8s-deploy-tracker](https://github.com/ykstorm/k8s-deploy-tracker)
Go service that consumes Kubernetes deploy events and feeds failing ones to GPT-4 for one-paragraph summaries. Apache 2.0.

### [stream-bench](https://github.com/ykstorm/stream-bench)
Benchmarks for LLM streaming: time-to-first-token, throughput, total latency across OpenAI, Anthropic, Bedrock. Apache 2.0.

---

## EDUCATION

**Manipal University Jaipur** — B.Tech, Computer Science
*Graduating 2026*

---

## RECOGNITION

- **Production Reliability:** 165 deployments shipped, 0 critical Sentry classes firing, 159 unit tests passing — homesty.ai live traffic.
- **Anti-Fabrication Architecture:** Closed 8 production hallucination classes via PART 0 hard rules + 17-class regex audit + GUARD_LIST RAG grounding.
