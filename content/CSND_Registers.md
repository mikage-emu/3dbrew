+++
title = 'CSND Registers'
+++

# 0x1EC03000

?

# 0x1EC03400

The channel registers are based at 0x1EC03400(process virtual address).
There's 0x20-bytes total for each channel slot, thus the base-address
for a channel's slot is determined with: 0x1EC03400 +
(channel_index\*0x20). The below offsets are relative to these channel
register slots.

| Relative offset | Size | Description                                                                                                                                                                      |
|-----------------|------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 2    | REG_CSNDCHANX_CNT. For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module basically writes this value here: u16 (cmdword\[2\] & 0xFFFF).                                |
| 0x2             | 2    | For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module writes this value here: 0 - (cmdword\[2\]\>\>16).                                                                |
| 0x4             | 2    | For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module writes value 0 here.                                                                                             |
| 0x6             | 2    | For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module writes value 0 here.                                                                                             |
| 0x8             | 2    | For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module writes this value here: (u16)cmdword\[4\].                                                                       |
| 0xA             | 2    | For Type0 [Cmd](CSND_Shared_Memory "wikilink") 0xE, CSND module writes this value here: cmdword\[4\]\>\>16.                                                                      |
| 0xC             | 4    | This is the audio data physical address, for the main channel.                                                                                                                   |
| 0x10            | 4    | This is the audio data total byte-size. The CSND module masks the size loaded from the Type0 command-data with value 0x7FFFFFF, which is then used when writing these registers. |
| 0x14            | 4    | This is the audio data physical address, for the second channel. When this is not 0x0 stereo audio is used, otherwise mono audio is used.                                        |
| 0x18            | 4    | When CSND module handles type0 Cmd 0xE with encoding!=IMA-ADPCM, CSND module sets this to zero. This register can be initialized via CSND module type0 Cmd 0xB.                  |
| 0x1C            | 4    | CSND module writes value zero here immediately after it writes to chanslotreg+0x18.                                                                                              |

# 0x1EC03800

There are two capture unit slot located at 0x1EC03800. Each slot has
0x10 bytes.