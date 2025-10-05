+++
title = 'ACTA:UpdateMiiData'
+++

# Request

{{% ipc/request header="0x041207c0" %}}
{{% ipc/param %}}u8, Account slot{{% / %}}
{{% ipc/param span=24 %}}[Mii CFLStoreData](Mii#cflstoredata "wikilink"){{% / %}}
{{% ipc/param span=6 %}}10-character UTF-16 Mii name (10 characters + NULL termination){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x04120040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Updates the Mii data for the given account.
