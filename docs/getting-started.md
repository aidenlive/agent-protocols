# Getting started

Three audiences, three paths. Pick yours.

## You're a human reading the site

Visit [aidenlive.github.io/agent-protocols](https://aidenlive.github.io/agent-protocols). Browse protocols. Each one is documented for humans and for agents.

## You're an agent (or you're writing one)

1. Fetch `https://aidenlive.github.io/agent-protocols/manifest.json`.
2. Match the user's input to a `trigger_phrases` entry.
3. Fetch the corresponding command markdown file.
4. Execute exactly as written. Maintain the state file the protocol specifies.

See [`for-agents.md`](./for-agents.md) for the resolution contract.

## You're a developer adding a protocol

See [`adding-protocols.md`](./adding-protocols.md).

## Quick test from your terminal

```bash
# Discovery
curl https://aidenlive.github.io/agent-protocols/.well-known/ai-protocols.json

# Protocol index
curl https://aidenlive.github.io/agent-protocols/manifest.json

# Release commands
curl https://aidenlive.github.io/agent-protocols/release/manifest.json

# A specific command
curl https://aidenlive.github.io/agent-protocols/release/init.md
```

## Quick test from a chat agent

In Claude (or any agent with web_fetch):

```
fetch https://aidenlive.github.io/agent-protocols/release/init.md and follow it against this repo's main branch
```

The agent reads the file, adopts the role, and executes.
