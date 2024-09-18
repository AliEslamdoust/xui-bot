#!/bin/bash

# Install screen
sudo apt-get install screen -y

# Install nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Load nvm (important to do after installation)
. "$HOME/.nvm/nvm.sh"

# Load nvm bash completion (optional for tab completion)
[ -s "$HOME/.nvm/bash_completion" ] && \. "$HOME/.nvm/bash_completion"

# Install latest stable Node.js version
nvm install --lts

# Use the latest stable Node.js version
nvm use --lts

# Create the directory for Telegram bot files (if it doesn't exist)
mkdir -p /root/telegram-bot

# Target directory (replace with your desired location)
TARGET_DIR="/root/telegram-bot"

# Remote URL with directory (ensure trailing slash)
REMOTE_URL="https://github.com/AliEslamdoust/xui-bot/tree/a2c8d9b3339cf5d9428229d0ced45c88724efaea/advanced-xray-api"

# Create the target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
  mkdir -p "$TARGET_DIR"
  echo "Created target directory: $TARGET_DIR"
fi

# Download individual files recursively using -r flag
curl -r -o "$TARGET_DIR/" "$REMOTE_URL"*

# Handle potential errors (optional)
if [ $? -ne 0 ]; then
  echo "Error: Download failed!"
  exit 1
fi

echo "Files downloaded successfully to: $TARGET_DIR"

# Install required Node.js packages
npm install telegraf fs jalali-moment js-yaml uuid axios sqlite3 path --prefix /root/telegram-bot

# Stop previous background screens
screen -X term 'telegram-bot'

# Start the Telegram api in the background
bash /root/telegram-bot/run.sh

echo "open config.yaml file that is located in /root/telegram-bot/db/config.yaml and set your servers information"