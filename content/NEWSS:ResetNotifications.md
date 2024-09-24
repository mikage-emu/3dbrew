# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This erases the internal database and then deletes the system savedata
for the NEWS sysmodule and re-creates it again. The news.db file isn't
created in this process.