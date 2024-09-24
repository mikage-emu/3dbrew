# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110040\] |
| 1          | u8 value                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Value 1 is the default, for the normal operation. Value 0 disables the
IR-I2C register pokes which set/clear IOState bit0 and IER
bit4(sleep-mode), which are done when starting data send/receive, and
when finishing data send/receive. See
[IRU:SetSleepModeState](IRU:SetSleepModeState "wikilink").