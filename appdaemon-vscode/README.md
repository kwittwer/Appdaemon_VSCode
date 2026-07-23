# Home Assistant Add-on: AppDaemon + VS Code

AppDaemon 4.x mit integriertem VS Code (code-server) und debugpy fuer
Remote-Debugging – alles in einem Add-on.

- **AppDaemon** – Python-Automationen fuer Home Assistant (UI auf Port `5050`).
- **code-server** – VS Code direkt in der Home-Assistant-Sidebar (Ingress).
- **debugpy** – Remote-Debugging deiner Apps aus VS Code (Port `5678`).

Standardmaessig ist der MQTT-Plugin-Zugang fuer den HA-Broker `mosquitto`
vorbereitet. Optional koennen `mqtt_user` und `mqtt_password` in den
Add-on-Optionen gesetzt werden.

AppDaemon schreibt seine Logs nach `/config/logs/appdaemon.log`.
In VS Code kann der Live-Log ueber die Task **Watch AppDaemon Logs**
angezeigt werden.

Die Verbindung zu Home Assistant erfolgt automatisch ueber den Supervisor –
ein Long-Lived Access Token ist nicht erforderlich.

## Store-Assets

Icon und Logo liegen direkt im Add-on-Ordner, damit Home Assistant sie im
Add-on-Store und in der UI anzeigen kann.

Ausfuehrliche Anleitung: siehe [DOCS.md](DOCS.md).
