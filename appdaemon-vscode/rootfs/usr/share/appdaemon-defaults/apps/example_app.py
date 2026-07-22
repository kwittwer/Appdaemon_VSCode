import appdaemon.plugins.hass.hassapi as hass


class ExampleApp(hass.Hass):
    def initialize(self):
        self.log("ExampleApp gestartet.")

        # Beispiel: State abfragen
        sun_state = self.get_state("sun.sun")
        self.log(f"sun.sun state: {sun_state}")

        # Heartbeat alle 10 Sekunden starten
        self.run_every(self.heartbeat, "now+10", 10)

    def heartbeat(self, kwargs):
        """Periodisches Health-Check-Signal"""
        self.log("ExampleApp heartbeat: laeuft weiterhin.")
