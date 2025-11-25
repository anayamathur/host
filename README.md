# RAJ-HOST 🚀

**Complete Web Server & Virtual Host Management Tool**

One command to setup Nginx + PHP-FPM + MySQL/MariaDB virtual hosts on any Linux system.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://www.linux.org/)

## ✨ Features

- 🌐 **Universal**: Works on Ubuntu, Debian, CentOS, RHEL, Fedora, Rocky, AlmaLinux
- 🔧 **Auto-Installation**: Installs Nginx, PHP-FPM, MySQL/MariaDB if needed
- 🐘 **PHP Support**: Choose from PHP 7.4, 8.0, 8.1, 8.2, 8.3
- 🗄️ **Database Options**: MySQL 8.0 or MariaDB 10.11/11.0
- 🔒 **SSL/TLS**: Let's Encrypt automatic SSL or custom certificates
- ⚡ **Fast Setup**: Complete virtual host in under 2 minutes
- 🎨 **Beautiful UI**: Color-coded interactive prompts
- ✅ **Smart Validation**: Tests configuration before applying

## 🚀 Quick Install

### ⚡ One Command - That's All!

```bash
curl -s https://raw.githubusercontent.com/anayamathur/host/main/raj-host | sudo bash
```

**What this does:**
1. Downloads the script
2. Auto-installs to `/usr/local/bin/raj-host`
3. Makes it available globally
4. Starts the setup wizard

**No git clone, no download, no extraction needed!**

### Alternative Methods

<details>
<summary>Method 2: Git Clone (click to expand)</summary>

```bash
git clone https://github.com/anayamathur/host.git
cd host
sudo bash install.sh
```
</details>

<details>
<summary>Method 3: Manual Download (click to expand)</summary>

```bash
wget https://github.com/anayamathur/host/archive/refs/heads/main.zip
unzip main.zip
cd host-main
sudo bash install.sh
```
</details>

## 📖 Usage

After installation, simply run:

```bash
sudo raj-host
```

The interactive wizard will guide you through:

### 1️⃣ Software Installation (if needed)
- ✓ Nginx web server
- ✓ PHP-FPM (select version)
- ✓ MySQL or MariaDB (select type)

### 2️⃣ Virtual Host Configuration
- Domain name
- Document root
- Port number
- SSL/HTTPS setup
- Logging options

### 3️⃣ Automatic Setup
- Creates directories
- Generates Nginx config
- Sets permissions
- Enables virtual host
- Tests configuration
- Reloads Nginx

## 🎯 Example Usage

```bash
$ sudo raj-host

╔═══════════════════════════════════════════════════════════╗
║                    RAJ-HOST v1.0                          ║
║        Complete Web Server & Virtual Host Setup          ║
║     Nginx + PHP-FPM + MySQL + SSL Configuration           ║
╚═══════════════════════════════════════════════════════════╝

✓ Detected OS: ubuntu 22.04

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Checking Nginx...
Nginx is not installed.
Do you want to install Nginx? (y/n) [default: y]: y

Installing Nginx...
✓ Nginx 1.22.0 installed successfully

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Checking PHP-FPM...
Do you want to install PHP-FPM? (y/n) [default: n]: y

Select PHP version:
1) PHP 7.4
2) PHP 8.0
3) PHP 8.1
4) PHP 8.2
5) PHP 8.3 (Latest)
Enter choice [1-5]: 5

✓ PHP 8.3 installed successfully

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Checking Database Server...
Do you want to install database? (y/n) [default: n]: y

Select database:
1) MySQL 8.0
2) MariaDB 10.11 (Recommended)
3) MariaDB 11.0 (Latest)
Enter choice [1-3]: 2

✓ MariaDB 10.11 installed successfully

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Enter domain name: example.com
Add www subdomain? (y/n): y
Enter document root [/var/www/example.com]: 
Setup SSL/HTTPS? (y/n): y
Choose SSL: 1 (Let's Encrypt)

✓ Setup Complete!
Visit: http://example.com
```

## 📦 What Gets Installed

### Optional Components (user choice):
- **Nginx**: Latest stable version
- **PHP-FPM**: 7.4 / 8.0 / 8.1 / 8.2 / 8.3
- **PHP Extensions**: mysql, xml, curl, gd, mbstring, zip, bcmath
- **MySQL**: 8.0
- **MariaDB**: 10.11 or 11.0
- **Certbot**: For Let's Encrypt SSL

### Always Created:
- Virtual host configuration
- Document root directory
- Log directories
- Sample index file (HTML or PHP)
- Nginx server block

## 🖥️ Supported Systems

| OS | Versions | Status |
|---|---|---|
| Ubuntu | 18.04, 20.04, 22.04, 24.04 | ✅ Tested |
| Debian | 9, 10, 11, 12 | ✅ Tested |
| CentOS | 7, 8, 9 | ✅ Supported |
| RHEL | 7, 8, 9 | ✅ Supported |
| Rocky Linux | 8, 9 | ✅ Supported |
| AlmaLinux | 8, 9 | ✅ Supported |
| Fedora | 35+ | ✅ Supported |

## 🔧 Post-Installation

### View Logs
```bash
tail -f /var/log/nginx/yourdomain.com/access.log
tail -f /var/log/nginx/yourdomain.com/error.log
```

### Edit Configuration
```bash
# Ubuntu/Debian
sudo nano /etc/nginx/sites-available/yourdomain.com.conf

# CentOS/RHEL/Fedora
sudo nano /etc/nginx/conf.d/yourdomain.com.conf
```

### Test & Reload Nginx
```bash
sudo nginx -t
sudo systemctl reload nginx
```

### Secure MySQL
```bash
sudo mysql_secure_installation
```

### Check PHP Info
```bash
php -v
sudo systemctl status php8.3-fpm
```

## 🔒 Security Features

- ✓ Security headers (X-Frame-Options, X-Content-Type-Options, X-XSS-Protection)
- ✓ Hidden files protection
- ✓ SSL/TLS 1.2+ support
- ✓ Strong cipher configuration
- ✓ Gzip compression
- ✓ Access log monitoring

## 📁 File Locations

### Ubuntu/Debian
```
Configs:   /etc/nginx/sites-available/
Enabled:   /etc/nginx/sites-enabled/
Web Root:  /var/www/
Logs:      /var/log/nginx/
User:      www-data
```

### CentOS/RHEL/Fedora
```
Configs:   /etc/nginx/conf.d/
Web Root:  /usr/share/nginx/html/
Logs:      /var/log/nginx/
User:      nginx
```

## 🗑️ Uninstall

### Remove raj-host command
```bash
sudo rm /usr/local/bin/raj-host
```

### Remove a virtual host
```bash
# Ubuntu/Debian
sudo rm /etc/nginx/sites-{available,enabled}/domain.com.conf

# CentOS/RHEL
sudo rm /etc/nginx/conf.d/domain.com.conf

# Remove files and reload
sudo rm -rf /var/www/domain.com
sudo rm -rf /var/log/nginx/domain.com
sudo systemctl reload nginx
```

## 🐛 Troubleshooting

### Port already in use
```bash
sudo netstat -tulpn | grep :80
sudo netstat -tulpn | grep :443
```

### Nginx won't start
```bash
sudo nginx -t
sudo systemctl status nginx
sudo journalctl -xe
```

### SSL issues
```bash
# Ensure DNS is configured
dig yourdomain.com

# Renew certificates
sudo certbot renew

# Test renewal
sudo certbot renew --dry-run
```

### Permission issues
```bash
sudo chown -R www-data:www-data /var/www/domain.com
sudo chmod -R 755 /var/www/domain.com
```

## 💡 Tips & Best Practices

1. **Backup configurations** before making changes
2. **Use Let's Encrypt** for free SSL certificates
3. **Enable logging** for troubleshooting
4. **Test config** before reloading: `nginx -t`
5. **Set DNS records** before SSL setup
6. **Secure MySQL** after installation
7. **Keep software updated** regularly

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License.

## 🙏 Support

If you find this tool helpful, please star the repository!

## 📞 Contact

For issues or questions, please open an issue on GitHub.

---

**Made with ❤️ for the Linux community**

🌟 Star this repo if you find it useful!
