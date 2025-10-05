+++
title = 'APT:StartNewestHomeMenu'
+++

# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00200044\]     |
| 1          | Parameters Size                |
| 2          | 0x0                            |
| 3          | Handle Parameter               |
| 4          | (Parameters Size \<\< 14) \| 2 |
| 5          | void\*, Parameters             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

None of the input parameters are used by NS. <APT:PrepareToStartNewestHomeMenu> must be used prior to using this command. After initializing [FIRM](FIRM "wikilink") params and [setting](PMApp:SetFIRMLaunchParams "wikilink") the FIRM params, this uses command [PTMSYSM:LaunchFIRMRebootSystem](PTMSYSM:LaunchFIRMRebootSystem "wikilink") with timeout 1000000000\*4.
