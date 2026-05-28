---
command: release gtm
protocol: release
phase: 5
canonical: https://aidenlive.github.io/agent-protocols/release/gtm.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
requires: release prep
---

# release gtm

**Phase 5 of 5.** Build the launch checklist. The repository is ready; now verify that *launching* is ready.

## Generate

Create `/LAUNCH-PLAN.md` from [`./templates/LAUNCH-PLAN.md`](./templates/LAUNCH-PLAN.md). Fill every section with project-specific detail.

## Launch checklist domains

For each domain, attach an owner, a verification method, and a status (`pending`, `verified`, `blocked`).

| Domain                  | Verify                                                                       |
| ----------------------- | ---------------------------------------------------------------------------- |
| **QA**                  | Full regression on staging. Cross-browser/device matrix run.                |
| **Production verification** | Smoke tests against prod URL post-deploy. Health checks green.          |
| **Infrastructure**      | Autoscaling reviewed. Rate limits set. CDN cache rules confirmed.            |
| **Security**            | Headers verified (CSP, HSTS, X-Frame-Options). Dependency scan clean.        |
| **Performance**         | Lighthouse / Core Web Vitals passing. Load test executed.                    |
| **SEO and metadata**    | Title, description, OG tags, sitemap, robots.txt verified per page.          |
| **Legal and compliance**| Privacy policy, terms, cookie banner (if needed), GDPR/CCPA posture stated.  |
| **Support readiness**   | Support inbox monitored. Response SLA published in `SUPPORT.md`.             |
| **Launch communications** | Blog post, social copy, customer email, status page entry — all drafted.   |
| **Post-launch monitoring** | On-call schedule for 48h post-launch. Alert thresholds tightened.         |
| **Rollback readiness**  | Rollback runbook visible to the on-call rotation. One-command rollback tested. |

## Rules

- **Owners are people, not teams.** "DevOps" cannot be paged at 3am.
- **Every item has a verification method.** "We checked it" is not a verification method.
- **The launch is not the goal.** A successful first 72 hours is the goal. Plan accordingly.
- **Comms ship after engineering is green, not before.**

## Output contract

By the end of `release gtm`:

- `/LAUNCH-PLAN.md` exists and is owned (every item has an assignee)
- `/RELEASE-STATUS.md` updated: `Current phase` → `5 — GTM (complete)`
- A final `Go / No-Go` line at the bottom of `RELEASE-STATUS.md`
- Tag the release commit (`v{version}`) when verdict is `go`

## After launch

Run [`release sync`](./sync.md) within 24 hours to reconcile state, capture incidents, and close out the protocol.
