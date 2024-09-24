+++
title = 'HID Services'
categories = ["Services"]
+++

The maximum number of sessions that can open with all of these services
combined is 6.

# HID service "hid:USER"

| Command Header | Only available with hid:SPVR | Description                                                                             |
|----------------|------------------------------|-----------------------------------------------------------------------------------------|
| 0x00010200     | Yes                          | [CallibrateTouchScreen](HIDSPVR:CallibrateTouch "wikilink")                             |
| 0x00020000     | Yes                          | HIDSPVR:UpdateTouchConfig                                                               |
| 0x0003....     | Yes                          | ?                                                                                       |
| 0x000400C0     | Yes                          | ?                                                                                       |
| 0x00050000     | Yes                          | ?                                                                                       |
| 0x00060000     | Yes                          | ?                                                                                       |
| 0x00070140     | Yes                          | ?                                                                                       |
| 0x00080000     | Yes                          | ?                                                                                       |
| 0x00090000     | Yes                          | ?                                                                                       |
| 0x000A0000     | No                           | [GetIPCHandles](HID:GetIPCHandles "wikilink")                                           |
| 0x000B0000     | Yes                          | [StartAnalogStickCalibration](HID:StartAnalogStickCalibration "wikilink")               |
| 0x000C0040     | Yes                          | StopAnalogStickCalibration?                                                             |
| 0x000D01C0     | Yes                          | SetAnalogStickCalibrateParam?                                                           |
| 0x000E0000     | Yes                          | [GetAnalogStickCalibrateParam](HID:GetAnalogStickCalibrateParam "wikilink")             |
| 0x000F....     | Yes                          | ?                                                                                       |
| 0x0010....     | Yes                          | ?                                                                                       |
| 0x00110000     | No                           | [EnableAccelerometer](HID:EnableAccelerometer "wikilink")                               |
| 0x00120000     | No                           | [DisableAccelerometer](HID:DisableAccelerometer "wikilink")                             |
| 0x00130000     | No                           | [EnableGyroscopeLow](HID:EnableGyroscopeLow "wikilink")                                 |
| 0x00140000     | No                           | [DisableGyroscopeLow](HID:DisableGyroscopeLow "wikilink")                               |
| 0x00150000     | No                           | [GetGyroscopeLowRawToDpsCoefficient](HID:GetGyroscopeLowRawToDpsCoefficient "wikilink") |
| 0x00160000     | No                           | [GetGyroscopeLowCalibrateParam](HID:GetGyroscopeLowCalibrateParam "wikilink")           |
| 0x00170000     | No                           | [GetSoundVolume](HID:GetSoundVolume "wikilink")                                         |

# HID service "hid:SPVR"

This is used by Home Menu and other system titles. The command-handler
for this is the same as the other HID services, see above.

# HID service "hid:QTM"

This was added with [9.0.0-20](9.0.0-20 "wikilink"). HID module only
registers+handles this service when running on [New
3DS](New_3DS "wikilink"). The command-handler for this is the same as
the other HID services, see above. This cmd-handler thread only runs on
core2-3, while the other cmd-handler threads run on core0. The cores the
cmd-handler thread runs on is the only difference between hid:QTM and
the other HID services.

# HID service "hid:NFC"

This was added with [9.3.0-X](9.3.0-21 "wikilink"). NFC module uses this
with command 0x00180040, with cmdreq\[1\] = 0 / 1.

# See Also

[HID Shared Memory](HID_Shared_Memory "wikilink")

[Category:Services](Category:Services "wikilink")
