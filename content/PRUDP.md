+++
title = 'PRUDP'
+++

**PRUDP** is a third-party network protocol used for network
communications by some Nintendo software on the 3DS. It presumably
stands for "pretty reliable UDP" or "partially reliable UDP" or some
such, and essentially implements TCP-like reliability via sequence
numbers and acknowledgement within UDP. Optionally it also adds security
(prudps), via RC4 encryption + hashing. This is the protocol used in
Nintendo 3DS and Wii U games for online multiplayer comms etc. This can
be used with [UDS](NWM_Services "wikilink") local-WLAN too.

At least two different versions of PRUDP seem to be used by Nintendo
software: an older version used in the [Friend
services](Friend_Services "wikilink") and a newer one used in Pokémon
X/Y.

This page isn't fully documented yet, you can visit
[this](https://github.com/Kinnay/NintendoClients/wiki/PRUDP-Protocol)
for more documentation.

## Version 0

This is the version of the protocol used by the [Friend
services](Friend_Services "wikilink").

### Packet structure

| Type     | Name     | Description                                                        |
|----------|----------|--------------------------------------------------------------------|
| u16      | src_dst  | Magic: client-to-server (afa1) or server-to-client (a1af)          |
| u16      | op       | Type of packet                                                     |
| u8       | unk1     |                                                                    |
| u32      | unk2     |                                                                    |
| u16      | seqno    | Incrementing ID to pair up data packets and acknowledgement        |
| u8\[\*\] | payload  |                                                                    |
| u8       | checksum | seems to be related to the sum of the rest of the fields (mod 256) |

Different kinds of packets have different values for the different
fields:

- Handshake (1): op=0x40 or op=0x10 (cli-to-serv or serv-to-cli)
  - unk1, unk2, seqno are 0
  - payload: u32 unk3;

<!-- -->

- Handshake (2): op=0x61 or op=0x11
  - unk1, seqno are 0
  - payload: u32 unk3;

<!-- -->

- Hangup: op=0x63 or op=0x13

<!-- -->

- Heartbeat: op=0x44 or op=0x14
  - seqno = increasing

<!-- -->

- Data packet: op=0x62
  - seqno = increasing
  - payload: u8\[?\] payload;

<!-- -->

- Data ack: op=0x12
  - unk2 = 0x12345678
  - seqno = corresponding to the data packet being acknowledged

### Sample session

    Handshake 1   → af a1 40 00 00 00 00 00 00 00 00 00 00 00 00 97
    Handshake 1   ← a1 af 10 00 00 00 00 00 00 00 00 5f 22 68 ea 3a
    Handshake 2   → af a1 61 00 18 5f 22 68 ea 01 00 d4 d6 91 e8 c9
    Handshake 2   ← a1 af 11 00 50 d4 d6 91 e8 01 00 00 00 00 00 de
    Send data     → af a1 62 00 18 26 b4 01 a1 02 00 00 (25 bytes of encrypted payload) ef
    Acknowledge   ← a1 af 12 00 50 78 56 34 12 02 00 00 d1
    Send data     ← a1 af 62 00 50 67 dd f9 c3 01 00 00 (255 bytes of encrypted payload) 03
    Acknowledge   → af a1 12 00 18 78 56 34 12 01 00 00 97
    Send data     → af a1 62 00 18 8d 58 91 c0 03 00 00 (21 bytes of encrypted payload) fa
    Acknowledge   ← a1 af 12 00 50 78 56 34 12 03 00 00 d2
    Send data     ← a1 af 62 00 50 a9 c5 fa 2e 02 00 00 (130 bytes of encrypted payload) 54
    Acknowledge   → af a1 12 00 18 78 56 34 12 02 00 00 98
    Hangup        → af a1 63 00 18 5f 22 68 ea 04 00 aa
    Hangup        ← a1 af 13 00 50 d4 d6 91 e8 04 00 e2

During the handshake process, the `unk2` and `unk3` fields exhibit a
pattern where the `unk3` of the preceding packet is used as the `unk2`
of the next one. The parties might be agreeing upon a key using a
key-exchange scheme?

### Payload

The plaintext form of the RC4 encrypted payload consists of a small
header that looks like:

| Type | Name   | Description                                              |
|------|--------|----------------------------------------------------------|
| u32  | length | Length of the remaining payload (excluding this field)   |
| u8   | op     | Type of packet                                           |
| u8   | unk1   | (Only for server-to-client messages, seemingly always 1) |
| u32  | msgid  | Seemingly used to pair up requests and responses         |
| u32  | unk2   |                                                          |

The encrypted payloads exchanged when first connecting look something
like (excluding the header):

    → string deviceID;
    ← u16 unk1; u16 unk2; u32 deviceID; u32 length; u8[length] blob; string connectionString; u8[7] unk3; string buildString;
    → u32 deviceID; u32 unk1;
    ← u16 unk1; u16 unk2; u32 length; u8[length] blob;

where `string` is both length-prefixed (`u16`) and zero-terminated (the
terminating zero is not included in the length).

The `connectionString` looks like
'prudps:/address=203.180.85.79;port=50051;CID=1;PID=2;sid=1;stream=10;type=2'
and the `buildString` is always 'branch:unknown build:2_24_13767_0'. The
`deviceID` seems to be unique to each 3DS or perhaps online account (it
seems to roughly scale with the age of the 3DS, so that an older 3DS
sends a lower ID).
