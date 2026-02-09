class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4d21a5e45b04322d634de15773317355634a5207cecc2ec9ac6150acebbdd1bb"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a620b1765608cc4e1824bc1a200318b9d0ed9b716823820a78ec776424d2ab9f"
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
