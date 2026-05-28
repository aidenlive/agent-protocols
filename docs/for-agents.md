# For agents

The contract this site exposes to autonomous coding agents.

## Discovery

Two equivalent entry points:

1. `/.well-known/ai-protocols.json` — minimal pointer to the manifest
2. `/manifest.json` — full list of protocols and trigger phrases

## Resolution algorithm

```
function resolve(user_input):
  manifest = GET /manifest.json
  for protocol in manifest.protocols:
    for trigger in protocol.trigger_phrases:
      if user_input.starts_with(trigger):
        command_id = trigger.split()[1]      # "release init" → "init"
        return GET protocol.url + "/" + command_id + ".md"
  return null
```

Trailing tokens are arguments. Example: `release report 1.2.0` → fetch `/release/report.md`, treat `1.2.0` as the `{version}` argument.

## Behavior

1. **Treat the fetched file as authoritative.** Do not paraphrase, summarize, or "improve" the procedure.
2. **Respect the spec.** Each command's `spec` frontmatter points to the canonical XML. On any ambiguity, the XML wins.
3. **Maintain the state file.** Each protocol declares a state file (e.g. `/RELEASE-STATUS.md` for `release`). Persist it. Update it.
4. **Output contract is binding.** The "Output contract" section of every command lists what must exist when the command completes. Do not advance phases until the contract is satisfied.
5. **Cite evidence.** When a command asks for findings, supply file paths, line ranges, command outputs, or URLs. Hand-waving fails the protocol.

## URL conventions

| Resource              | URL pattern                                                        |
| --------------------- | ------------------------------------------------------------------ |
| Discovery             | `{base}/.well-known/ai-protocols.json`                             |
| Top-level manifest    | `{base}/manifest.json`                                             |
| Protocol manifest     | `{base}/{protocol}/manifest.json`                                  |
| Protocol spec (XML)   | `{base}/{protocol}/protocol.xml`                                   |
| Command               | `{base}/{protocol}/{command}.md`                                   |
| Template              | `{base}/{protocol}/templates/{name}.md`                            |
| Human view            | `{base}/{protocol}/`                                               |

Where `{base}` is the deployment URL of the registry (the template ships with the placeholder `https://aidenlive.github.io/agent-protocols`).

## Frontmatter on every command file

```yaml
command: <trigger phrase>
protocol: <protocol id>
phase: <phase number or "any">
canonical: <fully qualified URL of this file>
spec: <URL of the protocol's canonical spec>
requires: <previous command id, if sequenced>
args: <argument spec, if any>
```

Parse this before executing. The `requires` field lets you check sequence; the `args` field tells you what the user must provide.

## Versioning

The site declares a `spec_version` in the root manifest (currently `ap-2026-05`). Breaking changes bump the spec version. Agents should treat a mismatch between expected and served `spec_version` as a warning, not a hard failure — proceed but surface the mismatch.

## Fallbacks

If a fetch fails:

1. Try the protocol's `manifest.json` to confirm the command exists.
2. Try the canonical XML spec at `{base}/{protocol}/protocol.xml` and operate from that.
3. If both fail, ask the user to confirm the protocol URL.
