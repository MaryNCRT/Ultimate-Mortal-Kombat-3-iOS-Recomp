========================================================================
MTX_GetNetworkConnectionType  0x000be3cc  140 bytes   EAMTX_Main.mm
========================================================================

000be3cc  push    {r4, r5, r7, lr}
000be3ce  add     r7, sp, #8
000be3d0  sub     sp, #0x14
000be3d2  movs    r0, #0
000be3d4  movs    r3, #0x10
000be3d6  mov     r1, sp
000be3d8  str     r0, [sp]
000be3da  str     r0, [sp, #4]
000be3dc  strb.w  r3, [sp]
000be3e0  str     r0, [sp, #8]
000be3e2  subs    r3, #0xe
000be3e4  str     r0, [sp, #0xc]
000be3e6  strb.w  r3, [sp, #1]
000be3ea  blx     #0xdd434 ; -> SCNetworkReachabilityCreateWithAddress
000be3ee  add     r1, sp, #0x10
000be3f0  mov     r4, r0
000be3f2  blx     #0xdd44c ; -> SCNetworkReachabilityGetFlags
000be3f6  mov     r5, r0
000be3f8  mov     r0, r4
000be3fa  blx     #0xdd14c ; -> CFRelease
000be3fe  cbnz    r5, #0xbe40e
000be400  ldr     r0, [pc, #0x40]
000be402  add     r0, pc ; -> 0x00180a24  
000be404  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000be408  ldr     r0, [pc, #0x3c]
000be40a  add     r0, pc ; -> 0x00180a34  
000be40c  b       #0xbe43c
000be40e  ldrb.w  r3, [sp, #0x10]
000be412  and     r1, r3, #1
000be416  lsrs    r2, r3, #1
000be418  and     r3, r3, #1
000be41c  tst     r2, r3
000be41e  and     r0, r2, #1
000be422  beq     #0xbe42a
000be424  ldr     r0, [pc, #0x24]
000be426  add     r0, pc ; -> 0x00180a04  
000be428  b       #0xbe43c
000be42a  eor     r3, r1, #1
000be42e  tst     r0, r3
000be430  beq     #0xbe438
000be432  ldr     r0, [pc, #0x1c]
000be434  add     r0, pc ; -> 0x001809f4  
000be436  b       #0xbe43c
000be438  ldr     r0, [pc, #0x18]
000be43a  add     r0, pc ; -> 0x00180a34  
000be43c  sub.w   sp, r7, #8
000be440  pop     {r4, r5, r7, pc}
000be442  nop     
000be444  movs    r6, #0x1e
000be446  movs    r4, r1
000be448  movs    r6, #0x26
000be44a  movs    r4, r1
000be44c  movs    r5, #0xda
000be44e  movs    r4, r1
000be450  movs    r5, #0xbc
000be452  movs    r4, r1
000be454  movs    r5, #0xf6
000be456  movs    r4, r1
