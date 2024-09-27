# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x04020040\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | 0x10        |
| 3          | CIA Handle  |

# Description

Returns a file handle to which CIA data is to be written using [AM:File
services](Application_Manager_Services#File_service "wikilink"). This
appears to only allocate+initialize a CIA object in AM module state,
etc: nothing more is done by this command it seems. This sets the u8
[database](Title_Database "wikilink") type used for installation to
value 0 for title.db.