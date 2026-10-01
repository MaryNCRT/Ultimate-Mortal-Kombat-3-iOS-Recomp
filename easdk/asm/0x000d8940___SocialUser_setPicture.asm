========================================================================
-[SocialUser setPicture  0x000d8940  116 bytes   SocialUser.m
========================================================================

000d8940  push    {r4, r5, r6, r7, lr}
000d8942  add     r7, sp, #0xc
000d8944  ldr     r4, [pc, #0x54]
000d8946  ldr     r1, [pc, #0x58]
000d8948  mov     r5, r0
000d894a  add     r4, pc ; -> 0x000fbd80  OBJC_IVAR_$_SocialUser.picture
000d894c  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d894e  ldr     r3, [r4]
000d8950  ldr     r1, [r1]
000d8952  mov     r6, r2
000d8954  ldr     r0, [r0, r3]
000d8956  blx     #0xddbfc ; -> objc_msgSend
000d895a  ldr     r1, [pc, #0x48]
000d895c  mov     r0, r6
000d895e  ldr     r4, [r4]
000d8960  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d8962  ldr     r1, [r1]
000d8964  blx     #0xddbfc ; -> objc_msgSend
000d8968  str     r0, [r5, r4]
000d896a  cbz     r6, #0xd8998
000d896c  ldr     r1, [pc, #0x38]
000d896e  ldr     r4, [pc, #0x3c]
000d8970  add     r1, pc ; -> 0x000fd870  "'\x11\x0f"
000d8972  add     r4, pc ; -> 0x000fbd84  OBJC_IVAR_$_SocialUser.pictureDelegate
000d8974  ldr     r6, [r1]
000d8976  ldr     r1, [pc, #0x38]
000d8978  ldr     r3, [r4]
000d897a  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000d897c  mov     r2, r6
000d897e  ldr     r0, [r5, r3]
000d8980  ldr     r1, [r1]
000d8982  blx     #0xddbfc ; -> objc_msgSend
000d8986  tst.w   r0, #0xff
000d898a  beq     #0xd8998
000d898c  ldr     r3, [r4]
000d898e  mov     r1, r6
000d8990  mov     r2, r5
000d8992  ldr     r0, [r5, r3]
000d8994  blx     #0xddbfc ; -> objc_msgSend
000d8998  pop     {r4, r5, r6, r7, pc}
000d899a  nop     
000d899c  adds    r4, #0x32
000d899e  movs    r2, r0
000d89a0  asrs    r0, r1
000d89a2  movs    r2, r0
000d89a4  muls    r4, r5, r4
000d89a6  movs    r2, r0
000d89a8  ldr     r6, [pc, #0x3f0]
000d89aa  movs    r2, r0
000d89ac  adds    r4, #0xe
000d89ae  movs    r2, r0
000d89b0  orrs    r2, r2
000d89b2  movs    r2, r0
