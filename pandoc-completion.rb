require 'formula'

class PandocCompletion < Formula
  homepage 'https://github.com/dsanson/pandoc-completion'
  url 'https://github.com/dsanson/pandoc-completion.git'

  def install
    (prefix+'etc/bash_completion.d').install 'pandoc-completion.bash'
  end

end
