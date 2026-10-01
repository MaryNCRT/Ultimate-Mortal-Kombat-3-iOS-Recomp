========================================================================
-[SBJsonParser scanRestOfTrue  0x000d41ec  116 bytes   SBJsonParser.mm
========================================================================

000d41ec  push    {r4, r5, r6, r7, lr}
000d41ee  add     r7, sp, #0xc
000d41f0  str     r8, [sp, #-0x4]!
000d41f4  ldr     r3, [pc, #0x50]
000d41f6  ldr     r1, [pc, #0x54]
000d41f8  mov     r4, r0
000d41fa  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d41fc  mov     r8, r2
000d41fe  ldr     r6, [r3]
000d4200  add     r1, pc ; -> 0x000ed144  'rue'
000d4202  movs    r2, #3
000d4204  ldr     r5, [r0, r6]
000d4206  mov     r0, r5
000d4208  blx     #0xdde18 ; -> strncmp
000d420c  cbnz    r0, #0xd422c
000d420e  adds    r0, r5, #3
000d4210  ldr     r1, [pc, #0x3c]
000d4212  str     r0, [r4, r6]
000d4214  ldr     r0, [pc, #0x3c]
000d4216  add     r1, pc ; -> 0x000fca00  '(\x08\x0e'
000d4218  movs    r2, #1
000d421a  add     r0, pc ; -> 0x000fdb48  
000d421c  ldr     r1, [r1]
000d421e  ldr     r0, [r0]
000d4220  blx     #0xddbfc ; -> objc_msgSend
000d4224  str.w   r0, [r8]
000d4228  movs    r0, #1
000d422a  b       #0xd4240
000d422c  ldr     r1, [pc, #0x28]
000d422e  ldr     r3, [pc, #0x2c]
000d4230  mov     r0, r4
000d4232  add     r1, pc ; -> 0x000fd91c  
000d4234  add     r3, pc ; -> 0x00182424  
000d4236  ldr     r1, [r1]
000d4238  movs    r2, #3
000d423a  blx     #0xddbfc ; -> objc_msgSend
000d423e  movs    r0, #0
000d4240  ldr     r8, [sp], #4
000d4244  pop     {r4, r5, r6, r7, pc}
000d4246  nop     
000d4248  ldr     r2, [r0, #0x14]
000d424a  movs    r2, r0
000d424c  ldrh    r0, [r0, #0x3a]
000d424e  movs    r1, r0
000d4250  strh    r6, [r4, #0x3e]
000d4252  movs    r2, r0
000d4254  ldr     r1, [sp, #0xa8]
000d4256  movs    r2, r0
000d4258  str     r6, [sp, #0x398]
000d425a  movs    r2, r0
000d425c  b       #0xd4638
000d425e  movs    r2, r1
