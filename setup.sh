#!/bin/bash

# Check if Docker and Docker Compose are not installed
if ! command -v docker &> /dev/null || ! command -v docker-compose &> /dev/null; then
    echo -e "\nDocker or docker compose is missing, make sure you have install both"
    exit 1
fi

# Check the OS for Ubuntu or Fedora
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    if [[ $ID == "ubuntu" || $ID == "fedora" ]]; then
        echo "Detected supported OS: $ID $VERSION_ID"
        
        # Disable systemd-resolved DNSStubListener
        sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
        
        # Change /etc/resolv.conf symlink to point to /run/systemd/resolve/resolv.conf
        sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
        
        # Restart systemd-resolved
        sudo systemctl restart systemd-resolved
    fi
else
    echo "Cannot determine OS."
    exit 1
fi

# Ask user for Cloudflared DNS servers
echo -e "Set Cloudflared upstream DNS Servers: !!(DoH Address Only)!!\n"

read -p "Enter DNS1 (default: https://dns.quad9.net/dns-query): " UPSTREAMDNS1
UPSTREAMDNS1=${UPSTREAMDNS1:-https://dns.quad9.net/dns-query}  # Set default if empty

read -p "Enter DNS2 (default: https://cloudflare-dns.com/dns-query): " UPSTREAMDNS2
UPSTREAMDNS2=${UPSTREAMDNS2:-https://cloudflare-dns.com/dns-query}  # Set default if empty

# Ask user for timezone
read -p "Enter your timezone (default: Etc/UTC): " TIMEZONE
TIMEZONE=${TIMEZONE:-Etc/UTC}  # Set default if empty

# Ask user for PiHole admin panel password
echo -n "Enter PiHole admin panel password (press Enter for random generation): "
read -s PIHOLE_PASSWORD
echo  # Move to a new line

# Generate .env file
cat << EOF > .env
UPSTREAMDNS1=$UPSTREAMDNS1
UPSTREAMDNS2=$UPSTREAMDNS2
TIMEZONE=$TIMEZONE
PIHOLE_PASSWORD=$PIHOLE_PASSWORD
EOF

echo "Environment variables have been saved to .env file."

# Create custom network "pinets" if it does not exist
if ! docker network inspect pinets >/dev/null 2>&1; then
    echo "Creating network: pinets"
    docker network create --driver=bridge --subnet=10.11.12.0/24 --gateway=10.11.12.1 pinets
fi

# Move the Unbound folder to ~/docker_stuff
mv unbound ~/docker_stuff

# Verify the presence of required files
required_files=("a-records.conf" "unbound.conf" "srv-records.conf" "unbound.log" "forward-records.conf")
for file in "${required_files[@]}"; do
    if [ ! -f ~/docker_stuff/unbound/"$file" ]; then
        echo "Error: Required file $file is missing in the unbound directory."
        exit 1
    fi
done

# Start containers using docker-compose
docker-compose up -d

# Display generated password if it was randomly generated
if [ -z "$PIHOLE_PASSWORD" ]; then
    echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
fi