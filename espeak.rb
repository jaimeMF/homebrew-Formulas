require 'formula'

class Espeak < Formula
  homepage 'http://espeak.sourceforge.net/'
  url 'http://sourceforge.net/projects/espeak/files/espeak/espeak-1.47/espeak-1.47.11-source.zip/download'
  sha1 'c9d12c8f58aaac467fdde4a101204a0a68d2d16f'

  depends_on 'portaudio'

  def install
    share.install 'espeak-data'
    cd 'src' do
      rm 'portaudio.h'
      system 'make', 'speak', "DATADIR=#{share}/espeak-data", "PREFIX=#{prefix}"
      bin.install 'speak'
    end
  end

  test do
    system 'speak', 'This is a test for Espeak.'
  end
end
