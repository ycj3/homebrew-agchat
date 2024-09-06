class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.3.3"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-arm64.tar.gz"
      sha256 "5101937ba4088bf63fb56529e38d6dd8aba3851f3c79cd4b6772c0ca75e01bee"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.3.3/agchat-0.3.3-macos-amd64.tar.gz"
      sha256 "24b131d454442d93fdfabf2db0479a3a15d8291406556244bebfaaff607f1c8d"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.3.3-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.3.3-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end