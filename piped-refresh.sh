#!/bin/sh
set -eu

: "${POSTGRES_HOST:=localhost}"
: "${POSTGRES_DB:=piped}"
: "${POSTGRES_USER:=piped}"
: "${POSTGRES_PASSWORD:=somesecretpassword}"
: "${PIPEDAPI:=http://localhost:}"

sql="SELECT DISTINCT '--url ${PIPEDAPI}/channel/' || channel FROM users_subscribed;"

urls=$(PGPASSWORD="$POSTGRES_PASSWORD" psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -qtAXc "$sql")

tmpfile=$(mktemp)
trap 'rm -f "$tmpfile"' EXIT
echo "$urls" > "$tmpfile"

curl -LsfZkw '%{stderr}%{onerror}%{urlnum}: %{url}: %{errormsg}\n' --retry 1 --config "$tmpfile" >/dev/null
