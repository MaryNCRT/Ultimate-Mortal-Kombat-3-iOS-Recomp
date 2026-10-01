========================================================================
-[FBDialog generateURL  0x00083774  428 bytes   FBDialog.m
========================================================================

00083774  push    {r4, r5, r6, r7, lr}
00083776  add     r7, sp, #0xc
00083778  push.w  {r8, sl, fp}
0008377c  sub     sp, #0x8c
0008377e  str     r2, [sp, #4]
00083780  mov     r6, r3
00083782  cmp     r3, #0
00083784  beq.w   #0x838c0
00083788  ldr     r0, [pc, #0x148]
0008378a  ldr.w   r1, [pc, #0x14c]
0008378e  add     r0, pc ; -> 0x000fdb70  
00083790  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
00083792  ldr     r0, [r0]
00083794  ldr     r1, [r1]
00083796  blx     #0xddbfc ; -> objc_msgSend
0008379a  ldr     r1, [pc, #0x140]
0008379c  movs    r3, #0
0008379e  str     r3, [sp, #0x6c]
000837a0  add     r1, pc ; -> 0x000fcd18  '^z\x0e'
000837a2  str     r3, [sp, #0x70]
000837a4  ldr     r1, [r1]
000837a6  str     r3, [sp, #0x74]
000837a8  str     r3, [sp, #0x78]
000837aa  str     r3, [sp, #0x7c]
000837ac  str     r3, [sp, #0x80]
000837ae  str     r3, [sp, #0x84]
000837b0  str     r3, [sp, #0x88]
000837b2  str     r1, [sp, #0xc]
000837b4  str     r0, [sp, #8]
000837b6  mov     r0, r6
000837b8  blx     #0xddbfc ; -> objc_msgSend
000837bc  ldr     r1, [pc, #0x120]
000837be  movs    r3, #0x10
000837c0  add     r2, sp, #0x6c
000837c2  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000837c4  str     r3, [sp]
000837c6  ldr     r1, [r1]
000837c8  add     r3, sp, #0x2c
000837ca  str     r1, [sp, #0x14]
000837cc  str     r0, [sp, #0x10]
000837ce  blx     #0xddbfc ; -> objc_msgSend
000837d2  cmp     r0, #0
000837d4  bne     #0x8381c
000837d6  ldr     r1, [pc, #0x10c]
000837d8  ldr     r2, [pc, #0x10c]
000837da  ldr     r0, [sp, #8]
000837dc  add     r1, pc ; -> 0x000fcd1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a4
000837de  add     r2, pc ; -> 0x0017e8a4  
000837e0  ldr     r1, [r1]
000837e2  blx     #0xddbfc ; -> objc_msgSend
000837e6  ldr     r1, [pc, #0x104]
000837e8  ldr     r2, [pc, #0x104]
000837ea  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000837ec  add     r2, pc ; -> 0x0017e8b4  
000837ee  ldr     r1, [r1]
000837f0  mov     r3, r0
000837f2  ldr     r0, [pc, #0x100]
000837f4  str     r3, [sp]
000837f6  ldr     r3, [sp, #4]
000837f8  add     r0, pc ; -> 0x000fdb5c  
000837fa  ldr     r0, [r0]
000837fc  blx     #0xddbfc ; -> objc_msgSend
00083800  ldr     r1, [pc, #0xf4]
00083802  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
00083804  ldr     r1, [r1]
00083806  mov     r2, r0
00083808  ldr     r0, [pc, #0xf0]
0008380a  add     r0, pc ; -> 0x000fdb64  
0008380c  ldr     r0, [r0]
0008380e  blx     #0xddbfc ; -> objc_msgSend
00083812  sub.w   sp, r7, #0x18
00083816  pop.w   {r8, sl, fp}
0008381a  pop     {r4, r5, r6, r7, pc}
0008381c  ldr     r1, [pc, #0xe0]
0008381e  ldr     r3, [sp, #0x74]
00083820  ldr     r2, [pc, #0xe0]
00083822  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00083824  mov     r8, r0
00083826  ldr     r1, [r1]
00083828  ldr     r3, [r3]
0008382a  add     r2, pc ; -> 0x0017e894  
0008382c  str     r2, [sp, #0x28]
0008382e  str     r1, [sp, #0x18]
00083830  ldr     r1, [pc, #0xd4]
00083832  str     r3, [sp, #0x24]
00083834  ldr     r3, [pc, #0xd4]
00083836  add     r1, pc ; -> 0x000fcd20  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a8
00083838  ldr     r1, [r1]
0008383a  add     r3, pc ; -> 0x000fdb5c  
0008383c  ldr     r3, [r3]
0008383e  str     r1, [sp, #0x1c]
00083840  ldr     r1, [pc, #0xcc]
00083842  str     r3, [sp, #0x20]
00083844  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00083846  ldr     r3, [sp, #0x24]
00083848  ldr.w   fp, [r1]
0008384c  ldr     r1, [pc, #0xc4]
0008384e  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
00083850  ldr.w   sl, [r1]
00083854  movs    r5, #0
00083856  b       #0x8385c
00083858  ldr     r3, [sp, #0x74]
0008385a  ldr     r3, [r3]
0008385c  ldr     r2, [sp, #0x24]
0008385e  cmp     r2, r3
00083860  beq     #0x8386e
00083862  ldr     r1, [sp, #0xc]
00083864  mov     r0, r6
00083866  blx     #0xddbfc ; -> objc_msgSend
0008386a  blx     #0xddbe4 ; -> objc_enumerationMutation
0008386e  ldr     r2, [sp, #0x70]
00083870  ldr     r1, [sp, #0x18]
00083872  mov     r0, r6
00083874  ldr.w   r4, [r2, r5, lsl #2]
00083878  adds    r5, #1
0008387a  mov     r2, r4
0008387c  blx     #0xddbfc ; -> objc_msgSend
00083880  movs    r2, #4
00083882  ldr     r1, [sp, #0x1c]
00083884  blx     #0xddbfc ; -> objc_msgSend
00083888  mov     r1, fp
0008388a  ldr     r2, [sp, #0x28]
0008388c  mov     r3, r4
0008388e  str     r0, [sp]
00083890  ldr     r0, [sp, #0x20]
00083892  blx     #0xddbfc ; -> objc_msgSend
00083896  mov     r1, sl
00083898  mov     r2, r0
0008389a  ldr     r0, [sp, #8]
0008389c  blx     #0xddbfc ; -> objc_msgSend
000838a0  cmp     r8, r5
000838a2  bhi     #0x83858
000838a4  movs    r3, #0x10
000838a6  ldr     r0, [sp, #0x10]
000838a8  str     r3, [sp]
000838aa  ldr     r1, [sp, #0x14]
000838ac  add     r2, sp, #0x6c
000838ae  add     r3, sp, #0x2c
000838b0  blx     #0xddbfc ; -> objc_msgSend
000838b4  cmp     r0, #0
000838b6  beq     #0x837d6
000838b8  ldr     r3, [sp, #0x74]
000838ba  mov     r8, r0
000838bc  ldr     r3, [r3]
000838be  b       #0x83854
000838c0  ldr     r0, [pc, #0x54]
000838c2  ldr     r1, [pc, #0x58]
000838c4  ldr     r2, [sp, #4]
000838c6  add     r0, pc ; -> 0x000fdb64  
000838c8  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000838ca  ldr     r0, [r0]
000838cc  ldr     r1, [r1]
000838ce  blx     #0xddbfc ; -> objc_msgSend
000838d2  b       #0x83812
000838d4  adr     r3, #0x378
000838d6  movs    r7, r0
000838d8  str     r5, [sp, #0x240]
000838da  movs    r7, r0
000838dc  str     r5, [sp, #0x1d0]
000838de  movs    r7, r0
000838e0  str     r1, [sp, #0x348]
000838e2  movs    r7, r0
000838e4  str     r5, [sp, #0xf0]
000838e6  movs    r7, r0
000838e8  sub     sp, #0x108
000838ea  movs    r7, r1
000838ec  str     r2, [sp, #0x2c8]
000838ee  movs    r7, r0
000838f0  sub     sp, #0x110
000838f2  movs    r7, r1
000838f4  adr     r3, #0x180
000838f6  movs    r7, r0
000838f8  str     r3, [sp, #0x2a8]
000838fa  movs    r7, r0
000838fc  adr     r3, #0x158
000838fe  movs    r7, r0
00083900  str     r2, [sp, #0x2b8]
00083902  movs    r7, r0
00083904  add     sp, #0x198
00083906  movs    r7, r1
00083908  str     r4, [sp, #0x398]
0008390a  movs    r7, r0
0008390c  adr     r3, #0x78
0008390e  movs    r7, r0
00083910  str     r2, [sp, #0x160]
00083912  movs    r7, r0
00083914  str     r2, [sp, #0xc8]
00083916  movs    r7, r0
00083918  adr     r2, #0x268
0008391a  movs    r7, r0
0008391c  str     r2, [sp, #0x390]
0008391e  movs    r7, r0
