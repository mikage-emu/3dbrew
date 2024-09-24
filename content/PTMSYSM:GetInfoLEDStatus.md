+++
title = 'PTMSYSM:GetInfoLEDStatus'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08030000\] |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8 output notification LED status |

# Description

This is a wrapper for
[MCURTC:GetInfoLEDStatus](MCURTC:GetInfoLEDStatus "wikilink").