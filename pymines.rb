require 'formula'

class Pymines < Formula
  homepage 'https://github.com/jaimeMF/PyMines'
  head 'https://github.com/jaimeMF/PyMines.git'

  def install
    exefile = 'mines_exe'
    system 'make' ,exefile ,"EXE_FILE=#{exefile}"
    move 'mines', 'mines_module'
    move exefile, 'mines'
    bin.install 'mines'
  end

end
