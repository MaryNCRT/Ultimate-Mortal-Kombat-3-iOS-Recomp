========================================================================
+[NSString(HTMLEntities) stringWithHTMLDecodedString  0x0009fc54  440 bytes   Base64Encode.mm
========================================================================

0009fc54  push    {r4, r5, r6, r7, lr}
0009fc56  add     r7, sp, #0xc
0009fc58  push.w  {r8, sl, fp}
0009fc5c  sub     sp, #0x3c
0009fc5e  ldr     r0, [pc, #0x164]
0009fc60  ldr     r1, [pc, #0x164]
0009fc62  str     r2, [sp, #4]
0009fc64  add     r0, pc ; -> 0x000fdc30  
0009fc66  add     r1, pc ; -> 0x000fd034  '|]\x0e'
0009fc68  ldr     r0, [r0]
0009fc6a  ldr     r1, [r1]
0009fc6c  mov.w   r8, #0
0009fc70  str     r0, [sp, #8]
0009fc72  str     r1, [sp, #0xc]
0009fc74  blx     #0xddbfc ; -> objc_msgSend
0009fc78  ldr     r1, [pc, #0x150]
0009fc7a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0009fc7c  ldr     r1, [r1]
0009fc7e  mov     r5, r0
0009fc80  ldr     r0, [pc, #0x14c]
0009fc82  add     r0, pc ; -> 0x000fdb5c  
0009fc84  ldr     r0, [r0]
0009fc86  str     r0, [sp, #0x10]
0009fc88  blx     #0xddbfc ; -> objc_msgSend
0009fc8c  ldr     r1, [pc, #0x144]
0009fc8e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0009fc90  ldr     r1, [r1]
0009fc92  blx     #0xddbfc ; -> objc_msgSend
0009fc96  ldr     r1, [pc, #0x140]
0009fc98  ldr     r3, [pc, #0x140]
0009fc9a  add     r1, pc ; -> 0x000fd030  '`]\x0e'
0009fc9c  add     r3, pc ; -> 0x0017f424  
0009fc9e  ldr     r1, [r1]
0009fca0  str     r3, [sp, #0x30]
0009fca2  str     r1, [sp, #0x18]
0009fca4  ldr     r1, [pc, #0x138]
0009fca6  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0009fca8  ldr     r1, [r1]
0009fcaa  str     r1, [sp, #0x1c]
0009fcac  ldr     r1, [pc, #0x134]
0009fcae  add     r1, pc ; -> 0x000fd02c  'V]\x0e'
0009fcb0  ldr     r1, [r1]
0009fcb2  str     r1, [sp, #0x14]
0009fcb4  ldr     r1, [pc, #0x130]
0009fcb6  str     r0, [sp, #0x38]
0009fcb8  add     r1, pc ; -> 0x000fd024  '8]\x0e'
0009fcba  ldr     r1, [r1]
0009fcbc  str     r1, [sp, #0x20]
0009fcbe  ldr     r1, [pc, #0x12c]
0009fcc0  add     r1, pc ; -> 0x000fd028  'I]\x0e'
0009fcc2  ldr     r1, [r1]
0009fcc4  str     r1, [sp, #0x24]
0009fcc6  ldr     r1, [pc, #0x128]
0009fcc8  add     r1, pc ; -> 0x000fcdc0  '$]\x0e'
0009fcca  ldr     r1, [r1]
0009fccc  str     r1, [sp, #0x28]
0009fcce  ldr     r1, [pc, #0x124]
0009fcd0  add     r1, pc ; -> 0x000fd020  '\x18]\x0e'
0009fcd2  ldr     r1, [r1]
0009fcd4  str     r1, [sp, #0x2c]
0009fcd6  b       #0x9fce6
0009fcd8  mov     r0, r5
0009fcda  ldr     r1, [sp, #0x14]
0009fcdc  blx     #0xddbfc ; -> objc_msgSend
0009fce0  tst.w   r0, #0xff
0009fce4  bne     #0x9fdb8
0009fce6  mov     r0, r5
0009fce8  ldr     r1, [sp, #0x18]
0009fcea  ldr     r2, [sp, #0x30]
0009fcec  add     r3, sp, #0x38
0009fcee  blx     #0xddbfc ; -> objc_msgSend
0009fcf2  cmp.w   r8, #0
0009fcf6  beq     #0x9fda6
0009fcf8  ldr     r3, [sp, #0x38]
0009fcfa  ldr     r2, [pc, #0xfc]
0009fcfc  ldr     r0, [sp, #0x10]
0009fcfe  ldr     r1, [sp, #0x1c]
0009fd00  str     r3, [sp]
0009fd02  add     r2, pc ; -> 0x0017f434  
0009fd04  mov     r3, r8
0009fd06  blx     #0xddbfc ; -> objc_msgSend
0009fd0a  mov     r8, r0
0009fd0c  mov     r0, r5
0009fd0e  ldr     r1, [sp, #0x14]
0009fd10  blx     #0xddbfc ; -> objc_msgSend
0009fd14  uxtb    r4, r0
0009fd16  cmp     r4, #0
0009fd18  bne     #0x9fdb8
0009fd1a  ldr     r1, [sp, #0x24]
0009fd1c  mov     r0, r5
0009fd1e  blx     #0xddbfc ; -> objc_msgSend
0009fd22  ldr     r1, [sp, #0x20]
0009fd24  adds    r2, r0, #2
0009fd26  mov     r0, r5
0009fd28  blx     #0xddbfc ; -> objc_msgSend
0009fd2c  ldr     r1, [sp, #0x24]
0009fd2e  mov     r0, r5
0009fd30  blx     #0xddbfc ; -> objc_msgSend
0009fd34  ldr     r2, [pc, #0xc4]
0009fd36  mov     r3, r4
0009fd38  ldr     r1, [sp, #0x18]
0009fd3a  add     r2, pc ; -> 0x0017f444  
0009fd3c  mov     r6, r0
0009fd3e  mov     r0, r5
0009fd40  blx     #0xddbfc ; -> objc_msgSend
0009fd44  ldr     r1, [sp, #0x24]
0009fd46  mov     r0, r5
0009fd48  blx     #0xddbfc ; -> objc_msgSend
0009fd4c  ldr     r1, [sp, #0x20]
0009fd4e  mov     sl, r6
0009fd50  mov     r4, r0
0009fd52  rsb     fp, r6, r4
0009fd56  adds    r2, r0, #1
0009fd58  mov     r0, r5
0009fd5a  blx     #0xddbfc ; -> objc_msgSend
0009fd5e  ldr     r1, [sp, #0x28]
0009fd60  mov     r2, r6
0009fd62  mov     r3, fp
0009fd64  ldr     r0, [sp, #4]
0009fd66  blx     #0xddbfc ; -> objc_msgSend
0009fd6a  ldr     r2, [pc, #0x94]
0009fd6c  ldr     r1, [sp, #0x1c]
0009fd6e  add     r2, pc ; -> 0x0017f454  
0009fd70  mov     r3, r0
0009fd72  ldr     r0, [sp, #0x10]
0009fd74  blx     #0xddbfc ; -> objc_msgSend
0009fd78  ldr     r1, [sp, #0xc]
0009fd7a  mov     r2, r0
0009fd7c  ldr     r0, [sp, #8]
0009fd7e  blx     #0xddbfc ; -> objc_msgSend
0009fd82  ldr     r1, [sp, #0x2c]
0009fd84  add     r2, sp, #0x34
0009fd86  blx     #0xddbfc ; -> objc_msgSend
0009fd8a  tst.w   r0, #0xff
0009fd8e  beq     #0x9fcd8
0009fd90  ldr     r3, [sp, #0x34]
0009fd92  ldr     r2, [pc, #0x70]
0009fd94  ldr     r0, [sp, #0x10]
0009fd96  ldr     r1, [sp, #0x1c]
0009fd98  str     r3, [sp]
0009fd9a  add     r2, pc ; -> 0x0017f464  
0009fd9c  mov     r3, r8
0009fd9e  blx     #0xddbfc ; -> objc_msgSend
0009fda2  mov     r8, r0
0009fda4  b       #0x9fcd8
0009fda6  ldr     r2, [pc, #0x60]
0009fda8  ldr     r0, [sp, #0x10]
0009fdaa  ldr     r1, [sp, #0x1c]
0009fdac  add     r2, pc ; -> 0x0017ef54  
0009fdae  ldr     r3, [sp, #0x38]
0009fdb0  blx     #0xddbfc ; -> objc_msgSend
0009fdb4  mov     r8, r0
0009fdb6  b       #0x9fd0c
0009fdb8  mov     r0, r8
0009fdba  sub.w   sp, r7, #0x18
0009fdbe  pop.w   {r8, sl, fp}
0009fdc2  pop     {r4, r5, r6, r7, pc}
0009fdc4  svc     #0xc8
0009fdc6  movs    r5, r0
0009fdc8  blo     #0x9fd60
0009fdca  movs    r5, r0
0009fdcc  ldm     r5!, {r1, r2}
0009fdce  movs    r5, r0
0009fdd0  udf     #0xd6
0009fdd2  movs    r5, r0
0009fdd4  ldm     r4!, {r1, r2, r3, r5, r6, r7}
0009fdd6  movs    r5, r0
0009fdd8  blo     #0x9fd00
0009fdda  movs    r5, r0
