+++
title = 'PXI Services'
+++

# PXI Services

The 'pxi' sysmodule contains the following services:

- [PxiFS0](Filesystem_services_PXI "wikilink")
- [PxiFS1](Filesystem_services_PXI "wikilink")
- [PxiFSB](Filesystem_services_PXI "wikilink")
- [PxiFSR](Filesystem_services_PXI "wikilink")
- [PxiPM](Process_Manager_Services_PXI "wikilink")
- [pxi:am9](Application_Manager_Services_PXI "wikilink")
- [pxi:dev](Gamecard_Services_PXI "wikilink")
- [pxi:mc](Development_Services_PXI "wikilink")
- [pxi:ps9](Process_Services_PXI "wikilink")

Each of these services has up to 4 static IPC buffers of size 0x1000.
When any of these service ports are sync:d, the IPC cmdbuf (TLS+0x80+)
is sent over [PXI](PXI_Registers "wikilink") to the ARM9.

Each PXI service can only have one session open for it at a time.

# Protocol

The communication protocol for normal PXI commands is documented below.
The size of cmd_buf is calculated from the cmd_hdr. With newer FIRM the
total size for command header + buffer must be at most 0x40 words,
otherwise Process9 will panic.

The PXI protocol is bidirectional - both processors can host a PXI
service for a given pxi_id. In practice, Process9 hosts all but one of
the services (pxi_11 is hosted by pxi-module instead). Each pxi_id
corresponds to a PXI command-handler(called from threads) which handles
the actual command processing. With newer FIRM the pxi_id must be in a
certain range.

There's a dedicated Process9 thread for receiving data from PXI(in newer
FIRM this is the main-thread), once it finishes receiving a request it
copies the cmd_buf into a buffer for the corresponding pxi_id then
signals an event so that the cmd-handler thread can process it. Once a
cmd-handler thread finishes processing a command, the thread itself then
sends the response over PXI. This means that multiple commands for
different pxiIDs can be be handled at the same time, even when one
cmd-handler completely hangs/etc for example.

Process9 will execute [svcBreak](SVC "wikilink") when it receives a PXI
command with a pxi_id where another command with that same pxi_id is
still being processed by the command-handler(this won't happen with
commands sent by the ARM11 PXI-module, since it waits for the command
reply before sending another command request for that same pxi_id).

# PXI service "pxi_11"

| Command Header | Description                                                                                                                                                                                                                                                |
|----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00010040     | PublishToSubscriber - this exposes ["srv:" notifications](Services "wikilink") to the Process9-side using [SRV:PublishToSubscriber](SRV:PublishToSubscriber "wikilink") (with flags=1), to allow sending card-insert notifications etc. directly to ARM11. |

## Request

```
A11->A9 (u32) pxi_id
A11->A9 (u32) cmd_hdr
A11->A9 (u32[]) cmd_buf
```

## Response

```
A9->A11 (u32) pxi_id
A9->A11 (u32) cmd_hdr
A9->A11 (u32[]) cmd_buf
```

## pxi_id

```
0 = pxi_mc
1 = pxi_fs
2 = pxi_fs
3 = pxi_fs
4 = pxi_fs
5 = pxi_pm
6 = pxi_dev
7 = pxi_am
8 = pxi_ps
9 = pxi_11
```