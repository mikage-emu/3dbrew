+++
title = 'NSS:LaunchTitle'
+++

# Request

| Index Word | Description                                               |
|------------|-----------------------------------------------------------|
| 0          | Header code \[0x000200C0\]                                |
| 1-2        | u64, Title ID                                             |
| 3          | [Launch Flags](PMApp:LaunchTitle#launch_flags "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Process ID  |

# Description

This is a wrapper for [PMApp:LaunchTitle](PMApp:LaunchTitle "wikilink").
The [MediaType](Filesystem_services#mediatype "wikilink") is determined
by the input title ID. The [Game Card
MediaType](Filesystem_services#mediatype "wikilink") is used when the
input title ID is zero. The [NAND
MediaType](Filesystem_services#mediatype "wikilink") is used when the
input title ID has the content category system flag set, otherwise the
[SD MediaType](Filesystem_services#mediatype "wikilink") is used.

The [launch flags](PMApp:LaunchTitle#launch_flags "wikilink") passed to
[PMApp:LaunchTitle](PMApp:LaunchTitle "wikilink") have bit 0 cleared
(normal application) and bit 1 set (load dependencies)

Home Menu only uses this command for launching system modules.

This won't relaunch titles which are already running(PID won't change),
hence this can also be used to get the PID of already running processes.
