+++
title = 'DSP:RecvDataIsReady'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x00020040\]                           |
| 1          | [Register number](DSP_Registers#DSP_REPX "wikilink") |

# Response

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code                                           |
| 1          | Result code                                           |
| 2          | Reply Register Update Flag (0 = not ready, 1 = ready) |
