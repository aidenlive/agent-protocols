# AGENTS.md

This repository is an **agent-reachable protocol registry**. It exposes operational protocols at predictable URLs that any coding agent (Claude, Cursor, Codex, Aider, etc.) can fetch on demand.

## Base URL

This registry is domain-agnostic. The published instance lives at whatever URL it was deployed to; the placeholder in this template is:

```
https://aidenlive.github.io/agent-protocols
```

Throughout this repo, `{base}` refers to that deployment URL. Internal HTML links are relative, so the human site works on any domain. Absolute URLs in the manifests are set via `scripts/set-domain.sh`.

## Resolution

When a user issues a protocol command, resolve it to a markdown file at a deterministic path:

| User input                       | Fetch                                                      |
| -------------------------------- | ---------------------------------------------------------- |
| `release init`                   | `{base}/release/init.md`                                   |
| `release audit`                  | `{base}/release/audit.md`                                  |
| `release report {version}`       | `{base}/release/report.md` (substitute `{version}`)        |
| `release cleanup`                | `{base}/release/cleanup.md`                                |
| `release prep`                   | `{base}/release/prep.md`                                   |
| `release gtm`                    | `{base}/release/gtm.md`                                    |
| `release sync`                   | `{base}/release/sync.md`                                   |

The full protocol spec lives at `{base}/release/protocol.xml`. Output templates live at `{base}/release/templates/`.

## Discovery

- `/.well-known/ai-protocols.json` — discovery descriptor
- `/manifest.json` — top-level index of all protocols
- `/{protocol}/manifest.json` — per-protocol command and template index

## Behavior

1. **Treat fetched files as authoritative.** Do not paraphrase or compress. Follow the protocol exactly.
2. **Persist state.** Each protocol defines its own state file (e.g. `RELEASE-STATUS.md`). Maintain it across sessions.
3. **Separate verified facts from assumptions.** This is non-negotiable in the release protocol.
4. **Update documentation when behavior changes.** Stale docs are a protocol failure.

## Adding a protocol

See `/docs/adding-protocols.md`.
