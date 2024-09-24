+++
title = 'NFC Adapter'
+++

The Nintendo NFC adapter, formally **Nintendo NFC Reader/Writer** and
codenamed **Fangate**, is an external device which adds NFC capabilities
for [amiibos](amiibo "wikilink") to old Nintendo 3DS and Nintendo 2DS
consoles, using the infrared port on the back of the console.

It launched simultaneously with Animal Crossing Happy Home Designer,
with which it's optionally bundled; it can also be bought standalone at
a nominal price of 21 €.

<figure>
<img src="../150217nfcreader-640x360.jpg"
title="150217nfcreader-640x360.jpg" />
<figcaption>150217nfcreader-640x360.jpg</figcaption>
</figure>

# Technical details

Based on analysis of the
[fangate_updater.bin](fangate_updater.bin "wikilink") file, which is
part of the old Nintendo 3DS operating system since
[9.3.0-21](9.3.0-21 "wikilink") and contains the firmware running on the
external adapter; and analysis of the [NFC
Services](NFC_Services "wikilink") running on old 3DS.

- SOC inside the adapter: Broadcom BCM20791B1 or ST proprietary
  "MCU-FGT/rev.A/GH24S VQ"
- CPU: ARM Cortex M0
- Communications: infrared, with [ir:USER](ir:USER "wikilink") running
  on the console. Uses obfuscated payloads. Baud rate is 115200 bps.

Memory map:

| Address    | Size   | Description                                                                                                           |
|------------|--------|-----------------------------------------------------------------------------------------------------------------------|
| 0x08008000 | 256KB? | Firmware ([fangate_updater.bin](fangate_updater.bin "wikilink"))                                                      |
| 0x20000000 | 128KB? | RAM                                                                                                                   |
| 0x40023C00 | 0x1C   | FLASH ROM control                                                                                                     |
| 0xE000ED00 | 0x104  | [ARM Cortex system control block](http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0439b/BABCIIIA.html) |

# IR communications

Packets are sent using IrDA-SIR (using [ir:USER](ir:USER "wikilink")),
with a 8N1 encoding (eight data bits, one stop bit, without parity).
Each one is formed by a 2-byte header, a varint with the payload size,
an obfuscated payload, and trailing error detection byte.

## Layer 1 - framing format

Frames are encoded using two different yet very simmilar formats,
depending on how large the payload to be transmitted is:

- For payloads with less than 64 bytes, the third byte represents the
  payload size.
- For packets with up to 16383 bytes, the size is split in two bytes,
  with the third byte being the upper 6 bits of the payload size, OR'd
  with 0x40, and the fourth being the lower eight bits of the payload
  size

| Byte     | 7                                                                | 6                 | 5            | 4   | 3   | 2   | 1   | 0   |
|----------|------------------------------------------------------------------|-------------------|--------------|-----|-----|-----|-----|-----|
| 0x00     | Synchronization byte (`0xA5`)                                    |                   |              |     |     |     |     |     |
| 0x01     | Reserved for future use (`0x00`)                                 |                   |              |     |     |     |     |     |
| 0x02     | RFU (`0`)                                                        | Short frame (`0`) | Payload size |     |     |     |     |     |
| 0x03     | Payload byte 0                                                   |                   |              |     |     |     |     |     |
| ...      |                                                                  |                   |              |     |     |     |     |     |
| 0x03+n-1 | Payload byte n-1                                                 |                   |              |     |     |     |     |     |
| 0x03+n   | [CRC-8-CCITT](CRC-8-CCITT "wikilink") computer over whole packet |                   |              |     |     |     |     |     |

IR framing format - short frame

| Byte     | 7                                                                | 6                | 5                           | 4   | 3   | 2   | 1   | 0   |
|----------|------------------------------------------------------------------|------------------|-----------------------------|-----|-----|-----|-----|-----|
| 0x00     | Synchronization byte: `0xA5`                                     |                  |                             |     |     |     |     |     |
| 0x01     | Reserved for future use                                          |                  |                             |     |     |     |     |     |
| 0x02     | RFU (`0`)                                                        | Long frame (`1`) | Payload size (upper 6 bits) |     |     |     |     |     |
| 0x03     | Payload size (lower 8 bits)                                      |                  |                             |     |     |     |     |     |
| 0x04     | Payload byte 0                                                   |                  |                             |     |     |     |     |     |
| ...      |                                                                  |                  |                             |     |     |     |     |     |
| 0x04+n-1 | Payload byte n-1                                                 |                  |                             |     |     |     |     |     |
| 0x04+n   | [CRC-8-CCITT](CRC-8-CCITT "wikilink") computer over whole packet |                  |                             |     |     |     |     |     |

IR framing format - long frame

### Header

The packet header is fixed and consists in a synchronization byte
(0xA5), followed by a unused (possibly RFU) zero byte. After these two
hardcoded bytes, there's a varint representing the payload size, which
may use one byte or two, depending on the how big the payload is.

In C:

```
uint8_t * setPacketHeader(uint8_t * buffer, size_t payloadSize) {
    assert(payloadSize < 16384);
``
    buffer[0] = 0xA5;
    buffer[1] = 0x00;
``
    if (payloadSize < 64) {
        buffer[2] = payloadSize;
        buffer += 3;
    } else {
        buffer[2] = 0x40 | (payloadSize >> 8);
        buffer[3] = payloadSize;
        buffer += 4;
    }
``
    return buffer;
}
```

### Payload

The payload is obfuscated using a XOR-based encryption. In C:

```
void payloadObfuscate(const void * voidplain, void * voidcipher, size_t size) {
    uint16_t * plain = (uint16_t *) voidplain;
    uint16_t * cipher = (uint16_t *) voidcipher;
    size_t halfCount = size >> 1; // Divide by 2 rounding towards zero
``
    uint16_t xorval = htobe16(0xE963);
    size_t i;
``
    for (i = 0; i < halfCount; i++) {
        xorval ^= plain[i];
        cipher[i] = xorval;
    }
}
``
void payloadDeobfuscate(const void * voidcipher, void * voidplain, size_t size) {
    uint16_t * cipher = (uint16_t *) voidcipher;
    uint16_t * plain = (uint16_t *) voidplain;
    size_t halfCount = size >> 1; // Divide by 2 rounding towards zero
``
    uint16_t xorval = htobe16(0xE963);
    size_t i;
``
    for (i = 0; i < halfCount; i++) {
        uint16_t word = plain[i];
        cipher[i] = xorval ^ word;
        xorval = word;
    }
}
```

### Error detection

The trailing error detection byte is calculated using
[CRC-8-CCITT](CRC-8-CCITT "wikilink") <b>over the whole packet</b> (both
the header and the payload)

## Layer 2 - "ircom"

ircom is a simple stateful point-to-point master-slave communication
protocol built on top of IR layer 1.

| Byte  | 7                                                                       | 6   | 5   | 4   | 3                       | 2   | 1   | 0   |
|-------|-------------------------------------------------------------------------|-----|-----|-----|-------------------------|-----|-----|-----|
| 0x00  | Random value in range `0x01`~`0xFE`                                     |     |     |     |                         |     |     |     |
| 0x01  | Random value in range `0x01`~`0xFE`                                     |     |     |     |                         |     |     |     |
| 0x02  | Random value in range `0x01`~`0xFE`                                     |     |     |     |                         |     |     |     |
| 0x03  | Random value in range `0x01`~`0xFE`                                     |     |     |     |                         |     |     |     |
| 0x04  | RFU?                                                                    |     |     |     | Protocol version: `0x1` |     |     |     |
| 0x05  | Connection identifier of master (3DS), value determined by master       |     |     |     |                         |     |     |     |
| 0x06  | Connection identifier of slave (NFC adapter), value determined by slave |     |     |     |                         |     |     |     |
| 0x07  | ???                                                                     |     |     |     | Operation code          |     |     |     |
| 0x08+ | Payload (if any)                                                        |     |     |     |                         |     |     |     |

- Random values are generated using a Mersenne Twister whose seed is
  based off the NFC adapter system tick counter. It is therefore random,
  and the 3DS won't attempt to validate them by any means. Its purpose
  is to make every encrypted packet look completely different to the
  previous one. This makes a replay attack impossible without knowing
  the encryption algorithm.
- NFC adapter will ignore packets whose protocol version is not 1. It
  will not even reply.
- Connection identifier is a random byte the 3DS assigns to identify the
  connection should there be several connections in range at once. Slave
  devices must save this value from the initial handshake packet and use
  it for replies. The 3DS will also save the connection identifier byte
  of the slave which is also random. The 3DS must also ignore packets
  whose connection ID does not match.

### Operation codes

| Code | Name                         | Has payload | Direction       |
|------|------------------------------|-------------|-----------------|
| 0x0  | Layer 3 command              | Yes         | Master to slave |
| 0x1  | ???                          | ???         |                 |
| 0x2  | ???                          | ???         |                 |
| 0x3  | ???                          | ???         |                 |
| 0x4  | ???                          | ???         |                 |
| 0x5  | ???                          | ???         |                 |
| 0x6  | ???                          | ???         |                 |
| 0x7  | ???                          | ???         |                 |
| 0x8  | ???                          | ???         |                 |
| 0x9  | ???                          | ???         |                 |
| 0xA  | Disconnect request           | No          | Master to slave |
| 0xB  | Disconnection acknowledgment | No          | Slave to master |
| 0xC  | Handshake                    | No          | Master to slave |
| 0xD  | Handshake acknowledgement    | No          | Slave to master |
| 0xE  | ???                          | ???         |                 |
| 0xF  | ???                          | ???         |                 |

## Layer 3

Layer 3 is the payload of layer 2. A lot is unknown of this layer and
thus a lot of assumptions were made in the following tables.

Layer 3 contains the following data:

| Byte  | 7                            | 6   | 5   | 4   | 3            | 2   | 1   | 0   |
|-------|------------------------------|-----|-----|-----|--------------|-----|-----|-----|
| 0x00  | Request identifier nibble    |     |     |     | Always `0x1` |     |     |     |
| 0x01  | Slave/master identifier byte |     |     |     |              |     |     |     |
| 0x02  | Request type code upper byte |     |     |     |              |     |     |     |
| 0x03  | Request type code lower byte |     |     |     |              |     |     |     |
| 0x04+ | Payload (if any)             |     |     |     |              |     |     |     |

- Request identifier nibble is incremented by `0x1` at every new request
  by the master, the same value for this byte is also sent by the slave
  in response to the request of the master
- Slave/master identifier byte is `0x1` for a message from the master
  and `0x10` for a message from the slave

### Request type codes

| Code   | Request description                                   | Direction       | Has payload |
|--------|-------------------------------------------------------|-----------------|-------------|
| 0x0000 | ACK                                                   | Slave to master | Yes         |
| 0x0003 | Get firmware version and battery level of NFC adapter | Master to slave | No          |
| 0x0004 | Firmware version and battery level                    | Slave to master | Yes         |
| 0x0100 | Unknown, slave always responds with ACK               | Master to slave | Yes         |
| 0x0202 | Request to stop communication with NFC tag            | Master to slave | No          |
| 0x0204 | Get dumped data from NFC tag                          | Master to slave | No          |
| 0x0205 | Data from NFC tag                                     | Slave to master | Yes         |
| 0x0206 | Request to start communication with NFC tag           | Master to slave | Yes         |
| 0x0207 | Request to write data to NFC tag                      | Master to slave | Yes         |

### Payload

#### 0x0000

Acknowledgement message always send by slave. Payload always contains
```
0x000000AA
```

#### 0x0004

Payload contains firmware version and battery level of NFC adapter.
Payload has a size of 6 bytes.

| Byte | 7                                                                               | 6   | 5   | 4   | 3   | 2   | 1   | 0   |
|------|---------------------------------------------------------------------------------|-----|-----|-----|-----|-----|-----|-----|
| 0x00 | Upper or lower byte of version number, newest firmware is `0x1`                 |     |     |     |     |     |     |     |
| 0x01 | Upper or lower byte of version number, newest firmware is `0x6`                 |     |     |     |     |     |     |     |
| 0x02 | Padding byte? Always `0x0`                                                      |     |     |     |     |     |     |     |
| 0x03 | Padding byte? Always `0x0`                                                      |     |     |     |     |     |     |     |
| 0x04 | Battery level. Values varies between `0x3` for full battery and `0x0` for empty |     |     |     |     |     |     |     |
| 0x05 | Padding byte? Always `0x0`                                                      |     |     |     |     |     |     |     |

- NFC reader LED already turns red when the battery level byte is `0x2`,
  this will also trigger a low battery level warning on the 3DS

#### 0x0100

The purpose of this request by the master is unknown. Slave always
responds with ACK. Payload of this request is always `0x0003E8AA`

#### 0x0205

Payload contains data regarding NFC communication. The first byte of the
payload means the following:

| Code | Description                                                                  |
|------|------------------------------------------------------------------------------|
| 0x00 | NFC communication is stopped as a result of a `0x0202` request by the master |
| 0x01 | No NFC tag on top of the reader                                              |
| 0x02 | Busy dumping NFC tag                                                         |
| 0x03 | NFC tag dump after write by master                                           |
| 0x04 | NFC tag fully dumped                                                         |
| 0x05 | NFC tag dump after write by master                                           |
| 0x07 | NFC tag not a NTAG215 or contains no Amiibo compatible data                  |
| 0x08 | NFC tag removed from reader                                                  |

- After the tag is written by the master and dumped again, the first few
  dumps start with 0x03, this changes to 0x05 after a few dumps. The
  reason for this is unknown

#### 0x0206

Request from master to start NFC communication. Payload always contains
19 `0x0` padding bytes, followed by `0xC80300393A737486000001` and
another 26 `0x0` padding bytes.

#### 0x0207

Request from master to write to NFC tag. The request packet already
contains the desired data to be written to the tag. Payload start with
two `0x00` padding bytes followed by the 7 ID bytes of the tag. These ID
bytes are used by the NFC adapter to check if same Amiibo is placed on
the NFC adapter again.

## Samples

NFC handshake beacons:

| Layer 1 packet                        | Layer 2 packet            | Layer 3 packet |
|---------------------------------------|---------------------------|----------------|
| `A5 00 08 73 FE A5 C4 A4 2C A4 20 F5` | `9A 9D D6 3A 01 E8 00 0C` | ␀              |
| `A5 00 08 D1 3E B7 7B B6 91 B6 9D 87` | `38 5D 66 45 01 EA 00 0C` | ␀              |
| `A5 00 08 09 58 23 36 22 DA 22 D6 AE` | `E0 3B 2A 6E 01 EC 00 0C` | ␀              |
| `A5 00 08 5E DD A4 A0 A5 4E A5 42 A8` | `B7 BE FA 7D 01 EE 00 0C` | ␀              |
| `A5 00 08 BC 19 C6 37 C7 C7 C7 CB 8B` | `55 7A 7A 2E 01 F0 00 0C` | ␀              |
| `A5 00 08 C9 15 F6 63 F7 91 F7 9D B2` | `20 76 3F 76 01 F2 00 0C` | ␀              |
| `A5 00 08 6E 48 47 1A 46 EE 46 E2 C7` | `87 2B 29 52 01 F4 00 0C` | ␀              |
| `A5 00 08 A2 8C E5 C3 E4 35 E4 39 74` | `4B EF 47 4F 01 F6 00 0C` | ␀              |
| `A5 00 08 26 1C 07 10 06 E8 06 E4 64` | `CF 7F 21 0C 01 F8 00 0C` | ␀              |
| `A5 00 08 7E 73 A2 3F A3 C5 A3 C9 FD` | `97 10 DC 4C 01 FA 00 0C` | ␀              |
| `A5 00 08 75 00 F3 B8 F2 44 F2 48 63` | `9C 63 86 B8 01 FC 00 0C` | ␀              |
| `A5 00 08 8D AC 0F D5 0E 2B 0E 27 72` | `64 CF 82 79 01 FE 00 0C` | ␀              |
| `A5 00 08 A3 55 7C 53 7D 52 7D 5E B2` | `4A 36 DF 06 01 01 00 0C` | ␀              |
| `A5 00 08 15 06 43 C0 42 C3 42 CF 85` | `FC 65 56 C6 01 03 00 0C` | ␀              |
| `A5 00 08 66 E0 9A 17 9B 12 9B 1E A0` | `8F 83 FC F7 01 05 00 0C` | ␀              |
| `A5 00 08 A4 35 09 97 08 90 08 9C 25` | `4D 56 AD A2 01 07 00 0C` | ␀              |
| `A5 00 08 73 E2 BD AF BC A6 BC AA 60` | `9A 81 CE 4D 01 09 00 0C` | ␀              |
| `A5 00 08 02 57 D7 B0 D6 BB D6 B7 28` | `EB 34 D5 E7 01 0B 00 0C` | ␀              |
| `A5 00 08 0D 79 01 AA 00 A7 00 AB 22` | `E4 1A 0C D3 01 0D 00 0C` | ␀              |
| `A5 00 08 14 91 04 B9 05 B6 05 BA B2` | `FD F2 10 28 01 0F 00 0C` | ␀              |
| `A5 00 08 2C 86 B1 49 B0 58 B0 54 C0` | `C5 E5 9D CF 01 11 00 0C` | ␀              |
| `A5 00 08 D5 1D DE DB DF C8 DF C4 F9` | `3C 7E 0B C6 01 13 00 0C` | ␀              |
| `A5 00 08 AF 75 DE 5C DF 49 DF 45 9C` | `46 16 71 29 01 15 00 0C` | ␀              |
| `A5 00 08 C8 E2 5B C6 5A D1 5A DD B5` | `21 81 93 24 01 17 00 0C` | ␀              |
| `A5 00 08 9B 51 68 2D 69 34 69 38 41` | `72 32 F3 7C 01 19 00 0C` | ␀              |
| `A5 00 08 13 7B 9F EF 9E F4 9E F8 32` | `FA 18 8C 94 01 1B 00 0C` | ␀              |
| `A5 00 08 A7 62 02 9C 03 81 03 8D BD` | `4E 01 A5 FE 01 1D 00 0C` | ␀              |
| `A5 00 08 39 06 94 36 95 29 95 25 09` | `D0 65 AD 30 01 1F 00 0C` | ␀              |
| `A5 00 08 32 4C D7 C0 D6 E1 D6 ED 92` | `DB 2F E5 8C 01 21 00 0C` | ␀              |
| `A5 00 08 83 BE F2 8F F3 AC F3 A0 B1` | `6A DD 71 31 01 23 00 0C` | ␀              |
| `A5 00 08 83 5E A0 57 A1 72 A1 7E F0` | `6A 3D 23 09 01 25 00 0C` | ␀              |
| `A5 00 08 6E C8 AD 69 AC 4E AC 42 D1` | `87 AB C3 A1 01 27 00 0C` | ␀              |
| `A5 00 08 C7 33 A1 2C A0 05 A0 09 FC` | `2E 50 66 1F 01 29 00 0C` | ␀              |

# External links

- [BCM2079x brief on Broadcom's
  website](https://www.broadcom.com/products/NFC/NFC-Solutions/BCM2079x-Family)
- [Python scripts to sniff and spoof IR communication between the NFC
  reader and 3DS using an IRda
  adapter](https://github.com/HubSteven/3ds_ir/)