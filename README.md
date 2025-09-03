# 🔍 R3CON - Advanced Reconnaissance Tool

```
    ____ _____ __________  _   __
   / __ \__  // ____/ __ \/ | / /
  / /_/ //_ </ /   / / / /  |/ /
 / _, _/__/ / /___/ /_/ / /|  /
/_/ |_/____/\____/\____/_/ |_/

    ____
   / __ )__  __
  / __  / / / /
 / /_/ / /_/ /
/_____/\__, /
      /____/
    ____  __  ______  _______  _______ __  __
   / __ \/ / / / __ \/ ____/ |/ / ___// / / /
  / / / / / / / /_/ / / __ |   /\__ \/ /_/ /
 / /_/ / /_/ / _, _/ /_/ //   |___/ / __  /
/_____/\____/_/ |_|\____//_/|_/____/_/ /_/
```

> **Respect is earned. Access is taken. Talk less. Scan more.**

A comprehensive reconnaissance automation tool designed for penetration testers and bug bounty hunters. R3CON performs complete subdomain enumeration, vulnerability scanning, and screenshot capture in a single command.

## 🚀 One-Liner Installation

### For Kali Linux / Debian-based Systems:

```bash
curl -sSL https://raw.githubusercontent.com/durgeshw22/r3con/main/r3con/install.sh | bash
```

### Manual Installation Steps:

<details>
<summary>Click to expand manual installation</summary>

```bash
# Clone the repository
git clone https://github.com/durgeshw22/r3con.git
cd r3con/r3con

# Run installation script
chmod +x install.sh
./install.sh
```

</details>

## 🛠️ What Gets Installed

| Tool | Version | Purpose |
|------|---------|---------|
| **subfinder** | v2.8.0 | Subdomain enumeration |
| **httpx** | v1.7.1 | HTTP probing and validation |
| **nuclei** | v3.4.10 | Vulnerability scanning |
| **waybackurls** | v0.1.0 | Archive URL collection |
| **getJS** | v1.0 | JavaScript file extraction |
| **gowitness** | v3.0.5 | Screenshot capture |

## 📋 Features

- ✅ **Automated Subdomain Discovery** - Find all subdomains using multiple sources
- ✅ **Live Host Detection** - Identify active services and ports
- ✅ **Archive URL Collection** - Extract historical URLs from Wayback Machine
- ✅ **Parameter Discovery** - Find URLs with GET/POST parameters
- ✅ **JavaScript Analysis** - Extract and analyze JS files for endpoints
- ✅ **Vulnerability Scanning** - Automated security assessment with Nuclei
- ✅ **Visual Reconnaissance** - Automated screenshot capture
- ✅ **Organized Output** - Clean, structured results with timestamps

## 🎯 Usage

### Basic Scan:
```bash
~/r3con.sh example.com
```

### With Parameter Scanning:
```bash
~/r3con.sh example.com params
```

### Global Command (if symlink worked):
```bash
r3con example.com
```

## 📊 Sample Output

```

```
    ____ _____ __________  _   __
   / __ \__  // ____/ __ \/ | / /
  / /_/ //_ </ /   / / / /  |/ /
 / _, _/__/ / /___/ /_/ / /|  /
/_/ |_/____/\____/\____/_/ |_/

    ____
   / __ )__  __
  / __  / / / /
 / /_/ / /_/ /
/_____/\__, /
      /____/
    ____  __  ______  _______  _______ __  __
   / __ \/ / / / __ \/ ____/ |/ / ___// / / /
  / / / / / / / /_/ / / __ |   /\__ \/ /_/ /
 / /_/ / /_/ / _, _/ /_/ //   |___/ / __  /
/_____/\____/_/ |_|\____//_/|_/____/_/ /_/
```

> **Respect is earned. Access is taken. Talk less. Scan more.**
🔍 R3CON Reconnaissance Results:

[1] Running subfinder...
    Subdomains found: 15
    ✔ Subdomains stored at: Recon-example.com-03-09-2025/subdomains.txt

[2] Probing live subdomains with httpx...
    Live hosts found: 8
    ✔ Live hosts stored at: Recon-example.com-03-09-2025/live.txt

[3] Fetching archive URLs with waybackurls...
    Wayback URLs found: 45,234
    ✔ Wayback URLs stored at: Recon-example.com-03-09-2025/wayback-main.txt

[4] Extracting URLs with parameters from wayback...
    Parameter URLs found: 12,567
    ✔ Parameter URLs stored at: Recon-example.com-03-09-2025/params.txt

[5] Extracting archived JS URLs from wayback...
    JS files found: 1,234
    ✔ Archived JS files stored at: Recon-example.com-03-09-2025/js-files.txt

[6] Extracting live JS files from live hosts using getJS...
    Live JS files found: 45
    ✔ Live JS files stored at: Recon-example.com-03-09-2025/livejs.txt

[7] Running nuclei vulnerability scan...
    Vulnerabilities found: 3
    ✔ Nuclei results stored at: Recon-example.com-03-09-2025/nuclei-results.txt

[8] Taking screenshots of live hosts with GoWitness...
    Screenshots saved: 8
    ✔ Screenshots stored at: Recon-example.com-03-09-2025/screenshots/

╔══════════════════════════════════════════════════╗
║         Recon Complete!                         ║
╚══════════════════════════════════════════════════╝

All results organized in: Recon-example.com-03-09-2025/
```

## 📁 Output Structure

```
Recon-[domain]-[date]/
├── subdomains.txt          # All discovered subdomains
├── live.txt               # Active HTTP/HTTPS hosts
├── wayback-main.txt       # All Wayback Machine URLs
├── params.txt             # URLs with parameters
├── js-files.txt           # Archived JavaScript files
├── livejs.txt             # Live JavaScript endpoints
├── nuclei-results.txt     # Vulnerability scan results
└── screenshots/           # Website screenshots
    ├── host1.png
    ├── host2.png
    └── ...
```

## 🔧 Advanced Usage

### Parameter Scanning Mode:
When you have a large number of parameter URLs, use the `params` flag to enable deep parameter scanning:

```bash
~/r3con.sh target.com params
```

This will:
- Scan all parameter URLs for vulnerabilities
- Perform deeper analysis on extracted parameters
- May take significantly longer but provides comprehensive results

### Custom Configurations:

<details>
<summary>Subfinder Configuration</summary>

Create `~/.config/subfinder/config.yaml` for API keys:
```yaml
shodan: ["your_shodan_api_key"]
censys: ["your_censys_api_id:your_censys_secret"]
github: ["your_github_token"]
```

</details>

<details>
<summary>Nuclei Custom Templates</summary>

```bash
# Update nuclei templates
nuclei -update-templates

# Use custom template directory
nuclei -t /path/to/custom/templates/
```

</details>

## 🛡️ Requirements

- **Operating System**: Kali Linux, Ubuntu, Debian-based distributions
- **Architecture**: x86_64 (amd64)
- **Internet Connection**: Required for tool downloads and scanning
- **Disk Space**: ~500MB for tools + variable for results
- **RAM**: Minimum 2GB recommended

## 🔍 Troubleshooting

<details>
<summary>Installation Issues</summary>

**Problem**: Installation hangs or fails
```bash
# Check internet connection
ping github.com

# Manually run installation with verbose output
curl -sSL https://raw.githubusercontent.com/durgeshw22/r3con/main/r3con/install.sh | bash -x
```

**Problem**: Permission denied errors
```bash
# Ensure you have sudo privileges
sudo -v

# Check if tools are in PATH
echo $PATH | grep -o '/usr/local/bin'
```

</details>

<details>
<summary>Runtime Issues</summary>

**Problem**: Tool not found errors
```bash
# Check if tools are installed
which subfinder httpx nuclei waybackurls getJS gowitness

# Reinstall if missing
curl -sSL https://raw.githubusercontent.com/durgeshw22/r3con/main/r3con/install.sh | bash
```

**Problem**: No results or low results
```bash
# Check domain accessibility
ping target.com

# Verify DNS resolution
nslookup target.com

# Run with debug output
~/r3con.sh target.com 2>&1 | tee debug.log
```

</details>

## 📈 Performance Tips

- **Parallel Processing**: The tool runs multiple processes simultaneously for speed
- **Network Optimization**: Use from a VPS with good internet connectivity for faster results
- **Resource Management**: Large targets may require significant disk space and time
- **API Keys**: Configure API keys for subfinder to get more comprehensive results

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request

## ⚠️ Legal Disclaimer

This tool is for **authorized testing only**. Users are responsible for complying with applicable laws and regulations. The authors assume no liability for misuse of this tool.

**Only test on:**
- Systems you own
- Systems you have explicit permission to test
- Bug bounty programs with proper scope

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏆 Credits

**Developed by**: [@durgeshw22](https://github.com/durgeshw22)

**Built with amazing tools from**:
- [ProjectDiscovery](https://github.com/projectdiscovery) - subfinder, httpx, nuclei
- [tomnomnom](https://github.com/tomnomnom) - waybackurls
- [003random](https://github.com/003random) - getJS  
- [sensepost](https://github.com/sensepost) - gowitness

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/durgeshw22/r3con/issues)
- **Discussions**: [GitHub Discussions](https://github.com/durgeshw22/r3con/discussions)

---

<div align="center">

**⭐ Star this repository if you find it useful!**

Made with ❤️ for the cybersecurity community

</div>
