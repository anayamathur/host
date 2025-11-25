class RajHost < Formula
  desc "Complete web hosting automation tool with Nginx, PHP, MySQL, and SSL management"
  homepage "https://github.com/anayamathur/host"
  url "https://github.com/anayamathur/host/releases/download/v1.0.0/raj-host-1.0.0.tar.gz"
  sha256 "4d8a15643ac89ad04f8ee1f96c6bd113d538dd24270b8abc35dcce887adc6a21"
  version "1.0.0"
  license "MIT"

  depends_on "curl"
  depends_on "bash"

  def install
    bin.install "raj-host"
  end

  def caveats
    <<~EOS
      RAJ-HOST has been installed successfully!

      Usage: sudo raj-host

      Features:
        ✓ Nginx installation & configuration
        ✓ PHP-FPM (7.4, 8.0, 8.1, 8.2, 8.3)
        ✓ MySQL/MariaDB installation
        ✓ SSL/TLS (Let's Encrypt + Custom)
        ✓ Virtual host management

      Note: This tool requires sudo/root privileges to run.
    EOS
  end

  test do
    system "#{bin}/raj-host", "--version"
  end
end
