+++
title = 'ARM11 Interrupts'
+++

## Interrupts

Interrupt priority is 0-0xF. A priority of 0xF means that the interrupt
is disabled.

# Private Interrupts

Each CPU core has 32 software interrupts that are private and belong to
that core. These interrupts are numbers 0-0x1F for each core. The
hardware interrupts are not core-specific and start at interrupt ID
0x20.

| IRQ     | Listener      | Description                                                                                                                                                                                                         |
|---------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0       |               | MPCore software-interrupt. Used by Kernel11 to sync cores in crt0.                                                                                                                                                  |
| 0x1-0x3 |               | MPCore software-interrupt. Used by Boot11 and Kernel11 to kickstart Core1/2/3, and by Kernel11 to sync cores in crt0.                                                                                               |
| 0x4     | Kernel        | MPCore software-interrupt. Used to manage the performance counter. Also used by Kernel11 during crt0 to sync up.                                                                                                    |
| 0x5     | Kernel        | MPCore software-interrupt. Does apparently nothing.                                                                                                                                                                 |
| 0x6     | Kernel        | MPCore software-interrupt. Extensively used by [KernelSetState](SVC "wikilink") (and contains most of the actual code of the latter).                                                                               |
| 0x7     | Kernel        | MPCore software-interrupt. See [KCacheMaintenanceInterruptEvent](KCacheMaintenanceInterruptEvent "wikilink")                                                                                                        |
| 0x8     | Kernel        | MPCore software-interrupt. Used for scheduling.                                                                                                                                                                     |
| 0x9     | Kernel        | MPCore software-interrupt. Used when handling exceptions that require termination of a thread or a process, and in some cases by svcSetDebugThreadContext, to store VFP registers in the thread's register storage. |
| 0xA     | Kernel        | TLB operations interrupt, see [KTLBOperationsInterruptEvent](KTLBOperationsInterruptEvent "wikilink")                                                                                                               |
| 0xB-0xE |               | MPCore software-interrupt. Not configured.                                                                                                                                                                          |
| 0xF     | dmnt/debugger | MPCore software-interrupt. Used to abstract FIQ (debug). This interrupt is never sent to core2 nor core3 on N3DS.                                                                                                   |
| 0x1D    | Kernel        | MPCore timer.                                                                                                                                                                                                       |
| 0x1E    | Kernel        | MPCore watchdog - set when the watchdog counter reaches 0 in timer mode, causes interrupt 30 to set as pending. Only set on core 1 as core 1's timer is used for everything.                                        |

# Hardware Interrupts

There are 0x60 hardware interrupts starting at 0x20 and continuing up to
0x7F. These are not private and are accessible from any core.

| IRQ                                                                 | Listener     | Description                                                                               |
|---------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------|
| 0x24                                                                | ?            | SPI bus 2 interrupt status update                                                         |
| 0x28                                                                | gsp, TwlBg   | PSC0                                                                                      |
| 0x29                                                                | gsp, TwlBg   | PSC1                                                                                      |
| 0x2A                                                                | gsp, TwlBg   | PDC0 (Top screen VBlank0, HBlank0)                                                        |
| 0x2B                                                                | gsp, TwlBg   | PDC1 (Bottom screen VBlank1, HBlank1)                                                     |
| 0x2C                                                                | gsp, TwlBg   | PPF                                                                                       |
| 0x2D                                                                | gsp, TwlBg   | P3D                                                                                       |
| 0x30-0x38                                                           | Kernel       | Old CDMA Event 0..8 (9 separate IRQ lines)                                                |
| 0x39                                                                | Kernel       | Old CDMA Faulting (eg. CCR=0, or event\>15)                                               |
| 0x3A                                                                | Kernel       | New CDMA Event 0..31 (shared IRQ line)                                                    |
| 0x3B                                                                | Kernel       | New CDMA Faulting (eg. CCR=0)                                                             |
| 0x40                                                                | nwm          | WIFI SDIO Controller @ 0x10122000                                                         |
| 0x41                                                                | nwm          | WIFI SDIO Controller IRQ pin @ 0x10122000                                                 |
| 0x42                                                                | nwm_dev?     | Debug WIFI SDIO Controller @ 0x10100000 ?                                                 |
| 0x43                                                                | nwm_dev?     | Debug WIFI SDIO Controller @ 0x10100000 ?                                                 |
| 0x44                                                                | ?            | NTRCARD (maybe?)                                                                          |
| 0x45                                                                | mvd (New3DS) | L2B_0 (First RGB-to-RGBA Converter)                                                       |
| 0x46                                                                | mvd (New3DS) | L2B_1 (Second RGB-to-RGBA Converter)                                                      |
| 0x48                                                                | camera       | Camera Bus 0 (DSi cameras)                                                                |
| 0x49                                                                | camera       | Camera Bus 1 (left-eye)                                                                   |
| 0x4A                                                                | dsp          | General interrupt from DSP, including semaphore and command/reply registers status change |
| 0x4B                                                                | camera       | Y2R Conversion Finished                                                                   |
| 0x4C                                                                | TwlBg        | LGYFB_0 Legacy GBA/NDS Video                                                              |
| 0x4D                                                                | TwlBg        | LGYFB_1 Legacy GBA/NDS Video                                                              |
| 0x4E                                                                | mvd (New3DS) | Y2R2 End Event                                                                            |
| 0x4F                                                                | mvd (New3DS) | MVD general interrupt?                                                                    |
| 0x50                                                                | pxi, TwlBg   | Sync (bit 29 from Arm9's PXI_SYNC)                                                        |
| 0x51                                                                | pxi, TwlBg   | Sync 2 (bit 30 from Arm9's PXI_SYNC)                                                      |
| 0x52                                                                | pxi, TwlBg   | Send Fifo Empty                                                                           |
| 0x53                                                                | pxi, TwlBg   | Receive Fifo Not Empty                                                                    |
| 0x54                                                                | i2c, TwlBg   | I2C Bus0 work done                                                                        |
| 0x55                                                                | i2c, TwlBg   | I2C Bus1 work done                                                                        |
| 0x56                                                                | spi, TwlBg   | SPI bus 3 interrupt status update                                                         |
| 0x57                                                                | spi, TwlBg   | SPI bus 1 interrupt status update                                                         |
| 0x58                                                                | Kernel       | PDN (wake event or SoC mode changed)                                                      |
| 0x59                                                                | TwlBg        | PDN Legacy Sleep                                                                          |
| 0x5A                                                                | mic          | General microphone interrupt (?)                                                          |
| 0x5B                                                                | \-           | [HID_PAD_CNT](HID_Registers#HID_PAD_CNT "wikilink")                                       |
| 0x5C                                                                | i2c, TwlBg   | I2C Bus2 work done                                                                        |
| 0x5F                                                                | mp           | DS WiFi registers                                                                         |
| 0x60                                                                | gpio, TwlBg  | Shell opened (GPIO1_2 falling edge)                                                       |
| 0x62                                                                | gpio, TwlBg  | Shell closed (GPIO1_2 rising edge)                                                        |
| 0x63                                                                | gpio, TwlBg  | Touch Screen pressed (GPIO1_1 falling edge)                                               |
| 0x64                                                                | gpio, TwlBg  | Headphones inserted (GPIO2_0)                                                             |
| 0x66                                                                | gpio, TwlBg  | TWL depop circuit (GPIO2_1)                                                               |
| 0x68                                                                | gpio, TwlBg  | C-stick interrupt (GPIO3_0)                                                               |
| 0x69                                                                | gpio, TwlBg  | IrDA interrupt (active-low) (GPIO3_1)                                                     |
| 0x6A                                                                | gpio, TwlBg  | Gyro interrupt (GPIO3_2)                                                                  |
| 0x6B                                                                | gpio, TwlBg  | C-stick "stop" (output) (GPIO3_3)                                                         |
| 0x6C                                                                | gpio, TwlBg  | IrDA TX-RC (output) (GPIO3_4)                                                             |
| 0x6D                                                                | gpio, TwlBg  | IrDA RXD (GPIO3_5)                                                                        |
| 0x6E                                                                | gpio, TwlBg  | NFC output1 (?) (GPIO3_6)                                                                 |
| 0x6F                                                                | gpio, TwlBg  | NFC output2 (?) (GPIO3_7)                                                                 |
| 0x70                                                                | gpio, TwlBg  | Headphones button/half-inserted (active-low) (GPIO3_8)                                    |
| 0x71                                                                | gpio, TwlBg  | MCU interrupt (GPIO3_9)                                                                   |
| 0x72                                                                | gpio, TwlBg  | NFC interrupt (?) (GPIO3_10)                                                              |
| 0x73                                                                | TwlBg        | QTM output (?) (GPIO3_11)                                                                 |
| 0x74                                                                | ?            | Gamecard related                                                                          |
| 0x75                                                                | ?            | Gamecard inserted                                                                         |
| 0x76                                                                | \-           | L2C                                                                                       |
| 0x78 to 0x7B                                                        | Kernel       | Core 0-3 Performance monitor counter (any) overflow                                       |
| 0x7A to 0x82 (PDN_MPCORE_CFG bit2 set) or 0x7C to 0x84 (bit2 clear) | Kernel       | Other PMU interrupts (line may not exist at all)                                          |

(interrupts from 0x80 and up can't be mapped in available builds of the
kernel)

There are 2 tables in the Arm11 kernel: the first has 32 \* 2(or 32 \*
4) 8-byte entries. This table is for the private interrupts that belong
to each core. The data for each interrupt can be found by doing
table_base + (core_num \* 0x100) + (intr_num \* 8). The second table is
for public hardware interrupts and the data for each interrupt can be
retrieved by doing table_base + (intr_num \* 8).

The Arm11 kernel configures interrupts the following way (it seems the
GPIO IRQ layout doesn't match released 3DS models):

`Interrupts 0x00 to 0x1F: edge-triggered, N-N`
`Interrupt 0x20: level-sensitive, 1-N`
`Interrupt 0x21: level-sensitive, 1-N`
`Interrupt 0x22: level-sensitive, 1-N`
`Interrupt 0x23: level-sensitive, 1-N`
`Interrupt 0x24: edge-triggered, 1-N`
`Interrupt 0x25: level-sensitive, 1-N`
`Interrupt 0x28: level-sensitive, 1-N`
`Interrupt 0x29: level-sensitive, 1-N`
`Interrupt 0x2a: level-sensitive, 1-N`
`Interrupt 0x2b: level-sensitive, 1-N`
`Interrupt 0x2c: level-sensitive, 1-N`
`Interrupt 0x2d: level-sensitive, 1-N`
`Interrupt 0x30: level-sensitive, 1-N`
`Interrupt 0x31: level-sensitive, 1-N`
`Interrupt 0x32: level-sensitive, 1-N`
`Interrupt 0x33: level-sensitive, 1-N`
`Interrupt 0x34: level-sensitive, 1-N`
`Interrupt 0x35: level-sensitive, 1-N`
`Interrupt 0x36: level-sensitive, 1-N`
`Interrupt 0x37: level-sensitive, 1-N`
`Interrupt 0x38: level-sensitive, 1-N`
`Interrupt 0x39: level-sensitive, 1-N`
`Interrupt 0x3a: level-sensitive, 1-N`
`Interrupt 0x3b: level-sensitive, 1-N`
`Interrupt 0x40: edge-triggered, 1-N`
`Interrupt 0x41: edge-triggered, 1-N`
`Interrupt 0x42: edge-triggered, 1-N`
`Interrupt 0x43: edge-triggered, 1-N`
`Interrupt 0x44: edge-triggered, 1-N`
`Interrupt 0x45: edge-triggered, 1-N`
`Interrupt 0x46: edge-triggered, 1-N`
`Interrupt 0x48: edge-triggered, 1-N`
`Interrupt 0x49: edge-triggered, 1-N`
`Interrupt 0x4a: edge-triggered, 1-N`
`Interrupt 0x4b: edge-triggered, 1-N`
`Interrupt 0x4c: edge-triggered, 1-N`
`Interrupt 0x4d: edge-triggered, 1-N`
`Interrupt 0x4e: edge-triggered, 1-N`
`Interrupt 0x4f: level-sensitive, 1-N`
`Interrupt 0x50: edge-triggered, 1-N`
`Interrupt 0x51: edge-triggered, 1-N`
`Interrupt 0x52: edge-triggered, 1-N`
`Interrupt 0x53: edge-triggered, 1-N`
`Interrupt 0x54: edge-triggered, 1-N`
`Interrupt 0x55: edge-triggered, 1-N`
`Interrupt 0x56: edge-triggered, 1-N`
`Interrupt 0x57: edge-triggered, 1-N`
`Interrupt 0x58: level-sensitive, 1-N`
`Interrupt 0x59: edge-triggered, 1-N`
`Interrupt 0x5a: edge-triggered, 1-N`
`Interrupt 0x5b: edge-triggered, 1-N`
`Interrupt 0x5f: edge-triggered, 1-N`
`Interrupt 0x60: edge-triggered, 1-N`
`Interrupt 0x61: edge-triggered, 1-N`
`Interrupt 0x64: edge-triggered, 1-N`
`Interrupt 0x65: edge-triggered, 1-N`
`Interrupt 0x66: edge-triggered, 1-N`
`Interrupt 0x68: edge-triggered, 1-N`
`Interrupt 0x69: edge-triggered, 1-N`
`Interrupt 0x6a: edge-triggered, 1-N`
`Interrupt 0x6b: edge-triggered, 1-N`
`Interrupt 0x6c: edge-triggered, 1-N`
`Interrupt 0x6d: edge-triggered, 1-N`
`Interrupt 0x6e: edge-triggered, 1-N`
`Interrupt 0x6f: edge-triggered, 1-N`
`Interrupt 0x70: edge-triggered, 1-N`
`Interrupt 0x71: edge-triggered, 1-N`
`Interrupt 0x72: edge-triggered, 1-N`
`Interrupt 0x73: edge-triggered, 1-N`
`Interrupt 0x74: edge-triggered, 1-N`
`Interrupt 0x75: edge-triggered, 1-N`
`Interrupt 0x76: level-sensitive, 1-N`
`Interrupt 0x77: level-sensitive, 1-N`
`Interrupt 0x78: edge-triggered, 1-N`
`Interrupt 0x79: level-sensitive, 1-N`
`Interrupt 0x7a: level-sensitive, 1-N`
`Interrupt 0x7b: level-sensitive, 1-N`
`Interrupt 0x7c: level-sensitive, 1-N`
`Interrupt 0x7d: level-sensitive, 1-N`

# InterruptData

| Offset | Type                                                     | Description                                                                                                                                                                           |
|--------|----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | [KBaseInterruptEvent](KBaseInterruptEvent "wikilink") \* | Pointer to the KBaseInterruptEvent object for this interrupt                                                                                                                          |
| 0x4    | u8                                                       | Interrupt will be disabled by the IRQ handler as soon as it is acknowledged. Ignored for FIQ: the FIQ handler always sets bit2 of [PDN_FIQ_CNT](PDN_Registers#PDN_FIQ_CNT "wikilink") |
| 0x5    | u8                                                       | Interrupt is disabled                                                                                                                                                                 |
| 0x6    | u8                                                       | Interrupt priority                                                                                                                                                                    |
| 0x7    | u8                                                       | Unused, alignment                                                                                                                                                                     |

# Interrupt Table (New3DS)

(0xFFF318F4 in 10.3)

| Offset | Type                                    | Description                                   |
|--------|-----------------------------------------|-----------------------------------------------|
| 0x0    | InterruptData\[224\]                    | Data for all hardware and software interrupts |
| 0x700  | [KObjectMutex](KObjectMutex "wikilink") | Mutex                                         |