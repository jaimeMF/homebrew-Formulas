class Mxmlc < Formula
  homepage "https://flex.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=flex/4.14.0/binaries/apache-flex-sdk-4.14.0-bin.tar.gz"
  sha256 "d745d904f7fd6754277c9eea4ca4a13883d886a5127573b6ae546ab262365c01"

  depends_on "ant" => :build
  depends_on "openssl"

  def install
    # https://cwiki.apache.org/confluence/display/FLEX/Installation+help#Installationhelp-Ant-basedinstaller
    system "yes | ant -f installer.xml -Dair.sdk.version=2.6"
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/mxmlc"
  end
end
