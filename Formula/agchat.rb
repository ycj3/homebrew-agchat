class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    url "https://github.com/ycj3/agora-chat-cli/archive/v0.3.1.tar.gz"
    sha256 "d14d5fe5fb4d781b7f809de66f2fb44b9edc45a15670884b6a6c73835e82261f"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
        if Hardware::CPU.arm?
          system "go", "build", *std_go_args(ldflags: "-s -w -buildmode=pie")
        elsif Hardware::CPU.intel?
          system "go", "build", *std_go_args(ldflags: "-s -w")
        end
      end
  
    test do
      assert_match "agchat", shell_output("#{bin}/agchat --version")
    end
  end
  