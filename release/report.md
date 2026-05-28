---
command: release report {version}
protocol: release
phase: 2
canonical: https://aidenlive.github.io/agent-protocols/release/report.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
requires: release audit
args:
  version: required (semver, e.g. 1.0.0)
---

# release report

**Phase 2 of 5.** Consolidate audit findings into a formal release report.

## Usage

```
release report 1.0.0
```

`{version}` is required. It must be a valid semver string. The report file is named `/RELEASE-{version}-REPORT.md`.

## Required steps

1. **Pull findings.** Read every entry under `## Phase 1 — Audit` in `/RELEASE-STATUS.md`. Group by surface.

2. **Generate the report.** Use [`./templates/RELEASE-REPORT.md`](./templates/RELEASE-REPORT.md) as the structural template. Substitute `{version}` and today's date.

3. **Fill every required section.** Do not skip. If a section has no findings, write `No findings.` — do not delete the heading.

## Required sections

| Section                          | Source                                                    |
| -------------------------------- | --------------------------------------------------------- |
| Executive Summary                | 3–5 sentences, written last after the report is complete  |
| Current State                    | Branch, commit, stack, environments                       |
| Verified Findings                | All `verified` items, grouped by surface                  |
| Assumptions and Unknowns         | All `assumed` and `undocumented` items                    |
| Architecture Review              | Coupling, boundaries, debt                                |
| Infrastructure Review            | Hosting, deployment surfaces, env parity                  |
| Security Review                  | Secrets, auth, CVEs, headers, CORS                        |
| Operational Readiness            | Logging, metrics, alerting, runbooks                      |
| Documentation Status             | Drift items from `init`, accuracy of README/CONTRIBUTING  |
| Technical Debt                   | All `debt` items, with rough effort estimate              |
| Risks and Blockers               | All `risk` and `blocker` items, prioritized               |
| Prioritized Recommendations      | P0 / P1 / P2 list                                         |
| Remediation Roadmap              | Sequenced plan — what gets done in which order            |
| Go / No-Go Assessment            | One verdict. With reasoning. With conditions if `no-go`.  |

## Rules

- **Truth over optimism.** If the project is not ready, say so. The Go/No-Go verdict exists for a reason.
- **Cite evidence.** Every claim links to a file, a line range, or a command output.
- **No filler.** No "this section explores…" — get to the finding.
- **Prefer tables.** Lists of findings render as tables. Prose is for synthesis only.

## Output contract

By the end of `release report`:

- `/RELEASE-{version}-REPORT.md` exists and is complete
- `/RELEASE-STATUS.md` updated: `Current phase` → `2 — Report (complete)`
- The Go/No-Go verdict is summarized in `RELEASE-STATUS.md` under `Release readiness`

## Next

→ If verdict is `go` or `conditional go`: [`release cleanup`](./cleanup.md)
→ If verdict is `no-go`: address blockers, then re-run `release audit`.
