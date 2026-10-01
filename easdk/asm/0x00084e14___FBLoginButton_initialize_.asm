========================================================================
+[FBLoginButton initialize]  0x00084e14  92 bytes   FBLoginButton.m
========================================================================

00084e14  push    {r4, r7, lr}
00084e16  add     r7, sp, #4
00084e18  ldr     r1, [pc, #0x3c]
00084e1a  mov     r4, r0
00084e1c  ldr     r0, [pc, #0x3c]
00084e1e  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
00084e20  add     r0, pc ; -> 0x000fdbe8  
00084e22  ldr     r1, [r1]
00084e24  ldr     r0, [r0]
00084e26  blx     #0xddbfc ; -> objc_msgSend
00084e2a  cmp     r0, r4
00084e2c  beq     #0x84e30
00084e2e  pop     {r4, r7, pc}
00084e30  ldr     r1, [pc, #0x2c]
00084e32  mvn     r0, #2
00084e36  add     r1, pc ; -> 0x00175918  'UIAccessibilityTraitImage'
00084e38  blx     #0xdd788 ; -> dlsym
00084e3c  ldr     r3, [pc, #0x24]
00084e3e  ldr     r1, [pc, #0x28]
00084e40  add     r3, pc ; -> 0x006bc120  traitImage
00084e42  add     r1, pc ; -> 0x00175934  'UIAccessibilityTraitButton'
00084e44  str     r0, [r3]
00084e46  mvn     r0, #2
00084e4a  blx     #0xdd788 ; -> dlsym
00084e4e  ldr     r3, [pc, #0x1c]
00084e50  add     r3, pc ; -> 0x006bc124  traitButton
00084e52  str     r0, [r3]
00084e54  b       #0x84e2e
00084e56  nop     
00084e58  ldrb    r2, [r5, #0xf]
00084e5a  movs    r7, r0
00084e5c  ldrh    r4, [r0, #0x2e]
00084e5e  movs    r7, r0
00084e60  lsrs    r6, r3, #0xb
00084e62  movs    r7, r1
00084e64  strb    r4, [r3, #0xb]
00084e66  lsls    r3, r4, #1
00084e68  lsrs    r6, r5, #0xb
00084e6a  movs    r7, r1
00084e6c  strb    r0, [r2, #0xb]
00084e6e  lsls    r3, r4, #1
