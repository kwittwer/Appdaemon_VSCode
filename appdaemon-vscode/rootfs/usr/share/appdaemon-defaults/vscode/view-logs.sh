#!/bin/bash
# Display AppDaemon logs with tail -f
# Usage: bash .vscode/view-logs.sh
# Or from code-server terminal: tail -f /logs/appdaemon.log

LOG_FILE="/logs/appdaemon.log"

if [ ! -f "${LOG_FILE}" ]; then
    echo "📋 Log file not found yet: ${LOG_FILE}"
    echo "   AppDaemon will create it when it starts."
    exit 1
fi

echo "📊 Tailing AppDaemon logs (last 200 lines + live)..."
echo "   File: ${LOG_FILE}"
echo "   Press Ctrl+C to stop."
echo ""

tail -n 200 -f "${LOG_FILE}"
