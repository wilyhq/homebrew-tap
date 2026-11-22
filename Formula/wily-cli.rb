class WilyCli < Formula
  desc "Command-line tool for wily"
  homepage "https://wily.bot/"
  # GitHub Releases first: dl.wily.bot (Cloudflare) stalls at ~24 KB in Russia without a VPN.
  url "https://github.com/wilyhq/wily/releases/download/v0.1.6/wily-cli-0.1.6-6a08656-macos-arm64.tar.gz"
  mirror "https://dl.wily.bot/installers/macos/wily-cli-0.1.6-6a08656-macos-arm64.tar.gz"
  version "0.1.6"
  sha256 "004977402309098a5ef3d8dc702491861b065365ae81c5c9eb308261c1be9444"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "wily"
    generate_completions_from_executable(bin/"wily", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wily --version")
  end
end
