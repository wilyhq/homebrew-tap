# wilyhq/homebrew-tap

Homebrew tap for [wily](https://wily.bot).

```sh
brew tap wilyhq/tap
brew trust --tap wilyhq/tap            # Homebrew loads third-party taps only once trusted
brew install --cask wilyhq/tap/wily   # desktop app (updates itself after install)
brew install wilyhq/tap/wily-cli      # command-line tool
```

Both update themselves from `updates.wily.bot` (`wily self-update`, or Settings → Updates in the
app). Binaries are downloaded from `dl.wily.bot`; this repository holds only the manifests.

Apple Silicon (arm64) only for now. Builds are not notarized yet, so the cask takes the
quarantine flag off `wily.app` after install.
