+++
title = 'Anti Time Travel'
+++

Many commercial games, such as Tomodachi Life, all Pokèmon games, etc
are capable of **telling whether the clock was adjusted** while they
weren't running, **even for realistic progress of time** (new setting in
the future from last save).

This is achieved through a peculiarity in the implementation of the real
time clock.

The hardware RTC can count between (at least) 2001-1-1 and 2050-12-31.

When the time is normally set, the console saves to the [Config
Savegame](Config_Savegame "wikilink") the number of seconds of
difference between the actual time and the RTC value.


This also explains the apparently random setting of the date after
removing the battery, and why adjusting the clock in [multiboot
scenarios](NAND_Redirection "wikilink") often results in incorrect
values in other OS instances.

Most likely, software disturbed by clock adjustments saves the raw RTC
value and, on load, checks whether it has advanced.
[CONFIG](3DS_Development_Unit_Software "wikilink") can directly adjust
the hardware clock, thus avoiding associated problems.
