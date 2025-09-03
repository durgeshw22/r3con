#!/bin/bash

echo "🚀 R3CON Installation Script"
echo "=============================="

# Install dependencies
echo "📦 Installing system dependencies..."
sudo apt update
sudo apt install -y git curl wget unzip

# Create a unique temporary directory
TEMP_DIR="/tmp/r3con-install-$$"
mkdir -p "$TEMP_DIR"
cd "$TEMP_DIR"

echo "🔧 Installing reconnaissance tools..."

# Install subfinder
echo "Installing subfinder..."
wget -q https://github.com/projectdiscovery/subfinder/releases/download/v2.8.0/subfinder_2.8.0_linux_amd64.zip -O subfinder.zip
unzip -o -q subfinder.zip
sudo cp subfinder /usr/local/bin/
sudo chmod +x /usr/local/bin/subfinder

# Install httpx
echo "Installing httpx..."
wget -q https://github.com/projectdiscovery/httpx/releases/download/v1.7.1/httpx_1.7.1_linux_amd64.zip -O httpx.zip
unzip -o -q httpx.zip
sudo cp httpx /usr/local/bin/
sudo chmod +x /usr/local/bin/httpx

# Install nuclei
echo "Installing nuclei..."
wget -q https://github.com/projectdiscovery/nuclei/releases/download/v3.4.10/nuclei_3.4.10_linux_amd64.zip -O nuclei.zip
unzip -o -q nuclei.zip
sudo cp nuclei /usr/local/bin/
sudo chmod +x /usr/local/bin/nuclei

# Install waybackurls
echo "Installing waybackurls..."
wget -q https://github.com/tomnomnom/waybackurls/releases/download/v0.1.0/waybackurls-linux-amd64-0.1.0.tgz -O waybackurls.tgz
tar -xzf waybackurls.tgz
sudo cp waybackurls /usr/local/bin/
sudo chmod +x /usr/local/bin/waybackurls

# Install getJS
echo "Installing getJS..."
# Install Go if not present
if ! command -v go &> /dev/null; then
    echo "Installing Go..."
    sudo apt install -y golang-go
fi
# Install getJS via Go (more reliable)
echo "Compiling getJS from source..."
go install github.com/003random/getJS@latest
if [ -f ~/go/bin/getJS ]; then
    sudo cp ~/go/bin/getJS /usr/local/bin/
elif [ -f $(go env GOPATH)/bin/getJS ]; then
    sudo cp $(go env GOPATH)/bin/getJS /usr/local/bin/
else
    # Fallback: try direct binary download
    echo "Trying binary download..."
    wget -q --timeout=10 https://github.com/003random/getJS/releases/download/v1.0/getJS-linux-amd64 -O getJS 2>/dev/null && sudo cp getJS /usr/local/bin/getJS
fi
sudo chmod +x /usr/local/bin/getJS 2>/dev/null || true
echo "getJS installation completed"

# Install gowitness (using latest version that supports file scanning)
echo "Installing gowitness..."
wget -q https://github.com/sensepost/gowitness/releases/download/3.0.5/gowitness-3.0.5-linux-amd64 -O gowitness
sudo cp gowitness /usr/local/bin/
sudo chmod +x /usr/local/bin/gowitness

# Download r3con.sh from your repo
echo "📥 Downloading r3con script..."
curl -o ~/r3con.sh https://raw.githubusercontent.com/durgeshw22/r3con/main/r3con/r3con.sh
chmod +x ~/r3con.sh

# Also create a symlink in /usr/local/bin for global access
sudo ln -sf ~/r3con.sh /usr/local/bin/r3con 2>/dev/null || true

# Clean up
echo "🧹 Cleaning up temporary files..."
cd /
rm -rf "$TEMP_DIR"

echo ""
echo "✅ Installation complete!"
echo ""
echo "🎯 Usage Options:"
echo "   ~/r3con.sh <domain>     # Run from anywhere"
echo "   r3con <domain>          # Global command (if symlink worked)"
echo ""
echo "📍 Script Location: ~/r3con.sh"
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
