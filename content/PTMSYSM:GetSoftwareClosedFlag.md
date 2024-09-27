+++
title = 'PTMSYSM:GetSoftwareClosedFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080F0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | bool flag   |

# Description

This is an abstraction for
[MCURTC:GetSoftwareClosedFlag](MCURTC:GetSoftwareClosedFlag "wikilink"),
used by Home Menu to determine if "Software closed" dialog was requested
by the last FIRM and should now be displayed. This screen looks similar
to the normal power off screen (HOME to return to menu, POWER to
continue shutdown).
