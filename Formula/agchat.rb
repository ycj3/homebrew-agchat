class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    url "https://github.com/ycj3/agora-chat-cli/archive/v0.3.2.tar.gz"
    sha256 "11ac8aea31110691d080feebdcc9fc7377cb953229eaf90363730b11154f7efa"
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
  