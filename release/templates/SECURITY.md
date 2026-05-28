# Security

## Reporting a vulnerability

Please report security issues to **{security@example.com}**.

Do **not** open a public issue. We aim to acknowledge within 48 hours.

For high-severity issues affecting production users, include:

- Description and impact
- Steps to reproduce
- Affected version(s)
- Suggested mitigation, if known

We follow coordinated disclosure. Public disclosure occurs after a fix is available.

## Supported versions

| Version | Supported |
| ------- | --------- |
| `1.x`   | ✅        |
| `< 1.0` | ❌        |

## Security posture

- **Secrets:** Stored in `{secret manager}`. Never in source. Rotation cadence: `{interval}`.
- **Dependencies:** Audited on every CI run. High/critical CVEs block merge.
- **Transport:** HTTPS-only. HSTS enabled with preload.
- **Headers:** CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy configured.
- **CORS:** Restricted to known origins; documented in `DEPLOYMENT.md`.
- **Auth:** `{summary of auth flow and provider}`
- **Rate limiting:** `{summary and thresholds}`
- **Logging:** No secrets in logs. PII rules below.

## Data handling

- **PII collected:**
- **PII storage:**
- **PII retention:**
- **PII access:**
- **Data deletion process:**

## Compliance posture

- **GDPR:**
- **CCPA:**
- **SOC 2 / ISO 27001:**
- **Other:**

## Incident response

See `INCIDENT-RESPONSE.md`.
