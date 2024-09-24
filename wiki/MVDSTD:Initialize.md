# Request

| Index Word | Description                                                                                                                                       |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00010082\]                                                                                                                        |
| 1          | Buffer address                                                                                                                                    |
| 2          | Buffer size, for H.264 this is normally from [MVDSTD:CalculateWorkBufSize](MVDSTD:CalculateWorkBufSize "wikilink"). For "MJPEG", this is value 1. |
| 3          | Value 0x0                                                                                                                                         |
| 4          | KProcess handle                                                                                                                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This does MVDSTD initialization. The specified buffer is the H.264
work-buffer, for "MJPEG" the size is 0x1 since it's not used for that.
The user process doesn't use the data stored in this work-buffer at all.
The address(+size) must be within the 0x30000000 LINEAR-memory area.