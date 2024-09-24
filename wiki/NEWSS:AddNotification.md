# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x000100C6\]     |
| 1          | Header buffer size             |
| 2          | Message buffer size            |
| 3          | Image buffer size, can be zero |
| 4          | (HdrSize\<\<4) \| 10           |
| 5          | Header buffer ptr              |
| 6          | (MsgSize\<\<4) \| 10           |
| 7          | Message buffer ptr             |
| 8          | (ImageSize\<\<4) \| 10         |
| 9          | Image buffer ptr, can be 0x0   |

# Header structure

| Offset | Size | Description                                                                                                                     |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1  | u8 flag: 0 = invalid, 1 = valid ("notification exists" flag).                                                                   |
| 0x1    | 0x1  | u8 flag: 0 = read, 1 = unread                                                                                                   |
| 0x2    | 0x1  | u8 flag: 0 = image data is not JPEG, 1 = image data is JPEG.                                                                    |
| 0x3    | 0x1  | u8 flag: 0 = non-SpotPass notification, 1 = SpotPass notification (zero for system notifications)                               |
| 0x4    | 0x1  | u8 flag: 0 = opted in to this notification, 1 = opted out of this notification                                                  |
| 0x5    | 0x1  | u8 flag: 0 = message doesn't have a browser link, 1 = message has a browser link                                                |
| 0x6    | 0x1  | u8 flag: unknown                                                                                                                |
| 0x7    | 0x1  | padding?                                                                                                                        |
| 0x8    | 0x8  | u64 programID: notification source (zero for system notifications)                                                              |
| 0x10   | 0x4  | u32 nsDataId: set by the sysmodule when handling BOSS notifications                                                             |
| 0x14   | 0x4  | u32 version: set by the sysmodule when handling BOSS notifications                                                              |
| 0x18   | 0x8  | u64 jumpParam: specified by source app and later retrieved via APT to identify which notification, if any, it was launched from |
| 0x20   | 0x8  | padding?                                                                                                                        |
| 0x28   | 0x8  | u64 datetime: milliseconds since January 1, 2000.                                                                               |
| 0x30   | 0x40 | UTF-16 string for the notification title                                                                                        |

This structure is 0x70-bytes.

When
[NEWSS:GetNotificationHeader](NEWSS:GetNotificationHeader "wikilink") is
used where the u8 flag at 0x3 is value 1, news-module then uses
[boss:P](BOSS_Services "wikilink") command 0x04070080 with the u64
programID at offset 0x8 in this header. When that's successful,
[NEWSS:GetNotificationHeader](NEWSS:GetNotificationHeader "wikilink")
copies the output u8, the SpotPass opt-out flag, from that BOSS command
to the u8 flag at 0x4. Otherwise, the opt-out flag is 0 for opted in.

# Message

This is an UTF-16 string for the notification message text, this buffer
includes the null-terminator. When the message has the browser link flag
set, the URL it's located after the null-terminator of the message text
as a UTF-8 string, also with null-termination. The maximum size in bytes
is 0x1780.

# Image

The MPO data is optional. This is displayed on the top-screen by the
notifications applet. The maximum size in bytes is 0x10000.

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This adds a notification to the list of notifications, which is
displayed by the notifications applet. This is added to the end of the
list of notifications.