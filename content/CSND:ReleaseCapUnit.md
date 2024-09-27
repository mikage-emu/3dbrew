+++
title = 'CSND:ReleaseCapUnit'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080040\] |
| 1          | Capture unit               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This function tries to release the capture device given in cmdbuf\[1\].
