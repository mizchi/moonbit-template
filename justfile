# MoonBit Project Commands

# Default target (js for browser compatibility)
target := "js"

# CLI binary name
bin := "app"

# Default task: check and test
default: check test

# Format code
fmt:
    moon fmt

# Type check
check:
    moon check --deny-warn --target {{target}}

# Run tests
test:
    moon test --target {{target}}

# Update snapshot tests
test-update:
    moon test --update --target {{target}}

# Run CLI (native)
run *args:
    moon run src/cmd/{{bin}} --target native -- {{args}}

# Build CLI binary (native release)
build:
    moon build --release --target native src/cmd/{{bin}}

# Install CLI to ~/.moon/bin
install:
    moon install ./src/cmd/{{bin}}

# Generate type definition files
info:
    moon info

# Clean build artifacts
clean:
    moon clean

# Pre-release check
release-check: fmt info check test

# Pre-release check on all supported targets
release-check-all:
    just release-check
    just target=native check test
