# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This manually syncs all pending notifications that are present on the
sysmodule "boss savedata". The news sysmodule queries the list of
notifications with BOSS command 0x00100102 (GetNsDataIdList), then gets
some NS data information for each data ID with command 0x002700C2
(GetNsDataHeaderInfo) type=5 and command 0x002D0040
(GetNsDataLastUpdate), and finally reads the notification data.

The sysmodule then extracts all the notification data from the BOSS
notification and saves it to the savedata.

# BOSS notification

The BOSS notification data is a modified version of a regular
notification. It combines a custom header, a fully allocated message
(size: 0x1780 bytes) and an optional image, all appended in a single
file.

## Header structure

| Offset | Size | Description                                                                                                                     |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1  | u8 flag: 0 = invalid, 1 = valid ("notification exists" flag). Always 0x1                                                        |
| 0x1    | 0x1  | u8 flag: 0 = read, 1 = unread. Always 0x1                                                                                       |
| 0x2    | 0x1  | u8 flag: 0 = image data is not JPEG, 1 = image data is JPEG.                                                                    |
| 0x3    | 0x1  | u8 flag: 0 = non-SpotPass notification, 1 = SpotPass notification (zero for system notifications)                               |
| 0x4    | 0x1  | u8 flag: 0 = opted in to this notification, 1 = opted out of this notification. Always 0x0                                      |
| 0x5    | 0x1  | u8 flag: 0 = message doesn't have a browser link, 1 = message has a browser link                                                |
| 0x6    | 0x1  | u8 flag: unknown                                                                                                                |
| 0x7    | 0x1  | padding?                                                                                                                        |
| 0x8    | 0x8  | u64 programID: notification source (zero for system notifications)                                                              |
| 0x10   | 0x8  | u64 jumpParam: specified by source app and later retrieved via APT to identify which notification, if any, it was launched from |
| 0x18   | 0x8  | padding?                                                                                                                        |
| 0x20   | 0x40 | UTF-16 string for the notification title                                                                                        |