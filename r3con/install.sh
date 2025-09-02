#!/bin/bash
set -e

# Install dependencies
sudo apt update
sudo apt install -y golang-go git curl wget

# Install Go tools
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/003random/getJS@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/sensepost/gowitness@latest

# Add Go bin to PATH if not already
echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
export PATH=$PATH:$(go env GOPATH)/bin

# Download r3con.sh from your repo
curl -o ~/r3con.sh https://raw.githubusercontent.com/Durgesh2202/R3CON/main/r3con.sh
chmod +x ~/r3con.sh

echo "Installation complete! Run with: ~/r3con.sh <domain>"