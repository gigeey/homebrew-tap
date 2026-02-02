class StudioCli < Formula
  desc "Interactive terminal-based project management system with integrated AI agent capabilities"
  homepage "https://github.com/gigeey/studio-cli-releases"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e631a9e652389a81406f846ee3073bec11ea13275c2e5afbbc8bb74fdb973645"
    elsif Hardware::CPU.arm?
      url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "16f028feba11bbf83513f22d4e913c7d2a73e5c6625a2fe6f6cb14004ab417c3"
    end
  end

  # on_linux do
  #   if Hardware::CPU.intel?
  #     url "https://github.com/gigeey/studio-cli-releases/releases/download/v#{version}/studio-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
  #     sha256 "REPLACE_WITH_ACTUAL_SHA256_FOR_LINUX"
  #   end
  # end

  depends_on "claude-cli" => :recommended

  def install
    bin.install "studio_cli"
    bin.install "studio-agent"
  end

  test do
    system "#{bin}/studio_cli", "--version"
  end
end
