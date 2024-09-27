# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0080\] |
| 1-2        | u64, Program ID            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This unregisters the process from PM, internally closing its handle to
the process and removing the process's data entry.