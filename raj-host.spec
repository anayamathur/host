Name:           raj-host
Version:        1.0.1
Release:        1%{?dist}
Summary:        Complete Web Server & Virtual Host Management Tool
License:        MIT
URL:            https://github.com/anayamathur/host
BuildArch:      noarch
Requires:       curl, bash

%description
RAJ-HOST is a powerful script that automates the setup of Nginx,
PHP-FPM, MySQL/MariaDB, and virtual hosts on Linux systems.

Features:
- Auto-installation of Nginx, PHP-FPM, MySQL/MariaDB
- Support for PHP 7.4, 8.0, 8.1, 8.2, 8.3
- SSL/TLS with Let's Encrypt or custom certificates
- Works on Ubuntu, Debian, CentOS, RHEL, Fedora, Rocky, AlmaLinux

%prep
# No prep needed

%build
# No build needed

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/local/bin
install -m 0755 %{_sourcedir}/raj-host %{buildroot}/usr/local/bin/raj-host

%files
/usr/local/bin/raj-host

%post
echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║         RAJ-HOST installed successfully!                  ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
echo "Usage: raj-host"
echo ""
echo "Features:"
echo "  ✓ Nginx installation & configuration"
echo "  ✓ PHP-FPM (7.4, 8.0, 8.1, 8.2, 8.3)"
echo "  ✓ MySQL/MariaDB installation"
echo "  ✓ SSL/TLS (Let's Encrypt + Custom)"
echo "  ✓ Virtual host management"
echo ""

%changelog
* Mon Nov 25 2024 Raj <raj@example.com> - 1.0.1-1
- Enable auto-sudo elevation - users can now run 'raj-host' directly without sudo prefix
- Script automatically re-executes with sudo when needed
- Updated all documentation to reflect simplified usage

* Mon Nov 25 2024 Raj <raj@example.com> - 1.0.0-1
- Initial release
