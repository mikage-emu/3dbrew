+++
title = 'CECD Services'
categories = ["Services"]
+++

Streetpass stuff.

# CECD Service "cecd:u"

| Command Header | Description                                                                                                     |
|----------------|-----------------------------------------------------------------------------------------------------------------|
| 0x000100C2     | Open/[OpenRawFile](CECDU:OpenRawFile "wikilink")                                                                |
| 0x00020042     | Read/[ReadRawFile](CECDU:ReadRawFile "wikilink")                                                                |
| 0x00030104     | [ReadMessage](CECDU:ReadMessage "wikilink")                                                                     |
| 0x00040106     | [ReadMessageWithHMAC](CECDU:ReadMessageWithHMAC "wikilink")                                                     |
| 0x00050042     | Write/[WriteRawFile](CECDU:WriteRawFile "wikilink")                                                             |
| 0x00060104     | [WriteMessage](CECDU:WriteMessage "wikilink")                                                                   |
| 0x00070106     | [WriteMessageWithHMAC](CECDU:WriteMessageWithHMAC "wikilink")                                                   |
| 0x00080102     | [Delete](CECDU:Delete "wikilink")                                                                               |
| 0x000900C2     | SetData (16\*length+10 of CecMessageId buffer in cmdbuff\[4\] (always 16\*8+10), CecMessageId\* in cmdbuf\[5\]) |
| 0x000A00C4     | ReadData/[GetSystemInfo](CECDU:GetSystemInfo "wikilink")                                                        |
| 0x000B0040     | [Start](CECDU:Start "wikilink")                                                                                 |
| 0x000C0040     | [Stop](CECDU:Stop "wikilink")                                                                                   |
| 0x000D0082     | GetCecInfoBuffer                                                                                                |
| 0x000E0000     | GetCecdState (returns CecStateAbbreviated in cmdbuf\[2\])                                                       |
| 0x000F0000     | GetCecInfoEventHandle (returns event handle in cmdbuf\[3\])                                                     |
| 0x00100000     | GetChangeStateEventHandle (returns event handle in cmdbuf\[3\])                                                 |
| 0x00110104     | [OpenAndWrite](CECDU:OpenAndWrite "wikilink")                                                                   |
| 0x00120104     | [OpenAndRead](CECDU:OpenAndRead "wikilink")                                                                     |
| 0x001E0082     | GetEventLog                                                                                                     |
| 0x001F0000     | GetEventLogStart                                                                                                |
| 0x0020....     | ?                                                                                                               |
| 0x0021....     | ?                                                                                                               |
|                |                                                                                                                 |

### CecDataPathType

| Name                  | Value                    | Notes                                          |
|-----------------------|--------------------------|------------------------------------------------|
| CEC_PATH_MBOX_LIST    | 1                        | <data:/CEC/MBoxList____>                       |
| CEC_PATH_MBOX_INFO    | 2                        | <data:/CEC/><id>/MBoxInfo____              |
| CEC_PATH_INBOX_INFO   | 3                        | <data:/CEC/><id>/InBox___/BoxInfo_____ |
| CEC_PATH_OUTBOX_INFO  | 4                        | <data:/CEC/><id>/OutBox__/BoxInfo_____  |
| CEC_PATH_OUTBOX_INDEX | 5                        | <data:/CEC/><id>/OutBox__/OBIndex_____  |
| CEC_PATH_INBOX_MSG    | 6                        | <data:/CEC/><id>/InBox___/_<message_id>    |
| CEC_PATH_OUTBOX_MSG   | 7                        | <data:/CEC/><id>/OutBox__/_<message_id>     |
| CEC_PATH_ROOT_DIR     | 10                       | <data:/CEC>                                    |
| CEC_PATH_MBOX_DIR     | 11                       | <data:/CEC/><id>                               |
| CEC_PATH_INBOX_DIR    | 12                       | <data:/CEC/><id>/InBox___                   |
| CEC_PATH_OUTBOX_DIR   | 13                       | <data:/CEC/><id>/OutBox__                    |
|                       | 101 thru 199 (inclusive) | <data:/CEC/><id>/MBoxData.0<i-100>             |
| CECMESSAGE_BOX_ICON   | 101                      | <data:/CEC/><id>/MBoxData.001                  |
| CECMESSAGE_BOX_TITLE  | 110                      | <data:/CEC/><id>/MBoxData.010                  |

### CecCommand

| Name                              | Value | Notes |
|-----------------------------------|-------|-------|
| CEC_COMMAND_NONE                  | 0     |       |
| CEC_COMMAND_START                 | 1     |       |
| CEC_COMMAND_RESET_START           | 2     |       |
| CEC_COMMAND_READYSCAN             | 3     |       |
| CEC_COMMAND_READYSCANWAIT         | 4     |       |
| CEC_COMMAND_STARTSCAN             | 5     |       |
| CEC_COMMAND_RESCAN                | 6     |       |
| CEC_COMMAND_NDM_RESUME            | 7     |       |
| CEC_COMMAND_NDM_SUSPEND           | 8     |       |
| CEC_COMMAND_NDM_SUSPEND_IMMEDIATE | 9     |       |
| CEC_COMMAND_STOPWAIT              | 0xA   |       |
| CEC_COMMAND_STOP                  | 0xB   |       |
| CEC_COMMAND_STOP_FORCE            | 0xC   |       |
| CEC_COMMAND_STOP_FORCE_WAIT       | 0xD   |       |
| CEC_COMMAND_RESET_FILTER          | 0xE   |       |
| CEC_COMMAND_DAEMON_STOP           | 0xF   |       |
| CEC_COMMAND_DAEMON_START          | 0x10  |       |
| CEC_COMMAND_EXIT                  | 0x11  |       |
| CEC_COMMAND_OVER_BOSS             | 0x12  |       |
| CEC_COMMAND_OVER_BOSS_FORCE       | 0x13  |       |
| CEC_COMMAND_OVER_BOSS_FORCE_WAIT  | 0x14  |       |
| CEC_COMMAND_END                   | 0x15  |       |
|                                   |       |       |

### CecStateAbbreviated

| Name                      | Value | Notes                                                                                     |
|---------------------------|-------|-------------------------------------------------------------------------------------------|
| CEC_STATE_ABBREV_IDLE     | 1     | Corresponds to CEC_STATE_IDLE                                                             |
| CEC_STATE_ABBREV_INACTIVE | 2     | Corresponds to CEC_STATEs \*FINISH\*, \*POST, and OVER_BOSS                               |
| CEC_STATE_ABBREV_SCANNING | 3     | Corresponds to CEC_STATE_SCANNING                                                         |
| CEC_STATE_ABBREV_WLREADY? | 4     | Corresponds to CEC_STATE_WIRELESS_READY when some unknown bool is true                    |
| CEC_STATE_ABBREV_OTHER    | 5     | Corresponds to CEC_STATEs besides \*FINISH\*, \*POST, and OVER_BOSS and those listed here |

### CecMessageId

| Type      | Field |
|-----------|-------|
| char\[8\] | data  |
|           |       |

# CECD Service "cecd:s"

This contains a similar (probably the same) command handler from
0x0001.... to 0x0021.... as them in cecd:u. In addition, it also
contains

| Command Header | Description              |
|----------------|--------------------------|
| 0x0401....     | ?                        |
| 0x04020002     | GetCecInfoEventHandleSys |
| 0x040A....     | ?                        |
| 0x040B....     | ?                        |
| 0x040C0042     | ?                        |
| 0x040D0082     | ?                        |
| 0x040E....     | ?                        |
| 0x040F....     | ?                        |
| 0x0410....     | ?                        |
| 0x04110042     | ?                        |
| 0x041200C2     | ?                        |
| 0x0413....     | ?                        |
| 0x0414....     | ?                        |
| 0x0415....     | ?                        |
| 0x04160002     | ?                        |
| 0x0417....     | ?                        |
|                |                          |

# CECD Service "cecd:ndm"

| Command Header | Description                     |
|----------------|---------------------------------|
| 0x00010000     | Initialize                      |
| 0x00020000     | Deinitialize                    |
| 0x00030000     | ResumeDaemon                    |
| 0x00040040     | SuspendDaemon(bool immediately) |
| 0x00050000     | QueryStatus                     |
| 0x00060042     | GetNZoneInfo                    |
| 0x00070042     | SetNZoneSSIDList                |
| 0x00080042     | SetNZoneMacFilter               |
|                |                                 |

[Category:Services](Category:Services "wikilink")
