class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.2.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "87bacf5a96d864c572bd7cacc84f4ef67ea1a67736697bc2fc27dce30e4f98a5"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "40f4357edfbd476a876255f74bf50e9aa2a51b917b2baf6d90a5256cd82bfa52"
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
      Studio CLI requires Claude CLI / Cursor cli to be installed separately.


      To run Studio CLI:
        studio_cli
    EOS
  end

  test do
    system "#{bin}/studio_cli", "--version"
  end
end
