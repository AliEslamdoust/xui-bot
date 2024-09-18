# Start the Telegram api in the background using screen
screen -dmS telegram-api node /root/telegram-api/index.js

# Print a success message
echo "Telegram api started in the background (screen session name: telegram-api)"