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

# Create the directory for Telegram API files (if it doesn't exist)
mkdir -p /root/telegram-api

# Download index.js
curl -o /root/telegram-api/index.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/advanced-xray-bot/index.js

# Download run.sh file
curl -o /root/telegram-api/run.sh -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/advanced-xray-bot/run.sh

# Create db directory (if it doesn't exist)
mkdir -p /root/telegram-bot/db

# Download db.json
curl -o /root/telegram-bot/db/db.json -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/advanced-xray-bot/db/db.json

# Download config.yaml
curl -o /root/telegram-bot/db/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/advanced-xray-api/db/config.yaml

# Install required Node.js packages
npm install express cors axios fs js-yaml sqlite3 bcrypt body-parser path --prefix /root/telegram-api

# Stop previous background screens
screen -X term 'telegram-api'

# Start the Telegram api in the background
bash /root/telegram-api/run.sh

echo "open config.yaml file that is located in /root/telegram-api/db/config.yaml and set your servers information, then run the following command:"

echo "bash /root/telegram-api/run.sh"