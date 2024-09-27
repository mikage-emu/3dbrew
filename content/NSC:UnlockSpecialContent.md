+++
title = 'NSC:UnlockSpecialContent'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00020100\]                                              |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink")                   |
| 2-3        | Title ID                                                                |
| 4          | [SpecialContentType](Filesystem_services#SpecialContentType "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020040\] |
| 1          | Result code                |

# Description

If a content is currently locked and the inputs match the locked content
parameters, this decrements global counters for locked SD card and game
card titles based on the media type. If an update title is available for
the provided application, the appropriate counter will be decremented as
well based on its media type. This also calls into some FS service
functions in the range 0x870-0x878 with currently unknown purpose.

If a content is not locked or the provided parameters do not match,
error C8A12405 will be returned.

This is used by the Instruction Manual applet, and is likely related to
triggering SD/Game Card removal errors when ejecting the media the
manual is stored on.
