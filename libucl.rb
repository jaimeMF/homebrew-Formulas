class Libucl < Formula
  homepage "https://github.com/vstakhov/libucl"
  url "https://github.com/vstakhov/libucl/archive/0.7.3.tar.gz"
  sha256 "2f69995c7f8320350f56c1183c395cc4a2a958331f22d60b7839a117c9c601e1"

  head "https://github.com/vstakhov/libucl.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  depends_on "lua" => :optional

  def install
    system "./autogen.sh"
    args = ["--prefix=#{prefix}",
            "--enable-utils",
           ]

    args << "--enable-lua" if build.with? "lua"

    system "./configure", *args
    system "make", "install"
  end
end
