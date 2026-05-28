---
command: release init
protocol: release
phase: 0
canonical: https://aidenlive.github.io/agent-protocols/release/init.md
spec: https://aidenlive.github.io/agent-protocols/release/protocol.xml
args:
  branch: main
---

# release init

Initialize the Release Protocol against the target branch. This is the entry point — run it before any other release command.

## Activation

You are now operating as the **release architect** defined in [`protocol.xml`](./protocol.xml). Adopt that role for the remainder of the session and across resumptions until release is cut.

## Required steps

1. **Confirm branch.** Default `main`. If the user specified a branch, switch to it. Halt if working tree is dirty — ask before stashing.

2. **Detect existing state.** Look for:
   - `RELEASE-STATUS.md`
   - `STATUS.md`, `PROGRESS.md`, `TRACKER.md`, `TODO.md`, `NOTES.md`
   - `*-plan.md`, `*-migration.md`, `scratch/`, `tmp/`
   - Existing release reports, checklists, launch plans

3. **Archive stale planning docs.** Move outdated trackers, scratchpads, and one-off notes into `/.archive/<YYYY-MM-DD>-pre-release/`. Do not delete — preserve history.

4. **Consolidate state.** Create or refresh `/RELEASE-STATUS.md` from the template at [`./templates/RELEASE-STATUS.md`](./templates/RELEASE-STATUS.md). Pre-fill:
   - Repository name, current branch, current commit
   - Detected primary language(s), framework(s), package manager(s)
   - Detected CI/CD provider
   - Detected hosting/deployment surfaces
   - Current phase: `1 — Audit (pending)`

5. **Audit documentation for drift.** Scan `README.md`, `CLAUDE.md`, `AGENT.md`, `AGENTS.md`, `CONTRIBUTING.md`. Flag any sections that contradict the actual repo (wrong scripts, missing files, dead links, renamed modules). Do not rewrite yet — list under "Doc Drift" in `RELEASE-STATUS.md`.

6. **Report back.** Output to the user:
   - Branch and commit you're operating on
   - Files archived (paths)
   - Detected stack
   - Doc-drift items found
   - Next recommended command: `release audit`

## Non-negotiables

- **Do not delete files.** Archive only.
- **Do not write code yet.** This is a scoping pass.
- **Do not assume.** Anything you cannot verify by reading a file or running a read-only command goes in the `Assumptions` section of `RELEASE-STATUS.md`.

## Output contract

By the end of `release init`, the repository MUST contain:

- `/RELEASE-STATUS.md` — populated with detected state
- `/.archive/<date>-pre-release/` — only if pre-existing planning docs were moved

Nothing else changes.

## Next

→ [`release audit`](./audit.md)
