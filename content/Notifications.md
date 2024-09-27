+++
title = 'Notifications'
+++

The Notifications applet allows users to view their SpotPass and
StreetPass notifications. The LED for notifications turns green when a
new StreetPass notification arrives, blue when a SpotPass notification
arrives. The icon in the HOME Menu can have a green dot when there are
unread StreetPass notifications, or a blue dot when there are unread
SpotPass notifications.

The main screen of the Notifications applet displays the number of
unread notifications on the upper screen. The list on the lower screen
displays notification titles and icons. Unread notifications are marked
with an icon indicating their unread status.

### Specifications

Notifications must include both a title and body text. The notification
title has a maximum of 31 character per line. If the text exceeds the
maximum display width, the character size can be reduced by a maximum of
20%. If the text still exceeds the display width, overflowing characters
are not shown. The notification body can contain up to 3000 UTF-16LE
characters, including the NULL terminator. LF is used only for newline
characters.

Some notifications can have optional attachments, such as an URL or
image. URLs can have a maximum of 1024 UTF-8 characters. The body will
have a maximum of 3000 UTF-16 characters minus the URL. The image must
have a resolution of 400×240 pixels, in JPEG or MPO format, 50KB
maximum.
