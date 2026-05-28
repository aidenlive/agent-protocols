---
command: release audit
protocol: release
phase: 1
canonical: https://aidenlive.github.io/agent-protocols/release/audit.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
requires: release init
---

# release audit

**Phase 1 of 5.** Audit reality versus assumption across every dimension of the project. Produce findings, not opinions.

## Scope

Analyze each of these surfaces. Treat them as independently verifiable components — do not bundle.

| Surface              | Verify                                                                                  |
| -------------------- | --------------------------------------------------------------------------------------- |
| **Product**          | Stated purpose vs. actual behavior. Feature inventory. UX flows that work end-to-end.   |
| **Architecture**     | Module boundaries, coupling, hidden dependencies, dead branches, circular imports.      |
| **Infrastructure**   | Hosting, CDN, DNS, environments, edge functions, queues, databases, caches.             |
| **APIs**             | Public surface, versioning, contracts, breaking-change risk, undocumented endpoints.    |
| **Deployment**       | Build pipeline, artifact integrity, environment parity, deploy targets, rollback path.  |
| **Security**         | Secrets handling, auth flows, dependency CVEs, exposed env vars, CSP/headers, CORS.     |
| **Documentation**    | README accuracy, install steps, contributor guide, API docs, inline doc drift.          |
| **Operations**       | Logging, metrics, alerting, on-call, runbooks, incident history.                        |
| **Developer XP**     | Setup time, scripts, lint/format, test ergonomics, hot reload, type safety.             |
| **Release Readiness**| Licensing, branding, public-facing strings, support channels, legal pages.              |

## Classification

Every finding gets exactly one label:

- `verified` — reproduced by reading code or running a read-only command
- `assumed` — reasonable inference; not yet proven
- `undocumented` — exists but not described anywhere
- `debt` — works but has clear maintenance cost
- `risk` — could fail in production under realistic conditions
- `blocker` — must be fixed before release
- `missing` — should exist but does not

## Rules

- Break systems into independently verifiable components.
- Separate verified behavior from assumptions. Never mix them.
- Treat undocumented behavior as unreliable until confirmed.
- Surface coupling, hidden dependencies, and operational risk early.
- If you cannot verify, label `assumed` — do not promote to `verified` by hand-waving.

## Output

Append findings to `/RELEASE-STATUS.md` under a new section `## Phase 1 — Audit`. Each finding follows this shape:

```
- [classification] [surface] short description
  evidence: <file:line | command output | URL>
  impact: <one line>
```

Update `Current phase` to `1 — Audit (complete)` only when every surface in the table above has at least one entry — even if that entry is `[missing]`.

## Non-negotiables

- **No remediation in this phase.** Do not fix anything yet. Audit only.
- **No silent assumptions.** Anything without evidence is `assumed`.
- **Evidence is required.** A finding without a file path, command, or URL is incomplete.

## Next

→ [`release report {version}`](./report.md)
