+++
title = 'DSP:SendDataIsEmpty'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x00040040\]                           |
| 1          | [Register number](DSP_Registers#DSP_CMDX "wikilink") |

# Response

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code                                           |
| 1          | Result code                                           |
| 2          | Command Register Read Flag (0 = not empty, 1 = empty) |
