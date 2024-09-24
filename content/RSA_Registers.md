+++
title = 'RSA Registers'
+++

# Overview

The RSA module is essentially a hardware-accelerated modular
exponentiation engine. It is specially optimized for RSA applications,
so its behavior can be incoherent when RSA's invariants are broken.

### Observed edge cases

- if 2 divides mod, output == 0

# Registers

| Old3DS | Name                                   | Address    | Width                                                             | Used by |
|--------|----------------------------------------|------------|-------------------------------------------------------------------|---------|
| Yes    | [RSA_CNT](#rsa_cnt "wikilink")         | 0x1000B000 | 0x04                                                              |         |
| Yes    | RSA_?                                 | 0x1000B0F0 | 0x04                                                              |         |
| Yes    | [RSA_SLOT](#rsa_slot "wikilink")0      | 0x1000B100 | 0x10                                                              |         |
| Yes    | [RSA_SLOT](#rsa_slot "wikilink")1      | 0x1000B110 | 0x10                                                              |         |
| Yes    | [RSA_SLOT](#rsa_slot "wikilink")2      | 0x1000B120 | 0x10                                                              |         |
| Yes    | [RSA_SLOT](#rsa_slot "wikilink")3      | 0x1000B130 | 0x10                                                              |         |
| Yes    | [RSA_EXPFIFO](#rsa_expfifo "wikilink") | 0x1000B200 | 0x100 (can handle u32 writes to any aligned position in the FIFO) |         |
| Yes    | [RSA_MOD](#rsa_mod "wikilink")         | 0x1000B400 | 0x100                                                             |         |
| Yes    | [RSA_TXT](#rsa_txt "wikilink")         | 0x1000B800 | 0x100                                                             |         |

## RSA_CNT

| Bit | Description                                                                            |
|-----|----------------------------------------------------------------------------------------|
| 0   | Start (1=Enable/Busy, 0=Idle)                                                          |
| 1   | Interrupt enable (1=enable, 0=disable)                                                 |
| 4-7 | Keyslot (Bit6-7 don't actually affect the keyslot)                                     |
| 8   | Endianness (1=Little endian, 0=Big endian). Affects RSA_EXPFIFO, RSA_MOD, and RSA_TXT. |
| 9   | Word order (1=Normal order, 0=Reversed order). Affects RSA_MOD and RSA_TXT.            |

## RSA_SLOT

| Name                                     | Offset | Width |
|------------------------------------------|--------|-------|
| [RSA_SLOTCNT](#rsa_slotcnt "wikilink")   | 0x0    | 0x4   |
| [RSA_SLOTSIZE](#rsa_slotsize "wikilink") | 0x4    | 0x4   |
| ?                                        | 0x8    | 0x4   |
| ?                                        | 0xC    | 0x4   |

## RSA_SLOTCNT

| Bits | Description                                                              |
|------|--------------------------------------------------------------------------|
| 0    | Key status (1=Key has been set, 0=Key has not been set yet)              |
| 1    | Key write-protect, this bit is RW. (0 = no protection, 1 = protected)    |
| 2    | Key read-protect, this bit is RW. (0 = no protection, 1 = protected)     |
| 30-3 | ?                                                                        |
| 31   | Key slot protect. Makes all other bits in this reg read-only until reset |

Before writing RSA_EXPFIFO/RSA_MOD, bit0 here should be cleared when
bit31 is already clear. Otherwise, the ARM9 will hang when attempting to
write to RSA_EXPFIFO.

## RSA_SLOTSIZE

This contains the RSA size for this slot, in words. Normally this is
0x40 for RSA-2048.

## RSA_EXPFIFO

The 0x100-byte private or public exponent is written to this write-only
FIFO.

## RSA_MOD

The RSA key modulus for the selected keyslot can be written here. When
writing the RSA modulus, the modulus must align with the end of the
register area.

Writing to RSA_MOD does not change the exponent written with
RSA_EXPFIFO. An attack based on the [Pohlig-Hellman
algorithm](wikipedia:Pohlig-Hellman_algorithm "wikilink") exists to
"read" the contents of RSA_EXPFIFO as a result (see [3DS System
Flaws](3DS_System_Flaws#Hardware "wikilink")).

## RSA_TXT

The RSA signature can be written here, and the data read from here is
the message. When writing the RSA signature, the signature must be
prepended with zeroes until it is a multiple of 8 bytes, and the end of
the signature must align with the end of the register area.

The PKCS message padding must be manually checked by software, as
hardware will only do raw RSA operations.

## Keyslots usage

| Keyslot | Description                                                                                                                                           |
|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0       | Arbitrary                                                                                                                                             |
| 1       | [CXI](NCCH#CXI "wikilink") access desc (following the exheader)                                                                                       |
| 2-3     | Initialized by the ARM9 bootrom, but not used by any of the [FIRMs](FIRM "wikilink"). It's unknown what the ARM9 bootrom uses these for, if anything. |