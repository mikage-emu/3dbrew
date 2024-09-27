This is the 3DS version of the DSi Flipnote Studio application. At the
time of writing this is only available in JPN, this 3DS application also
ships with the launch JPN [New_3DS](New_3DS "wikilink").

This also supports [local-WLAN](NWM_Services "wikilink") comms, for only
3DS\<\>3DS.

All Internet comms are done with HTTPS.

# SD data

The application settings are stored in the savedata. However, the rest
like the DSi application is stored on SD card(not under
savedata/extdata).

## SD private data

The data under "/private/Nintendo 3DS/app/JKZJ/000" are equivalent to
the the data the DSi application stores under "/private/...".

- "!!.lst" Like the DSi application, this is "encrypted".
- "<name>.kwz" Plaintext flipnote data. Example <name>:
  "cjcccccwcccccccanltthfjfaaan"

## Flipnote file format

First little-endian word at offset 0x0 is 0x1448464B("KFH").

Going by the format of the DSi flipnotes, the last 0x100-bytes in the
3DS flipnotes appears to be a RSA-2048 signature(DSi flipnotes have a
RSA-1024 signature).