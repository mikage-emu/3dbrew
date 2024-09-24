+++
title = 'DSP:WriteProcessPipe'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0082\] |
| 1          | Channel                    |
| 2          | Size                       |
| 3          | (Size \<\< 14) \| 0x402    |
| 4          | Buffer                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Usage Notes

One should call [DSP:SetSemaphore](DSP:SetSemaphore "wikilink") with an
argument of \`0x4000\`, then wait on the related [interrupt
event](DSP:RegisterInterruptEvents "wikilink").

## enum Channel

| Channel | Id  |
|---------|-----|
| DEBUG   | 0   |
| DMA     | 1   |
| AUDIO   | 2   |
| BINARY  | 3   |

## Buffer

When `Channel == AUDIO`,

| Offset | Size | Description      |
|--------|------|------------------|
| 0x0    | 2    | Unknown          |
| 0x2    | 2    | Change DSP state |

When `Channel == BINARY`,

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 2    | Codec enum                       |
| 0x2    | 2    | Codec Command                    |
| 0x4    | 4    | Result (0 = Success; 1 = Failed) |
| 0x8    | 24   | Command Args                     |

### Command Args