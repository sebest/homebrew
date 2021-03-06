require 'formula'

class Libhsclient < Formula
  homepage 'https://github.com/dailymotion/chash'
  url 'https://github.com/DeNADev/HandlerSocket-Plugin-for-MySQL/tarball/1.1.0'
  md5 '2865bc609df77209272fb7a7be80284a'

  depends_on "libtool"
  depends_on "automake"
  depends_on "autoconf"

  def install
    ENV["LIBTOOLIZE"] = "glibtoolize"
    ENV["MAKEFLAGS"] = "-j1"
    system "./autogen.sh"
    system "touch libhsclient/Makefile.in"
    system "touch handlersocket/Makefile.in"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--disable-handlersocket-server"
    system "cp libhsclient/Makefile.plain libhsclient/Makefile"
    system "make install"
  end
end
