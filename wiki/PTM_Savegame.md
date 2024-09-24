This page describes the contents of the [PTM](PTM "wikilink") module
savegame FS.

## Pedometer.dat

This contains the log of the total steps taken per day. Each entry
contains an u32 timestamp and an u16 for the total steps.

## PlayHistory.dat

This contains the play log for every title (including the Home Menu and
some system applets) launched on the system. The first entry in the file
is the oldest, the last entry is the newest. The file is always 0xD5DE8
bytes long, regardless of how many entries are in the file. There can be
no more than 0x11D28 entries.

| Offset | Size    | Description                                  |
|--------|---------|----------------------------------------------|
| 0x0    | 0x4     | Start entry index.                           |
| 0x4    | 0x4     | Total PlayHistory entries.                   |
| 0x8    | 0xD5DE0 | 0x11D28 PlayHistory entries, 0xC-bytes each. |

### Entry Structure

| Offset | Size | Description                                   |
|--------|------|-----------------------------------------------|
| 0x0    | 0x4  | TitleID-high                                  |
| 0x4    | 0x4  | TitleID-low                                   |
| 0x8    | 0x4  | Log info (Bits 1-4) and Timestamp (Bits 5-32) |

The first 4 bits in each entry after the TitleID are used for holding
information relating to what the log event represents. After this, all
log entries are marked with a 28-bit timestamp, measuring the number of
minutes since 2000-01-01. The theoretical maximum timestamp value is
2510-05-20 12:15:00.

#### Regular Log Entries

Most log entries represent an action in relation to a specific TitleID.
In this case, the lower 3 information bits are individual flags that
determine the exact action that was taken with the title. The 4th bit is
always 0 here. From least significant bit to most, they have the
following meanings:

| Bit | General Meaning                                                                                                                                         | When 0           | When 1         |
|-----|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|----------------|
| 1   | Whether the event represents an opening of something or the closing.                                                                                    | opening          | closing        |
| 2   | Whether the app in question is a Home Menu applet (e.g. the menu itself, game notes, etc.) or a full application (e.g. any game, system settings, etc). | full application | applet         |
| 3   | Whether the event corresponds to a resume/suspend or a launch/quit (suspend meaning going to the Home Menu without fully quitting an app).              | launch/quit      | resume/suspend |

Some examples (binary numbers are written with the most significant bit
**first**):

| Bits | Meaning                                                                                                  |
|------|----------------------------------------------------------------------------------------------------------|
| 0000 | Application was freshly launched                                                                         |
| 0101 | Application was suspended, but not closed (play time is paused)                                          |
| 0100 | Application was resumed after being suspended (should not increment No. of Times Played in Activity Log) |
| 0001 | Application was fully closed                                                                             |
| 0010 | Applet was freshly launched                                                                              |
| 0111 | Applet was suspended, but not closed                                                                     |
| 0110 | Applet was resumed after being suspended                                                                 |
| 0011 | Applet was fully closed                                                                                  |

#### Special Log Entries

Entries with TitleID FFFFFFFFFFFFFFFF (8 0xFF bytes) correspond to
special log events regarding the whole system, not just a single title.
All 4 information bits are used and should be interpreted as one number,
not as flags. They have the following meanings (binary numbers are
written with the most significant bit **first**):

| Bits | Meaning                                                                         |
|------|---------------------------------------------------------------------------------|
| 0000 | DS(i) backwards compatibility mode started                                      |
| 0001 | DS(i) backwards compatibility mode ended                                        |
| 0111 | Unknown, occurs just before "SAFE_MODE System Updater" launches                 |
| 1000 | Sleep mode started                                                              |
| 1001 | Sleep mode ended                                                                |
| 1010 | 3DS services stopped (happens at shutdown and also when launching DS Mode apps) |
| 1011 | Start of system clock change (timestamp corresponds to original time)           |
| 1100 | End of system clock change (timestamp corresponds to new time)                  |

#### Common Log Entry Patterns & Other Notes

- When the system boots into the Home Menu, it will make an initial log
  that the Home Menu was launched (0010).
- When a 3DS application is started, the Home Menu is first logged as
  suspended (0111), then the application is logged as launched (0000).
- When a 3DS application is suspended, it is logged as such (0101), then
  the Home Menu is logged as resumed (0110).
- Closing a 3DS application usually involves suspending it first, so
  closing an application will often follow the pattern: Application
  suspended (0101), Home Menu resumed (0110), Application closed (0001).
- Applications that close themselves without suspending first are logged
  as doing so (0001), then the Home Menu is logged as resumed (0110).
- The Home Menu fully closes before applets are launched, so starting an
  applet then closing it usually follows the pattern: Home Menu closed
  (0011), Applet launched (0010), Applet closed (0011), Home Menu
  launched (0010). Applets do not usually get suspended (with the
  exception of the Home Menu). Currently suspended applications do not
  get closed when an applet is launched.
- When the system is powered off, a special log entry with bits 1010 is
  written, even if no applications are currently running.
- Applications will usually have a log entry created specific to their
  TitleID to signify their closure (0001) if they are still running when
  the system is powered off. This comes before the special log entry
  with bits 1010 is written, however does not always happen, and never
  happens for the Home Menu. As such, a special log entry with bits 1010
  should be used as a sign to consider all 3DS applications terminated.
- Starting a DS(i) application logs the TitleID launch as normal (0000),
  but then also results in a special log with bits 1010 to be written
  (the same as when the system is powered off). This signifies that any
  and all running 3DS applications (including the Home Menu) have been
  terminated. A special log with bits 0000 is then written immediately
  afterwards, signifying the start of the DS(i) application running.
  Once the DS(i) application is closed, a special log with bits 0001 is
  written, signifying that the running application has stopped. DS(i)
  applications **do not** get a closure log specific to their TitleID
  written. If the DS(i) application is closed to the Home Menu, the Home
  Menu will be logged as freshly launched (0010) after the 0001 special
  log. If the power is turned off while a DS(i) application is running,
  the Home Menu will still be logged as launched, but it will be
  immediately followed by a 1010 special log.
- Occasionally, stray/unexpected logs do occur. These usually involve
  logging an application as entering a state its already in, for
  example: logging an application as suspended when it's already been
  suspended, logging as application as closed when it wasn't open,
  logging an application as resumed when it wasn't suspended, etc. These
  are usually safe to ignore, and most commonly afflict the Home Menu
  TitleID.
- Entering sleep mode does **not**, on its own, cause open apps to be
  logged as suspended.