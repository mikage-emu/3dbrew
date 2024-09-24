+++
title = 'Mysteries'
+++

The following is a list of mysteries.

## General

- What is the CTR abbreviation?


C may stand for Chiheisen ("horizon" in Japanese, the O3DS's codename
being "Project Horizon").


Not true, Horizon refers to the OS.

CTR stands for Citrus.

## Hardware

### Why are there two CTRCARD controllers?

**Background:** Also [DSi SoC
pinout](http://problemkaputt.de/twl-core.jpg) shows evidence of dual
NTRCARD controllers on the final DSi SoC. (This was a [planned
feature](http://i.imgur.com/0kJlbEw.png) of the DSi before being axed
later in development)

### Why are there two EMMC controllers?

**Theory:** At some point during 3DS hardware development there was an
idea to split up CTR and TWL nand into two different chips.

### Is there a JTAG?

### Is there more than one revision of the bootrom?

**Background:** Bootrom visible portion has been dumped on the entire
3DS Family (3DS, 3DSXL, 2DS, New3DS, New3DSXL, New2DSXL), and even a
prototype board from April(?) 2010. All matching exactly.

### What is the EMMC controller @ 0x10100000 doing?

**Background:** There's dead code in NWM referencing it.

### Why did they put NTRCARD accessible from ARM11?

**Theory:** At some point during 3DS hardware development there was a
concept where ARM11 ran a menu with DS(i) icons while ARM9 was in TWL
mode.

### Is there a secret message embedded in the 3DS keyscrambler constant?

**Background:** TWL key scrambler constant was "Nintendo Co., Ltd" in
Japanese ("任天堂株式会社"), UTF-16LE encoded, with byte order mark. The
3DS key scrambler constant, by comparison, is random-looking.

### What is the PDN abbreviation?


PowerDowN

### How does Nintendo reflash bricked systems?

Before trying to boot from NAND, the bootrom checks to see if a key
combination (Start + Select + X) is being held, and whether the shell is
closed. If so, it tries to boot from an inserted NTR (Nintendo DS)
cartridge. This allows to execute a FIRM that is probably used by
Nintendo to reflash the system.

## Software

### What was the problem in "initial program loader" that was mentioned in an FCC filing by Nintendo for 2DS?

**Background:**
<http://www.neogaf.com/forum/showthread.php?t=814624&page=1>

This could be referring to the ROM on the AR6K wireless chip:

- Some 2DS units have the WiFi chip soldered directly to the board (such
  as the 2DS in this FCC filing: <https://fccid.link/BKE/FTR001N>), and
  some do not.
- The AR6K ROM only acts as an initial loader.
- Maybe some AR6K-family devices allow signature checks on the firmware?
  Or maybe some registers weren't write-once but should have been?

### What did SVC 0x74 in the ARM11 kernel do before it got stubbed?

### What is the PTM abbreviation?


PlayTime Management

### Why is the DTCM not used anywhere except bootrom?

**Background:** Bootrom is known to use part of DTCM as state,
memsetting it to 0 when it's done. After that, it is never used again.

### How is CTRAging launched during factory setup?

**Background:** No TestMenu version is capable of launching CTRAging
directly: O3DS factory TestMenu can only launch DevMenu installed on
NAND, the inserted cartridge and the TWL/AGB test apps; N3DS factory
TestMenu can only launch DevMenu installed on NAND, the inserted
cartridge and System Settings.

**Theory:** NtrBoot another time

### Why are there 4 stubbed syscalls named SendSyncRequest1-4?

### Is there a deterministic formula for calculating the Movable.sed KeyY high u64?

**Background:** We know now that the high 4 bytes of KeyY can be
reliably estimated to be 1/5th of the LocalFriendCodeSeed (low 8 bytes
of KeyY), which is close enough to brute force. However, the actual
value is usually about 0-4000 units off the actual high u32 of the KeyY
(called msed3 in the seedminer implementation). Could there possibly be
a deterministic formula given this 1/5 ratio is so close to the correct
value? It's difficult to imagine this is just a coincidence.