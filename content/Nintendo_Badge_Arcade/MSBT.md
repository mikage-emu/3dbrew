+++
title = 'MSBT'
+++

Nintendo Badge Arcade uses `MSBT` files for Badge Bunny's dialog and
animations

This page will only cover `MSBT` control tags specific to Nintendo Badge
Arcade. For more details on `MSBT` files in general, refer to
<https://github.com/kinnay/Nintendo-File-Formats/wiki/MSBT-File-Format>
and <https://mk8.tockdom.com/wiki/MSBT_(File_Format)>

<span id="location"></span>

## Location

Nintendo Badge Arcade's `MSBT` files are loaded using `BOSS`. A large
`SARC` archive file is downloaded which holds all the games data. Inside
this `SARC` file, the `MSBT` files are stored in
```
/message/boss_REGION/LANG/slotID
```

<span id="format"></span>

## Format

`MSBT` control tags have the following format

| Offset | Size      | Description                 |
|--------|-----------|-----------------------------|
| 0x0    | 0x2       | **Magic**. Always **0E00**. |
| 0x2    | 0x2       | Tag group ID                |
| 0x4    | 0x2       | Tag ID                      |
| 0x6    | 0x2       | Data size                   |
| 0x8    | Data size | Data                        |

<span id="tag-groups"></span>

## Tag Groups

Nintendo Badge Arcade uses the following known tag groups:

| Tag group ID | Description     |
|--------------|-----------------|
| 2            | Badge Bunny (?) |

<span id="tags"></span>

## Tags

The following is an incomplete list of the tag groups tags, with names
describing each tag type

<span id="badge-bunny"></span>

### Badge Bunny (?)

Tag group ID `2`

| Tag ID | Name        | Data format                      |
|--------|-------------|----------------------------------|
| 0x0    | Play Action | Action ID. See below for details |

<span id="badge-bunny-actions"></span>

#### Badge Bunny Actions

The following is an incomplete list of the action datas, with names
describing each, and a preview of their animations. They are in no
particular order.

| Action ID  | Name             | Preview                           |
|------------|------------------|-----------------------------------|
| `121414CD` | Flames           | <https://i.imgur.com/XJOXecm.gif> |
| `111313CD` | Pounce           | <https://i.imgur.com/yF5kIhz.gif> |
| `00302ECD` | Shocked          | <https://i.imgur.com/yUopyml.gif> |
| `003432CD` | Disappointed     | <https://i.imgur.com/Gg71ww3.gif> |
| `030505CD` | Shake My Hand    | <https://i.imgur.com/0koci1z.gif> |
| `181F1FCD` | Chop Explain     | <https://i.imgur.com/usfbqcq.gif> |
| `002020CD` | Laugh (Small)    | <https://i.imgur.com/eLgzpfm.gif> |
| `192121CD` | Laugh (Slapping) | <https://i.imgur.com/YR47psp.gif> |
| `002828CD` | Head Shake       | <https://i.imgur.com/OUbeKS5.gif> |
| `1D2727CD` | Clap Explain     | <https://i.imgur.com/tCnWOdJ.gif> |
| `020404CD` | Awkward          | <https://i.imgur.com/jO6Mlfo.gif> |
| `003937CD` | Flushed          | <https://i.imgur.com/ue2vopA.gif> |
| `001B1BCD` | Shimmer          | <https://i.imgur.com/PotZ3LP.gif> |
| `000000CD` | Arms Crossed     | <https://i.imgur.com/G7VYCsu.gif> |
| `001818CD` | Clapping         | <https://i.imgur.com/fopecNR.gif> |
| `1E2A2ACD` | Right Hand Slap  | <https://i.imgur.com/fnICcPG.gif> |
| `171D1DCD` | Music Note Burst | <https://i.imgur.com/QXchrzO.gif> |

<span id="recommended-color-values"></span>

## Recommended Color Values

These values are recommended for text coloration, as it is what official
text is colored as. These are ***not*** restrictions

Format is RGBA. Alpha is ignored by Nintendo Badge Arcade and is always
set to `FF`

<table>
<thead>
<tr class="header">
<th><p>Color</p></th>
<th><p>Value</p></th>
<th><p>Note</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Red</p></td>
<td><p><code>FF0000FF</code></p></td>
<td><p>Used for general highlighting,<br />
and game names in the Miiverse Gallery.</p></td>
</tr>
<tr class="even">
<td><p>Green</p></td>
<td><p><code>009B00FF</code></p></td>
<td><p>Rarely used, but mainly for the Miiverse Gallery.</p></td>
</tr>
<tr class="odd">
<td><p>Blue</p></td>
<td><p><code>0000FFFF</code></p></td>
<td><p>Usually used for character names,<br />
and themes in the Miiverse Gallery.</p></td>
</tr>
</tbody>
</table>

<span id="examples"></span>

## Examples

Below are raw hex blocks of example messages, and what they appear as.

<span id="color-example"></span>

### Color Example

<div class="figure">

<figure>
<img src="../../Nba-example-color.png" title="Color Example" />
<figcaption>Color Example</figcaption>
</figure>

</div>

    4E 00 6F 00 72 00 6D 00 61 00 6C 00 20 00 0E 00
    00 00 03 00 04 00 FF 00 00 FF 52 00 65 00 64 00
    20 00 0E 00 00 00 03 00 04 00 00 9B 00 FF 47 00
    72 00 65 00 65 00 6E 00 20 00 0E 00 00 00 03 00
    04 00 00 00 FF FF 42 00 6C 00 75 00 65 00 00 00

------------------------------------------------------------------------

<span id="font-scale-example"></span>

### Font Scale Example

<div class="figure">

<figure>
<img src="../../Nba-example-scale.png" title="FS Example" />
<figcaption>FS Example</figcaption>
</figure>

</div>

    44 00 65 00 66 00 61 00 75 00 6C 00 74 00 20 00
    0E 00 00 00 02 00 02 00 74 00 53 00 69 00 7A 00
    65 00 20 00 37 00 34 00 20 00 0E 00 00 00 02 00
    02 00 54 00 53 00 69 00 7A 00 65 00 20 00 35 00
    34 00 20 00 0E 00 00 00 02 00 02 00 34 00 53 00
    69 00 7A 00 65 00 20 00 33 00 34 00 00 00