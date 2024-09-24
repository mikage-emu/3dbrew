+++
title = 'Circle Pad Pro'
+++

Also known as CTR-009, it sends the commands to the console through the
IR interface on the back of the console.

[Pictures of its
contents](http://what-games.golog.jp/archives/1350330.html).

## Usage Instructions

<figure>
<img src="Circle_pad_pro_instructions.jpg"
title="File:Circle pad pro instructions.jpg" />
<figcaption><a href="File:Circle">File:Circle</a> pad pro
instructions.jpg</figcaption>
</figure>

## IR Protocol

Communications with this device is done via the
[ir:USER](IR_Services "wikilink") service, which uses obfuscation
implemented in software. The [bitrate-value](IRU:SetBitRate "wikilink")
passed to IRUSER is 0x04, hence the actual bps is 96000.

The application sends requests via
[IRUSER:SendIrnop](IRUSER:SendIrnop "wikilink") and receives response
from Circle Pad Pro via
[IRUSER:ReceiveIrnop](IRUSER:ReceiveIrnop "wikilink") (or read data from
the [shared memory](IRUSER_Shared_Memory "wikilink")). The request and
response data structures below are payloads in packets. Each request
begins with a one-byte ID that determines the request type.

### Request 1: Read Input

Request (3 bytes):

| offset | Size | Description                |
|--------|------|----------------------------|
| 0x0    | 0x1  | Request ID (fixed value 1) |
| 0x1    | 0x1  | Response period in ms      |
| 0x2    | 0x1  | Unknown                    |

Response (6 bytes): This Response will be sent repeatedly by the
specified period.

<table>
<thead>
<tr class="header">
<th><p>offset</p></th>
<th><p>Size</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x1</p></td>
<td><p>Response ID? Fixed value 0x10</p></td>
</tr>
<tr class="even">
<td><p>0x1</p></td>
<td><p>0x3</p></td>
<td><p>Right circle pad position. This three bytes are two little-endian
12-bit fields. The first one is for x-axis and the second one is for
y-axis.</p></td>
</tr>
<tr class="odd">
<td><p>0x4</p></td>
<td><p>0x1</p></td>
<td><p>bit[0:4] battery level? bit[5] ZL button</p>
<p>bit[6] ZR button</p>
<p>bit[7] R button</p>
<p>Note that for the three button fields, the bit is set when the button
is NOT pressed.</p></td>
</tr>
<tr class="even">
<td><p>0x5</p></td>
<td><p>0x1</p></td>
<td><p>Unknown</p></td>
</tr>
</tbody>
</table>

### Request 2: Read Calibration Data?

Request (6 bytes):

| offset | Size | Description                     |
|--------|------|---------------------------------|
| 0x0    | 0x1  | Request ID (fixed value 2)      |
| 0x1    | 0x1  | Expected response time in ms?   |
| 0x2    | 0x2  | Data offset? (aligned to 0x10?) |
| 0x4    | 0x2  | Data size (aligned to 0x10?)    |

Response (5 bytes + requested size)

| offset | Size      | Description                      |
|--------|-----------|----------------------------------|
| 0x0    | 0x1       | Response ID? Fixed value 0x11    |
| 0x1    | 0x2       | Data offset? Same as Request+0x2 |
| 0x3    | 0x2       | Data size. Same as Request+0x4   |
| 0x5    | data size | calibration data?                |

### Request 3

Request (22 bytes?):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Request ID (fixed value 3)    |
| 0x1    | 0x1  | Expected response time in ms? |
| 0x2    | ...  | ?                             |

Response (2 bytes?):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Response ID? Fixed value 0x12 |
| 0x1    | 0x1  | 0?                            |

### Request 4: Reset Calibration Data?

Request (3 bytes?):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Request ID (fixed value 4)    |
| 0x1    | 0x1  | Expected response time in ms? |
| 0x2    | 0x1  | ?                             |

Response (2 bytes?):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Response ID? Fixed value 0x13 |
| 0x1    | 0x1  | 0?                            |

### Request 5

Request (2 bytes):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Request ID (fixed value 5)    |
| 0x1    | 0x1  | Expected response time in ms? |

Response (2 bytes?):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Response ID? Fixed value 0x14 |
| 0x1    | 0x1  | ?                             |