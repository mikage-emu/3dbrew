+++
title = 'Title List'
+++

#### CTR Title List Notes

Reports/title-lists [here](https://yls8.mtheall.com/ninupdates/reports.php) are automatically obtained from the system update SOAP.

## CTR System Titles

| Category Bit Mask | Title Type | Internal Description | Bit Mask(s) |
|----|----|----|----|
| 0x0010 | Application | SYSTEM_APPLICATION | Normal \| System |
| 0x001B | System Data Archives | SYSTEM_CONTENT | Contents \| CannotExecution \| System |
| 0x009B | Shared Data Archives | SHARED_CONTENT | Contents \| CannotExecution \| System \| NotRequireRightForMount |
| 0x00DB | System Data Archives | AUTO_UPDATE_CONTENT | Contents \| CannotExecution \| System \| NotRequireUserApproval \| NotRequireRightForMount |
| 0x0030 | Applet | APPLET | Normal \| System \| RequireBatchUpdate |
| 0x0130 | Module | BASE | Normal \| System \| RequireBatchUpdate \| CanSkipConvertJumpId |
| 0x0138 | Firmware | FIRMWARE | Normal \| CannotExecution \| System \| RequireBatchUpdate \| CanSkipConvertJumpId |

### 00040010 - System Applications

#### System Application Notes

System Application titles have a unique title low that varies by region.
Regardless of version, the ExeFS:/.code for mset is the same for USA/EUR/JPN.
The [4.0.0-7](4.0.0-7 "wikilink") version of mset([4.1.0-8](4.1.0-8 "wikilink") for TWN) has the same ExeFS:/.code for all regions(JPN, USA, EUR, CHN, KOR, TWN).
The [5.0.0-11](5.0.0-11 "wikilink") mset ExeFS:/.code is the same for all regions as well, except for CHN. The [7.0.0-13](7.0.0-13 "wikilink") mset ExeFS:/.code is unique for the following regions: CHN, KOR, and TWN.
A limited number of system-applications are included with gamecard-sysupdates. They are: [System Settings](System_Settings "wikilink"), [Download Play](Download_Play "wikilink"), SAFE_MODE [System Updater](System_Settings#system_updater "wikilink"), and [Nintendo 3DS Sound](Nintendo_3DS_Sound "wikilink") (this one was only in firms 3.0.0 - 6.2.0 inclusive).
The only system-applications included with the New3DS gamecard-sysupdate partition are: "menu" stub and "friend" stub.

| JPN TIDLow | USA TIDLow | EUR TIDLow | CHN TIDLow | KOR TIDLow | TWN TIDLow | [Product code](Product_code "wikilink") | Description | JPN Versions | EUR Versions | USA Versions | CHN Versions | KOR Versions | TWN Versions | Status |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 00020000 | 00021000 | 00022000 | 00026000 | 00027000 | 00028000 | CTR-N-HAS? | [System Settings](System_Settings "wikilink") (mset) | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2060](3.0.0-5 "wikilink"), [v3074](4.0.0-7 "wikilink"), [v4097](5.0.0-11 "wikilink"), [v5127](6.0.0-11 "wikilink"), [v6157](7.0.0-13 "wikilink"), [v7173](7.2.0-17 "wikilink"), [v8198](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v9224](9.0.0-20 "wikilink"), [v10245](9.6.0-24 "wikilink"), [v10256](10.6.0-31 "wikilink"), [v11266](11.5.0-38 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2061](3.0.0-5 "wikilink"), [v3075](4.0.0-7 "wikilink"), [v4097](5.0.0-11 "wikilink"), [v5127](6.0.0-11 "wikilink"), [v6157](7.0.0-13 "wikilink"), [v7174](7.2.0-17 "wikilink"), [v8202](9.0.0-20 "wikilink"), [v9220](9.6.0-24 "wikilink"), [v10241](11.4.0-37 "wikilink")(New2DSXL), [v10256](11.5.0-38 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2062](3.0.0-5 "wikilink"), [v3078](4.0.0-7 "wikilink"), [v4098](5.0.0-11 "wikilink"), [v5128](6.0.0-11 "wikilink"), [v6157](7.0.0-13 "wikilink"), [v7174](7.2.0-17 "wikilink"), [v8203](9.0.0-20 "wikilink"), [v9221](9.6.0-24 "wikilink"), [v10241](11.5.0-38 "wikilink") | [v8](4.0.0-7 "wikilink"), [v1024](4.4.0-10 "wikilink")(CHN-only sysupdate for just mset), [v2049](5.0.0-11 "wikilink"), [v3075](7.0.0-13 "wikilink") | [v1026](4.0.0-7 "wikilink"), [v2049](5.0.0-11 "wikilink"), [v4098](7.0.0-13 "wikilink") | [v8](4.1.0-8 "wikilink"), [v1024](4.2.0-9 "wikilink"), [v2050](5.0.0-11 "wikilink"), [v3074](7.0.0-13 "wikilink") | Active |
| 00020100 | 00021100 | 00022100 | 00026100 | 00027100 | 00028100 | CTR-N-HDL? | [Download Play](Download_Play "wikilink") (dlplay) | [v0](1.0.0-0 "wikilink"), [v1026](2.1.0-4 "wikilink"), [v2051](4.0.0-7 "wikilink"), [v3072](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) | [v0](1.0.0-0 "wikilink"), [v1026](2.1.0-4 "wikilink"), [v2051](4.0.0-7 "wikilink"), [v3073](9.0.0-20 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.1.0-4 "wikilink"), [v2051](4.0.0-7 "wikilink"), [v3073](9.0.0-20 "wikilink") | [v4](4.0.0-7 "wikilink") | [v1027](4.0.0-7 "wikilink") | [v4](4.1.0-8 "wikilink") | Active |
| 00020200 | 00021200 | 00022200 | 00026200 | 00027200 | 00028200 | CTR-N-HMK? | [Activity Log](Activity_Log "wikilink") (PLOG) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2051](3.0.0-5 "wikilink"), [v2080](10.6.0-31 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2054](3.0.0-5 "wikilink"), [v2064](7.0.0-13 "wikilink") | Same as EUR | [v3](4.0.0-7 "wikilink") | [v2](4.0.0-7 "wikilink"), [v16](7.0.0-13 "wikilink") | [v2](4.1.0-8 "wikilink") | Active |
| 00020300 | 00021300 | 00022300 | 00026300 | 00027300 | 00028300 | ? | [Health and Safety Information](Health_and_Safety_Information "wikilink") (safe) | [v0](1.0.0-0 "wikilink"), [v1024](4.0.0-7 "wikilink"), [v2050](6.0.0-11 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](3.0.0-5 "wikilink"), [v2050](4.0.0-7 "wikilink"), [v3077](6.0.0-11 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](4.0.0-7 "wikilink"), [v2051](6.1.0-12U "wikilink") | [v5](4.0.0-7 "wikilink") | [v2](4.0.0-7 "wikilink") | [v5](4.1.0-8 "wikilink") | Active |
| 20020300 | 20021300 | 20022300 | N/A | 20027300 | N/A | CTR-N-HAC? | [New_3DS](New_3DS "wikilink") [Health and Safety Information](Health_and_Safety_Information "wikilink") (ssafe) | [v2](8.1.0-0_New3DS "wikilink"), [v17](9.3.0-21 "wikilink") | [v1](8.1.0-0_New3DS "wikilink"), [v16](11.4.0-37 "wikilink")(New2DSXL) | Same as EUR. | N/A | [v2](9.6.0-24 "wikilink") | N/A | Active |
| 00020400 | 00021400 | 00022400 | 00026400 | 00027400 | 00028400 | CTR-N-HEP? | [Nintendo 3DS Camera](Nintendo_3DS_Camera "wikilink") (CtrApp) | [v0](1.0.0-0 "wikilink"), [v16](2.1.0-4 "wikilink"), [v1038](3.0.0-5 "wikilink"), [v2048](4.0.0-7 "wikilink"), [v3073](6.0.0-11 "wikilink"), [v4097](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v4112](10.6.0-31 "wikilink"), [v5120](11.5.0-38 "wikilink") | [v0](1.0.0-0 "wikilink"), [v16](2.1.0-4 "wikilink"), [v1039](3.0.0-5 "wikilink"), [v2048](4.0.0-7 "wikilink"), [v3073](6.0.0-11 "wikilink"), [v3088](7.0.0-13 "wikilink"), [v4097](9.0.0-20 "wikilink"), [v5120](11.4.0-37 "wikilink")(New2DSXL), [v5120](11.5.0-38 "wikilink") | [v0](1.0.0-0 "wikilink"), [v16](2.1.0-4 "wikilink"), [v1039](3.0.0-5 "wikilink"), [v2048](4.0.0-7 "wikilink"), [v3074](6.1.0-12U "wikilink"), [v3088](7.0.0-13 "wikilink"), [v4097](9.0.0-20 "wikilink"), [v5120](11.5.0-38 "wikilink") | [v3](4.0.0-7 "wikilink") | [v2](4.0.0-7 "wikilink"), [v1040](7.0.0-13 "wikilink") | [v3](4.1.0-8 "wikilink") | Active |
| 00020500 | 00021500 | 00022500 | 00026500 | 00027500 | 00028500 | CTR-N-HES? | [Nintendo 3DS Sound](Nintendo_3DS_Sound "wikilink") (CtrApp) | [v0](1.0.0-0 "wikilink"), [v1027](2.1.0-4 "wikilink"), [v2049](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v3089](7.0.0-13 "wikilink"), [v4096](11.4.0-37 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.1.0-4 "wikilink"), [v2049](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v3088](7.0.0-13 "wikilink"), [v4096](11.4.0-37 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.1.0-4 "wikilink"), [v2049](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v3088](7.0.0-13 "wikilink"), [v4096](11.4.0-37 "wikilink") | [v2](4.0.0-7 "wikilink"), [v1024](11.4.0-37 "wikilink") | [v2](4.0.0-7 "wikilink"), [v16](7.0.0-13 "wikilink"),[v4096](11.4.0-37 "wikilink") | [v3](4.1.0-8 "wikilink"), [v1024](11.4.0-37 "wikilink") | Active |
| 00020700 | 00021700 | 00022700 | 00026700 | 00027700 | 00028700 | CTR-N-HED? | [Mii Maker](Mii_Maker "wikilink") (EDIT) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2055](7.0.0-13 "wikilink"), [v2064](10.6.0-31 "wikilink") | Same as JPN | Same as JPN | [v1](4.0.0-7 "wikilink") | [v1](4.0.0-7 "wikilink"), [v16](7.0.0-13 "wikilink") | [v2](4.1.0-8 "wikilink") | Active |
| 00020800 | 00021800 | 00022800 | 00026800 | 00027800 | 00028800 | CTR-N-HME? | [StreetPass Mii Plaza](StreetPass_Mii_Plaza "wikilink") (MEET) | [v0](1.0.0-0 "wikilink"), v1027, [v2048](2.1.0-4 "wikilink"), [v3087](3.0.0-5 "wikilink"), [v4096](3.0.0-6 "wikilink"), [v5121](6.0.0-11 "wikilink") | [v0](1.0.0-0 "wikilink"), v1027, [v2048](2.1.0-4 "wikilink"), [v3087](3.0.0-5 "wikilink"), [v4096](3.0.0-6 "wikilink"), [v5122](6.0.0-11 "wikilink") | [v0](1.0.0-0 "wikilink"), v1027, [v2048](2.1.0-4 "wikilink"), [v3087](3.0.0-5 "wikilink"), [v4096](3.0.0-6 "wikilink"), [v5124](6.1.0-12U "wikilink"), [v5136](7.0.0-13 "wikilink") | [v0](4.0.0-7 "wikilink"), [v4096](4.4.0-10 "wikilink") | [v1](4.0.0-7 "wikilink"), [v4096](4.4.0-10 "wikilink"), [v5120](7.0.0-13 "wikilink") | [v1](4.1.0-8 "wikilink"), [v4096](4.4.0-10 "wikilink") | Active |
| 00020900 | 00021900 | 00022900 | N/A | 00027900 | 00028900 | CTR-N-HGR? | [eShop](eShop "wikilink") (tiger) | [v4](2.0.0-2 "wikilink"), [v1026](2.1.0-3 "wikilink"), [v2057](3.0.0-5 "wikilink"), [v3081](4.0.0-7 "wikilink"), [v4096](4.1.0-8 "wikilink"), [v5123](4.2.0-9 "wikilink"), [v6146](4.3.0-10 "wikilink"), [v7169](5.0.0-11 "wikilink"), [v8206](7.0.0-13 "wikilink"), [v9231](7.1.0-14 "wikilink"), [v10245](7.2.0-17 "wikilink"), [v11265](8.0.0-18 "wikilink"), [v12288](8.1.0-19 "wikilink"), [v13320](9.0.0-20 "wikilink"), [v15366](9.3.0-21 "wikilink"), [v16384](9.5.0-22 "wikilink"), [v17421](9.6.0-24 "wikilink"), [v18432](9.7.0-25 "wikilink"), [v19465](10.0.0-27 "wikilink"), [v20483](10.4.0-29 "wikilink"), [v21504](10.7.0-32 "wikilink"), [v23552](11.3.0-36 "wikilink"), [v25600](11.5.0-38 "wikilink") | [v4](2.0.0-2 "wikilink"), [v1026](2.1.0-3 "wikilink"), [v2058](3.0.0-5 "wikilink"), [v3081](4.0.0-7 "wikilink"), [v4096](4.1.0-8 "wikilink"), [v5123](4.2.0-9 "wikilink"), [v6146](4.3.0-10 "wikilink"), [v7171](5.0.0-11 "wikilink"), [v8206](7.0.0-13 "wikilink"), [v9231](7.1.0-14 "wikilink"), [v10245](7.2.0-17 "wikilink"), [v11265](8.0.0-18 "wikilink"), [v12288](8.1.0-19 "wikilink"), [v13320](9.0.0-20 "wikilink"), [v15366](9.3.0-21 "wikilink"), [v16384](9.5.0-22 "wikilink"), [v17421](9.6.0-24 "wikilink"), [v18432](9.7.0-25 "wikilink"), [v19465](10.0.0-27 "wikilink"), [v20482](10.4.0-29 "wikilink"), [v21505](10.7.0-32 "wikilink"), [v22528](11.2.0-35 "wikilink"), [v23552](11.3.0-36 "wikilink"), [v24576](11.4.0-37 "wikilink")(New2DSXL), [v25600](11.5.0-38 "wikilink") | [v4](2.0.0-2 "wikilink"), [v1026](2.1.0-3 "wikilink"), [v2058](3.0.0-5 "wikilink"), [v3081](4.0.0-7 "wikilink"), [v4096](4.1.0-8 "wikilink"), [v5123](4.2.0-9 "wikilink"), [v6146](4.3.0-10 "wikilink"), [v7170](5.0.0-11 "wikilink"), [v8206](7.0.0-13 "wikilink"), [v9231](7.1.0-14 "wikilink"), [v10246](7.2.0-17 "wikilink"), [v11265](8.0.0-18 "wikilink"), [v12288](8.1.0-19 "wikilink"), [v13321](9.0.0-20 "wikilink"), [v15366](9.3.0-21 "wikilink"), [v16384](9.5.0-22 "wikilink"), [v17422](9.6.0-24 "wikilink"), [v18432](9.7.0-25 "wikilink"), [v19465](10.0.0-27 "wikilink"), [v20482](10.4.0-29 "wikilink"), [v21506](10.7.0-32 "wikilink"), [v23552](11.3.0-36 "wikilink"), [v25600](11.5.0-38 "wikilink") | N/A | [v3082](4.0.0-7 "wikilink"), [v4096](4.1.0-8 "wikilink"), [v5123](4.2.0-9 "wikilink"), [v6146](4.3.0-10 "wikilink"), [v7169](5.0.0-11 "wikilink"), [v8205](7.0.0-13 "wikilink"), [v9231](7.1.0-14 "wikilink"), [v12288](8.1.0-19 "wikilink"), [v13320](9.0.0-20 "wikilink"), [v15366](9.3.0-21 "wikilink"), [v16384](9.5.0-22 "wikilink"), [v17420](9.6.0-24 "wikilink"), [v18432](9.7.0-25 "wikilink"), [v19465](10.0.0-27 "wikilink"), [v20482](10.4.0-29 "wikilink") | [v4096](4.1.0-8 "wikilink"), [v5123](4.2.0-9 "wikilink"), [v6146](4.3.0-10 "wikilink"), [v7170](5.0.0-11 "wikilink"), [v8205](7.0.0-13 "wikilink"), [v9231](7.1.0-14 "wikilink"), [v12288](8.1.0-19 "wikilink"), [v15366](9.3.0-21 "wikilink"), [v16384](9.5.0-22 "wikilink"), [v17421](9.6.0-24 "wikilink"), [v18432](9.7.0-25 "wikilink"), [v19465](10.0.0-27 "wikilink") | Active |
| 00020A00 | 00021A00 | 00022A00 | N/A | 00027A00 | 00028A00 | CTR-N-HCB? | [System Transfer](System_Transfer "wikilink") (CARDBOARD) | [v4](2.0.0-2 "wikilink"), [v1035](3.0.0-5 "wikilink"), [v2050](4.0.0-7 "wikilink"), [v3074](5.0.0-11 "wikilink"), [v4109](7.0.0-13 "wikilink"), [v5130](9.0.0-20 "wikilink"), [v6154](9.6.0-24 "wikilink") | [v4](2.0.0-2 "wikilink"), [v1035](3.0.0-5 "wikilink"), [v2050](4.0.0-7 "wikilink"), [v3073](5.0.0-11 "wikilink"), [v4109](7.0.0-13 "wikilink"), [v5131](9.0.0-20 "wikilink"), [v6155](9.6.0-24 "wikilink") | [v4](2.0.0-2 "wikilink"), [v1035](3.0.0-5 "wikilink"), [v2051](4.0.0-7 "wikilink"), [v3073](5.0.0-11 "wikilink"), [v4109](7.0.0-13 "wikilink"), [v5131](9.0.0-20 "wikilink"), [v6156](9.6.0-24 "wikilink") | N/A | [v2](4.0.0-7 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2061](7.0.0-13 "wikilink"), [v3082](9.0.0-20 "wikilink") | [v2](4.1.0-8 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2061](7.0.0-13 "wikilink") | Active |
| 00020B00 | 00021B00 | 00022B00 | N/A | N/A | N/A | CTR-N-HMA? | [Nintendo Zone](Nintendo_Zone "wikilink") ("Nintendo") (MARS) | [v0](1.0.0-0 "wikilink"), [v1034](3.0.0-5 "wikilink") | Same as JPN | Same as JPN | N/A | N/A | N/A | Active |
| 00020D00 | 00021D00 | 00022D00 | 00026D00 | 00027D00 | 00028D00 | CTR-N-HCH? | [Face Raiders](Face_Raiders "wikilink") | [v0](1.0.0-0 "wikilink"), [v1028](2.1.0-4 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1028](2.1.0-4 "wikilink"), [v1040](7.0.0-13 "wikilink") | Same as EUR | [v0](4.0.0-7 "wikilink") | [v0](4.0.0-7 "wikilink") | [v2](4.1.0-8 "wikilink") | Active |
| 20020D00 | 20021D00 | 20022D00 | N/A | 20027D00 | N/A | ? | [New_3DS](New_3DS "wikilink") [Face Raiders](Face_Raiders "wikilink") (FACE) | [v2050](8.1.0-0_New3DS "wikilink") | [v2049](8.1.0-0_New3DS "wikilink") | Same as EUR. | N/A | [v2049](9.6.0-24 "wikilink") | N/A | Active |
| 00020E00 | 00021E00 | 00022E00 | 00026E00 | 00027E00 | 00028E00 | CTR-N-HAR? | [AR Games](AR_Games "wikilink") (AR_ACT) | [v0](1.0.0-0 "wikilink"), [v1026](2.1.0-4 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.1.0-4 "wikilink"), [v1040](7.0.0-13 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.1.0-4 "wikilink"), [v1040](7.0.0-13 "wikilink") | [v0](4.0.0-7 "wikilink") | [v0](4.0.0-7 "wikilink"), [v16](7.0.0-13 "wikilink") | [v1](4.1.0-8 "wikilink") | Active |
| 00020F00 | 00021F00 | 00022F00 | 00026F00 | 00027F00 | 00028F00 | CTR-N-HSH? | SAFE_MODE [System Updater](System_Settings#system_updater "wikilink") (mset) | [v0](1.0.0-0 "wikilink"), [v1024](3.0.0-5 "wikilink"), [v2049](6.0.0-11 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](3.0.0-5 "wikilink"), [v2050](6.0.0-11 "wikilink") | Same as JPN | [v1](4.0.0-7 "wikilink"), [v1026](6.0.0-11 "wikilink") | [v1](4.0.0-7 "wikilink") | [v1](4.1.0-8 "wikilink") | Active |
| 00023000 | 00024000 | 00025000 | N/A | N/A | N/A | (Variable?) | Promotional video | [v2](1.1.0-1 "wikilink"), [v2048](2.0.0-2 "wikilink") | [v0](1.1.0-1 "wikilink"), [v2048](2.0.0-2 "wikilink") | [v0](1.1.0-1 "wikilink"), [v2048](2.0.0-2 "wikilink") | N/A | N/A | N/A | Stubbed |
| 0002BF00 | 0002C000 | 0002C100 | N/A | N/A | N/A | CTR-N-HAF? | [Nintendo Network ID Settings](Nintendo_Network_ID_Settings "wikilink") (act) | [v14](7.0.0-13 "wikilink"), [v1029](7.2.0-17 "wikilink"), [v2051](9.0.0-20 "wikilink"), [v3072](9.3.0-21 "wikilink") | Same as JPN | Same as JPN | N/A | N/A | N/A | Active |
| 20023100 | 20024100 | 20025100 | N/A | N/A | N/A | CTR-N-HAJ? | [microSD Management](microSD_Management "wikilink") ('mcopy') ([New_3DS](New_3DS "wikilink")-only) | [v8](8.1.0-0_New3DS "wikilink"), [v1024](9.0.0-20 "wikilink") | [v4](8.1.0-0_New3DS "wikilink") | [v5](8.1.0-0_New3DS "wikilink") | N/A | N/A | N/A | Available |
| 2002C800 | 2002CF00 | 2002D000 | N/A | 2002D700 | N/A | CTR-P-CTAP | [New_3DS](New_3DS "wikilink") HOME menu digital manual | [v2](8.1.0-0_New3DS "wikilink"), [v18](9.0.0-20 "wikilink"), [v34](9.3.0-21 "wikilink"), [v50](9.6.0-24 "wikilink") | [v1](8.1.0-0_New3DS "wikilink"), [v17](9.3.0-21 "wikilink"), [v34](9.6.0-24 "wikilink"), [v48](11.4.0-37 "wikilink")(New2DSXL) | [v1](8.1.0-0_New3DS "wikilink"), [v18](9.3.0-21 "wikilink"), [v33](9.6.0-24 "wikilink") | N/A | [v2](9.6.0-24 "wikilink") | N/A | Stubbed |
| 2002C900 | 2002D100 | 2002D200 | N/A | 2002D800 | N/A | CTR-P-CTAP | [New_3DS](New_3DS "wikilink") Friends list digital manual | [v1](8.1.0-0_New3DS "wikilink") | Same as JPN. | [v0](8.1.0-0_New3DS "wikilink"), [v16](9.3.0-21 "wikilink") | N/A | [v2](9.6.0-24 "wikilink") | N/A | Stubbed |
| 2002CA00 | 2002D300 | 2002D400 | N/A | 2002D900 | N/A | CTR-P-CTAP | [New_3DS](New_3DS "wikilink") Notifications digital manual | [v0](8.1.0-0_New3DS "wikilink"), v1([JPN-only](Home_Menu "wikilink") Oct 2, 2014 "sysupdate", actually uploaded on 09-29-14. Identical to v0, same TMDs besides title-versions) | [v2](8.1.0-0_New3DS "wikilink") | [v0](8.1.0-0_New3DS "wikilink") | N/A | [v2](9.6.0-24 "wikilink") | N/A | Stubbed |
| 2002CB00 | 2002D500 | 2002D600 | N/A | 2002DA00 | N/A | CTR-P-CTAP | [New_3DS](New_3DS "wikilink") Game Notes digital manual | [v0](8.1.0-0_New3DS "wikilink"), [v1](9.0.0-20 "wikilink") | [v2](8.1.0-0_New3DS "wikilink") | Same as EUR. | N/A | [v1](9.6.0-24 "wikilink") | N/A | Stubbed |

### 0004001B - [System Data Archives](NCCH#cfa "wikilink")

| TitleID Low | Description | Versions |
|----|----|----|
| 00010002 | [ClCertA](ClCertA "wikilink") | [v0](1.0.0-0 "wikilink") |
| 00010702 | [NS CFA](NS_CFA "wikilink") | [v0](3.0.0-5 "wikilink"), [v1028](6.0.0-11 "wikilink"), [v2048](6.3.0-12 "wikilink"), [v3073](7.0.0-13 "wikilink"), [v4096](9.0.0-20 "wikilink")(also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |
| 00010802 | This CFA only contains a 1-byte "dummy.txt" in the RomFS, which contains '0'. | [v0](6.3.0-12 "wikilink"), [v1024](9.5.0-23 "wikilink"), [v2048](10.5.0-30 "wikilink"), [v3072](11.0.0-33 "wikilink") |
| 00018002 | Same contents as 00010802. Starting with [7.1.0-15](7.1.0-15 "wikilink"), the "dummy.txt" file was removed from RomFS: this CFA RomFS now contains web-browser data(similar to 00018102) for NNID / networking, etc. | [v14](7.0.0-13 "wikilink"), [v1025](7.1.0-15 "wikilink"), [v2055](7.2.0-17 "wikilink"), [v3078](9.0.0-20 "wikilink"), [v4096](9.3.0-21 "wikilink"), [v5120](9.6.0-24 "wikilink") |
| 00018102 | This contains local web-browser data(html/js, gfx, etc) for the Miiverse Offline-mode. | [v11](7.0.0-13 "wikilink"), [v1025](9.0.0-20 "wikilink")(also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |
| 00018202 | This contains the webkit/OSS [CROs](CRO0 "wikilink") used with the Miiverse applet and the "act" application. | [v7](7.0.0-13 "wikilink"), [v1026](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v2050](9.0.0-20 "wikilink") |
| 00019002 | [Fangate_updater](Fangate_updater "wikilink") | [v2](9.3.0-21 "wikilink"), [v1026](9.6.0-24 "wikilink") |

### 00040030 - System Applets

#### System Applet Notes

Most of these processes are applets, see [here](NS_and_APT_Services "wikilink") for details.
All of the below processes use the "SYSTEM" [memory-region](SVC "wikilink").
The ExeFS for Home Menu is exactly the same for USA/EUR/JPN.
The Miiverse applet seems to use a web browser with webkit.

| JPN TitleIDLow | USA TitleIDLow | EUR TitleIDLow | CHN TitleIDLow | KOR TitleIDLow | TWN TitleIDLow | [Product code](Product_code "wikilink") | Description | JPN Versions | USA Versions | EUR Versions |
|----|----|----|----|----|----|----|----|----|----|----|
| 00008102 |  |  |  |  |  | CTR-P-CTAP | [Test Menu](NS#alternate_menu "wikilink") (Demo1) | ..., v64, ..., v27648 |  |  |
| 00008202 | 00008F02 | 00009802 | 0000A102 | 0000A902 | 0000B102 | CTR-P-HMM? | [Home Menu](Home_Menu "wikilink") (menu) | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2049](2.1.0-3 "wikilink"), [v3075](2.2.0-X "wikilink"), [v4111](3.0.0-5 "wikilink"), [v5131](4.0.0-7 "wikilink"), [v6146](4.2.0-9 "wikilink"), [v7172](5.0.0-11 "wikilink"), [v8198](6.0.0-11 "wikilink"), [v9230](7.0.0-13 "wikilink"), [v10250](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v13313](9.0.0-20 "wikilink"), [v14336](9.1.0-20J "wikilink"), [v15360](9.2.0-20 "wikilink"), [v16402](9.3.0-21 "wikilink"), [v17408](9.4.0-21 "wikilink"), [v18432](9.5.0-22 "wikilink"), [v19476](9.6.0-24 "wikilink"), [v20487](9.7.0-25 "wikilink"), [v22528](9.8.0-25 "wikilink"), [v23552](10.1.0-27 "wikilink"), [v24576](10.2.0-28 "wikilink"), [v25600](10.3.0-28 "wikilink"), [v26626](10.4.0-29 "wikilink"), [v27648](10.6.0-31 "wikilink"), [v28672](11.1.0-34 "wikilink"), [v29696](11.3.0-36 "wikilink"), [v30721](11.5.0-38 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2049](2.1.0-3 "wikilink"), [v3075](2.2.0-X "wikilink"), [v4111](3.0.0-5 "wikilink"), [v5131](4.0.0-7 "wikilink"), [v6146](4.2.0-9 "wikilink"), [v7172](5.0.0-11 "wikilink"), [v8198](6.0.0-11 "wikilink"), [v9230](7.0.0-13 "wikilink"), [v11272](9.0.0-20 "wikilink"), [v12288](9.2.0-20 "wikilink"), [v13330](9.3.0-21 "wikilink"), [v14336](9.4.0-21 "wikilink"), [v15360](9.5.0-22 "wikilink"), [v16404](9.6.0-24 "wikilink"), [v17415](9.7.0-25 "wikilink"), [v19456](9.8.0-25 "wikilink"), [v20480](9.9.0-26 "wikilink"), [v21504](10.1.0-27 "wikilink"), [v22528](10.2.0-28 "wikilink"), [v23552](10.3.0-28 "wikilink"), [v24578](10.4.0-29 "wikilink"), [v25600](10.6.0-31 "wikilink"), [v26624](11.1.0-34 "wikilink"), [v27648](11.3.0-36 "wikilink"), [v28673](11.5.0-38 "wikilink"), [v30720](11.17.0-50 "wikilink") | [v0](1.0.0-0 "wikilink"), [v1027](2.0.0-2 "wikilink"), [v2049](2.1.0-3 "wikilink"), [v3075](2.2.0-X "wikilink"), [v4111](3.0.0-5 "wikilink"), [v5131](4.0.0-7 "wikilink"), [v6146](4.2.0-9 "wikilink"), [v7172](5.0.0-11 "wikilink"), [v8198](6.0.0-11 "wikilink"), [v9230](7.0.0-13 "wikilink"), [v11272](9.0.0-20 "wikilink"), [v12288](9.2.0-20 "wikilink"), [v13330](9.3.0-21 "wikilink"), [v14336](9.4.0-21 "wikilink"), [v15360](9.5.0-22 "wikilink"), [v16404](9.6.0-24 "wikilink"), [v17415](9.7.0-25 "wikilink"), [v19456](9.8.0-25 "wikilink"), [v20480](10.1.0-27 "wikilink"), [v21504](10.2.0-28 "wikilink"), [v22528](10.3.0-28 "wikilink"), [v23554](10.4.0-29 "wikilink"), [v24576](10.6.0-31 "wikilink"), [v25600](11.1.0-34 "wikilink"), [v26624](11.3.0-36 "wikilink"), [v27649](11.4.0-37 "wikilink")(New2DSXL), [v27649](11.5.0-38 "wikilink") |
| 00008402 | 00009002 | 00009902 | 0000A202 | 0000AA02 | 0000B202 | CTR-N-HCS? | Camera applet used by Home-menu (CtrApp) | v0, v1036, [v2049](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 00008502 | 00009102 | 00009A02 | ? | ? | ? | ? | Not available on CDN | ? | ? | ? |
| 00008602 | 00009202 | 00009B02 | 0000A402 | 0000AC02 | 0000B402 | CTR-N-HMV? | Instruction Manual, applet for displaying instruction manuals | v0, v1026, v2048, v3072, [v4097](5.0.0-11 "wikilink"), [v5120](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 00008702 | 00009302 | 00009C02 | 0000A502 | 0000AD02 | 0000B502 | CTR-N-HGM? | Game Notes (Cherry) | v0, v1026, v2049, [v3073](5.0.0-11 "wikilink"), [v4096](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 00008802 | 00009402 | 00009D02 | 0000A602 | 0000AE02 | 0000B602 |  | [Internet Browser](Internet_Browser "wikilink") (spider) | [v6](2.0.0-2 "wikilink"), [v1024](2.1.0-4 "wikilink"), [v2050](4.0.0-7 "wikilink"), [v3074 (EUR)/v3075(USA,JAP)](5.0.0-11 "wikilink"), [v3088](7.0.0-13 "wikilink"), [v4096](7.1.0-16 "wikilink"), [v5121](9.5.0-23 "wikilink"), [v6149](9.9.0-26 "wikilink"), [v7168](10.2.0-28 "wikilink"), [v8192](10.6.0-31 "wikilink"), [v9232](10.7.0-32 "wikilink"), [v10240](11.1.0-34 "wikilink"), [v11297](11.9.0-42 "wikilink") |  |  |
| 20008802 | 20009402 | 20009D02 | ? | 2000AE02 | N/A | CTR-N-HBR? | [New 3DS](New_3DS "wikilink") [Internet Browser](Internet_Browser "wikilink") (SKATER) | [v10](8.1.0-0_New3DS "wikilink"), [v1027](9.3.0-21 "wikilink"), [v2051](9.6.0-24 "wikilink"), [v3077](9.9.0-26 "wikilink"), [v4096](10.2.0-28 "wikilink"), [v5121](10.4.0-29 "wikilink"), [v6144](10.6.0-31 "wikilink"), [v7184](10.7.0-32 "wikilink"), [v8192](11.1.0-34 "wikilink"), [v10272](11.9.0-42 "wikilink") |  |  |
| 00008A02 |  |  |  |  |  |  | Fatal error viewer ([ErrDisp](ErrDisp "wikilink")) | v0, v1025, [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5121](5.0.0-11 "wikilink"), [v6144](8.0.0-18 "wikilink"), [v7168](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 00008A03 |  |  |  |  |  |  | SAFE_MODE [ErrDisp](ErrDisp "wikilink") | v0 |  |  |
| 20008A03 | 20008A03 | 20008A03 | ? | 20008A03 | N/A |  | [New_3DS](New_3DS "wikilink") SAFE_MODE [ErrDisp](ErrDisp "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |  |  |
| 00008D02 | 00009602 | 00009F02 | 0000A702 | 0000AF02 | 0000B702 | CTR-N-HFR? | Friend List (friend) | v0, v1026, [v2051](2.2.0-X "wikilink"), v3082, v4099, [v5120](7.0.0-13 "wikilink"), [v6144](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) (EUR v6, v1024, v3082, v4099, [v5120](7.0.0-13 "wikilink"), [v6144](9.0.0-20 "wikilink")) |  |  |
| 00008E02 | 00009702 | 0000A002 | 0000A802 | 0000B002 | 0000B802 | CTR-N-HCR? | Notifications (newslist) | v0, v1029, v2054, v3075, [v4097](9.0.0-20 "wikilink") (EUR v6, v1024, v2054, v3075, [v4097](9.0.0-20 "wikilink")) (JPN: ..., [v4096](8.1.0-0_New3DS "wikilink"), [v5121](9.0.0-20 "wikilink")) |  |  |
| 0000C002 | 0000C802 | 0000D002 | 0000D802 | 0000DE02 | 0000E402 | CTR-N-HKY? | Software Keyboard (swkbd) | v0, v1026, v2053, [v3072](7.0.0-13 "wikilink"), [v4096](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 0000C003 | 0000C803 | 0000D003 | 0000D803 | 0000DE03 | 0000E403 |  | SAFE_MODE Software Keyboard (swkbd) | v0 |  |  |
| 2000C003 | 2000C803 | 2000D003 | ? | 2000DE03 | N/A |  | [New 3DS](New_3DS "wikilink") SAFE_MODE Software Keyboard (swkbd) | [v1024](8.1.0-0_New3DS "wikilink") | [v0](9.0.0-20 "wikilink") |  |
| 0000C102 | 0000C902 | 0000D102 | 0000D902 | 0000DF02 | 0000E502 | CTR-N-HMS? | Mii picker (appletEd) | v0, v1026, [v2048](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v3077](9.3.0-21 "wikilink") |  |  |
| 0000C302 | 0000CB02 | 0000D302 | 0000DB02 | 0000E102 | 0000E702 | CTR-N-HCC? | Picture picker (PNOTE_AP) | v0, v1024, [v2049](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v3075](9.0.0-20 "wikilink"), [v4096](9.3.0-21 "wikilink") |  |  |
| 0000C402 | 0000CC02 | 0000D402 | 0000DC02 | 0000E202 | 0000E802 | CTR-N-HMC? | [Voice memo](Nintendo_3DS_Sound "wikilink") picker (SNOTE_AP) | v0, v3, [v1026](8.0.0-18 "wikilink"), [v2048](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |  |  |
| 0000C502 |  |  | 0000CF02 |  |  | CTR-N-HEEA
CTR-N-HEEK | Non-critical (online, etc) error display (error) | v0, v1026, v2053, v3074, [v4096](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v5128](9.0.0-20 "wikilink"), [v6145](9.6.0-24 "wikilink") |  |  |
| 0000C503 |  |  | 0000CF03 |  |  |  | SAFE_MODE error applet | v0 |  |  |
| 2000C503 | 2000C503 | 2000C503 | ? | 2000CF03 | N/A |  | [New 3DS](New_3DS "wikilink") SAFE_MODE error applet | [v1024](8.1.0-0_New3DS "wikilink") |  |  |
| 0000CD02 |  |  | 0000D502 |  |  | CTR-N-HADA
CTR-N-HADK | [Circle Pad Pro](Circle_Pad_Pro "wikilink") test/calibration applet (extrapad) | v1, v1026, [v2048](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v3073](9.0.0-20 "wikilink"), [v4097](11.4.0-37 "wikilink")(New2DSXL), [v4097](11.5.0-38 "wikilink") |  |  |
| 0000C602 | 0000CE02 | 0000D602 | N/A | 0000E302 | 0000E902 | CTR-N-HAA? | eShop applet, used by applications for accessing the eShop, for DLC/etc. Also used by the eShop application itself. (mint) | v5, v1028, [v2050](4.2.0-9 "wikilink"), [v3072](5.0.0-11 "wikilink"), [v4109](7.0.0-13 "wikilink"), [v5125](7.2.0-17 "wikilink")(v5123 for JPN), [v6145](8.0.0-18 "wikilink"), [v7168](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v8200](9.0.0-20 "wikilink"), [v9224](9.3.0-21 "wikilink"), [v10247](9.6.0-24 "wikilink"), [v11264](9.8.0-25 "wikilink"), [v12293](10.0.0-27 "wikilink"), [v13312](10.1.0-27 "wikilink"), [v14337](10.3.0-28 "wikilink"), [v15360](10.4.0-29 "wikilink"), [v16384](10.7.0-32 "wikilink"), [v17408](11.2.0-35 "wikilink")(EUR), [v18432](11.3.0-36 "wikilink"), [v19457](11.5.0-38 "wikilink") |  |  |
| 0000BC02 | 0000BD02 | 0000BE02 | ? | N/A | ? | CTR-N-HAE? | Miiverse (olv) | [v14](7.0.0-13 "wikilink"), [v1024](7.2.0-17 "wikilink"), [v2048](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v3072](9.3.0-21 "wikilink"), [v4096](9.6.0-24 "wikilink") |  |  |
| 0000F602 |  |  | ? | N/A | ? | CTR-N-HAGA | Likely the "system library" for Miiverse (memolib) | [v5](7.0.0-13 "wikilink"), [v1024](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v2050](9.0.0-20 "wikilink"), [v3072](9.3.0-21 "wikilink") |  |  |
| 00008302 | 00008B02 | 0000BA02 | ? | N/A | ? | CTR-N-HAH? | In-app Miiverse-posting applet (solv3) | [v6](9.0.0-20 "wikilink") |  |  |
| 00009502 | 00009E02 | 0000B902 | ? | 00008C02 | 0000BF02 | CTR-N-HA3? | Cabinet ([amiibo Settings](amiibo_Settings "wikilink")) | [v7](9.3.0-21 "wikilink"), (v1024 for TWN), [v1031](9.6.0-24 "wikilink") |  |  |

### 0004009B - [Shared Data Archives](NCCH#cfa "wikilink")

| JPN TitleIDLow | USA TitleIDLow | EUR TitleIDLow | CHN TitleIDLow | KOR TitleIDLow | TWN TitleIDLow | Description | Versions |
|----|----|----|----|----|----|----|----|
| 00010202 | 00010202 | 00010202 | 00010202 | 00010202 | 00010202 | Probably Mii-related, contains "CFL_Res.dat" in the RomFS. | v0 |
| 00010402 | 00010402 | 00010402 | 00010402 | 00010402 | 00010402 | Region Manifest. Mounted as "area:" | v0, v1024, v2050, v3072, [v4098](7.0.0-13 "wikilink"), [v5122](9.6.0-24 "wikilink") |
| 00010602 | 00010602 | 00010602 | 00010602 | 00010602 | 00010602 | Non-Nintendo TLS Root-CA Certificates (RomFS contains files with filename "CACERT_PUBLIC_CA\_<val>.der", where <val> is 5..8) | v2, [v1024](10.5.0-30 "wikilink") |
|  |  |  | 00011002 |  |  | "CHN/CN" Dictionary. | v1 |
|  |  |  |  |  | 00011102 | "TWN/TN" dictionary. | v1 |
|  |  | 00011202 |  |  |  | "NL/NL" dictionary. | v0 |
|  |  | 00011302 |  |  |  | "EN/GB" dictionary. | v0 |
|  | 00011402 |  |  |  |  | "EN/US" dictionary. | v0 |
|  |  | 00011502 |  |  |  | "FR/FR/regular" dictionary. | v0 |
|  | 00011602 |  |  |  |  | "FR/CA/regular" dictionary. | v0 |
|  |  | 00011702 |  |  |  | "DE/regular" dictionary. | v0 |
|  |  | 00011802 |  |  |  | "IT/IT" dictionary. | v0 |
| 00011902 |  |  |  |  |  | "JA_small/32" dictionary. | v0 |
|  |  |  |  | 00011A02 |  | "KO/KO" dictionary. | v1 |
|  |  | 00011B02 |  |  |  | "PT/PT/regular" dictionary. | v0 |
|  |  | 00011C02 |  |  |  | "RU/regular" dictionary. | v0 |
|  | 00011D02 | 00011D02 |  |  |  | "ES/ES" dictionary. | v0 |
|  | 00011E02 |  |  |  |  | "PT/BR/regular" dictionary. | v0 |
| 00012202 | 00012302 | 00012102 | 00012402 | 00012502 | 00012602 | ?contains a lists with error strings | v1026, v2053, v3073, [v4096](4.2.0-9 "wikilink"), [v5120](5.0.0-11 "wikilink"), [v6149](7.0.0-13 "wikilink"), [v7168](7.2.0-17 "wikilink"), [v8192](8.0.0-18 "wikilink"), [v9218](9.0.0-20 "wikilink"), [v10242](9.3.0-21 "wikilink"), [v11269](9.6.0-24 "wikilink"), [v12289](10.0.0-27 "wikilink"), [v13312](10.4.0-29 "wikilink"), [v13313](10.7.0-32 "wikilink") (JPN: [v14336](11.1.0-34 "wikilink")) (KOR: [v6148](9.6.0-24 "wikilink"), [v7169](10.0.0-27 "wikilink"), [v8193](10.3.0-28 "wikilink"), [v9216](10.4.0-29 "wikilink"), [v10240](11.1.0-34 "wikilink")) |
| 00013202 | 00013302 | 00013102 | 00013402 | 00013502 | 00013602 | Mounted as "eula:" | v0, v1024, v2049 USA: v1024, v2051, [v3074](7.0.0-13 "wikilink"), [v4100](7.2.0-17 "wikilink")(EUR-only), [v4099](9.0.0-20 "wikilink"), [v6144](9.9.0-26 "wikilink"), [v7168](10.4.0-29 "wikilink") (KOR: [v1025](9.7.0-25 "wikilink")) |
| 00014002 | 00014002 | 00014002 | 00014002 | 00014002 | 00014002 | JPN/EUR/USA [System Font](System_Font "wikilink") ("font:") | v0 |
| 00014102 | 00014102 | 00014102 | 00014102 | 00014102 | 00014102 | CHN [System Font](System_Font "wikilink") ("font:") | v0, v1024 |
| 00014202 | 00014202 | 00014202 | 00014202 | 00014202 | 00014202 | KOR [System Font](System_Font "wikilink") ("font:") | v0, v1024 |
| 00014302 | 00014302 | 00014302 | 00014302 | 00014302 | 00014302 | TWN [System Font](System_Font "wikilink") ("font:") | v0, v1024 |
| 00015202 | 00015302 | 00015102 | N/A | 00015502 | 0015602 | Mounted as "rate:" | v0 (EUR: v0, v1024) (KOR: v1024) |

### 000400DB - [System Data Archives](NCCH#cfa "wikilink")

#### System Data Archive Notes

These [NVer](NVer "wikilink") titleIDs can be found @ offset 0x320 in every [CCI](CCI "wikilink").

| JPN TitleIDLow | USA TitleIDLow | EUR TitleIDLow | CHN TitleIDLow | KOR TitleIDLow | TWN TitleIDLow | Description | USA/EUR/JPN Versions | CHN Versions | TWN Versions | KOR Versions |
|----|----|----|----|----|----|----|----|----|----|----|
| 00010302 | 00010302 | 00010302 | 00010302 | 00010302 | 00010302 | NGWord bad word list | [v0](1.0.0-0 "wikilink"), [v1024](2.0.0-2 "wikilink"), [v2052](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v4096](4.3.0-10 "wikilink"), [v5120](5.0.0-11 "wikilink"), [v6144](9.0.0-20 "wikilink"), [v7168](9.3.0-21 "wikilink"), [v8192](9.6.0-24 "wikilink"), [v9217](11.1.0-34 "wikilink") |  |  |  |
| 00010502 | 00010502 | 00010502 | 00010502 | 00010502 | 00010502 | [Nintendo Zone](Nintendo_Zone "wikilink") hotspot list | [v0](1.0.0-0 "wikilink"), [v1024](2.0.0-2 "wikilink"), [v2048](3.0.0-5 "wikilink"), [v3073](4.0.0-7 "wikilink"), [v4096](4.3.0-10 "wikilink"), [v5120](4.4.0-10 "wikilink"), [v6144](4.5.0-10 "wikilink"), [v7169](5.0.0-11 "wikilink"), [v8192](6.0.0-11 "wikilink"), [v9216](6.2.0-12 "wikilink"), [v10242](7.0.0-13 "wikilink"), [v11267](7.2.0-17 "wikilink"), [v12288](8.0.0-18 "wikilink"), [v14336](9.0.0-20 "wikilink"), [v15360](9.3.0-21 "wikilink"), [v16386](9.6.0-24 "wikilink"), [v17409](10.0.0-27 "wikilink"), [v18432](10.4.0-29 "wikilink"), [v19457](11.1.0-34 "wikilink"), [v20480](11.5.0-38 "wikilink"), [v22528](11.9.0-42 "wikilink") |  |  |  |
| 00016202 | 00016302 | 00016102 | 00016402 | 00016502 | 00016602 | [NVer](NVer "wikilink") | [v0](1.0.0-0 "wikilink"), [v16](1.1.0-1 "wikilink"), [v32](2.0.0-2 "wikilink"), [v48](2.1.0-3 "wikilink"), [v64](2.1.0-4 "wikilink"), [v80](3.0.0-5 "wikilink"), [v96](3.0.0-6 "wikilink"), [v112](4.0.0-7 "wikilink"), [v128](4.1.0-8 "wikilink"), [v144](4.2.0-9 "wikilink"), [v160](4.3.0-10 "wikilink"), [v176](5.0.0-11 "wikilink"), non-USA=[v192](6.0.0-11 "wikilink")/USA=[v192](6.1.0-12U "wikilink"), [v208](7.0.0-13 "wikilink"), [v224](7.1.0-14 "wikilink"), [v240](7.1.0-15 "wikilink"), [v256](7.1.0-16 "wikilink"), [v272](7.2.0-17 "wikilink"), [v288](8.0.0-18 "wikilink"), [v304](8.1.0-19 "wikilink"), [v320](9.0.0-20 "wikilink"), [v336](9.3.0-21 "wikilink"), [v352](9.5.0-22 "wikilink"), [v368](9.5.0-23 "wikilink"), [v384](9.6.0-24 "wikilink"), [v400](9.7.0-25 "wikilink"), [v416](9.9.0-26 "wikilink"), [v432](10.0.0-27 "wikilink"), [v448](10.2.0-28 "wikilink"), [v464](10.4.0-29 "wikilink"), [v480](10.5.0-30 "wikilink"), [v496](10.6.0-31 "wikilink"), [v512](10.7.0-32 "wikilink"), [v528](11.0.0-33 "wikilink"), [v544](11.1.0-34 "wikilink"), [v560](11.2.0-35 "wikilink"), [v576](11.3.0-36 "wikilink"), [v608](11.5.0-38 "wikilink"), ..., [v672](11.9.0-42 "wikilink") | [v113](4.0.0-7 "wikilink"), [v128](4.2.0-9 "wikilink"), [v129](5.0.0-11 "wikilink"), [v130](7.1.0-16 "wikilink"), [v272](7.2.0-17 "wikilink"), [v131](9.5.0-23 "wikilink"), [v132](9.9.0-26 "wikilink") | [v114](4.1.0-8 "wikilink"), [v133](4.2.0-9 "wikilink"), [v134](4.3.0-10 "wikilink"), [v136](5.0.0-11 "wikilink"), [v144](7.0.0-13 "wikilink"), [v160](7.1.0-14 "wikilink") [v192](7.1.0-16 "wikilink"), [v272](7.2.0-17 "wikilink"), [v208](8.0.0-18 "wikilink"), [v224](8.1.0-19 "wikilink"), [v240](9.0.0-20 "wikilink"), [v272](9.5.0-22 "wikilink"), [v288](9.5.0-23 "wikilink"), [v304](9.6.0-24 "wikilink"), [v320](9.7.0-25 "wikilink"), [v336](9.9.0-26 "wikilink"), [v352](10.0.0-27 "wikilink"), [v368](10.2.0-28 "wikilink"), [v384](10.4.0-29 "wikilink"), [v400](10.5.0-30 "wikilink"), [v416](10.6.0-31 "wikilink"), [v432](10.7.0-32 "wikilink"), [v448](11.0.0-33 "wikilink"), [v464](11.1.0-34 "wikilink"), [v480](11.2.0-35 "wikilink"), [v496](11.3.0-36 "wikilink"), ..., [v544](11.9.0-42 "wikilink") | [v113](4.0.0-7 "wikilink"), [v114](4.1.0-8 "wikilink"), [v133](4.2.0-9 "wikilink"), [v134](4.3.0-10 "wikilink"), [v136](5.0.0-11 "wikilink"), [v160](7.0.0-13 "wikilink"), [v176](7.1.0-14 "wikilink"), [v176](7.1.0-16 "wikilink"), [v272](7.2.0-17 "wikilink"), [v224](8.0.0-18 "wikilink"), [v240](8.1.0-19 "wikilink"), [v256](9.0.0-20 "wikilink"), [v272](9.3.0-21 "wikilink"), [v288](9.5.0-22 "wikilink"), [v304](9.5.0-23 "wikilink"), [v320](9.6.0-24 "wikilink"), [v336](9.7.0-25 "wikilink"), [v352](9.9.0-26 "wikilink"), [v368](10.0.0-27 "wikilink"), [v384](10.2.0-28 "wikilink"), [v400](10.4.0-29 "wikilink"), [v416](10.5.0-30 "wikilink"), [v432](10.6.0-31 "wikilink"), [v448](10.7.0-32 "wikilink"), [v464](11.0.0-33 "wikilink"), [v480](11.1.0-34 "wikilink"), [v496](11.2.0-35 "wikilink"), [v512](11.3.0-36 "wikilink"), ..., [v576](11.9.0-42 "wikilink") |
| 20016202 | 20016302 | 20016102 | N/A | 20016502 | N/A | [New_3DS](New_3DS "wikilink") [NVer](NVer "wikilink") | [v0](8.1.0-0_New3DS "wikilink"), [v320](9.0.0-20 "wikilink"), [v336](9.3.0-21 "wikilink"), [v352](9.5.0-22 "wikilink"), [v352](9.5.0-22 "wikilink"), [v368](9.5.0-23 "wikilink"), [v384](9.6.0-24 "wikilink"), [v400](9.7.0-25 "wikilink"), [v416](9.9.0-26 "wikilink"), [v432](10.0.0-27 "wikilink"), [v448](10.2.0-28 "wikilink"), [v464](10.4.0-29 "wikilink"), [v480](10.5.0-30 "wikilink"), [v496](10.6.0-31 "wikilink"), [v512](10.7.0-32 "wikilink"), [v528](11.0.0-33 "wikilink"), [v544](11.1.0-34 "wikilink"), [v560](11.2.0-35 "wikilink"), [v576](11.3.0-36 "wikilink"), ..., [v672](11.9.0-42 "wikilink") | N/A | N/A | [v320](9.6.0-24 "wikilink"), [v336](9.7.0-25 "wikilink"), [v352](9.9.0-26 "wikilink"), [v368](10.0.0-27 "wikilink"), [v384](10.2.0-28 "wikilink"), [v400](10.4.0-29 "wikilink"), [v416](10.5.0-30 "wikilink"), [v432](10.6.0-31 "wikilink"), [v448](10.7.0-32 "wikilink"), [v464](11.0.0-33 "wikilink"), [v496](11.2.0-35 "wikilink"), [v512](11.3.0-36 "wikilink"), ..., [v576](11.9.0-42 "wikilink") |
| 00017202 | 00017302 | 00017102 | 00017402 | 00017502 | 00017602 | [CVer](CVer "wikilink") | [v1024](1.0.0-0 "wikilink"), [v1045](1.1.0-1 "wikilink"), [v2049](2.0.0-2 "wikilink"), [v2069](2.1.0-3 "wikilink"), [v2088](2.2.0-X "wikilink") [v3088](3.0.0-5 "wikilink"), [v4098](4.0.0-7 "wikilink"), [v4113](4.1.0-8 "wikilink"), [v4130](4.2.0-9 "wikilink"), [v4145](4.3.0-10 "wikilink"), [v4163](4.4.0-10 "wikilink"), [v4176](4.5.0-10 "wikilink"), [v5120](5.0.0-11 "wikilink"), [v5136](5.1.0-11 "wikilink"), [v6146](6.0.0-11 "wikilink"), [v6160](6.1.0-11 "wikilink"), [v6178](6.2.0-12 "wikilink"), [v6192](6.3.0-12 "wikilink"), [v7175](7.0.0-13 "wikilink"), [v7187](7.1.0-14 "wikilink"), [v7203](7.2.0-17 "wikilink"), [v8196](8.0.0-18 "wikilink"), [v8208](8.1.0-18 "wikilink"), [v8215](8.1.0-0_New3DS "wikilink")(8.1.0-0_New3DS), [v9218](9.0.0-20 "wikilink"), [v9232](9.1.0-20J "wikilink")(JPN-only), [v9248](9.2.0-20 "wikilink"), [v9264](9.3.0-21 "wikilink"), [v9280](9.4.0-21 "wikilink"), [v9296](9.5.0-22 "wikilink"), [v9319](9.6.0-24 "wikilink"), [v9328](9.7.0-25 "wikilink"), [v9344](9.8.0-25 "wikilink"), [v9360](9.9.0-26 "wikilink"), [v10240](10.0.0-27 "wikilink"), [v10256](10.1.0-27 "wikilink"), [v10272](10.2.0-28 "wikilink"), [v10288](10.3.0-28 "wikilink"), [v10304](10.4.0-29 "wikilink"), [v10320](10.5.0-30 "wikilink"), [v10336](10.6.0-31 "wikilink"), [v10352](10.7.0-32 "wikilink"), [v11264](11.0.0-33 "wikilink"), [v11280](11.1.0-34 "wikilink"), [v11296](11.2.0-35 "wikilink"), [v11312](11.3.0-36 "wikilink"), [...](11.4.0-37 "wikilink"), [v11344](11.5.0-38 "wikilink"), ..., [v11408](11.9.0-42 "wikilink") | [v1024](1.0.0-0 "wikilink"), [v1045](1.1.0-1 "wikilink"), [v2049](2.0.0-2 "wikilink"), [v2069](2.1.0-3 "wikilink"), [v2088](2.2.0-X "wikilink") [v3088](3.0.0-5 "wikilink"), [v4098](4.0.0-7 "wikilink"), [v4113](4.1.0-8 "wikilink"), [v4130](4.2.0-9 "wikilink"), [v4145](4.3.0-10 "wikilink"), [v4163](4.4.0-10 "wikilink"), [v4176](4.5.0-10 "wikilink"), [v5120](5.0.0-11 "wikilink"), [v5136](5.1.0-11 "wikilink"), [v6146](6.0.0-11 "wikilink"), [v6160](6.1.0-11 "wikilink"), [v6178](6.2.0-12 "wikilink"), [v6192](6.3.0-12 "wikilink"), [v7175](7.0.0-13 "wikilink"), [v7187](7.1.0-14 "wikilink"), [v7203](7.2.0-17 "wikilink"), [v8196](8.0.0-18 "wikilink"), [v8208](8.1.0-18 "wikilink"), [v9217](9.0.0-20 "wikilink"), [v9264](9.3.0-21 "wikilink"), [v9296](9.5.0-22 "wikilink"), [v9319](9.6.0-24 "wikilink"), [v9328](9.7.0-25 "wikilink"), [v9344](9.8.0-25 "wikilink"), [v9360](9.9.0-26 "wikilink"), [v10240](10.0.0-27 "wikilink"), [v10272](10.2.0-28 "wikilink"), [v10304](10.4.0-29 "wikilink"), [v10320](10.5.0-30 "wikilink"), [v10336](10.6.0-31 "wikilink"), [v10352](10.7.0-32 "wikilink"), [v11296](11.2.0-35 "wikilink"), [v11312](11.3.0-36 "wikilink"), ..., [v11408](11.9.0-42 "wikilink") | Same as CHN | Same as CHN + [v11280](11.1.0-34 "wikilink") |

### 00040130 - System [Modules](Services_API "wikilink")

#### System Module Notes

Once Home Menu finishes loading, all of the below system modules are running, except for MP, RO, and act which are automatically [loaded](Process_Manager_Services "wikilink") when a process requires them.
When [PM](Process_Manager_Services "wikilink")-module terminates processes, it will check whether the processes listed as dependencies for this process are listed as dependencies for other processes.
Any processes which are no longer listed in any processes dependencies lists are then terminated. On [New_3DS](New_3DS "wikilink"), the only New3DS-specific system-module which automatically gets loaded during system boot is qtm.
All of the below system modules use the "BASE" [memory-region](SVC "wikilink")(specified in the exheader), except when listed otherwise for certain modules.
When handling the exheader dependency list starting with [8.0.0-18](8.0.0-18 "wikilink"), Old3DS FIRM [PM](Process_Manager_Services "wikilink")-module now skips handling titles in this list which have any bits in programID-low bitmask 0xF0000000 set(with [8.0.0-18](8.0.0-18 "wikilink") this is hard-coded).
The exheader dependency list handling change is for the [New 3DS](New_3DS "wikilink") system-module(s), which do not exist on Old3DS.
When the New3DS pm-module is launching any title except [NS](NS "wikilink"), it first attempts to launch the title with programID-low bitmask 0x20000000 set, then with that bitmask clear if launching fails.

| TitleID Low | Description | Versions |
|----|----|----|
| 00001002 | [sm](Services "wikilink") (Stored in [NATIVE_FIRM](FIRM "wikilink")) | N/A |
| 00001003 | SAFE_MODE [sm](Services "wikilink") (Stored in SAFE_MODE NATIVE_FIRM) | N/A |
| 00001102 | [fs](Filesystem_services "wikilink") (Stored in [NATIVE_FIRM](FIRM "wikilink")) | N/A |
| 00001103 | SAFE_MODE [fs](Filesystem_services "wikilink") (Stored in SAFE_MODE NATIVE_FIRM) | N/A |
| 00001202 | [pm](Process_Manager_Services "wikilink") (Stored in [NATIVE_FIRM](FIRM "wikilink")) | N/A |
| 00001203 | SAFE_MODE [pm](Process_Manager_Services "wikilink") (Stored in SAFE_MODE NATIVE_FIRM) | N/A |
| 00001302 | [loader](Loader_Services "wikilink") (Stored in [NATIVE_FIRM](FIRM "wikilink")) | N/A |
| 00001303 | SAFE_MODE [loader](Loader_Services "wikilink") (Stored in SAFE_MODE NATIVE_FIRM) | N/A |
| 00001402 | [pxi](PXI_Services "wikilink") (Stored in [NATIVE_FIRM](FIRM "wikilink")) | N/A |
| 00001403 | SAFE_MODE [pxi](PXI_Services "wikilink") (Stored in SAFE_MODE NATIVE_FIRM) | N/A |
| 00001502 | [AM](Application_Manager_Services "wikilink") ( Application Manager ) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2053](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v4098](5.0.0-11 "wikilink"), [v5120](6.0.0-11 "wikilink"), [v6148](8.0.0-18 "wikilink"), [v7168](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v8192](9.0.0-20 "wikilink"), [v9217](10.0.0-27 "wikilink") |
| 00001503 | SAFE_MODE [AM](Application_Manager_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001503 | [New_3DS](New_3DS "wikilink") SAFE_MODE [AM](Application_Manager_Services "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |
| 00001602 | [Camera](Camera_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](3.0.0-5 "wikilink"), [v3074](4.0.0-7 "wikilink"), [v4098](5.0.0-11 "wikilink"), [v5120](6.0.0-11 "wikilink"), [v6146](7.1.0-14 "wikilink"), [v7172](8.0.0-18 "wikilink"), [v9216](9.0.0-20 "wikilink"), [v10242](9.3.0-21 "wikilink"), [v11265](10.0.0-27 "wikilink") |
| 20001602 | [New_3DS](New_3DS "wikilink") [Camera](Camera_Services "wikilink") | [v8200](8.1.0-0_New3DS "wikilink"), [v9218](9.0.0-20 "wikilink"), [v10242](9.3.0-21 "wikilink"), [v11265](10.0.0-27 "wikilink"), [v12288](11.4.0-37 "wikilink")(New2DSXL) |
| 00001702 | [Config](Config_Services "wikilink") (cfg) | [v0](1.0.0-0 "wikilink"), [v1024](2.0.0-2 "wikilink"), [v2049](3.0.0-5 "wikilink"), v3072, [v4096](4.0.0-7 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6145](6.0.0-11 "wikilink"), [v7168](6.1.0-11 "wikilink"), [v8196](7.0.0-13 "wikilink"), [v9220](7.2.0-17 "wikilink"), [v10243](8.0.0-18 "wikilink"), [v11265](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v12290](9.0.0-20 "wikilink"), [v13315](9.3.0-21 "wikilink"), [v14342](9.6.0-24 "wikilink"), [v15360](11.4.0-37 "wikilink")(New2DSXL)[v15360](11.5.0-38 "wikilink") |
| 00001703 | SAFE_MODE [Config](Config_Services "wikilink") (cfg) | [v0](1.0.0-0 "wikilink") |
| 20001703 | [New_3DS](New_3DS "wikilink") SAFE_MODE [Config](Config_Services "wikilink") (cfg) | [v11265](8.1.0-0_New3DS "wikilink") |
| 00001802 | [Codec](Codec_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4098](5.0.0-11 "wikilink"), [v5120](7.0.0-13 "wikilink"), [v6144](8.0.0-18 "wikilink"), [v7168](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")) |
| 00001803 | SAFE_MODE [Codec](Codec_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001803 | [New_3DS](New_3DS "wikilink") SAFE_MODE [Codec](Codec_Services "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |
| 00001A02 | [DSP](DSP_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](3.0.0-5 "wikilink"), [v2048](4.0.0-7 "wikilink"), [v3074](5.0.0-11 "wikilink"), [v4096](6.0.0-11 "wikilink"), [v5120](8.0.0-18 "wikilink"), [v6145](9.7.0-25 "wikilink"), [v7169](11.1.0-34 "wikilink") |
| 00001A03 | SAFE_MODE [DSP](DSP_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001A03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [DSP](DSP_Services "wikilink") | [v6145](8.1.0-0_New3DS "wikilink") |
| 00001B02 | [GPIO](GPIO_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2048](8.0.0-18 "wikilink"), [v3073](9.5.0-22 "wikilink") |
| 00001B03 | SAFE_MODE [GPIO](GPIO_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001B03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [GPIO](GPIO_Services "wikilink") | [v3073](8.1.0-0_New3DS "wikilink") |
| 00001C02 | [GSP](GSP_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1040](1.1.0-1 "wikilink"), [v2049](2.0.0-2 "wikilink"), [v3075](3.0.0-5 "wikilink"), v4098, [v5120](4.0.0-7 "wikilink"), [v6145](5.0.0-11 "wikilink"), [v7168](6.0.0-11 "wikilink"), [v8196](8.0.0-18 "wikilink"), [v10240](9.0.0-20 "wikilink"), [v11264](9.3.0-21 "wikilink"), [v12294](9.6.0-24 "wikilink"), [v13312](11.3.0-36 "wikilink"), [v14336](11.5.0-38 "wikilink") |
| 20001C02 | [New_3DS](New_3DS "wikilink") [GSP](GSP_Services "wikilink") | [v10243](8.1.0-0_New3DS "wikilink"), [v11267](9.3.0-21 "wikilink"), [v12294](9.6.0-24 "wikilink"), [v13312](11.3.0-36 "wikilink"), [v14336](11.4.0-37 "wikilink")(New2DSXL) |
| 00001C03 | SAFE_MODE [GSP](GSP_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001C03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [GSP](GSP_Services "wikilink") | [v9217](8.1.0-0_New3DS "wikilink") |
| 00001D02 | [HID](HID_Services "wikilink") (Human Interface Devices) | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5121](5.0.0-11 "wikilink"), [v6148](7.2.0-17 "wikilink"), [v7168](8.0.0-18 "wikilink"), [v8192](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v9216](9.0.0-20 "wikilink"), [v10240](9.3.0-21 "wikilink") |
| 00001D03 | SAFE_MODE [HID](HID_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001D03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [HID](HID_Services "wikilink") | [v8193](8.1.0-0_New3DS "wikilink") |
| 00001E02 | [i2c](I2C_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](3.0.0-5 "wikilink"), [v2049](5.0.0-11 "wikilink"), [v3076](8.0.0-18 "wikilink"), [v5120](9.3.0-21 "wikilink") |
| 20001E02 | [New_3DS](New_3DS "wikilink") [i2c](I2C_Services "wikilink") | [v4096](8.1.0-0_New3DS "wikilink"), [v5121](9.3.0-21 "wikilink") |
| 00001E03 | SAFE_MODE [i2c](I2C_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001E03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [i2c](I2C_Services "wikilink") | [v4097](8.1.0-0_New3DS "wikilink") |
| 00001F02 | [MCU](MCU_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](2.1.0-3 "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4102](4.0.0-7 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6145](6.0.0-11 "wikilink"), [v7168](7.0.0-13 "wikilink"), [v8192](8.0.0-18 "wikilink") |
| 20001F02 | [New_3DS](New_3DS "wikilink") [MCU](MCU_Services "wikilink") | [v8192](8.1.0-0_New3DS "wikilink"), [v9216](11.4.0-37 "wikilink")(New2DSXL) |
| 00001F03 | SAFE_MODE [MCU](MCU_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20001F03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [MCU](MCU_Services "wikilink") | [v9217](8.1.0-0_New3DS "wikilink") |
| 00002002 | [MIC](MIC_Services "wikilink") (Microphone) | [v0](1.0.0-0 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2048](8.0.0-18 "wikilink") |
| 00002102 | [PDN](PDN_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2048](8.0.0-18 "wikilink") |
| 00002103 | SAFE_MODE [PDN](PDN_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002103 | [New_3DS](New_3DS "wikilink") SAFE_MODE [PDN](PDN_Services "wikilink") | [v3073](8.1.0-0_New3DS "wikilink") |
| 00002202 | [PTM](PTM_Services "wikilink") (Play time, pedometer, and battery manager) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3075](3.0.0-5 "wikilink"), v4096, [v5120](4.0.0-7 "wikilink"), [v6146](5.0.0-11 "wikilink"), [v7168](6.0.0-11 "wikilink"), [v8192](7.0.0-13 "wikilink"), [v9219](8.0.0-18 "wikilink"), [v11264](9.6.0-24 "wikilink") |
| 20002202 | [New_3DS](New_3DS "wikilink") [PTM](PTM_Services "wikilink") (Play time, pedometer, and battery manager) | [v10240](8.1.0-0_New3DS "wikilink"), [v11264](9.6.0-24 "wikilink") |
| 00002203 | SAFE_MODE [PTM](PTM_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002203 | [New_3DS](New_3DS "wikilink") SAFE_MODE [PTM](PTM_Services "wikilink") | [v10241](8.1.0-0_New3DS "wikilink") |
| 00002302 | [spi](SPI_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2049](5.0.0-11 "wikilink"), [v3072](8.0.0-18 "wikilink") |
| 20002302 | [New_3DS](New_3DS "wikilink") [spi](SPI_Services "wikilink") | [v4096](8.1.0-0_New3DS "wikilink") |
| 00002303 | SAFE_MODE [spi](SPI_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002303 | [New_3DS](New_3DS "wikilink") SAFE_MODE [spi](SPI_Services "wikilink") | [v4097](8.1.0-0_New3DS "wikilink") |
| 00002402 | [AC](AC_Services "wikilink") (Network manager) | [v0](1.0.0-0 "wikilink"), [v1024](1.1.0-1 "wikilink"), [v2052](2.0.0-2 "wikilink"), [v3072](2.1.0-3 "wikilink"), [v4101](3.0.0-5 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6145](7.0.0-13 "wikilink"), [v7172](8.0.0-18 "wikilink"), [v8192](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v9216](9.3.0-21 "wikilink") |
| 00002403 | SAFE_MODE [AC](AC_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002403 | [New_3DS](New_3DS "wikilink") SAFE_MODE [AC](AC_Services "wikilink") | [v8193](8.1.0-0_New3DS "wikilink") |
| 00002602 | [Cecd](CECD_Services "wikilink") (StreetPass) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3073](3.0.0-5 "wikilink"), [v4097](4.0.0-7 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6144](6.0.0-11 "wikilink"), [v7170](6.2.0-12 "wikilink"), [v8193](7.0.0-13 "wikilink"), [v9216](8.0.0-18 "wikilink"), [v10240](9.0.0-20 "wikilink") |
| 00002702 | [CSND](CSND_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2048](4.0.0-7 "wikilink"), [v3073](5.0.0-11 "wikilink"), [v4096](8.0.0-18 "wikilink"), [v5120](9.0.0-20 "wikilink") |
| 00002703 | SAFE_MODE [CSND](CSND_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002703 | [New_3DS](New_3DS "wikilink") SAFE_MODE [CSND](CSND_Services "wikilink") | [v5121](8.1.0-0_New3DS "wikilink") |
| 00002802 | [DLP](DLP_Services "wikilink") ([Download Play](Download_Play "wikilink")) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3078](3.0.0-5 "wikilink"), [v4099](5.0.0-11 "wikilink"), [v5123](8.0.0-18 "wikilink"), [v6145](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v7174](9.6.0-24 "wikilink"), [v8192](10.0.0-27 "wikilink") |
| 00002902 | [HTTP](HTTP_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2049](2.1.0-3 "wikilink"), [v3072](2.2.0-X "wikilink"), [v4099](3.0.0-5 "wikilink"), [v5122](4.0.0-7 "wikilink"), [v6145](5.0.0-11 "wikilink"), [v7171](7.0.0-13 "wikilink"), [v8192](7.1.0-14 "wikilink"), [v9220](8.0.0-18 "wikilink"), [v10245](8.1.0-18 "wikilink"), [v11264](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v12288](9.0.0-20 "wikilink"), [v13318](9.6.0-24 "wikilink"), [v14336](11.4.0-37 "wikilink") |
| 00002903 | SAFE_MODE [HTTP](HTTP_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002903 | [New_3DS](New_3DS "wikilink") SAFE_MODE [HTTP](HTTP_Services "wikilink") | [v10241](8.1.0-0_New3DS "wikilink") |
| 00002A02 | [MP](MP_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](5.0.0-11 "wikilink"), [v2048](8.0.0-18 "wikilink") |
| 00002A03 | SAFE_MODE [MP](MP_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 00002B02 | [NDM](NDM_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2049](3.0.0-5 "wikilink"), [v3072](4.0.0-7 "wikilink"), [v4098](5.0.0-11 "wikilink"), [v5124](8.0.0-18 "wikilink"), [v6144](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v7169](9.0.0-20 "wikilink") |
| 00002C02 | [NIM](NIM_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1028](2.0.0-2 "wikilink"), [v2055](3.0.0-5 "wikilink"), [v3074](4.0.0-7 "wikilink"), [v4100](5.0.0-11 "wikilink"), [v5120](6.0.0-11 "wikilink"), [v6148](7.0.0-13 "wikilink"), [v7174](7.2.0-17 "wikilink"), [v8195](8.0.0-18 "wikilink"), [v9217](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v10249](9.0.0-20 "wikilink"), [v11267](9.3.0-21 "wikilink"), [v12296](9.6.0-24 "wikilink"), [v13313](10.0.0-27 "wikilink") |
| 00002C03 | SAFE_MODE [NIM](NIM_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002C03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [NIM](NIM_Services "wikilink") | [v9217](8.1.0-0_New3DS "wikilink") |
| 00002D02 | [NWM](NWM_Services "wikilink") ( Low-level wifi manager ) | [v0](1.0.0-0 "wikilink"), [v1024](1.1.0-1 "wikilink"), [v2052](2.0.0-2 "wikilink"), [v3072](2.2.0-X "wikilink"), [v4101](3.0.0-5 "wikilink"), [v5120](4.0.0-7 "wikilink"), [v6148](5.0.0-11 "wikilink"), [v7169](6.0.0-11 "wikilink"), [v8196](7.2.0-17 "wikilink"), [v9216](8.0.0-18 "wikilink"), [v10240](9.0.0-20 "wikilink") |
| 00002D03 | SAFE_MODE [NWM](NWM_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v5120](6.0.0-11 "wikilink") |
| 20002D03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [NWM](NWM_Services "wikilink") | [v10241](8.1.0-0_New3DS "wikilink") |
| 00002E02 | [Sockets](Socket_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](1.1.0-1 "wikilink"), [v2053](2.0.0-2 "wikilink"), [v3075](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5121](5.0.0-11 "wikilink"), [v6144](8.0.0-18 "wikilink"), [v7168](9.0.0-20 "wikilink"), [v8192](10.6.0-31 "wikilink") |
| 00002E03 | SAFE_MODE [Sockets](Socket_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002E03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [Sockets](Socket_Services "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |
| 00002F02 | [SSL](SSL_Services "wikilink") | [v0](1.0.0-0 "wikilink"), [v1024](2.0.0-2 "wikilink"), [v2048](2.1.0-3 "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6144](8.0.0-18 "wikilink"), [v7168](9.0.0-20 "wikilink"), [v8198](9.6.0-24 "wikilink"), [v9217](11.14.0-46 "wikilink") |
| 00002F03 | SAFE_MODE [SSL](SSL_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20002F03 | [New_3DS](New_3DS "wikilink") SAFE_MODE [SSL](SSL_Services "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |
| 00003000 | [Process9](FIRM "wikilink") (in SAFE_MODE and normal NATIVE_FIRM) |  |
| 00003102 | [PS](Process_Services "wikilink") ( Process Manager ) | [v0](1.0.0-0 "wikilink"), [v1025](2.0.0-2 "wikilink"), [v2049](5.0.0-11 "wikilink"), [v3072](6.0.0-11 "wikilink"), [v4096](8.0.0-18 "wikilink"), [v5120](9.0.0-20 "wikilink") |
| 00003103 | SAFE_MODE [PS](Process_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20003103 | [New_3DS](New_3DS "wikilink") SAFE_MODE [PS](Process_Services "wikilink") | [v5121](8.1.0-0_New3DS "wikilink") |
| 00003202 | [friends](Friend_Services "wikilink") (Friends list) | [v0](1.0.0-0 "wikilink"), [v1028](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5122](5.0.0-11 "wikilink"), [v6145](7.0.0-13 "wikilink"), [v7172](8.0.0-18 "wikilink"), [v8192](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v9216](10.5.0-30 "wikilink"), [v10240](10.7.0-32 "wikilink"), [v11264](11.0.0-33 "wikilink"), [v12288](11.1.0-34 "wikilink"), [v13312](11.2.0-35 "wikilink"), [v14336](11.3.0-36 "wikilink"), [v15360](11.4.0-37 "wikilink") |
| 00003203 | SAFE_MODE [friends](Friend_Services "wikilink") (Friends list) | [v0](1.0.0-0 "wikilink") |
| 20003203 | [New_3DS](New_3DS "wikilink") SAFE_MODE [friends](Friend_Services "wikilink") (Friends list) | [v8193](8.1.0-0_New3DS "wikilink") |
| 00003302 | [IR](IR_Services "wikilink") (Infrared) | [v0](1.0.0-0 "wikilink"), [v1026](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5121](5.0.0-11 "wikilink"), [v6148](8.0.0-18 "wikilink"), [v7170](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v8192](9.0.0-20 "wikilink"), [v9216](9.3.0-21 "wikilink"), [v10246](9.6.0-24 "wikilink"), [v11265](10.0.0-27 "wikilink"), [v12289](10.6.0-31 "wikilink") |
| 00003303 | SAFE_MODE [IR](IR_Services "wikilink") | [v0](1.0.0-0 "wikilink") |
| 20003303 | [New_3DS](New_3DS "wikilink") SAFE_MODE [IR](IR_Services "wikilink") | [v7169](8.1.0-0_New3DS "wikilink") |
| 00003402 | [BOSS](BOSS_Services "wikilink") (SpotPass) | [v0](1.0.0-0 "wikilink"), [v1024](1.1.0-1 "wikilink"), [v2053](2.0.0-2 "wikilink"), [v3073](2.2.0-X "wikilink"), [v4101](3.0.0-5 "wikilink"), [v5122](4.0.0-7 "wikilink"), [v6146](5.0.0-11 "wikilink"), [v7169](6.0.0-11 "wikilink"), [v8193](6.2.0-12 "wikilink"), [v9222](7.0.0-13 "wikilink"), [v10240](8.0.0-18 "wikilink"), [v11266](9.0.0-20 "wikilink"), [v12289](10.0.0-27 "wikilink"), [v13314](10.4.0-29 "wikilink") |
| 00003502 | [News](News_Services "wikilink") (Notifications) | [v0](1.0.0-0 "wikilink"), [v1028](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4097](5.0.0-11 "wikilink"), [v5120](8.0.0-18 "wikilink"), [v6147](9.0.0-20 "wikilink"), [v7168](9.7.0-25 "wikilink") |
| 00003702 | [RO](RO_Services "wikilink") | [v0](2.0.0-2 "wikilink"), [v1024](4.0.0-7 "wikilink"), [v2049](5.0.0-11 "wikilink"), [v3074](7.2.0-17 "wikilink"), [v4096](8.0.0-18 "wikilink"), [v5120](9.0.0-20 "wikilink")(Also for [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v6148](9.3.0-21 "wikilink") |
| 00003802 | [act](ACT_Services "wikilink") (handles Nintendo Network **a**c**c**oun**t**s) | [v1029](7.0.0-13 "wikilink"), [v2050](7.1.0-14 "wikilink"), [v3077](7.2.0-17 "wikilink"), [v4099](8.0.0-18 "wikilink"), [v5120](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v6144](9.0.0-20 "wikilink"), [v7168](9.3.0-21 "wikilink"), [v8198](9.6.0-24 "wikilink"), [v9216](11.4.0-37 "wikilink")(New2DSXL), [v9216](11.5.0-38 "wikilink") |
| 00004002 | Old3DS [nfc](NFC_Services "wikilink") | [v2053](9.3.0-21 "wikilink"), [v4106](9.6.0-24 "wikilink"), [v5121](9.7.0-25 "wikilink"), [v6145](10.0.0-27 "wikilink"), [v7168](10.6.0-31 "wikilink"), [v8192](10.7.0-32 "wikilink") |
| 20004002 | [New_3DS](New_3DS "wikilink") [nfc](NFC_Services "wikilink") | [v0](8.1.0-0_New3DS "wikilink"), [v1024](9.0.0-20 "wikilink"), [v2053](9.3.0-21 "wikilink"), [v3073](9.5.0-22 "wikilink"), [v4102](9.6.0-24 "wikilink"), [v6145](10.0.0-27 "wikilink"), [v7168](10.6.0-31 "wikilink") |
| 20004102 | [New_3DS](New_3DS "wikilink") [mvd](MVD_Services "wikilink") | [v0](8.1.0-0_New3DS "wikilink"), [v1024](9.0.0-20 "wikilink") |
| 20004202 | [New_3DS](New_3DS "wikilink") [qtm](QTM_Services "wikilink") | [v8](8.1.0-0_New3DS "wikilink"), [v1024](9.0.0-20 "wikilink"), [v2052](9.3.0-21 "wikilink"), [v3072](11.4.0-37 "wikilink")(New2DSXL) |
| 00008002 | [NS](NS "wikilink") (Memory-region: "SYSTEM") | [v0](1.0.0-0 "wikilink"), [v1028](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3077](3.0.0-5 "wikilink"), v4096, [v5121](4.0.0-7 "wikilink"), [v6148](5.0.0-11 "wikilink"), [v7168](5.1.0-11 "wikilink"), [v8193](6.0.0-11 "wikilink"), [v9216](6.1.0-11 "wikilink"), [v10248](7.0.0-13 "wikilink"), [v11268](7.2.0-17 "wikilink"), [v12291](8.0.0-18 "wikilink"), [v13312](8.1.0-0_New3DS "wikilink")([8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")), [v14336](9.0.0-20 "wikilink"), [v15360](9.3.0-21 "wikilink"), [v16390](9.6.0-24 "wikilink"), [v17408](9.8.0-25 "wikilink"), [v18433](10.0.0-27 "wikilink"), [v19458](10.4.0-29 "wikilink"), [v20482](11.1.0-34 "wikilink"), [v21504](11.3.0-36 "wikilink") |
| 00008003 | SAFE_MODE [NS](NS "wikilink") (Memory-region: "SYSTEM") | [v0](1.0.0-0 "wikilink") |
| 20008003 | [New_3DS](New_3DS "wikilink") SAFE_MODE [NS](NS "wikilink") (Memory-region: "SYSTEM") | [v13313](8.1.0-0_New3DS "wikilink") |

### 00040138 - [System Firmware](FIRM "wikilink")

#### System Firmare Notes

NATIVE_FIRM and SAFE_MODE_FIRM for the initial versions are exactly the same, besides [core-version](Configuration_Memory "wikilink") fields. SAFE_MODE_FIRM is used for running SAFE_MODE titles, on retail SAFE_MODE_FIRM seems to be only used for running the [System Updater](System_Settings#system_updater "wikilink") application. When a GBA VC title is launched, AGB_FIRM is launched to handle running this title. GBA VC savegames stored under SD card /title/<TID>/data use a custom format, this is handled by AGB_FIRM.

| TitleID Low | Description | USA/EUR/JPN Versions | CHN Versions | KOR Versions | TWN Versions |
|----|----|----|----|----|----|
| 00000001 | Unknown, very similar to SAFE_MODE_FIRM. Exists only on dev units and seems to only be used by SystemUpdaters. | v0 |  |  |  |
| 00000002 | NATIVE_FIRM (Native Firmware) | [v432](1.0.0-0 "wikilink"), [v1472](1.1.0-1 "wikilink"), [v2516](2.0.0-2 "wikilink"), [v3553](2.1.0-3 "wikilink"), [v4595](2.2.0-X "wikilink"), [v5647](3.0.0-5 "wikilink"), [v6677](4.0.0-7 "wikilink"), [v7712](4.1.0-8 "wikilink"), [v8758](5.0.0-11 "wikilink"), [v9792](5.1.0-11 "wikilink"), [v10833](6.0.0-11 "wikilink"), [v11872](6.1.0-11 "wikilink"), [v12916](7.0.0-13 "wikilink"), [v13956](7.2.0-17 "wikilink"), v15043, [v15047](8.0.0-18 "wikilink"), [v17120](9.0.0-20 "wikilink"), [v18182](9.3.0-21 "wikilink"), [v19216](9.5.0-22 "wikilink"), [v20262](9.6.0-24 "wikilink"), [v21288](10.0.0-27 "wikilink"), [v22313](10.2.0-28 "wikilink"), [v23341](10.4.0-29 "wikilink"), [v24368](11.0.0-33 "wikilink"), [v25396](11.1.0-34 "wikilink"), [v26432](11.2.0-35 "wikilink"), [v27476](11.3.0-36 "wikilink") | Same as USA/EUR/JPN starting with the USA/EUR/JPN [4.0.0-7](4.0.0-7 "wikilink") title-version | Same as CHN. | Same as CHN. |
| 20000002 | [New_3DS](New_3DS "wikilink") NATIVE_FIRM (Native Firmware) | [v16085](8.1.0-0_New3DS "wikilink"), [v17120](9.0.0-20 "wikilink"), [v18182](9.3.0-21 "wikilink"), [v19218](9.5.0-22 "wikilink"), [v20262](9.6.0-24 "wikilink"), [v21288](10.0.0-27 "wikilink"), [v22313](10.2.0-28 "wikilink"), [v23341](10.4.0-29 "wikilink"), [v24368](11.0.0-33 "wikilink"), [v25396](11.1.0-34 "wikilink"), [v26432](11.2.0-35 "wikilink"), [v27476](11.3.0-36 "wikilink") | N/A | Same as CHN. | Same as CHN. |
| 00000003 | SAFE_MODE_FIRM | [v432](1.0.0-0 "wikilink"), [v5632](3.0.0-5 "wikilink") | Same as USA/EUR/JPN starting with the USA/EUR/JPN [3.0.0-5](3.0.0-5 "wikilink") title-version | Same as CHN. | Same as CHN. |
| 20000003 | [New_3DS](New_3DS "wikilink") SAFE_MODE_FIRM | [v16081](8.1.0-0_New3DS "wikilink") | N/A | Same as CHN. | Same as CHN. |
| 00000102 | TWL_FIRM ( DSi Firmware ) | [v432](1.0.0-0 "wikilink"), [v1489](2.0.0-2 "wikilink"), [v2565](3.0.0-5 "wikilink"), v3601, [v4625](4.0.0-7 "wikilink"), [v5681](4.4.0-10 "wikilink"), [v6704](4.5.0-10 "wikilink"), [v7762](6.0.0-11 "wikilink"), [v8817](6.2.0-12 "wikilink") | Same as USA/EUR/JPN starting with the USA/EUR/JPN [4.0.0-7](4.0.0-7 "wikilink") title-version | Same as CHN. | Same as CHN. |
| 20000102 | [New_3DS](New_3DS "wikilink") TWL_FIRM ( DSi Firmware ) | [v9936](8.1.0-0_New3DS "wikilink") | N/A | Same as CHN. | Same as CHN. |
| 00000202 | AGB_FIRM ( GBA Firmware ) | [v519](3.0.0-5 "wikilink"), v1553, [v2576](4.0.0-7 "wikilink"), [v3665](6.0.0-11 "wikilink") | [v2576](4.0.0-7 "wikilink") | [v2576](4.0.0-7 "wikilink"), [v3665](6.0.0-11 "wikilink") | Same as CHN. |
| 20000202 | [New_3DS](New_3DS "wikilink") AGB_FIRM ( GBA Firmware ) | [v4816](8.1.0-0_New3DS "wikilink") | N/A | N/A | N/A |

## Application Titles

| Category Bit Mask | Content Category | Bit Mask(s) |
|----|----|----|
| 0x0000 | [Application / eShop](Title_list/eShop_Titles "wikilink") | Normal |
| 0x0001 | Download Play Child | DlpChild |
| 0x0002 | [Demo](EShop_Demos "wikilink") | Demo |
| 0x000E | [Patch](Title_list/Patches "wikilink") | CannotExecution \| Patch |
| 0x008C | [Downloadable Content](Title_list/DLC "wikilink") | NotRequireRightForMount \| CannotExecution \| AddOnContents |

### 00040001 - [Download Play](Download_Play "wikilink") Titles

#### Download Play Notes

This titleID-high/programID-high is used for the titles sent over [Download Play](Download_Play "wikilink"). Only one 00040001 Download Play title is installed to NAND /title at a time. There can be a maximum of 255 Download Play child titles per Unique ID, indexed by Title ID Variation. The legal index range: 0x0 - 0xff.

## Factory Titles

#### Factory Titles Notes

This section is for hard-coded titleIDs referenced in codebins on retail. This can include [factory](Factory_Setup "wikilink")/[repair](Nintendo_Service_Center_Tools "wikilink") titles as well.

| TitleID | Description | Versions |
|----|----|----|
| 000400000F802A00 | Unknown. Appears to be a [gamecard](9.8.0-25 "wikilink") title. See also [here](11.3.0-36 "wikilink").
Used during [repair](Nintendo_Service_Center_Tools "wikilink"), first non-system title listed in [playlog](PTM_Services "wikilink") from repair. | ? |
| 000400000F802100 | Used during [repair](Nintendo_Service_Center_Tools "wikilink"), second non-system title listed in [playlog](PTM_Services "wikilink") from repair. | ? |
| 000400000F802200 | Used during [repair](Nintendo_Service_Center_Tools "wikilink"), third non-system title listed in [playlog](PTM_Services "wikilink") from repair. | ? |
| 000400000FFFFD00 | Used by retail NS for appID 0xF11, but this isn't available on retail CDN. | ? |
| 000400000FFFFC00 | Used by retail NS for appID 0xF12, but this isn't available on retail CDN. | ? |
| 000400000FFFFB00 | Used by retail NS for appID 0xF13, but this isn't available on retail CDN. | ? |
| 000400000FFFF900 | Used by retail NS for appID 0xF14, but this isn't available on retail CDN. | ? |
| 000400000FFFF800 | Used by retail NS for appID 0xF15, but this isn't available on retail CDN. | ? |
| 000400000FFFF700 | Used by retail NS for appID 0xF16, but this isn't available on retail CDN. | ? |
| 000400000FFFF600 | Used by retail NS for appID 0xF17, but this isn't available on retail CDN. | ? |
| 000400000FFFF500 | Used by retail NS for appID 0xF18, but this isn't available on retail CDN. | ? |
| 0004003000008900 | Used by retail NS for appID 0xF10, but this isn't available on retail CDN. | ? |
| 0004013000001902 | dmnt, debugger sysmodule. This use devunit-only HIO for devunit\<\>pc comms. This only exists for development units(launched by NS during startup depending on certain [Configuration_Memory](Configuration_Memory "wikilink") fields' values).
This is installed at the [factory](Factory_Setup "wikilink"), then later deleted at the factory on retail units. | ? |
| 0004013000003602 | "debugger". This only exist for development units(launched by NS during startup depending on certain [Configuration_Memory](Configuration_Memory "wikilink") fields' values). | ? |
| 000401300FEF0000 | Referenced in eShop Metadata (NS_UID 50010000000584), but does not exist on retail CDN |  |

## TWL (DSi) Titles

#### TWL Title Notes

Bitmask 0x1 for TWL titles denotes a system title (determining whether the title will be updated during a System Update).

It appears to be sufficient, but not necessary, to make the title invisible on the [Home Menu](Home_Menu "wikilink").

Bitmask 0x2 for TWL titles may indicate no-execute.

Bitmask 0x4 for TWL titles indicates internal storage.

Bitmask 0x10 for TWL titles is found on developer tools.

| Content Category      | Bit Mask(s)                     | Category Bit Mask |
|-----------------------|---------------------------------|-------------------|
| Application (DSiWare) | TWL \| 0x4                      | 0x8004            |
| System Application    | TWL \| 0x1 \| 0x4               | 0x8005            |
| System Archive        | TWL \| 0x1 \| 0x2 \| 0x4 \| 0x8 | 0x800F            |
| Developer Tool        | TWL \| 0x1 \| 0x4 \| 0x10       | 0x8015            |

### 00048005 - System Applications

| TitleID Low | Region | Description | Versions | Information |
|----|----|----|----|----|
| 42383841(B88A) | ALL | [DS Internet](DS_Internet "wikilink") | v0, [v1025](2.1.0-4 "wikilink"), [v2048](3.0.0-5 "wikilink") | [DS Internet](DS_Internet "wikilink") is the DS-mode application, (also integrated in every online-enabled DS game) and now accessible through [System Settings](System_Settings "wikilink") for configuring network settings for DS software. |
| 484E4441(HNDA) | ALL | [Download Play](Download_Play "wikilink") | v1024 | This [Download Play](Download_Play "wikilink") application is the DS-mode Download Play client, launched by the 3DS-mode Download Play application. |
| 484E4443(HNDC) | CHN | [Download Play](Download_Play "wikilink") | v1024 | See Above Description. |
| 484E444B(HNDK) | KOR | [Download Play](Download_Play "wikilink") | v1024 | See Above Description. |

### 0004800F - System Data Archives

#### System Data Archive Notes

New system updates only block DS flash-cards when whitelist is updated, or when TWL_FIRM is updated.
The whitelist contains the data used for detecting flash-cards, this is used by TWL_FIRM.

| TitleID Low | Description | Versions |
|----|----|----|
| 484E4841(HNHA) | [Nintendo DS Cart Whitelist](Nintendo_DS_Cart_Whitelist "wikilink") - | v0, [v1026](2.0.0-2 "wikilink"), [v2048](2.2.0-X "wikilink"), [v3072](3.0.0-5 "wikilink"), [v4096](4.0.0-7 "wikilink"), [v5120](4.2.0-9 "wikilink"), [v6145](4.3.0-10 "wikilink"), [v7168](4.4.0-10 "wikilink"), [v8192](4.5.0-10 "wikilink"), [v9216](5.0.0-11 "wikilink"), [v10240](6.0.0-11 "wikilink"), [v11264](7.0.0-13 "wikilink") |
| 484E4C41(HNLA) | [Version Data](Version_Data "wikilink") | v0 |

### 00048004 - DSiWare Ports

#### DSiWare Port Notes

Although these have a titleID high separate from DSi and a titleID is stored in the SRLs, the content of these SRLs are identical to DSi.
See [3DS DSiWare Titles](3DS_DSiWare_Titles "wikilink") for a complete list.
