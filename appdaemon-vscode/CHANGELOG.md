# Changelog

Alle nennenswerten Aenderungen an diesem Add-on werden hier dokumentiert.

## 1.1.0

Erstes konsolidiertes Release nach umfangreicher Stabilisierung.

### Neu

- **AppDaemon-Logs live im unteren Terminal-Panel**: Beim Oeffnen des Ordners
  startet automatisch die Aufgabe **Watch AppDaemon Logs** und zeigt die Logs
  fortlaufend an.
- **AppDaemon-Sidebar-Eintrag** per `panel_iframe` dokumentiert (siehe DOCS.md).
- **Watchdog** auf Port `5050`: Home Assistant startet das Add-on automatisch
  neu, falls AppDaemon nicht mehr antwortet.
- **debugpy `launch.json`-Beispiel** in der Dokumentation.

### Behoben

- **Terminal-Absturz (SIGSEGV)** in code-server: Basis-Image auf `20.2.0`
  angehoben, sodass `node-pty` korrekt fuer musl kompiliert wird.
- **Fehlende Logs** im Add-on-Protokoll: AppDaemon loggt wieder nach stdout und
  wird zusaetzlich per `tee` nach `/config/logs/appdaemon.log` gespiegelt.
- **Docker-Build-Fehler** durch musl-Paketkonflikte beseitigt.
- Log-Pfad-Angaben in der Dokumentation auf `/config/logs/appdaemon.log`
  korrigiert.

### Geaendert

- `webui` (Port 5050) entfernt, da es bei aktivem Ingress ohnehin ignoriert
  wird. Die AppDaemon-UI ist weiterhin unter `http://<HA-IP>:5050` erreichbar.

### Bekannte Hinweise

- Im Add-on-Banner koennen Deprecation-Warnungen erscheinen
  (`bashio::addon.name` bzw. "Unable to access the API, forbidden"). Diese
  stammen aus dem Basis-Image und haben keine funktionale Auswirkung.

## Komponenten

- AppDaemon 4.5.11 (Python 3.12)
- code-server 4.93.1 (Ingress)
- debugpy (Port 5678)
