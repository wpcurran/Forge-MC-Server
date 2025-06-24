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
