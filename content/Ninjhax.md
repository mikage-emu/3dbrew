+++
title = 'Ninjhax'
+++

ninjhax is an exploit by smea for the game Cubic Ninja. It was released
on November 20th, 2014. It can be used on all 3DS firmware versions from
4.0 up to and including 9.2.0-20. It was partially patched in
[9.3.0-X](9.3.0-21 "wikilink") (only system flaws used by ninjhax were
fixed, the game haxx itself was not affected).

ninjhax 2 was released on 18 July 2015, and works on any system version
from 9.0.0-X up to 11.3.0-X.

When triggered, it will boot a [3dsx-file](3DSX_Format "wikilink") from
the sdcard root called "boot.3dsx". This file is usually the [Homebrew
Launcher](Homebrew_Launcher "wikilink"), which in turn can be used to
launch other games/apps from the (micro)SD card. The launched
application will run with user privileges on the ARM11 CPU. On system
versions up to 9.2.0-20, one of the publicly known [3DS System
Flaws](3DS_System_Flaws "wikilink") can be chained to gain ARM11 kernel
privileges or to take control over the ARM9 CPU. More recent system
versions are limited to ARM11 userland homebrew until new exploits are
disclosed.

## Installation

Visit (dead link!) for instructions on how to install Ninjhax, and
[here](http://smealum.github.io/ninjhax2/) for instructions on how to
install Ninjhax 2!

## Service access

ninjhax gives developers access to a number of services. These include :

- ac:u
- <APT:U>
- boss:U
- cam:u
- cecd:u
- cfg:u
- dlp:FKCL
- dlp:SRVR
- dsp::DSP
- frd:u
- fs:USER
- gsp::Gpu
- hid:USER
- <http:C>
- ir:u
- mic:u
- ndm:u
- news:u
- nwm::UDS
- ptm:u
- pxi:dev
- soc:U
- ssl:C
- y2r:u

Additionally, Old 3DS models (3DS, 3DS XL and 2DS) are given access to
the following :

- csnd:SND

In contrast, New 3DS models (New 3DS, New 3DS XL) get access to :

- am:app
- ir:rst
- l2b2:u
- l2b:u
- mvd:STD
- nim:aoc
- y2r2:u

The normal service used for accessing [Circle Pad
Pro](Circle_Pad_Pro "wikilink") is not accessible:
[ir:USER](IR_Services "wikilink").

## System Call Access

The following [system calls](SVC "wikilink") are usable by homebrew
running using ninjhax:

```
Allowed systemcalls:    0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
                        0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
                        0x11, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19
                        0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21
                        0x22, 0x23, 0x24, 0x25, 0x27, 0x28, 0x29, 0x2A
                        0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32
                        0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B, 0x3C
                        0x3D
```

## Limitations

At the moment, ninjhax only allows users to access 64MB of RAM,
including on the New 3DS. This may change in the future.

While sound works on the New 3DS for homebrew running via ninjhax 2.0,
at the time of the exploit's original release, there was no good way to
use the DSP from homebrew, so sound output is not possible on the New
3DS using the old version. At the moment, there is also no known way of
running code on the New 3DS's extra CPU cores under ninjhax (without
installing boot9strap), though it is possible to use 80% of the system
core's time using
[<APT:SetApplicationCpuTimeLimit>](APT:SetApplicationCpuTimeLimit "wikilink")
rather than 30% as was the case on the Old 3DS.

## Capabilities

- All SD and NAND [extdata](extdata "wikilink") is accessible via the
  main extdata [archive](FS:OpenArchive "wikilink")(R/W). Note that the
  [ExtSaveData-for-BOSS](FS:OpenArchive "wikilink") archive is not
  accessible.