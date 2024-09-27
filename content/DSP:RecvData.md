+++
title = 'DSP:RecvData'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x00010040\]                           |
| 1          | [Register number](DSP_Registers#dsp_repx "wikilink") |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | u16, Register value |
