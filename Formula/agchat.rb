class Agchat < Formula
    desc "A command-line interface for Agora Chat"
    homepage "https://github.com/ycj3/agora-chat-cli"
    url "https://github.com/ycj3/agora-chat-cli/archive/v0.2.0.tar.gz"
    sha256 "f9fd22b8065dd5e141028271863962583e6e50726d74a99e542045bb3f7fd57b"
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
  