+++
title = '3DSaveTool'
categories = ["PC utilities"]
+++

**3DSaveTool** can be used to find the XOR key used for encryption and
use it to encrypt/decrypt EEPROM savefiles of 3DS games.

## Usage

Extract the content and follow the usage information of the tool.

## Change log

v0.2b

- fixed a bug in the 0xFF block detection

v0.2

- de/encrypting now starts at 0x1000
- fixed a few new line errors in the usage info
- when de/encrypting only 512byte blocks of 0xFF are skipped now
- fixed a bug which would not de/encrypt the last 0x2000 bytes
