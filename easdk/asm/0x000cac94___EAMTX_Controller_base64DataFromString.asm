========================================================================
-[EAMTX_Controller base64DataFromString  0x000cac94  464 bytes   EAMTX_Controller.mm
========================================================================

000cac94  push    {r4, r5, r6, r7, lr}
000cac96  add     r7, sp, #0xc
000cac98  push.w  {r8, sl, fp}
000cac9c  sub     sp, #0x14
000cac9e  mov     r4, r2
000caca0  cbnz    r2, #0xcacb4
000caca2  ldr     r0, [pc, #0x190]
000caca4  ldr     r1, [pc, #0x190]
000caca6  add     r0, pc ; -> 0x000fdb6c  
000caca8  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000cacaa  ldr     r0, [r0]
000cacac  ldr     r1, [r1]
000cacae  blx     #0xddbfc ; -> objc_msgSend
000cacb2  b       #0xcae28
000cacb4  ldr     r1, [pc, #0x184]
000cacb6  mov     r0, r2
000cacb8  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cacba  ldr     r1, [r1]
000cacbc  blx     #0xddbfc ; -> objc_msgSend
000cacc0  ldr     r1, [pc, #0x17c]
000cacc2  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000cacc4  ldr     r1, [r1]
000cacc6  str     r0, [sp, #8]
000cacc8  mov     r0, r4
000cacca  blx     #0xddbfc ; -> objc_msgSend
000cacce  ldr     r1, [pc, #0x174]
000cacd0  ldr     r2, [pc, #0x174]
000cacd2  movs    r4, #0
000cacd4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cacd6  add     r2, pc ; -> 0x00181654  
000cacd8  ldr     r1, [r1]
000cacda  mov     fp, r4
000cacdc  str     r0, [sp]
000cacde  ldr     r0, [pc, #0x16c]
000cace0  ldr     r3, [sp]
000cace2  add     r0, pc ; -> 0x000fdb5c  
000cace4  ldr     r0, [r0]
000cace6  blx     #0xddbfc ; -> objc_msgSend
000cacea  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cacee  ldr     r0, [pc, #0x160]
000cacf0  ldr     r1, [pc, #0x160]
000cacf2  ldr     r2, [sp]
000cacf4  add     r0, pc ; -> 0x000fdbbc  
000cacf6  add     r1, pc ; -> 0x000fd128  
000cacf8  ldr     r0, [r0]
000cacfa  ldr     r1, [r1]
000cacfc  blx     #0xddbfc ; -> objc_msgSend
000cad00  ldr     r1, [pc, #0x154]
000cad02  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000cad04  ldr     r1, [r1]
000cad06  mov     r6, r0
000cad08  blx     #0xddbfc ; -> objc_msgSend
000cad0c  ldr     r1, [pc, #0x14c]
000cad0e  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000cad10  ldr     r1, [r1]
000cad12  blx     #0xddbfc ; -> objc_msgSend
000cad16  ldr     r1, [pc, #0x148]
000cad18  str     r4, [sp, #4]
000cad1a  add     r1, pc ; -> 0x000fd124  
000cad1c  ldr.w   r8, [r1]
000cad20  b       #0xcad28
000cad22  mov     r4, sl
000cad24  add.w   fp, fp, #1
000cad28  ldr     r2, [sp]
000cad2a  cmp     fp, r2
000cad2c  beq     #0xcae16
000cad2e  ldr     r3, [sp, #8]
000cad30  ldrb.w  r2, [fp, r3]
000cad34  sub.w   r3, r2, #0x41
000cad38  uxtb    r0, r2
000cad3a  uxtb    r1, r3
000cad3c  cmp     r1, #0x19
000cad3e  bls     #0xcad7c
000cad40  sub.w   r3, r0, #0x61
000cad44  uxtb    r3, r3
000cad46  cmp     r3, #0x19
000cad48  it      ls
000cad4a  subls.w r3, r0, #0x47
000cad4e  bls     #0xcad5c
000cad50  sub.w   r3, r0, #0x30
000cad54  uxtb    r3, r3
000cad56  cmp     r3, #9
000cad58  bhi     #0xcad60
000cad5a  adds    r3, r0, #4
000cad5c  uxtb    r1, r3
000cad5e  b       #0xcad7c
000cad60  cmp     r2, #0x2b
000cad62  sxtb    r3, r2
000cad64  bne     #0xcad6a
000cad66  movs    r1, #0x3e
000cad68  b       #0xcad7c
000cad6a  cmp     r3, #0x3d
000cad6c  bne     #0xcad76
000cad6e  movs    r2, #1
000cad70  mov     r1, r0
000cad72  str     r2, [sp, #4]
000cad74  b       #0xcad80
000cad76  cmp     r3, #0x2f
000cad78  bne     #0xcad24
000cad7a  movs    r1, #0x3f
000cad7c  ldr     r3, [sp, #4]
000cad7e  cbz     r3, #0xcad94
000cad80  cmp     r4, #0
000cad82  beq     #0xcae16
000cad84  subs    r3, r4, #1
000cad86  uxth    r3, r3
000cad88  cmp     r3, #1
000cad8a  it      ls
000cad8c  movls.w ip, #1
000cad90  bhi     #0xcae1a
000cad92  b       #0xcae1e
000cad94  add     r2, sp, #0x14
000cad96  sxtah   r3, r2, r4
000cad9a  strb    r1, [r3, #-0x7]
000cad9e  adds    r3, r4, #1
000cada0  uxth    r4, r3
000cada2  sxth    r3, r3
000cada4  cmp     r3, #4
000cada6  bne     #0xcad24
000cada8  ldr.w   sl, [sp, #4]
000cadac  mov.w   ip, #3
000cadb0  ldrb.w  r0, [sp, #0xe]
000cadb4  ldrb.w  r3, [sp, #0xd]
000cadb8  ldrb.w  r1, [sp, #0xf]
000cadbc  and     r2, r0, #0x30
000cadc0  movs    r4, #0
000cadc2  lsls    r3, r3, #2
000cadc4  orr.w   r3, r3, r2, lsr #4
000cadc8  strb.w  r3, [sp, #0x11]
000cadcc  and     r3, r0, #0xf
000cadd0  and     r2, r1, #0x3c
000cadd4  lsls    r3, r3, #4
000cadd6  orr.w   r3, r3, r2, lsr #2
000cadda  strb.w  r3, [sp, #0x12]
000cadde  ldrb.w  r3, [sp, #0x10]
000cade2  and     r2, r1, #3
000cade6  sxth.w  r5, ip
000cadea  and     r3, r3, #0x3f
000cadee  orr.w   r3, r3, r2, lsl #6
000cadf2  strb.w  r3, [sp, #0x13]
000cadf6  b       #0xcae0a
000cadf8  add.w   r2, sp, #0x11
000cadfc  adds    r2, r2, r4
000cadfe  mov     r0, r6
000cae00  mov     r1, r8
000cae02  movs    r3, #1
000cae04  blx     #0xddbfc ; -> objc_msgSend
000cae08  adds    r4, #1
000cae0a  sxth    r3, r4
000cae0c  cmp     r5, r3
000cae0e  bgt     #0xcadf8
000cae10  cmp.w   sl, #0
000cae14  beq     #0xcad22
000cae16  mov     r0, r6
000cae18  b       #0xcae28
000cae1a  mov.w   ip, #2
000cae1e  strb.w  r1, [sp, #0x10]
000cae22  mov.w   sl, #1
000cae26  b       #0xcadb0
000cae28  sub.w   sp, r7, #0x18
000cae2c  pop.w   {r8, sl, fp}
000cae30  pop     {r4, r5, r6, r7, pc}
000cae32  nop     
000cae34  cmp     r6, #0xc2
000cae36  movs    r3, r0
000cae38  movs    r0, #0x68
000cae3a  movs    r3, r0
000cae3c  adds    r4, r4, #5
000cae3e  movs    r3, r0
000cae40  adds    r2, r6, #6
000cae42  movs    r3, r0
000cae44  adds    r0, r1, #7
000cae46  movs    r3, r0
000cae48  ldr     r2, [r7, #0x14]
000cae4a  movs    r3, r1
000cae4c  cmp     r6, #0x76
000cae4e  movs    r3, r0
000cae50  cmp     r6, #0xc4
000cae52  movs    r3, r0
000cae54  movs    r4, #0x2e
000cae56  movs    r3, r0
000cae58  subs    r2, r1, #7
000cae5a  movs    r3, r0
000cae5c  adds    r6, r0, #5
000cae5e  movs    r3, r0
000cae60  movs    r4, #6
000cae62  movs    r3, r0
