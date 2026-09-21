# Contributing to mb_contact_form

Thanks for taking the time to contribute! Please read this guide before opening an issue or pull request.

## Getting started

**Prerequisites:** Flutter SDK ≥ 3.0.0 (or [FVM](https://fvm.app/)).

```sh
git clone https://github.com/moulibheemaneti/mb_contact_form.git
cd mb_contact_form
flutter pub get
```

## Commit convention

Commit messages must follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>: <subject starting with a lowercase letter>
```

Allowed types: `feat`, `fix`, `chore`, `docs`, `style`, `refactor`, `test`, `build`, `ci`, `perf`, `revert`, `wip`, `release`.

Examples:

```
feat: add custom theme support
fix: handle null email field gracefully
docs: update widget usage example
```

## Pre-commit hooks

This repo uses [`dart_husky`](https://pub.dev/packages/dart_husky). Install the hooks once after cloning:

```sh
dart run dart_husky install
```

On every commit the following run automatically:

| Hook | Command |
|---|---|
| `format` | `dart format --set-exit-if-changed .` |
| `analyze` | `flutter analyze .` |

The commit message is also checked against the Conventional Commits types listed above.

There is no `test` hook yet because this package has no `test/` directory — add one to `dart_husky.yaml` once tests exist.

If any hook fails, the commit is blocked. Fix the issue and re-stage — don't `--no-verify`.

## Running tests

```sh
flutter test
```

## Making a change

1. Fork the repo and create a branch from `master`.
2. Make your changes and add or update tests as needed.
3. Run `dart format .` and `flutter analyze` — both must pass cleanly.
4. Run `flutter test` — all tests must pass.
5. Update `CHANGELOG.md` under the `[Unreleased]` section.
6. Open a pull request with a Conventional Commits title.

## Reporting issues

Use the issue templates — they ask for the specific information needed to reproduce or triage your report quickly. For security vulnerabilities, see [SECURITY.md](SECURITY.md).
