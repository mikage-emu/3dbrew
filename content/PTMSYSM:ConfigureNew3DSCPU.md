+++
title = 'PTMSYSM:ConfigureNew3DSCPU'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08180040\] |
| 1          | u8 value                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This just uses [svcKernelSetState](SVC "wikilink") with Type10 where
Param0=<input u8 value from the cmd>.

This command is implemented in the Old3DS PTM sysmodule too, but the
above type is only implemented in the New3DS ARM11-kernel.

This is used by [NS](NS "wikilink").