<div align="center">

# Agent Protocols

**An agent-reachable protocol registry.**
Both human-readable and machine-readable. Designed to be referenced by coding agents at a stable URL.

[Your deployment](https://aidenlive.github.io/agent-protocols) · [AGENTS.md](./AGENTS.md) · [manifest.json](./manifest.json)

</div>

---

## What this is

A static site that hosts operational protocols at predictable URLs. Any coding agent — Claude, Claude Code, Codex, Cursor, Aider — can resolve a short trigger phrase to a specific markdown file and follow it as a procedure.

```
User: "release init from main"
Agent: fetch https://aidenlive.github.io/agent-protocols/release/init.md  →  execute
```

The same URL serves a rendered HTML page for humans and a raw markdown file for agents.

## What's included

- **Release Protocol** — five-phase audit-to-launch workflow. Commands: `init`, `audit`, `report`, `cleanup`, `prep`, `gtm`, `sync`.
- **Templates** — 11 production-grade output documents (RELEASE-STATUS, RELEASE-CHECKLIST, LAUNCH-PLAN, DEPLOYMENT, SECURITY, CONTRIBUTING, CHANGELOG, ROADMAP, INCIDENT-RESPONSE, SUPPORT, RELEASE-REPORT).
- **Manifests** — `manifest.json` at root, `manifest.json` per protocol, `/.well-known/ai-protocols.json` for discovery.
- **Landing page** — Awwwards-grade static site with light/dark mode and motion.

## Repository structure

```
agent-protocols/
├── AGENTS.md                          # Agent entry point
├── README.md                          # Human entry point
├── LICENSE
├── manifest.json                      # Top-level protocol index
├── index.html                         # Landing page
├── .well-known/
│   └── ai-protocols.json              # Discovery descriptor
├── release/                           # The release protocol
│   ├── index.html                     # Human view
│   ├── manifest.json                  # Command + template index
│   ├── protocol.xml                   # Canonical spec
│   ├── init.md                        # `release init`
│   ├── audit.md                       # `release audit`
│   ├── report.md                      # `release report {version}`
│   ├── cleanup.md                     # `release cleanup`
│   ├── prep.md                        # `release prep`
│   ├── gtm.md                         # `release gtm`
│   ├── sync.md                        # `release sync`
│   └── templates/                     # 11 output templates
│       ├── RELEASE-STATUS.md
│       ├── RELEASE-REPORT.md
│       ├── RELEASE-CHECKLIST.md
│       ├── LAUNCH-PLAN.md
│       ├── DEPLOYMENT.md
│       ├── SECURITY.md
│       ├── CONTRIBUTING.md
│       ├── CHANGELOG.md
│       ├── ROADMAP.md
│       ├── INCIDENT-RESPONSE.md
│       └── SUPPORT.md
├── docs/
│   ├── getting-started.md
│   ├── for-agents.md
│   ├── for-humans.md
│   └── adding-protocols.md
├── assets/
│   ├── css/styles.css
│   └── js/main.js
├── vercel.json                        # Vercel headers
├── netlify.toml                       # Netlify headers
├── _redirects                         # Netlify (optional custom routing)
└── .github/workflows/deploy.yml       # GitHub Pages deploy
```

Each protocol gets its own top-level directory. URLs map 1:1 to filesystem paths — no rewrites required.

## Local development

No build step. It's intentional.

```bash
# any static server works
npx serve .
# or
python3 -m http.server 8000
```

Then open `http://localhost:8000`.

## Configure your domain (required before deploying)

The HTML uses **relative links**, so the human-facing site works on any domain or path with zero changes. But the manifests and command files contain **absolute URLs** — agents fetch one manifest and need the full URL of every command, so the domain has to be baked in.

Set it in one command:

```bash
# replace example.com with your deployment URL
./scripts/set-domain.sh https://protocols.yourdomain.com

# deploying to a sub-path? include it:
./scripts/set-domain.sh https://yourdomain.com/agent-protocols
```

The script rewrites every absolute URL in `manifest.json`, `.well-known/ai-protocols.json`, each protocol manifest, and the command frontmatter. Re-run it any time your URL changes. The default placeholder is `https://aidenlive.github.io/agent-protocols` (root deployment).

## Deploying

The structure is plain static files — URLs map 1:1 to paths, so no rewrites are needed on any host.

### Vercel

```bash
vercel deploy --prod
```

`vercel.json` sets correct MIME types and CORS headers for `.md`, `.xml`, and `.json` so agents can fetch them cleanly.

### Netlify

```bash
netlify deploy --prod --dir=.
```

`netlify.toml` sets the same headers.

### GitHub Pages

Push to `main`. The workflow at `.github/workflows/deploy.yml` publishes automatically. (Note: GitHub Pages deploys to `username.github.io/repo/` — run `set-domain.sh` with that full sub-path.)

### Custom domain

Point your DNS at the chosen host, then run `set-domain.sh` with your final URL.

## Using a protocol

From any agent capable of `web_fetch`:

```
1. GET https://aidenlive.github.io/agent-protocols/manifest.json
2. Resolve the user's trigger phrase to a command URL
3. GET the command's .md file
4. Execute the procedure
5. Maintain the state file specified by the protocol
```

## Adding your own protocol

See [`docs/adding-protocols.md`](./docs/adding-protocols.md).

The short version: scaffold under `/{your-protocol}/`, add a `manifest.json`, write your command markdown files, register in the root `manifest.json`.

## License

MIT — see [`LICENSE`](./LICENSE).
