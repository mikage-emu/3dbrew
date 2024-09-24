## 개요

닌텐도 3DS는 게임 데이터, 음악, 3DS로 촬영된 사진 및 동영상을 저장하기
위해 SD 카드를 사용한다.

`sdmc`
`├── DCIM`
`└── Nintendo 3DS`
`    ├── `<ID0>
`    │   └── `<ID1>
`    │       ├── `[`backups`](SD_Savedata_Backups "wikilink")
`    │       ├── `[`dbs`](Title_Database "wikilink")
`    │       ├── `[`extdata`](extdata "wikilink")
`    │       ├── `[`title`](Title_Data_Structure "wikilink")
`    │       └── `[`Nintendo DSiWare`](DSiWare_Exports "wikilink")
`    └── `[`Private`](SD_Filesystem#Private "wikilink")
`   `

- sdmc/Nintendo 3DS/<ID0>/<ID1> 안에 저장된 모든 파일은 콘솔 고유의
  [키슬롯으로](AES "wikilink") 암호화되어 있으며,
  [nand/data/<ID0>](Flash_Filesystem "wikilink") 안에 저장된 파일은
  MAC을 위해 이 키슬롯만을 사용한다. 이 디렉토리들 안의 모든 CTR 파일은
  [nand/private/movable.sed로](nand/private/movable.sed "wikilink")
  초기화된 키슬롯을 사용한다.
- ID0 is the first 0x10-bytes from a SHA256
  [hash](nand/private/movable.sed "wikilink").
- ID1 is the scrambled SD card CID from the SD card which this directory
  was originally created on. To generate this directory name from the
  original CID, first the CID is rotated 8-bits to the left. Then, each
  u16 is moved as described in the below table:

| Input rotated CID u16 index | Output CID u16 index |
|-----------------------------|----------------------|
| 6                           | 0                    |
| 7                           | 1                    |
| 4                           | 2                    |
| 5                           | 3                    |
| 2                           | 4                    |
| 3                           | 5                    |
| 0                           | 6                    |
| 1                           | 7                    |

**DCIM** - [닌텐도 3DS 카메라](Nintendo_3DS_Camera "wikilink")
애플리케이션으로 촬영된 사진 및 동영상이 이 디렉토리에 저장되어 있다.
인터넷 브라우저의 다운로드된 이미지도 이곳에 저장된다.

주: (3D) 동영상을 재생/녹화하는 것은 업데이트
[3.0.0-5에서](3.0.0-5 "wikilink") 도입되었다. 3D 동영상은 .avi 형식이며
동영상 프레임은 MJPG를 사용한다.

**backups** - 이 디렉토리에는 SD 타이틀의 세이브 파일이 들어 있다. 더
자세히 알아보려면 [SD 세이브 파일
백업으로](SD_Savedata_Backups "wikilink").

**dbs** - 이곳에는 SD 카드에 설치된 타이틀과 관련된 데이터베이스 파일이
들어 있다. 이 파일들은 암호화되어 있다. 더 자세히 알아보려면 [타이틀
데이터베이스로](Title_Database "wikilink").

**title** - SD 카드에 설치된 타이틀의 타이틀 데이터는 이곳에서 찾을 수
있다. 이 디렉토리에 들어 있는 모든 데이터는 콘솔 고유의
[키슬롯으로](AES "wikilink") 암호화되어 있다. SD 카드 타이틀 목록에
대해서는 [타이틀 목록으로](Title_list "wikilink"). 타이틀 데이터 구조에
대해서 더 자세히 알아보려면 [타이틀 데이터
구조로](Title_Data_Structure "wikilink").

**Nintendo DSiWare** - DSiWare 타이틀은 이곳에
[내보내진다](DSiWare_Exports "wikilink").

## Private

"Private" data is stored here as cleartext:

`/Nintendo 3DS/Private/`

<Title ID Low>

/

`00020400 - 닌텐도 3DS 카메라 `
`00020500 - 닌텐도 3DS 사운드`

Under the camera private dir is [phtcache.bin](phtcache.bin "wikilink").
When you want to install and see pictures with 3DS, rename to 8
numbers.mpo and save it on /DCIM. Under the sound private dir is:
voice/XX/\*.m4a. Where XX is 01-10, with sound saved as .m4a.