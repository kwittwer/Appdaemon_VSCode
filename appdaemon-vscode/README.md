# Home Assistant Add-on: AppDaemon + VS Code

AppDaemon 4.x mit integriertem VS Code (code-server) und debugpy fuer
Remote-Debugging – alles in einem Add-on.

- **AppDaemon** – Python-Automationen fuer Home Assistant (UI auf Port `5050`).
- **code-server** – VS Code direkt in der Home-Assistant-Sidebar (Ingress).
- **debugpy** – Remote-Debugging deiner Apps aus VS Code (Port `5678`).

Die Verbindung zu Home Assistant erfolgt automatisch ueber den Supervisor –
ein Long-Lived Access Token ist nicht erforderlich.

Ausfuehrliche Anleitung: siehe [DOCS.md](DOCS.md).
