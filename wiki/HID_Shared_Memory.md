This page describes the format of the [HID](HID_Services "wikilink")
shared memory.

The data for each of the below entries(PAD state, circle-pad,
touch-screen, etc) is originally written by the HID module at different
times per frame.

size: 0x2b0 (System-version v4.4 - [9.0.0-20](9.0.0-20 "wikilink"))

# Offset 0x0

| Relative offset | Size | Description                                                                                                                                                                                                       |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when HID module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by HID module. |
| 0x10            | 0x4  | Index in the following array which was last updated by HID module.                                                                                                                                                |
| 0x18            | 0x4  | 3D slider state as f32 (0.0f = completely off, 1.0f = max)                                                                                                                                                        |
| 0x1C            | 0x4  | Current [PAD](PAD "wikilink") state.                                                                                                                                                                              |
| 0x20            | 0x4  | Raw circle-pad info.                                                                                                                                                                                              |
| 0x28            | 0x80 | Array of 8 entries, where each entry(see below) is 0x10-bytes.                                                                                                                                                    |

HID module first updates index0, then index1, and so on. When updating
the array when the index is already 7, the index is reset to 0.

## PAD State

| Bit | Description                                               |
|-----|-----------------------------------------------------------|
| 0   | A                                                         |
| 1   | B                                                         |
| 2   | Select                                                    |
| 3   | Start                                                     |
| 4   | Right                                                     |
| 5   | Left                                                      |
| 6   | Up                                                        |
| 7   | Down                                                      |
| 8   | R                                                         |
| 9   | L                                                         |
| 10  | X                                                         |
| 11  | Y                                                         |
| 12  | Inverted value of [GPIO](GPIO_Services "wikilink") bit0.  |
| 13  | Inverted value of [GPIO](GPIO_Services "wikilink") bit14. |
| 28  | Circle pad right (X \>= 41)                               |
| 29  | Circle pad left (X \<= -41)                               |
| 30  | Circle pad up (Y \>= 41)                                  |
| 31  | Circle pad down (Y \<= -41)                               |

Bit set = button pressed, bit clear = button not pressed. Bit28-31 only
apply to the PAD fields in the array entries. Bit28-31 are set by HID
module depending on data from a codec command, these are not included
with the [PAD](PAD "wikilink") register itself. Likewise for Bit12-13,
except these are set depending on data from a GPIO command, and are
likely used with the sharedmem PAD-state field too(this was originally
implemented in an old HID module version / initial module version).

## Entry format

| Relative offset | Size | Description                                                                                                                                                                                                                                   |
|-----------------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x4  | Current PAD state.                                                                                                                                                                                                                            |
| 0x4             | 0x4  | PAD state for buttons which were pressed(bitmasks which changed from value 0 to value 1) since the last HID update.                                                                                                                           |
| 0x8             | 0x4  | PAD state for buttons which were released(bitmasks which changed from value 1 to value 0) since the last HID update.                                                                                                                          |
| 0xC             | 0x4  | This stores circle-pad info: the low s16 is the X coordinate, the high s16 is the Y coordinate. The circle-pad center is approximately 0 for these fields. The range for these fields is approximately: -0x9C(bottom/left) - 0x9C(top/right). |

# Offset 0xA8

| Relative offset | Size | Description                                                                                                                                                                                                       |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when HID module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by HID module. |
| 0x10            | 0x4  | Index in the following array which was last updated by HID module.                                                                                                                                                |
| 0x18            | 0x8  | Touch-screen entry, which contains the raw coordinate data prior to being converted to pixel coordinates.                                                                                                         |
| 0x20            | 0x40 | 8 Touch-screen entries, containing pixel coordinates.                                                                                                                                                             |

This 0x60-byte region stores state for touch-screen related info. Each
touch-screen entry is all-zero when the touch-screen is not being
touched.

HID module first updates index0, then index1, and so on. When updating
the array when the index is already 7, the index is reset to 0.

## Entry format

| Relative offset | Size | Description                                                                                                                         |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x2  | X coordinate.                                                                                                                       |
|                 |      |                                                                                                                                     |
| 0x2             | 0x2  | Y coordinate.                                                                                                                       |
|                 |      |                                                                                                                                     |
| 0x4             | 0x4  | The u8 at +0 here is 0x0 when this entry doesn't contain any actual data, value 0x1 indicates that this entry contains actual data. |

# Offset 0x108

| Relative offset | Size | Description                                                                                                                                                                                                       |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when HID module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by HID module. |
| 0x10            | 0x4  | Index in the following array which was last updated by HID module.                                                                                                                                                |
| 0x18            | 0x6  | Current accelerometer state entry, contains the raw accelerometer output data.                                                                                                                                    |
| 0x20            | 0x30 | Array containing 8 accelerometer entries. Each entry when updated contains accelerometer data converted from the above entry.                                                                                     |

The size of this region is 0x50-bytes. This contains the accelerometer
state. The data stored under these entries is loaded from
[MCUHID](MCU "wikilink") service commands.

HID module first updates index0, then index1, and so on. When updating
the array when the index is already 7, the index is reset to 0.

## Entry format

| Relative offset | Size | Description |
|-----------------|------|-------------|
| 0x0             | 0x2  | s16. X?     |
| 0x2             | 0x2  | s16. Y?     |
|                 |      |             |
| 0x4             | 0x2  | s16. Z?     |

# Offset 0x158

| Relative offset | Size | Description                                                                                                                                                                                                       |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when HID module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by HID module. |
| 0x10            | 0x4  | Index in the following array which was last updated by HID module.                                                                                                                                                |
| 0x18            | 0x6  | Current gyroscope state entry.                                                                                                                                                                                    |
| 0x20            | 0xC0 | Array containing 32 gyroscrope entries.                                                                                                                                                                           |

The size of this region is 0xE0-bytes. Initially this contains 0xFF/0x00
bytes. This contains the gyroscope state. The [I2C](I2C "wikilink")
gyroscope device is used for this.

HID module first updates index0, then index1, and so on. When updating
the array when the index is already 31, the index is reset to 0.

## Entry format

| Relative offset | Size | Description                                                                                        |
|-----------------|------|----------------------------------------------------------------------------------------------------|
| 0x0             | 0x2  | s16 X/roll(This the raw byte-swapped data from I2C, for the entry at +0x18 and the array entries). |
| 0x2             | 0x2  | Entry at +0x18: s16 Y/pitch. Array entries: s16 Z/yaw.                                             |
|                 |      |                                                                                                    |
| 0x4             | 0x2  | Entry at +0x18: s16 Z/yaw. Array entries: s16 Y/pitch, from the raw byte-swapped I2C data.         |

# Offset 0x238

| Relative offset | Size | Description                                                                                                                                                                                                       |
|-----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0             | 0x8  | [svcGetSystemTick](SVC "wikilink") tick-count output, for when HID module updates entry index0 in the below array.                                                                                                |
| 0x8             | 0x8  | Before the above tick-count field is updated, that value is copied into this field. Therefore, this contains the tick-count for the previous time that entry index0 in the below array was updated by HID module. |
| 0x10            | 0x4  | Index in the following array which was last updated by HID module.                                                                                                                                                |
| 0x18            | 0x60 | Array containing 8 entries, see below.                                                                                                                                                                            |

The size of this region is 0x78-bytes. Initially this contains 0xFF/0x00
bytes. The data stored under these entries is for the DebugPad.
[I2C](I2C "wikilink") deviceid 12 is used for this.

This doesn't have any HID service commands for enabling/disabling this.
HID module only updates this state when reading the DebugPad state from
hardware via the service command was successful. Since the DebugPad
hardware is not available on retail units, this sharedmem section is not
updated by HID module on retail units.

HID module first updates index0, then index1, and so on. When updating
the array when the index is already 7, the index is reset to 0.

## Entry format

| Relative offset | Size | Description                              |
|-----------------|------|------------------------------------------|
| 0x0             | 0x2  | Keys held                                |
| 0x2             | 0x2  | Keys just pressed                        |
| 0x4             | 0x2  | Keys just released                       |
| 0x6             | 0x1  | Left Stick X (range roughly -32 to +31)  |
| 0x7             | 0x1  | Left Stick Y (range roughly -32 to +31)  |
| 0x8             | 0x1  | Right Stick X (range roughly -16 to +15) |
| 0x9             | 0x1  | Right Stick Y (range roughly -16 to +15) |
| 0xA             | 0x2  | Padding, not written by HID module.      |

Note: there is code in hid sysmodule where holding +, -, DPAD Left, and
A will recallibrate the sticks to zero.