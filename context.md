# ALARMS

Daily Telegram withdrawal reminders. Three alerts per day to the TELEGRAM WITHDRAWALS group.

## Schedule

| Time (Bucharest) | UTC   | Label           |
|-------------------|-------|-----------------|
| 12:00             | 09:00 | First reminder  |
| 13:00             | 10:00 | Second reminder |
| 14:00             | 11:00 | Last reminder   |

## Telegram

- **Bot token**: env var TELEGRAM_BOT_TOKEN (set in Coolify)
- **Group**: TELEGRAM WITHDRAWALS
- **Chat ID**: env var TELEGRAM_CHAT_ID (set in Coolify)

## Files

- `withdraw-reminder.sh`: the script that sends the reminder. Picks the right label based on hour, sends via Telegram Bot API.
- `Dockerfile`: Alpine + Python 3, runs crond in foreground.
- `crontab`: cron schedule for the container (09:00, 10:00, 11:00 UTC).
- `.env`: local dev only (not committed). Coolify injects env vars in prod.
- `.gitignore`: excludes .env.

## Hosting

- **Hetzner box**: 23.88.36.185 (same as ig-ops)
- **Coolify project**: alarms (UUID: hkpctmhfyre1e0c856eqi85h)
- **Coolify app**: alarms (UUID: j5fgzkmpezhqis5xnjlphd7c)
- **GitHub repo**: JacobUtopia/alarms (public)
- Auto-deploys on push to main.

## Created

2026-10-10.
