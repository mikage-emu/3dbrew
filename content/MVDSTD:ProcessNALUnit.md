# Request

| Index Word | Description                                                                                                                                                                             |
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00080142\]                                                                                                                                                              |
| 1          | Virtual addr for the input buffer.                                                                                                                                                      |
| 2          | Physical addr, normally the above vaddr converted to physaddr.                                                                                                                          |
| 3          | Buffer byte-size.                                                                                                                                                                       |
| 4          | Sequence-number / ID. The range normally used for this is 0x0..0x12. This value starts at 0x0, after value 0x12 is used the value that would be used for the next one is reset to zero. |
| 5          | bool flag.                                                                                                                                                                              |
| 6          | Value 0x0                                                                                                                                                                               |
| 7          | KProcess handle                                                                                                                                                                         |

# Response

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | Header code                                                                          |
| 1          | Resultcode                                                                           |
| 2          | End-address of the processed NAL-unit(internal MVD heap vaddr).                      |
| 3          | End-address of the processed NAL-unit(physaddr following the input physaddr).        |
| 4          | Total remaining unprocessed input data, if any. Buffer_end_pos=bufsize-<this value>. |

# Flag

SKATER is only known to use 0x0 here. Patching code so that the value
used by MVD here is always 1, breaks video playback under SKATER(or at
least in some cases).

When non-zero this will return 0x17007 for nal_unit_type 1, "Coded slice
of a non-IDR picture". However the output remaining_size is set to zero.
When this flag is used and the user-process doesn't abort on this
retval, the end result is a video-decoding speed-up(same speed-up as
with skipping using those NAL-units with this command, minus the errors
thrown near the start of video decoding).

# Description

This processes the specified NAL-unit. This seems to always start with
the 3-byte NAL prefix(00 00 01). Following that is the actual NAL-unit.

This is only used for H.264, not color-conversion.