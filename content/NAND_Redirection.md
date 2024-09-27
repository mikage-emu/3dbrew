+++
title = 'NAND Redirection'
+++

NAND redirection is an umbrella term for methods used to redirect
[NAND](Flash_Filesystem "wikilink") reads and writes from the actual
system storage (in this context called sysNAND) to the SD card (or
technically, any other data source). Among other things, this allows for
accessing more recent (in some cases fully updated) system versions
(installed on the redirection source) while keeping access to
full-control exploits (through the old system installed on sysNAND).

### General Idea

The SD filesystem, being a FAT32 partition, can be shrinked and
relocated easily. As such, it is easy to make room on the SD card for a
full NAND image. By not listing the NAND image partition in the SD
card's Master Boot Record (the first 512 bytes of data on the device
which is responsible for providing information on the contained
filesystems), the NAND image does not interfere with regular SD card
access. The actual redirection needs to be done through use of a
[firmware](FIRM "wikilink") modification depending on the location of
the NAND image on the SD card. Two common approaches for this are known
as EmuNAND and RedNAND, albeit these terms are sometimes also used as
synonyms for the concept of NAND redirection in general.

### RedNAND

RedNAND places the full NAND image at byte offset 512 on the SD card.
The modified firmware hence needs to offset all NAND reads and writes by
512 bytes.

### EmuNAND

Calling the NAND image size N, EmuNAND places bytes \[512:N-1\] of the
NAND image at byte offset 512 on the SD card, and bytes \[0:511\] at
byte offset N. The modified firmware needs to make sure that NAND
reads/writes to the first 512 bytes are redirected properly, but leaves
all other accesses unmodified.

### Restrictions on New 3DS

If the sysNAND of a New 3DS console is below system version 9.6, it is
not possible to have NAND redirection work with a redirected NAND of any
system version since 9.6 without first [obtaining the relevant
keys](3DS_System_Flaws#arm9loader "wikilink"). This is because the [AES
engine keyslots](AES "wikilink") introduced for NCCH decryption with 9.6
are initialized by arm9loader using data generated from [OTP
data](OTP_Registers "wikilink") upon boot. Since OTP access is blocked
via [CFG_SYSPROT9](CONFIG_Registers#cfg_sysprot9 "wikilink") shortly
after that, it's impossible to perform this keyslot initialization at
any later time.
