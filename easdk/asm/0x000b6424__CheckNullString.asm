========================================================================
CheckNullString  0x000b6424  76 bytes   EAMTX_Main.mm
========================================================================

000b6424  push    {r7, lr}
000b6426  add     r7, sp, #0
000b6428  mov     r3, r0
000b642a  cbz     r0, #0xb6442
000b642c  ldr     r0, [pc, #0x28]
000b642e  ldr     r1, [pc, #0x2c]
000b6430  ldr     r2, [pc, #0x2c]
000b6432  add     r0, pc ; -> 0x000fdb5c  
000b6434  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6436  add     r2, pc ; -> 0x0017ef54  
000b6438  ldr     r1, [r1]
000b643a  ldr     r0, [r0]
000b643c  blx     #0xddbfc ; -> objc_msgSend
000b6440  b       #0xb6456
000b6442  ldr     r2, [pc, #0x20]
000b6444  add     r2, pc ; -> 0x0038c0fc  emptyStr
000b6446  ldr     r3, [r2]
000b6448  cbnz    r3, #0xb6450
000b644a  ldr     r3, [pc, #0x1c]
000b644c  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b644e  str     r3, [r2]
000b6450  ldr     r0, [pc, #0x18]
000b6452  add     r0, pc ; -> 0x0038c0fc  emptyStr
000b6454  ldr     r0, [r0]
000b6456  pop     {r7, pc}
000b6458  strb    r6, [r4, #0x1c]
000b645a  movs    r4, r0
000b645c  str     r0, [r5, #0x64]
000b645e  movs    r4, r0
000b6460  ldrh    r2, [r3, #0x18]
000b6462  movs    r4, r1
000b6464  ldrb    r4, [r6, r2]
000b6466  movs    r5, r5
000b6468  ldrb    r4, [r4, #0x1a]
000b646a  movs    r4, r1
000b646c  ldrb    r6, [r4, r2]
000b646e  movs    r5, r5
