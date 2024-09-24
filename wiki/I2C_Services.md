# I2C Service Names

| Service names | Notes                                        | Accessible [deviceIDs](I2C_Registers "wikilink") | Service used by sysmodule             |
|---------------|----------------------------------------------|--------------------------------------------------|---------------------------------------|
| "i2c::MCU"    |                                              | 0, 3                                             | [MCU](MCU_Services "wikilink")        |
| "i2c::CAM"    |                                              | 1, 2, 4                                          | [Camera](Camera_Services "wikilink")  |
| "i2c::LCD"    |                                              | 5, 6                                             | [GSP](GSP_Services "wikilink")        |
| "i2c::DEB"    |                                              | 7, 8                                             | Unknown                               |
| "i2c::HID"    |                                              | 9, 10, 11, 12                                    | [HID](HID_Services "wikilink")        |
| "i2c::IR"     |                                              | 13, and additionally for New3DS i2c module: 17   | [IR](IR_Services "wikilink")          |
| "i2c::EEP"    |                                              | 14                                               | [Cfg](Config_Services "wikilink")     |
| "i2c::NFC"    | Only available via the New3DS i2c sysmodule. | 15                                               | New3DS [NFC](NFC_Services "wikilink") |
| "i2c::QTM"    | Only available via the New3DS i2c sysmodule. | 16                                               | New3DS [QTM](QTM_Services "wikilink") |

Each I2C service can only access certain I2C
[device(s)](I2C_Registers "wikilink"). When the specified deviceid isn't
accessible, error 0xE0A02FEA is returned.

# I2C Service

| Command Header | Available since system-version  | Description                                                                                                                                                                                                |
|----------------|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010100     |                                 | SetRegisterBits8 (u8 devid, u8 regid, u8 regdata, u8 mask)                                                                                                                                                 |
| 0x000200C0     |                                 | EnableRegisterBits8 (u8 devid, u8 regid, u8 enablemask)                                                                                                                                                    |
| 0x000300C0     |                                 | DisableRegisterBits8 (u8 devid, u8 regid, u8 disablemask)                                                                                                                                                  |
| 0x00040102     |                                 | MultiSetRegisterBits16 (u16 regid, u16 regdata, u16 mask, devcount, u8\* devidlistptr)                                                                                                                     |
| 0x000500C0     |                                 | WriteRegister8 (u8 devid, u8 regid, u8 regdata)                                                                                                                                                            |
| 0x00060080     |                                 | WriteCommand8 (u8 devid, u8 cmdid)                                                                                                                                                                         |
| 0x000700C0     |                                 | WriteRegister16 (u8 devid, u8 regid, u16 regdata)                                                                                                                                                          |
| 0x000800C2     |                                 | MultiWriteRegister16 (u16 regid, u16 regdata, devcount, u8\* devidlistptr)                                                                                                                                 |
| 0x00090080     |                                 | u8 ReadRegister8 (u8 devid, u8 regid)                                                                                                                                                                      |
| 0x000A0080     |                                 | u16 ReadRegister16 (u8 devid, u8 regid)                                                                                                                                                                    |
| 0x000B00C2     |                                 | WriteRegisterBuffer8 (u8 devid, u8 regid, buffersize, (buffersize \<\< 14) \| 0x402, u8\* bufferptr)                                                                                                       |
| 0x000C00C2     |                                 | WriteRegisterBuffer16 (u8 devid, u16 regid, buffersize, (buffersize \<\< 15) \| 0x402, u16\* bufferptr)                                                                                                    |
| 0x000D00C0     |                                 | ReadRegisterBuffer8 (u8 devid, u8 regid, buffersize, +0x180: (buffersize \<\< 14) \| 2, +0x184: u8 bufferptr)                                                                                              |
| 0x000E00C2     |                                 | WriteRegisterBuffer (u8 devid, u8 regid, unused (bufsize?), (bufsize \<\< 14) \| 0x402, void\* buffer)                                                                                                     |
| 0x000F00C0     |                                 | ReadRegisterBuffer (u8 devid, u8 regid, min(bufsize, 0x20)), +0x180: (bufsize \<\< 14) \| 2, void\* buffer                                                                                                 |
| 0x001000C0     |                                 | ReadEEPROM (u8 devid = 14, u16 blockid, min(bufsize \>\> 1, 0x10)), +0x180: (bufsize \<\< 15) \| 2, u16\* buffer                                                                                           |
| 0x001100C2     |                                 | WriteRegisterBuffer(u8 devid, u8 regid, buffersize, u8 \*buff)                                                                                                                                             |
| 0x001200C2     |                                 | ReadRegisterBuffer(u8 devid, u8 regid, buffersize, u8 \*buff)                                                                                                                                              |
| 0x00130040     | [8.0.0-18](8.0.0-18 "wikilink") | ReadDeviceRaw8(u8 devid) Writes the output read u8 I2C data to cmdreply\[2\]. After successfully selecting the I2C device, it writes 0xE1 to CNT then loads the output u8 I2C data from the DATA register. |
| 0x00140082     | [8.0.0-18](8.0.0-18 "wikilink") | WriteDeviceRaw(u8 devid, u32 buffersize, (buffersize \<\< 14) \| 0x402, bufferptr) This is basically the write-data version of command 0x00150080.                                                         |
| 0x00150080     | [8.0.0-18](8.0.0-18 "wikilink") | ReadDeviceRaw(u8 devid, u32 buffersize, +0x180: (buffersize \<\< 14) \| 2, +0x184: bufferptr) This is the \>1-byte version of command 0x00130040, except value 0xF0 is used for CNT instead of 0xE1.       |

Commands 0x00130040..0x00150080 are only usable with the New3DS i2c
module: on Old3DS the actual command-handler function for each of these
commands just return an error. Commands 0x00140082 and 0x00150080 are
used by [NFC](NFC_Services "wikilink") module. Command 0x00150080 is
also used for reading ZL, ZR, and C-stick data by [IR
Services](IR_Services "wikilink").

[Category:Services](Category:Services "wikilink")