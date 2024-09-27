Crappy Tiny Reader is a small Windows application for checking the basic
header information of NDS/DSi/3DS dumps.

## Changelog

v.1.11.0

- NDS/DSi: special characters like "★" etc. are now displayed correctly
  in banner preview
- NDS/DSi: dev or tool ROMs with uncommon file structure should be
  handled without error
- NDS/DSi: wordings changes
- 3DS: At the end of rom plaintext/sdk infos, special characters are now
  skipped and more displayed
- 19 old maker codes modified and 40 new ones added

v.1.10.0

- DSi: Chinese and Korean titles are now displayed if available, for DSi
  cart and DSi Ware ROMs
- 29(!) new maker codes added (thanks Jim & PsyKo)

v.1.9.0

- 3DS: "Firmware update" textbox updated. CVer version is no more
  displayed when there is no update partition in rom
- 3DS: "Region" textbox updated. "None" is no more used because of its
  nosense. "Unknown" will replace it instead, when region can't be
  determined on encrypted roms
- 3DS: modifications added to the "padding check", trimming and
  untrimming functions
- various wordings and box sizes updated
- 1 new maker code added (thanks Jim)

v1.8.7

- "Partitions" tab reorganized a bit (texts, locations..)
- "AP check" area is now displaying the flag value
- 1 new maker code added (thanks Jim)

v1.8.6

- 12 new maker codes added (thanks Jim)

v1.8.5

- 8 new maker codes added (thanks Jim)

v1.8.4

- 3DS: "Remove updates" operation is now working fine, bug fixed (thanks
  iCEQB)
- 3DS: More conditions have been added to trimming/ripping functions,
  Card2 games are now skipped
- 3DS: Confirm window will now pop up before starting the Card2 save
  deletion process
- 3DS: Results of trim/untrim/rip/delete operations will now be
  displayed at the end of process
- various wording edited

v1.8.3

- 4 new maker codes added (thanks Jim)
- 3DS: "AP check" will display if the new antipiracy flag is set (if
  present, .3ds games will not work on Sky3DS or Gateway fw \< 3.4)
- 3DS: "Header check" area has been moved from Tools to Partitions tab.
- 3DS: "Remove updates" feature has been updated, now the New3DS update
  partition will be deleted too
- various wording edited/removed

v1.8.2

- 4 new maker codes added, 1 old one modified
- 3DS: ROM version (revision) added
- 3DS: partition serial will be displayed even if the partition is
  incomplete

v1.8.1

- 28 new maker codes added, 3 old ones modified
- 3DS: "New3DS Up." (New3DS Update Data) text added in front of
  Partition \#6
- NDS/DSi: DSiWare detection improved, titles will no longer be
  displayed as "DSi only"
- NDS/DSi: No more alert displayed for NDS games with an empty maker
  code

v1.8

- 18 new maker codes added, 2 old ones modified
- NDS/DSi: new autostart value added.
- NDS/DSi: new detection added on the secure area to find if the ROM is
  decrypted or just bad.
- NDS/DSi: for DSi ROMs, "Used space" is now calculated correctly and
  includes the TWL areas.
- NDS/DSi: DSiWare is displayed in ROM type if detected.
- NDS/DSi: header check now doesn't scan "security data" and "segment3"
  areas anymore.
- NDS/DSi: DSi sections scan has been removed, as it's not a part of
  header.
- 3DS: "Erase card2 save" has been added in Tools. Fills the card2 save
  area with "FF"
- 3DS: 3DS operations in Tools now accept .3dz files too.

v0.07

- data size calculation bug fixed for 3DS ROMS bigger than 2Gb.
- experimental new tab to detect NDS roms with bad header (DSi not
  supported)
- lot of new "Maker Codes" added

v0.06

- Tool now supports NDS and DSi ROMS
- the ROM capacity calculation has been changed for 3DS
- bug with CRC32 fixed
- bug with locked files fixed
- Plain region infos now displayed for 3DS dumps
- textboxes black background bug fixed

## Screenshot

<figure>
<img src="Crappy-tiny-reader.png" title="File:Crappy-tiny-reader.png" />
<figcaption><a
href="File:Crappy-tiny-reader.png">File:Crappy-tiny-reader.png</a></figcaption>
</figure>