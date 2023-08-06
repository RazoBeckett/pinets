# PiNets: PiHole + Unbound + Cloudflared

PiNets is a project that combines PiHole, Unbound, and Cloudflared to create a secure and efficient network-wide ad-blocking and DNS-over-HTTPS solution.

## Features

- PiHole: Network-wide ad-blocking using DNS-based blacklists.
- Unbound: Local caching DNS resolver for improved speed and privacy.
- Cloudflared: DNS-over-HTTPS (DoH) proxy for secure and encrypted DNS queries.

## Getting Started

These instructions will help you set up PiNets on your system.

### Prerequisites

- Docker and Docker Compose are required for running the containers. If not installed, follow the instructions for [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

### Installation

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/yourusername/PiNets.git

2. Navigate to the project directory:

   ```sh
   cd pinets

3. Make the setup.sh executable and then run it:

   ```sh
   sudo chmod u+x setup.sh
   ./setup.sh

### Contributing
Contributions are welcome! If you find any issues or have suggestions, feel free to open an issue or create a pull request.

### License 
This project is licensed under the MIT License 
