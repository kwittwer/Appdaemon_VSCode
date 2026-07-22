#!/bin/bash
# Restart AppDaemon Add-on über Home Assistant API
# Erwartet Umgebungsvariablen: HA_URL, HA_TOKEN

HA_URL="${HA_URL:-http://192.168.178.150:8123}"
HA_TOKEN="${HA_TOKEN:-}"
ADDON_ID="b1728aab_appdaemon-vscode"
MAX_WAIT=60

if [ -z "$HA_TOKEN" ]; then
    echo "ERROR: HA_TOKEN Umgebungsvariable nicht gesetzt!"
    echo "Bitte setzen Sie: export HA_TOKEN='eyJhbGc...'"
    exit 1
fi

echo "🔄 Starte AppDaemon Add-on neu..."
echo "   HA_URL: $HA_URL"

# Restart-API aufrufen
RESPONSE=$(curl -s -X POST \
  "$HA_URL/api/services/hassio/addon_restart" \
  -H "Authorization: Bearer $HA_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"addon\": \"$ADDON_ID\"}")

if echo "$RESPONSE" | grep -q "error"; then
    echo "❌ Fehler beim Restart: $RESPONSE"
    exit 1
fi

echo "✓ Restart-Befehl gesendet"
echo "⏳ Warte auf Add-on Start (max. $MAX_WAIT Sekunden)..."

# Warten bis Add-on vollständig gestartet ist
START_TIME=$(date +%s)
while true; do
    ELAPSED=$(($(date +%s) - START_TIME))
    
    if [ $ELAPSED -gt $MAX_WAIT ]; then
        echo "⚠️  Timeout nach $MAX_WAIT Sekunden"
        break
    fi
    
    STATE=$(curl -s "$HA_URL/api/states/update.$ADDON_ID" \
        -H "Authorization: Bearer $HA_TOKEN" | grep -o '"state":"[^"]*' | cut -d'"' -f4)
    
    if [ "$STATE" = "on" ]; then
        echo "✅ AppDaemon ist bereit! ($ELAPSED Sekunden)"
        sleep 2  # Extra 2 Sekunden für Debugpy-Startup
        echo "🎯 Debugging kann nun gestartet werden..."
        exit 0
    fi
    
    echo -n "."
    sleep 1
done

echo ""
echo "⚠️  Add-on Start abgelaufen, aber Debugger sollte erreichbar sein..."
exit 0
