require 'formula'

class FirefoxAddonSdk < Formula
  homepage 'https://github.com/mozilla/addon-sdk/'
  url 'https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-1.16.tar.gz'
  sha1 'd282f575523f5577cf0f7a604b1084ab3fa3468b'

  def patches
    DATA
  end

  def install
    system 'make', "PREFIX=#{prefix}"
    prefix.install Dir['*']
  end

  def caveats
    "Call 'cd `firefox-addon-sdk-prefix` && source bin/activate' for setting the environment."
  end

end

__END__
diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..575c064
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,8 @@
+all: bin/firefox-addon-sdk-prefix
+
+bin/firefox-addon-sdk-prefix:
+	echo "#!/bin/sh" > $@
+	echo "echo $(PREFIX)" >> $@
+	chmod 755 $@
+
+.PHONY: bin/firefox-addon-sdk-prefix
