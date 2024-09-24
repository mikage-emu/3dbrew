+++
title = 'NWM Shared Memory'
+++

This page is for the [NWMSOC](NWM_Services "wikilink") shared memory.
Total size is 0x22000-bytes.

Every 0x800-bytes(size is from a state field) in sharedmem is for an
entry, minus some other data near the end of sharedmem. There's a total
of 0x40 entries, with a total byte-size of 0x20000.

# Entry

| Offset | Size  | Description               |
|--------|-------|---------------------------|
| 0x0    | 0x4   | Index for the next entry. |
| 0x4    | 0x7FC | ?                         |

This also contains the entire 802.11 frame + extracted metadata.