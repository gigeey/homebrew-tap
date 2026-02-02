class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "58055425f2b8e1a8e6b08be5d8ef4b258a99fbcab1dcb4a929d55d9f5b3fb26b"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d2b847a1efbb66d4bca9007e4d428a28809ee611cbaed656be14243277e3eb01"
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
