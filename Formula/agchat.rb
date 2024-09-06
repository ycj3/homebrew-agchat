class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
  version "0.3.3"

    if Hardware::CPU.arm?
    url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-arm64.tar.gz"
    sha256 ""
    elsif Hardware::CPU.intel?
    url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-amd64.tar.gz"
    sha256 ""
    end

    def install
      bin.install "agchat"
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end