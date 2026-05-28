---
command: release prep
protocol: release
phase: 4
canonical: https://aidenlive.github.io/agent-protocols/release/prep.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
requires: release cleanup
---

# release prep

**Phase 4 of 5.** Generate the release deliverables. Validate every operational surface end-to-end.

## Generate

Create or update each deliverable from its template. Templates live at `./templates/`.

| File                  | Template                                                            |
| --------------------- | ------------------------------------------------------------------- |
| `DEPLOYMENT.md`       | [`templates/DEPLOYMENT.md`](./templates/DEPLOYMENT.md)             |
| `SECURITY.md`         | [`templates/SECURITY.md`](./templates/SECURITY.md)                 |
| `CONTRIBUTING.md`     | [`templates/CONTRIBUTING.md`](./templates/CONTRIBUTING.md)         |
| `CHANGELOG.md`        | [`templates/CHANGELOG.md`](./templates/CHANGELOG.md)               |
| `ROADMAP.md`          | [`templates/ROADMAP.md`](./templates/ROADMAP.md)                   |
| `INCIDENT-RESPONSE.md`| [`templates/INCIDENT-RESPONSE.md`](./templates/INCIDENT-RESPONSE.md) |
| `SUPPORT.md`          | [`templates/SUPPORT.md`](./templates/SUPPORT.md)                   |
| `RELEASE-CHECKLIST.md`| [`templates/RELEASE-CHECKLIST.md`](./templates/RELEASE-CHECKLIST.md) |

## Validate

Each of these must be **exercised**, not just documented. A green checkbox requires a verifiable artifact.

- **CI/CD** — every workflow passes on a clean checkout. Cache invalidation tested. Required checks configured.
- **Secrets and env vars** — every secret used in prod is defined in the production environment. `.env.example` lists every required variable. No secrets in git history.
- **Rollback strategy** — written, scripted, and dry-run tested. Rollback time documented.
- **Observability and monitoring** — logs flow to the configured sink. At least one alert exists for "site is down". Dashboards link from `DEPLOYMENT.md`.
- **Analytics and logging** — events fire from staging. PII rules documented in `SECURITY.md`.
- **Backup and recovery** — automated backup confirmed. Restore drill executed at least once. Restore time documented.
- **Install and upgrade paths** — install instructions tested on a clean machine. Upgrade path from previous version documented.
- **Production configuration** — env parity audited. Differences between staging and prod logged.
- **Licensing and branding** — LICENSE file present and correct. Trademark/brand strings consistent.
- **Public documentation** — README accurate, install steps verified, screenshots current.

## Rules

- **Templates are starting points, not final docs.** Strip placeholders. Add project specifics.
- **Validation is not "I think it works".** Run the rollback. Restore the backup. Trigger the alert. Document the result.
- **Link, don't duplicate.** If `DEPLOYMENT.md` covers something, `README.md` links to it.

## Output contract

By the end of `release prep`:

- All deliverables generated and project-specific
- Every validation item has a logged result in `/RELEASE-STATUS.md` under `## Phase 4 — Prep`
- `Current phase` → `4 — Prep (complete)`
- A release candidate tag exists on the target branch (e.g. `v1.0.0-rc.1`)

## Next

→ [`release gtm`](./gtm.md)
