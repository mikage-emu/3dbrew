# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00200044\]     |
| 2          | Parameters Size                |
| 3          | 0x0                            |
| 4          | Handle Parameter               |
| 5          | (Parameters Size \<\< 14) \| 2 |
| 6          | void\*, Parameters             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

None of the input parameters are used by NS.
[<APT:PrepareToStartNewestHomeMenu>](APT:PrepareToStartNewestHomeMenu "wikilink")
must be used prior to using this command. After initializing
[FIRM](FIRM "wikilink") params and
[setting](PMApp:SetFIRMLaunchParams "wikilink") the FIRM params, this
uses command
[PTMSYSM:LaunchFIRMRebootSystem](PTMSYSM:LaunchFIRMRebootSystem "wikilink")
with timeout 1000000000\*4.