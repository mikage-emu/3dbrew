# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0000\] |

# Response

| Index Word | Description                                                          |
|------------|----------------------------------------------------------------------|
| 0          | Header code                                                          |
| 1          | Result code                                                          |
| 2          | Output connection type: 0 = none, 1 = Slot 1, 2 = Slot 2, 4 = Slot 3 |

# Description

This obtains whether the system is using wifi(Internet/local). When the
hardware wifi switch is set to off, or when the system is connecting to
the Internet, this returns error-code 0xE0A09D2E.