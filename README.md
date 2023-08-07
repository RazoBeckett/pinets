# PiNets: Pihole + Unbound + Cloudflared

PiNets is a project that combines PiHole, Unbound, and Cloudflared to create a secure and efficient network-wide ad-blocking and DNS-over-HTTPS solution.

## Features

- [PiHole](https://github.com/pi-hole/docker-pi-hole/): Network-wide ad-blocking using DNS-based blacklists.
- [Unbound](https://github.com/MatthewVance/unbound-docker): Local caching DNS resolver for improved speed and privacy.
- [Cloudflared](https://github.com/cloudflare/cloudflared): DNS-over-HTTPS (DoH) proxy for secure and encrypted DNS queries.

## Getting Started

These instructions will help you set up PiNets on your system.

### Prerequisites

- Docker and Docker Compose are required for running the containers. If not installed, follow the instructions for [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).
- For debain based(ubuntu):
  ```sh
  sudo apt update && sudo apt install docker.io docker-compose git -y
  ```

### Installation

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/razobeckett/pinets.git

   ```

2. Navigate to the project directory:

   ```sh
   cd pinets

   ```

3. Make the setup.sh executable and then run it:

   ```sh
   sudo chmod u+x setup.sh
   sudo ./setup.sh

   ```

## How to use:

1. **Access the PiNets DNS Information:**

   Find the IP address of the machine where you've set up PiNets. This IP address will be used as the DNS server address on your devices.

2. **Set DNS on Devices:**

   Here's how you can configure the DNS server addresses on various devices:

- **Router Configuration (Recommended)**

  Configuring your router's DNS settings allows all devices connected to your network to benefit from PiNets without the need for individual device configurations. Here's how you can set up the DNS on different router models:

  <details>
  <summary><strong>Generic Steps (may vary based on router model)</strong></summary>

  1. Open a web browser and enter your router's IP address in the address bar. This is usually something like `192.168.1.1`.
  2. Log in to your router's admin interface using the credentials provided by your ISP or set by you.
  3. Look for the "DNS" or "Network" settings section.
  4. Replace the existing DNS server addresses with the IP address of your PiNets setup. This will direct all DNS queries through PiNets.
  5. Save your changes and restart your router if necessary.

  </details>

  <details>
  <summary><strong>Linksys</strong></summary>

  1. Log in to your router's admin interface.
  2. Navigate to "Internet" > "DNS Addresses."
  3. Enter the IP address of your PiNets setup as the DNS address.
  4. Save your changes.

  </details>

  <details>
  <summary><strong>TP-Link</strong></summary>

  1. Log in to your router's admin interface.
  2. Go to "Advanced" > "Network" > "LAN."
  3. Under "DHCP Server," set the Primary DNS and Secondary DNS to the IP address of your PiNets setup.
  4. Save your changes.

   </details>

   <details>
   <summary><strong>Netgear</strong></summary>

  1.  Log in to your router's admin interface.
  2.  Navigate to "Advanced" > "Setup" > "Internet Setup."
  3.  Set the "DNS Address" to the IP address of your PiNets setup.
  4.  Save your changes.

    </details>
3. **Set DNS Individually:**

   <details>
   <summary><strong>Windows</strong></summary>

   1. Open "Network and Sharing Center" from the Control Panel.
   2. Click on the active network connection.
   3. Click on "Properties."
   4. Select "Internet Protocol Version 4 (TCP/IPv4)" and click on "Properties."
   5. Choose the option to use "Use the following DNS server addresses" and enter the IP address of your PiNets setup as both the preferred and alternate DNS server.

   </details>

   <details>
   <summary><strong>macOS</strong></summary>

   1. Go to "System Preferences" > "Network."
   2. Select your active network connection from the list on the left.
   3. Click on "Advanced" > "DNS" tab.
   4. Click the "+" button at the bottom to add a new DNS server and enter the IP address of your PiNets setup.

   </details>

   <details>
   <summary><strong>Linux</strong></summary>

   1. Modify network configuration files or use network manager tools to set DNS. For example, on Ubuntu, you can edit the `/etc/netplan/*.yaml` file to specify the DNS servers.

   </details>

   <details>
   <summary><strong>iOS</strong></summary>

   1. Go to "Settings" > "Wi-Fi."
   2. Click on the network you are connected to (an "i" icon).
   3. Scroll down and tap on "Configure DNS."
   4. Choose "Manual" and add the IP address of your PiNets setup as a DNS server.

   </details>

   <details>
   <summary><strong>Android</strong></summary>

   1. Go to "Settings" > "Network & Internet" > "Wi-Fi."
   2. Long-press on the connected network and select "Modify network."
   3. Check the box for "Advanced options."
   4. Change the IP settings to "Static" and add the IP address of your PiNets setup as a DNS server.

   </details>

4. **Verify and Test:**

   After configuring the DNS settings, you can verify if PiNets is working correctly:

   - Open a web browser and access a website that used to show ads. If PiNets is working, you shouldn't see those ads.
   - Check the PiHole admin interface by accessing its IP address in a web browser. This interface will show you statistics about blocked queries and more.

Remember that DNS settings might require some time to propagate and take effect across your network. If you encounter issues, ensure that you've configured the DNS settings correctly and that your devices are properly connected to the network where PiNets is running.

## Notes

- By default, Unbound uses Quad9 as the upstream DNS provider, as Quad9 states, "We are a Swiss organization, which legally obligates us not to log Personally Identifiable Information (PII) such as source IP addresses."
- This choice offers both security and safety for usage.
- DNSSEC is also not enabled separately, as Quad9 handles DNSSEC when we use their services.

## Contributing

Contributions are welcome! If you find any issues or have suggestions, feel free to open an issue or create a pull request.

## License

This project is licensed under the MIT License.

### Licenses for other components

- Docker: [Apache 2.0](https://github.com/docker/docker/blob/master/LICENSE)
- Unbound: [BSD License](https://unbound.nlnetlabs.nl/svn/trunk/LICENSE)
- Cloudflared [Apache 2.0](https://github.com/cloudflare/cloudflared/blob/master/LICENSE)
