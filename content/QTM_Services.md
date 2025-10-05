+++
title = 'QTM Services'
categories = ["Services"]
+++

QTM is the [New_3DS](New_3DS "wikilink") system module in charge of handling head tracking. A maximum of three (only two until [9.3.0-21](9.3.0-21 "wikilink")) sessions for \*all\* QTM services combined.

Head tracking is not usable when any other process is using any of the cameras, QTM returns error 0xC8A18008 for this.

QTM only tracks the position of the user's two eyes, but does not track the area they are focusing at. Hence, "eye-tracking" is sometimes used to refer to this feature on 3DS, even though it means something else outside the 3DS hacking scene.

Refer to this libctru commit for more details: <https://github.com/devkitPro/libctru/commit/8e55cdf05d1f2c07f350ec678d0f0d6a7a2df214>

# QTM services

# QTM user service "qtm:u"

| Command ID | Description               |
|------------|---------------------------|
| 0x00010080 | GetRawTrackingDataEx      |
| 0x00020080 | GetTrackingDataEx         |
| 0x00030000 | EnableManualIrLedControl  |
| 0x00040000 | DisableManualIrLedControl |
| 0x00050040 | SetIrLedStatus            |
| 0x00060000 | IsCurrentAppBlacklisted   |

# QTM system service "qtm:s"

"qtm:s" has access to all "qtm:u" commands and more:

| Command ID | Description               |
|------------|---------------------------|
| 0x04010040 | SetCentralBarrierPosition |
| 0x04020000 | GetCameraLux              |
| 0x04030000 | EnableAutoBarrierControl  |
| 0x04040000 | DisableAutoBarrierControl |
| 0x04050040 | SetBarrierPosition        |
| 0x04060000 | GetCurrentBarrierPosition |
| 0x04070040 | SetIrLedStatusOverride    |
| 0x040801C0 | SetCalibrationData        |
| 0x04090000 | GetQtmStatus              |
| 0x040A0040 | SetQtmStatus              |

# QTM service "qtm:sp"

qtm:sp has access to all "qtm:u", "qtm:s" commands and more:

| Command ID | Description            |
|------------|------------------------|
| 0x08010040 | NotifyTopLcdModeChange |
| 0x08020000 | NotifyTopLcdPowerOn    |
| 0x08030000 | IsExpanderInUse        |
| 0x08040000 | NotifyTopLcdPowerOff   |

GSP always keeps an handle to this service open. NS sometimes uses this service (to blacklist some internal test applications, see [NS_CFA](NS_CFA "wikilink")), but when it does it opens then immediately closes the session thereafter.

# QTM "hardware check" service "qtm:c"

| Command ID | Description                 |
|------------|-----------------------------|
| 0x00010000 | StartHardwareCheck          |
| 0x00020000 | StopHardwareCheck           |
| 0x00030040 | SetBarrierPattern           |
| 0x00040000 | WaitAndCheckExpanderWorking |
| 0x00050040 | SetIrLedStatusOverride      |

The commands for this service are separate from all the other services documented above.

[Category:Services](Category:Services "wikilink")
