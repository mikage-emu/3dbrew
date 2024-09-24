+++
title = 'FS:InitializeWithSdkVersion'
+++

# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x08610042\]          |
| 1          | Version                             |
| 2          | Must be value 32 (ProcessId Header) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
