class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.6.0"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.6.0/agchat-0.6.0-macos-arm64.tar.gz"
      sha256 "6ebd023c45d6a60691d39634f1d1193dd8755ce64195fd1691412ef101727b51"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.6.0/agchat-0.6.0-macos-amd64.tar.gz"
      sha256 "bac6ae82db5bedc4d4fe8bd3761851ff066a27739e856176ae7a967c73887c69"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.6.0-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.6.0-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end