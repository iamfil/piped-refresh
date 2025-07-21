#!/bin/sh

: "${CRON_SCHEDULE:=0 * * * *}"

echo "$CRON_SCHEDULE /piped-refresh.sh" > /etc/crontabs/root

crond -f
