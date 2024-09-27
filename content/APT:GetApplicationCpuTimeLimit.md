+++
title = 'APT:GetApplicationCpuTimeLimit'
+++

# Request

| Index Word | Description                                               |
|------------|-----------------------------------------------------------|
| 0          | Header code \[0x00500040\]                                |
| 1          | 1 (see [here](APT:SetApplicationCpuTimeLimit "wikilink")) |

# Response

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code                                                              |
| 1          | Result code                                                              |
| 2          | Syscore CPU time [percentage](APT:SetApplicationCpuTimeLimit "wikilink") |

# Description

This gets the amount of syscore CPU time available to the running
application, see [here](APT:SetApplicationCpuTimeLimit "wikilink").