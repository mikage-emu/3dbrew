+++
title = 'FSPXI:SendInitializeInfoTo9'
+++

# Request

{{% ipc/request header="0x00360040" %}}
{{% ipc/param %}}[RUNNING_HW](Configuration_Memory#running_hw "wikilink"){{% / %}}
{{% / %}}

# Response

{{% ipc/request header="0x00360040" %}}
{{% ipc/result %}}
{{% / %}}

# Description

Initializes internal state (related to gamecard slot hardware?) in Process9 according to the given hardware type.
