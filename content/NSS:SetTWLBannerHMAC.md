+++
title = 'NSS:SetTWLBannerHMAC'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0140\] |
| 1-5        | TWL Banner SHA1-HMAC       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The input 20-byte data is copied to the NS [FIRM](FIRM "wikilink")
parameter buffer at offset 0x4B0.

This is used by [Home Menu](Home_Menu "wikilink") during TWL
title-launch to pass a HMAC-SHA1 of the banner (size varies based on the
banner version, etc.) to TWL_FIRM using the TWL and NTR SRL HMAC keys.
This is presumably used for comparing against the HMAC stored in the
[whitelist](Title_list#twl_system_titles "wikilink") for titles without
RSA.
