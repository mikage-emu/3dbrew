+++
title = 'DSP:LoadComponent'
+++

# Request

| Index Word | Description                                                                             |
|------------|-----------------------------------------------------------------------------------------|
| 0          | Header code \[0x001100C2\]                                                              |
| 1          | Size                                                                                    |
| 2          | Program Mask (observed 0x00FF) (Program ram blocks the component should be loaded into) |
| 3          | Data Mask (observed 0x00FF) (Data ram blocks the component should be loaded into)       |
| 4          | (Size \<\< 4) \| 0xA                                                                    |
| 5          | Component Buffer                                                                        |

# Response

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x00110082\]                        |
| 1          | Result code                                       |
| 2          | u8, Component Loaded (0 = not loaded, 1 = loaded) |
| 3          | (Size \<\< 4) \| 0xA                              |
| 4          | Component Buffer                                  |

# Description

This requires RSA-signed DSP firmware specified via the input buffer for
this command, the firmware data is eventually written to
DSPmem+0(0x1FF00000). This has been observed to call a subroutine which
calls a string named "synthe".