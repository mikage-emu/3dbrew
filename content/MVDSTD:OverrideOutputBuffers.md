+++
title = 'MVDSTD:OverrideOutputBuffers'
+++

# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00210100\]     |
| 1          | cur_outaddr0, linearmem vaddr. |
| 2          | cur_outaddr1, linearmem vaddr. |
| 3          | new_outaddr0, linearmem vaddr. |
| 4          | new_outaddr1, linearmem vaddr. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This can only be used when
[MVDSTD:SetupOutputBuffers](MVDSTD:SetupOutputBuffers "wikilink") was
previously used.

If a certain state flag is zero, this first writes a 0x10-byte entry
into the global table used by
[MVDSTD:SetupOutputBuffers](MVDSTD:SetupOutputBuffers "wikilink") with
entry_index=total_entries, then that flag is set.

This verifies that cur_outaddrX(converted to physaddr) matches the state
data for entry0 which originated from
[MVDSTD:SetupOutputBuffers](MVDSTD:SetupOutputBuffers "wikilink"). Then
those two addrs in state are overwritten with new_outaddrX(converted to
physaddr).
