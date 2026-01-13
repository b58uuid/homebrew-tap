# B58UUID Homebrew Tap

Official Homebrew tap for [B58UUID CLI](https://github.com/b58uuid/b58uuid-cli).

## Installation

```bash
# Add tap
brew tap b58uuid/tap

# Install
brew install b58uuid

# Or one-liner
brew install b58uuid/tap/b58uuid
```

## Usage

```bash
# Encode UUID to B58UUID
b58uuid encode 550e8400-e29b-41d4-a716-446655440000

# Decode B58UUID to UUID
b58uuid decode BWBeN28Vb7cMEx7Ym8AUzs

# Generate random B58UUID
b58uuid generate

# Validate format
b58uuid validate BWBeN28Vb7cMEx7Ym8AUzs

# Get help
b58uuid --help
```

## Updating

```bash
brew update
brew upgrade b58uuid
```

## Uninstalling

```bash
brew uninstall b58uuid
brew untap b58uuid/tap
```

## Links

- **Website**: https://b58uuid.io
- **GitHub**: https://github.com/b58uuid/b58uuid-cli
- **Documentation**: https://github.com/b58uuid/b58uuid-cli#readme

## License

MIT License - see [LICENSE](https://github.com/b58uuid/b58uuid-cli/blob/main/LICENSE)
