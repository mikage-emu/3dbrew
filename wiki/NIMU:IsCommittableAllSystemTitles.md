# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090080\] |
| 1          | Result code                |
| 2          | bool Committable           |

# Description

Checks whether all titles that are part of the current system update are
ready to be committed.