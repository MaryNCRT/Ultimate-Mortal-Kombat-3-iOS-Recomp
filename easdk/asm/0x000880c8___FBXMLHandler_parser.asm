========================================================================
-[FBXMLHandler parser  0x000880c8  180 bytes   FBXMLHandler.m
========================================================================

000880c8  push    {r4, r5, r6, r7, lr}
000880ca  add     r7, sp, #0xc
000880cc  ldr     r1, [pc, #0x7c]
000880ce  mov     r6, r3
000880d0  mov     r5, r0
000880d2  add     r1, pc ; -> 0x000fcf14  
000880d4  ldr     r1, [r1]
000880d6  blx     #0xddbfc ; -> objc_msgSend
000880da  ldr     r1, [pc, #0x74]
000880dc  ldr     r2, [pc, #0x74]
000880de  ldr     r0, [sp, #0x1c]
000880e0  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000880e2  add     r2, pc ; -> 0x0017ed84  
000880e4  ldr     r1, [r1]
000880e6  blx     #0xddbfc ; -> objc_msgSend
000880ea  ldr     r1, [pc, #0x6c]
000880ec  ldr     r2, [pc, #0x6c]
000880ee  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000880f0  add     r2, pc ; -> 0x0017ed94  
000880f2  ldr     r1, [r1]
000880f4  blx     #0xddbfc ; -> objc_msgSend
000880f8  tst.w   r0, #0xff
000880fc  beq     #0x88136
000880fe  ldr     r0, [pc, #0x60]
00088100  ldr     r1, [pc, #0x60]
00088102  add     r0, pc ; -> 0x000fdb70  
00088104  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
00088106  ldr     r0, [r0]
00088108  ldr     r1, [r1]
0008810a  blx     #0xddbfc ; -> objc_msgSend
0008810e  mov     r2, r0
00088110  ldr     r3, [pc, #0x54]
00088112  ldr     r1, [pc, #0x58]
00088114  add     r3, pc ; -> 0x000f6034  OBJC_IVAR_$_FBXMLHandler._stack
00088116  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
00088118  ldr     r3, [r3]
0008811a  ldr     r4, [r1]
0008811c  ldr     r0, [r5, r3]
0008811e  mov     r1, r4
00088120  blx     #0xddbfc ; -> objc_msgSend
00088124  ldr     r3, [pc, #0x48]
00088126  mov     r1, r4
00088128  mov     r2, r6
0008812a  add     r3, pc ; -> 0x000f6038  OBJC_IVAR_$_FBXMLHandler._nameStack
0008812c  ldr     r0, [r3]
0008812e  ldr     r0, [r5, r0]
00088130  blx     #0xddbfc ; -> objc_msgSend
00088134  pop     {r4, r5, r6, r7, pc}
00088136  ldr     r0, [pc, #0x3c]
00088138  ldr     r1, [pc, #0x3c]
0008813a  add     r0, pc ; -> 0x000fdc0c  
0008813c  add     r1, pc ; -> 0x000fcf34  
0008813e  ldr     r0, [r0]
00088140  ldr     r1, [r1]
00088142  blx     #0xddbfc ; -> objc_msgSend
00088146  mov     r2, r0
00088148  b       #0x88110
0008814a  nop     
0008814c  ldr     r6, [pc, #0xf8]
0008814e  movs    r7, r0
00088150  ldr     r1, [pc, #0x3c0]
00088152  movs    r7, r0
00088154  ldr     r6, [r3, #0x48]
00088156  movs    r7, r1
00088158  ldr     r2, [pc, #0x58]
0008815a  movs    r7, r0
0008815c  ldr     r0, [r4, #0x48]
0008815e  movs    r7, r1
00088160  ldrh    r2, [r5, r1]
00088162  movs    r7, r0
00088164  ldr     r4, [pc, #0x70]
00088166  movs    r7, r0
00088168  svc     #0x1c
0008816a  movs    r6, r0
0008816c  ldr     r1, [pc, #0x1a8]
0008816e  movs    r7, r0
00088170  svc     #0xa
00088172  movs    r6, r0
00088174  ldrh    r6, [r1, r3]
00088176  movs    r7, r0
00088178  ldr     r5, [pc, #0x3d0]
0008817a  movs    r7, r0
