+++
title = 'DARC'
categories = ["File formats"]
+++

This page documents the format of DARC.

## Overview

DARC files are archives. Containers of files.

This is very similiar to NARC (the DS archives).

## ARC header

| Offset | Size | Type      | Description                                                                      |
|--------|------|-----------|----------------------------------------------------------------------------------|
| 0x000  | 4    | char\[4\] | Magic Number 'darc'                                                              |
| 0x004  | 2    | uint16    | Endianess (=0xFFFE: Little)                                                      |
| 0x006  | 2    | uint16    | Header's length                                                                  |
| 0x008  | 4    | uint32    | Version                                                                          |
| 0x00C  | 4    | uint32    | File's length                                                                    |
| 0x010  | 4    | uint32    | [File table](DARC#File_table "wikilink") offset (from the beginning of the file) |
| 0x014  | 4    | uint32    | [File table](DARC#File_table "wikilink") length                                  |
| 0x018  | 4    | uint32    | [Files data](DARC#Files_data "wikilink") offset                                  |

### File table

The file table starts at 0x01C.

Each file struct consists of 3 uint32:

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x000</p></td>
<td><p>4</p></td>
<td><p>uint32</p></td>
<td><p>File name offset (from the end of the table)</p>
<p>if (offset &amp; 0x01000000) then this is a folder (i.e. first two
nodes 'null' &amp; '.')</p></td>
</tr>
<tr class="even">
<td><p>0x004</p></td>
<td><p>4</p></td>
<td><p>uint32</p></td>
<td><p>File offset</p></td>
</tr>
<tr class="odd">
<td><p>0x008</p></td>
<td><p>4</p></td>
<td><p>uint32</p></td>
<td><p>File length</p></td>
</tr>
</tbody>
</table>

- Folder's length is end-index of the folder in the table.

# Tools

- [1](https://github.com/yellows8/darctool)

[Category:File formats](Category:File_formats "wikilink")
