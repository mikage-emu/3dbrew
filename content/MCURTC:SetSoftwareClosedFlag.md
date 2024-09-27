# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00510040\] |
| 1          | bool                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes to the MCU system-state buffer and updates the
SoftwareClosed (formerly LegacyPoweroff) bit.

This is set by LgyBg during graceful reboot (power not \*held\*) to
prompt a "Software closed" screen when the system returns to
NATIVE_FIRM. If power was held during a LGY fatal error, this flag is
not set.

This is also set when power is pressed in System Settings (as a reboot
is enforced there), hence no longer being called "LegacyPoweroff".