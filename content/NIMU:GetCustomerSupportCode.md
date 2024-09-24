+++
title = 'NIMU:GetCustomerSupportCode'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080080\] |
| 1          | Result code                |
| 2          | Customer Support Code      |

# Description

Gets the customer support code for the last system update error.