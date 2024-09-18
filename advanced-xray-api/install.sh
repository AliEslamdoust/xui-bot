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
curl -o /root/telegram-api/index.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/index.js

# Download run.sh file
curl -o /root/telegram-api/run.sh -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/run.sh

# Create db directory (if it doesn't exist)
mkdir -p /root/telegram-api/db

# Download bot.db
curl -o /root/telegram-api/db/bot.db -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/db/db.json

# Download config.yaml
curl -o /root/telegram-api/db/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/db/config.yaml

# Create lib directory (if it doesn't exist)
mkdir -p /root/telegram-api/lib

# Download db.json
curl -o /root/telegram-api/lib/db.json -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/db/db.json

# Download config.yaml
curl -o /root/telegram-api/lib/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-api/main/db/config.yaml

# Install required Node.js packages
npm install express cors axios fs js-yaml sqlite3 bcrypt body-parser path --prefix /root/telegram-api

# Stop previous background screens
screen -X term 'telegram-api'

# Start the Telegram api in the background
bash /root/telegram-api/run.sh

echo "open config.yaml file that is located in /root/telegram-api/db/config.yaml and set your servers information"