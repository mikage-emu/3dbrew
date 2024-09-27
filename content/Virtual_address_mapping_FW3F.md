+++
title = 'Virtual Address Mapping FW3F'
+++

```
[L1 ] VA d8000000..d8600000 -> PA 18000000..18600000 [ XN ] [ Priv: RW, User: -- ]
[L1 ] VA dff00000..e0000000 -> PA 1ff00000..20000000 [ XN ] [ Priv: RW, User: -- ]
[L1 ] VA e0000000..e8000000 -> PA 20000000..28000000 [ XN ] [ Priv: RW, User: -- ]
...
[L2L] VA fff00000..fff20000 -> PA 1ff80000..1ffa0000 [  X ] [ Priv: R-, User: -- ]
[L2S] VA fff20000..fff2c000 -> PA 1ffde000..1ffea000 [  X ] [ Priv: R-, User: -- ]
[L2S] VA fff2c000..fff2d000 -> PA 1ffea000..1ffeb000 [ XN ] [ Priv: R-, User: -- ]
[L2S] VA fff2d000..fff32000 -> PA 1ffeb000..1fff0000 [ XN ] [ Priv: RW, User: -- ]
[L2L] VA fff70000..fffa0000 -> PA 1ffa0000..1ffd0000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffa0000..fffae000 -> PA 1ffd0000..1ffde000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffbc000..fffbd000 -> PA 17e10000..17e11000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffbe000..fffbf000 -> PA 10144000..10145000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffc0000..fffc1000 -> PA 10400000..10401000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffc2000..fffc3000 -> PA 10141000..10142000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffc4000..fffc5000 -> PA 10163000..10164000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffc6000..fffc7000 -> PA 10146000..10147000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffc8000..fffc9000 -> PA 10202000..10203000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffca000..fffcb000 -> PA 10140000..10141000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffcc000..fffcd000 -> PA 10200000..10201000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffce000..fffd2000 -> PA 1fff8000..1fffc000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffd3000..fffd4000 -> PA 1fff0000..1fff1000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffd5000..fffd6000 -> PA 1fff2000..1fff3000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffd7000..fffdb000 -> PA 1fffc000..20000000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffdc000..fffdd000 -> PA 1fff1000..1fff2000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffde000..fffdf000 -> PA 1fff3000..1fff4000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA fffee000..ffff0000 -> PA 17e00000..17e02000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA ffff0000..ffff1000 -> PA 1fff4000..1fff5000 [  X ] [ Priv: R-, User: -- ]
[L2S] VA ffff2000..ffff6000 -> PA 1fff8000..1fffc000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA ffff7000..ffff8000 -> PA 1fff0000..1fff1000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA ffff9000..ffffa000 -> PA 1fff2000..1fff3000 [ XN ] [ Priv: RW, User: -- ]
[L2S] VA ffffb000..ffffe000 -> PA 1fff5000..1fff8000 [ XN ] [ Priv: RW, User: -- ]
```
