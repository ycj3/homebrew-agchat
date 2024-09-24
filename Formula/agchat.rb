class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.5.2"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.2/agchat-0.5.2-macos-arm64.tar.gz"
      sha256 "3a462af4432936e3fb6077af186d40243e92733870badd1deaf2686c8c4330c9"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.5.2/agchat-0.5.2-macos-amd64.tar.gz"
      sha256 "f26ff16de6901944215cd3fdb029f0e6f3291df98f2dcaa8e039a1145eb63eb8"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.5.2-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.5.2-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end