+++
title = 'GPIO Services'
categories = ["Services"]
+++

# GPIO Service Names

| Service name | Permitted GPIO bitmasks |
|--------------|-------------------------|
| gpio:CDC     | 0x48                    |
| gpio:MCU     | 0x48020                 |
| gpio:HID     | 0x4301                  |
| gpio:NWM     | 0x40020                 |
| gpio:IR      | 0xEC0                   |
| gpio:NFC     | 0x13000                 |
| gpio:QTM     | 0x20000                 |

For the mapping between GPIO bitmasks and IRQs see: [GPIO:BindInterrupt#Supported_values](GPIO:BindInterrupt#supported_values "wikilink").

The commands for these services are identical.

The input bitmask for each command is masked with the above permission bitmask, if the result is non-zero an error is occurred.

# GPIO Services

| Command Header | Description | Uses [GPIO Regs](GPIO_Registers "wikilink") |
|----|----|----|
| 0x00010040 | u32 GetRegPart1(u32 mask) | 0x10147010, 0x10147020 |
| 0x00020080 | void SetRegPart1(u32 value, u32 mask) | 0x10147010, 0x10147020 |
| 0x00030040 | u32 GetRegPart2(u32 mask) | 0x10147010, 0x10147024 |
| 0x00040080 | u32 SetRegPart2(u32 value, u32 mask) | 0x10147010, 0x10147024 |
| 0x00050040 | u32 GetInterruptMask(u32 mask) | 0x10147010, 0x10147024 |
| 0x00060080 | void SetInterruptMask(u32 value, u32 mask) | 0x10147010, 0x10147024 |
| 0x00070040 | [GetGPIOData](GPIO:GetGPIOData "wikilink") | 0x10147000, 0x10147010, 0x10147014, 0x10147020, 0x10147028 |
| 0x00080080 | [SetGPIOData](GPIO:SetGPIOData "wikilink") | 0x10147010, 0x10147014, 0x10147020, 0x10147028 |
| 0x00090082 | [BindInterrupt](GPIO:BindInterrupt "wikilink") | None |
| 0x000A0042 | [UnbindInterrupt](GPIO:UnbindInterrupt "wikilink") | None |

# GPIO Bitmask

The bitmask used by the service commands determines which bits in the GPIO registers to access. The output value from [GetGPIOData](GPIO:GetGPIOData "wikilink") uses the same format as the bitmask: the values of bits in the output field are set to the value of GPIO data when those bits are set in the input bitmask.

| Bits in the bitmask | Register | Bits from register | Handled with [GPIO:SetGPIOData](GPIO:SetGPIOData "wikilink") |
|----|----|----|----|
| 0-2 (0x7) | 0x10147000 | 0-2 | No |
| 3-4 (0x18) | 0x10147010 | 0-1 | Yes |
| 5 (0x20) | 0x10147014 | 0 | Yes |
| 6-17 (0x3FFC0) | 0x10147020 | 0-11 | Yes |
| 18 (0x40000) | 0x10147028 | 0 | Yes |

## GPIO Bits

| Bit | Bitmask | Accessible via GPIO service | Used by | Description |
|----|----|----|----|----|
| 0 | 0x1 | gpio:HID | HID-sysmodule | Used with [HID](HID_Shared_Memory "wikilink") PAD state. |
| 1 | 0x2 | None |  | Not known to be used by *anything*, with the latest system-version at least. |
| 2 | 0x4 | None |  | Not known to be used by *anything*, with the latest system-version at least. |
| 3 | 0x8 | gpio:CDC | ? | ? |
| 4 | 0x10 | None |  | Not known to be used by *anything*, with the latest system-version at least. |
| 5 | 0x20 | gpio:MCU, gpio:NWM | NWM-sysmodule, MCU-sysmodule | WiFi mode. 0 = CTR, 1 = "MP" (DS WiFi?) |
| 6 | 0x40 | gpio:CDC, gpio:IR | ? | ? |
| 7 | 0x80 | gpio:IR | Boot11 | ? |
| 8 | 0x100 | gpio:HID | HID sysmodule | Used with gyroscope |
| 9 | 0x200 | gpio:HID, gpio:IR | HID-sysmodule and IR-sysmodule | Unknown, used with ir:rst. |
| 10 | 0x400 | gpio:IR | IR-sysmodule, Boot11 | IR [send](IRU:SetIRLEDState "wikilink"). 1 = IR LED enable, 0 = IR LED disable. |
| 11 | 0x800 | gpio:IR | IR-sysmodule | IR [receive](IRU:GetIRLEDRecvState "wikilink") |
| 12 | 0x1000 | gpio:NFC | ? | ? |
| 13 | 0x2000 | gpio:NFC | ? | ? |
| 14 | 0x4000 | gpio:HID | HID-sysmodule | Used with [HID](HID_Shared_Memory "wikilink") PAD state. |
| 15 | 0x8000 | gpio:MCU | MCU-sysmodule | MCU Interrupt. |
| 16 | 0x10000 | gpio:NFC | ? | ? |
| 17 | 0x20000 | gpio:QTM | ? | ? |
| 18 | 0x40000 | gpio:MCU, gpio:NWM | NWM-sysmodule, MCU-sysmodule | Wifi enable. 1=Enabled, 0=Disabled. |

[Category:Services](Category:Services "wikilink")
