+++
title = 'ErrDisp'
+++

This system process handles displaying the error screens, such as "an
error has occurred, the system needs shutdown". This can also display a
register dump for exceptions, and info for fatal errors. (Normally the
black-screen errors are displayed on retail, while the latter is
displayed on development units.)

The register dump/fatal error info can also be written to
[nandrw/sys/native.log](nandrw/sys/native.log "wikilink"). On retail
consoles, the system does not notify ErrDisp that any user-land
exceptions occurred, ErrDisp is only notified for this on dev/debug
units. Therefore, on retail consoles native.log only contains info from
fatal errors. Starting with [5.0.0-11](5.0.0-11 "wikilink") ErrDisp no
longer writes logs to native.log, except when the error-type is value 5
and when other checks with the errorinfo structure are successful
(normally processes using this port never use error-type 5).

The bottom screen displays the error screen like "error has occurred",
even with a development 3DS. The top screen can display the development
error info, this is only displayed when
[ENVINFO](Configuration_Memory#envinfo "wikilink") bit0 is clear, for a
development 3DS.

ErrDisp handles "returning" to Home Menu via
[NSS:RebootSystem](NSS:RebootSystem "wikilink"), which triggers a
hardware system reboot.

# ErrDisp error port "err:f"

| Command Header | Description                                   |
|----------------|-----------------------------------------------|
| 0x00010800     | [Throw](ERR:Throw "wikilink")                 |
| 0x00020042     | [SetUserString](ERR:SetUserString "wikilink") |
