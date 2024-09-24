+++
title = 'APT:SetScreenCapturePostPermission'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x00550040\]                 |
| 1          | Permission to post screenshots to Miiverse |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets whether or not screenshots may be posted on Miiverse.

| Value | Description                                |
|-------|--------------------------------------------|
| 1     | the user has no explicit setting           |
| 2     | screenshot posting to Miiverse is enabled  |
| 3     | screenshot posting to Miiverse is disabled |