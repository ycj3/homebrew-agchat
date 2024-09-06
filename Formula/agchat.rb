class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.3.2"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.2/agchat-0.3.2-macos-arm64.tar.gz"
      sha256 "11ac8aea31110691d080feebdcc9fc7377cb953229eaf90363730b11154f7efa"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.2/agchat-0.3.2-macos-amd64.tar.gz"
      sha256 "11ac8aea31110691d080feebdcc9fc7377cb953229eaf90363730b11154f7efa"
    end

    def install
      bin.install "agchat"
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end