+++
title = 'Swapnote'
+++

Swapnote, aka Nintendo Letter Box in EUR, is an eShop application which
allows you to send notes to friends via SpotPass/StreetPass.

### Swapnote Extdata

Every note written and received besides the built-in notes are stored in
Extdata. There's two extdata files per note, these are created when new
notes are saved. Properly recovering cleartext via XOR for the \*whole\*
note data is difficult, since these extdata files would already have the
note data stored. The graphics data for these notes are stored via MPOs.

The ExtData [File System](Extdata#Filesystem "wikilink") for Swapnote is
as follows:

```
root
├── icon
├── boss
│   └── wTJ$.LlMB~!!+s2
└── user
    ├── letter.tmp
    ├── fruit.tbl
    ├── 000
    │   └── XXX (where XXX is the result of sprintf(filename,"%03x",value); )
    └── letterpaper
         └── XXX.apd (where XXX.apd is the result of sprintf(filename,"%03x.apd",value); )
```