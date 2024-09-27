+++
title = 'Browserhax'
+++

Browserhax exploits various vulnerabilities in the system web-browsers,
see the below repositories for details.

The following browser exploits can be used to boot the hblauncher
payload:

- [1](https://github.com/yellows8/3ds_webkithax)
- [2](https://github.com/yellows8/browserhax_fright)

A hosted version of these is available here:
[3](https://yls8.mtheall.com/3dsbrowserhax.php)

# Changelog

## July 27, 2016

- The latest Old3DS/New3DS browser versions as of
  [11.0.0-33](11.0.0-33 "wikilink") are now supported.
- Sliderhax is now obsolete since it was replaced with another
  exploit(it's still accessible however).
- Added support for more non-<USA/EUR/JPN> browser versions.
- *Every* version of the USA/EUR/JPN Old3DS browsers are now properly
  supported(previously support for the older versions were broken).
- When requesting the payload-URL for the current system-version, and
  when downloading the actual \*hax payload, the loader now only uses
  HTTPS.
- Fixed hangs in HTTPC_CloseContext when an error previously occurred
  prior to using HTTPC_ReceiveData.
- **Major** improvements with the Old3DS-browserhax loader. With these
  changes, Home Menu *takeover* has never failed pre-release, even with
  \>=v10.4 NATIVE_FIRM.
- Fixed issue where new3ds menu takeover would fail when theme-shuffling
  is enabled.