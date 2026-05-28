---
command: release cleanup
protocol: release
phase: 3
canonical: https://aidenlive.github.io/agent-protocols/release/cleanup.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
requires: release report
---

# release cleanup

**Phase 3 of 5.** Take the repository from "works on my machine" to coherent, maintainable, production-safe, contributor-friendly, deployment-ready.

## Remove

Work through this list. For each item, list what you removed in `/RELEASE-STATUS.md` under `## Phase 3 — Cleanup`.

- **Dead code** — unreachable functions, unused exports, commented-out blocks older than this phase
- **Unused assets** — orphaned images, unreferenced fonts, leftover design files
- **Temp files** — `*.tmp`, `*.bak`, `.DS_Store`, `Thumbs.db`, scratch dirs
- **Debug logic** — `console.log`, `debugger`, `print()`, debug flags hardcoded to `true`
- **Duplicate implementations** — two utilities doing the same thing; pick one
- **Obsolete configs** — settings for tools no longer in use
- **Abandoned experiments** — feature branches merged then forgotten, dead feature flags
- **Unused dependencies** — packages not imported anywhere
- **Test artifacts** — coverage outputs, snapshot debris, fixture leftovers committed in error

## Standardize

- **Naming** — files, folders, branches, env vars, scripts. Pick one convention per category; apply consistently.
- **Folder structure** — match the conventions of the dominant framework. Document any deliberate divergence.
- **Config management** — one source of truth per config domain. No duplicated values between files.
- **Environment handling** — single `.env.example` with every required variable. Real `.env` files are gitignored. Document each variable.
- **Scripts and tooling** — every common operation has a `package.json` / `Makefile` / `justfile` entry. No tribal-knowledge incantations.
- **Linting and formatting** — one linter, one formatter. CI fails on violations. No mixed styles.
- **Versioning** — agree on semver. Tag scheme is documented.
- **CI/CD workflows** — one workflow file per logical pipeline. Named clearly. Documented in `DEPLOYMENT.md`.
- **Documentation structure** — `/docs` for long-form, root for entry points (`README`, `CONTRIBUTING`, `LICENSE`, etc.).

## Target state

The repository, after cleanup, must be:

- **Coherent** — a new contributor can map the structure in under 5 minutes
- **Maintainable** — no "don't touch this" zones
- **Production-safe** — no debug code, no test secrets, no localhost URLs in prod paths
- **Contributor-friendly** — `CONTRIBUTING.md` exists and is accurate
- **Deployment-ready** — `DEPLOYMENT.md` exists and works end-to-end

## Rules

- **Commit in logical chunks.** One concern per commit. Cleanup commits should be reviewable.
- **Do not refactor logic.** Cleanup is not the place for architectural rewrites. Move that to the next release.
- **Preserve git history.** Use `git mv` for renames. Do not delete-and-recreate.
- **Run tests after every meaningful change.** A green cleanup is the only acceptable cleanup.

## Output contract

By the end of `release cleanup`:

- All removals and standardizations logged in `/RELEASE-STATUS.md` under `## Phase 3 — Cleanup`
- Lint and format clean across the entire repo
- Tests passing on the target branch
- `Current phase` → `3 — Cleanup (complete)`

## Next

→ [`release prep`](./prep.md)
