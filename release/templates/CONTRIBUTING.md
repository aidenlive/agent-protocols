# Contributing

Thanks for considering a contribution.

## Quick start

```bash
git clone {repo-url}
cd {project}
{install command}
{dev command}
```

If anything in the above sequence fails on a clean machine, that's a bug worth filing.

## Branches

- `main` — production. Protected. PRs only.
- `dev` — integration. Default base for feature branches.
- `feat/*`, `fix/*`, `chore/*` — short-lived branches off `dev`.

## Commits

Conventional commits encouraged but not required.

```
feat(scope): short summary
fix(scope): short summary
chore(scope): short summary
```

## Pull requests

- Keep PRs focused. One concern per PR.
- Link to an issue or describe the motivation.
- CI must pass before review.
- Squash-merge by default.

## Code style

- Lint: `{lint command}`
- Format: `{format command}`
- Pre-commit hook: `{configured | recommended setup}`

## Tests

- Run tests: `{test command}`
- New features require tests. Bug fixes require a regression test.

## Releases

Releases follow the [Release Protocol](https://aidenlive.github.io/agent-protocols/release). Contributors do not cut releases directly.

## Code of conduct

See `CODE_OF_CONDUCT.md` if present. Otherwise: be kind, be precise, assume good faith.
