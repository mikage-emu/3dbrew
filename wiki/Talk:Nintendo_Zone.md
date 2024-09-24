--[Yellows8](User:Yellows8 "wikilink") 03:58, 9 June 2011 (CEST) If
there's an USA Best Buy NZone nearby you and you can either capture it
via laptop or have a DS /w flashcard, /msg yellows8 on IRC EFnet
\#3dsdev. Note that it's extremely unlikely NZone is exploitable since
with DSi all comms were HTTPS,(let alone 3DS uses a NetFront version
without the old html parsing bugs) this is just for accessing the server
at home from both 3DS and laptop.



[Yellows8](User:Yellows8 "wikilink") 19:36, 10 June 2011 (CEST) Some
NZone captures were obtained, no more captures are needed.

Some kind of Nintendo Information Terminals use Windows Server
2008?,Vista or 7.

I saw a terminal returned Internet Explorer's error code.--Matyapiro31
04:19, 6 February 2012 (CET)


Huh? The USA NZone server uses Apache. "Server: Apache/2.2.16 (Unix)"
--[Yellows8](User:Yellows8 "wikilink") 04:26, 6 February 2012 (CET)

I explain about "ニンテンドーおさがしガイド" in Japan.


You mentioned "NZone server" in your edit summary, those terminals are
\*not\* servers. --[Yellows8](User:Yellows8 "wikilink") 20:06, 6
February 2012 (CET)

<figure>
<img src="Head_photo1.jpg" title="File:Head photo1.jpg" />
<figcaption><a href="File:Head">File:Head</a> photo1.jpg</figcaption>
</figure>

-- The Cloud WiFi --

Can be "WiFi Zone - The Cloud" also (based on
<https://www.thecloud.net/free-wifi/support/faqs/>)
--[Elisherer](User:Elisherer "wikilink") 16:34, 25 April 2012 (CEST)

--[LuigiBlood](User:LuigiBlood "wikilink") 20:27, 25 April 2012 (CEST) A
friend of mine (Prof. 9) recently tested "_The Cloud" as SSID, and it
works, and has access to the Europe Nintendo Zone. MAC filtering can be
enabled.

"_The Cloud" SSID is still usable by european consoles without a
beacon, but was deleted from the list --[Duke
srg](User:Duke_srg "wikilink") 07:53, 14 May 2012 (CEST) On the other
hand, some hotspots from a list is not usable without a beacon at least.
--[Duke srg](User:Duke_srg "wikilink") 22:14, 14 May 2012 (CEST)

## hotspot.conf for fw9

Is it possible to get hotspot.conf from fw9? Really need this one to
maintain the homepass scripts --[Duke srg](User:Duke_srg "wikilink")
08:22, 14 October 2014 (CEST) Any chance hotspot.conf info will be
updated with fw 9.3 changes? --[Duke srg](User:Duke_srg "wikilink")
21:28, 9 December 2014 (CET)


I thought of doing some sort of hotspot.conf parser which would be
located somewhere under [1](http://yls8.mtheall.com), with certain data
stripped out, but I haven't bothered yet(upload hotspot.conf files
myself -\> server lets the site visitors see the extracted data).
--[Yellows8](User:Yellows8 "wikilink") 22:44, 10 December 2014 (CET)


I already have the parser in Perl with the exact BASE64 alphabet
sequence and able to host the decoder online or provide it for you to
use on that host. I actually do not have any exploitable or dev unit to
rip the actual data. As long as I manintan one of the homepass script
implementation I always need the up to date hotspot list with the flags.
Diff patch from the previous version will be enough --[Duke
srg](User:Duke_srg "wikilink") 10:50, 11 December 2014 (CET)


Paste your script then. --[Yellows8](User:Yellows8 "wikilink") 17:35, 11
December 2014 (CET)



`   #!/usr/bin/perl`
`   use strict;`
`   use MIME::Base64 qw( decode_base64 );`
`   open INFILE,$ARGV[0] or die;`
`   my @res;`
`   while (`<INFILE>`) {`
`       if ($_ =~ /.*,\d,\d$/) {`
`           @res = split(',',$_);`
`           $res[3] =~ s/\./+/gs;`
`           $res[3] =~ s/-/\//gs;`
`           $res[3] =~ s/\*/=/gs;`
`           $res[3] = decode_base64($res[3]);`
`           $res[3] =~ s/(.)/sprintf("%02X",ord($1))/egs;`
`           $res[3] = "";`
`           $res[5] = "";`
`           printf "%s,%s,%s,%s", decode_base64(shift(@res)),decode_base64(shift(@res)),decode_base64(shift(@res)),join(',',@res);`
`       }else{`
`           print $_;`
`       }`
`   }`
`   close INFILE;`

Will open file specified as a parameter and print the result with base64
decoded strings and key date inf hex string format. --[Duke
srg](User:Duke_srg "wikilink") 18:18, 11 December 2014 (CET)


"with certain data stripped out" \<- I was referring to the ApNum and
SecurityKey field values. --[Yellows8](User:Yellows8 "wikilink") 18:42,
11 December 2014 (CET)


Fixed with blank values --[Duke srg](User:Duke_srg "wikilink") 18:57, 11
December 2014 (CET)