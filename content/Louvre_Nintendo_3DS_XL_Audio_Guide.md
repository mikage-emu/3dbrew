+++
title = 'Louvre Nintendo 3DS XL Audio Guide'
+++

The famous French museum "Louvre" is also famous for [using heavily
modified old 3DS XL units as audio- (and 3D photo-)
guides](https://www.louvre.fr/en/museum-audio-guide) (although the
picture on that website shows a small O3DS...).

The multimedia application - the guide itself - is also available (in
single-language versions, unlike the museum version) to the public on
the eShop, as well as in the museum's shop (holding the questionable
awards of being the least-retail-availability game card intended for
sale to the public, as well as the only truly region-free game card!)

The console itself, instead, is allegedly very heavily modified from a
retail one, in both hardware and software:

## GBArl sighting

*By Paper et al on www.gbarl.it on 2015-1-30 (topic deleted for no clear
reason) - [Pictures](https://imgur.com/a/W1TYh)*

It does not have working speakers (speculation is that they have been
disconnected or outright missing - although standby has been reported as
working, as earphones are included in the 5 € rental).

It's been speculated it may lack infrared and/or WiFi (the latter claim
is incorrect, according to the few pictures of both reporters).

The wifi enabling button is fake or at least glued in place.

It includes a minimal OS requiring a (specific?) "game"card to do
anything visible, in which case it appears to just autoboot it

The console contained a **CTR Guide Boot Card** (LNA-CTR-AAAP-EUR),
which probably acts as just a dongle (it can be removed safely "10
seconds after loading completes"), and an SD card (Panasonic, 32 GB,
with a cut-off sticker and another yellow-circle one on top of it)
containing configuration files, logs, and software.

Inserting the card in another 3DS resulted in 173968 megabits free being
displayed, and no titles installed (although Paper was probably unaware
of the fact [consoles with different movable.seds will look for titles
in different folders](SD_Filesystem "wikilink")).

The software on the gamecard attempts to connect to a **CGBL_WAP000**
network (whose password may be 0123456789012), and tries to communicate
with a local webserver. It also runs the software from the SD (whether
or not the network was found - at least for a limited amount of time or
attempts)

## GBX sighting

*By Silver_Johnes on [gbx.ru](http://gbx.ru/?showtopic=111301&st=2660#)
on 2017-10-13*

Allegedly bricked (but Silver_Jones does not appear to know about the
boot card)

Contents of SD root: <https://yadi.sk/i/IWFABPV33Njg6K>

Content of config.txt:
`CGI_URL=`[`http://10.0.128.123/cgbl/cgi-bin/,SETTING_URL=http://10.0.128.123/cgbl/Data/Setting/`](http://10.0.128.123/cgbl/cgi-bin/,SETTING_URL=http://10.0.128.123/cgbl/Data/Setting/)` ,HTTP_AP_SSID=CGBL_WAP000,HTTP_AP_BSSID=4CE676A90828,HTTP_AP_KEY=0123456789012,L OG_DIR_NAME=upload/,LOG_DIR_CGI_URL=`[`http://10.0.128.123/cgbl/cgi-bin/logDirSendSuccess.rb,CGBL_URL=http://10.0.128.123/cgbl/Data/CGBL.cia`](http://10.0.128.123/cgbl/cgi-bin/logDirSendSuccess.rb,CGBL_URL=http://10.0.128.123/cgbl/Data/CGBL.cia)

Content of CGBL_VER.txt: `06.40`
