+++
title = 'BOSSU:RegisterPrivateRootCa'
+++

# Request

{{% ipc/request header="0x00050042" %}}
{{% ipc/param %}}u32, Buffer size{{% / %}}
{{% ipc/mapbuffer r %}}Input root CA buffer{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00050042" %}}
{{% ipc/result %}}
{{% ipc/mapbuffer r %}}Input root CA buffer{{% / %}}
{{% / %}}

# Description

This registers a private root certificate to be used by BOSS for the program ID of the current session. The certificate is saved to the BOSS savedata as: "bossdb:/%s_CA%d", where %s goes the program ID Ascii85 encoded and %d is the index of the root certificate.
