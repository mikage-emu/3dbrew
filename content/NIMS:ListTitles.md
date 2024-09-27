# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x0016020A\] |
| 1..18      | ?                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This sends a HTTP request for CatalogingSOAP ListTitlesEx, for getting
attributes' values specified in the input buffers for the specified
title(s).