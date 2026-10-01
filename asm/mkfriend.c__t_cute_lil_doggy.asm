========================================================================
t_cute_lil_doggy  0x000a5494  240 bytes   mkfriend.c
========================================================================

000a5494  mov     r2, r0
000a5496  ldr.w   r1, [r0, #0x108]
000a549a  ldr.w   r0, [r0, #0xa4]
000a549e  adds    r3, r0, #1
000a54a0  ldr.w   r3, [r2, r3, lsl #3]
000a54a4  cmp     r3, #0
000a54a6  bne     #0xa5528
000a54a8  ldr     r0, [r1, #8]
000a54aa  movw    r3, #0x1463
000a54ae  str     r3, [r0, #0x2c]
000a54b0  ldr     r0, [r1, #8]
000a54b2  ldr     r3, [r0, #0x28]
000a54b4  tst.w   r3, #0x10
000a54b8  bne     #0xa5550
000a54ba  ldr     r3, [pc, #0xac]
000a54bc  add     r3, pc ; -> 0x000f357c  G
000a54be  ldr     r3, [r3]
000a54c0  ldr.w   r3, [r3, #0x468]
000a54c4  subs    r3, #0x30
000a54c6  str     r3, [r1, #0x1c]
000a54c8  mov.w   r3, #0x60000
000a54cc  str     r3, [r1, #0x30]
000a54ce  ldrh    r3, [r1, #0x1c]
000a54d0  strh    r3, [r0, #0xe]
000a54d2  ldr     r3, [pc, #0x98]
000a54d4  ldr     r0, [r1, #8]
000a54d6  add     r3, pc ; -> 0x000f357c  G
000a54d8  ldr     r3, [r3]
000a54da  ldr.w   r3, [r3, #0xac]
000a54de  subs    r3, #0x20
000a54e0  strh    r3, [r0, #0x12]
000a54e2  ldr     r0, [r1, #8]
000a54e4  ldr     r3, [r1, #0x30]
000a54e6  str     r3, [r0, #0x18]
000a54e8  ldr.w   r3, [pc, #0x84]
000a54ec  add     r3, pc ; -> 0x00177d0c  a_dog
000a54ee  str     r3, [r1, #0x40]
000a54f0  movs    r3, #3
000a54f2  str     r3, [r1, #0x1c]
000a54f4  ldr.w   r3, [r2, #0xa4]
000a54f8  movw    r1, #0x4a6
000a54fc  adds    r3, #1
000a54fe  str.w   r1, [r2, r3, lsl #3]
000a5502  ldr.w   r3, [r2, #0xa4]
000a5506  adds    r1, r3, #1
000a5508  ldr.w   r3, [pc, #0x68]
000a550c  str.w   r1, [r2, #0xa4]
000a5510  add     r3, pc ; -> 0x000f37cc  t_mframew
000a5512  ldr     r0, [r3]
000a5514  lsls    r3, r1, #3
000a5516  adds    r3, r3, r2
000a5518  str     r0, [r3, #4]
000a551a  ldr.w   r3, [r2, #0xa4]
000a551e  movs    r0, #0
000a5520  adds    r3, #1
000a5522  str.w   r0, [r2, r3, lsl #3]
000a5526  bx      lr
000a5528  movw    r1, #0x4a6
000a552c  cmp     r3, r1
000a552e  it      ne
000a5530  mvnne   r0, #2
000a5534  bne     #0xa5526
000a5536  ldr     r3, [pc, #0x40]
000a5538  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a553a  ldr     r1, [r3]
000a553c  lsls    r3, r0, #3
000a553e  adds    r3, r3, r2
000a5540  movs    r0, #0
000a5542  str     r1, [r3, #4]
000a5544  ldr.w   r3, [r2, #0xa4]
000a5548  adds    r3, #1
000a554a  str.w   r0, [r2, r3, lsl #3]
000a554e  b       #0xa5526
000a5550  ldr     r3, [pc, #0x28]
000a5552  add     r3, pc ; -> 0x000f357c  G
000a5554  ldr     r3, [r3]
000a5556  ldr.w   r3, [r3, #0x470]
000a555a  adds    r3, #0x60
000a555c  str     r3, [r1, #0x1c]
000a555e  ldr.w   r3, [pc, #0x20]
000a5562  str     r3, [r1, #0x30]
000a5564  b       #0xa54ce
000a5566  nop     
000a5568  b       #0xa56e4
000a556a  movs    r4, r0
000a556c  b       #0xa56b4
000a556e  movs    r4, r0
000a5570  cmp     r0, #0x1c
000a5572  movs    r5, r1
000a5574  b       #0xa5ae8
000a5576  movs    r4, r0
000a5578  b       #0xa594c
000a557a  movs    r4, r0
000a557c  b       #0xa55cc
000a557e  movs    r4, r0
000a5580  movs    r0, r0
