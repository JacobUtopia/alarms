#!/usr/bin/env bash
# Sends a withdrawal reminder to Telegram.

set -euo pipefail

# Load .env if it exists (local dev), otherwise expect env vars from Coolify
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/.env" ]; then
  set -a
  . "$SCRIPT_DIR/.env"
  set +a
fi

: "${TELEGRAM_BOT_TOKEN:?TELEGRAM_BOT_TOKEN not set}"
: "${TELEGRAM_CHAT_ID:?TELEGRAM_CHAT_ID not set}"

HOUR=$(TZ="Europe/Bucharest" date +%H)

case "$HOUR" in
  12) NOTE="First reminder";;
  13) NOTE="Second reminder";;
  14) NOTE="Last reminder";;
  *)  NOTE="Reminder";;
esac

TIMESTAMP=$(TZ='Europe/Bucharest' date '+%A, %d %B %Y  %H:%M Bucharest')

python3 -I -c "
import json, urllib.request

msg = '\U0001f514 *WITHDRAWAL REMINDER* \U0001f514\n\n'
msg += '$NOTE: Do not forget to withdraw today!\n\n'
msg += '$TIMESTAMP'

payload = json.dumps({
    'chat_id': '$TELEGRAM_CHAT_ID',
    'text': msg,
    'parse_mode': 'Markdown'
}).encode()

req = urllib.request.Request(
    'https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage',
    data=payload,
    headers={'Content-Type': 'application/json'}
)
urllib.request.urlopen(req)
"
