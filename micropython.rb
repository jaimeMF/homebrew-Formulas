class Micropython < Formula
  homepage "https://github.com/micropython/micropython"
  head "https://github.com/micropython/micropython.git"

  resource "micropython-lib" do
    url "https://github.com/micropython/micropython-lib.git"
  end

  depends_on "pkg-config" => :build
  # micropython-lib requires GNU core utils
  # https://github.com/micropython/micropython-lib/issues/10
  depends_on "findutils" => [:build]
  depends_on "coreutils" => [:build]

  depends_on "libffi"
  depends_on "readline"

  def install
    cd "unix" do
      inreplace "main.c" do |s|
        s.gsub! "/usr/lib/micropython", "#{lib}/micropython"
      end
      system "make", "PREFIX=#{prefix}"
      bin.install "micropython"
    end

    resource("micropython-lib").stage do
      inreplace "Makefile" do |s|
        s.gsub! "find", "gfind"
        s.gsub! "cp", "gcp"
        s.gsub! "xargs", "gxargs"
      end
      system "make", "install", "PREFIX=#{lib}/micropython"
    end
  end

  test do
    system "#{bin}/micropython", "-c", "import os"
  end
end
