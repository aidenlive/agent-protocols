# Incident Response

How we handle production incidents. Aimed at responders mid-incident — read it before you need it.

## Severity levels

| Severity | Definition | Response time |
| -------- | ---------- | ------------- |
| SEV-1 | Production down or data loss | Immediate, page on-call |
| SEV-2 | Major feature broken for many users | Within 30 min |
| SEV-3 | Minor feature broken or degraded performance | Within 4 hours |
| SEV-4 | Cosmetic or non-urgent | Next business day |

## On-call

- **Primary:** `{name}` — `{contact}`
- **Secondary:** `{name}` — `{contact}`
- **Escalation:** `{name}` — `{contact}`
- **Rotation:** `{tool / schedule URL}`

## Response flow

1. **Acknowledge** the page within `{N}` minutes.
2. **Declare** severity in `{incident channel}`.
3. **Open** an incident document. Use the template below.
4. **Communicate** initial status to stakeholders within `{N}` minutes.
5. **Mitigate** first, fix root cause second. Rollback is always allowed.
6. **Resolve** when user impact has stopped.
7. **Retrospective** within 5 business days for SEV-1 and SEV-2.

## Incident document template

```
# Incident — {short title}

**Severity:** {SEV-N}
**Status:** {open | mitigated | resolved}
**Incident commander:** {name}
**Started:** {timestamp}
**Detected by:** {alert | user report | other}

## Impact
What users see. Which features. How many users.

## Timeline
- HH:mm — event
- HH:mm — event

## Mitigation
What we did to stop impact.

## Root cause
What actually happened. Filled in after resolution.

## Follow-up
- [ ] item
- [ ] item
```

## Rollback

Default path when a recent deploy is suspected.

```bash
{rollback command}
```

Average rollback time: `{minutes}`. See `DEPLOYMENT.md` for context.

## Communication

- **Internal:** `{channel}` for live updates
- **Customer-facing:** `{status page URL}` — update on declare, mitigate, resolve
- **Critical incidents:** notify `{email / list}` directly

## Postmortems

Blameless. Focus on systems, not people. Outputs:

1. Confirmed root cause
2. Why detection took as long as it did
3. Why mitigation took as long as it did
4. Concrete action items with owners and dates
