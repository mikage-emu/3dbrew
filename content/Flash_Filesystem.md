+++
title = 'Flash Filesystem'
+++

The Nintendo 3DS has several differently sized NAND flash chips. Due to the NCSD header, the actual used size of the Old3DS NAND is 0x3AF00000-bytes(943MiB). On New3DS, the actual NAND size and the total size used by the partitions, is 0x4D800000-bytes(1240MiB).

### Physical Size

| Device | Manufacturer | Size       |
|--------|--------------|------------|
| 2DS    | Toshiba      | 0x3AF00000 |
| 2DS    | Toshiba      | 0x76000000 |
| 2DS    | Samsung      | 0x3BA00000 |
| 2DS    | Samsung      | 0x4D800000 |
| Old3DS | Toshiba      | 0x3AF00000 |
| Old3DS | Samsung      | 0x3BA00000 |
| New3DS | Toshiba      | 0x76000000 |
| New3DS | Samsung      | 0x4D800000 |
| New3DS | Samsung      | 0x74800000 |

### Format

Reading of the flash chip is possible through pinouts on the motherboard and has been performed successfully but the data is encrypted and can't be understood without first decrypting it.

### Region Changing

See [here](https://gist.github.com/yellows8/f15be7a51c38cea14f2c).

### Redirection to SD card

See [NAND_Redirection](NAND_Redirection "wikilink").

### Encryption

The NAND file system is encrypted using [AES-CTR](AES "wikilink"). The TWL regions of NAND use the TWL NAND [keyslot](AES "wikilink"), while the nonce is the sha1 hash of the NAND CID, byte reversed. The CTR regions use the CTR NAND [keyslots](AES "wikilink"), while the nonce is the sha256 hash of the NAND CID. The keyslot used for each partition is determined by the NCSD partition FS type and encryption type. The TWL/CTR NAND regions are specified by the NCSD header. The first 0x0B100000 bytes of NAND is encrypted with the TWL keyslot, however before 0x00012E00 only the MBR partition table is encrypted with the TWL keyslot. That region contains the TWL partitions listed below.

The New3DS CTRNAND partition uses a [keyslot](AES "wikilink") separate from the Old3DS one.

Note that re-encrypting a NAND image alone from another 3DS for use on a different 3DS is not enough to use that NAND image on a different 3DS: certain files in the "nand" partition would need modified/replaced as well.

### NAND structure

| Old3DS | New3DS | Partition name | Offset | Size | NCSD partition FS type | NCSD partition encryption type | NCSD partition index | [AES](AES_Registers "wikilink") engine keyslot | Description |
|----|----|----|----|----|----|----|----|----|----|
| Yes | Yes |  | 0x0 | 0x200 |  |  |  |  | [NCSD](NCSD "wikilink") header, this contains the offsets/sizes of the below CTR-NAND partitions. This block also contains the TWL-NAND MBR partition table. |
| Yes | Yes |  | 0x00000000 | 0x0B100000 | 0x01 | 0x01 | 0x00 | 0x03 | TWL NAND region |
| No | Yes |  | 0x00012C00 | 0x200 |  |  |  | See below. | Console-unique encrypted New3DS key-storage, see below. |
| Yes | Yes | twln | 0x00012E00 | 0x08FB5200 |  |  |  | 0x03 | TWL-NAND FAT16 File System. (DSi) |
| Yes | Yes | twlp | 0x09011A00 | 0x020B6600 |  |  |  | 0x03 | TWL-NAND PHOTO FAT12 File System. (DSi) |
| Yes | Yes |  | 0x0B100000 | 0x00030000 | 0x04 | 0x02 | 0x01 | 0x07 | By default this partition is empty(only contains 0x00/0xFF bytes since it was never written to), when AGB_FIRM was never launched. This contains the AGB_FIRM GBA savegame. |
| Yes | Yes | firm0 | 0x0B130000 | 0x00400000 | 0x03 | 0x02 | 0x02 | 0x06 | [Firmware](FIRM "wikilink") partition. |
| Yes | Yes | firm1 | 0x0B530000 | 0x00400000 | 0x03 | 0x02 | 0x03 | 0x06 | [Firmware](FIRM "wikilink") partition.(Backup partition, same as above) |
| Yes | No |  | 0x0B930000 | 0x2F5D0000 | 0x01 | 0x02 | 0x04 | 0x04 | CTR-NAND partition. (3DS) |
| Yes | No | nand | 0x0B95CA00 | 0x2F3E3600 |  |  |  | 0x04 | CTR-NAND FAT16 File System. |
| No | Yes |  | 0x0B930000 | 0x41ED0000 | 0x01 | 0x03 | 0x04 | 0x05 | CTR-NAND partition. (New3DS) |
| No | Yes | nand | 0x0B95AE00 | 0x41D2D200 |  |  |  | 0x05 | CTR-NAND FAT16 File System. |

3DS TWL NAND FAT partitions has FAT volume name "TWL", for CTR FAT partitions this is "CTR". The offset/size for TWL partitions are stored in the MBR partition table, while the CTR partition table info is stored in the NAND NCSD header. Sector0 in the CTR-NAND partition contains a MBR partition table for the nand FAT16 filesystem, and the MBR signature at +0x1fe.

NAND sectors which were never written to before only contain plaintext 0x00 or 0xFF bytes.

None of the NAND partitions are normally accessible from the ARM11, except for twlp. CTR/TWL NAND FS can only be accessed when the exheader access control descriptor for those are enabled. Normally the CTR/TWL NAND descriptors are never enabled for retail ARM11 [CXI](NCCH#cxi "wikilink") processes. The ARM11 can only access "nand:/rw/" mounted as the nandrw [archive](FS:OpenArchive "wikilink"), and "nand:/ro/" mounted as the nandro archive below.

#### 0x4000

On some 3DS systems(such as 3DS XL), there's a plaintext FAT16 boot record located at NAND offset 0x4000. This block does not exist for launch-day 3DS systems. This is the only plaintext block for this "partition".

#### 0x12C00

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x10 | Normal-key for keyslot 0x11, used for generating the rest of the New3DS keyslots' keyX by decrypting various data with AES-ECB. With [9.6.0-X](9.6.0-24 "wikilink") this is only used for generating the keyX for keyslots 0x15 and 0x18. |
| 0x10 | 0x10 | [9.6.0-X](9.6.0-24 "wikilink"): Additional normal-key for keyslot 0x11, used for generating the keyX for keyslots 0x16 and 0x19..0x1F. |
| 0x20 | 0x1E0 | Not yet used as of New3DS FIRM [9.6.0-X](9.6.0-24 "wikilink"). |

This 0x200-byte sector contains New3DS keys, this entire sector is encrypted with a console-unique keyX+keyY. The keyX+keyY for this is generated by the New3DS [arm9bin-loader](FIRM "wikilink"). Once the arm9bin-loader finishes decrypting this data, the keyX+keyY in the keyslot are then cleared, then the memory used for generating the keydata is disabled(after it finishes using it for TWL key init).

This entire sector is encrypted with AES-ECB, the entire plaintext sector is identical for all retail and dev New3DS systems (differing between the two).

# CTR partition

The structure of [nand/title](nand/title "wikilink") appears to be exactly the same as [SD](SD_Filesystem "wikilink"), except savegames are stored under the [nand/data/<ID0>/sysdata](System_SaveData "wikilink") directory instead.
The sub-directory name under [nand/data](nand/data "wikilink") is the SHA256 hash over the [movable.sed](nand/private/movable.sed "wikilink") keyY. This nand/data/<ID0> directory is the NAND equivalent of the "sdmc/Nintendo 3DS/<ID0>/<ID1>" directory, however the data contained here is stored in cleartext. The movable.sed keyY is only used for AES MACs for nand/data/<ID0>. The nand/data/<ID0>/extdata directory contains the shared [extdata](extdata "wikilink"), and is structured exactly the same way as SD extdata.

`nand`  
`├── __journal.nn_`  
`├── `[`data`](nand/data "wikilink")  
`│   └── `<ID0>  
`│       ├── `[`extdata`](Extdata "wikilink")`          `  
`│       └── `[`sysdata`](System_SaveData "wikilink")  
`├── `[`dbs`](Title_Database "wikilink")  
`├── `[`fixdata`](nand/fixdata "wikilink")  
`│   └── `[`sysdata`](nand/fixdata/sysdata "wikilink")  
`├── private`  
`│   └── `[`movable.sed`](nand/private/movable.sed "wikilink")  
`├── `[`ro`](nand/ro "wikilink")  
`├── `[`rw`](nand/rw "wikilink")  
`├── `[`ticket`](nand/ticket "wikilink")` (This directory is empty since tickets are stored in `[`ticket.db`](Title_Database "wikilink")`)`  
`├── `[`title`](Title_Data_Structure "wikilink")  
```
└── `[`tmp`](nand/tmp "wikilink")` (This is usually empty, even when installation for a system update still needs `[`finalized`](AMNet:FinishInstallToMedia "wikilink")`)
```

The "ro" and "rw" directories are accessible through the "nandrw" and "nandro" [archives](FS:OpenArchive "wikilink"), respectively. Their contents are as follows:

`ro`  
`├── `[`private`](nandro/private "wikilink")  
`├── `[`shared`](nandro/shared "wikilink")  
`└── `[`sys`](nandro/sys "wikilink")  
`    ├── `[`HWCAL0.dat`](nandro/sys/HWCAL0.dat "wikilink")  
`    └── `[`HWCAL1.dat`](nandro/sys/HWCAL1.dat "wikilink")  
`rw`  
`├── `[`shared`](nandrw/shared "wikilink")  
`└── `[`sys`](nandrw/sys "wikilink")  
`    ├── `[`lgy.log`](nandrw/sys/lgy.log "wikilink")` (This is written to by `[`TWL_FIRM`](FIRM "wikilink")` when errors occur, this is equivalent to native.log)`  
`    ├── `[`LocalFriendCodeSeed_B`](nandrw/sys/LocalFriendCodeSeed_B "wikilink")  
`    ├── `[`native.log`](nandrw/sys/native.log "wikilink")` (This is written to by `[`ErrDisp`](ErrDisp "wikilink")`)`  
`    ├── `[`rand_seed`](nandrw/sys/rand_seed "wikilink")  
`    ├── `[`SecureInfo_A`](nandrw/sys/SecureInfo_A "wikilink")  
`    └── `[`updater.log`](nandrw/sys/updater.log "wikilink")

# TWL partition

The structure of these TWL partitions is mostly the same as DSi, except tickets are stored in the CTR FAT FS. The twlp partition is exactly the same as DSi.
The structure of [twln/title](twln/title "wikilink") is exactly the same as CTR NAND/SD, except the .cmd file is a cleartext file.(This is likely a dummy file) The data directory under system titles' /title directory does not exist, this likely only exists for DSiWare.
The directory names titleID-High used under [twln/title](twln/title "wikilink") is from DSi.

`twln`  
`├── `[`import`](twln/import/ "wikilink")  
`├── `[`shared1`](twln/shared1/ "wikilink")  
`├── `[`shared2`](twln/shared2/ "wikilink")  
`│   └── `[`0000`](twln/shared2/0000 "wikilink")  
`├── `[`sys`](twln/sys "wikilink")  
`│   ├── `[`TWLFontTable.dat`](twln/sys/TWLFontTable.dat "wikilink")  
`│   └── `[`log`](twln/sys/log/ "wikilink")  
`│       ├── `[`inspect.log`](twln/sys/log/inspect.log "wikilink")  
`│       └── `[`product.log`](twln/sys/log/product.log "wikilink")  
`├── `[`ticket`](twln/ticket/ "wikilink")  
`├── `[`title`](twln/title/ "wikilink")  
`└── `[`tmp`](twln/tmp/ "wikilink")

`twlp`  
`└── `[`photo`](twlp/photo/ "wikilink")
