# Request

| Index Word | Description                                                          |
|------------|----------------------------------------------------------------------|
| 0          | Header code \[0x00150082\]                                           |
| 1          | Interrupt                                                            |
| 2          | Channel                                                              |
| 3          | 0x0                                                                  |
| 4          | Event handle (0 = unregister the event that was previous registered) |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150040\] |
| 1          | Result code                |

# Description

Application should unregister the event by setting handle to zero. If
the session was closed before the event was unregistered, it will cause
a handle leak in DSP process.

DSP can hold up to 6 concurrent registrations. More than that will cause
registration to fail.

Interrupts with interupt=2 are related to
[pipes](DSP:WriteProcessPipe "wikilink"). The channel argument is the
same as the pipe channel argument. The interrupt is signalled when data
is available on the related pipe or when a related event occurs.