# ALARMS

Daily Telegram withdrawal reminders. Three alerts per day to the TELEGRAM WITHDRAWALS group.

## Schedule

| Time (Bucharest) | UTC   | Label           |
|-------------------|-------|-----------------|
| 12:00             | 09:00 | First reminder  |
| 13:00             | 10:00 | Second reminder |
| 14:00             | 11:00 | Last reminder   |

## Telegram

- **Bot token**: in `.env` (TELEGRAM_BOT_TOKEN)
- **Group**: TELEGRAM WITHDRAWALS
- **Chat ID**: `-5460249402` (in `.env` as TELEGRAM_CHAT_ID)

## Files

- `withdraw-reminder.sh`: the script that sends the reminder. Reads `.env`, picks the right label based on hour, sends via Telegram Bot API.
- `.env`: bot token and chat ID. Not committed anywhere.

## How it runs

- **Cron on Jacob's Mac** (user crontab): `0 9,10,11 * * * /Users/andreiiacob/Documents/Claude/UTOPIA/ALARMS/withdraw-reminder.sh`
- Requires the Mac to be on and awake at those times.
- Not on Hetzner (yet). Can be moved there if needed.

## Created

2026-10-10.
