+++
title = 'APT:SetApplicationCpuTimeLimit'
+++

# Request

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code \[0x004F0080\]                                  |
| 1          | Must be value 1(even with [9.0.0-20](9.0.0-20 "wikilink")). |
| 2          | Percentage of CPU time from 5 to 89 (passing 5 would be 5%) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the amount of syscore CPU time available to the running
application. It can range from 5% to 89%. Maximum value depends on the
[ExHeader](NCCH/Extended_Header "wikilink"). Setting a value higher than
30% does not seem to improve performance on Old 3DS, however it
definitely does on New 3DS.

This uses [pmapp](Process_Manager_Services "wikilink") command
0x000A0140.
