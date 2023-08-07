# PiNets: [PiHole](https://github.com/pi-hole/docker-pi-hole/) + [Unbound](https://github.com/MatthewVance/unbound-docker) + [Cloudflared](https://github.com/cloudflare/cloudflared)

PiNets is a project that combines PiHole, Unbound, and Cloudflared to create a secure and efficient network-wide ad-blocking and DNS-over-HTTPS solution.

## Features

- PiHole: Network-wide ad-blocking using DNS-based blacklists.
- Unbound: Local caching DNS resolver for improved speed and privacy.
- Cloudflared: DNS-over-HTTPS (DoH) proxy for secure and encrypted DNS queries.

## Getting Started

These instructions will help you set up PiNets on your system.

### Prerequisites

- Docker and Docker Compose are required for running the containers. If not installed, follow the instructions for [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).
- For debain based(ubuntu):
  ```sh
  sudo apt update && sudo apt install docker.io docker-compose git -y

### Installation

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/razobeckett/pinets.git

2. Navigate to the project directory:

   ```sh
   cd pinets

3. Make the setup.sh executable and then run it:

   ```sh
   sudo chmod u+x setup.sh
   sudo ./setup.sh

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