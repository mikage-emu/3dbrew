+++
title = 'NFC:LoadAmiiboData'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00070000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the command which does the actual Amiibo NFC page data reading,
for loading Amiibo data into memory. This includes parsing that data +
crypto/verifying hashes.
