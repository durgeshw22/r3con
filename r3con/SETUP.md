---

# R3CON - Advanced Reconnaissance Framework

<p align="center">
	<img src="banner.png" alt="R3CON Banner" width="600">
</p>

<p align="center">
	<strong>Automated reconnaissance and vulnerability scanning tool for bug bounty hunters and penetration testers</strong>
</p>

<p align="center">
	<a href="#installation">Installation</a> •
	<a href="#features">Features</a> •
	<a href="#usage">Usage</a> •
	<a href="#sample-output">Sample Output</a> •
	<a href="#tools-included">Tools Included</a> •
	<a href="#troubleshooting">Troubleshooting</a>
</p>

<p align="center">
	<i>"Respect is earned. Access is taken. Talk less. Scan more"</i>
</p>

## Features

- 🔍 **Subdomain Enumeration**: Discover all subdomains for a target
- 🌐 **Live Host Detection**: Find which hosts are actually live
- 📚 **Historical URL Discovery**: Extract URLs from Wayback Machine
- 🔗 **Parameter URL Identification**: Find potential injection points
- 📜 **JavaScript Analysis**: Extract both archived and live JS files
- 🔒 **Vulnerability Scanning**: Automatically detect security issues
- 📸 **Website Screenshots**: Take screenshots of all live hosts
- 📊 **Vulnerability Summary**: Clean output of found security issues

## Usage

### Basic Scan
```bash
r3con example.com
```

### Scan with Parameter Testing
```bash
r3con example.com params
```

All results are organized in a folder named `Recon-domain-date` in your current directory.

## Sample Output

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
/_____\__, /
			/____/
		____  __  ______  _______  _______ __  __
	 / __ \/ / / / __ \/ ____/ |/ / ___// / / /
	/ / / / / / / /_/ / / __ |   /\__ \/ /_/ /
 / /_/ / /_/ / _, _/ /_/ //   |___/ / __  /
/_____\____/_/ |_\____//_/|_/____/_/ /_/


	Respect is earned. Access is taken.
			Talk less. Scan more

[1] Running subfinder...
		Subdomains found: 7
		✔ Subdomains stored at: Recon-httpbin.org-27-07-2025/subdomains.txt
[2] Probing live subdomains with httpx...
		Live hosts found: 2
		✔ Live hosts stored at: Recon-httpbin.org-27-07-2025/live.txt
[3] Fetching archive URLs with waybackurls...
		Wayback URLs found: 37943
		✔ Wayback URLs stored at: Recon-httpbin.org-27-07-2025/wayback-main.txt
[4] Extracting URLs with parameters from wayback...
		Parameter URLs found: 35947
		✔ Parameter URLs stored at: Recon-httpbin.org-27-07-2025/params.txt
[5] Extracting archived JS URLs from wayback...
		JS files found: 222
		✔ Archived JS files stored at: Recon-httpbin.org-27-07-2025/js-files.txt
[6] Extracting live JS files from live hosts using getJS...
/flasgger_static/swagger-ui-bundle.js
/flasgger_static/swagger-ui-standalone-preset.js
/flasgger_static/lib/jquery.min.js
/flasgger_static/swagger-ui-bundle.js
/flasgger_static/swagger-ui-standalone-preset.js
/flasgger_static/lib/jquery.min.js
		Live JS files found: 6
		✔ Live JS files stored at: Recon-httpbin.org-27-07-2025/livejs.txt
[7] Running nuclei vulnerability scan...

[...]

Vulnerability Summary:
• 6 vulnerabilities found in live hosts
			2 [httpbin-xss] [http] [high]
			2 [httpbin-open-redirect] [http] [medium]
			2 [httpbin-contenttype-xss] [http] [medium]
```

## Tools Included

- **subfinder**: Fast passive subdomain enumeration tool
- **httpx**: Fast and multi-purpose HTTP toolkit
- **waybackurls**: Fetch URLs from Wayback Machine
- **getJS**: Extract JavaScript files from websites
- **nuclei**: Vulnerability scanner with templates
- **gowitness**: Website screenshot utility

## Troubleshooting

### Rate Limiting Issues
If you encounter rate limiting issues, try using AnonSurf or a VPN:

```bash
# Install AnonSurf
sudo apt install anonsurf

# Start anonymous browsing
sudo anonsurf start

# Run your scan
r3con example.com

# Return to normal
sudo anonsurf stop
```

### Missing Tools
If you get "command not found" errors, ensure your Go environment is properly set up:
```bash
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc
```

## Legal Disclaimer
R3CON is provided for educational and ethical purposes only. Only scan targets you have permission to test. The authors are not responsible for any misuse or damage caused by this program.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

---

Made with ❤️ by [Durgesh2202](https://github.com/Durgesh2202)

<div align="center">

<img src="https://raw.githubusercontent.com/projectdiscovery/subfinder/master/static/subfinder-banner.png" alt="r3con banner" width="600"/>

# 🚀 r3con Setup Guide

<b>Respect is earned. Access is taken.<br>Talk less. Scan more.</b>

---

## 🛠️ Tools Required

| Tool         | Purpose                        |
|--------------|--------------------------------|
| subfinder    | Subdomain enumeration          |
| httpx        | Probing live hosts             |
| waybackurls  | Fetching archive URLs          |
| getJS        | Extracting JS files            |
| nuclei       | Vulnerability scanning         |
| gowitness    | Screenshots of live hosts      |

---

## 🐧 Linux Installation

<details>
<summary><b>Expand for step-by-step instructions</b></summary>

### 1️⃣ Install Go (required for most tools)
```bash
sudo apt update && sudo apt install -y golang-go git
```

### 2️⃣ Install all tools
```bash
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/003random/getJS@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/sensepost/gowitness@latest
export PATH=$PATH:$(go env GOPATH)/bin
```

### 3️⃣ Verify Installation
```bash
subfinder -version
httpx -version
waybackurls -version
getJS --version
nuclei -version
gowitness --version
```

</details>

---

## 🪟 Windows Installation

<details>
<summary><b>Expand for step-by-step instructions</b></summary>

### 1️⃣ Install Go
- Download and install Go from [go.dev/dl](https://go.dev/dl/)
- Add Go's `bin` directory to your PATH (usually `C:\Go\bin` and `%USERPROFILE%\go\bin`)

### 2️⃣ Open PowerShell and Install Tools
```powershell
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/003random/getJS@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/sensepost/gowitness@latest
```

### 3️⃣ Add Go bin to PATH (if not already)
- Add `%USERPROFILE%\go\bin` to your system PATH.

### 4️⃣ Verify Installation
```powershell
subfinder -version
httpx -version
waybackurls -version
getJS --version
nuclei -version
gowitness --version
```

</details>

---

## ▶️ How to Run the Script

### Linux
```bash
chmod +x r3con.sh
./r3con.sh <domain> [params]
```

### Windows (using WSL or Git Bash)
```bash
bash r3con.sh <domain> [params]
```

---

## 💡 Notes
- Ensure all tools are in your PATH.
- For Windows, running the script directly in PowerShell is not supported; use WSL or Git Bash.
- For parameter scanning, use: `./r3con.sh <domain> params`

---

<div align="center">

🎉 **Your setup is now complete! Happy recon!** 🎉

</div>
