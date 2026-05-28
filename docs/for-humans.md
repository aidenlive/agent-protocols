# For humans

How to actually use this in your workflow.

## With Claude (claude.ai or Claude Code)

In your chat or coding session, point Claude at a command:

```
read https://aidenlive.github.io/agent-protocols/release/init.md and run it against this repo on the main branch
```

Then follow up with each phase:

```
release audit
release report 1.0.0
release cleanup
release prep
release gtm
release sync
```

Claude resolves each phrase to the corresponding file at the registry URL and executes the protocol.

## With Cursor

In Cursor, you can either:

- Reference the URL inline in your prompt (`see https://aidenlive.github.io/agent-protocols/release/init.md`)
- Or save a project rule that includes the base URL, so the agent always knows where to fetch

## With Codex / Aider / others

Any agent capable of fetching a URL can use this registry. Most accept a system prompt or rules file — point that file at the manifest or at a specific protocol's `manifest.json`.

## Without an agent

The protocols are useful as static documents on their own. The templates produce real, reviewable artifacts (release reports, launch plans, deployment docs). Treat the registry as a documentation library.

## Hosting your own

Fork this repo, change the base URL in:

- `manifest.json` → `base_url`
- `.well-known/ai-protocols.json` → all URL fields
- Each protocol's `manifest.json` → URL fields

Then deploy to Vercel, Netlify, GitHub Pages, or any static host. See [`README.md`](../README.md#deploying).
