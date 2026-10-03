#set page(paper: "us-letter", margin: (x: 0.6in, y: 0.5in))
#set text(font: ("Liberation Sans", "DejaVu Sans"), size: 9.5pt)
#set par(justify: true, leading: 0.5em)

#let muted = rgb("#555555")
#let rule = line(length: 100%, stroke: 0.5pt + rgb("#999999"))

#show heading.where(level: 2): it => block(above: 0.9em, below: 0.35em)[
  #text(size: 10pt, weight: "bold", tracking: 0.6pt, upper(it.body))
  #v(-0.45em)
  #rule
]

// name, role, links (links are listed in the order they appear on the site)
#let entry(title, meta, place, stack, body) = block(below: 0.55em)[
  *#title* #h(1fr) #text(fill: muted)[#meta] \
  #if place != none [#text(fill: muted)[#place] \ ]
  #text(fill: muted)[Stack: #stack] \
  #body
]

#let project(name, links, stack, body) = block(below: 0.55em)[
  *#name* #h(0.6em) #text(fill: muted)[#links.join(" | ")] \
  #text(fill: muted)[Stack: #stack] \
  #body
]

#align(center)[
  #text(size: 20pt, weight: "bold")[Lakshyaraj Singh Rao]
  #v(0.15em)
  Full Stack Developer #h(0.5em) | #h(0.5em) Backend focus
  #v(0.15em)
  #text(size: 9pt, fill: muted)[
    #link("mailto:raolakshyaraj@gmail.com")[raolakshyaraj\u{40}gmail.com]
    | #link("https://lakshyaraj-dev.vercel.app")[lakshyaraj-dev.vercel.app]
    | #link("https://github.com/ykstorm")[github.com/ykstorm]
    | #link("https://linkedin.com/in/lakshyaraj-singh-rao")[linkedin.com/in/lakshyaraj-singh-rao]
  ]
]

== Summary

I am a full stack developer. Since November I have been building Homesty.ai, a property site where a buyer asks a question and gets an answer taken from real listings. I write TypeScript across the stack and deploy what I build with Docker and Vercel.

== Experience

#entry(
  [Homesty.ai LLP #h(0.6em) #text(fill: muted)[Software Engineer]],
  "Nov 2025 to Present",
  "Mumbai, India",
  "Next.js, React, Node.js, PostgreSQL, Prisma, Vercel, Sentry",
)[
  I build the buyer facing side of the product. I wrote the landing page and the chat screen where a buyer asks about a property, both in Next.js and React, and the REST endpoints behind them in Node.js. I designed the database schema in PostgreSQL and query it with Prisma. I also built the admin pages the team uses to manage listings, added the login flow, and wrote the audit log that records what changed and who changed it. I release on Vercel and watch production errors in Sentry, working in Git with pull requests and code review.
]

== Projects

#project(
  "Anvil",
  (link("https://github.com/ykstorm/anvil")[GitHub], link("https://www.npmjs.com/package/@ykstormsorg/anvil")[npm]),
  "TypeScript, Node.js, Express, Redis, BullMQ, Docker",
)[
  A webhook sometimes arrives twice, and code that runs twice can charge a customer twice. I built an Express server in TypeScript that checks each webhook's signature, then uses Redis to remember every delivery it has already seen so a repeat is dropped. Each valid delivery becomes one BullMQ job, so the sender gets a reply immediately and a worker does the real work in the background, retrying on a schedule. Packaged with Docker and published on npm.
]

#project(
  "Anchor",
  (link("https://github.com/ykstorm/anchor")[GitHub], link("https://anchor-iota-ten.vercel.app")[Live demo]),
  "TypeScript, Next.js, React, PostgreSQL, pgvector, Prisma, Vercel",
)[
  A search always returns its closest match even when nothing in the data is a good answer, and a model given a weak match will answer with confidence. I stored property listings as vectors in PostgreSQL using pgvector, queried through Prisma, and wrote the retrieval step in TypeScript that scores the best match and returns no answer when it is too weak. The front end is a Next.js and React page where a question is typed and the answer appears next to the listing it came from. Deployed on Vercel.
]

#project(
  "Tripwire",
  (link("https://github.com/ykstorm/tripwire")[GitHub], link("https://www.npmjs.com/package/@ykstormsorg/tripwire")[npm]),
  "TypeScript, Node.js, Express",
)[
  A language model sends its answer one piece at a time, so a user is already reading it while it is still being written, and checking it afterwards is too late. I wrote the streaming layer in TypeScript on Node.js that reads each piece as it arrives and runs a set of rules over it, cutting the response off the moment one is broken. It runs as an Express proxy, so an app switches to it by changing one URL. Published on npm.
]

#project(
  "Stackup",
  (link("https://github.com/ykstorm/stackup")[GitHub],),
  "Docker, Kubernetes, ArgoCD, Prometheus, Grafana",
)[
  Practising real deployments usually means renting a cloud cluster you pay for every month. I built a one command setup that starts a full cluster on a laptop with Docker and Kubernetes, uses ArgoCD to deploy whatever is in the Git repository, and releases a new version to a small share of traffic first while Prometheus watches the success rate and rolls it back if it drops.
]

== Technical Skills

#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.35em,
  [*Languages*], [JavaScript, TypeScript, SQL],
  [*Front end*], [React, Next.js, Tailwind CSS, HTML, CSS],
  [*Back end*], [Node.js, Express, REST APIs, PostgreSQL, Prisma, Redis, MongoDB],
  [*Tools*], [Git, GitHub, Docker, Kubernetes, GitHub Actions, Vercel, Sentry],
)

== Education

*B.Tech, Computer Science* #h(0.6em) #text(fill: muted)[Manipal University Jaipur] #h(1fr) #text(fill: muted)[Graduating 2026] \
#text(fill: muted)[Jaipur, India]
