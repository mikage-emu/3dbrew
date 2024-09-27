+++
title = 'Nintendo 3DS Camera'
+++

## Overview

![](Nintendo_3DS_Camera_scnshot.png "Nintendo_3DS_Camera_scnshot.png")
This application allows the user to take/view photos and, since the
4.0.0-7 update, videos up to 10 minutes.

The resolution of the top-screen on the 3DS is 400x240.

## How to convert and split video.ext into 10 minute pieces

```
ffmpeg -i video.ext -ss 0 -t 600 -y -r 24 -vsync 1 -vcodec mjpeg -qscale 1 -acodec adpcm_ima_wav -async 1 -ac 2 /DCIM/xxxNINxxx/HNI_%04d.AVI
```

## How to convert 2D Video for 3DS

```
ffmpeg -i video.ext -r 24 -vsync 1 -vcodec mjpeg -qscale 1 -acodec adpcm_ima_wav -async 1 -ac 2 -vf scale=min(400\\,240*a):-1,pad=400:240:abs(ow-iw)/2:abs(oh-ih)/2 /DCIM/xxxNINxxx/HNI_nnnn.AVI
```

## How to convert 3D Video for 3DS

<code> ffmpeg -y -i "video.mp4" -s 960x240 -aspect 2:1 -r 20 -vcodec
mjpeg -qscale 1 -vf crop=480:240:0:0 -acodec libmp3lame -ar 41000 -ab
96k -ac 2 "left.avi" ffmpeg -y -i "video.mp4" -s 960x240 -aspect 2:1 -r
20 -vcodec mjpeg -qscale 1 -vf crop=480:240:480:0 -an "right.avi"

ffmpeg -y -i "left.avi" -i "right.avi" -vcodec copy -acodec
adpcm_ima_wav -ac 2 -vcodec copy -map 0:0 -map 0:1 -map 1:0
"VID_0001.AVI" </code>

First two lines generate left and right files video, the last line
generate the 3D video for the 3DS

Put the file in DCIM\xxxNINxx

## Image Requirements

The photo gallery implements various restrictions on its images:

- A 4:3 image must have an image resolution of at least 160x120 to
  appear in the photo gallery. (Minimum image resolutions for other
  aspect ratios are currently unknown, as are maximum image resolutions
  for any aspect ratio.)
- Additionally, certain features are only available for valid Nintendo
  3DS photographs:
  - The left-eye image's Exif metadata must specify a camera make of
    `Nintendo`, a camera model of `Nintendo 3DS`, and a software name of
    `00204`.
  - The zoom feature is only available when viewing any image with an
    aspect ratio which is no more horizontally dominant than 4:3. For
    example, a 480x480 image will be zoomable due to its aspect ratio,
    but a 480x288 image will not be zoomable because its 5:3 aspect
    ratio makes the image too wide relative to its height. All zoomable
    images are initially zoomed in when viewed in the photo gallery.
  - Each 3D image features a faded black border and can be manipulated
    with the 3D Focus slider, but only if the image is at least 480
    pixels wide and contains a valid 3DS Camera maker note in the
    left-eye image's Exif metadata.

## Maker Note

Every Nintendo 3DS Camera photo contains a maker note in its Exif
metadata. 3D images contain two maker notes - one for the left-eye
image, and one for the right - but only the left-eye image's maker note
is used. Two maker notes within the same 3D image may be identical to
one another, but they are not guaranteed to be. The maker note of a 2D
JPEG image seems to always contain an identical maker note to one of its
respective 3D image's individual images, but which one it is identical
to is not consistent.

The maker note consists of two custom TIFF fields that both have a type
of `UNDEFINED`. Regardless of the Exif metadata's endianness, which the
TIFF fields must match, the fields' contents are encoded in little
endian.

The first field, which is identified by tag `0x1100`, is 80 bytes long.
The meanings of its contents are not known, but the first byte Seems to
always have a value of 1. The remaining bytes always seem to have values
of zero, unless the photo used a sepia filter, in which case bytes
`0x8`-`0x1a` (inclusive) are set. This field can be excluded from the
maker note without invalidating the 3DS Camera maker note.

The second field uses tag `0x1101`. It is 64 bytes long, although its
length can be reduced to as few as 21 bytes without issue.

| Address | Size | Type      | Description                                                                                |
|---------|------|-----------|--------------------------------------------------------------------------------------------|
| 0x0     | 0x4  | char\[4\] | Spells "3DS1" in ASCII. Required.                                                          |
| 0x4     | 0x4  | unknown   | Possibly a version number. Seems to always be 1 or 2.                                      |
| 0x8     | 0x4  | u32       | Photo timestamp                                                                            |
| 0xc     | 0x4  | unknown   | Unknown. Seems to always be 0.                                                             |
| 0x10    | 0x4  | unknown   | Unknown. Seems to always be 516.                                                           |
| 0x14    | 0x1  | u8        | Unknown. Seems to always be 20, but any non-zero value seems acceptable. Required.         |
| 0x15    | 0x3  | unknown   | Unknown. Seems to always be 0.                                                             |
| 0x18    | 0x4  | u32       | This is the lower word of [Cfg:GenHashConsoleUnique](Cfg:GenHashConsoleUnique "wikilink"). |
| 0x1c    | 0xc  | unknown   | Unknown. Seems to always be 0.                                                             |
| 0x28    | 0x4  | f32       | Left translation                                                                           |
| 0x2c    | 0x4  | unknown   | Unknown. Seems to always be 0.                                                             |
| 0x30    | 0x4  | u32       | Photo filter(s)                                                                            |
| 0x34    | 0xc  | unknown   | Unknown. Seems to always be 0.                                                             |

The photo timestamp is represented by the number of seconds that had
passed since the beginning of the year 2000 in the photographer's 3DS's
time zone.

The left translation number indicates how many pixels to move the
left-eye image to the left before scaling it to fit the entire image
on-screen without stretching it. It inversely affects the positions of
the right-eye image and the 3D Focus slider. The 3DS Camera clamps this
value to prevent the image from moving off-screen. This value is zero in
2D photos, though 3D photos can use a value of zero as well.

Take, for example, a 640x480 3DS photograph. The 3DS Camera will scale
the photo down to 50% of its original size to fit the top 3DS screen,
which is 240 pixels tall. This leaves a gap of 40 pixels on both the
left and right sides of the image. If these gaps were resized to match
the photo's original scale, which is twice as large as its on-screen
scale, the gaps would be 80 pixels wide. As such, the left translation
value can effectively range from +80.0, which will move the image to the
left edge of the screen, to -80.0, which will move it to the right edge.
Despite this range working as expected for an image of this size, the
3DS Camera's image gallery does not allow the user to move any photo to
the very edge of the screen. For the example above, the maximum absolute
value seems to be somewhere within the mid-to-low 50s.

The left translation value can be changed by moving the 3D Focus slider
while zoomed in, or by readjusting the photo's position while zoomed
out. This will update the left translation value held in the left-eye
image's maker note as well.

The photo filter(s) value seems to specify information about photo
filters that were applied to the image. Some filters seem to use the
same values. When filters are not present, this value is 0.
