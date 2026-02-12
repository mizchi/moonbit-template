# MoonBit Template

A minimal MoonBit project template with CI, justfile, and AI coding assistant support.

## Usage

Clone this repository and start coding:

```bash
git clone https://github.com/mizchi/moonbit-template my-project
cd my-project
```

Update `moon.mod.json` with your module name:

```json
{
  "name": "your-username/your-project",
  ...
}
```

### Post-install

Set up pre-commit hooks with [prek](https://github.com/j178/prek):

```bash
prek install
```

Optional: install [starlint](https://github.com/mizchi/starlint) for MoonBit linting, then uncomment the `starlint` hook in `.pre-commit-config.yaml`:

```bash
moon install mizchi/starlint/cmd/starlint
```

## Quick Commands

```bash
just           # check + test
just fmt       # format code
just check     # type check
just test      # run tests
just test-update  # update snapshot tests
just run       # run main
just info      # generate type definition files
just release-check-all  # release check on js + native
```

## Project Structure

```
my-project/
├── moon.mod.json      # Module configuration
├── src/
│   ├── moon.pkg       # Package configuration
│   ├── lib.mbt        # Library code
│   ├── lib_test.mbt   # Tests
│   ├── lib_bench.mbt  # Benchmarks
│   ├── API.mbt.md     # Doc tests
│   └── main/
│       ├── moon.pkg
│       └── main.mbt   # Entry point
├── justfile           # Task runner
└── .github/workflows/
    └── ci.yml         # GitHub Actions CI
```

## Features

- `src/` directory structure with `moon.pkg` format
- Snapshot testing with `inspect()`
- Doc tests in `.mbt.md` files
- Benchmarks with `moon bench`
- GitHub Actions CI
- Pre-commit hooks via [prek](https://github.com/j178/prek) (optional [starlint](https://github.com/mizchi/starlint))
- Claude Code / GitHub Copilot support (AGENTS.md)

## CLI Tool Template

To build a CLI tool, use the [`feat/cli`](https://github.com/mizchi/moonbit-template/tree/feat/cli) branch:

```bash
git clone -b feat/cli https://github.com/mizchi/moonbit-template my-cli
```

The `feat/cli` branch includes:

- `src/cmd/app/` - CLI executable (`is-main: true`, native target)
- `install.sh` - curl-based installer script
- `.github/workflows/release.yml` - Builds and releases linux-x64 / macos-arm64 binaries
- Two install methods: `moon install` and `curl | sh`

## Release Checklist

Before tagging a release:

1. Update `moon.mod.json` version and metadata (`repository`, `keywords`, `description`)
2. Update `CHANGELOG.md`
3. Run `just release-check-all`
4. Create annotated tag (for example: `git tag -a v0.2.0 -m "Release v0.2.0"`)
5. Push branch and tag

## License

Apache-2.0
