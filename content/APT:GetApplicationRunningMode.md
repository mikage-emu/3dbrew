+++
title = 'APT:GetApplicationRunningMode'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x01030000\] |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | u8, Application Running Mode |

# Description

This outputs a value based on whether the system is running using New
3DS CPU speed and whether the application is registered with APT (see
[<APT:Enable>](APT:Enable "wikilink")).

Using New 3DS CPU speed (i.e. modes 2 and 4) seems to be known as
running as an "ext application" (probably for "extended application").

## Application Running Mode

| Value | Description                                |
|-------|--------------------------------------------|
| 0     | No application is running                  |
| 1     | Old 3DS CPU speed, registered with APT     |
| 2     | New 3DS CPU speed, registered with APT     |
| 3     | Old 3DS CPU speed, not registered with APT |
| 4     | New 3DS CPU speed, not registered with APT |