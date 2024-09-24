+++
title = 'Factory Setup'
+++

## Setup Process

[Nandrw/sys/updater.log](Nandrw/sys/updater.log "wikilink"),
[Twln/sys/log/inspect.log](Twln/sys/log/inspect.log "wikilink") and
[Twln/sys/log/product.log](Twln/sys/log/product.log "wikilink") get
written during Factory Setup. CTRAging appears to do the product.log
writing.

It is currently unknown how CTRAging is launched (Although they may use
the ntrboot on the bootrom).

## Titles

### Overview

Factory firmware is effectively a firmware that consists of NATIVE_FIRM,
TWL_FIRM and AGB_FIRM, all system modules, TestMenu and CTRAging.

On O3DS, all system titles have TID high 00040001. This may just be
convention of a very old firmware since [NATIVE_FIRM in the
factory](FIRM#NATIVE_FIRM "wikilink") is extremely old, being over 20
versions behind 1.0. TestMenu also has this TID high.

For N3DS, the title IDs match the [normal](Title_list "wikilink")
TID-highs. The entire N3DS factory firmware appears to be based on some
firmware around 8.1. The TestMenu TID high was adjusted to match the
TestMenu in the Nintendo CTR SDK as well.

Most, but apparently not all, units ship with tickets for all factory
titles in ticket.db, signed with retail keys. All factory titles for
retail units use the retail [NCCH](NCCH "wikilink") secure crypto; the
[NCCH access desc](NCCH/Extended_Header#Access_Control_Info "wikilink")
uses the retail keys for signatures, too. This suggests that at the
point the factory firmware is booted for the first time, the [one-time
programmable (OTP) region](OTP_Registers "wikilink") has already been
programmed or that the bootroms set the keys for retail by default.

### Title List

It is currently unknown whether these are all factory titles known or if
there may be more.

| TID-high | TID-low  | Description                                                            |
|----------|----------|------------------------------------------------------------------------|
| 00040000 | 0F980000 | CTRAging ("Test Program")                                              |
| 00040001 | 00000002 | NATIVE_FIRM                                                            |
| 00040001 | 00000102 | TWL_FIRM                                                               |
| 00040001 | 00000202 | AGB_FIRM                                                               |
| 00040001 | 00001802 | codec sysmodule                                                        |
| 00040001 | 00001902 | dmnt sysmodule (Debugger sysmodule, see [here](Title_list "wikilink")) |
| 00040001 | 00001A02 | dsp sysmodule                                                          |
| 00040001 | 00001B02 | gpio sysmodule                                                         |
| 00040001 | 00001D02 | hid sysmodule                                                          |
| 00040001 | 00001E02 | i2c sysmodule                                                          |
| 00040001 | 00001F02 | mcu sysmodule                                                          |
| 00040001 | 00002102 | pdn sysmodule                                                          |
| 00040001 | 00002302 | spi sysmodule                                                          |
| 00040001 | 00002702 | csnd sysmodule                                                         |
| 00040001 | 00002802 | dlp sysmodule                                                          |
| 00040001 | 00002A02 | mp sysmodule                                                           |
| 00040001 | 00002B02 | ndm sysmodule                                                          |
| 00040001 | 00002C02 | nim sysmodule                                                          |
| 00040001 | 00002D02 | nwm sysmodule                                                          |
| 00040001 | 00002E02 | socket sysmodule                                                       |
| 00040001 | 00003102 | ps module                                                              |
| 00040001 | 00003202 | friends sysmodule                                                      |
| 00040001 | 00003302 | ir sysmodule                                                           |
| 00040001 | 00003402 | boss sysmodule                                                         |
| 00040001 | 00008002 | [NS](NS "wikilink")                                                    |
| 00040001 | 00008102 | TestMenu (O3DS)                                                        |
| 00040001 | 00008A02 | [DevErrDi](ErrDisp "wikilink")                                         |
| 00040030 | 00008102 | TestMenu (some O3DS (?), all N3DS)                                     |
|          |          |                                                                        |

## TestMenu

TestMenu is similar to its [Nintendo CTR SDK
equivalent](3DS_Development_Unit_GUI#Test_Menu "wikilink").

On O3DS factory TestMenu, there are two strings that do not appear to be
part of the standard Nintendo CTR SDK TestMenu: "run TWL test app" and
"run AGB test app."

On N3DS, TestMenu appears to be identical to the Nintendo CTR SDK
TestMenu revision.

No TestMenu version is capable of launching CTRAging directly: O3DS
factory TestMenu can only launch
[DevMenu](3DS_Development_Unit_Software#Dev_Menu "wikilink") installed
on [NAND](Flash_Filesystem "wikilink"), the inserted cartridge and the
TWL/AGB test apps; N3DS factory TestMenu can only launch
[DevMenu](3DS_Development_Unit_Software#Dev_Menu "wikilink") installed
on [NAND](Flash_Filesystem "wikilink"), the inserted cartridge and
[System Settings](System_Settings "wikilink").

## CTRAging

CTRAging appears to be a title used for hardware testing at the factory.
This app also displays images, Chinese/Asian-language and text, both of
which appear to be for system assembly/testing. CTRAging includes images
for each 3DS model (which ones are included depends on the CTRAging
version): original Old3DS, Old3DS XL, 2DS, regular New3DS, and New3DS
XL. Some of the New3DS JPEG images have an EXIF last-modified timestamp
of 2013, July-September.

Full dumps of CTRAging have only been possible on the N3DS. A menu can
be pulled up by holding START. A video of the main testing routine is
available at: <https://www.youtube.com/watch?v=0nLiYZdn5Wg>

On O3DS, [ExeFS](ExeFS "wikilink"):/.code is consistently corrupted. It
is unknown whether this is coincidential or whether CTRAging is
destroyed intentionally during any part of the factory setup.

The O3DS version has *vastly* more services access compared to the N3DS
version.