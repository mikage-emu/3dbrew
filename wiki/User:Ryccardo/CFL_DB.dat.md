Format of the [Mii Maker](Mii_Maker "wikilink") main database, found in
shared extdata f0000000b

Header: 43464F47 "CFOG" 00010000

Mii format:

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Length</p></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x4</p></td>
<td><p>Mii ID (big-endian 32-bit unsigned integer)<br />
The most significant 3 bits determine whether the Mii is Special,
Foreign, or Normal <a
href="http://www.davidhawley.co.uk/special-miis-gold-pants-and-creating.aspx">1</a><br />
time_offset = (mii_id &amp; 0x0FFFFFFF) * 2;<br />
time_offset is the time the Mii was created, represented as the number
of seconds since 01/01/2010 00:00:00</p></td>
</tr>
<tr class="even">
<td><p>0x4</p></td>
<td><p>0x4</p></td>
<td><p>System ID (identifies owner, for purpose of enforcing editing
restrictions and blue pants). May not be the console's MAC, unlike on
Wii/DSi.</p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>0x1</p></td>
<td><p>Unknown (always 71?)</p></td>
</tr>
<tr class="even">
<td><p>0x9</p></td>
<td><p>0x1</p></td>
<td><p>Allow Copying (?) (A2=on?)</p></td>
</tr>
<tr class="odd">
<td><p>0xA</p></td>
<td><p>0x6</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="even">
<td><p>0x10</p></td>
<td><p>0x6</p></td>
<td><p>Creator's full MAC</p></td>
</tr>
<tr class="odd">
<td><p>0x16</p></td>
<td><p>0x2</p></td>
<td><p>Padding (0000)</p></td>
</tr>
<tr class="even">
<td><p>0x18</p></td>
<td><p>0x2</p></td>
<td><p>Bit-mapped: Birthday (4bit-day,5bit-month), Sex, Shirt,
??</p></td>
</tr>
<tr class="odd">
<td><p>0x1A</p></td>
<td><p>0x14</p></td>
<td><p>UTF-16 Mii Name (10 chars max, 0000 terminated)</p></td>
</tr>
<tr class="even">
<td><p>0x2E</p></td>
<td><p>0x2</p></td>
<td><p>width &amp; height</p></td>
</tr>
<tr class="odd">
<td><p>0x30</p></td>
<td><p>0x1</p></td>
<td><p>bit 0: disable sharing<br />
bit 1-4: face shape<br />
bit 5-7: skin color</p></td>
</tr>
<tr class="even">
<td><p>0x31</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-3: wrinkles<br />
bit 4-7: makeup</p></td>
</tr>
<tr class="odd">
<td><p>0x32</p></td>
<td><p>0x1</p></td>
<td><p>hair style</p></td>
</tr>
<tr class="even">
<td><p>0x33</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-2: hair color<br />
bit 3: flip hair</p></td>
</tr>
<tr class="odd">
<td><p>0x34</p></td>
<td><p>0x4</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="even">
<td><p>0x38</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-4: eyebrow style<br />
bit 5-7: eyebrow color</p></td>
</tr>
<tr class="odd">
<td><p>0x39</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-3: eyebrow scale<br />
bit 4-6: eyebrow yscale</p></td>
</tr>
<tr class="even">
<td><p>0x3A</p></td>
<td><p>0x2</p></td>
<td><p>note that the bytes are swapped over (little-endian layout)<br />
bit 0-3: eyebrow rotation<br />
bit 5-8: eyebrow x spacing<br />
bit 9-13: eyebrow y position</p></td>
</tr>
<tr class="odd">
<td><p>0x3C</p></td>
<td><p>0x1</p></td>
<td><p>Allow Copying (?)</p></td>
</tr>
<tr class="even">
<td><p>0x3D</p></td>
<td><p>0x3</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x40</p></td>
<td><p>0x1</p></td>
<td><p>Mii Sharing Value (?)</p></td>
</tr>
<tr class="even">
<td><p>0x41</p></td>
<td><p>0x7</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x48</p></td>
<td><p>0x14</p></td>
<td><p>UTF-16 Author Name (10 chars max, 0000 terminated)</p></td>
</tr>
</tbody>
</table>