+++
title = 'DSP:GetSemaphoreEventHandle'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00160000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |
| 2          | Zero        |
| 3          | EventHandle |

## Semaphore

The ARM11 application signals this semaphore to indicate it has finished
writing to the [DSP Memory Region](DSP_Memory_Region "wikilink") this
audio frame.
