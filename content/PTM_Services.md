+++
title = 'PTM Services'
+++

A total of 24 sessions can be open for each of these services combined.
The commands for each service are handled by the PTM module main()
thread.

# User PTM Service "ptm:u" / PTM services

| Command Header | Description                                                   |
|----------------|---------------------------------------------------------------|
| 0x00010002     | RegisterAlarmClient                                           |
| 0x00020080     | SetRtcAlarm                                                   |
| 0x00030000     | GetRtcAlarm                                                   |
| 0x00040000     | CancelRtcAlarm                                                |
| 0x00050000     | [GetAdapterState](PTM:GetAdapterState "wikilink")             |
| 0x00060000     | [GetShellState](PTM:GetShellState "wikilink")                 |
| 0x00070000     | [GetBatteryLevel](PTM:GetBatteryLevel "wikilink")             |
| 0x00080000     | [GetBatteryChargeState](PTM:GetBatteryChargeState "wikilink") |
| 0x00090000     | [GetPedometerState](PTM:GetPedometerState "wikilink")         |
| 0x000A0042     | GetStepHistoryEntry                                           |
| 0x000B00C2     | [GetStepHistory](PTM:GetStepHistory "wikilink")               |
| 0x000C0000     | [GetTotalStepCount](PTM:GetTotalStepCount "wikilink")         |
| 0x000D0040     | SetPedometerRecordingMode                                     |
| 0x000E0000     | GetPedometerRecordingMode                                     |
| 0x000F0084     | GetStepHistoryAll                                             |

The above commands are available for all PTM services, except the
SetSystemTime service.

# PlayHistory PTM Service "ptm:play"

| Command Header | Description                                     |
|----------------|-------------------------------------------------|
| 0x08070082     | [GetPlayHistory](PTM:GetPlayHistory "wikilink") |
| 0x08080000     | GetPlayHistoryStart                             |
| 0x08090000     | GetPlayHistoryLength                            |
| 0x080B0080     | CalcPlayHistoryStart                            |

# SystemControl PTM Service "ptm:s"

Identical to the below "ptm:sysm"

# SysMenu PTM Service "ptm:sysm"

| Command Header | Description                                                                                                                                                                               |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x040100C0     | SetRtcAlarmEx                                                                                                                                                                             |
| 0x04020042     | ReplySleepQuery                                                                                                                                                                           |
| 0x04030042     | NotifySleepPreparationComplete                                                                                                                                                            |
| 0x04040102     | SetWakeupTrigger                                                                                                                                                                          |
| 0x04050000     | GetAwakeReason                                                                                                                                                                            |
| 0x04060000     | RequestSleep                                                                                                                                                                              |
| 0x040700C0     | [ShutdownAsync](PTM:ShutdownAsync "wikilink")                                                                                                                                             |
| 0x04080000     | Awake                                                                                                                                                                                     |
| 0x04090080     | [RebootAsync](PTMSYSM:LaunchFIRMRebootSystem "wikilink")                                                                                                                                  |
| 0x040A0000     | [CheckNew3DS](PTMSYSM:CheckNew3DS "wikilink") (Added with [8.0.0-18](8.0.0-18 "wikilink"))                                                                                                |
| 0x08010640     | [SetInfoLEDPattern](PTMSYSM:SetInfoLEDPattern "wikilink") (These 4 LED commands are used for the notification LED, see [MCU](MCU "wikilink") regarding boot fail with invalid parameters) |
| 0x08020040     | [SetInfoLEDPatternHeader](PTMSYSM:SetInfoLEDPatternHeader "wikilink")                                                                                                                     |
| 0x08030000     | [GetInfoLEDStatus](PTMSYSM:GetInfoLEDStatus "wikilink")                                                                                                                                   |
| 0x08040040     | [SetBatteryEmptyLEDPattern](PTMSYSM:SetBatteryEmptyLEDPattern "wikilink")                                                                                                                 |
| 0x08050000     | ClearStepHistory                                                                                                                                                                          |
| 0x080600C2     | SetStepHistory                                                                                                                                                                            |
| 0x08070082     | [GetPlayHistory](PTM:GetPlayHistory "wikilink")                                                                                                                                           |
| 0x08080000     | GetPlayHistoryStart                                                                                                                                                                       |
| 0x08090000     | GetPlayHistoryLength                                                                                                                                                                      |
| 0x080A0000     | ClearPlayHistory                                                                                                                                                                          |
| 0x080B0080     | CalcPlayHistoryStart                                                                                                                                                                      |
| 0x080C0080     | SetUserTime                                                                                                                                                                               |
| 0x080D0000     | InvalidateSystemTime                                                                                                                                                                      |
| 0x080E0140     | [NotifyPlayEvent](PTMSYSM:NotifyPlayEvent "wikilink")                                                                                                                                     |
| 0x080F0000     | [GetSoftwareClosedFlag](PTMSYSM:GetSoftwareClosedFlag "wikilink")                                                                                                                         |
| 0x08100000     | [ClearSoftwareClosedFlag](PTMSYSM:ClearSoftwareClosedFlag "wikilink")                                                                                                                     |
| 0x08110000     | GetShellStatus                                                                                                                                                                            |
| 0x08120000     | IsShutdownByBatteryEmpty                                                                                                                                                                  |
| 0x08130000     | FormatSavedata                                                                                                                                                                            |
| 0x08140000     | GetLegacyJumpProhibitedFlag                                                                                                                                                               |
| 0x08150040     | SetPlayHistoryRecordingMode                                                                                                                                                               |
| 0x0816....     | Abstraction for mcu::RTC::GetSystemClock                                                                                                                                                  |
| 0x0817....     | Abstraction for mcu::RTC::SetSystemClock                                                                                                                                                  |
| 0x08180040     | [ConfigureNew3DSCPU](PTMSYSM:ConfigureNew3DSCPU "wikilink")                                                                                                                               |
|                |                                                                                                                                                                                           |

# GetSystemTime PTM Service "ptm:gets"

| Command Header | Description   |
|----------------|---------------|
| 0x04010000     | GetSystemTime |
|                |               |

# SetSystemTime PTM Service "ptm:sets"

| Command Header | Description   |
|----------------|---------------|
| 0x00010080     | SetSystemTime |
|                |               |

# PTM [System_SaveData](System_SaveData "wikilink")

*Main article: [PTM Savegame](PTM_Savegame "wikilink")*

During system boot PTM attempts to open the [PTM
savedata](PTM_Savegame "wikilink"), if this fails it will repeatedly
keep trying to open the archive. When opening the archive is failing due
to savedata corruption, PTM eventually (during system boot) deletes the
savedata then creates it again.

Savedata contents:

- "/Pedometer.dat"
- "/PlayHistory.dat" Filesize is 0xD5DE8.