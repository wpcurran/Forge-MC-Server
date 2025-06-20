Project Summary

This repository hosts multiple Dockerized Minecraft server environments — both vanilla and modded — for easy deployment, management, and version control. It leverages:

Docker + docker-compose for isolated, reproducible Minecraft servers

Tailscale for secure remote access and LAN-free play

Git for managing configuration, server types, and automation scripts

systemd + cron for auto-start and scheduled backups

Supported Server Types
Vanilla-MC-Server/: A clean, unmodded Minecraft server

BetterMC-BMC4/: A fully modded server based on Forge 1.20.1 and Better MC [FORGE] v43

Each server directory includes:

docker-compose.yml

Optional server.properties, mods/, config/, and other assets

Compatibility with itzg/minecraft-server Docker image

🔧 How It Works
Clone this repo to your Linux host

Place or link your modpack folder under the appropriate subdirectory

Launch the server:

bash
Copy
docker compose up -d
Access the server using your Tailscale MagicDNS name or local IP

🛠️ Local Deployment (Tailscale Funnel Setup)
This project is configured to run a Minecraft server using Docker, with Tailscale Funnel for secure public access.

🔧 Default Configuration
By default, the Docker container binds the Minecraft port to localhost:

yaml
Copy
Edit
ports:
  - "127.0.0.1:25565:25565"
This is required for Tailscale Funnel to work correctly.

🌐 External Access via Tailscale Funnel
To enable public access:

Enable Funnel on your Tailscale account

On the host machine, run:

bash
Copy
Edit
tailscale funnel enable
tailscale serve tcp:25565 tcp://127.0.0.1:25565
Share your public address:

makefile
Copy
Edit
yourhost.ts.net:25565
🔄 Not Using Tailscale?
If you're not using Tailscale Funnel and want the server to be publicly accessible without it:

🔧 Change the docker-compose.yaml:
yaml
Copy
Edit
ports:
  - "25565:25565"  # Bind to all interfaces (0.0.0.0)
Then run:

bash
Copy
Edit
docker compose up -d
This allows anyone to connect directly to your IP (if firewalls and router are open).

Design Highlights
Uses volumes: to mount external modpack directories cleanly into Docker

Tracks empty folders (e.g. mods/) using .gitkeep

Avoids bloating Git with .jar or runtime data using .gitignore

Keeps modded servers and vanilla setups in one cohesive, flexible structure

