cask "wily" do
  version "0.1.6,6a08656"
  sha256 "d9222fa4e40ec0bde1fae07a2528d540c83f061e6975660c95364b431aaa77f0"

  # GitHub Releases, not dl.wily.bot: Cloudflare stalls at ~24 KB in Russia without a VPN (measured 22.11.2026).
  url "https://github.com/wilyhq/wily/releases/download/v#{version.csv.first}/wily-#{version.csv.first}-#{version.csv.second}-macos-arm64.zip",
      verified: "github.com/wilyhq/wily/"
  name "wily"
  desc "Desktop app and command-line tool for wily"
  homepage "https://wily.bot/"

  # The app checks updates.wily.bot itself (Settings → Updates) and replaces itself.
  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "wily.app"
  binary "#{appdir}/wily.app/Contents/MacOS/wily"

  # Until builds are notarized by Apple, macOS refuses to open a downloaded copy: the
  # quarantine flag is taken off this app only.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "wily.app"], chdir: "{{appdir}}"
  end

  zap trash: "~/Library/Application Support/bot.wily.wily"
end
