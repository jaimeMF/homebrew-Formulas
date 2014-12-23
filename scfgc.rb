class Scfgc < Formula
  homepage "https://github.com/hugomg/scfgc"
  head "https://github.com/hugomg/scfgc.git"

  depends_on "objective-caml" => :build
  depends_on "opam" => :build
  depends_on "camlp4" => :build
  depends_on "ocamlfind" => :ocaml
  depends_on "core_kernel" => :ocaml
  depends_on "cmdliner" => :ocaml
  depends_on "fileutils" => :ocaml
  depends_on "menhir" => :ocaml

  def opam_var var
    `opam config var #{var}`.strip
  end

  def install
    # so that it can find the binaries installed with opam
    ENV.append_path "PATH", opam_var("bin")
    ENV.append_path "CAML_LD_LIBRARY_PATH", opam_var("stublibs")
    system "./build.sh", "main.native"
    bin.install "_build/main.native" => "scfgc"
  end
end
