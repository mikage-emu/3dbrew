+++
title = 'NSS:SetApplicationCpuTimeLimit'
+++

# Request

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code \[0x001200C0\]                                  |
| 1          | Must be 1 (even with [9.0.0-20](9.0.0-20 "wikilink"))       |
| 2          | Percentage of CPU time from 0 to 80 (passing 0 would be 0%) |
| 3          | u8, Lock (0 = don't lock, 1 = lock)                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the amount of syscore CPU time available to the running
application. It can range from 0% to 80%.

When lock is set to 1,
[<APT:SetApplicationCpuTimeLimit>](APT:SetApplicationCpuTimeLimit "wikilink")
is prevented from changing this value.
