# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x00080040\]        |
| 1          | u8 Flag: 0 = enable, 1 = disable. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This controls whether the wireless hardware is disabled or enabled(Home
Menu displays "Disabled" for network status with the former). This is
used by Home Menu for the wireless(Wifi+NFC) enable/disable option under
Home Menu settings, for New3DS systems.

NWM module just verifies state fields, and uses
[SRV:PublishToSubscriber](SRV:PublishToSubscriber "wikilink") with
notificationID=0x206 and flags=0x1 for this NWM command. The input value
for this NWMEXT command is only used for verifying with NWM state,
nothing more.

NWM itself is subscribed to notificationID=0x206. On Old3DS systems,
mcu-module publishes that notification when handling the wireless slider
interrupt, and this command isn't used.