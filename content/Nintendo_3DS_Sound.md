+++
title = 'Nintendo 3DS Sound'
categories = ["File formats","Nintendo Software"]
+++

Nintendo 3DS Sound is the music playing and audio recording application
that is included with all retail consoles.

## Voice Recorder

Like its predecessor for the DSi, up to 10-second recordings can be
stored, with limited integration of those with other software.

Practically speaking, the [single page of internal
storage](Twln/shared2/0000 "wikilink") is for DSi-mode software, and the
10 pages of SD card storage are for 3DS software (like Flipnote Studio
3D).

### File naming pattern

<pre>
<a {{% href "../SD_Filesystem" %}}>sdmc:</a>/Nintendo 3DS/private/00020500/voice/01/V13303.m4a
</pre>

- 01: folder (page) number
- 13: file number
- 30: icon color
- 3: icon shape

See the previous link about internal storage for more information about
the numerical values in file names.

## Music Player

It loads audio files from the SD card. It supports MP3 and AAC-encoded
audio files and supports m3u playlists.

### Playlist file format

The application allows for user created playlists. They are stored on
the SD card.

| Offset                      | Size                  | Description                                                           |
|-----------------------------|-----------------------|-----------------------------------------------------------------------|
| 0x00                        | 0x04                  | Magic bytes, 'O', 'V', 'A', 'F' or "FAVO" endian corrected.           |
| 0x04                        | 0x04                  | Always integer with value 16                                          |
| 0x08                        | 0x04                  | File size (0x26730)                                                   |
| 0x0C                        | 0x04                  | Zero Padding                                                          |
| 0x10                        | 0x02                  | checksum (songs?)                                                     |
| 0x12                        | 0x02                  | Icon ID (0-44) if id==-1 then loads custom icon from end of playlist? |
| 0x14                        | 0x02                  | Song file count                                                       |
| 0x16                        | 0x02                  | Number of possible songs (usually 0x12C/300)                          |
| 0x18                        | 0x04                  | Some kind of timestamp, for encryption (doesn't change when editing)  |
| 0x1A                        | 0x01                  | Checksum (icon?, header?) (doesn't change when editing)               |
| 0x1B                        | 0x01                  | Checksum (name?) (doesn't change when editing)                        |
| 0x1C                        | 0x04                  | Always(?) integer with value 6                                        |
| 0x20                        | 0x100 (avaiable 0x40) | Playlist name stored in UTF-16                                        |
| 0x120+(n\*0x20C) =\> n\<300 | 692 (0x20C per song)  | File name stored in UTF-16, repeats for the rest of the file          |
| 0x2672F                     | \-                    | End                                                                   |

## Sample reader

This is a basic example of how to read a 3DS playlist.

    /* This is free and unencumbered software released into the public domain.
    /* Anyone is free to copy, modify, publish, use, compile, sell, or
    /* distribute this software, either in source code form or as a compiled
    /* binary, for any purpose, commercial or non-commercial, and by any
    /* means.

    /* In jurisdictions that recognize copyright laws, the author or authors
    /* of this software dedicate any and all copyright interest in the
    /* software to the public domain. We make this dedication for the benefit
    /* of the public at large and to the detriment of our heirs and
    /* successors. We intend this dedication to be an overt act of
    /* relinquishment in perpetuity of all present and future rights to this
    /* software under copyright law.
    /*
    /* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    /* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    /* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    /* IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
    /* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    /* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
    /* OTHER DEALINGS IN THE SOFTWARE.
    /*
    /* For more information, please refer to <http://unlicense.org/> */

    #include <stdio.h>
    #include <stdint.h>

    uint8_t buf[0x26730];
    uint16_t checksum, icon, songCount;
    uint32_t timestamp;
    uint8_t playlistName[0x100];
    uint8_t songName[0x20C][299];

    void readUtf16AsAscii(uint8_t *input, uint8_t *output, uint16_t length, uint32_t offset) {
        uint16_t j=0;
        for (j=0; j<length; j++) {
            output[j] = input[(j*2)+offset];
        }
    }

    int main(int argc, char* argv[]) {
        uint16_t t=0;
        FILE *playlistFile;

        if (argc != 2) {
            printf("Usage: %s FILE\n", argv[0]);
            exit(1);
        }

        if ((playlistFile = fopen(argv[1], "rb")) == NULL) {
            printf("Could not open %s.\n", argv[1]);
            exit(1);
        }

        if (fread(buf, 1, 0x26730, playlistFile) != 0x26730) {
            printf("Could not 0x26730 bytes from %s.\n", argv[1]);
            exit(1);
        }

        if (!((buf[0] = 'O') && (buf[1] = 'V') && (buf[2] = 'F') && (buf[3] = 'A'))) {
            printf("%s is not a 3DS playlist file.\n", argv[1]);
            exit(1);
        }

        checksum  = (buf[0x11] << 8)  | buf[0x10];
        icon      = (buf[0x13] << 8)  | buf[0x12];
        songCount = (buf[0x15] << 8)  | buf[0x14];
        timestamp = (buf[0x17] << 24) | (buf[0x16] << 16) | (buf[0x19] << 8) | buf[0x18];
        readUtf16AsAscii(buf, playlistName, 0x100, 0x20);
        for (t=0; t<songCount; t++) readUtf16AsAscii(buf, songName[t], 0x20C, (0x120+(t*0x20C)));

        printf("Checksum:\t%04X\nIcon ID:\t%04X\nSong Count:\t%04X\nTimestamp:\t%08X\nPlaylist Name:\t\"%s\"\n",
        checksum, icon, songCount, timestamp, playlistName);

        for (t=0; t<songCount; t++) printf("Name of song %03i: %s\n", t, songName[t]);
    }

## Reading files

The application can read files copied in a folder on the SD card of the
system. The application supports the following files formats:

```
   *  .mp3
   *  .m4a
   *  .mp4
   *  .3gp
```

[Category:File formats](Category:File_formats "wikilink")
[Category:Nintendo Software](Category:Nintendo_Software "wikilink")
