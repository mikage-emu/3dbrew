+++
title = 'HTTPC:SetPostDataType'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150080\] |
| 1          | HTTP context handle        |
| 2          | type                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Types

| Value | Description                                         |
|-------|-----------------------------------------------------|
| 0x0   | Use the application/x-www-form-urlencoded encoding. |
| 0x1   | Use the multipart/form-data encoding.               |
| 0x2   | Don't use any encoding, send the raw data.          |

# Description

This indicates you want to use the Send\* post body api and sets the encoding that will be used. Note that <HTTP:C> will use chunk encoding unless you use [SetPostDataTypeSize](HTTPC:SetPostDataTypeSize "wikilink") instead.
