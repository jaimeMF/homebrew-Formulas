require "language/haskell"

class Compleat < Formula
  include Language::Haskell::Cabal

  homepage "https://github.com/mbrubeck/compleat"
  head "https://github.com/mbrubeck/compleat.git"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    cabal_sandbox do
      cabal_install "--only-dependencies"
      cabal_install "--prefix=#{prefix}"
    end
    cabal_clean_lib
  end
end
