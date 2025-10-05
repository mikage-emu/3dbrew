+++
title = 'PDNC:Enable'
+++

# Request

{{% ipc/request header="0x00010040" %}}
{{% ipc/param %}}bool, enable clock{{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00010040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Enables or disables the camera clock using [PDN_CAMERA_CNT](PDN_Registers#pdn_camera_cnt "wikilink").
