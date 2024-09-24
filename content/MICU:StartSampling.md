+++
title = 'MICU:StartSampling'
+++

# Request

| Index Word | Description                                                                                                                                        |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00030140\]                                                                                                                         |
| 1          | u8, [Encoding](MIC_Services#Encoding "wikilink")                                                                                                   |
| 2          | u8, [SampleRate](MIC_Services#SampleRate "wikilink")                                                                                               |
| 3          | u32, base offset for audio data in sharedmem (Normally zero).                                                                                      |
| 4          | u32, size of the audio data in sharedmem (Normally sharedmem_size-4, since the base offset is normally 0 and offset-field is at sharedmem_size-4). |
| 5          | u8, loop at end of buffer (0 = stop, non-zero = loop).                                                                                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
