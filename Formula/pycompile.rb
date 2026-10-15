class Pycompile < Formula
  desc "Compile Python source files into standalone native binaries"
  homepage "https://github.com/ramackersjp/pycompile"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ramackersjp/pycompile/releases/download/v0.2.0/pycompile-aarch64-apple-darwin.tar.gz"
      sha256 "f41a52e13825fcdd08824f2c3424b0265f23b3c3beae09337692b99f6417c3b5"
    end
    on_intel do
      url "https://github.com/ramackersjp/pycompile/releases/download/v0.2.0/pycompile-x86_64-apple-darwin.tar.gz"
      sha256 "5a92f09557635ab1a22e4739c0919fde24790ec93e5aaf6091ce43751a4b4c1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ramackersjp/pycompile/releases/download/v0.2.0/pycompile-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46af361406a9cdad74e4fd40216c0be62d912ef57dca0dde610b78a02f636d37"
    end
    on_intel do
      url "https://github.com/ramackersjp/pycompile/releases/download/v0.2.0/pycompile-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68ecd39fd87b4d20a8756b73ef7dbe77967056ad253b8a4b4fc7c329693cec98"
    end
  end

  def install
    bin.install "pycompile"
    man1.install "pycompile.1" => "pycompile.1"
  end

  test do
    (testpath/"hello.py").write("print('Hello, World!')\n")
    system bin/"pycompile", "hello.py", "-o", "hello"
    assert_equal "Hello, World!\n", shell_output("./hello")
  end
end
