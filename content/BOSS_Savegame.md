+++
title = 'BOSS Savegame'
+++

This page describes the content of the [BOSS](SpotPass "wikilink")
sysmodule savegame.

The savegame contains 7 files and no directories

## BOSS_A.db

## BOSS_SS.db

SS could stand for subscriptions

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x00   | 4    | Magic Number (0x12348000) |

After an array of data chunks with a chunk size of 0xC00 follow. An
index of this array seem to correspond to the data with same index in
BOSS_SV.db

## BOSS_SV.db

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x00   | 4    | Magic Number (0x12348000) |

After an array of data chunks with a chunk size of 0xC00 follow.

An index of this array seem to correspond to the data with same index in
BOSS_SS.db

### Data Chunk

| Offset | Size | Description                                                                                                                                       |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 16   | Unknown                                                                                                                                           |
| 0x10   | 8    | Title ID                                                                                                                                          |
| 0x18   | 8    | Task ID (ASCII String)                                                                                                                            |
| 0x20   | 8    | Unknown                                                                                                                                           |
| 0x28   | 4    | Intervall/Wait time until this task should be executed again (in seconds)                                                                         |
| 0x2C   | 4    | Unknown                                                                                                                                           |
| 0x30   | 8    | Timestamp. Seconds since year 2000 of the user setable time (RTC + user time offset). Time of the last successful download/execution of the task. |

#### Task sprelay

| Offset | Size | Description                                                                                                                         |
|--------|------|-------------------------------------------------------------------------------------------------------------------------------------|
| 0x288  | 4    | Unknown                                                                                                                             |
| 0x28C  | 4    | Padding?                                                                                                                            |
| 0x290  | 8    | Timestamp. Seconds since year 2000 of the RTC (no user time offset). Time of the last successful download of StreetPass Relay data. |
| 0x298  | 4    | (?) Intervall/Wait time (in seconds) until the same access point (defined by its MAC address) will be used again.                   |
| 0x29C  | 4    | Number of items in the visited access points list                                                                                   |
| 0x2A0  | ?    | Visited Access Points List                                                                                                          |

Visited Access Points List Entry

| Offset | Size | Description                                                                                                            |
|--------|------|------------------------------------------------------------------------------------------------------------------------|
| 0x2A0  | 8    | MAC address of access point                                                                                            |
| 0x2A8  | 4    | Timestamp. Seconds since year 2000 of the RTC (no user time offset). Time of the last download from this access point. |
| 0x2AC  | 4    | Padding?                                                                                                               |

The last entry of this list should have the same timestamp as the
timestamp at offset 0x290.

## BOSS_PH_INFO.db

## BOSS_PM_INFO.db

## BOSS_SP_INFO.db

## sendmgn00.up
