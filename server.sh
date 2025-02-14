#!/usr/bin/env bash

[[ -f "./.env" ]] && source ./.env

if [ -z "$POSTGRES_CONNECTION_STRING" ]; then
    echo "Postgres Connection String is not set"
    
    exit 1
fi

if [ -z "$PORT" ]; then
    PORT_ENV_ARGS="--env PORT=$PORT"
fi

python3 -m gunicorn "expenseman:main()" \
    --bind "0.0.0.0:$PORT" \
    $PORT_ENV_ARGS \
    --env POSTGRES_CONNECTION_STRING="$POSTGRES_CONNECTION_STRING"

exit 0
