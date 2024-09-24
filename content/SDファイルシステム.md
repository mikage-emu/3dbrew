## 概要

3DSは、追加のゲームデータや3DSで撮影された写真を保存するストレージにSDカードを使用しています。

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

- sdmc/Nintendo
  3DS/<ID0>/<ID1>以下に保存されている全てのファイルは機器固有の[キースロットで](AES "wikilink")暗号化されており、[nand/data/<ID0>](Flash_Filesystem "wikilink")以下に保存されているファイルのみがMACアドレスによるこれらのキースロットを使用します。これらのディレクトリ以下の全てのCTRファイルは[nand/private/movable.sedによって](nand/private/movable.sed "wikilink")初期化されたキースロットを使用します。
- ID0はSHA256[ハッシュの](nand/private/movable.sed "wikilink")最初の0x10バイトです。
- ID1は最初にそのディレクトリが作られたSDカードのSDカードCIDです。このディレクトリ名を本来のCIDから生成するには、まずCIDを8ビット左にローテートし、それからu16を下記の表に示されているように移します。

| ローテートしたCID u16 インデックスの入力 | CID u16 インデックスの出力 |
|------------------------------------------|----------------------------|
| 6                                        | 0                          |
| 7                                        | 1                          |
| 4                                        | 2                          |
| 5                                        | 3                          |
| 2                                        | 4                          |
| 3                                        | 5                          |
| 0                                        | 6                          |
| 1                                        | 7                          |

**DCIM** -
[ニンテンドー3DSカメラアプリにより](Nintendo_3DS_Camera "wikilink")撮影された写真や動画はこのディレクトリに保存されます。インターネットブラウザのダウンロード画像もここに保存されます。

注:
(3D)動画の再生/録画は[3.0.0-5アップデートで](3.0.0-5 "wikilink")導入されました。3D動画は.aviフォーマットであり、ビデオフレームにはMJPGが使われます。

**backups** -
このディレクトリはSDタイトルセーブデータバックアップを含みます。詳細は[SDセーブデータバックアップを](SD_Savedata_Backups "wikilink")参照してください。

**dbs** -
これはSDカードにインストールされたタイトルに関連するデータベースファイルを含みます。これらのファイルは暗号化されています。詳細は[タイトルデータベースを](Title_Database "wikilink")参照してください。

**title** -
SDカードにインストールされたタイトルのタイトルデータはここにあります。このディレクトリにある全てのデータは機種固有の[キースロットで](AES "wikilink")暗号化されています。SDカードタイトルのリストは[タイトルリストを](Title_list "wikilink")参照してください。タイトルデータの構造についての詳細は[タイトルデータの構造を](Title_Data_Structure "wikilink")参照してください。

**Nintendo DSiWare** -
DSiWareのタイトルはここに[エクスポートされます](DSiWare_Exports "wikilink")。

## Private

"Private"データはここに平文で保存されます。

`/Nintendo 3DS/Private/`

<Title ID Low>

/

`00020400 - ニンテンドー3DSカメラ`
`00020500 - ニンテンドー3DSサウンド`

カメラのプライベートディレクトリ以下には[phtcache.binがあります](phtcache.bin "wikilink")。
画像を登録して3DSで見たいときには、8文字の数字.mpoにリネームして/DCIMに保存してください。
サウンドのプライベートディレクトリ以下はvoice/XX/\*.m4aとなっています。XXは01-10となっており、その中には音声が.m4aとして保存されています。