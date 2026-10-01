========================================================================
-[SBJsonParser objectWithString  0x000d3dd4  148 bytes   SBJsonParser.mm
========================================================================

000d3dd4  push    {r4, r5, r6, r7, lr}
000d3dd6  add     r7, sp, #0xc
000d3dd8  str     r8, [sp, #-0x4]!
000d3ddc  ldr     r1, [pc, #0x6c]
000d3dde  mov     r8, r0
000d3de0  add     r1, pc ; -> 0x000fd760  'o\x04\x0f'
000d3de2  ldr     r1, [r1]
000d3de4  blx     #0xddbfc ; -> objc_msgSend
000d3de8  mov     r4, r0
000d3dea  cmp     r0, #0
000d3dec  beq     #0xd3e44
000d3dee  ldr     r1, [pc, #0x60]
000d3df0  ldr     r0, [pc, #0x60]
000d3df2  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000d3df4  add     r0, pc ; -> 0x000fdb44  
000d3df6  ldr     r6, [r1]
000d3df8  ldr     r1, [pc, #0x5c]
000d3dfa  ldr     r0, [r0]
000d3dfc  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d3dfe  ldr     r5, [r1]
000d3e00  mov     r1, r5
000d3e02  blx     #0xddbfc ; -> objc_msgSend
000d3e06  mov     r1, r6
000d3e08  mov     r2, r0
000d3e0a  mov     r0, r4
000d3e0c  blx     #0xddbfc ; -> objc_msgSend
000d3e10  tst.w   r0, #0xff
000d3e14  bne     #0xd3e44
000d3e16  ldr     r0, [pc, #0x44]
000d3e18  mov     r1, r5
000d3e1a  add     r0, pc ; -> 0x000fdc14  
000d3e1c  ldr     r0, [r0]
000d3e1e  blx     #0xddbfc ; -> objc_msgSend
000d3e22  mov     r1, r6
000d3e24  mov     r2, r0
000d3e26  mov     r0, r4
000d3e28  blx     #0xddbfc ; -> objc_msgSend
000d3e2c  uxtb    r5, r0
000d3e2e  cbnz    r5, #0xd3e44
000d3e30  ldr     r1, [pc, #0x2c]
000d3e32  ldr     r3, [pc, #0x30]
000d3e34  mov     r0, r8
000d3e36  add     r1, pc ; -> 0x000fd91c  
000d3e38  add     r3, pc ; -> 0x00182394  
000d3e3a  ldr     r1, [r1]
000d3e3c  movs    r2, #4
000d3e3e  blx     #0xddbfc ; -> objc_msgSend
000d3e42  mov     r4, r5
000d3e44  mov     r0, r4
000d3e46  ldr     r8, [sp], #4
000d3e4a  pop     {r4, r5, r6, r7, pc}
000d3e4c  ldr     r1, [sp, #0x1f0]
000d3e4e  movs    r2, r0
000d3e50  str     r0, [sp, #0x228]
000d3e52  movs    r2, r0
000d3e54  ldr     r5, [sp, #0x130]
000d3e56  movs    r2, r0
000d3e58  ldrh    r4, [r1, #0x20]
000d3e5a  movs    r2, r0
000d3e5c  ldr     r5, [sp, #0x3d8]
000d3e5e  movs    r2, r0
000d3e60  ldr     r2, [sp, #0x388]
000d3e62  movs    r2, r0
000d3e64  b       #0xd3918
000d3e66  movs    r2, r1
