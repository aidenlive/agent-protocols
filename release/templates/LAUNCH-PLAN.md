# Launch Plan — {version}

**Launch date:** `{YYYY-MM-DD HH:mm TZ}`
**Launch lead:** `{name}`
**On-call (T+0 to T+48h):** `{name}`

Every item below has an owner (a person), a verification method, and a status.

## T-7 days

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Full regression on staging |  |  | pending |
| Cross-browser / device matrix |  |  | pending |
| Lighthouse / Core Web Vitals review |  |  | pending |
| Load test executed |  |  | pending |
| SEO metadata, sitemap, robots.txt |  |  | pending |
| Privacy / terms / cookie review |  |  | pending |

## T-2 days

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Production env var audit |  |  | pending |
| Secrets audit (no leaks) |  |  | pending |
| Headers verified (CSP, HSTS, etc.) |  |  | pending |
| Rate limits set on public endpoints |  |  | pending |
| CDN cache rules confirmed |  |  | pending |
| Blog post drafted, reviewed, scheduled |  |  | pending |
| Social copy drafted, scheduled |  |  | pending |
| Customer email drafted, scheduled |  |  | pending |
| Support team briefed |  |  | pending |
| Status page entry drafted |  |  | pending |

## T-1 day

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Final RC deployed to staging |  |  | pending |
| Smoke tests on staging |  |  | pending |
| Rollback dry-run executed |  |  | pending |
| Backup confirmed, restore drill completed |  |  | pending |
| On-call rotation finalized |  |  | pending |
| Alert thresholds tightened for launch window |  |  | pending |

## T-0 (launch)

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Deploy to production |  |  | pending |
| Smoke tests on production |  |  | pending |
| Health checks green |  |  | pending |
| Status page updated to "operational" |  |  | pending |
| Comms published in agreed order |  |  | pending |

## T+0 to T+4h

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Active monitoring of error rate |  |  | pending |
| Active monitoring of latency |  |  | pending |
| Active monitoring of traffic patterns |  |  | pending |
| Support inbox triaged in 15-min cycles |  |  | pending |

## T+4h to T+48h

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| Hourly metrics check |  |  | pending |
| Incident log maintained |  |  | pending |
| Daily standup on launch state |  |  | pending |

## T+72h (close-out)

| Item | Owner | Verification | Status |
| ---- | ----- | ------------ | ------ |
| `release sync` run |  |  | pending |
| Alert thresholds reset to normal |  |  | pending |
| Retrospective scheduled |  |  | pending |
| Launch comms archived |  |  | pending |

---

## Rollback decision matrix

Trigger rollback if any of:

- Error rate exceeds `{threshold}` for `{duration}`
- p95 latency exceeds `{threshold}` for `{duration}`
- Critical user flow broken in production
- Data integrity issue detected

Rollback owner: `{name}`
Rollback command / runbook: see `INCIDENT-RESPONSE.md`

---

## Communications order

1. Status page → operational
2. Engineering channel announcement
3. Customer email
4. Blog post
5. Social posts
6. External press / partners (if applicable)
