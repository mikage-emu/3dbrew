+++
title = 'Circle Pad Pro'
+++

Also known as CTR-009, it sends the commands to the console through the IR interface on the back of the console.

[Pictures of its contents](http://what-games.golog.jp/archives/1350330.html).

## Usage Instructions

<figure>
<img src="../Circle_pad_pro_instructions.jpg" title="Circle_pad_pro_instructions.jpg" />
<figcaption>Circle_pad_pro_instructions.jpg</figcaption>
</figure>

## IR Protocol

Communications with this device is done via the [ir:USER](IR_Services "wikilink") service, which uses obfuscation implemented in software. The [bitrate-value](IRU:SetBitRate "wikilink") passed to IRUSER is 0x04, hence the actual bps is 96000.

The application sends requests via [IRUSER:SendIrnop](IRUSER:SendIrnop "wikilink") and receives response from Circle Pad Pro via [IRUSER:ReceiveIrnop](IRUSER:ReceiveIrnop "wikilink") (or read data from the [shared memory](IRUSER_Shared_Memory "wikilink")). The request and response data structures below are payloads in packets. Each request begins with a one-byte ID that determines the request type.

### Request 1: Read Input

Request (3 bytes):

| offset | Size | Description                |
|--------|------|----------------------------|
| 0x0    | 0x1  | Request ID (fixed value 1) |
| 0x1    | 0x1  | Response period in ms      |
| 0x2    | 0x1  | Unknown                    |

Response (6 bytes):
This Response will be sent repeatedly by the specified period.

<table>
<thead>
<tr>
<th>offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>0x0</td>
<td>0x1</td>
<td>Response ID? Fixed value 0x10</td>
</tr>
<tr>
<td>0x1</td>
<td>0x3</td>
<td>Right circle pad position.
This three bytes are two little-endian 12-bit fields. The first one is for x-axis and the second one is for y-axis.</td>
</tr>
<tr>
<td>0x4</td>
<td>0x1</td>
<td>bit[0:4] battery level?
bit[5] ZL button</p>
<p>bit[6] ZR button</p>
<p>bit[7] R button</p>
<p>Note that for the three button fields, the bit is set when the button is NOT pressed.</td>
</tr>
<tr>
<td>0x5</td>
<td>0x1</td>
<td>Unknown</td>
</tr>
</tbody>
</table>

### Request 2: Read Calibration Data?

Request (6 bytes):

| offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Request ID (fixed value 2)    |
| 0x1    | 0x1  | Expected response time in ms? |
| 0x2    | 0x2  | Data offset (aligned to 0x10) |
| 0x4    | 0x2  | Data size (aligned to 0x10)   |

Response (5 bytes + requested size)

| offset | Size      | Description                      |
|--------|-----------|----------------------------------|
| 0x0    | 0x1       | Response ID? Fixed value 0x11    |
| 0x1    | 0x2       | Data offset. Same as Request+0x2 |
| 0x3    | 0x2       | Data size. Same as Request+0x4   |
| 0x5    | data size | calibration data                 |

Calibration data:

| offset | Size | Description |
|----|----|----|
| 0x0 | 0x1 | Unknown |
| 0x1 | 0x3 | Right circle pad offset.
These three bytes are two little-endian 12-bit fields. The lower one is for x-axis and the upper one is for y-axis. |
| 0x4 | 0x4 | Right circle pad x-axis scale factor (floating-point). |
| 0x8 | 0x4 | Right circle pad y-axis scale factor (floating-point). |
| 0xC | 0x3 | Unknown |
| 0xF | 0x1 | [CRC-8-CCITT](CRC-8-CCITT "wikilink") over data above |

The Circle Pad Pro contains many sets of calibration data. Sets with an invalid CRC checksum should be ignored.

To calculate the right circle pad's position, first subtract the calibration offset from the value reported in the "Read Input" request, then multiply by the scaling factor. Dividing the result by 8 gives a value with a similar range to that of the left circle pad: -0x9C(bottom/left) - 0x9C(top/right).

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
