class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.5.1"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.1/agchat-0.5.1-macos-arm64.tar.gz"
      sha256 "132ac5909ad3e4bcad41262c1ac2cc01c6e7438be38ae97222f187cc0f207371"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.1/agchat-0.5.1-macos-amd64.tar.gz"
      sha256 "b1a782c2bc777eb0a4ba7e0a7c9415e8febdf4e41fe1d6d7fbad12c2e78765ec"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.5.1-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.5.1-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end