+++
title = 'BOSSU:RegisterPrivateClientCert'
+++

# Request

{{% ipc/request header="0x00060084" %}}
{{% ipc/param %}}u32, Client certificate size{{% / %}}
{{% ipc/param %}}u32, Client certificate key size{{% / %}}
{{% ipc/mapbuffer r %}}Input client certificate buffer{{% / %}}
{{% ipc/mapbuffer r %}}Input client certificate key buffer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00060044" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer r %}}Input client certificate buffer{{% / %}}
{{% ipc/mapbuffer r %}}Input client certificate key buffer{{% / %}}
{{% / %}}

# Description

This registers a private client certificate to be used by BOSS for the program ID of the current session. The certificate is saved to the BOSS savedata as: "bossdb:/%s_CL" and the certificate key is saved as: "bossdb:/%s_CLK", where %s goes the program ID Ascii85 encoded.
