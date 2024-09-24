+++
title = 'PTMSYSM:ClearSoftwareClosedFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08100000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is an abstraction for
[MCURTC:SetSoftwareClosedFlag](MCURTC:SetSoftwareClosedFlag "wikilink"),
used by Home Menu after the "Software closed" dialog has been displayed
to clear the flag.

See also
[PTMSYSM:GetSoftwareClosedFlag](PTMSYSM:GetSoftwareClosedFlag "wikilink").
