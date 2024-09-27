+++
title = 'NTRCARD Registers'
+++

## Registers

These registers are similar to the old NDS Cartridge registers, check
<http://problemkaputt.de/gbatek.htm#dscartridgeioports> for more
information.

| NAME               | PHYSICAL ADDRESS | WIDTH |
|--------------------|------------------|-------|
| REG_NTRCARDMCNT    | 0x10164000       | 2     |
| REG_NTRCARDMDATA   | 0x10164002       | 2     |
| REG_NTRCARDROMCNT  | 0x10164004       | 4     |
| REG_NTRCARDCMD     | 0x10164008       | 8     |
| REG_NTRCARDSEEDX_L | 0x10164010       | 4     |
| REG_NTRCARDSEEDY_L | 0x10164014       | 4     |
| REG_NTRCARDSEEDX_H | 0x10164018       | 1     |
| REG_NTRCARDSEEDY_H | 0x1016401A       | 1     |
| REG_NTRCARDFIFO    | 0x1016401C       | 4     |

## REG_NTRCARDMCNT

| Bit | Description                            |
|-----|----------------------------------------|
| 14  | Interrupt enable (1=Enable, 0=Disable) |
| 15  | Enable (1=Enable, 0=Disable)           |

## REG_NTRCARDROMCNT

| Bit | Description                   |
|-----|-------------------------------|
| 23  | Data status (1=Ready, 0=Busy) |
| 31  | Start (1=Busy, 0=Idle)        |
