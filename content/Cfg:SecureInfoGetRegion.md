+++
title = 'Cfg:SecureInfoGetRegion'
+++

# Request

| Index Word | Description                                                                                        |
|------------|----------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00020000\] (Alternate headers: "cfg:s"/"cfg:i" = 0x04060000, "cfg:i" = 0x08160000) |

# Response

| Index Word | Description                                                                                                                           |
|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                           |
| 1          | Result code                                                                                                                           |
| 2          | u8 region value loaded from [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") offset 0x100, from the already-loaded SecureInfo buffer. |

In addition to the region lock enforced by Home Menu, some 3DS software
will use this function to enforce additional region-lock in case you use
an alternate launcher. As such, region spoofing is often necessary
