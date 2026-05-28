---
command: release sync
protocol: release
phase: any
canonical: https://aidenlive.github.io/agent-protocols/release/sync.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
---

# release sync

Reconcile `/RELEASE-STATUS.md` with the actual state of the repository and operations. Can be run at any phase.

## When to run

- At the start of a new session, to recover context
- After a teammate pushes work that you did not generate
- After a deploy, to capture what shipped
- Within 24 hours of launch, to close out the protocol

## Required steps

1. **Read `/RELEASE-STATUS.md`.** Treat it as a snapshot, not ground truth.

2. **Re-verify the basics.**
   - Current branch and commit
   - Current version (package files, tags)
   - Phase claimed vs. evidence in the repo

3. **Reconcile each phase section.** For every claim under `## Phase N — …`, confirm the artifact exists. Mark drift inline as `~~stale~~` and write the corrected fact below it.

4. **Capture new state.**
   - New blockers, risks, decisions since last sync
   - Incidents post-launch (if any)
   - Doc updates needed because of behavior changes

5. **Update `Current phase` and `Release readiness`.** These must match the evidence after reconciliation.

## Rules

- **Do not delete history.** Sync edits in place; mark, don't erase.
- **Sync does not advance phases.** It only corrects the record. Advance phases through their own commands.
- **Surface drift.** If the team has been doing release work without updating `RELEASE-STATUS.md`, that itself is a finding.

## Output contract

By the end of `release sync`:

- `/RELEASE-STATUS.md` reflects observable reality
- A `## Sync log` section appended with timestamp and what changed
- Any drift surfaced to the user with explicit callouts

## Related

- [`release init`](./init.md) — for new projects
- [`release audit`](./audit.md) — for new findings
