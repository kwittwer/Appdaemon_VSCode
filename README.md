# Home Assistant Add-on: AppDaemon + VS Code + debugpy

Dieses Repository stellt ein Home-Assistant-OS-Add-on bereit, das

- **AppDaemon 4.x** (Python-Automationen für Home Assistant),
- **code-server** (VS Code im Browser, integriert in die HA-Sidebar via Ingress) und
- **debugpy** (Remote-Debugging deiner AppDaemon-Apps aus VS Code)

in einem einzigen Add-on vereint.

## Installation

1. In Home Assistant: **Einstellungen → Add-ons → Add-on Store** öffnen.
2. Oben rechts über das **⋮**-Menü **Repositories** wählen.
3. Die URL dieses Repositories eintragen, z. B.:

   ```
   https://github.com/kwittwer/Appdaemon_VSCode
   ```

4. Das Repository hinzufügen und die Seite neu laden.
5. Das Add-on **AppDaemon + VS Code** aus der Liste installieren.
6. Nach der Installation das Add-on **starten**.

## Nutzung

- **AppDaemon UI:** über den Button „Open Web UI" bzw. Port `5050`.
- **VS Code (code-server):** über den Sidebar-Eintrag des Add-ons (Ingress).
- **Remote Debugging:** siehe [appdaemon-vscode/DOCS.md](appdaemon-vscode/DOCS.md).

Die Konfiguration und deine Apps liegen im Add-on-Konfigurationsordner
(`/addon_configs/<slug>_appdaemon-vscode/` bzw. im Add-on unter `/config`).

## Enthaltenes Add-on

| Add-on | Beschreibung |
| ------ | ------------ |
| [AppDaemon + VS Code](appdaemon-vscode) | AppDaemon 4.x + code-server + debugpy |

## Lizenz

MIT
