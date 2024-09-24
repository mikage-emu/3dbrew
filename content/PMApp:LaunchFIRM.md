+++
title = 'PMApp:LaunchFIRM'
+++

# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x00020082\]           |
| 1          | [FIRM](FIRM "wikilink") Title ID Low |
| 2          | Size                                 |
| 3          | (Size \<\< 4) \| 0xA                 |
| 4          | FIRM Parameters Pointer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[SetFIRMLaunchParams](PMApp:SetFIRMLaunchParams "wikilink"), except this
also triggers launching [FIRM](FIRM "wikilink") via
[svcKernelSetState](SVC "wikilink") after copying the parameter data.
