========================================================================
-[SBJsonParser scanValue  0x000d3fcc  316 bytes   SBJsonParser.mm
========================================================================

000d3fcc  push    {r4, r5, r6, r7, lr}
000d3fce  add     r7, sp, #0xc
000d3fd0  push.w  {r8, sl}
000d3fd4  ldr.w   r8, [pc, #0xf4]
000d3fd8  mov     r5, r0
000d3fda  mov     sl, r2
000d3fdc  b       #0xd3fe6
000d3fde  ldr     r2, [r4]
000d3fe0  ldr     r3, [r5, r2]
000d3fe2  adds    r3, #1
000d3fe4  str     r3, [r5, r2]
000d3fe6  mov     r4, r8
000d3fe8  add     r4, pc
000d3fea  mov.w   r1, #0x4000
000d3fee  ldr     r3, [r4]
000d3ff0  ldr     r3, [r5, r3]
000d3ff2  ldrsb.w r0, [r3]
000d3ff6  bl      #0xd3f9c ; -> ZL8__istypeim
000d3ffa  mov     r6, r0
000d3ffc  cmp     r0, #0
000d3ffe  bne     #0xd3fde
000d4000  ldr     r2, [r4]
000d4002  ldr     r3, [r5, r2]
000d4004  ldrb    r1, [r3], #1
000d4008  sxtb    r4, r1
000d400a  cmp     r4, #0x5b
000d400c  str     r3, [r5, r2]
000d400e  beq     #0xd404a
000d4010  bgt     #0xd4030
000d4012  cmp     r4, #0x39
000d4014  bgt     #0xd40b2
000d4016  cmp     r4, #0x30
000d4018  bge     #0xd4074
000d401a  cmp     r4, #0x2b
000d401c  beq     #0xd4086
000d401e  bgt     #0xd402a
000d4020  cmp     r4, #0
000d4022  beq     #0xd409c
000d4024  cmp     r4, #0x22
000d4026  bne     #0xd40b2
000d4028  b       #0xd405c
000d402a  cmp     r4, #0x2d
000d402c  bne     #0xd40b2
000d402e  b       #0xd4074
000d4030  cmp     r4, #0x6e
000d4032  beq     #0xd406e
000d4034  bgt     #0xd403c
000d4036  cmp     r4, #0x66
000d4038  bne     #0xd40b2
000d403a  b       #0xd4062
000d403c  cmp     r4, #0x74
000d403e  beq     #0xd4068
000d4040  cmp     r4, #0x7b
000d4042  bne     #0xd40b2
000d4044  ldr     r1, [pc, #0x88]
000d4046  add     r1, pc ; -> 0x000fd960  
000d4048  b       #0xd404e
000d404a  ldr     r1, [pc, #0x88]
000d404c  add     r1, pc ; -> 0x000fd95c  
000d404e  ldr     r1, [r1]
000d4050  mov     r0, r5
000d4052  mov     r2, sl
000d4054  blx     #0xddbfc ; -> objc_msgSend
000d4058  sxtb    r0, r0
000d405a  b       #0xd40c6
000d405c  ldr     r1, [pc, #0x78]
000d405e  add     r1, pc ; -> 0x000fd958  
000d4060  b       #0xd404e
000d4062  ldr     r1, [pc, #0x78]
000d4064  add     r1, pc ; -> 0x000fd954  
000d4066  b       #0xd404e
000d4068  ldr     r1, [pc, #0x74]
000d406a  add     r1, pc ; -> 0x000fd950  '\x05\x19\x0f'
000d406c  b       #0xd404e
000d406e  ldr     r1, [pc, #0x74]
000d4070  add     r1, pc ; -> 0x000fd94c  
000d4072  b       #0xd404e
000d4074  ldr     r3, [pc, #0x70]
000d4076  ldr     r1, [pc, #0x74]
000d4078  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d407a  add     r1, pc ; -> 0x000fd948  
000d407c  ldr     r2, [r3]
000d407e  ldr     r3, [r5, r2]
000d4080  subs    r3, #1
000d4082  str     r3, [r5, r2]
000d4084  b       #0xd404e
000d4086  ldr     r1, [pc, #0x68]
000d4088  ldr     r3, [pc, #0x68]
000d408a  mov     r0, r5
000d408c  add     r1, pc ; -> 0x000fd91c  
000d408e  add     r3, pc ; -> 0x001823d4  
000d4090  ldr     r1, [r1]
000d4092  movs    r2, #2
000d4094  blx     #0xddbfc ; -> objc_msgSend
000d4098  mov     r0, r6
000d409a  b       #0xd40c6
000d409c  ldr     r1, [pc, #0x58]
000d409e  ldr     r3, [pc, #0x5c]
000d40a0  mov     r0, r5
000d40a2  add     r1, pc ; -> 0x000fd91c  
000d40a4  add     r3, pc ; -> 0x001823e4  
000d40a6  ldr     r1, [r1]
000d40a8  movs    r2, #0xb
000d40aa  blx     #0xddbfc ; -> objc_msgSend
000d40ae  mov     r0, r4
000d40b0  b       #0xd40c6
000d40b2  ldr     r1, [pc, #0x4c]
000d40b4  ldr     r3, [pc, #0x4c]
000d40b6  mov     r0, r5
000d40b8  add     r1, pc ; -> 0x000fd91c  
000d40ba  add     r3, pc ; -> 0x001823f4  
000d40bc  ldr     r1, [r1]
000d40be  movs    r2, #3
000d40c0  blx     #0xddbfc ; -> objc_msgSend
000d40c4  movs    r0, #0
000d40c6  pop.w   {r8, sl}
000d40ca  pop     {r4, r5, r6, r7, pc}
000d40cc  ldr     r4, [r2, #0x34]
000d40ce  movs    r2, r0
000d40d0  ldr     r1, [sp, #0x58]
000d40d2  movs    r2, r0
000d40d4  ldr     r1, [sp, #0x30]
000d40d6  movs    r2, r0
000d40d8  ldr     r0, [sp, #0x3d8]
000d40da  movs    r2, r0
000d40dc  ldr     r0, [sp, #0x3b0]
000d40de  movs    r2, r0
000d40e0  ldr     r0, [sp, #0x388]
000d40e2  movs    r2, r0
000d40e4  ldr     r0, [sp, #0x360]
000d40e6  movs    r2, r0
000d40e8  ldr     r4, [r0, #0x2c]
000d40ea  movs    r2, r0
000d40ec  ldr     r0, [sp, #0x328]
000d40ee  movs    r2, r0
000d40f0  ldr     r0, [sp, #0x230]
000d40f2  movs    r2, r0
000d40f4  b       #0xd477c
000d40f6  movs    r2, r1
000d40f8  ldr     r0, [sp, #0x1d8]
000d40fa  movs    r2, r0
000d40fc  b       #0xd4778
000d40fe  movs    r2, r1
000d4100  ldr     r0, [sp, #0x180]
000d4102  movs    r2, r0
000d4104  b       #0xd4774
000d4106  movs    r2, r1
