class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.3.3"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-arm64.tar.gz"
      sha256 "183f4f4cfe4bdfcb61230bd9aceb81619bc449ee7a5eb8e18b86b59d2340af82"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-amd64.tar.gz"
      sha256 "fcf319002209b5c3811f6493d5ffc947ec2345464317d1c5a2a2e9aa9cc5b018"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "bin/agchat-#{version}-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "bin/agchat-#{version}-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end