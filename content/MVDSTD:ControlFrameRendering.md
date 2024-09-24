+++
title = 'MVDSTD:ControlFrameRendering'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x00090042\]                 |
| 1          | s8 type(bool): 0 = start, non-zero = stop. |
| 6          | Value 0x0                                  |
| 7          | KProcess handle                            |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Resultcode   |
| 2-17       | Output state |

# Description

This starts/stops rendering to the final output frame buffer specified
via the [config](MVDSTD:GetConfig "wikilink"). The latter is only used
when running MVDSTD shutdown.

This seems to return the MVD OK status value once finished(this returns
the Busy value otherwise).

This is only used for H.264, not color-conversion.