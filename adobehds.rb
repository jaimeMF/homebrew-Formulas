class Adobehds < Formula
  homepage "https://github.com/K-S-V/Scripts"
  head "https://github.com/K-S-V/Scripts.git"

  def install
    libexec.install "AdobeHDS.php"
    (bin/"AdobeHDS.php").write <<-EOS.undent
      #!/bin/sh
      exec php "#{libexec}/AdobeHDS.php" "$@"
    EOS
  end
end
