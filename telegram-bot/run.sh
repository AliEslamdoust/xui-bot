# Start the Telegram bot in the background using screen
screen -dmS telegram-bot node /root/telegram-bot/index.js

# Print a success message
echo "Telegram bot started in the background (screen session name: telegram-bot)"