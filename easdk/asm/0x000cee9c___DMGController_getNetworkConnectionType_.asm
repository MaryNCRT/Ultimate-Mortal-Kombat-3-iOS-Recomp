========================================================================
-[DMGController getNetworkConnectionType]  0x000cee9c  140 bytes   DMGController.mm
========================================================================

000cee9c  push    {r4, r5, r7, lr}
000cee9e  add     r7, sp, #8
000ceea0  sub     sp, #0x14
000ceea2  movs    r0, #0
000ceea4  movs    r3, #0x10
000ceea6  mov     r1, sp
000ceea8  str     r0, [sp]
000ceeaa  str     r0, [sp, #4]
000ceeac  strb.w  r3, [sp]
000ceeb0  str     r0, [sp, #8]
000ceeb2  subs    r3, #0xe
000ceeb4  str     r0, [sp, #0xc]
000ceeb6  strb.w  r3, [sp, #1]
000ceeba  blx     #0xdd434 ; -> SCNetworkReachabilityCreateWithAddress
000ceebe  add     r1, sp, #0x10
000ceec0  mov     r4, r0
000ceec2  blx     #0xdd44c ; -> SCNetworkReachabilityGetFlags
000ceec6  mov     r5, r0
000ceec8  mov     r0, r4
000ceeca  blx     #0xdd14c ; -> CFRelease
000ceece  cbnz    r5, #0xceede
000ceed0  ldr     r0, [pc, #0x40]
000ceed2  add     r0, pc ; -> 0x00180a24  
000ceed4  blx     #0xdd3e0 ; -> NSLog
000ceed8  ldr     r0, [pc, #0x3c]
000ceeda  add     r0, pc ; -> 0x00180a34  
000ceedc  b       #0xcef0c
000ceede  ldrb.w  r3, [sp, #0x10]
000ceee2  and     r1, r3, #1
000ceee6  lsrs    r2, r3, #1
000ceee8  and     r3, r3, #1
000ceeec  tst     r2, r3
000ceeee  and     r0, r2, #1
000ceef2  beq     #0xceefa
000ceef4  ldr     r0, [pc, #0x24]
000ceef6  add     r0, pc ; -> 0x00180a04  
000ceef8  b       #0xcef0c
000ceefa  eor     r3, r1, #1
000ceefe  tst     r0, r3
000cef00  beq     #0xcef08
000cef02  ldr     r0, [pc, #0x1c]
000cef04  add     r0, pc ; -> 0x001809f4  
000cef06  b       #0xcef0c
000cef08  ldr     r0, [pc, #0x18]
000cef0a  add     r0, pc ; -> 0x00180a34  
000cef0c  sub.w   sp, r7, #8
000cef10  pop     {r4, r5, r7, pc}
000cef12  nop     
000cef14  subs    r6, r1, r5
000cef16  movs    r3, r1
000cef18  subs    r6, r2, r5
000cef1a  movs    r3, r1
000cef1c  subs    r2, r1, r4
000cef1e  movs    r3, r1
000cef20  subs    r4, r5, r3
000cef22  movs    r3, r1
000cef24  subs    r6, r4, r4
000cef26  movs    r3, r1
