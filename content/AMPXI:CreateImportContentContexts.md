+++
title = 'AMPXI:CreateImportContentContexts'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x00570042\]                 |
| 1          | Content Index Count                        |
| 2          | ((Content Index Count \* 2) \<\< 8) \| 0x6 |
| 3          | u16\*, Content Indices Input Buffer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |