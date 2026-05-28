# Release Report — {version}

**Date:** `{YYYY-MM-DD}`
**Repository:** `{repo}`
**Branch / Commit:** `{branch}` / `{short-sha}`
**Author (agent):** Release Protocol v1.0
**Spec:** https://aidenlive.github.io/agent-protocols/release

---

## Executive summary

Three to five sentences. Written last. State the verdict, the headline risks, and the immediate next step.

---

## Current state

| Surface          | State                              |
| ---------------- | ---------------------------------- |
| Stack            |                                    |
| Environments     |                                    |
| Deployment       |                                    |
| Observability    |                                    |
| Test coverage    |                                    |

---

## Verified findings

Grouped by surface. Each finding cites evidence.

### Product
- …

### Architecture
- …

### Infrastructure
- …

### APIs
- …

### Deployment
- …

### Security
- …

### Documentation
- …

### Operations
- …

### Developer experience
- …

### Release readiness
- …

---

## Assumptions and unknowns

Items not yet verified. Each carries an owner and a plan to verify.

| Assumption | Why it matters | Owner | Plan to verify |
| ---------- | -------------- | ----- | -------------- |
|            |                |       |                |

---

## Architecture review

Coupling, boundaries, hidden dependencies. Diagram references welcome.

---

## Infrastructure review

Hosts, regions, edges, queues, databases, caches. Env parity status.

---

## Security review

- **Secrets handling:**
- **Authentication / authorization:**
- **Dependency CVEs:** count + summary
- **HTTP headers:** CSP, HSTS, X-Frame-Options, Referrer-Policy
- **CORS:**
- **PII / data handling:**

---

## Operational readiness

- **Logging:**
- **Metrics:**
- **Alerting:**
- **On-call:**
- **Runbooks:**

---

## Documentation status

| Document          | State                              |
| ----------------- | ---------------------------------- |
| README.md         |                                    |
| CONTRIBUTING.md   |                                    |
| DEPLOYMENT.md     |                                    |
| SECURITY.md       |                                    |
| API docs          |                                    |
| Changelog         |                                    |

---

## Technical debt

| Item | Effort | Why it's debt | Defer to |
| ---- | ------ | ------------- | -------- |
|      |        |               |          |

---

## Risks and blockers

| Severity   | Item | Surface | Owner | Mitigation |
| ---------- | ---- | ------- | ----- | ---------- |
| Blocker    |      |         |       |            |
| High risk  |      |         |       |            |
| Medium risk|      |         |       |            |

---

## Prioritized recommendations

### P0 — must fix before release
- …

### P1 — fix before public launch
- …

### P2 — track for next release
- …

---

## Remediation roadmap

A sequenced plan. What gets done, in which order, by whom.

1. …
2. …
3. …

---

## Go / No-Go assessment

**Verdict:** `{go | conditional go | no-go}`

**Reasoning.** One paragraph. Cite the report sections above.

**Conditions (if conditional).**
- …

**Re-assessment trigger (if no-go).**
- …
