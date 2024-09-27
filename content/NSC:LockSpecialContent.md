+++
title = 'NSC:LockSpecialContent'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00010100\]                                              |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink")                   |
| 2-3        | Title ID                                                                |
| 4          | [SpecialContentType](Filesystem_services#specialcontenttype "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010040\] |
| 1          | Result code                |

# Description

If a content is not already locked, this stores the provided parameters
in the service's data structure and increments global counters for
locked SD card and game card titles based on the media type. If an
update title is available for the provided application, the appropriate
counter will be incremented as well based on its media type. This also
calls into some FS service functions in the range 0x870-0x878 with
currently unknown purpose.

If a content is already locked, error C8A12406 will be returned.

If the ns:c session is closed,
[UnlockSpecialContent](NSC:UnlockSpecialContent "wikilink") will be
called internally to clean up the locked content.

This is used by the Instruction Manual applet, and is likely related to
triggering SD/Game Card removal errors when ejecting the media the
manual is stored on.
