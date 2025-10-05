+++
title = 'PDNC:IsEnabled'
+++

# Request

{{% ipc/request header="0x00010040" %}}
{{% / %}}

# Response

{{% ipc/request header="0x00010080" %}}
{{% ipc/result %}}
{{% ipc/param %}}bool, whether or not the camera clock is enabled{{% / %}}
{{% / %}}

# Description

Returns bit0 of [PDN_CAMERA_CNT](PDN_Registers#pdn_camera_cnt "wikilink").
