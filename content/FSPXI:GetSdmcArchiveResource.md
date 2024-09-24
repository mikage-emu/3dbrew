# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00190000\] |

# Response

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code                      |
| 1          | Resultcode                       |
| 2          | Sector byte-size                 |
| 3          | Cluster byte-size                |
| 4          | Partition capacity in clusters   |
| 5          | Available free space in clusters |

This returns info for the SD card FAT partition.