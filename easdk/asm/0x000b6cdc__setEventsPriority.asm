========================================================================
setEventsPriority  0x000b6cdc  472 bytes   EAMTX_Main.mm
========================================================================

000b6cdc  push    {r4, r5, r6, r7, lr}
000b6cde  add     r7, sp, #0xc
000b6ce0  push.w  {r8, sl, fp}
000b6ce4  ldr     r0, [pc, #0x1a8]
000b6ce6  ldr     r1, [pc, #0x1ac]
000b6ce8  ldr.w   fp, [pc, #0x1ac]
000b6cec  add     r0, pc ; -> 0x000fdb70  
000b6cee  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b6cf0  ldr     r0, [r0]
000b6cf2  ldr     r1, [r1]
000b6cf4  blx     #0xddbfc ; -> objc_msgSend
000b6cf8  ldr     r1, [pc, #0x1a0]
000b6cfa  add     fp, pc ; -> 0x0038c120  eventsOrder
000b6cfc  ldr.w   sl, [pc, #0x1a0]
000b6d00  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6d02  ldr     r1, [r1]
000b6d04  blx     #0xddbfc ; -> objc_msgSend
000b6d08  ldr     r1, [pc, #0x198]
000b6d0a  add     sl, pc ; -> 0x0017e5c4  
000b6d0c  ldr     r3, [pc, #0x198]
000b6d0e  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b6d10  mov     r2, sl
000b6d12  ldr     r6, [r1]
000b6d14  ldr     r1, [pc, #0x194]
000b6d16  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6d18  ldr     r4, [r1]
000b6d1a  mov     r1, r4
000b6d1c  mov     r8, r0
000b6d1e  str.w   r0, [fp]
000b6d22  ldr     r0, [pc, #0x18c]
000b6d24  add     r0, pc ; -> 0x000fdb5c  
000b6d26  ldr     r5, [r0]
000b6d28  mov     r0, r5
000b6d2a  blx     #0xddbfc ; -> objc_msgSend
000b6d2e  mov     r1, r6
000b6d30  mov     r2, r0
000b6d32  mov     r0, r8
000b6d34  blx     #0xddbfc ; -> objc_msgSend
000b6d38  mov     r1, r4
000b6d3a  mov     r2, sl
000b6d3c  movw    r3, #0x7534
000b6d40  mov     r0, r5
000b6d42  ldr.w   r8, [fp]
000b6d46  blx     #0xddbfc ; -> objc_msgSend
000b6d4a  mov     r1, r6
000b6d4c  mov     r2, r0
000b6d4e  mov     r0, r8
000b6d50  blx     #0xddbfc ; -> objc_msgSend
000b6d54  mov     r1, r4
000b6d56  mov     r2, sl
000b6d58  movw    r3, #0x2710
000b6d5c  mov     r0, r5
000b6d5e  ldr.w   r8, [fp]
000b6d62  blx     #0xddbfc ; -> objc_msgSend
000b6d66  mov     r1, r6
000b6d68  mov     r2, r0
000b6d6a  mov     r0, r8
000b6d6c  blx     #0xddbfc ; -> objc_msgSend
000b6d70  mov     r1, r4
000b6d72  mov     r2, sl
000b6d74  movw    r3, #0x2711
000b6d78  mov     r0, r5
000b6d7a  ldr.w   r8, [fp]
000b6d7e  blx     #0xddbfc ; -> objc_msgSend
000b6d82  mov     r1, r6
000b6d84  mov     r2, r0
000b6d86  mov     r0, r8
000b6d88  blx     #0xddbfc ; -> objc_msgSend
000b6d8c  mov     r1, r4
000b6d8e  mov     r2, sl
000b6d90  movw    r3, #0x2712
000b6d94  mov     r0, r5
000b6d96  ldr.w   r8, [fp]
000b6d9a  blx     #0xddbfc ; -> objc_msgSend
000b6d9e  mov     r1, r6
000b6da0  mov     r2, r0
000b6da2  mov     r0, r8
000b6da4  blx     #0xddbfc ; -> objc_msgSend
000b6da8  mov     r1, r4
000b6daa  mov     r2, sl
000b6dac  movw    r3, #0x2713
000b6db0  mov     r0, r5
000b6db2  ldr.w   r8, [fp]
000b6db6  blx     #0xddbfc ; -> objc_msgSend
000b6dba  mov     r1, r6
000b6dbc  mov     r2, r0
000b6dbe  mov     r0, r8
000b6dc0  blx     #0xddbfc ; -> objc_msgSend
000b6dc4  mov     r1, r4
000b6dc6  mov     r2, sl
000b6dc8  movw    r3, #0x7530
000b6dcc  mov     r0, r5
000b6dce  ldr.w   r8, [fp]
000b6dd2  blx     #0xddbfc ; -> objc_msgSend
000b6dd6  mov     r1, r6
000b6dd8  mov     r2, r0
000b6dda  mov     r0, r8
000b6ddc  blx     #0xddbfc ; -> objc_msgSend
000b6de0  mov     r1, r4
000b6de2  mov     r2, sl
000b6de4  movw    r3, #0x7531
000b6de8  mov     r0, r5
000b6dea  ldr.w   r8, [fp]
000b6dee  blx     #0xddbfc ; -> objc_msgSend
000b6df2  mov     r1, r6
000b6df4  mov     r2, r0
000b6df6  mov     r0, r8
000b6df8  blx     #0xddbfc ; -> objc_msgSend
000b6dfc  mov     r1, r4
000b6dfe  mov     r2, sl
000b6e00  movw    r3, #0xc351
000b6e04  mov     r0, r5
000b6e06  ldr.w   r8, [fp]
000b6e0a  blx     #0xddbfc ; -> objc_msgSend
000b6e0e  mov     r1, r6
000b6e10  mov     r2, r0
000b6e12  mov     r0, r8
000b6e14  blx     #0xddbfc ; -> objc_msgSend
000b6e18  mov     r1, r4
000b6e1a  mov     r2, sl
000b6e1c  movw    r3, #0xc352
000b6e20  mov     r0, r5
000b6e22  ldr.w   r8, [fp]
000b6e26  blx     #0xddbfc ; -> objc_msgSend
000b6e2a  mov     r1, r6
000b6e2c  mov     r2, r0
000b6e2e  mov     r0, r8
000b6e30  blx     #0xddbfc ; -> objc_msgSend
000b6e34  mov     r1, r4
000b6e36  mov     r2, sl
000b6e38  movw    r3, #0xc353
000b6e3c  mov     r0, r5
000b6e3e  ldr.w   r8, [fp]
000b6e42  blx     #0xddbfc ; -> objc_msgSend
000b6e46  mov     r1, r6
000b6e48  mov     r2, r0
000b6e4a  mov     r0, r8
000b6e4c  blx     #0xddbfc ; -> objc_msgSend
000b6e50  mov     r1, r4
000b6e52  mov     r2, sl
000b6e54  movw    r3, #0xea61
000b6e58  mov     r0, r5
000b6e5a  ldr.w   r8, [fp]
000b6e5e  blx     #0xddbfc ; -> objc_msgSend
000b6e62  mov     r1, r6
000b6e64  mov     r2, r0
000b6e66  mov     r0, r8
000b6e68  blx     #0xddbfc ; -> objc_msgSend
000b6e6c  mov     r1, r4
000b6e6e  mov     r2, sl
000b6e70  mov     r0, r5
000b6e72  movw    r3, #0xea62
000b6e76  ldr.w   r8, [fp]
000b6e7a  blx     #0xddbfc ; -> objc_msgSend
000b6e7e  mov     r1, r6
000b6e80  mov     r2, r0
000b6e82  mov     r0, r8
000b6e84  blx     #0xddbfc ; -> objc_msgSend
000b6e88  pop.w   {r8, sl, fp}
000b6e8c  pop     {r4, r5, r6, r7, pc}
000b6e8e  nop     
000b6e90  ldr     r0, [r0, #0x68]
000b6e92  movs    r4, r0
000b6e94  ldrb    r2, [r2, r2]
000b6e96  movs    r4, r0
000b6e98  strb    r2, [r4, r0]
000b6e9a  movs    r5, r5
000b6e9c  ldrb    r4, [r7, r1]
000b6e9e  movs    r4, r0
000b6ea0  ldrb    r6, [r6, #2]
000b6ea2  movs    r4, r1
000b6ea4  ldrb    r2, [r6, r5]
000b6ea6  movs    r4, r0
000b6ea8  asrs    r0, r6, #5
000b6eaa  movs    r1, r0
000b6eac  ldrb    r6, [r0, r6]
000b6eae  movs    r4, r0
000b6eb0  ldr     r4, [r6, #0x60]
000b6eb2  movs    r4, r0
