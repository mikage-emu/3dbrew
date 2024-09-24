3DS Save DeEncrypter v1.4 released by Blite to Decrypt and encrypt 3DS
gamesaves. Windows GUI used so no need for console commands.

v1.4 -Decryption now places "FF" into decrypted file incase of CRC
checksum miscalculations.

`    So now removed the need for backwards compatability with 3DS SaveTool by crediar.`
`   -Some people have said they needed a file to get the application running so added`
`    COMCTL32.OCX to archive for those people that need it.`
`   -Added an icon for aesthetics.`

v1.3 -Added creation of EEPROM save Reset to restore Game cartridges to
Factory default (e.g. 0xFF)

v1.2 -Major upgrade to the speed of the decryption/encryption.

`   -Save File info added to FIle menu.`

v1.1 -Conversion of decrypted files using 3DS Save DeEncrypter to those
that 3DSaveTool will support

v1.0 -Works on all computers tested with so far, no issues with critical
sections using MSVCR100.dll as it down't use it.

Tested on all games that i own and works. Encryption of files correctly
binary compares with the origional encrypted file.

Down the line -CRC info in Save File info -Specific game save
information: currently working on: - Resident Evil Mercenaries