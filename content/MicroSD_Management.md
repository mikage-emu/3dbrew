+++
title = 'MicroSD Management'
+++

This is the [New_3DS](New_3DS "wikilink")-only system application used
for microSD data transfer for New3DS\<\>PC. This is launched via [System
Settings](System_Settings "wikilink").

This uses the SMB protocol. When first starting the application it will
ask for an username, password, and workgroup name, for accessing the
New3DS with from a PC. These settings are then stored in savedata, so
that info doesn't need setup each time the application is launched.

Although said to only work with Windows systems, it will work with other
OS's if the name of the PC is changed. This is because the app has a
hardcoded check for the name of the PC. Why it has this DRM is a
mystery.

# System Savedata

- "/Mcopy.dat" Filesize is (at least?) 0x68-bytes, contains the stored
  settings.

Savefile structure:

| Offset | Size | Description                 |
|--------|------|-----------------------------|
| 0x0    | 0x4  | u32, unknown. Usually 1?    |
| 0x4    | 0x4  | u32, unknown. Usually 1?    |
| 0x8    | 0x20 | char\[\] wifi AP SSID       |
| 0x28   | 0x10 | char\[\] SMB device name    |
| 0x38   | 0x10 | char\[\] SMB workgroup name |
| 0x48   | 0x10 | char\[\] SMB username       |
| 0x58   | 0x10 | char\[\] SMB password       |
