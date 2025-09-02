#!/bin/bash
set -e

# Install dependencies
sudo apt update
sudo apt install -y golang-go git curl wget

# Clean Go module cache to avoid corruption issues
echo "Cleaning Go module cache..."
go clean -modcache
rm -rf /root/go/pkg/mod 2>/dev/null || true

# Set Go environment variables
export GOPROXY=direct
export GOSUMDB=off

# Install Go tools one by one with error handling
echo "Installing subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

echo "Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

echo "Installing waybackurls..."
go install github.com/tomnomnom/waybackurls@latest

echo "Installing getJS..."
go install github.com/003random/getJS@latest

echo "Installing nuclei..."
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

echo "Installing gowitness (may take longer)..."
# Use specific version that doesn't have the sqlite dependency issue
go install github.com/sensepost/gowitness@v2.5.0 || echo "Warning: gowitness installation failed, but other tools are available"

# Add Go bin to PATH if not already
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
export PATH=$PATH:$(go env GOPATH)/bin

# Download r3con.sh from your repo
curl -o ~/r3con.sh https://raw.githubusercontent.com/Durgesh2202/R3CON/main/r3con.sh
chmod +x ~/r3con.sh

echo "Installation complete! Run with: ~/r3con.sh <domain>"
