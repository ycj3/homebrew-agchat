class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    version "0.4.0"

    if Hardware::CPU.arm?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.4.0/agchat-0.4.0-macos-arm64.tar.gz"
      sha256 "56ceff3e7f60f1a580bbb409fbc59702fd8380aff92c0c4c0a727bd95ff2045b"
    elsif Hardware::CPU.intel?
      url "https://github.com/ycj3/agora-chat-cli/releases/download/v0.4.0/agchat-0.4.0-macos-amd64.tar.gz"
      sha256 "92d86951f1331cd680defa2c4010663bdef7e494caa11b972d8ef7be194b1880"
    end

    def install
      if Hardware::CPU.arm?
        bin.install "agchat-0.4.0-macos-arm64" => "agchat"
      elsif Hardware::CPU.intel?
        bin.install "agchat-0.4.0-macos-amd64" => "agchat"
      end
    end
    test do
      assert_match version.to_s, shell_output("#{bin}/agchat --version")
    end
  end