+++
title = 'DSP:SendData'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x00030080\]                           |
| 1          | [Register number](DSP_Registers#dsp_cmdx "wikilink") |
| 2          | Value                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
