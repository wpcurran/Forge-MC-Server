How to Deploy a New Modded Minecraft Server (Forge)

This guide walks you through deploying a new Forge-based modded Minecraft server using Docker. It is designed to work with any Forge-compatible modpack.

Step 1: Download the Modpack

Obtain the .zip server pack of your chosen modpack. These are usually available from modpack platforms like CurseForge.

Step 2: Transfer the Modpack to Your Server

If you downloaded the modpack to your local machine, transfer it to your server:

scp ~/Downloads/YourModpack.zip user@your-server-ip:/path/to/mc-servers/

Alternatively, you can use tools like SFTP or Tailscale File Transfer.

Step 3: Unzip and Organize

SSH into your server and unzip the modpack:

cd /path/to/mc-servers
unzip YourModpack.zip
mv ExtractedFolderName YourModpackName

This should result in a structure like:

/path/to/mc-servers/YourModpackName/
├── mods/
├── config/
├── defaultconfigs/
├── server.properties
└── other files

Step 4: Create or Edit docker-compose.yml

Create a docker-compose.yml file or copy from an existing template. Modify it to reflect the Minecraft and Forge versions required by the modpack:

version: "3.8"

services:
  forge-minecraft:
    image: itzg/minecraft-server:latest
    ports:
      - "25565:25565"  # Adjust port if running multiple servers
    environment:
      EULA: "TRUE"
      TYPE: "FORGE"
      VERSION: "1.20.1"  # Minecraft version used by the modpack
      FORGE_VERSION: "47.1.3"  # Forge version required by the modpack
      MEMORY: "8G"
    volumes:
      - /path/to/mc-servers/YourModpackName:/data
    restart: unless-stopped

Step 5: Start the Server

Navigate to the directory where docker-compose.yml is located and run:

docker compose up -d

Step 6: Monitor the Logs

Use the following command to check if the server and mods loaded correctly:

docker compose logs -f

Look for:

The correct Forge and Minecraft version

Mods being loaded

A message like Done (xx.xs)! indicating the server is running

Optional: Reference the Modpack Directory in a Git Repo

If you maintain a Git repo for your server infrastructure and wish to reference this modpack without committing all files:

ln -s /absolute/path/to/YourModpackName /path/to/cloned-repo/YourModpackName

Then commit the symlink:

git add YourModpackName
git commit -m "Add symlink to YourModpackName modpack"
git push

This avoids pushing large files while preserving visibility and structure.

This guide ensures your modded Minecraft server is isolated, repeatable, and easy to manage using Docker.