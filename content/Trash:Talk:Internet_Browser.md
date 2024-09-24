I have created a simple page that when opened in the browser freezes the
3DS system. I assume that too much memory is allocated to the JavaScript
engine. This freeze can only be fixed by turning the system off and on
again, but the communication switch works during this freeze. This is
the page:
<https://dl-web.dropbox.com/get/Public/alerttest.html?w=88d076e5>
[R4wrz0rz0r](User:R4wrz0rz0r "wikilink") 14:57, 20 June 2011 (CEST) I
cannot access your page.you should make a public link from dropbox menu.

Sorry, I thought putting it in the Public folder would just make it
work: <http://dl.dropbox.com/u/18757478/alerttest.html>
[R4wrz0rz0r](User:R4wrz0rz0r "wikilink") 00:56, 21 June 2011 (CEST)
Here's a shortened link: <http://tinyurl.com/4x4u69o>
[Kiddyshaq34](User:Kiddyshaq34 "wikilink")

I think it is not so easy because this browser using Apple Webkit.

I don't think this is exploitable in any way. To me, seems more like
NULL pointer dereferencing. Here's my full theory, may be wrong tho:

- the Javascript engine doesn't allocate memory for strings that are too
  long, but still keeps track of their length. (try generating a 2^31
  characters long string, alert()'ing it shows an empty alert, however
  its length returns the expected value)
- such strings point to NULL instead of pointing to a memory buffer with
  characters. Their size is checked before trying to read them to
  display them in an alert.
- now, if you generate a 2^32 string, the length of the string is
  0x100000000 characters. This value gets cut off to zero because it
  doesn't fit in a 32bit integer. Therefore the length property of the
  string is zero.
- when trying to alert() this string, the security check described above
  does infact "0 \< maxlength", so the string is considered short enough
  to be displayed. However, since it was made from strings being already
  too large, its pointer is NULL.
- the browser tries to read from NULL, causing an exception. Probably
  said exception would trigger special stuff on dev/debug units, but was
  set to just enter an endless loop on retail units.

Long story short, nothing gets overwritten. Just an attempt at using a
NULL pointer. This is only a theory though, I may be wrong.
--[Luigi2us](User:Luigi2us "wikilink") 01:40, 13 August 2011 (CEST)

It seems to be not exploitable, I have tried to write some NOPs into
memory after the 'exploit' code and it doesn't seem to
work.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 18:37, 11
September 2011 (CEST)

Well I have seen a Google Chrome exploit that uses a null pointer. It
executes the nopsled and the shellcode so that it generates an
exception. I think that if you try that exploit on Chrome on your
computer, it still works(I tried it on version 15.0.865.1000 with
sandbox disabled, and it generated an exception(a few times). So I think
that's a sign that Google and the Chromium team still haven't fixed the
exploit yet, but my antivirus detects it). But what I said might be
wrong and misleading. And sometimes null pointer dereferencing can be
exploitable if you try and think harder.
--[Kiddyshaq34](User:Kiddyshaq34 "wikilink") 22:00, 03 September 2011
(GMT)

I am not sure if this is any help, but browsing to this page
<http://bit.ly/qV82en> in the 3DS browser, causes the page to take an
age to load... (around 5 mins), when the page does finally load you can
see dots, scrolling down a few times till you see symbols instead of
dots, then tapping the lower screen causes a load of pop unders. I had
tried other Android based exploits, that were all thrown out (page to
big errors), but this one seems different. viewing some pop unders (ones
with target like icons) cause some to close and more to open...

The exploit used can be seen here...
<http://www.exploit-db.com/exploits/16974/>
--[Madshaun1984](User:Madshaun1984 "wikilink") 23:27, 01 September 2011
(GMT) I've got a link if anyone wants to try it out:
<http://db.tt/D3hmZJE> --[Kiddyshaq34](User:Kiddyshaq34 "wikilink")
23:19, 02 September 2011 (GMT)

Not to mention, the 3DS hardware is surely a lot different from
Android/phones. Scriptkiddyish attempts like running Android exploits on
a 3DS will not work. --[Luigi2us](User:Luigi2us "wikilink") 15:35, 2
September 2011 (CEST)

That Android shellcode is crap for the 3DS. Also the memory map should
be different. BTW: How can we find out the memory map like ROM area,
display memory, ... ? --[Lazymarek9614](User:Lazymarek9614 "wikilink")
20:00, 2 September 2011 (CEST)

The webkit has a lot of android based code in it... therefore it is not
unreasonable to think that maybe (just maybe) and android based exploit
would have an effect on the 3DS. My assumptions werent just based on the
browsers webkit either... what other platforms do you know that run on
arm cpu's and use the .APP file extension? Then theres the whole QR code
compatibility, that seems all to similar to pre-existing android
software... Now dont get me wrong im not suggesting that the 3DS is
running android, but it seems to be some sort of hybrid that has some
compatibility with android, of course my assumptions and theory's could
be well off... but i'll leave it to you to prove me wrong.
--[Madshaun1984](User:Madshaun1984 "wikilink") 19:02, 02 September 2011
(GMT)

And again a boring way freeze the web browser:
<http://dl.dropbox.com/u/41173070/3ds_web_browser_freeze_click.html>
--[Lazymarek9614](User:Lazymarek9614 "wikilink") 18:03, 13 September
2011 (CEST) Here's a shortened link: <http://tinyurl.com/6enaawc>
--[Kiddyshaq34](User:Kiddyshaq34 "wikilink") 20:15, 13 September 2011
(BST)