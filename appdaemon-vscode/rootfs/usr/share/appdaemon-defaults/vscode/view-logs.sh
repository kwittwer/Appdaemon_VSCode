#!/bin/bash
# Display AppDaemon logs with tail -f
# Usage: bash .vscode/view-logs.sh
# Or from code-server terminal: tail -f /logs/appdaemon.log

LOG_CANDIDATES=(
    "/logs/appdaemon.log"
    "/config/logs/appdaemon.log"
)

LOG_FILE=""
for candidate in "${LOG_CANDIDATES[@]}"; do
    if [ -f "${candidate}" ]; then
        LOG_FILE="${candidate}"
        break
    fi
done

if [ -z "${LOG_FILE}" ]; then
    LOG_FILE="/logs/appdaemon.log"
    echo "📋 Log file not found yet. Checked:"
    echo "   - /logs/appdaemon.log"
    echo "   - /config/logs/appdaemon.log"
    echo "   AppDaemon will create it when it starts."
    exit 1
fi

echo "📊 Tailing AppDaemon logs (last 200 lines + live)..."
echo "   File: ${LOG_FILE}"
echo "   Press Ctrl+C to stop."
echo ""

tail -n 200 -f "${LOG_FILE}"
