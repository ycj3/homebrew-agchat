class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.5.0"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.0/agchat-0.5.0-macos-arm64.tar.gz"
      sha256 "ff69d600ecc8b6ca11e9a5f90bf63c6d59be8775628739c1613247507608a460"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.0/agchat-0.5.0-macos-amd64.tar.gz"
      sha256 "f8f8f831bdae27696480241506b409434e02d7d5132636ec33b9fed0d7613a9a"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.5.0-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.5.0-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end