# Home Assistant Add-on: AppDaemon + VS Code – Dokumentation

## Ueberblick

Dieses Add-on vereint drei Werkzeuge in einem Container:

| Komponente   | Zweck                                            | Zugriff                  |
| ------------ | ------------------------------------------------ | ------------------------ |
| AppDaemon    | Python-Automationen fuer Home Assistant          | Web UI, Port `5050`      |
| code-server  | VS Code im Browser                               | Sidebar (Ingress)        |
| debugpy      | Remote-Debugging der AppDaemon-Apps aus VS Code  | Port `5678` (attach)     |

## Installation

1. Repository in Home Assistant hinzufuegen
   (**Add-on Store → ⋮ → Repositories**) und die URL dieses Git-Repos eintragen.
2. Das Add-on **AppDaemon + VS Code** installieren.
3. Add-on **starten**.

## Konfiguration

Die Add-on-Optionen (Tab **Configuration**):

```yaml
log_level: info
mqtt_broker: ""
mqtt_port: 1883
mqtt_user: ""
mqtt_password: ""
system_packages: []
python_packages: []
init_commands: []
```

### Option: `log_level`

Detailgrad der Logs: `trace`, `debug`, `info`, `notice`, `warning`, `error`,
`fatal`.

### Option: `system_packages`

Liste zusaetzlicher Alpine-Pakete (apk), die beim Start installiert werden.

```yaml
system_packages:
  - gcc
```

### Optionen: `mqtt_broker`, `mqtt_port`, `mqtt_user`, `mqtt_password`

Standardmaessig ist MQTT deaktiviert (`mqtt_broker: ""`), damit AppDaemon
auch ohne erreichbaren Broker stabil startet.

Wenn du MQTT nutzen willst, setze den Broker explizit (z. B. `mosquitto`) und
optional Benutzer/Passwort in den Add-on-Optionen.

```yaml
mqtt_broker: mosquitto
mqtt_port: 1883
mqtt_user: "homeassistant"
mqtt_password: "<dein-passwort>"
```

### Option: `python_packages`

Liste zusaetzlicher Python-Pakete (pip), die beim Start installiert werden.

```yaml
python_packages:
  - requests
  - numpy
```

### Option: `init_commands`

Shell-Kommandos, die vor dem Start von AppDaemon ausgefuehrt werden.

```yaml
init_commands:
  - echo "Hello from init"
```

## Dateien und Speicherort

Alle Dateien liegen im Add-on-Konfigurationsordner, erreichbar unter
`/config` (im Add-on) bzw. `/addon_configs/<slug>_appdaemon-vscode/` auf dem Host:

```text
/config
├── appdaemon.yaml          # Hauptkonfiguration (wird beim ersten Start erzeugt)
├── apps/
│   ├── apps.yaml           # Registrierung der Apps
│   ├── example_app.py      # Beispiel-App
│   └── debug_helper.py     # startet debugpy auf Port 5678
└── .vscode/
    └── launch.json         # VS-Code-Debug-Konfiguration (attach)
```

Beim ersten Start werden Standarddateien angelegt, sofern noch keine
vorhanden sind. Bestehende Dateien werden nicht ueberschrieben.

## Home-Assistant-Anbindung

Die Standard-`appdaemon.yaml` nutzt den internen Supervisor-Proxy:

```yaml
plugins:
  HASS:
    type: hass
    ha_url: http://supervisor/core
    token: !env_var SUPERVISOR_TOKEN
```

Wenn `mqtt_broker` gesetzt ist, ergaenzt das Init-Skript automatisch einen
MQTT-Plugin-Block in der `appdaemon.yaml`.

Es ist **kein** manueller Long-Lived Access Token noetig. Passe bei Bedarf
`latitude`, `longitude`, `elevation` und `time_zone` in der `appdaemon.yaml` an.

## VS Code (code-server)

Der Editor ist ueber den Sidebar-Eintrag des Add-ons erreichbar (Home Assistant
Ingress, keine separate Anmeldung noetig). Er oeffnet direkt den Ordner
`/config`.

### AppDaemon-Logs in VS Code anzeigen

Die AppDaemon-Logs werden bevorzugt nach `/logs/appdaemon.log` geschrieben.
Falls diese Struktur nicht verfuegbar ist, nutzt das Add-on automatisch
`/config/logs/appdaemon.log`.
Im VS Code Integrated Terminal kannst du sie live sehen:

#### Methode 1: Einfacher Befehl

```bash
tail -f /logs/appdaemon.log
```

#### Methode 2: Helper-Skript

```bash
bash .vscode/view-logs.sh
```

Beide Methoden zeigen die letzten 200 Zeilen und folgen neuen Eintraegen live.
Beende die Anzeige mit `Ctrl+C`.

## Remote Debugging

1. Add-on starten. Die App `debug_helper` startet `debugpy` auf Port `5678`.
2. In VS Code (code-server) eine App-Datei unter `apps/` oeffnen und einen
   Breakpoint setzen.
3. Debug-Ansicht oeffnen und die Konfiguration
   **„AppDaemon Remote Debug (attach)"** starten (`F5`).
4. Sobald der Code-Pfad ausgefuehrt wird, haelt der Debugger am Breakpoint.

Fuer den Attach von einem **externen** VS Code (nicht code-server) muss der
Port `5678` freigegeben sein (Tab **Network**) und im `launch.json` als Host die
IP des Home-Assistant-Hosts eingetragen werden.

## Ports

| Port | Zweck |
| --- | --- |
| `5050/tcp` | AppDaemon Web UI / HADashboard |
| `5678/tcp` | debugpy Remote Debugging (VS Code attach) |

## Support

Bei Problemen die Add-on-Logs pruefen (Tab **Log**).
