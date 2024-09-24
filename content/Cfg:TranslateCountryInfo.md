+++
title = 'Cfg:TranslateCountryInfo'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

```
This goes through table matching country info code between version A and version B. If the specified code doesn't exist in the table, the original code is returned as the translated code. Currently the table only contains 5 entries, all of which are in country 0x6E (GB, United Kingdom):
```

| Version A code | Version B code |
|----------------|----------------|
| 00 00 03 6E    | 00 00 04 6E    |
| 00 00 04 6E    | 00 00 05 6E    |
| 00 00 05 6E    | 00 00 06 6E    |
| 00 00 06 6E    | 00 00 07 6E    |
| 00 00 07 6E    | 00 00 03 6E    |