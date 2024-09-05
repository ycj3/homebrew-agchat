class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    url "https://github.com/ycj3/agora-chat-cli/archive/v0.3.1.tar.gz"
    sha256 "3354bfeb523182319c10c2df216147360e6ab9e12c8ab9080ed488fa5dd1dcb7"
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
  