This is the shared-memory for ["ir:rst"](IR_Services "wikilink"). The
additional [New 3DS](New_3DS "wikilink") HID data is stored here. The
structure of this is similar to the
[HID_Shared_Memory](HID_Shared_Memory "wikilink") sections.

The total size of this shared-mem is 0x98-bytes.

# Offset 0x0

| Relative offset | Size | Description                                                                                                                                                                                                      |
|-----------------|------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when IR module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by IR module. |
| 0x10            | 0x4  | Index in the following array which was last updated by IR module.                                                                                                                                                |
| 0x18            | 0x80 | Array of 8 entries, where each entry (see below) is 0x10-bytes.                                                                                                                                                  |

IR module first updates index0, then index1, and so on. When updating
the array when the index is already 7, the index is reset to 0.

## Entry format

| Relative offset | Size | Description                                                                                                          |
|-----------------|------|----------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x4  | PAD state                                                                                                            |
| 0x4             | 0x4  | PAD state for buttons which were pressed(bitmasks which changed from value 0 to value 1) since the last HID update.  |
| 0x8             | 0x4  | PAD state for buttons which were released(bitmasks which changed from value 1 to value 0) since the last HID update. |
| 0xC             | 0x2  | C-stick X value (center is exactly 0, ranges from -0x9C to 0x9C)                                                     |
| 0xE             | 0x2  | C-stick Y value (center is exactly 0, ranges from -0x9C to 0x9C)                                                     |

## PAD State

| Bit | Description   |
|-----|---------------|
| 14  | ZL            |
| 15  | ZR            |
| 24  | C-stick right |
| 25  | C-stick left  |
| 26  | C-stick up    |
| 27  | C-stick down  |

The ir:rst PAD entries are the same format as HID ones and meant to be
ORd with them (they are complementary, there is no overlap in used
bits).