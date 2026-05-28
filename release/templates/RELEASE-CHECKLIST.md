# Release Checklist — {version}

Concrete pass/fail items. No essays. Tick when verified by evidence.

## Code

- [ ] Lint clean across the entire repo
- [ ] Formatter clean across the entire repo
- [ ] All tests passing on target branch
- [ ] No `TODO`, `FIXME`, `XXX` without an issue link
- [ ] No commented-out code older than this release
- [ ] No `console.log` / `debugger` / `print()` in production paths
- [ ] No secrets in source or git history (scan run)
- [ ] No dead files (orphaned modules, unreferenced assets)
- [ ] Dependency audit clean (no high/critical CVEs)
- [ ] Unused dependencies removed

## Build & deploy

- [ ] CI green on target branch
- [ ] Production build succeeds from clean checkout
- [ ] Bundle size within budget (state budget)
- [ ] Source maps configured per environment policy
- [ ] Artifact reproducible — same input → same output

## Configuration

- [ ] `.env.example` lists every required variable
- [ ] Every variable in `.env.example` documented in `DEPLOYMENT.md`
- [ ] Production env vars set in the production environment
- [ ] Staging env parity audited (delta documented)
- [ ] Feature flags reviewed — none default to wrong value in prod

## Security

- [ ] HTTPS enforced
- [ ] HSTS configured
- [ ] CSP configured and tested
- [ ] CORS scoped to known origins
- [ ] Auth flows tested end-to-end
- [ ] Rate limiting in place on public endpoints
- [ ] PII handling matches `SECURITY.md`

## Observability

- [ ] Logs flowing to sink
- [ ] Error tracking configured
- [ ] At least one "site down" alert exists
- [ ] Dashboards linked from `DEPLOYMENT.md`
- [ ] On-call rotation set for launch window

## Documentation

- [ ] `README.md` — accurate, screenshots current
- [ ] `CONTRIBUTING.md` — present, install steps verified
- [ ] `DEPLOYMENT.md` — present, end-to-end verified
- [ ] `SECURITY.md` — present, disclosure path stated
- [ ] `CHANGELOG.md` — entry for `{version}` written
- [ ] `LICENSE` — correct
- [ ] Public API docs current (if applicable)

## Legal & branding

- [ ] LICENSE file matches stated license everywhere
- [ ] Trademark / brand strings consistent
- [ ] Privacy policy linked from product (if applicable)
- [ ] Terms of service linked from product (if applicable)
- [ ] Cookie banner present if required by jurisdiction

## Performance

- [ ] Lighthouse scores meet bar (state bar)
- [ ] Core Web Vitals passing on key pages
- [ ] Load test executed (state target)

## Rollback

- [ ] Rollback runbook written
- [ ] Rollback dry-run executed
- [ ] Rollback time documented (target ≤ N minutes)
- [ ] Database rollback strategy documented (forward-only vs. reversible)

## Backup

- [ ] Automated backup verified
- [ ] Restore drill executed at least once
- [ ] Restore time documented

## Launch comms (mirrors `/LAUNCH-PLAN.md`)

- [ ] Blog post drafted and approved
- [ ] Social posts drafted and scheduled
- [ ] Customer email drafted and approved
- [ ] Status page entry drafted
- [ ] Support team briefed

## Post-launch

- [ ] On-call coverage confirmed for first 48 hours
- [ ] Alert thresholds tightened for launch window
- [ ] `release sync` scheduled within 24 hours of launch
