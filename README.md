# Piped-Refresh

A script to refresh channels on a Piped instance (https://github.com/TeamPiped/Piped) built from Alpine Linux and updated automatically.

Original script from https://github.com/TeamPiped/Piped/issues/1130#issuecomment-2577214461 .

## Setup

To configure, set the following environment variables to appropriate values:

```
CRON_SCHEDULE=0 * * * *
POSTGRES_HOST=localhost
POSTGRES_DB=piped
POSTGRES_USER=piped
POSTGRES_PASSWORD=somesecretpassword
PIPEDAPI=http://localhost:81
```

PIPEDAPI should be set to your backend server.
