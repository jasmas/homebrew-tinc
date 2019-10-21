class TincPre < Formula
  desc "Virtual Private Network (VPN) tool"
  homepage "https://www.tinc-vpn.org/"
  url "http://tinc-vpn.org/packages/tinc-1.1pre17.tar.gz"
  sha256 "61b9c9f9f396768551f39216edcc41918c65909ffd9af071feb3b5f9f9ac1c27"

  bottle do
    cellar :any
    sha256 "fcaaca6b5abf4f30a55149f41871a7c4ec99fe8a9dc87ddb68ea735c03569a66" => :catalina
    sha256 "ba34dc41517f617c4d61d61e2f76cbafd9b75aa5edacc894e5b24e97cfb269f5" => :mojave
    sha256 "a5ec2ae5f1e6252f80f33158bb0a1140e29764ed1f2e8754dcedf50e4fb49290" => :high_sierra
    sha256 "923b15d1dcd7aafbb566f83edc9cced61b13379e857243bbe28b2755270b542d" => :sierra
  end

  depends_on "lzo"
  depends_on "openssl@1.1"
  conflicts_with "tinc"

  def install
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}",
                          "--with-openssl=#{Formula["openssl@1.1"].opt_prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{sbin}/tincd --version")
  end
end
