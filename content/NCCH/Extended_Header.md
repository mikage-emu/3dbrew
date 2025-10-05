+++
title = 'Extended Header'
+++

This page documents the format of the **NCCH Extended Header**, or **exheader** for short.

The exheader has two sections:

- The actual exheader data, containing System Control Info (SCI) and Access Control Info (ACI);
- A signed copy of NCCH HDR public key, and exheader ACI. This version of the ACI is used as limitation to the actual ACI.

## Main Structure

All values are little endian unless otherwise specified.

See also: [1](https://github.com/3DSGuy/Project_CTR/blob/20f708450b9c6e7f64eafa6c2a8eeb25a630c69a/ctrtool/exheader.h)

| Offset  | Size    | Description                              |
|---------|---------|------------------------------------------|
| `0x0`   | `0x200` | SCI                                      |
| `0x200` | `0x200` | ACI                                      |
| `0x400` | `0x100` | `AccessDesc` signature (RSA-2048-SHA256) |
| `0x500` | `0x100` | NCCH header RSA-2048 modulus             |
| `0x600` | `0x200` | ACI (for limitation of first ACI)        |

The `AccessDesc` signature covers the NCCH header modulus and second ACI. The `AccessDesc` public key is initialised by the boot ROM.

When loading the exheader, [Process9](FIRM "wikilink") compares the exheader data with the data in the `AccessDesc` (note that not everything is compared here). When these don't match, an error is returned. The Process9 code handling this validation was updated with [v6.0](6.0.0-11 "wikilink"); the only change in this function seems to be the check for the "Ideal processor" field.

## System Control Info

| Offset | Size | Description |
|----|----|----|
| `0x0` | `0x8` | Application title (default is "CtrApp") |
| `0x8` | `0x5` | Reserved |
| `0xD` | `0x1` | Flag (bit 0: `CompressExefsCode`, bit 1: `SDApplication`) |
| `0xE` | `0x2` | Remaster version |
| `0x10` | `0xC` | Text code set info |
| `0x1C` | `0x4` | Stack size |
| `0x20` | `0xC` | Read-only code set info |
| `0x2C` | `0x4` | Reserved |
| `0x30` | `0xC` | Data code set info |
| `0x3C` | `0x4` | BSS size |
| `0x40` | `0x180` (`48*8`) | Dependency [module](Title_list#00040130---system-modules "wikilink") (program ID) list |
| `0x1C0` | `0x40` | `SystemInfo` |

Most of these fields are used in [LOADER:LoadProcess](LOADER:LoadProcess "wikilink").

### Code Set Info

| Offset | Size | Description                              |
|--------|------|------------------------------------------|
| `0x0`  | `4`  | Address                                  |
| `0x4`  | `4`  | Physical region size (in page-multiples) |
| `0x8`  | `4`  | Size (in bytes)                          |

### System Info

| Offset | Size   | Description     |
|--------|--------|-----------------|
| `0x0`  | `0x8`  | `SaveData` Size |
| `0x8`  | `0x8`  | Jump ID         |
| `0x10` | `0x30` | Reserved        |

## Access Control Info

| Offset | Size | Description |
|----|----|----|
| `0x0` | `0x170` | [ARM11 local system capabilities](#arm11_local_system_capabilities "wikilink") |
| `0x170` | `0x80` | [ARM11 kernel capabilities](#arm11_kernel_capabilities "wikilink") |
| `0x1F0` | `0x10` | [ARM9 access control](#arm9_access_control "wikilink") |

### ARM11 Local System Capabilities

| Offset | Size | Description |
|----|----|----|
| `0x0` | `0x8` | Program ID |
| `0x8` | `0x4` | Core version (The Title ID low of the required [FIRM](FIRM "wikilink")) |
| `0xC` | `0x2` | [Flag1](#flag1 "wikilink") and [Flag2](#flag2 "wikilink") (both implemented starting from [8.0.0-18](8.0.0-18 "wikilink")). |
| `0xE` | `0x1` | [Flag0](#flag0 "wikilink") |
| `0xF` | `0x1` | Priority |
| `0x10` | `0x20` (`16*2`) | Resource limit descriptors. The first byte here controls the maximum allowed [`CpuTime`](PMApp:SetAppResourceLimit "wikilink"). |
| `0x30` | `0x20` | [Storage info](#storage_info "wikilink") |
| `0x50` | `0x100` (`32*8`) | [Service access control](#service_access_control "wikilink") |
| `0x150` | `0x10` (`2*8`) | Extended service access control, support for this was implemented with [9.3.0-X](9.3.0-21 "wikilink"). |
| `0x160` | `0xF` | Reserved |
| `0x16F` | `0x1` | Resource limit category. (0 = `APPLICATION`, 1 = `SYS_APPLET`, 2 = `LIB_APPLET`, 3 = `OTHER` (sysmodules running under the BASE memregion)) |

#### Flag0

| Bits  | Description        |
|-------|--------------------|
| `0-1` | Ideal processor    |
| `2-3` | Affinity mask      |
| `4-7` | Old3DS system mode |

##### Old3DS System Mode

| Value | Description                                |
|-------|--------------------------------------------|
| `0`   | `Prod` (64MB of usable application memory) |
| `1`   | `Undefined` (unusable)                     |
| `2`   | `Dev1` (96MB of usable application memory) |
| `3`   | `Dev2` (80MB of usable application memory) |
| `4`   | `Dev3` (72MB of usable application memory) |
| `5`   | `Dev4` (32MB of usable application memory) |
| `6-7` | `Undefined` Same as `Prod`?                |

In the exheader data, the ideal processor field is a bit-index, while in the `AccessDesc` the ideal processor field is a bitmask. When the bit specified by the exheader field is not set in the `AccessDesc` field, an error is returned.

    if((1 << exheaderval) & accessdescval == 0) return error

During a FIRM-launch when a `TitleInfo` structure was specified, the field at offset [0x400](FIRM#firm_launch_parameters "wikilink") in the FIRM-launch parameters is set to the SystemMode of the specified title, however in some cases other values are written there. With [8.0.0-18](8.0.0-18 "wikilink") NS will now check the output of [PTMSYSM](PTM "wikilink") command `0x040A0000`, when the output is non-zero and a certain NS state field is value-zero, the following is executed otherwise this is skipped. With that check passed on [8.0.0-18](8.0.0-18 "wikilink"), NS will then check (`Flag2 & 0xF`). When that is `value2`, the output value (used for the FIRM-launcher parameter field mentioned above) is set to `value7`. Otherwise, when that value is non-zero, the output value is set to 6.

#### Flag1

| Bits | Description |
|----|----|
| `0` | `EnableL2Cache` (Unknown what this actually does, New3DS-only presumably) |
| `1` | `cpuspeed_804MHz` (Default "cpuspeed" when not set) |
| `2-7` | Unused |

In order for the exheader to have any of the above new bits set, the `AccessDesc` must have the corresponding bit set, otherwise the invalid-exheader error is returned.

Homebrew which runs under a title which has the above `cpuspeed` flag set, runs much faster on New3DS. It's unknown how exactly the system handles these flags.

When launching titles / perhaps other things with [APT](APT "wikilink"), [NS](NS "wikilink") uses [PTMSYSM:ConfigureNew3DSCPU](PTMSYSM:ConfigureNew3DSCPU "wikilink") with data which originally came from these flags; NS does this regardless of what the running 3DS system is. However, due to a bug(?) in NS the value sent to that command is always either 0x0 or 0x3. When calculating that value, the code only ever uses the cpuspeed field, not the cache field: code to actually load and check the value of the cache field appears to be missing.

#### Flag2

| Bit   | Description        |
|-------|--------------------|
| `0-3` | New3DS system mode |
| `4-7` | Unused             |

##### New3DS System Mode

| Value | Description                                 |
|-------|---------------------------------------------|
| `0`   | `Legacy` (use Old3DS system mode)           |
| `1`   | `Prod` (124MB of usable application memory) |
| `2`   | `Dev1` (178MB of usable application memory) |
| `3`   | `Dev2` (124MB of usable application memory) |
| `4-7` | `Undefined` Same as `Prod`?                 |

When in `Legacy` mode, the actual memory layout is the same as in `New3DS Prod`, except the available application memory as reported to the application is reduced to the Old3DS size.

The exheader value for the New3DS system mode value must be ≤ to the `AccessDesc` value, otherwise the invalid-exheader error is returned.

#### Storage Info

Used in [FSReg:Register](FSReg:Register "wikilink").

| Offset | Size | Description                   |
|--------|------|-------------------------------|
| `0x0`  | `8`  | Extdata ID                    |
| `0x8`  | `8`  | System savedata IDs           |
| `0x10` | `8`  | Storage accessible unique IDs |
| `0x18` | `7`  | Filesystem access info        |
| `0x1F` | `1`  | Other attributes              |

File System Access Info:

| Bit and bitmask | Description |
|----|----|
| `0`, `0x1` | Category system application |
| `1`, `0x2` | Category hardware check |
| `2`, `0x4` | Category filesystem tool |
| `3`, `0x8` | Debug |
| `4`, `0x10` | TWL card backup |
| `5`, `0x20` | TWL NAND data |
| `6`, `0x40` | BOSS |
| `7`, `0x80` | [`sdmc:/`](FS:OpenArchive "wikilink") |
| `8`, `0x100` | Core |
| `9`, `0x200` | [`nand:/ro/`](Flash_Filesystem "wikilink") (Read Only) |
| `10`, `0x400` | [`nand:/rw/`](Flash_Filesystem "wikilink") |
| `11`, `0x800` | [`nand:/ro/`](Flash_Filesystem "wikilink") (Write Access) |
| `12`, `0x1000` | Category system settings |
| `13`, `0x2000` | Cardboard |
| `14`, `0x4000` | Export/Import IVS |
| `15`, `0x8000` | [`sdmc:/`](FS:OpenArchive "wikilink") (Write-only) |
| `16`, `0x10000` | Switch cleanup (Introduced in [3.0.0](3.0.0-5 "wikilink")?) |
| `17`, `0x20000` | Savedata move (Introduced in [5.0.0](5.0.0-11 "wikilink")) |
| `18`, `0x40000` | Shop (Introduced in [5.0.0](5.0.0-11 "wikilink")) |
| `19`, `0x80000` | Shell (Introduced in [5.0.0](5.0.0-11 "wikilink")) |
| `20`, `0x100000` | Category home menu (Introduced in [6.0.0](6.0.0-11 "wikilink")) |
| `21`, `0x200000` | Seed DB. Introduced in [9.6.0-X](9.6.0-24 "wikilink") [FIRM](FIRM "wikilink"). [Home Menu](Home_Menu "wikilink") has this bit set starting with [9.6.0-X](9.6.0-24 "wikilink"). |

#### Other Attributes

| Bit | Description                   |
|-----|-------------------------------|
| `0` | Not use ROMFS                 |
| `1` | Use Extended savedata access. |

When Bit1 is set, the "Extdata ID" and "Storage Accessable Unique IDs" regions are used to store a total of 6 "Accessible Save IDs". Introduced in [6.0.0](6.0.0-11 "wikilink").

#### Service Access Control

This is the list of [services](Services_API "wikilink") which the process is allowed to access, this is registered with the [services](Services "wikilink") manager. Each service listed in the exheader must be listed in the `AccessDesc`, otherwise the invalid exheader error is returned. The order of the services for exheader/`AccessDesc` doesn't matter. The `AccessDesc` can list services which are not in the exheader, but normally the service-access-control data for exheader/`AccessDesc` are exactly the same.

This list is submitted to [SRVPM:RegisterProcess](SRVPM:RegisterProcess "wikilink").

### ARM11 Kernel Capabilities

The kernel capability descriptors are passed to [svcCreateProcess](SVC "wikilink").

| Offset | Size            | Description |
|--------|-----------------|-------------|
| `0x0`  | `0x70` (`28*4`) | Descriptors |
| `0x70` | `0x10`          | Reserved    |

There are different descriptor types, determined by the number of leading ones in the binary value representation of bits 20-31. The different types are laid out as follows:

| Pattern of bits 20-31 | Type | Fields |
|----|----|----|
| `0b1110xxxxxxxx` | Interrupt info |  |
| `0b11110xxxxxxx` | System call mask | Bits 24-26: System call mask table index; Bits 0-23: mask |
| `0b1111110xxxxx` | Kernel release version | Bits 8-15: Major version; Bits 0-7: Minor version |
| `0b11111110xxxx` | Handle table size | Bits 0-18: size |
| `0b111111110xxx` | [Kernel flags](#arm11_kernel_flags "wikilink") | See below |
| `0b11111111100x` | Map IO/static address range | Describes a memory mapping like the 0b111111111110 descriptor, but an entire range rather than a single page is mapped. Another 0b11111111100x descriptor must follow this one to denote the (exclusive) end of the address range to map. Bit20 on the first descriptor: map read-only (otherwise RW), bit20 on the second descriptor: map static (cacheable, otherwise IO if the bit is not set) |
| `0b111111111110` | Map IO memory page | Bits 0-19: page index to map (virtual address \>\> 12; the physical address is determined per-page according to [Memory layout](Memory_layout "wikilink")); Bit 20: Map read-only (otherwise read-write) |

#### ARM11 Kernel Flags

| Bit | Description |
|----|----|
| `0` | Allow debug |
| `1` | Force debug |
| `2` | Allow non-alphanum |
| `3` | Shared page writing |
| `4` | Privilege priority |
| `5` | Allow `main()` args |
| `6` | Shared device memory |
| `7` | Runnable on sleep |
| `8-11` | Memory type (1: application, 2: system, 3: base) |
| `12` | [Special memory](Memory_layout#native_firmsafe_mode_firm_userland_memory "wikilink") |
| `13` | Process has access to CPU core 2 (New3DS only) |

### ARM9 Access Control

| Offset | Size | Description |
|----|----|----|
| `0x0` | `15` | Descriptors |
| `0xF` | `1` | ARM9 Descriptor Version. Originally this value had to be ≥ 2. Starting with [9.3.0-X](9.3.0-21 "wikilink") this value has to be either value 2 or value 3. |

Descriptors:

| Bit | Description                                                     |
|-----|-----------------------------------------------------------------|
| `0` | Mount [`nand:/`](Flash_Filesystem "wikilink")                   |
| `1` | Mount [`nand:/ro/`](Flash_Filesystem "wikilink") (Write Access) |
| `2` | Mount [`twln:/`](Flash_Filesystem "wikilink")                   |
| `3` | Mount [`wnand:/`](Flash_Filesystem "wikilink")                  |
| `4` | Mount card SPI                                                  |
| `5` | Use SDIF3                                                       |
| `6` | Create seed                                                     |
| `7` | Use card SPI                                                    |
| `8` | SD application (Not checked)                                    |
| `9` | Mount [sdmc:/](SD_Filesystem "wikilink") (Write Access)         |
