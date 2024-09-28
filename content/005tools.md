+++
title = '005tools'
categories = ["PC utilities"]
+++

005tools is a simple command line application designed to work with
devices that can transfer game saves from CTR-005 (3DS) and NTR-005
(DS/DSi) game cards to your PC. The source code is platform independent,
so it can be compiled to run on any system.

## Supported Devices

Currently, the application only supports the R4i Save Dongle. The code
is very flexible, so supporting other devices should be fairly
straightforward if I can get my hands on one.

## Notes

The official R4i software writes 3DS cards in full and then writes the
first 16kB *again*. 005tools mimics this but I haven't bothered to
change how the progress bar works, so don't be surprised when the
progress bar resets after writing all the data.

Also, when writing 3DS/very large cards on the R4i Save Dongle, you'll
notice the progress bar freeze after the first 128 bytes are written.
The official software does the same thing, and writing resumes ~7
seconds later. I have no idea why it does this, but the device actually
stops responding during this time, probably doing some processing of
it's own.

## Changelog

**v0.01b**

- Writing to 3DS cards works now
- Improved save size detection for 3DS cards
- Fixed progress bar on Win32
- Added some error detection

**v0.01a**

- First version

## Known Issues

- Writing to NTR-005 cards smaller than 1kB doesn't work (reading does).
- The official R4i software flags specific games to be treated like CTR
  cards and very large NTR cards for writing. This isn't implemented in
  005tools yet.

## Screenshot

<figure>
<img src="../005tools.png" title="File:005tools.png" />
<figcaption><a
{{% href "../File:005tools.png" %}}>File:005tools.png</a></figcaption>
</figure>
