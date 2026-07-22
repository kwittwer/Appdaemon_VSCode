# AppDaemon Debug Helper
# Diese Datei ermoeglicht Remote Debugging mit VS Code / debugpy.

import appdaemon.plugins.hass.hassapi as hass


class DebugHelper(hass.Hass):
    """
    DebugHelper: Erlaubt Remote-Debugging anderer AppDaemon-Apps ueber VS Code.

    Registrierung in apps.yaml:

    debug_helper:
      module: debug_helper
      class: DebugHelper
    """

    def initialize(self):
        self.log("Debug Helper initialized. Remote debugging available on port 5678")

        try:
            import debugpy

            debugpy.listen(("0.0.0.0", 5678))
            self.log("debugpy listening on port 5678 - ready for VS Code attachment")
        except ImportError:
            self.log(
                "debugpy not available. Install with: pip install debugpy",
                level="WARNING",
            )
        except Exception as e:
            self.log(f"Debug setup error: {e}", level="WARNING")
