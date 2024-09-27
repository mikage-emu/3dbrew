+++
title = 'AM:GetDemoLaunchInfos'
+++

# Request

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code \[0x00270044\]            |
| 1          | Title Count                           |
| 2          | ((Title Count \* 8) \<\< 4) \| 0xA    |
| 3          | Title IDs                             |
| 4          | ((Title Count \* 0x10) \<\< 4) \| 0xC |
| 5          | Demo Launch Infos Output Pointer      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |