# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00560000\] |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | The screenshot posting permission |

# Description

This returns whether or not screenshots may be posted on Miiverse.

| Value | Description                                |
|-------|--------------------------------------------|
| 1     | the user has no explicit setting           |
| 2     | screenshot posting to Miiverse is enabled  |
| 3     | screenshot posting to Miiverse is disabled |