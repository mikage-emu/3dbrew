+++
title = 'AMPXI:GetTwlProgramListForReboot'
+++

# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x00500044\]          |
| 1          | Title Count                         |
| 2          | ((Title Count \* 8) \<\< 8) \| 0x4  |
| 3          | Title IDs Output Pointer            |
| 4          | ((Title Count \* 4) \<\< 8) \| 0x14 |
| 5          | Content IDs Output Pointer          |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | Number of Read Entries |

# Description

Returns a list of TWL title IDs (0003XXXXXXXXXXXX) along with the content ID of the content with content index 0 for each of them.
