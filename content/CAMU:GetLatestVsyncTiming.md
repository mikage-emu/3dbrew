+++
title = 'CAMU:GetLatestVsyncTiming'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x002A0080\]              |
| 1          | [Port](Camera_Services#Port "wikilink") |
| 2          | Number of Past Timings                  |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | ((PastTimings \* 8) \<\< 14) \| 2 |
| 1          | s64\* TimingsOutput               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
