+++
title = 'Hardware Calibration'
+++

# File format

The file consists out of a 0x200 big header (though the actual header is
only 0x30 bytes, the rest is zerofilled), plus data whose size is
indicated in the header.

## Header

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x0</td>
<td>0x4</td>
<td>Magic "CCAL"</td>
</tr>
<tr class="even">
<td>0x4</td>
<td>0x4</td>
<td>Version</td>
</tr>
<tr class="odd">
<td>0x8</td>
<td>0x4</td>
<td>Data size, always 0x7D0</td>
</tr>
<tr class="even">
<td>0xC</td>
<td>0x1</td>
<td>Model version (?)</td>
</tr>
<tr class="odd">
<td>0xD</td>
<td>0x1</td>
<td>CAL revision (incremented each time the CAL file is
updated)</td>
</tr>
<tr class="even">
<td>0xE</td>
<td>0x2</td>
<td><a href="#aging_masks" title="wikilink">Bitmask of successful
Aging tests</a></td>
</tr>
<tr class="odd">
<td>0x10</td>
<td>0x20</td>
<td>Signature of the data section.</p>
<p>HMACSHA256 is used always except in the below cases where SHA256 is
used:</p>
<p><code> - devunits</code><br />
<code> - PARTNER-DEBUGGER</code><br />
<code> - PARTNER-CAPTURE</code><br />
<code> - the SNAKE counterparts of the above</code><br />
<code> - SNAKE-IS-DEBUGGER</code></td>
</tr>
<tr class="even">
<td>0x30</td>
<td>0x1D0</td>
<td>Zerofilled, padding for the 512byte block size</td>
</tr>
</tbody>
</table>

## Aging masks

| Bit | Description                                       |
|-----|---------------------------------------------------|
| 0   | FCRAM                                             |
| 1   | LCD "flicker"/contrast (always successful)        |
| 2   | Camera                                            |
| 3   | Touch panel (always successful)                   |
| 4   | Circle pad (analog stick)                         |
| 5   | Codec                                             |
| 6   | Gyroscope                                         |
| 7   | RTC                                               |
| 8   | Accelerometer                                     |
| 9   | Surround                                          |
| A   | Adaptive BackLight (ABL)                          |
| B   | 3D screen (ULCD)                                  |
| C   | Backlight PWM                                     |
| D   | Analog stick A (???)                              |
| E   | Camera extensions                                 |
| F   | Adaptive BackLight (ABL) in legacy (DSi/GBA) mode |

## Data blocks

| Offset | Size  | [ConfigInfoBlk](Config_Savegame#configuration_blocks "wikilink") | Since version | Description                                                        |
|--------|-------|------------------------------------------------------------------|---------------|--------------------------------------------------------------------|
| 0x00   | 0x10  | 0x00040000                                                       |               | [Touch panel](#touch "wikilink")                                   |
| 0x14   | 0x08  | ???                                                              |               | [Circle pad](#circle_pad "wikilink")                               |
| 0x20   | 2\*   | 0x00050000                                                       |               | [Display panel contrast](#screen_flicker "wikilink")               |
| 0x24   | 1\*   | 0x00010000                                                       |               | [RTC](#rtc "wikilink")                                             |
| 0x28   | 1\*   | 0x00030000                                                       |               | DSPRAM related                                                     |
| 0x30   | 0x8A  | ???                                                              |               | [Camera position](#camera_position "wikilink")                     |
| 0xBC   | 0x12  | 0x00040002                                                       |               | [Gyroscope](#gyro "wikilink")                                      |
| 0xD0   | 0xC   | 0x00040003                                                       |               | [Accelerometer](#accel "wikilink")                                 |
| 0xE0   | 0x134 | 0x00020000                                                       | ???           | [Codec](#cdc "wikilink")                                           |
| 0x218  | 0x06  | 0x00050007                                                       | 0x10          | [Programmable Infrared Transmitter (PIT)](#pit "wikilink")         |
| 0x220  | 0x214 | 0x00070000                                                       | 0x7           | [3D filters](#3d_filters "wikilink")                               |
| 0x440  | 0x20  | 0x00050003                                                       | 0x8           | [Adaptive BackLight / Power saving mode](#abl "wikilink")          |
| 0x470  | 0x20  | 0x00050005                                                       | 0xA           | ???                                                                |
| 0x4A0  | 0x38  | 0x00050002                                                       | 0xB           | [Backlight PWM](#blpwm "wikilink")                                 |
| 0x4E0  | 0x18  | ???                                                              |               | [Circle pad extra](#circle_pad_extra "wikilink")                   |
| 0x500  | 0xC   | ???                                                              |               | ???                                                                |
| 0x510  | 0x20  | 0x00050004                                                       | 0x8           | ???                                                                |
| 0x540  | 0x08  | 0x00120000                                                       | 0x7           | [MCU](#mcu "wikilink")                                             |
| 0x550  | 0x02  | 0x00050006                                                       | 0x9           | [3D screen (ULCD) delay](#ulcd_delay "wikilink")                   |
| 0x560  | 0x08  | 0x00070002                                                       | 0xD           | [Microphone echo cancellation](#microphone_echo_cancel "wikilink") |
| 0x570  | 0x10C | 0x00050008                                                       | 0xF           | [Power saving mode (ABL) extra](#abl_extra "wikilink")             |
| 0x680  | 0x08  | 0x00040004                                                       | 0xF           | [CStick (Right stick)](#cstick "wikilink")                         |
| 0x690  | 0x18  | 0x00180001                                                       | 0x12          | [Quad Tracking Module (QTM)](#qtm "wikilink")                      |

# Data block formats

## Touch

Used for mapping touch ADC values to display pixel co-ordinates.

<code> \[4096, 4096\] --\> \[320, 240\]

\[RawX, RawY\] --\> \[PointX, PointY\] </code>

Usually \[PointX0, PointY0\] is placed around 25% from the top-left
corner, and the same for \[PointX1, PointY1\] except 25% from the
bottom-right corner. This offsetting is needed because the touch film
starts to distort outside of that rectangle, which would skew the touch
results near the center of the screen.

| Offset | Declaration |
|--------|-------------|
| 0x00   | s16 RawX0   |
| 0x02   | s16 RawY0   |
| 0x04   | s16 PointX0 |
| 0x06   | s16 PointY0 |
| 0x08   | s16 RawX1   |
| 0x0A   | s16 RawY1   |
| 0x0C   | s16 PointX1 |
| 0x0E   | s16 PointY1 |

## Circle pad

Contains the centering position of the circle pad. For other circle pad
settings, see [circle pad extra](#circle_pad_extra "wikilink").

| Offset | Declaration | Description                                            |
|--------|-------------|--------------------------------------------------------|
| 0x00   | s16 CenterX | Raw analog values corresponding to zero input position |
| 0x02   | s16 CenterY |                                                        |

## Screen flicker

These values are written to MCU register 0x03 and 0x04 respectively.
They both set the display contrast voltage.

| Offset | Declaration      | Description                      |
|--------|------------------|----------------------------------|
| 0      | u8 FlickerTop    | Contrast voltage                 |
| 1      | u8 FlickerBottom |                                  |
| 2\*    | Inline checksum  | Checksum low byte, NOT THIS\[0\] |
| 3\*    |                  | Checksum high byte, THIS\[1\]    |

## RTC

| Offset | Declaration          | Description                  |
|--------|----------------------|------------------------------|
| 0      | u8 CompensationValue | (???)                        |
| 1\*    |                      | Checksum byte, NOT THIS\[0\] |

## Camera position

| Offset | Declaration              |
|--------|--------------------------|
| 0x00   | u32 flags                |
| 0x04   | float scale              |
| 0x08   | float RotationZ          |
| 0x0C   | float TranslationX       |
| 0x10   | float TranslationY       |
| 0x14   | float RotationX          |
| 0x18   | float RotationY          |
| 0x1C   | float ViewAngleRight     |
| 0x20   | float ViewAngleLeft      |
| 0x24   | float ChartDistance(???) |
| 0x28   | float CameraDistance     |
| 0x2C   | s16 ImageWidth           |
| 0x2E   | s16 ImageHeight          |
| 0x30   | u8 reserved\[0x10\]      |
| 0x40   | u8 ???\[0x40\]           |
| 0x80   | s16 aeBaseTarget(???)    |
| 0x82   | s16 kRL                  |
| 0x84   | s16 kGL                  |
| 0x86   | s16 kBL                  |
| 0x88   | s16 ccmPosition          |

## Gyro

| Offset | Declaration |
|--------|-------------|
| 0x00   | s16 ZeroX   |
| 0x02   | s16 PlusX   |
| 0x04   | s16 MinusX  |
| 0x06   | s16 ZeroY   |
| 0x08   | s16 PlusY   |
| 0x0A   | s16 MinusY  |
| 0x0C   | s16 ZeroZ   |
| 0x0E   | s16 PlusZ   |
| 0x10   | s16 MinusZ  |

## Accel

| Offset | Declaration |
|--------|-------------|
| 0x00   | s16 OffsetX |
| 0x02   | s16 ScaleX  |
| 0x04   | s16 OffsetY |
| 0x06   | s16 ScaleY  |
| 0x08   | s16 OffsetZ |
| 0x0A   | s16 ScaleZ  |

## CDC

| Offset | Declaration                         | Description                                    |
|--------|-------------------------------------|------------------------------------------------|
| 0x00   | u8 DriverGainHP                     | Headphone gain                                 |
| 0x01   | u8 DriverGainSP                     | Speaker gain                                   |
| 0x02   | u8 AnalogVolumeHP                   |                                                |
| 0x03   | u8 AnalogVolumeSP                   |                                                |
| 0x04   | s8 ShutterVolume\[2\]               |                                                |
| 0x06   | u8 MicrophoneBias                   | Capacitive microphone bias voltage             |
| 0x07   | u8 QuickCharge                      | (???)                                          |
| 0x08   | u8 PGA_GAIN                         | ??? (microphone gain)                          |
| 0x09   | u8 reserved\[3\]                    |                                                |
| 0x0C   | s16 FilterHP32\[3\*5\]              | Headphone filter for 32728.49Hz sampling rate  |
| 0x2A   | s16 FilterHP47\[3\*5\]              | Headphone filter for 47605Hz sampling rate     |
| 0x48   | s16 FilterSP32\[3\*5\]              | Speaker filter for 32728.49Hz sampling rate    |
| 0x66   | s16 FilterSP47\[3\*5\]              | Speaker filter for 47605Hz sampling rate       |
| 0x84   | s16 FilterMic32\[(1+2)+((1+4)\*5)\] | Microphone filter for 32728.49Hz sampling rate |
| 0xBC   | s16 FilterMic47\[(1+2)+((1+4)\*5)\] | Microphone filter for 47605Hz sampling rate    |
| 0xF4   | s16 FilterFree\[(1+2)+((1+4)\*5)\]  | Unknown                                        |
| 0x12C  | u8 AnalogInterval                   |                                                |
| 0x12D  | u8 AnalogStabilize                  |                                                |
| 0x12E  | u8 AnalogPrecharge                  |                                                |
| 0x12F  | u8 AnalogSense                      |                                                |
| 0x130  | u8 AnalogDebounce                   |                                                |
| 0x131  | u8 Analog_XP_Pullup                 |                                                |
| 0x132  | u8 YM_Driver                        | ??? (circle-pad or touch panel related?)       |
| 0x133  | u8 reserved                         |                                                |

## PIT

| Offset | Declaration       |
|--------|-------------------|
| 0x00   | u16 VisibleFactor |
| 0x02   | u16 IRFactor      |

## 3D filters

| Offset | Declaration                |
|--------|----------------------------|
| 0x00   | u16 SpecialFilter\[0x100\] |
| 0x200  | u32 IIRSurroundFilter\[5\] |

## ABL

| Offset | Declaration       |
|--------|-------------------|
| 0x00   | u32 DitherPattern |
| 0x04   | s16 StartX        |
| 0x06   | s16 StartY        |
| 0x08   | u16 SizeX         |
| 0x0A   | u16 SizeY         |
| 0x0C   | s16 GTH_Ratio     |
| 0x0E   | u8 DitherMode     |
| 0x0F   | u8 MinRS          |
| 0x10   | u8 MaxRS          |
| 0x11   | u8 MinGTH         |
| 0x12   | u8 MinMax (???)   |
| 0x13   | u8 ExMax (???)    |
| 0x14   | u8 inertia        |
| 0x15   | u8 LutListRS\[9\] |
| 0x1E   | u8 reserved\[2\]  |

## BLPWM

| Offset | Declaration                 |
|--------|-----------------------------|
| 0x00   | float coefficient\[3\]\[3\] |
| 0x24   | u8 NumLevels                |
| 0x25   | u8 padding                  |
| 0x26   | u16 brightnesses\[7\];      |
| 0x34   | u16 BaseDivisor             |
| 0x36   | u16 MinimumBrightnessHw     |

## Circle pad extra

| Offset | Declaration             |
|--------|-------------------------|
| 0x00   | float ScaleX            |
| 0x04   | float ScaleY            |
| 0x08   | s16 MaxX                |
| 0x0A   | s16 MinX                |
| 0x0C   | s16 MaxY                |
| 0x0E   | s16 MinY                |
| 0x10   | s16 type                |
| 0x12   | u8 unknown_padding\[6\] |

## MCU

Somewhat misleading, these values are actually used for clamping the
MCU's raw slider readings to comprehensible values.

| Offset | Declaration         | Description                                                                     |
|--------|---------------------|---------------------------------------------------------------------------------|
| 0x00   | s16 SVR2_Min        | Raw 3D volume slider values \<= this map to 3D slider value 0.0                 |
| 0x02   | s16 SVR2_Max        | Raw 3D volume slider values \>= this map to 3D slider value 1.0                 |
| 0x04   | s16 VolumeSliderMin | Written to MCU reg 0x58. Volume slider values \<= this map to volume value 0x00 |
| 0x06   | s16 VolumeSliderMax | Written to MCU reg 0x59. Volume slider values \>= this map to volume value 0x3F |

## ULCD delay

There is a delay between switching the parallax barrier, and adjusting
the backlight. These delay values determine how many VBlank events to
wait on before switching the backlight curves to the appropriate mode.

This is needed only to prevent epillepsy from analog jitter causing
unwanted mode switches, and both values are usually always set to 1 or
2.

| Offset | Declaration |
|--------|-------------|
| 0x00   | u8 To2D     |
| 0x01   | u8 To3D     |

## Microphone echo cancel

| Offset | Declaration    |
|--------|----------------|
| 0x00   | s8 params\[8\] |

## ABL extra

| Offset | Declaration        |
|--------|--------------------|
| 0x00   | u8 MaxInertia      |
| 0x01   | u8 pad             |
| 0x02   | u16 PWM_CNT_EX     |
| 0x04   | u32 Histogram1     |
| 0x08   | u32 Histogram2     |
| 0x0C   | u32 adjust\[0x40\] |

## CStick

| Offset | Declaration            |
|--------|------------------------|
| 0x00   | u8 ThinningCountX(???) |
| 0x01   | u8 ThinningCountY(???) |
| 0x02   | u16 reserved\[3\]      |

## QTM

| Offset | Declaration               |
|--------|---------------------------|
| 0x00   | float DivisorAtZero (???) |
| 0x04   | float TranslationX        |
| 0x08   | float TranslationY        |
| 0x0C   | float RotationZ           |
| 0x10   | float HorizontalAngle     |
| 0x14   | float OptimalDistance     |

# Reading

If 0x1FF81006 is 3 or 4 or 7 or 8 or 9 then the callibration data is
read from the EEPROM using the `i2c:EEP` service command 0x001000C0,
using offset 0x000 for HWCAL0, and offset 0x800 for HWCAL1. Otherwise
attempt is made to read `CTRNAND:/ro/sys/HWCAL(0|1).dat` instead.
