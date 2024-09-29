+++
title = 'Flash Filesystem'
BookToC = false
+++

The Nintendo 3DS has several differently sized NAND flash chips. Due to
the NCSD header, the actual used size of the Old3DS NAND is
0x3AF00000-bytes(943MiB). On New3DS, the actual NAND size and the total
size used by the partitions, is 0x4D800000-bytes(1240MiB).

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

Reading of the flash chip is possible through pinouts on the motherboard
and has been performed successfully but the data is encrypted and can't
be understood without first decrypting it.

### Region Changing

See [here](https://gist.github.com/yellows8/f15be7a51c38cea14f2c).

### Redirection to SD card

See [NAND Redirection](NAND_Redirection "wikilink").

### Encryption

The NAND file system is encrypted using [AES-CTR](AES "wikilink"). The
TWL regions of NAND use the TWL NAND [keyslot](AES "wikilink"), while
the CTR regions use the CTR NAND [keyslots](AES "wikilink"). The keyslot
used for each partition is determined by the NCSD partition FS type and
encryption type. The TWL/CTR NAND regions are specified by the NCSD
header. The first 0x0B100000 bytes of NAND is encrypted with the TWL
keyslot, however before 0x00012E00 only the MBR partition table is
encrypted with the TWL keyslot. That region contains the TWL partitions
listed below.

The New3DS CTRNAND partition uses a [keyslot](AES "wikilink") separate
from the Old3DS one.

Note that re-encrypting a NAND image alone from another 3DS for use on a
different 3DS is not enough to use that NAND image on a different 3DS:
certain files in the "nand" partition would need modified/replaced as
well.

### NAND structure


<table>
<tr><th>Old3DS</th><th>New3DS</th><th>Partition name</th><th>Offset    </th><th>Size      </th><th>NCSD partition FS type</th><th>NCSD partition encryption type</th><th>NCSD partition index</th><th><a {{% href "../AES_Registers" %}}>AES</a> engine keyslot</th><th>Description
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>              </td><td>0x0       </td><td>0x200     </td><td>                      </td><td>                              </td><td>                    </td><td>                                              </td><td><a {{% href "../NCSD" %}}>NCSD</a> header, this contains the offsets/sizes of the below CTR-NAND partitions. This block also contains the TWL-NAND MBR partition table.</td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>              </td><td>0x00000000</td><td>0x0B100000</td><td>0x01                  </td><td>0x01                          </td><td>0x00                </td><td>0x03                                          </td><td>TWL NAND region                                                                                                                                             </td></tr>
<tr><td style="background: #ffccbb">No    </td><td style="background: #ccffbb">Yes   </td><td>              </td><td>0x00012C00</td><td>0x200     </td><td>                      </td><td>                              </td><td>                    </td><td>See below.                                    </td><td>Console-unique encrypted New3DS key-storage, see below.                                                                                                     </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>twln          </td><td>0x00012E00</td><td>0x08FB5200</td><td>                      </td><td>                              </td><td>                    </td><td>0x03                                          </td><td>TWL-NAND FAT16 File System. (DSi)                                                                                                                           </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>twlp          </td><td>0x09011A00</td><td>0x020B6600</td><td>                      </td><td>                              </td><td>                    </td><td>0x03                                          </td><td>TWL-NAND PHOTO FAT12 File System. (DSi)                                                                                                                     </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>              </td><td>0x0B100000</td><td>0x00030000</td><td>0x04                  </td><td>0x02                          </td><td>0x01                </td><td>0x07                                          </td><td>By default this partition is empty(only contains 0x00/0xFF bytes since it was never written to), when AGB_FIRM was never launched. This contains the AGB_FIRM GBA savegame. </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>firm0         </td><td>0x0B130000</td><td>0x00400000</td><td>0x03                  </td><td>0x02                          </td><td>0x02                </td><td>0x06                                          </td><td><a {{% href "../FIRM" %}}>Firmware</a> partition.                                                                                                                      </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ccffbb">Yes   </td><td>firm1         </td><td>0x0B530000</td><td>0x00400000</td><td>0x03                  </td><td>0x02                          </td><td>0x03                </td><td>0x06                                          </td><td><a {{% href "../FIRM" %}}>Firmware</a> partition.(Backup partition, same as above)                                                                                     </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ffccbb">No    </td><td>              </td><td>0x0B930000</td><td>0x2F5D0000</td><td>0x01                  </td><td>0x02                          </td><td>0x04                </td><td>0x04                                          </td><td>CTR-NAND partition. (3DS)                                                                                                                                   </td></tr>
<tr><td style="background: #ccffbb">Yes   </td><td style="background: #ffccbb">No    </td><td>nand          </td><td>0x0B95CA00</td><td>0x2F3E3600</td><td>                      </td><td>                              </td><td>                    </td><td>0x04                                          </td><td>CTR-NAND FAT16 File System.                                                                                                                                 </td></tr>
<tr><td style="background: #ffccbb">No    </td><td style="background: #ccffbb">Yes   </td><td>              </td><td>0x0B930000</td><td>0x41ED0000</td><td>0x01                  </td><td>0x03                          </td><td>0x04                </td><td>0x05                                          </td><td>CTR-NAND partition. (New3DS)                                                                                                                                </td></tr>
<tr><td style="background: #ffccbb">No    </td><td style="background: #ccffbb">Yes   </td><td>nand          </td><td>0x0B95AE00</td><td>0x41D2D200</td><td>                      </td><td>                              </td><td>                    </td><td>0x05                                          </td><td>CTR-NAND FAT16 File System.                                                                                                                                 </td></tr>
<table>

3DS TWL NAND FAT partitions has FAT volume name "TWL", for CTR FAT
partitions this is "CTR". The offset/size for TWL partitions are stored
in the MBR partition table, while the CTR partition table info is stored
in the NAND NCSD header. Sector0 in the CTR-NAND partition contains a
MBR partition table for the nand FAT16 filesystem, and the MBR signature
at +0x1fe.

NAND sectors which were never written to before only contain plaintext
0x00 or 0xFF bytes.

None of the NAND partitions are normally accessible from the ARM11,
except for twlp. CTR/TWL NAND FS can only be accessed when the exheader
access control descriptor for those are enabled. Normally the CTR/TWL
NAND descriptors are never enabled for retail ARM11
[CXI](NCCH#cxi "wikilink") processes. The ARM11 can only access
"nand:/rw/" mounted as the nandrw [archive](FS:OpenArchive "wikilink"),
and "nand:/ro/" mounted as the nandro archive below.

#### 0x4000

On some 3DS systems(such as 3DS XL), there's a plaintext FAT16 boot
record located at NAND offset 0x4000. This block does not exist for
launch-day 3DS systems. This is the only plaintext block for this
"partition".

#### 0x12C00

| Offset | Size  | Description                                                                                                                                                                                                                               |
|--------|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x10  | Normal-key for keyslot 0x11, used for generating the rest of the New3DS keyslots' keyX by decrypting various data with AES-ECB. With [9.6.0-X](9.6.0-24 "wikilink") this is only used for generating the keyX for keyslots 0x15 and 0x18. |
| 0x10   | 0x10  | [9.6.0-X](9.6.0-24 "wikilink"): Additional normal-key for keyslot 0x11, used for generating the keyX for keyslots 0x16 and 0x19..0x1F.                                                                                                    |
| 0x20   | 0x1E0 | Not yet used as of New3DS FIRM [9.6.0-X](9.6.0-24 "wikilink").                                                                                                                                                                            |

This 0x200-byte sector contains New3DS keys, this entire sector is
encrypted with a console-unique keyX+keyY. The keyX+keyY for this is
generated by the New3DS [arm9bin-loader](FIRM "wikilink"). Once the
arm9bin-loader finishes decrypting this data, the keyX+keyY in the
keyslot are then cleared, then the memory used for generating the
keydata is disabled(after it finishes using it for TWL key init).

This entire sector is encrypted with AES-ECB, the entire plaintext
sector is identical for all retail and dev New3DS systems (differing
between the two).

# CTR partition

The structure of [nand/title](nand/title "wikilink") appears to be
exactly the same as [SD](SD_Filesystem "wikilink"), except savegames are
stored under the [nand/data/&lt;ID0&gt;/sysdata](System_SaveData "wikilink")
directory instead. The sub-directory name under
[nand/data](nand/data "wikilink") is the SHA256 hash over the
[movable.sed](Nand/private/movable.sed "wikilink") keyY. This
nand/data/&lt;ID0&gt; directory is the NAND equivalent of the "sdmc/Nintendo
3DS/&lt;ID0&gt;/&lt;ID1&gt;" directory, however the data contained here is stored in
cleartext. The movable.sed keyY is only used for AES MACs for
nand/data/&lt;ID0&gt;. The nand/data/&lt;ID0&gt;/extdata directory contains the
shared [extdata](Extdata "wikilink"), and is structured exactly the same
way as SD extdata.


<pre tabindex="0">
nand
├── __journal.nn_
├── <a {{% href "../nand/data" "broken" %}}>data</a>
│   └── &lt;ID0&gt;
│       ├── <a {{% href "../Extdata" %}}>extdata</a>
│       └── <a {{% href "../System_SaveData" %}}>sysdata</a>
├── <a {{% href "../Title_Database" %}}>dbs</a>
├── <a {{% href "../Nand/fixdata" "broken" %}}>fixdata</a>
│   └── <a {{% href "../Nand/fixdata/sysdata" "broken" %}}>sysdata</a>
├── private
│   └── <a {{% href "../Nand/private/movable.sed" %}}>movable.sed</a>
├── <a {{% href "../Nand/ro" "broken" %}}>ro</a>
├── <a {{% href "../Nand/rw" "broken" %}}>rw</a>
├── <a {{% href "../Nand/ticket" "broken" %}}>ticket</a> (This directory is empty since tickets are stored in <a {{% href "../Title_Database" %}}>ticket.db</a>)
├── <a {{% href "../Titles" %}}>title</a>
└── <a {{% href "../Nand/tmp" "broken" %}}>tmp</a> (This is usually empty, even when installation for a system update still needs <a {{% href "../AMDoCleanup" "broken" %}}>finalized</a>)
</pre>

The "ro" and "rw" directories are accessible through the "nandrw" and
"nandro" [archives](FS:OpenArchive></a>, respectively. Their
contents are as follows:

<pre tabindex="0">
ro
├── <a {{% href "../Nandro/private" "broken" %}}>private</a>
├── <a {{% href "../Nandro/shared" "broken" %}}>shared</a>
└── <a {{% href "../Nandro/sys" "broken" %}}>sys</a>
    ├── <a {{% href "../Nandro/sys/HWCAL0.dat" "broken" %}}>HWCAL0.dat</a>
    └── <a {{% href "../Nandro/sys/HWCAL1.dat" "broken" %}}>HWCAL1.dat</a>

rw
├── <a {{% href "../Nandrw/shared" "broken" %}}>shared</a>
└── <a {{% href "../Nandrw/sys" "broken" %}}>sys</a>
    ├── <a {{% href "../Nandrw/sys/lgy.log" "broken" %}}>lgy.log</a> (This is written to by <a {{% href "FIRM" "broken" %}}>TWL_FIRM</a> when errors occur, this is equivalent to native.log)
    ├── <a {{% href "../Nandrw/sys/LocalFriendCodeSeed_B" %}}>LocalFriendCodeSeed_B</a>
    ├── <a {{% href "../Nandrw/sys/native.log" "broken" %}}>native.log</a> (This is written to by <a {{% href "ErrDisp" "broken" %}}>ErrDisp</a>)
    ├── <a {{% href "../Nandrw/sys/rand_seed" "broken" %}}>rand_seed</a>
    ├── <a {{% href "../Nandrw/sys/SecureInfo_A" %}}>SecureInfo_A</a>
    └── <a {{% href "../Nandrw/sys/updater.log" %}}>updater.log</a>
</pre>

# TWL partition

The structure of these TWL partitions is mostly the same as DSi, except
tickets are stored in the CTR FAT FS. The twlp partition is exactly the
same as DSi. The structure of [twln/title](twln/title "wikilink") is
exactly the same as CTR NAND/SD, except the .cmd file is a cleartext
file.(This is likely a dummy file) The data directory under system
titles' /title directory does not exist, this likely only exists for
DSiWare. The directory names titleID-High used under
[twln/title](twln/title "wikilink") is from DSi.

<pre tabindex="0">
twln
├── <a {{% href "../Twln/import/" "broken" %}}>import</a>
├── <a {{% href "../Twln/shared1/" "broken" %}}>shared1</a>
├── <a {{% href "../Twln/shared2/" "broken" %}}>shared2</a>
│   └── <a {{% href "../Twln/shared2/0000" %}}>0000</a>
├── <a {{% href "../Twln/sys" "broken" %}}>sys</a>
│   ├── <a {{% href "../Twln/sys/TWLFontTable.dat" "broken" %}}>TWLFontTable.dat</a>
│   └── <a {{% href "../Twln/sys/log/" "broken" %}}>log</a>
│       ├── <a {{% href "../Twln/sys/log/inspect.log" %}}>inspect.log</a>
│       └── <a {{% href "../Twln/sys/log/product.log" "broken" %}}>product.log</a>
├── <a {{% href "../Twln/ticket/" "broken" %}}>ticket</a>
├── <a {{% href "../Twln/title/" "broken" %}}>title</a>
└── <a {{% href "../Twln/tmp/" "broken" %}}>tmp</a>
</pre>

<pre tabindex="0">
twlp
└── <a {{% href "../Twlp/photo/" "broken" %}}>photo</a>
</pre>
