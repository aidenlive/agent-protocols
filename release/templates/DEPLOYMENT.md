# Deployment

How this project is built, configured, and shipped to production.

## Environments

| Environment | URL | Branch | Auto-deploy |
| ----------- | --- | ------ | ----------- |
| Development |     | `dev`  |             |
| Staging     |     | `staging` |          |
| Production  |     | `main` |             |

## Stack

- **Hosting:**
- **Runtime:**
- **Build system:**
- **Database:**
- **Cache / queue:**
- **CDN:**
- **DNS:**

## Build

```bash
# install
{install command}

# build
{build command}

# run locally
{dev command}
```

Production build artifact location: `{path}`
Reproducible: `{yes | no}` — `{notes}`

## Required environment variables

Every variable listed here must also exist in `.env.example`.

| Variable | Required in | Purpose | Sourced from |
| -------- | ----------- | ------- | ------------ |
|          |             |         |              |

## Secrets

- Stored in: `{secret manager}`
- Rotation policy: `{cadence}`
- Access: `{who, how}`
- Never commit `.env` files. Pre-commit hook: `{configured | not configured}`.

## Deploy

```bash
{deploy command(s)}
```

Trigger: `{push to main | manual | tagged release}`
Approval required: `{yes | no}`
Average deploy time: `{minutes}`

## Rollback

```bash
{rollback command(s)}
```

Average rollback time: `{minutes}`
Last dry-run: `{date}` — result: `{ok | …}`
Database rollback strategy: `{forward-only | reversible — note migration tooling}`

## Observability

- **Logs:**
- **Metrics:**
- **Errors:**
- **Traces:**
- **Dashboards:**
- **Alerts:**

## Backup & restore

- **Backup cadence:**
- **Backup retention:**
- **Restore procedure:** see `INCIDENT-RESPONSE.md`
- **Last restore drill:** `{date}` — result: `{ok | …}`

## Domains & DNS

| Domain | Points to | TTL | Owner |
| ------ | --------- | --- | ----- |
|        |           |     |       |

## Provider accounts

Who holds the keys, and where.

| Provider | Account owner | Recovery contact |
| -------- | ------------- | ---------------- |
|          |               |                  |
