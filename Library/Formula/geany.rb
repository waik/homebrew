require 'formula'

class Geany < Formula
  homepage 'http://geany.org/'
  url 'http://download.geany.org/geany-0.21.tar.gz'
  sha256 'a1aa27d2f946ccca8a4e57faf0029cf6aa544d5d52f0170e017c137c33b4b67d'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on 'intltool'
  depends_on 'gtk+'

  def install
    intltool = Formula.factory('intltool')
    ENV.append "PATH", intltool.bin, ":"
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
