class WilyCli < Formula
  desc "Command-line tool for wily"
  homepage "https://wily.bot/"
  url "https://dl.wily.bot/installers/macos/wily-cli-0.1.4-35d3ac2-macos-arm64.tar.gz"
  version "0.1.4"
  sha256 "7be9af0f8ea84ff385aba8d5fdc657f9c9c0ed804ddedee2df7484df48c23181"

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
