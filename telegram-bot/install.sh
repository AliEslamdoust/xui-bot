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

# Download index.js
curl -o /root/telegram-bot/index.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/index.js

# Download run.sh file
curl -o /root/telegram-bot/run.sh -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/run.sh

# Create db directory (if it doesn't exist)
mkdir -p /root/telegram-bot/db

# Download bot.db
curl -o /root/telegram-bot/db/bot.db -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/telegram-bot/db/db.json

# Download config.yaml
curl -o /root/telegram-bot/db/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/telegram-bot/db/config.yaml

# Create lib directory (if it doesn't exist)
mkdir -p /root/telegram-bot/lib

# Download db.json
curl -o /root/telegram-bot/lib/db.json -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/telegram-bot/db/db.json

# Download config.yaml
curl -o /root/telegram-bot/lib/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/telegram-bot/db/config.yaml

# Install required Node.js packages
npm install telegraf fs jalali-moment js-yaml uuid axios sqlite3 path --prefix /root/telegram-bot

# Stop previous background screens
screen -X term 'telegram-bot'

# Start the Telegram api in the background
bash /root/telegram-bot/run.sh

echo "open config.yaml file that is located in /root/telegram-bot/db/config.yaml and set your servers information"