+++
title = 'Configuration Memory'
+++

# ARM11 Kernel Configuration Memory

| NAME                   | PROCESS VIRTUAL ADDRESS | WIDTH |
|------------------------|-------------------------|-------|
| KERNEL_?              | 0x1FF80000              | 1     |
| KERNEL_VERSIONREVISION | 0x1FF80001              | 1     |
| KERNEL_VERSIONMINOR    | 0x1FF80002              | 1     |
| KERNEL_VERSIONMAJOR    | 0x1FF80003              | 1     |
| UPDATEFLAG             | 0x1FF80004              | 4     |
| NSTID                  | 0x1FF80008              | 8     |
| SYSCOREVER             | 0x1FF80010              | 4     |
| ENVINFO                | 0x1FF80014              | 1     |
| UNITINFO               | 0x1FF80015              | 1     |
| PREV_FIRM              | 0x1FF80016              | 1     |
| KERNEL_CTRSDKVERSION   | 0x1FF80018              | 4     |
| FIRMLAUNCHFLAGS        | 0x1FF80020              | 4     |
| APPMEMTYPE             | 0x1FF80030              | 4     |
| APPMEMALLOC            | 0x1FF80040              | 4     |
| SYSMEMALLOC            | 0x1FF80044              | 4     |
| BASEMEMALLOC           | 0x1FF80048              | 4     |
| FIRM_?                | 0x1FF80060              | 1     |
| FIRM_VERSIONREVISION   | 0x1FF80061              | 1     |
| FIRM_VERSIONMINOR      | 0x1FF80062              | 1     |
| FIRM_VERSIONMAJOR      | 0x1FF80063              | 1     |
| FIRM_SYSCOREVER        | 0x1FF80064              | 4     |
| FIRM_CTRSDKVERSION     | 0x1FF80068              | 4     |

This memory page is mapped as "shared device" (it is thus uncached) and
[read-only](Memory_layout "wikilink") for ARM11 processes. This memory
and the kernel code for it only exists under NATIVE_FIRM/SAFE_MODE_FIRM.

The FIRM_\* fields are by default identical to the KERNEL_\* fields.
However, the FIRM_\* fields can be overridden via FIRM-launch
parameters, see [here](FIRM "wikilink").

Besides mem-region related fields, the data written here by the old
3DS/new 3DS kernels is identical.

# Shared Memory Page For ARM11 Processes

| NAME                                                                                                                                                                                                        | PROCESS VIRTUAL ADDRESS | WIDTH |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|-------|
| bit0 selects DATETIME_0 or DATETIME_1.                                                                                                                                                                      | 0x1FF81000              | 4     |
| RUNNING_HW (1=product, 2=devboard, 3=debugger, 4=capture, 5=?)                                                                                                                                              | 0x1FF81004              | 1     |
| MCU_HW_INFO                                                                                                                                                                                                 | 0x1FF81005              | 1     |
| DATETIME_0 {(u64)MillisecondsSinceFirstJan1900,(u64)SystemTickLastTimeThisWasUpdated,(u32)unk(set to 0xFFB0FF0 by PTM),(u32)Set to 0 by PTM,(u32)Set to 0 by PTM,(u32)set to 0 by PTM}                      | 0x1FF81020              | 32    |
| DATETIME_1                                                                                                                                                                                                  | 0x1FF81040              | 32    |
| WIFI_MACADDR                                                                                                                                                                                                | 0x1FF81060              | 6     |
| WIFI_LINKLEVEL Ranges from 0-3; 0 stands for no or a poor network connection; 3 stands for a good connection. This corresponds with the number of wifi bars displayed by [Home Menu](Home_Menu "wikilink"). | 0x1FF81066              | 1     |
| NETWORK_STATE The network state displayed by [Home Menu](Home_Menu "wikilink"). 2: Internet, 3/4/6: Local, 7: Disabled, Everything else: Enabled                                                            | 0x1FF81067              | 1     |
| 3D_SLIDERSTATE                                                                                                                                                                                              | 0x1FF81080              | 4     |
| 3D_LEDSTATE                                                                                                                                                                                                 | 0x1FF81084              | 1     |
| BATTERY_LEDSTATE                                                                                                                                                                                            | 0x1FF81085              | 1     |
| PTM sets bit0 to 1 when it has done writing MCU-originating hw info to [RUNNING_HW](#RUNNING_HW "wikilink"), [MCU_HW_INFO](#mcu_hw_info "wikilink"). There are no other bits.                               | 0x1FF81086              | 1     |
| MENUTID                                                                                                                                                                                                     | 0x1FF810A0              | 8     |
| ACTIVEMENUTID                                                                                                                                                                                               | 0x1FF810A8              | 8     |
| Signed? Headsets connected?                                                                                                                                                                                 | 0x1FF810C0              | 1     |

This memory page is normally read-only for ARM11 processes, write-access
is [determined](Memory_layout "wikilink") by the process exheader kernel
"shared page writing" flag. It is mapped as "shared device" (it is thus
uncached) in both cases.

This memory only exists under NATIVE_FIRM/SAFE_MODE_FIRM.

# ARM11 Kernel Config Fields

## 0x1FF80000 / 0x1FF80060

Unknown, this is normally value 0.

## KERNEL_VERSIONREVISION / FIRM_VERSIONREVISION

This is the version-revision for the currently running
[FIRM](FIRM "wikilink").

## KERNEL_VERSIONMINOR

This is the version-minor from ((title-version & 0x3FF) \>\> 4), for the
currently running [FIRM](FIRM "wikilink"). The values from
KERNEL_VERSIONMINOR and KERNEL_VERSIONMAJOR can be stored in
applications' [CXI](NCCH#CXI "wikilink") exheader.

## FIRM_VERSIONMINOR

This is the same as KERNEL_VERSIONMINOR. After
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink") checks
FIRM_SYSCOREVER, [AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink")
then compares FIRM_VERSIONMINOR with the NATIVE_FIRM ((title-version &
0x3FF) \>\> 4), when the latter is larger than FIRM_VERSIONMINOR
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink") will trigger a
[FIRM](FIRM "wikilink") install.

## KERNEL_VERSIONMAJOR / FIRM_VERSIONMAJOR

This is the version-major for the currently running
[FIRM](FIRM "wikilink").

The kernel initializes KERNEL_VERSIONMAJOR and SYSCOREVER with the same
constant value.

## UPDATEFLAG

Normally this flag is zero. When the ARM11 kernel is booting on
non-factory FIRM it will set this flag to 1, when bit0 from the data
which field 0x1FF80016 is loaded from is clear, if the following
[PAD](PAD "wikilink") buttons are pressed: L, R, A, Up. When this flag
is set, [NS](NS "wikilink") will launch the [System
Updater](System_Settings#System_Updater "wikilink") title instead of
[Home Menu](Home_Menu "wikilink").

## NSTID

This field contains the titleID of the first title to launch from
CTR-NAND after the [FIRM](FIRM "wikilink") system processes are loaded.
The [PM](Process_Manager_Services "wikilink") module launches this
title. If this field titleID is all-zero, the system will not attempt to
launch the title. The regular ARM11 kernel sets this to the regular
[NS](NS "wikilink") titleID, while the SAFE_MODE ARM11 kernel sets this
to the SAFE_MODE NS titleID. The factory FIRM ARM11-kernel sets this to
the NS TID from [here](Factory_Setup "wikilink").

## SYSCOREVER

This field is initialized by the ARM11 kernel, this is the programID-low
of the running FIRM. When launching [CXIs](NCCH#CXI "wikilink"), the
value stored here must match the core version field stored in the CXI
exheader. If they do not match, the
[PM](Process_Manager_Services "wikilink") module will refuse to launch
the ARM11 process.

With [factory](Factory_Setup "wikilink") NATIVE_FIRM, this is set to
0x0, even though the FIRM programID-low is 0x2. However, the factory
system-titles have core-version set to 0x2. Hence, this config-mem
SYSCOREVER field might not be used by factory system processes?

## FIRM_SYSCOREVER

Normally this is the same as SYSCOREVER. This used by
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink") for comparing
with the NATIVE_FIRM titleID-low. When the low u8 from the NATIVE_FIRM
titleID-low is larger than FIRMSYSCOREVER,
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink") will trigger
FIRM installing. When that u8 is not larger than FIRM_SYSCOREVER, and
these two values don't match,
[AM:InstallNATIVEFIRM](AM:InstallNATIVEFIRM "wikilink") will return an
error.

## ENVINFO

| Bit | Description                                               |
|-----|-----------------------------------------------------------|
| 0   | Clear for developer unit, set for retail.(See 0x1FF80015) |
| 1   | IsJtagConnected                                           |
| 2-7 | ?                                                         |

Bit1 in this field is set by the ARM11 kernel when ARM debug CP14 DSCR
bit14 is set (halting debug-mode enabled). [NS](NS "wikilink") loads the
menu TID from MENUTID when bits 1-7 of this field are clear.
[ErrDisp](ErrDisp "wikilink") will display development error info when
bit0 is clear.

## UNITINFO

| Value | Boot Env |
|-------|----------|
| 0     | Prod     |
| 1     | Dev      |
| 2     | Debugger |
| 3     | Firm     |

The ARM11 loads the value of
[CFG_UNITINFO](CONFIG_Registers#CFG_UNITINFO "wikilink") from
0x1FFFFFF0+1 during startup, which is written by the ARM9 during
ARM9\<\>ARM11 kernel sync.

When this field is zero, bit0 for ENVINFO is set for retail. When this
field is non-zero, bit0 for ENVINFO is clear for dev/debug units, and an
ARM11 kernel state flag which enables debugging is set. JTAG is only
enabled for debugger and "firm" modes (bit1).

## PREV_FIRM

| Value | Description         |
|-------|---------------------|
| 0     | Cold Boot           |
| 1     | Reset from CTR mode |
| 3     | Reset from TWL mode |
| 5     | Reset from NTR mode |
| 7     | Reset from AGB mode |

The ARM11 loads this value from 0x1FFFFFF0+2 during startup, which is
written by the ARM9 during ARM9\<\>ARM11 kernel sync.

This originates from the low 8-bits of register
[0x10010000](CONFIG "wikilink"). When bit0 is set, the ARM11 kernel will
not set the UPDATEFLAG to value 1.

## KERNEL_CTRSDKVERSION / FIRM_CTRSDKVERSION

This is the CTR-SDK version which was used to build the currently
running [FIRM](FIRM "wikilink").

## APPMEMTYPE

The value of this field determines the size for APPMEMALLOC. The retail
type(value0) is used when the type is not values 2-5. See
[Memory_layout](Memory_layout "wikilink") for the table of values for
this and the mem-region sizes.

## APPMEMALLOC

This contains the total size of the memory that can be allocated with
the APPLICATION [memory-region](SVC "wikilink"), see
[here](Memory_layout "wikilink").

## SYSMEMALLOC

Same as APPMEMALLOC except for the SYSTEM mem-region, see
[here](Memory_layout "wikilink").

## BASEMEMALLOC

Same as APPMEMALLOC except for the BASE mem-region, see
[here](Memory_layout "wikilink").

# Shared Memory Page Fields

## RUNNING_HW

Converted from [MCU_HW_INFO](#mcu_hw_info "wikilink") (names extracted
from TestMenu) by PTM, depending on whether or not the system is a
N3DS/N2DS or not:

| Value | Description        |
|-------|--------------------|
| 0     | Invalid (unknown)  |
| 1     | PRODUCT            |
| 2     | TS_BOARD           |
| 3     | KMC_DEBUGGER       |
| 4     | KMC_CAPTURE        |
| 5     | IS_DEBUGGER        |
| 6     | SNAKE_PRODUCT      |
| 7     | SNAKE_IS_DEBUGGER  |
| 8     | SNAKE_IS_CAPTURE   |
| 9     | SNAKE_KMC_DEBUGGER |

## MCU_HW_INFO

Converted to [RUNNING_HW](#running_hw "wikilink") by PTM.

| Value | Description            |
|-------|------------------------|
| 0     | PRODUCT                |
| 1     | TS_BOARD               |
| 2     | KMC_DEBUGGER           |
| 4     | KMC_CAPTURE            |
| 5     | IS_DEBUGGER            |
| 6     | IS_CAPTURE (N3DS only) |

## WIFI_MACADDR

This is the WiFi MAC address for the 3DS. This is initialized by the
[NWM](NWM_Services "wikilink") module and is loaded from the WiFi card's
EEPROM.

## 3D_SLIDERSTATE

This float contains the state of the 3D slider. The range of this float
is value 0.0f for "off", and 1.0f for max.

This is written/updated by [HID](HID_Services "wikilink") module.

## 3D_LEDSTATE

When non-zero, the 3D LED is disabled. See
[GSPGPU:SetLedForceOff](GSPGPU:SetLedForceOff "wikilink").

## BATTERY_LEDSTATE

Bit\[0\] is set when the adapter is connected. Bit\[1\] is set when the
battery is charging. Bit\[2:4\] is the value of [battery
level](PTM:GetBatteryLevel "wikilink"). If the connection bit is set but
the charging bit is clear, it means the battery is already fully charged
but still with adapter connected.

## MENUTID

Unknown, contains the menu TID (used by [NS](NS "wikilink"))

## ACTIVEMENUTID

This contains the titleID of the currently running menu launched by
[NS](NS "wikilink").

# NATIVE_FIRM Versions

See [FIRM](FIRM#NATIVE_FIRM "wikilink").
