class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "72987314c75cecc7f0ed927df0bba4d778bd9c2bb1b559d5db10c0e9d1faabbc"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "367082139e595e98c192ffacaaf1c307e096861d9fdf99303f91a73c41fd0e12"
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
