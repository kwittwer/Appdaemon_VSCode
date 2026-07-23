# Home Assistant Add-on: AppDaemon + VS Code

AppDaemon 4.x mit integriertem VS Code (code-server) und debugpy fuer
Remote-Debugging – alles in einem Add-on.

- **AppDaemon** – Python-Automationen fuer Home Assistant (UI auf Port `5050`).
- **code-server** – VS Code direkt in der Home-Assistant-Sidebar (Ingress).
- **debugpy** – Remote-Debugging deiner Apps aus VS Code (Port `5678`).

Standardmaessig ist MQTT deaktiviert, damit das Add-on ohne Broker stabil
startet. Fuer MQTT setze `mqtt_broker` (z. B. `mosquitto`) und optional
`mqtt_user`/`mqtt_password` in den Add-on-Optionen.

AppDaemon schreibt seine Logs nach `/logs/appdaemon.log`.
Im VS Code Integrated Terminal kannst du sie mit `tail -f /logs/appdaemon.log` live sehen.

Die Verbindung zu Home Assistant erfolgt automatisch ueber den Supervisor –
ein Long-Lived Access Token ist nicht erforderlich.

## Store-Assets

Icon und Logo liegen direkt im Add-on-Ordner, damit Home Assistant sie im
Add-on-Store und in der UI anzeigen kann.

Ausfuehrliche Anleitung: siehe [DOCS.md](DOCS.md).
