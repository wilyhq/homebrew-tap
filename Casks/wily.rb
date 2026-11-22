cask "wily" do
  version "0.1.4,35d3ac2"
  sha256 "7278d0f7adb610f6fc7483457bd622bd14b9283c80e6d11ef281cdde1d65f6ba"

  url "https://dl.wily.bot/installers/macos/wily-#{version.csv.first}-#{version.csv.second}-macos-arm64.zip"
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
