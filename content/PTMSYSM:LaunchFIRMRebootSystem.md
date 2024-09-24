+++
title = 'PTMSYSM:LaunchFIRMRebootSystem'
+++

# Request

| Index Word | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x04090080\]                                                                    |
| 1-2        | u64, timeout passed to [PMApp:TerminateNonEssential](PMApp:TerminateNonEssential "wikilink"). |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This uses [PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink")
with the input timeout. This then uses
[svcKernelSetState](SVC "wikilink") with Type1 and Param0-Param3 = 0.
Then this uses [svcKernelSetState](SVC "wikilink") with Type3 where
Param0=1 to trigger copying the ARM11 kernel [FIRM](FIRM "wikilink")
parameters buffer to FCRAM+0, then [svcKernelSetState](SVC "wikilink")
with Type7 is used to trigger a hardware system reboot via the MCU.
