# Adding a protocol

Step-by-step. Goal: another protocol slots into the registry without ad-hoc URL schemes.

## 1. Scaffold the directory

```
{your-protocol}/
├── manifest.json
├── protocol.xml             # canonical spec (or .md if you prefer)
├── index.html               # optional human view
├── {command}.md             # one per command
└── templates/
    └── {OUTPUT}.md
```

Place the directory at the repo root, next to `release/`.

## 2. Write the canonical spec

Use the same shape as `release/protocol.xml`. Define:

- `role` — the persona the agent adopts
- `mission` — one paragraph
- `session_continuity` — how state persists
- `workflow` — phases or commands
- `deliverables` — files the protocol produces
- `principles` — non-negotiables
- `style` — voice and posture

If markdown is more natural, use `protocol.md` instead and adjust the manifest accordingly.

## 3. Create command files

One file per command. URL-clean filenames (lowercase, hyphens, no spaces).

Every command starts with the frontmatter contract:

```yaml
---
command: <trigger phrase>
protocol: <protocol id>
phase: <number or "any">
canonical: <full URL>
spec: <full URL of protocol.xml>
requires: <prior command id, if any>
args:
  <name>: <required | optional + default>
---
```

Then a body that includes at minimum: **Required steps**, **Rules**, **Output contract**, **Next**.

## 4. Build the protocol manifest

`{your-protocol}/manifest.json`:

```json
{
  "id": "your-protocol",
  "name": "Your Protocol",
  "version": "1.0.0",
  "summary": "One sentence.",
  "spec": "https://aidenlive.github.io/agent-protocols/your-protocol/protocol.xml",
  "human": "https://aidenlive.github.io/agent-protocols/your-protocol/",
  "commands": [
    {
      "id": "init",
      "trigger": "your-protocol init",
      "summary": "...",
      "url": "https://aidenlive.github.io/agent-protocols/your-protocol/init.md"
    }
  ],
  "templates": { }
}
```

## 5. Register in the root manifest

Add an entry under `protocols` in `/manifest.json`:

```json
{
  "id": "your-protocol",
  "name": "Your Protocol",
  "version": "1.0.0",
  "summary": "...",
  "url": "https://aidenlive.github.io/agent-protocols/your-protocol",
  "manifest": "https://aidenlive.github.io/agent-protocols/your-protocol/manifest.json",
  "entry": "https://aidenlive.github.io/agent-protocols/your-protocol/init.md",
  "source": "https://aidenlive.github.io/agent-protocols/your-protocol/protocol.xml",
  "trigger_phrases": ["your-protocol init", "your-protocol …"]
}
```

## 6. Add it to the landing page

Open `/index.html` and copy the existing protocol card. Update the title, description, and links. The visual system handles the rest.

## 7. Test the resolution

```bash
curl https://aidenlive.github.io/agent-protocols/manifest.json | jq '.protocols[] | select(.id=="your-protocol")'
curl https://aidenlive.github.io/agent-protocols/your-protocol/manifest.json
curl https://aidenlive.github.io/agent-protocols/your-protocol/init.md
```

All three should return content. If any 404, your hosting routes are misconfigured — check `vercel.json` / `_redirects`.

## Conventions

- **One protocol, one domain.** Don't bundle unrelated workflows.
- **Commands are imperative.** `audit`, `cleanup`, `verify` — not `auditing` or `the-audit-procedure`.
- **Markdown is the agent surface.** XML or JSON is for the canonical spec only.
- **Templates are reviewable.** A template should produce a document a senior reviewer would accept.
