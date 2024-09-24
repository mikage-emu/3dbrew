+++
title = 'NDM Services'
categories = ["Services"]
+++

# NDM service "ndm:u"

| Command Header | Description                                                          |
|----------------|----------------------------------------------------------------------|
| 0x00010042     | [EnterExclusiveState](NDMU:EnterExclusiveState "wikilink")           |
| 0x00020002     | [LeaveExclusiveState](NDMU:LeaveExclusiveState "wikilink")           |
| 0x00030000     | [QueryExclusiveMode](NDMU:QueryExclusiveMode "wikilink")             |
| 0x00040002     | [LockState](NDMU:LockState "wikilink")                               |
| 0x00050002     | [UnlockState](NDMU:UnlockState "wikilink")                           |
| 0x00060040     | [SuspendDaemons](NDMU:SuspendDaemons "wikilink")                     |
| 0x00070040     | [ResumeDaemons](NDMU:ResumeDaemons "wikilink")                       |
| 0x00080040     | [SuspendScheduler](NDMU:SuspendScheduler "wikilink")                 |
| 0x00090000     | [ResumeScheduler](NDMU:ResumeScheduler "wikilink")                   |
| 0x000A0000     | [GetCurrentState](NDMU:GetCurrentState "wikilink")                   |
| 0x000B0000     | [GetTargetState](NDMU:GetTargetState "wikilink")                     |
| 0x000C0000     | Stubbed. (Not implemented)                                           |
| 0x000D0040     | [QueryStatus](NDMU:QueryStatus "wikilink")                           |
| 0x000E0040     | [GetDaemonDisableCount](NDMU:GetDaemonDisableCount "wikilink")       |
| 0x000F0000     | [GetSchedulerDisableCount](NDMU:GetSchedulerDisableCount "wikilink") |
| 0x00100040     | [SetScanInterval](NDMU:SetScanInterval "wikilink")                   |
| 0x00110000     | [GetScanInterval](NDMU:GetScanInterval "wikilink")                   |
| 0x00120040     | [SetRetryInterval](NDMU:SetRetryInterval "wikilink")                 |
| 0x00130000     | [GetRetryInterval](NDMU:GetRetryInterval "wikilink")                 |
| 0x00140040     | [OverrideDefaultDaemons](NDMU:OverrideDefaultDaemons "wikilink")     |
| 0x00150000     | [ResetDefaultDaemons](NDMU:ResetDefaultDaemons "wikilink")           |
| 0x00160000     | [GetDefaultDaemons](NDMU:GetDefaultDaemons "wikilink")               |
| 0x00170000     | [ClearHalfAwakeMacFilter](NDMU:ClearHalfAwakeMacFilter "wikilink")   |

**enum ExclusiveState**

| Enum                                 | Value |
|--------------------------------------|-------|
| EXCLUSIVE_STATE_NONE                 | 0     |
| EXCLUSIVE_STATE_INFRASTRUCTURE       | 1     |
| EXCLUSIVE_STATE_LOCAL_COMMUNICATIONS | 2     |
| EXCLUSIVE_STATE_STREETPASS           | 3     |
| EXCLUSIVE_STATE_STREETPASS_DATA      | 4     |

**enum Daemon**

| Enum           | Value |
|----------------|-------|
| DAEMON_CEC     | 0     |
| DAEMON_BOSS    | 1     |
| DAEMON_NIM     | 2     |
| DAEMON_FRIENDS | 3     |

**enum DaemonMask**

| Enum                | Value                 |
|---------------------|-----------------------|
| DAEMON_MASK_CEC     | 1 \<\< DAEMON_CEC     |
| DAEMON_MASK_BOSS    | 1 \<\< DAEMON_BOSS    |
| DAEMON_MASK_NIM     | 1 \<\< DAEMON_NIM     |
| DAEMON_MASK_FRIENDS | 1 \<\< DAEMON_FRIENDS |

**enum DaemonStatus**

| Enum                     | Value |
|--------------------------|-------|
| DAEMON_STATUS_BUSY       | 0     |
| DAEMON_STATUS_IDLE       | 1     |
| DAEMON_STATUS_SUSPENDING | 2     |
| DAEMON_STATUS_SUSPENDED  | 3     |

**enum State**

| Enum                                     | Value |
|------------------------------------------|-------|
| STATE_INITIAL                            | 0     |
| STATE_SUSPENDED                          | 1     |
| STATE_INFRASTRUCTURE_CONNECTING          | 2     |
| STATE_INFRASTRUCTURE_CONNECTED           | 3     |
| STATE_INFRASTRUCTURE_WORKING             | 4     |
| STATE_INFRASTRUCTURE_SUSPENDING          | 5     |
| STATE_INFRASTRUCTURE_FORCE_SUSPENDING    | 6     |
| STATE_INFRASTRUCTURE_DISCONNECTING       | 7     |
| STATE_INFRASTRUCTURE_FORCE_DISCONNECTING | 8     |
| STATE_CEC_WORKING                        | 9     |
| STATE_CEC_FORCE_SUSPENDING               | 10    |
| STATE_CEC_SUSPENDING                     | 11    |

[Category:Services](Category:Services "wikilink")