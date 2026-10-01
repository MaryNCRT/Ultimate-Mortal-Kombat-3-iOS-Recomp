========================================================================
-[SocialUser loadSocialUserPicture]  0x000d87a4  308 bytes   SocialUser.m
========================================================================

000d87a4  push    {r4, r5, r6, r7, lr}
000d87a6  add     r7, sp, #0xc
000d87a8  push.w  {r8, sl, fp}
000d87ac  sub     sp, #8
000d87ae  ldr     r3, [pc, #0xdc]
000d87b0  mov     r4, r0
000d87b2  add     r3, pc ; -> 0x000fbd80  OBJC_IVAR_$_SocialUser.picture
000d87b4  ldr     r3, [r3]
000d87b6  ldr     r3, [r0, r3]
000d87b8  cbz     r3, #0xd87e4
000d87ba  ldr     r1, [pc, #0xd4]
000d87bc  ldr     r5, [pc, #0xd4]
000d87be  add     r1, pc ; -> 0x000fd870  "'\x11\x0f"
000d87c0  add     r5, pc ; -> 0x000fbd84  OBJC_IVAR_$_SocialUser.pictureDelegate
000d87c2  ldr     r6, [r1]
000d87c4  ldr     r1, [pc, #0xd0]
000d87c6  ldr     r3, [r5]
000d87c8  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000d87ca  mov     r2, r6
000d87cc  ldr     r0, [r0, r3]
000d87ce  ldr     r1, [r1]
000d87d0  blx     #0xddbfc ; -> objc_msgSend
000d87d4  tst.w   r0, #0xff
000d87d8  beq     #0xd87e4
000d87da  ldr     r3, [r5]
000d87dc  mov     r1, r6
000d87de  mov     r2, r4
000d87e0  ldr     r0, [r4, r3]
000d87e2  b       #0xd887c
000d87e4  ldr     r5, [pc, #0xb4]
000d87e6  add     r5, pc ; -> 0x000fbd6c  OBJC_IVAR_$_SocialUser.pic_square
000d87e8  ldr     r3, [r5]
000d87ea  ldr     r3, [r4, r3]
000d87ec  cmp     r3, #0
000d87ee  beq     #0xd885e
000d87f0  ldr     r1, [pc, #0xac]
000d87f2  ldr     r0, [pc, #0xb0]
000d87f4  add     r1, pc ; -> 0x000fd2c0  
000d87f6  add     r0, pc ; -> 0x000fdcdc  
000d87f8  ldr.w   fp, [r1]
000d87fc  ldr     r1, [pc, #0xa8]
000d87fe  ldr     r0, [r0]
000d8800  add     r1, pc ; -> 0x000fd86c  '\x03\x11\x0f'
000d8802  ldr     r1, [r1]
000d8804  blx     #0xddbfc ; -> objc_msgSend
000d8808  ldr     r1, [pc, #0xa0]
000d880a  ldr     r3, [r5]
000d880c  ldr     r2, [pc, #0xa0]
000d880e  add     r1, pc ; -> 0x000fd864  
000d8810  ldr.w   r8, [r1]
000d8814  ldr     r1, [pc, #0x9c]
000d8816  add     r2, pc ; -> 0x00181f64  
000d8818  ldr     r3, [r4, r3]
000d881a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d881c  ldr     r1, [r1]
000d881e  mov     sl, r0
000d8820  ldr     r0, [pc, #0x94]
000d8822  add     r0, pc ; -> 0x000fdb5c  
000d8824  ldr     r0, [r0]
000d8826  blx     #0xddbfc ; -> objc_msgSend
000d882a  ldr     r1, [pc, #0x90]
000d882c  ldr     r3, [r5]
000d882e  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000d8830  ldr     r2, [r4, r3]
000d8832  ldr     r1, [r1]
000d8834  mov     r6, r0
000d8836  ldr     r0, [pc, #0x88]
000d8838  add     r0, pc ; -> 0x000fdb64  
000d883a  ldr     r0, [r0]
000d883c  blx     #0xddbfc ; -> objc_msgSend
000d8840  ldr     r2, [pc, #0x80]
000d8842  mov     r1, r8
000d8844  str     r4, [sp]
000d8846  add     r2, pc ; -> 0x000fd868  
000d8848  ldr     r2, [r2]
000d884a  str     r2, [sp, #4]
000d884c  mov     r2, r6
000d884e  mov     r3, r0
000d8850  mov     r0, sl
000d8852  blx     #0xddbfc ; -> objc_msgSend
000d8856  mov     r1, fp
000d8858  mov     r2, r0
000d885a  mov     r0, r4
000d885c  b       #0xd887c
000d885e  ldr     r0, [pc, #0x68]
000d8860  ldr     r1, [pc, #0x68]
000d8862  ldr     r2, [pc, #0x6c]
000d8864  add     r0, pc ; -> 0x000fdba8  
000d8866  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
000d8868  add     r2, pc ; -> 0x00181f74  
000d886a  ldr     r1, [r1]
000d886c  ldr     r0, [r0]
000d886e  blx     #0xddbfc ; -> objc_msgSend
000d8872  ldr     r1, [pc, #0x60]
000d8874  add     r1, pc ; -> 0x000fd2c0  
000d8876  ldr     r1, [r1]
000d8878  mov     r2, r0
000d887a  mov     r0, r4
000d887c  blx     #0xddbfc ; -> objc_msgSend
000d8880  sub.w   sp, r7, #0x18
000d8884  pop.w   {r8, sl, fp}
000d8888  pop     {r4, r5, r6, r7, pc}
000d888a  nop     
000d888c  adds    r5, #0xca
000d888e  movs    r2, r0
000d8890  str     r6, [r5, r2]
000d8892  movs    r2, r0
000d8894  adds    r5, #0xc0
000d8896  movs    r2, r0
000d8898  add     ip, r8
000d889a  movs    r2, r0
000d889c  adds    r5, #0x82
000d889e  movs    r2, r0
000d88a0  ldr     r2, [pc, #0x320]
000d88a2  movs    r2, r0
000d88a4  strb    r2, [r4, r3]
000d88a6  movs    r2, r0
000d88a8  str     r0, [r5, r1]
000d88aa  movs    r2, r0
000d88ac  str     r2, [r2, r1]
000d88ae  movs    r2, r0
000d88b0  str     r7, [sp, #0x128]
000d88b2  movs    r2, r1
000d88b4  cmp     r2, r0
000d88b6  movs    r2, r0
000d88b8  strh    r6, [r6, r4]
000d88ba  movs    r2, r0
000d88bc  muls    r6, r7, r6
000d88be  movs    r2, r0
000d88c0  strh    r0, [r5, r4]
000d88c2  movs    r2, r0
000d88c4  str     r6, [r3, r0]
000d88c6  movs    r2, r0
000d88c8  strh    r0, [r0, r5]
000d88ca  movs    r2, r0
000d88cc  add     r6, sb
000d88ce  movs    r2, r0
000d88d0  str     r7, [sp, #0x20]
000d88d2  movs    r2, r1
000d88d4  ldr     r2, [pc, #0x120]
000d88d6  movs    r2, r0
