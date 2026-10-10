FROM python:3.12-alpine

RUN apk add --no-cache bash tzdata

WORKDIR /app

COPY withdraw-reminder.sh .
COPY crontab /etc/crontabs/root

RUN chmod +x withdraw-reminder.sh

CMD ["crond", "-f", "-l", "2"]
