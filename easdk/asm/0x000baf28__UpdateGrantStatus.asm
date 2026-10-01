========================================================================
UpdateGrantStatus  0x000baf28  472 bytes   EAMTX_Main.mm
========================================================================

000baf28  push    {r4, r5, r6, r7, lr}
000baf2a  add     r7, sp, #0xc
000baf2c  push.w  {r8, sl, fp}
000baf30  sub     sp, #0x10
000baf32  str     r1, [sp, #8]
000baf34  mov     sl, r0
000baf36  ldr     r1, [pc, #0x164]
000baf38  ldr     r0, [pc, #0x164]
000baf3a  ldr.w   fp, [pc, #0x168]
000baf3e  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000baf40  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000baf42  ldr     r4, [r1]
000baf44  ldr     r5, [r0]
000baf46  ldr     r1, [pc, #0x160]
000baf48  ldr     r0, [pc, #0x160]
000baf4a  ldr     r3, [pc, #0x164]
000baf4c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000baf4e  add     r0, pc ; -> 0x000fdb5c  
000baf50  ldr     r6, [r1]
000baf52  ldr.w   r8, [r0]
000baf56  add     fp, pc ; -> 0x0017e5c4  
000baf58  add     r3, pc ; -> 0x0038c168  iItemSellId
000baf5a  str     r2, [sp, #4]
000baf5c  ldr     r3, [r3]
000baf5e  mov     r1, r6
000baf60  mov     r2, fp
000baf62  mov     r0, r8
000baf64  blx     #0xddbfc ; -> objc_msgSend
000baf68  mov     r1, r4
000baf6a  mov     r2, r0
000baf6c  mov     r0, r5
000baf6e  blx     #0xddbfc ; -> objc_msgSend
000baf72  mov     r5, r0
000baf74  cbz     r0, #0xbafa2
000baf76  ldr     r2, [pc, #0x13c]
000baf78  mov     r1, r4
000baf7a  ldr     r0, [sp, #8]
000baf7c  add     r2, pc ; -> 0x00180424  
000baf7e  blx     #0xddbfc ; -> objc_msgSend
000baf82  ldr     r1, [pc, #0x134]
000baf84  add     r1, pc ; -> 0x000fd6d0  
000baf86  ldr     r1, [r1]
000baf88  blx     #0xddbfc ; -> objc_msgSend
000baf8c  ldr     r1, [pc, #0x12c]
000baf8e  add     r1, pc ; -> 0x000fd428  
000baf90  ldr     r1, [r1]
000baf92  tst.w   r0, #0xff
000baf96  ite     eq
000baf98  moveq   r2, #0
000baf9a  movne   r2, #1
000baf9c  mov     r0, r5
000baf9e  blx     #0xddbfc ; -> objc_msgSend
000bafa2  cmp.w   sl, #0x12
000bafa6  ite     ne
000bafa8  movne   r2, #0
000bafaa  moveq   r2, #1
000bafac  cmp.w   sl, #0x17
000bafb0  ite     ne
000bafb2  movne.w sl, #0
000bafb6  moveq.w sl, #1
000bafba  str     r2, [sp]
000bafbc  orrs.w  r2, r2, sl
000bafc0  str.w   sl, [sp, #0xc]
000bafc4  beq     #0xbb090
000bafc6  ldr     r0, [pc, #0xf8]
000bafc8  ldr     r1, [pc, #0xf8]
000bafca  add     r0, pc ; -> 0x000fdbf4  
000bafcc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bafce  ldr     r0, [r0]
000bafd0  ldr     r1, [r1]
000bafd2  blx     #0xddbfc ; -> objc_msgSend
000bafd6  ldr     r1, [pc, #0xf0]
000bafd8  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bafda  ldr     r1, [r1]
000bafdc  blx     #0xddbfc ; -> objc_msgSend
000bafe0  ldr     r1, [pc, #0xe8]
000bafe2  ldr     r3, [pc, #0xec]
000bafe4  mov     r2, fp
000bafe6  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bafe8  add     r3, pc ; -> 0x0038c168  iItemSellId
000bafea  ldr.w   sl, [r1]
000bafee  ldr     r3, [r3]
000baff0  mov     r1, r6
000baff2  mov     r4, r0
000baff4  mov     r0, r8
000baff6  blx     #0xddbfc ; -> objc_msgSend
000baffa  ldr     r3, [pc, #0xd8]
000baffc  mov     r1, sl
000baffe  add     r3, pc ; -> 0x00180434  
000bb000  mov     r2, r0
000bb002  mov     r0, r4
000bb004  blx     #0xddbfc ; -> objc_msgSend
000bb008  ldr     r1, [pc, #0xcc]
000bb00a  mov     r0, r5
000bb00c  add     r1, pc ; -> 0x000fd638  
000bb00e  ldr     r1, [r1]
000bb010  blx     #0xddbfc ; -> objc_msgSend
000bb014  mov     r1, r6
000bb016  mov     r2, fp
000bb018  mov     r3, r0
000bb01a  mov     r0, r8
000bb01c  blx     #0xddbfc ; -> objc_msgSend
000bb020  ldr     r3, [pc, #0xb8]
000bb022  mov     r1, sl
000bb024  add     r3, pc ; -> 0x00180424  
000bb026  mov     r2, r0
000bb028  mov     r0, r4
000bb02a  blx     #0xddbfc ; -> objc_msgSend
000bb02e  ldr     r2, [sp]
000bb030  cbz     r2, #0xbb068
000bb032  ldr     r2, [pc, #0xac]
000bb034  ldr     r3, [pc, #0xac]
000bb036  mov     r0, r4
000bb038  add     r2, pc ; -> 0x0038c170  receipt
000bb03a  add     r3, pc ; -> 0x00180444  
000bb03c  mov     r1, sl
000bb03e  ldr     r2, [r2]
000bb040  blx     #0xddbfc ; -> objc_msgSend
000bb044  movs    r0, #0x10
000bb046  ldr     r1, [sp, #4]
000bb048  mov     r2, r4
000bb04a  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb04e  ldr     r1, [pc, #0x98]
000bb050  mov     r0, r4
000bb052  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bb054  ldr     r1, [r1]
000bb056  blx     #0xddbfc ; -> objc_msgSend
000bb05a  ldr     r1, [pc, #0x90]
000bb05c  mov     r0, r4
000bb05e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bb060  ldr     r1, [r1]
000bb062  blx     #0xddbfc ; -> objc_msgSend
000bb066  b       #0xbb090
000bb068  ldr     r3, [sp, #0xc]
000bb06a  cbz     r3, #0xbb090
000bb06c  ldr     r2, [pc, #0x80]
000bb06e  ldr     r3, [pc, #0x84]
000bb070  mov     r0, r4
000bb072  add     r2, pc ; -> 0x0038c170  receipt
000bb074  mov     r1, sl
000bb076  ldr     r2, [r2]
000bb078  add     r3, pc ; -> 0x00180444  
000bb07a  blx     #0xddbfc ; -> objc_msgSend
000bb07e  ldr     r0, [pc, #0x78]
000bb080  ldr     r1, [pc, #0x78]
000bb082  mov     r2, r4
000bb084  add     r0, pc ; -> 0x0038c0c8  restoredItems
000bb086  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bb088  ldr     r0, [r0]
000bb08a  ldr     r1, [r1]
000bb08c  blx     #0xddbfc ; -> objc_msgSend
000bb090  sub.w   sp, r7, #0x18
000bb094  pop.w   {r8, sl, fp}
000bb098  pop     {r4, r5, r6, r7, pc}
000bb09a  nop     
000bb09c  subs    r6, r5, r6
000bb09e  movs    r4, r0
000bb0a0  asrs    r0, r7, #5
000bb0a2  movs    r5, r5
000bb0a4  adds    r6, #0x6a
000bb0a6  movs    r4, r1
000bb0a8  subs    r0, r2, r5
000bb0aa  movs    r4, r0
000bb0ac  cmp     r4, #0xa
000bb0ae  movs    r4, r0
000bb0b0  asrs    r4, r1, #8
000bb0b2  movs    r5, r5
000bb0b4  strb    r4, [r4, r2]
000bb0b6  movs    r4, r1
000bb0b8  movs    r7, #0x48
000bb0ba  movs    r4, r0
000bb0bc  movs    r4, #0x96
000bb0be  movs    r4, r0
000bb0c0  cmp     r4, #0x26
000bb0c2  movs    r4, r0
000bb0c4  adds    r4, r6, r6
000bb0c6  movs    r4, r0
000bb0c8  adds    r4, r4, r6
000bb0ca  movs    r4, r0
000bb0cc  subs    r6, r5, r3
000bb0ce  movs    r4, r0
000bb0d0  asrs    r4, r7, #5
000bb0d2  movs    r5, r5
000bb0d4  strb    r2, [r6, r0]
000bb0d6  movs    r4, r1
000bb0d8  movs    r6, #0x28
000bb0da  movs    r4, r0
000bb0dc  strh    r4, [r7, r7]
000bb0de  movs    r4, r1
000bb0e0  asrs    r4, r6, #4
000bb0e2  movs    r5, r5
000bb0e4  strb    r6, [r0, r0]
000bb0e6  movs    r4, r1
000bb0e8  subs    r6, r6, r0
000bb0ea  movs    r4, r0
000bb0ec  adds    r2, r3, r4
000bb0ee  movs    r4, r0
000bb0f0  asrs    r2, r7, #3
000bb0f2  movs    r5, r5
000bb0f4  strh    r0, [r1, r7]
000bb0f6  movs    r4, r1
000bb0f8  asrs    r0, r0, #1
000bb0fa  movs    r5, r5
000bb0fc  adds    r2, r7, r7
000bb0fe  movs    r4, r0
