#!/bin/bash

# Install screen
sudo apt-get install screen -y

# Install sqlite3
sudo apt-get install sqlite3 -y

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

# Install required Node.js packages
npm install telegraf fs jalali-moment js-yaml uuid axios sqlite3 path --prefix /root/telegram-bot

# Download index.js
curl -o /root/telegram-bot/index.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/index.js

# Download run.sh file
curl -o /root/telegram-bot/run.sh -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/run.sh

# Create the database directory if it doesn't exist
mkdir -p /root/telegram-bot/db

# Create the database file
sqlite3 /root/telegram-bot/db/bot.db <<EOF
CREATE TABLE "channels" (
    "name"  TEXT,
    "id"    TEXT,
    "adder" INTEGER,
    "date_added" INTEGER
);

CREATE TABLE "gifts" (
    "code"      TEXT,
    "name"      TEXT,
    "users_id"  TEXT,
    "expiration" INTEGER,
    "enable"    INTEGER,
    "hidden"    INTEGER,
    "prize"     INTEGER,
    "limit"     INTEGER
);

CREATE TABLE "monthly_payments" (
	"month"	TEXT,
	"from"	INTEGER,
	"to"	INTEGER,
	"amount"	INTEGER,
	"total_payments"	INTEGER
);

CREATE TABLE "payments" (
	"userid"	INTEGER,
	"id"	TEXT,
	"price"	INTEGER,
	"date"	INTEGER,
	"success"	TEXT,
	"bought_item"	TEXT
);

CREATE TABLE "pricing" (
	"item_id"	INTEGER,
	"ip_limit"	INTEGER,
	"duration"	INTEGER,
	"traffic"	INTEGER,
	"price"	INTEGER,
	"type"	TEXT,
	"pack_name"	TEXT,
	"location"	TEXT
);

CREATE TABLE "reservations" (
	"reserve_id"	TEXT,
	"subId"	TEXT,
	"ip"	INTEGER,
	"traffic"	INTEGER,
	"duration"	INTEGER
, "location"	TEXT, "status"	TEXT);

CREATE TABLE "subscriptions" (
	"owner_id"	INTEGER,
	"users_id"	TEXT,
	"subId"	TEXT,
	"name"	TEXT,
	"status"	TEXT,
	"location"	TEXT
, "reserve"	TEXT, "sentNotice"	INTEGER);

CREATE TABLE "tickets" (
	"ticketId"	INTEGER,
	"userid"	INTEGER,
	"last_response"	INTEGER,
	"subject"	TEXT,
	"messages"	TEXT,
	"status"	TEXT
);

CREATE TABLE "users" (
	"id"	INTEGER,
	"userid"	INTEGER,
	"username"	TEXT,
	"fullname"	TEXT,
	"balance"	INTEGER,
	"inviter"	INTEGER,
	"user_lvl"	INTEGER,
	"status"	TEXT,
	"reason"	TEXT
, "test_sub"	INTEGER);
EOF

# Download config.yaml
curl -o /root/telegram-bot/db/config.yaml -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/db/config.yaml

# Create lib directory (if it doesn't exist)
mkdir -p /root/telegram-bot/lib

# Download database handler
curl -o /root/telegram-bot/lib/database_handler.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/lib/database_handler.js

# Download axios instance
curl -o /root/telegram-bot/lib/axios_instance.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/lib/axios_instance.js

# Download log handler
curl -o /root/telegram-bot/lib/log_handler.js -f https://raw.githubusercontent.com/AliEslamdoust/xui-bot/main/telegram-bot/lib/log_handler.js


# Stop previous background screens
screen -X term 'telegram-bot'

# Start the Telegram bot in the background
bash /root/telegram-bot/run.sh

echo "open config.yaml file that is located in /root/telegram-bot/db/config.yaml and set your servers information, then run the following command:"

echo "bash /root/telegram-bot/run.sh"