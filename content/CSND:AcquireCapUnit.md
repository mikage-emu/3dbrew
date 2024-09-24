+++
title = 'CSND:AcquireCapUnit'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070000\] |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Capture unit |

# Description

This function tries to acquire one capture device (max: 2). Returns
index of which capture device was acquired.
