class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.3.3"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-arm64.tar.gz"
      sha256 "c3284e951476d51d94d3ae8ab6da2aa3ec6c2f8370b1b4357cb8c5f43f305337"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-amd64.tar.gz"
      sha256 "b8ce0f23b668331319b50afdbb88bf8c4684c86168b3237ff43bd76a93e899ac"
    end

    def install
      if Hardware::CPU.arm?
      bin.install "bin/agchat-0.3.3-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
      bin.install "bin/agchat-0.3.3-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end