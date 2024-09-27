# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003D0000\] |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8 output notification LED status |

# Description

This reads the u8 notification LED status from [I2C](I2C "wikilink") MCU
register 0x2E, via [I2CMCU](I2C_Services "wikilink") service command
0x000D00C0.