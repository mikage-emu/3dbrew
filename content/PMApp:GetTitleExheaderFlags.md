+++
title = 'PMApp:GetTitleExheaderFlags'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x00080100\]                                 |
| 1-4        | [Program Info](Filesystem_services#programinfo "wikilink") |

# Response

| Index Word | Description                                                                                                      |
|------------|------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                      |
| 1          | Result code                                                                                                      |
| 2-3        | [ARM11 Local System Capabilities](NCCH/Extended_Header#arm11_local_system_capabilities "wikilink") bytes 0x8-0xF |
| 4-5        | [System Control Info](NCCH/Extended_Header#system_control_info "wikilink") bytes 0x8-0xF                         |

# Description

This outputs the [ARM11 Local System
Capabilities](NCCH/Extended_Header#arm11_local_system_capabilities "wikilink")
"Core Version", "Flag1 and Flag2", "Flag0", and "Priority" fields. In
newer PM-module versions, this also outputs the [System Control
Info](NCCH/Extended_Header#system_control_info "wikilink") "Reserved",
"Flag", and "Remaster Version" fields.

This returns result code 0xC8A05801 if
[PMApp:PrepareForReboot](PMApp:PrepareForReboot "wikilink") has been
called.
