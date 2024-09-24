# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00160000\] |

# Response

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code                                                           |
| 1          | Result code                                                           |
| 2          | Daemon bit mask (see [here](NDM_Services "wikilink") for mask values) |

# Description

Gets the current default daemon bit mask. The default value is
(DAEMONMASK_CEC \| DAEMONMASK_FRIENDS)