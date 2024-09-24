+++
title = 'ACI:RemoveNetworkSetting'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x4030040\]    |
| 1          | Network setting ID (0x0-0x2) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Deletes connection settings in given slot.