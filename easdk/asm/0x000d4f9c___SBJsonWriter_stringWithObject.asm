========================================================================
-[SBJsonWriter stringWithObject  0x000d4f9c  236 bytes   SBJsonWriter.mm
========================================================================

000d4f9c  push    {r4, r5, r6, r7, lr}
000d4f9e  add     r7, sp, #0xc
000d4fa0  str     r8, [sp, #-0x4]!
000d4fa4  ldr     r1, [pc, #0xb4]
000d4fa6  mov     r8, r0
000d4fa8  ldr     r0, [pc, #0xb4]
000d4faa  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000d4fac  mov     r5, r2
000d4fae  ldr     r6, [r1]
000d4fb0  ldr     r1, [pc, #0xb0]
000d4fb2  add     r0, pc ; -> 0x000fdb44  
000d4fb4  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d4fb6  ldr     r0, [r0]
000d4fb8  ldr     r4, [r1]
000d4fba  mov     r1, r4
000d4fbc  blx     #0xddbfc ; -> objc_msgSend
000d4fc0  mov     r1, r6
000d4fc2  mov     r2, r0
000d4fc4  mov     r0, r5
000d4fc6  blx     #0xddbfc ; -> objc_msgSend
000d4fca  tst.w   r0, #0xff
000d4fce  bne     #0xd4fec
000d4fd0  ldr     r0, [pc, #0x94]
000d4fd2  mov     r1, r4
000d4fd4  add     r0, pc ; -> 0x000fdc14  
000d4fd6  ldr     r0, [r0]
000d4fd8  blx     #0xddbfc ; -> objc_msgSend
000d4fdc  mov     r1, r6
000d4fde  mov     r2, r0
000d4fe0  mov     r0, r5
000d4fe2  blx     #0xddbfc ; -> objc_msgSend
000d4fe6  tst.w   r0, #0xff
000d4fea  beq     #0xd5038
000d4fec  ldr     r1, [pc, #0x7c]
000d4fee  mov     r0, r8
000d4ff0  mov     r2, r5
000d4ff2  add     r1, pc ; -> 0x000fd768  
000d4ff4  ldr     r1, [r1]
000d4ff6  blx     #0xddbfc ; -> objc_msgSend
000d4ffa  b       #0xd5054
000d4ffc  ldr     r1, [pc, #0x70]
000d4ffe  mov     r0, r5
000d5000  add     r1, pc ; -> 0x000fd5dc  
000d5002  ldr     r4, [r1]
000d5004  mov     r1, r6
000d5006  blx     #0xddbfc ; -> objc_msgSend
000d500a  mov     r1, r4
000d500c  mov     r2, r0
000d500e  mov     r0, r8
000d5010  blx     #0xddbfc ; -> objc_msgSend
000d5014  cbnz    r0, #0xd5054
000d5016  ldr     r1, [pc, #0x5c]
000d5018  mov     r0, r8
000d501a  add     r1, pc ; -> 0x000fd928  
000d501c  ldr     r1, [r1]
000d501e  blx     #0xddbfc ; -> objc_msgSend
000d5022  ldr     r1, [pc, #0x54]
000d5024  ldr     r3, [pc, #0x54]
000d5026  mov     r0, r8
000d5028  add     r1, pc ; -> 0x000fd91c  
000d502a  add     r3, pc ; -> 0x00182224  
000d502c  ldr     r1, [r1]
000d502e  movs    r2, #4
000d5030  blx     #0xddbfc ; -> objc_msgSend
000d5034  movs    r0, #0
000d5036  b       #0xd5054
000d5038  ldr     r1, [pc, #0x44]
000d503a  mov     r0, r5
000d503c  add     r1, pc ; -> 0x000fd920  '$\x18\x0f'
000d503e  ldr     r6, [r1]
000d5040  ldr     r1, [pc, #0x40]
000d5042  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000d5044  mov     r2, r6
000d5046  ldr     r1, [r1]
000d5048  blx     #0xddbfc ; -> objc_msgSend
000d504c  tst.w   r0, #0xff
000d5050  bne     #0xd4ffc
000d5052  b       #0xd5016
000d5054  ldr     r8, [sp], #4
000d5058  pop     {r4, r5, r6, r7, pc}
000d505a  nop     
000d505c  ldrb    r2, [r2, #0x1b]
000d505e  movs    r2, r0
000d5060  ldrh    r6, [r1, #0x1c]
000d5062  movs    r2, r0
000d5064  ldrb    r4, [r2, #9]
000d5066  movs    r2, r0
000d5068  ldrh    r4, [r7, #0x20]
000d506a  movs    r2, r0
000d506c  strh    r2, [r6, #0x3a]
000d506e  movs    r2, r0
000d5070  strh    r0, [r3, #0x2e]
000d5072  movs    r2, r0
000d5074  ldrh    r2, [r1, #8]
000d5076  movs    r2, r0
000d5078  ldrh    r0, [r6, #6]
000d507a  movs    r2, r0
000d507c  bne     #0xd506c
000d507e  movs    r2, r1
000d5080  ldrh    r0, [r4, #6]
000d5082  movs    r2, r0
000d5084  ldrb    r2, [r1, #0x11]
000d5086  movs    r2, r0
