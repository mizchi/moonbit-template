# MoonBit Template

A minimal MoonBit project template with CLI distribution, CI, and AI coding assistant support.

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
just run 20    # run CLI with args
just build     # build native release binary
just install   # install CLI to ~/.moon/bin
just release-check-all  # release check on js + native
```

## Project Structure

```
my-project/
├── moon.mod.json      # Module configuration
├── src/
│   ├── moon.pkg       # Library package
│   ├── lib.mbt        # Library code
│   ├── lib_test.mbt   # Tests
│   ├── lib_bench.mbt  # Benchmarks
│   ├── API.mbt.md     # Doc tests
│   └── cmd/
│       └── app/       # CLI executable
│           ├── moon.pkg   # is-main: true
│           └── main.mbt
├── justfile           # Task runner
├── install.sh         # curl-based installer
└── .github/workflows/
    ├── ci.yml         # CI (check + test)
    └── release.yml    # Build & release binaries
```

## CLI Distribution

### Install via moon (from mooncakes registry)

```bash
moon install your-username/your-project/cmd/app
```

### Install via curl (from GitHub Releases)

```bash
curl -fsSL https://raw.githubusercontent.com/your-username/your-project/main/install.sh | sh
```

### Release workflow

Tag a version to trigger the release:

```bash
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

This builds `linux-x64` and `macos-arm64` binaries and publishes them as GitHub Release assets.

## Features

- `src/` directory structure with `moon.pkg` format
- CLI executable with `cmd/app/` pattern (`is-main: true`)
- Native binary release for linux-x64 and macos-arm64
- `install.sh` for curl-based installation
- Snapshot testing with `inspect()`
- Doc tests in `.mbt.md` files
- Benchmarks with `moon bench`
- GitHub Actions CI + Release workflow
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

1. Update version in `moon.mod.json` and `src/cmd/app/main.mbt`
2. Update `CHANGELOG.md`
3. Run `just release-check-all`
4. Create annotated tag: `git tag -a v0.2.0 -m "Release v0.2.0"`
5. Push branch and tag

## License

Apache-2.0
