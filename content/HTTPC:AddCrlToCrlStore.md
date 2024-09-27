+++
title = 'HTTPC:AddCrlToCrlStore'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00400082\] |
| 1          | CrlStore context handle    |
| 2          | Crl buffer size            |
| 4          | (Size\<\<4) \| 10          |
| 5          | Pointer to Crl data        |

# Response

| Index Word | Description   |
|------------|---------------|
| 0          | Header code   |
| 1          | Result code   |
| 2          | u32, unknown. |