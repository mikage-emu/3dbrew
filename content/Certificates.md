+++
title = 'Certificates'
+++

## Overview

Certificates contain cryptography information for verifying Signatures.
These certificates are also signed. The parent/child relationship
between certificates, makes all the certificates effectively signed by
'Root', the public key for which is stored in NATIVE_FIRM.

## Format

| Offset   | Size | Description                                                                      |
|----------|------|----------------------------------------------------------------------------------|
| 0x0      | 0x4  | Signature Type                                                                   |
| 0x4      | X    | Signature with Padding (aligning next data to 0x40 bytes)                        |
| 0x4 + X  | 0x40 | Issuer                                                                           |
| 0x44 + X | 0x4  | Key Type                                                                         |
| 0x48 + X | 0x40 | Name                                                                             |
| 0x88 + X | 0x4  | Expiration time as UNIX Timestamp, used at least for [CTCert](CTCert "wikilink") |
| 0x8C + X | \*   | Public Key                                                                       |

## Signature

The signature method used to sign the certificate can be determined by
checking the Signature Type:

The hash for the signature is calculated over the actual certificate
data(from the start of the "Issuer", to the end of the "Public Key",
aligned to 0x40 bytes).

## Public Key

Determining the type of public key stored, is done by checking the key
type:

| Value | Key Type       |
|-------|----------------|
| 0x0   | RSA_4096       |
| 0x1   | RSA_2048       |
| 0x2   | Elliptic Curve |

### RSA

This contains the Public Key(i.e. Modulus & Public Exponent)

#### 4096 Bit

| Offset | Size  | Description     |
|--------|-------|-----------------|
| 0x0    | 0x200 | Modulus         |
| 0x200  | 0x4   | Public Exponent |
| 0x204  | 0x34  | Padding         |

#### 2048 Bit

| Offset | Size  | Description     |
|--------|-------|-----------------|
| 0x0    | 0x100 | Modulus         |
| 0x100  | 0x4   | Public Exponent |
| 0x104  | 0x34  | Padding         |

### ECC

This contains the ECC public key, and is as follows:

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x3C | Public Key  |
| 0x3C   | 0x3C | Padding     |
