#!/bin/bash
set -e

echo "🚀 R3CON Installation Script"
echo "=============================="

# Install dependencies
echo "📦 Installing system dependencies..."
sudo apt update
sudo apt install -y git curl wget unzip

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "🔧 Installing reconnaissance tools..."

# Install subfinder
echo "Installing subfinder..."
wget -q https://github.com/projectdiscovery/subfinder/releases/download/v2.8.0/subfinder_2.8.0_linux_amd64.zip
unzip -o -q subfinder_2.8.0_linux_amd64.zip
sudo mv subfinder /usr/local/bin/
sudo chmod +x /usr/local/bin/subfinder

# Install httpx
echo "Installing httpx..."
wget -q https://github.com/projectdiscovery/httpx/releases/download/v1.7.1/httpx_1.7.1_linux_amd64.zip
unzip -o -q httpx_1.7.1_linux_amd64.zip
sudo mv httpx /usr/local/bin/
sudo chmod +x /usr/local/bin/httpx

# Install nuclei
echo "Installing nuclei..."
wget -q https://github.com/projectdiscovery/nuclei/releases/download/v3.4.10/nuclei_3.4.10_linux_amd64.zip
unzip -o -q nuclei_3.4.10_linux_amd64.zip
sudo mv nuclei /usr/local/bin/
sudo chmod +x /usr/local/bin/nuclei

# Install waybackurls
echo "Installing waybackurls..."
wget -q https://github.com/tomnomnom/waybackurls/releases/download/v0.1.0/waybackurls-linux-amd64-0.1.0.tgz
tar -xzf waybackurls-linux-amd64-0.1.0.tgz
sudo mv waybackurls /usr/local/bin/
sudo chmod +x /usr/local/bin/waybackurls

# Install getJS
echo "Installing getJS..."
wget -q https://github.com/003random/getJS/releases/download/v1.0/getJS-linux-amd64
sudo mv getJS-linux-amd64 /usr/local/bin/getJS
sudo chmod +x /usr/local/bin/getJS

# Install gowitness
echo "Installing gowitness..."
wget -q https://github.com/sensepost/gowitness/releases/download/2.5.1/gowitness-2.5.1-linux-amd64
sudo mv gowitness-2.5.1-linux-amd64 /usr/local/bin/gowitness
sudo chmod +x /usr/local/bin/gowitness

# Download r3con.sh from your repo
echo "📥 Downloading r3con script..."
curl -o ~/r3con.sh https://raw.githubusercontent.com/durgeshw22/r3con/main/r3con/r3con.sh
chmod +x ~/r3con.sh

# Clean up
echo "🧹 Cleaning up temporary files..."
cd /
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Installation complete!"
echo ""
echo "🎯 Usage: ~/r3con.sh <domain> [params]"
echo ""
echo "📊 Installed tools:"
echo "- subfinder: $(/usr/local/bin/subfinder -version 2>/dev/null | head -1 || echo 'installed')"
echo "- httpx: $(/usr/local/bin/httpx -version 2>/dev/null | head -1 || echo 'installed')"
echo "- nuclei: $(/usr/local/bin/nuclei -version 2>/dev/null | head -1 || echo 'installed')"
echo "- waybackurls: installed"
echo "- getJS: installed"
echo "- gowitness: installed"
echo ""
echo "🚀 Ready to scan! Run: ~/r3con.sh example.com"
