# Request

| Index Word | Description                              |
|------------|------------------------------------------|
| 0          | Header code \[0x00010800\]               |
| 1-32       | [FatalErrInfo](#FatalErrInfo "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# FatalErrInfo

| Offset | Size | Description                                                                                 |
|--------|------|---------------------------------------------------------------------------------------------|
| 0x0    | 0x1  | [FatalErrType](#FatalErrType "wikilink")                                                    |
| 0x1    | 0x1  | Revision High (0x0 observed)                                                                |
| 0x2    | 0x2  | Revision Low (0x8436 and 0xCACA observed)                                                   |
| 0x4    | 0x4  | Result Code                                                                                 |
| 0x8    | 0x4  | PC Address                                                                                  |
| 0xC    | 0x4  | Process ID                                                                                  |
| 0x10   | 0x8  | Title ID [placeholder](FS:GetProgramLaunchInfo "wikilink")                                  |
| 0x18   | 0x8  | Applet Title ID [placeholder](APT:GetAppletInfo "wikilink")                                 |
| 0x20   | 0x60 | Data (type 3 = [Exception](#Exception "wikilink"), type 4 = [Failure](#Failure "wikilink")) |

## FatalErrType

| Value | Description    |
|-------|----------------|
| 0     | Generic        |
| 1     | Corrupted      |
| 2     | Card removed   |
| 3     | Exception      |
| 4     | Result Failure |
| 5     | Logged         |

## Exception

| Offset | Size | Description                                |
|--------|------|--------------------------------------------|
| 0x0    | 0x18 | [ExceptionInfo](#ExceptionInfo "wikilink") |
| 0x18   | 0x44 | CpuRegisters (r0-r12, sp, lr, pc, cpsr)    |

### ExceptionType

| Value | Description         |
|-------|---------------------|
| 0     | Prefetch Abort      |
| 1     | Data Abort          |
| 2     | Undefined Exception |
| 3     | VFP Exception       |

### ExceptionInfo

| Offset | Size | Description                                |
|--------|------|--------------------------------------------|
| 0x0    | 0x1  | [ExceptionType](#ExceptionType "wikilink") |
| 0x1    | 0x3  | Padding                                    |
| 0x4    | 0x4  | IFSR (Prefetch Abort)/DFSR (Data Abort)    |
| 0x8    | 0x4  | r15 (Prefetch Abort)/DFAR (Data Abort)     |
| 0xC    | 0x4  | FPEXC (VFP Exception)                      |
| 0x10   | 0x4  | FPINST (VFP Exception)                     |
| 0x14   | 0x4  | FPINST2 (VFP Exception)                    |

## Failure

| Offset | Size | Description     |
|--------|------|-----------------|
| 0x0    | 0x60 | char\*, Message |

# Output

## Generic

| Entry    | Format string                 | Format args                                                                                                                                                                                              |
|----------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PID      | 0x%08X_0x%08X                 | [FatalErrInfo](#FatalErrInfo "wikilink") Title ID                                                                                                                                                        |
| REV      | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Revision Low \| ([FatalErrInfo](#FatalErrInfo "wikilink") Revision High \<\< 16)                                                                                |
| AID      | 0x%08X_0x%08X                 | [FatalErrInfo](#FatalErrInfo "wikilink") Application Title ID                                                                                                                                            |
| ADR      | 0x%08X                        | [FatalErrInfo](#FatalErrInfo "wikilink") PC Address                                                                                                                                                      |
| RSL      | 0x%08X                        | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code                                                                                                                                                     |
| Level    | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x80000000 ? ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code \>\> 27) - 0x20 : [FatalErrInfo](#FatalErrInfo "wikilink") Result Code \>\> 27 |
| Summary  | %d                            | ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x7E00000) \>\> 21                                                                                                                               |
| Module   | %d                            | ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x3FC00) \>\> 10                                                                                                                                 |
| Desc     | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x3FF                                                                                                                                             |
| Datetime | %04d/%02d/%02d %02d:%02d:%02d | Current Time                                                                                                                                                                                             |

## Corrupted

Follows the same general output format as Generic, but the bottom screen
instead displays the following:

"The System Memory has been damaged. For help, please contact your local
customer support centre. For contact details, check the Operations
Manual or visit support.nintendo.com."

## Result Failure

| Entry    | Format string                 | Format args                                                                                                                                                                                              |
|----------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PID      | 0x%08X_0x%08X                 | [FatalErrInfo](#FatalErrInfo "wikilink") Title ID                                                                                                                                                        |
| REV      | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Revision Low \| ([FatalErrInfo](#FatalErrInfo "wikilink") Revision High \<\< 16)                                                                                |
| AID      | 0x%08X_0x%08X                 | [FatalErrInfo](#FatalErrInfo "wikilink") Application Title ID                                                                                                                                            |
| RSL      | 0x%08X                        | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code                                                                                                                                                     |
| Level    | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x80000000 ? ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code \>\> 27) - 0x20 : [FatalErrInfo](#FatalErrInfo "wikilink") Result Code \>\> 27 |
| Summary  | %d                            | ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x7E00000) \>\> 21                                                                                                                               |
| Module   | %d                            | ([FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x3FC00) \>\> 10                                                                                                                                 |
| Desc     | %d                            | [FatalErrInfo](#FatalErrInfo "wikilink") Result Code & 0x3FF                                                                                                                                             |
| ?        | %.\*s                         | [FatalErrInfo](#FatalErrInfo "wikilink") Data [Failure](#Failure "wikilink") Message                                                                                                                     |
| Datetime | %04d/%02d/%02d %02d:%02d:%02d | Current Time                                                                                                                                                                                             |

## Cart Removed

No actual error information. Shows the error screen normally shown when
pulling a game cart while in DS mode.