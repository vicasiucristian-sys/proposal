# Agent Reach vs Apify — which one should we use?

*Evaluated 13 Sep 2026. Agent Reach v1.5.0 (commit da5044d, 1 Sep 2026) was installed and exercised in a sandbox; Apify was assessed from its MCP server source, SDK packages, official docs mirrored on GitHub, and third‑party pricing reports (apify.com itself was unreachable from the sandbox — see "What was verified").*

## Verdict

**Use Apify** — start on the Free plan, connected to Claude Code through the hosted MCP server. **Do not adopt Agent Reach as a dependency** for this project. The two upstream tools it would give us that we would actually use (yt‑dlp for YouTube transcripts, Jina Reader for plain pages) are one‑line commands we can call directly, for free, without the installer.

Three reasons, specific to our work (competitor sales‑page teardowns like the TJR Trades / Payhip analysis in this repo):

1. **The pages we care about are JavaScript‑rendered funnel pages, often behind Cloudflare.** Agent Reach's only web backend is Jina Reader (`curl https://r.jina.ai/URL`), and its own code detects a Cloudflare/captcha challenge and raises "use a site‑specific tool or browser instead" (`agent_reach/channels/web.py`). Apify's Web Fetch and Website Content Crawler render JS in a real browser, rotate proxies, and return Markdown or structured JSON.
2. **Social‑proof mining (X, Instagram, Reddit) needs an account on Agent Reach.** X needs cookies exported from our own logged‑in browser; Facebook, Instagram and Reddit go through OpenCLI, which reuses a logged‑in desktop Chrome session (no server path for Facebook/Instagram). That is our personal accounts taking the ban risk. Apify actors run on Apify's proxies, return JSON, and cost roughly $0.40–$1.50 per 1,000 items — inside the $5/month free credit at our volume.
3. **Integration cost.** Apify is one `claude mcp add` plus an OAuth click; the agent then discovers the right scraper itself (`search-actors` → `call-actor`). Agent Reach needs Node, mcporter, gh CLI, OpenCLI and per‑platform CLIs installed on the machine, an interactive browser OAuth for Exa search (it timed out headless in our test), and its reference docs are partly in Chinese.

Agent Reach remains a reasonable choice if the constraints are *zero budget, laptop only, Chinese platforms (Bilibili, XiaoHongShu, V2EX, Xueqiu) matter, and you accept using your own account cookies*. None of those describe this project.

## What the two things are

**Agent Reach** (MIT, Python ≥ 3.10, [Panniantong/agent-reach](https://github.com/Panniantong/agent-reach)) is not a scraper. It is an installer + health‑checker + router: it picks a free upstream tool per platform, checks that it works (`agent-reach doctor`), and drops a `SKILL.md` into Claude Code / Cursor / OpenClaw so the agent knows which command to run. Reading is done by the agent calling the upstream tool directly. 15 channels: Web (Jina Reader), YouTube (yt‑dlp), RSS (feedparser), GitHub (gh CLI), web search (Exa via mcporter), X (twitter‑cli + cookies), Reddit/Facebook/Instagram/XiaoHongShu (OpenCLI browser session), LinkedIn (MCP or Jina), Bilibili, V2EX, Xueqiu, Xiaoyuzhou podcasts. It is installed from a GitHub zip; the `agent-reach` name on PyPI is an unrelated package.

**Apify** is a commercial cloud platform: 8,000+ "Actors" (hosted scrapers) in a store, a run/dataset/proxy infrastructure, SDKs (`apify-client` 2.25.0 JS / 3.2.0 Python), scheduling, and an MCP server (`@apify/actors-mcp-server` 0.15.7, hosted at `https://mcp.apify.com`) that exposes any Actor as a tool to Claude Code, Claude.ai, Cursor, VS Code. Default MCP tools: `search-actors`, `fetch-actor-details`, `call-actor`, docs search, plus two pre‑loaded Actors: `apify/rag-web-browser` (search the web → top N pages as Markdown) and `apify/web-fetch` (any URL → Markdown/HTML/text with JS rendering and anti‑bot handling).

## What was verified (and what was not)

The sandbox egress policy allowed only GitHub, npm and PyPI. `r.jina.ai`, `youtube.com`, `mcp.exa.ai`, `apify.com`, `reddit.com`, `x.com`, `payhip.com`, `tjrtrades.com` were all blocked, so **live end‑to‑end reads could not run here**. Re‑run `agent-reach doctor` on your own machine before trusting any channel.

| Check | Result |
|---|---|
| `pip install` of Agent Reach 1.5.0 into a venv | OK (pulls yt‑dlp, feedparser, rich, loguru, pyyaml, requests, dotenv) |
| `agent-reach install --env=auto` (read‑only mode) | OK. Detected "Server/VPS", flagged gh CLI and mcporter missing. Prints raw Rich markup (`[bold cyan]…`) in the summary — cosmetic bug in `doctor.py:60`. |
| `agent-reach doctor` | 2/15 channels usable in the sandbox (RSS, Web). Output was Chinese in a non‑Chinese locale. |
| RSS channel, live | **Verified**: feedparser fetched a GitHub Atom feed, HTTP 200, 0.44 s. |
| Web channel (Jina Reader) | Blocked by sandbox. Note: `WebChannel.check()` never probes the network — doctor reports it "ok" unconditionally. Code has a 5 MB cap, 30 s timeout, and bails on Cloudflare/captcha pages. |
| YouTube channel (yt‑dlp) | Needed a manual config line (`--js-runtimes node`) before doctor accepted it; network blocked for the actual fetch. |
| GitHub channel | Needs gh CLI installed (and, in practice, `gh auth login`). |
| Exa search via mcporter | `npm i -g mcporter` OK; `mcporter config add exa …` OK; first call requires **interactive browser OAuth** — timed out after 60 s headless. "No API key" is true, "no login" is not. |
| Agent Reach test suite | 585 passed, 1 failed. The failure (`test_get_configured_features`) is because the sandbox exports `GITHUB_TOKEN` and `Config.get()` falls back to environment variables — an environment artifact, not a product bug. |
| Apify MCP server | Read source README + official docs from GitHub: hosted endpoint, OAuth or Bearer token, Streamable HTTP (SSE removed), output‑schema inference on hosted only, rental and full‑permission Actors excluded from MCP. |
| Apify pricing | **Not verified against apify.com** (blocked). Figures below are from third‑party pricing pages dated Jul–Sep 2026 and agree with each other except the Starter plan ($29 in most, $39 in one). |

## Head‑to‑head

| Criterion | Agent Reach | Apify | Edge |
|---|---|---|---|
| Price | $0. Optional $1/mo proxy for server IPs. | Free plan: $5/mo credit, 5 datacenter proxy IPs, no card. Starter $29/mo, Scale $199, Business $999 (prepaid usage = plan price). Compute unit (1 GB‑hour) $0.20 / $0.16 / $0.13 by tier. Residential proxy ~$8/GB. | Agent Reach at scale; tie at our volume |
| JS‑rendered / anti‑bot sales pages | Jina Reader only. Explicitly gives up on Cloudflare challenges. 20 req/min per IP without a key, 200 with a free key. | Web Fetch and Website Content Crawler run headless Chromium with proxy rotation and anti‑bot handling. Website Content Crawler ~$1 per 1,000 pages. Web Fetch bills only successful fetches. | **Apify** |
| Payhip / funnel‑specific extraction | None. Generic page read. | Store has Payhip Marketplace Scraper, Creator Commerce Intelligence (Payhip creators), Smart Page Analyzer (pricing/CTA/positioning of a landing page), Competitor Offer Page Monitor. | **Apify** |
| X / Twitter | twitter‑cli with `TWITTER_AUTH_TOKEN` + `TWITTER_CT0` exported from your own browser. | Tweet scrapers ~$0.40 per 1,000 tweets on Apify's proxies. | **Apify** (no account risk) |
| Instagram / Facebook | OpenCLI over a logged‑in desktop Chrome only; no server path. Instagram channel was removed once in v1.1.0 when upstream broke. | Instagram Scraper ~$1.50 per 1,000 posts. Community reports of intermittent empty results after Instagram changes; CU‑billed runs are charged even when empty. | **Apify**, with caveats |
| Reddit | No zero‑config path; OpenCLI session or rdt‑cli + cookie. | Reddit scrapers in store, pay per result. | **Apify** |
| YouTube transcripts / search | yt‑dlp, free, excellent, works anywhere yt‑dlp works (needs a JS runtime now). | YouTube Scraper ~$2.40 per 1,000 videos; transcripts ~$0.70 per 1,000. | **Agent Reach / plain yt‑dlp** |
| Web search | Exa via mcporter, free but interactive OAuth. | `rag-web-browser` (Google search → Markdown of top N), billed per run. | Tie |
| Output format | Markdown / CLI text. Agent parses. | JSON datasets with schema, plus Markdown. | **Apify** |
| Claude Code integration | `SKILL.md` registered by `agent-reach install --system`; agent runs shell commands. Also a minimal MCP server that only exposes `get_status`. | Hosted MCP: `claude mcp add --transport http apify https://mcp.apify.com`, OAuth on first use. Tools carry `readOnlyHint` / `openWorldHint` annotations. | **Apify** |
| Setup footprint | Python venv + Node + mcporter + gh + OpenCLI + per‑platform CLIs from small third‑party maintainers ("public‑clis"). Installs into `~/.agent-reach`. | Account + token (or OAuth). Nothing local except the MCP entry; optional `apify-client` SDK. | **Apify** |
| Headless / server / CI use | Web, RSS, YouTube, GitHub work headless. Facebook/Instagram/Reddit/XiaoHongShu are desktop‑browser only. Exa needs a browser once. | Everything runs in Apify's cloud; callable from anywhere with a token. | **Apify** |
| Scheduling, storage, monitoring | None. | Built in (schedules, datasets, key‑value stores, run logs, webhooks). | **Apify** |
| Reliability model | "Primary + fallback" backend lists; maintainers re‑route when a tool dies (yt‑dlp → bili‑cli for Bilibili, June 2026). You depend on ~10 upstream projects. | Actor maintainers fix breakage; official Apify Actors are well maintained, community ones vary. | Slight edge Apify |
| Privacy / data path | Cookies and content stay on your machine. | Content passes through Apify's cloud and storage. | **Agent Reach** |
| Compliance / account risk | Uses your own login sessions to read platforms that forbid it in their ToS. | Apify's proxies and accounts, not yours. Platform ToS questions remain. | **Apify** |
| Project maturity | v1.5.0, 458 PRs, 7 tags, last commit 1 Sep 2026; reported ~67K GitHub stars (third‑party figure, GitHub API was out of scope here). Docs Chinese‑first, EN mirror. | actors‑mcp‑server: 818 PRs, 170 tags, npm publish 11 Sep 2026; SDKs updated 13 Sep 2026. Company‑backed. | **Apify** |
| Relevance of coverage to us | 5 of 15 channels are China‑only platforms we will never use. | Store coverage is broad and searchable by the agent. | **Apify** |

## Cost at our volume

Assumed monthly research load for this proposal work: 150 competitor sales/landing pages, 20 YouTube transcripts, 2,000 tweets, 500 Instagram posts, 50 Payhip listings.

| Item | Agent Reach | Apify (third‑party 2026 list prices) |
|---|---|---|
| 150 sales pages | $0 (if Jina gets through) | ~$0.15 via Website Content Crawler at ~$1/1K; Web Fetch per‑event price not retrievable |
| 20 transcripts | $0 (yt‑dlp) | ~$0.01 |
| 2,000 tweets | $0 + your cookies | ~$0.80 |
| 500 Instagram posts | $0, desktop Chrome only | ~$0.75 |
| 50 Payhip listings | $0 generic read | ~$0.10 (estimate) |
| Compute‑unit overhead | — | ~$0.50 |
| **Total** | **$0** | **≈ $2.30, inside the $5 free credit** |

Cost only starts to separate the two above roughly 5,000 pages or 10,000 social items per month, and at that volume Jina's 20 req/min per‑IP limit and server‑IP blocking would push Agent Reach toward paid proxies and keys anyway.

## Risks to plan for

**Apify**
- Community Actors can break after a platform change; check the Actor's "last run success" and reviews before relying on one, prefer `apify/*` official Actors.
- CU‑billed Actors charge for empty runs. Prefer pay‑per‑event Actors (Web Fetch, most social scrapers) which bill per successful result.
- The MCP `call-actor` flow is two‑step (run, then `get-dataset-items`) and an Actor run takes seconds to minutes — slower than a `curl`.
- Set a monthly spending limit in Apify Console before giving the agent the token.
- Confirm current prices on apify.com/pricing; the figures here are second‑hand.

**Agent Reach**
- Depends on ~10 upstream tools maintained by third parties; several were re‑routed or removed in the last six months.
- Cookie‑based access to X and browser‑session access to Instagram/Facebook/Reddit put your personal accounts at risk and are against those platforms' ToS.
- Installer runs many `npm -g` / `pip` installs from GitHub sources; review before `--system`.
- Chinese‑default UI text and a Rich‑markup rendering bug in `install`.
- Jina Reader is itself a third‑party hosted service with its own limits and outages.

## How to set up the recommended path

**Apify in Claude Code (OAuth, no token in config):**

```bash
claude mcp add --transport http apify https://mcp.apify.com
```

Or with a token from Console → Settings → API & Integrations:

```bash
claude mcp add --transport http apify https://mcp.apify.com \
  --header "Authorization: Bearer $APIFY_TOKEN"
```

Then, in a session: *"Use apify web-fetch to read https://example.com/sales-page as markdown"* or *"search-actors for payhip and pull the top 50 trading ebooks with prices and reviews."*

**Free one‑liners we keep regardless (this is all Agent Reach would add for us):**

```bash
# Any plain page → Markdown (20 req/min without a key)
curl -s "https://r.jina.ai/https://example.com/page"

# YouTube auto‑captions → /tmp/<id>.en.vtt
yt-dlp --write-auto-sub --sub-lang en --skip-download -o "/tmp/%(id)s" "URL"
```

**If you still want Agent Reach on a laptop:**

```bash
pipx install https://github.com/Panniantong/agent-reach/archive/main.zip
agent-reach install --env=auto            # read‑only check, changes nothing
agent-reach install --env=auto --system   # installs deps, registers SKILL.md
agent-reach doctor                        # which backend serves each platform
```

## Sources

Verified directly: Agent Reach repository (README, `docs/README_en.md`, `docs/install.md`, `pyproject.toml`, `agent_reach/channels/*.py`, `agent_reach/skill/SKILL_en.md`, test suite run); `apify/actors-mcp-server` README and `apify/apify-docs` MCP page via raw.githubusercontent.com; npm/PyPI registry metadata for `@apify/actors-mcp-server`, `apify-client`, `crawlee`.

Third‑party (not verified against apify.com): [scrapegraphai.com Apify pricing 2026](https://scrapegraphai.com/blog/apify-pricing), [use-apify.com pricing](https://use-apify.com/docs/what-is-apify/apify-pricing), [use-apify.com free plan](https://use-apify.com/docs/what-is-apify/apify-free-plan), [crawlworks.io Apify pricing](https://crawlworks.io/blog/apify-pricing/), [use-apify.com social scrapers](https://use-apify.com/docs/best-apify-actors/best-social-media-scrapers), [Website Content Crawler listing](https://apify.com/apify/website-content-crawler), [Web Fetch listing](https://apify.com/apify/web-fetch), [Payhip Marketplace Scraper](https://apify.com/dadhalfdev/payhip-marketplace-scraper/api), [Smart Page Analyzer](https://apify.com/yizheng/smart-page-analyzer), [syphoon.com on Apify Instagram issues](https://syphoon.com/blog/apify-instagram-scraper), [Wavect Agent Reach review](https://wavect.io/blog/agent-reach-open-source-review/), [aiidelist Agent Reach review](https://aiidelist.com/blog/agent-reach-review), [Jina Reader rate limits](https://jina.ai/reader/).
