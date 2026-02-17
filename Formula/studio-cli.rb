class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.2.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "855633664ba9ea4d6e618e2dbfd67b6c1e955767e5c49547efb3033b67acbc3d"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bc441bae7e846a97db0391e1a869c14c88f308b4e69b1679854bd15b09eac8e3"
    end
  end

  # on_linux do
  #   if Hardware::CPU.intel?
  #     url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
  #     sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX"
  #   end
  # end

  def install
    bin.install "studio_cli"
    bin.install "studio-agent"
  end
#  Install Claude CLI from: https://github.com/anthropics/claude-code
  def caveats
    <<~EOS
      Studio CLI requires Claude CLI to be installed separately.


      To run Studio CLI:
        studio_cli
    EOS
  end

  test do
    system "#{bin}/studio_cli", "--version"
  end
end
