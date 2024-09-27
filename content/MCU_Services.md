+++
title = 'MCU Services'
+++

Only one session can be open per service at a time. If a session is
already open for a service, MCU module will wait for the thread handling
the session to terminate(triggered by the session being closed by the
user process), then it accepts the new session. The commands for each
service are handled by separate threads.

# MCU camera service "mcu::CAM"

| Command Header | Description                                    |
|----------------|------------------------------------------------|
| 0x00010040     | WriteCameraLedState (writes i2c register 0x2B) |
| 0x00020080     | ReadCameraLedState (reads i2c register 0x2B)   |

# MCU GPU service "mcu::GPU"

| Command Header | Description                                                                                                                                             |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010000     | GetLcdPowerState. This writes the value of I2C-MCU register 0xf bit6 to u8 cmdreply\[2\], and the value of bit5 from that register to u8 cmdreply\[3\]. |
| 0x00020080     | SetLcdPowerState. This writes the upper LCD bits of MCU register 0x22.                                                                                  |
| 0x00030000     | GetGpuLcdInterfaceState. This writes the value of I2C-MCU register 0xf bit7 to u8 cmdreply\[2\].                                                        |
| 0x00040040     | SetGpuLcdInterfaceState. This writes the lower two bits of MCU register 0x22.                                                                           |
| 0x00050040     | SetTopScreenFlicker                                                                                                                                     |
| 0x00060080     | GetTopScreenFlicker                                                                                                                                     |
| 0x00070040     | SetBottomScreenFlicker                                                                                                                                  |
| 0x00080080     | GetBottomScreenFlicker                                                                                                                                  |
| 0x00090000     | GetMcuFwVerHigh. Called by GSP module                                                                                                                   |
| 0x000A0000     | GetMcuFwVerLow. Called by GSP module                                                                                                                    |
| 0x000B0040     | Set3dLedState                                                                                                                                           |
| 0x000C0000     | Get3dLedState                                                                                                                                           |
| 0x000D0000     | GetMcuGpuEventHandle. Event handle written to TLS+0x8c. MCU notifications 24 to 29 signal this.                                                         |
| 0x000E0000     | GetMcuGpuEventReason. Writes some value to TLS+0x88. Called by GSP module                                                                               |

# MCU HID service "mcu::HID"

| Command Header | Description                                                                                |
|----------------|--------------------------------------------------------------------------------------------|
| 0x00010040     | ?                                                                                          |
| 0x00020000     | ??? test register 0x40 bit0, and writes result to IPC+8                                    |
| 0x00030040     | ??? writes IPC+4 to register 0x41                                                          |
| 0x00040000     | ??? reads register 0x44 to IPC+8                                                           |
| 0x00050080     | ??? writes IPC+4 to register 0x43 and IPC+8 to register 0x44                               |
| 0x00060000     | ReadGyroscopeValues (reads 3x s16 gyro ADC values into IPC+8)                              |
| 0x00070000     | GetRaw3DSliderPosition (u8 position in IPC+8)                                              |
| 0x00080040     | ?                                                                                          |
| 0x00090000     | ?                                                                                          |
| 0x000A0040     | ?                                                                                          |
| 0x000B0000     | ?                                                                                          |
| 0x000C0000     | GetMcuHidEventHandle. MCU notifications 11 and 12 signal this. Handle is written to IPC+12 |
| 0x000D0000     | GetMcuHidEventReason. This reads an internal flield into IPC+8 and clears it.              |
| 0x000E0000     | [GetSoundVolume](MCUHID:GetSoundVolume "wikilink")                                         |
| 0x000F0040     | EnableAccelerometerInterrupt(int enable). 1 = enable, 0 = disable accelerometer            |

While before these functions are handled, the MCU interrupt with bitmask
0x800 is enabled, then after the commands were handled the MCU interrupt
bits 0x1800 get cleared.

# MCU service "mcu::RTC"

| Command Header | Description                                                                                                                                  |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010080     | [SetRTC](MCURTC:SetRTC "wikilink")                                                                                                           |
| 0x00020000     | [GetRTC](MCURTC:GetRTC "wikilink")                                                                                                           |
| 0x00030040     | SetRTCSeconds(u8 seconds)                                                                                                                    |
| 0x00040000     | u8 GetRTCSeconds                                                                                                                             |
| 0x00050040     | SetRTCMinutes(u8 minutes)                                                                                                                    |
| 0x00060000     | u8 GetRTCMinutes                                                                                                                             |
| 0x00070040     | SetRTCHours(u8 hours)                                                                                                                        |
| 0x00080000     | u8 GetRTCHours                                                                                                                               |
| 0x00090040     | SetRTCDayOfWeek(u8 dayno)                                                                                                                    |
| 0x000A0000     | u8 GetRTCDayOfWeek                                                                                                                           |
| 0x000B0040     | SetRTCDayOfMonth(u8 day)                                                                                                                     |
| 0x000C0000     | u8 GetRTCDayOfMonth                                                                                                                          |
| 0x000D0040     | SetRTCMonth(u8 month)                                                                                                                        |
| 0x000E0000     | u8 GetRTCMonth                                                                                                                               |
| 0x000F0040     | SetRTCYear(u8 year) where year = year - 2000                                                                                                 |
| 0x00100000     | u8 GetRTCYear where year = result + 2000                                                                                                     |
| 0x00110040     | SetRTCLeapYearCounter(u8 leap)                                                                                                               |
| 0x00120000     | u8 GetRTCLeapYearCounter                                                                                                                     |
| 0x00130080     | [SetRTCAlarm](MCURTC:SetRTCAlarm "wikilink")                                                                                                 |
| 0x00140000     | [GetRTCAlarm](MCURTC:GetRTCAlarm "wikilink")                                                                                                 |
| 0x00150040     | SetRTCAlarmComponent\[0\] (u8 val)                                                                                                           |
| 0x00160000     | u8 GetRTCAlarmComponent\[0\]                                                                                                                 |
| 0x00170040     | SetRTCAlarmComponent\[1\] (u8 val)                                                                                                           |
| 0x00180000     | u8 GetRTCAlarmComponent\[1\]                                                                                                                 |
| 0x00190040     | SetRTCAlarmComponent\[2\] (u8 val)                                                                                                           |
| 0x001A0000     | u8 GetRTCAlarmComponent\[2\]                                                                                                                 |
| 0x001B0040     | SetRTCAlarmComponent\[3\] (u8 val)                                                                                                           |
| 0x001C0000     | u8 GetRTCAlarmComponent\[3\]                                                                                                                 |
| 0x001D0040     | SetRTCAlarmComponent\[4\] (u8 val)                                                                                                           |
| 0x001E0000     | u8 GetRTCAlarmComponent\[4\]                                                                                                                 |
| 0x001F0040     | SetPedometerRecordingMode(u8 mode)                                                                                                           |
| 0x00200000     | u8 GetPedometerRecordingMode                                                                                                                 |
| 0x00210080     | u8 GetStepCount (for the current day)                                                                                                        |
| 0x00220042     | ReadRegister4Fh(u32 unused_size, translation_param size=0x156 \<\< 4 \| 0xC, u8\[0x156\] ptr)                                                |
| 0x00230000     | void ??? writes 1 to register 0x4E which is not writable                                                                                     |
| 0x00240000     | Handle GetPowerEventHandle. MCU notifications 1, 8, 9, 10, 13, 14 and 15 signal this. see [Register 0x18](I2C_Registers#Device_3 "wikilink") |
| 0x00250000     | u32 GetPowerInterruptHistory                                                                                                                 |
| 0x00260000     | bool CheckRegister02hBit0                                                                                                                    |
| 0x00270000     | void ClearRegister02hBit0 (does nothing since the register is not writable)                                                                  |
| 0x00280000     | bool CheckRegister02hBit1                                                                                                                    |
| 0x00290000     | void ClearRegister02hBit1                                                                                                                    |
| 0x002A0000     | bool GetShellState. This writes the value of I2C-MCU register 0xf bit1 to u8 cmdreply\[2\].                                                  |
| 0x002B0000     | bool GetAdapterState. This writes the value of I2C-MCU register 0xf bit3 to u8 cmdreply\[2\].                                                |
| 0x002C0000     | bool GetBatteryChargeState. This writes the value of I2C-MCU register 0xf bit4 to u8 cmdreply\[2\].                                          |
| 0x002D0000     | [GetBatteryLevel](MCURTC:GetBatteryLevel "wikilink")                                                                                         |
| 0x002E0000     | u8 SetPowerModeIndicatorState (see [Register 0x29](I2C_Registers#Device_3 "wikilink"))                                                       |
| 0x002F0000     | u8 GetBatteryEmptyPatternByte0_safe™                                                                                                         |
| 0x00300040     | SetLEDBrightness(u8 brightness) (see [Register 0x28](I2C_Registers#Device_3 "wikilink"))                                                     |
| 0x00310000     | u8 GetLEDBrightness (see [Register 0x28](I2C_Registers#Device_3 "wikilink"))                                                                 |
| 0x00320000     | void PowerOff (writes 0x1 to i2c MCU device, [reg 0x20](I2C_Registers#Device_3 "wikilink"))                                                  |
| 0x00330000     | void HardwareReboot (writes 0x4 to i2c MCU device, [reg 0x20](I2C_Registers#Device_3 "wikilink"))                                            |
| 0x00340000     | ResetMcu                                                                                                                                     |
| 0x00350000     | Writes 0x10 to i2c MCU device, reg 0x20 (this bit of the register is not writable)                                                           |
| 0x00360040     | SetWatchdogTimer(u8 timer)                                                                                                                   |
| 0x00370000     | u8 GetWatchdogTimer                                                                                                                          |
| 0x00380042     | Same as [MCUHWC:GetInfoRegisters](MCUHWC:GetInfoRegisters "wikilink")                                                                        |
| 0x00390082     | SetPlayCountRegisters (u8 index, const u8 \*data, u32 size). Write to free reg bank at index+8.                                              |
| 0x003A0082     | GetPlayCountRegisters                                                                                                                        |
| 0x003B0640     | [SetInfoLEDPattern](MCURTC:SetInfoLEDPattern "wikilink")                                                                                     |
| 0x003C0040     | [SetInfoLEDPatternHeader](MCURTC:SetInfoLEDPatternHeader "wikilink")                                                                         |
| 0x003D0000     | [GetInfoLEDStatus](MCURTC:GetInfoLEDStatus "wikilink")                                                                                       |
| 0x003E0040     | WriteRegister50h(u8 value)                                                                                                                   |
| 0x003F0000     | u8 ReadRegister50h                                                                                                                           |
| 0x00400040     | WriteRegister51h(u8 value)                                                                                                                   |
| 0x00410000     | u8 ReadRegister51h                                                                                                                           |
| 0x00420040     | [SetBatteryEmptyLEDPattern](MCURTC:SetBatteryEmptyLEDPattern "wikilink")                                                                     |
| 0x00430040     | SetScreenFlickerTop(u8 flicker)                                                                                                              |
| 0x00440000     | u8 GetScreenFlickerTop                                                                                                                       |
| 0x00450040     | SetScreenFlickerBottom(u8 flicker)                                                                                                           |
| 0x00460000     | u8 GetScreenFlickerBottom                                                                                                                    |
| 0x00470080     | SetVolumeSliderBounds(u8 low, u8 high) (see [Register 0x58](I2C_Registers#Device_3 "wikilink"))                                              |
| 0x00480000     | u8 low, u8 high GetVolumeSliderBounds                                                                                                        |
| 0x00490040     | SetInterruptMask(u32 mask) (see [Register 0x18](I2C_Registers#Device_3 "wikilink"))                                                          |
| 0x004A0000     | u32 GetInterruptMask (see [Register 0x18](I2C_Registers#Device_3 "wikilink"))                                                                |
| 0x004B0000     | void ExitExclusiveInterruptMode                                                                                                              |
| 0x004C0000     | void EnterExclusiveInterruptMode                                                                                                             |
| 0x004D0000     | [ReadInterrupt](MCURTC:ReadInterrupt "wikilink") (see [Register 0x10](I2C_Registers#Device_3 "wikilink"))                                    |
| 0x004E0040     | [TriggerInterrupt](MCURTC:PublishNotifications "wikilink")                                                                                   |
| 0x004F0040     | SetMCUFirmUpdated(u32 flag) used by PTM module                                                                                               |
| 0x00500000     | u32 IsMCUFirmUpdated                                                                                                                         |
| 0x00510040     | [SetSoftwareClosedFlag](MCURTC:SetSoftwareClosedFlag "wikilink")                                                                             |
| 0x00520000     | [GetSoftwareClosedFlag](MCURTC:GetSoftwareClosedFlag "wikilink")                                                                             |
| 0x00530040     | SetLgyLcdData                                                                                                                                |
| 0x00540000     | GetLgyLcdData                                                                                                                                |
| 0x00550040     | SetLgyNativeResolutionFlag                                                                                                                   |
| 0x00560000     | GetLgyNativeResolutionFlag                                                                                                                   |
| 0x00570040     | SetLocalFriendCodeCounter                                                                                                                    |
| 0x00580000     | GetLocalFriendCodeCounter                                                                                                                    |
| 0x00590040     | [SetLegacyJumpProhibitedFlag](MCURTC:SetLegacyJumpProhibitedFlag "wikilink")                                                                 |
| 0x005A0000     | [GetLegacyJumpProhibitedFlag](MCURTC:GetLegacyJumpProhibitedFlag "wikilink")                                                                 |
| 0x005B0040     | SetUUIDClockSequence                                                                                                                         |
| 0x005C0000     | GetUUIDClockSequence                                                                                                                         |
|                |                                                                                                                                              |

# MCU sound service "mcu::SND"

| Command Header | Description                                                |
|----------------|------------------------------------------------------------|
| 0x00010080     | GetSoundVolume, writes volume slider value (0-63) to IPC+8 |
| 0x00020040     | Set...                                                     |
| 0x00030000     | GetRegister25h, cmdbuf\[2\] is 0 on n3ds                   |

# MCU wifi service "mcu::NWM"

| Command Header | Description                                                          |
|----------------|----------------------------------------------------------------------|
| 0x0001....     | SetWirelessLedState                                                  |
| 0x0002....     | GetWirelessLedState                                                  |
| 0x0003....     | Sets GPIO 0x20 high/low?                                             |
| 0x0004....     | Gets GPIO 0x20 high/low?                                             |
| 0x0005....     | SetEnableWifiGpio                                                    |
| 0x0006....     | GetEnableWifiGpio                                                    |
| 0x0007....     | [SetWirelessDisabledFlag](MCUNWM:SetWirelessDisabledFlag "wikilink") |
| 0x0008....     | [GetWirelessDisabledFlag](MCUNWM:GetWirelessDisabledFlag "wikilink") |

# MCU service "mcu::HWC"

| Command Header | Description                                                                          |
|----------------|--------------------------------------------------------------------------------------|
| 0x00010082     | [ReadRegister](MCUHWC:ReadRegister "wikilink")                                       |
| 0x00020082     | [WriteRegister](MCUHWC:WriteRegister "wikilink")                                     |
| 0x00030042     | [GetInfoRegisters](MCUHWC:GetInfoRegisters "wikilink")                               |
| 0x00040000     | [GetBatteryVoltage](MCUHWC:GetBatteryVoltage "wikilink")                             |
| 0x00050000     | [GetBatteryLevel](MCUHWC:GetBatteryLevel "wikilink")                                 |
| 0x00060040     | [SetPowerLEDPattern](MCUHWC:SetPowerLEDPattern "wikilink")                           |
| 0x00070040     | [SetWifiLEDState](MCUHWC:SetWifiLEDState "wikilink")                                 |
| 0x00080040     | [SetCameraLEDPattern](MCUHWC:SetCameraLEDPattern "wikilink")                         |
| 0x00090040     | [Set3DLEDState](MCUHWC:Set3DLEDState "wikilink")                                     |
| 0x000A0640     | This is the same as [MCURTC:SetInfoLEDPattern](MCURTC:SetInfoLEDPattern "wikilink"). |
| 0x000B0000     | [GetSoundVolume](MCUHWC:GetSoundVolume "wikilink")                                   |
| 0x000C0040     | SetTopScreenFlicker                                                                  |
| 0x000D0040     | SetBottomScreenFlicker                                                               |
| 0x000E0080     | GetBatteryTemperature                                                                |
| 0x000F00C0     | GetRtcTime                                                                           |
| 0x00100000     | GetMcuFwVerHigh                                                                      |
| 0x00110000     | GetMcuFwVerLow                                                                       |

# MCU service "mcu::PLS"

<s>Beg the sysmodule to return the datetime registers in decimal form
instead of as a Binary Coded Decimal</s>

| Command Header | Description                                        |
|----------------|----------------------------------------------------|
| 0x00010000     | GetDatetime (returns registers 0x30-0x36 in IPC+8) |
| 0x00020000     | [GetSeconds](MCUPLS:GetSeconds "wikilink")         |
| 0x00030000     | u8 GetMinutes                                      |
| 0x00040000     | u8 GetHour                                         |
| 0x00050000     | u8 GetDayOfWeek                                    |
| 0x00060000     | u8 GetDay                                          |
| 0x00070000     | u8 GetMonth                                        |
| 0x00080000     | u8 GetYear                                         |
| 0x00090000     | u16 GetTickCounter                                 |

# MCU codec service "mcu::CDC"

| Command Header | Description |
|----------------|-------------|
| 0x00010000     | ?           |

# New3DS

The Old3DS/New3DS MCU sysmodules are identical except that the MCU
firmware binary written via I2C is different. The size of that binary is
the same. The only different words in .text are for the version of that
MCU fw binary.

# MCU firmware versions

These reside in mcu sysmodule .rodata, are uploaded to MCU register 0x05
and are usually 0x4003 bytes in size (the actual firmware is 0x4000
bytes preceeded by a 3 byte magic header "`jhl`" which switches the I2C
comms into flash write mode). Switching requires register 0x05 (at
address `0xFFBA9`) to contain 0x6A ('`j`'), register 0x06 containing
0x68 ('`h`'), and writing 0x6C ('`l`') to register 0x07. The actual
flashing sequence is only signaled (code at 0x3312-0x331A) when writing
register 0x07, it's skipped otherwise. Register 0x07 gets written
anyways, just the actual signaling is skipped if the conditions aren't
met.

Before the upload could commence, external MCU interrupts are turned off
via GPIO command 0x00020080(0, 0x40000), then after the upload
completed, the sysmodule waits exactly one second for the MCU to reboot,
then turns external MCU interrupts back on via `gpio:MCU` command
0x00020080(0x40000, 0x40000).

There exists an alternate code path in very old MCU_FIRM versions where
uploading is done using register 0x3B (if register 0x0F is zero and 0x10
is 1). Register 0x3B is part of the RTC alarm registers on recent
versions of MCU.

On dev-units, the user-facing representation of this firmware version is
displayed by first subtracting 0x10 from the major field (raw register
0x00). It is these user-facing versions that are displayed in the table
below. It is unknown what bit4 (0x10) actually represents, but it is
seemingly always set.

| Title version                    | Firmware |
|----------------------------------|----------|
| New3DS v9216 (New2DSXL)          | 3.65     |
| New3DS v8192/safe v9217 (latest) | 3.56     |
| Old3DS v6145 to v8192 (latest)   | 2.37     |
| Old3DS v5122                     | 2.35     |
| Old3DS v4102                     | 2.30     |
| Old3DS v3072                     | 2.16     |
| Old3DS v2048                     | 1.52     |
| Old3DS v1026                     | 1.51     |
| Old3DS v0/safe v0                | 1.20     |
| Old3DS factory                   | 1.07     |