========================================================================
-[DMGViewController dealloc]  0x000d160c  228 bytes   DMGViewController.mm
========================================================================

000d160c  push    {r4, r5, r7, lr}
000d160e  add     r7, sp, #8
000d1610  sub     sp, #8
000d1612  ldr     r5, [pc, #0xa8]
000d1614  mov     r4, r0
000d1616  add     r5, pc ; -> 0x000fa2c4  OBJC_IVAR_$_DMGViewController.backBt
000d1618  ldr     r0, [r5]
000d161a  ldr     r0, [r4, r0]
000d161c  cbz     r0, #0xd162e
000d161e  ldr     r1, [pc, #0xa0]
000d1620  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1622  ldr     r1, [r1]
000d1624  blx     #0xddbfc ; -> objc_msgSend
000d1628  ldr     r3, [r5]
000d162a  movs    r2, #0
000d162c  str     r2, [r4, r3]
000d162e  ldr     r5, [pc, #0x94]
000d1630  add     r5, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1632  ldr     r0, [r5]
000d1634  ldr     r0, [r4, r0]
000d1636  cbz     r0, #0xd1648
000d1638  ldr     r1, [pc, #0x8c]
000d163a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d163c  ldr     r1, [r1]
000d163e  blx     #0xddbfc ; -> objc_msgSend
000d1642  ldr     r3, [r5]
000d1644  movs    r2, #0
000d1646  str     r2, [r4, r3]
000d1648  ldr     r5, [pc, #0x80]
000d164a  add     r5, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d164c  ldr     r0, [r5]
000d164e  ldr     r0, [r4, r0]
000d1650  cbz     r0, #0xd1662
000d1652  ldr     r1, [pc, #0x7c]
000d1654  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1656  ldr     r1, [r1]
000d1658  blx     #0xddbfc ; -> objc_msgSend
000d165c  ldr     r3, [r5]
000d165e  movs    r2, #0
000d1660  str     r2, [r4, r3]
000d1662  ldr     r5, [pc, #0x70]
000d1664  add     r5, pc ; -> 0x000fa2c0  OBJC_IVAR_$_DMGViewController.navBar
000d1666  ldr     r0, [r5]
000d1668  ldr     r0, [r4, r0]
000d166a  cbz     r0, #0xd167c
000d166c  ldr     r1, [pc, #0x68]
000d166e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1670  ldr     r1, [r1]
000d1672  blx     #0xddbfc ; -> objc_msgSend
000d1676  ldr     r3, [r5]
000d1678  movs    r2, #0
000d167a  str     r2, [r4, r3]
000d167c  ldr     r5, [pc, #0x5c]
000d167e  add     r5, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d1680  ldr     r0, [r5]
000d1682  ldr     r0, [r4, r0]
000d1684  cbz     r0, #0xd1696
000d1686  ldr     r1, [pc, #0x58]
000d1688  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d168a  ldr     r1, [r1]
000d168c  blx     #0xddbfc ; -> objc_msgSend
000d1690  ldr     r3, [r5]
000d1692  movs    r2, #0
000d1694  str     r2, [r4, r3]
000d1696  ldr     r3, [pc, #0x4c]
000d1698  movs    r2, #0
000d169a  ldr     r1, [pc, #0x4c]
000d169c  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d169e  mov     r0, sp
000d16a0  ldr     r3, [r3]
000d16a2  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d16a4  str     r4, [sp]
000d16a6  ldr     r1, [r1]
000d16a8  str     r2, [r4, r3]
000d16aa  ldr     r3, [pc, #0x40]
000d16ac  add     r3, pc ; -> 0x000fddc8  
000d16ae  ldr     r3, [r3]
000d16b0  str     r3, [sp, #4]
000d16b2  blx     #0xddc08 ; -> objc_msgSendSuper2
000d16b6  sub.w   sp, r7, #8
000d16ba  pop     {r4, r5, r7, pc}
000d16bc  ldrh    r2, [r5, #0x24]
000d16be  movs    r2, r0
000d16c0  cbz     r0, #0xd171a
000d16c2  movs    r2, r0
000d16c4  ldrh    r4, [r2, #0x24]
000d16c6  movs    r2, r0
000d16c8  cbz     r6, #0xd171a
000d16ca  movs    r2, r0
000d16cc  ldrh    r2, [r2, #0x22]
000d16ce  movs    r2, r0
000d16d0  cbz     r4, #0xd171c
000d16d2  movs    r2, r0
000d16d4  ldrh    r0, [r3, #0x22]
000d16d6  movs    r2, r0
000d16d8  cbz     r2, #0xd171e
000d16da  movs    r2, r0
000d16dc  ldrh    r2, [r7, #0x20]
000d16de  movs    r2, r0
000d16e0  uxtb    r0, r6
000d16e2  movs    r2, r0
000d16e4  ldrh    r4, [r0, #0x20]
000d16e6  movs    r2, r0
000d16e8  uxtb    r2, r7
000d16ea  movs    r2, r0
000d16ec  stm     r7!, {r3, r4}
000d16ee  movs    r2, r0
