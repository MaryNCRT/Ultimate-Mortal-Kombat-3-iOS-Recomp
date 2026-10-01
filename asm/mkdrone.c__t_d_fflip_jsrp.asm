========================================================================
t_d_fflip_jsrp  0x00070de0  108 bytes   mkdrone.c
========================================================================

00070de0  push    {r4, r5, r6, r7, lr}
00070de2  add     r7, sp, #0xc
00070de4  ldr.w   r3, [r0, #0xa4]
00070de8  mov     r4, r0
00070dea  ldr.w   r5, [r0, #0x108]
00070dee  adds    r3, #1
00070df0  ldr.w   r6, [r0, r3, lsl #3]
00070df4  cbnz    r6, #0x70e2e
00070df6  mov     r0, r5
00070df8  bl      #0x70cf8 ; -> frontflip_setup
00070dfc  ldr     r3, [pc, #0x3c]
00070dfe  add     r3, pc ; -> 0x000f357c  G
00070e00  ldr     r3, [r3]
00070e02  ldrsh.w r3, [r3, #0x44c]
00070e06  cmp     r3, #3
00070e08  str     r3, [r5, #0x1c]
00070e0a  ble     #0x70e34
00070e0c  ldr     r2, [pc, #0x30]
00070e0e  ldr     r3, [pc, #0x34]
00070e10  add     r2, pc ; -> 0x00070e4d  t_d_fflip_scan_jsrp
00070e12  add     r3, pc ; -> 0x000705fd  t_fflip_watchout
00070e14  str     r3, [r5, #0x34]
00070e16  ldr.w   r3, [r4, #0xa4]
00070e1a  mov     r0, r6
00070e1c  lsls    r3, r3, #3
00070e1e  adds    r3, r3, r4
00070e20  str     r2, [r3, #4]
00070e22  ldr.w   r3, [r4, #0xa4]
00070e26  adds    r3, #1
00070e28  str.w   r6, [r4, r3, lsl #3]
00070e2c  b       #0x70e32
00070e2e  mvn     r0, #2
00070e32  pop     {r4, r5, r6, r7, pc}
00070e34  ldr     r2, [pc, #0x10]
00070e36  add     r2, pc ; -> 0x000682a9  t_d_fflip_noscan_jsrp
00070e38  b       #0x70e16
00070e3a  nop     
00070e3c  movs    r7, #0x7a
00070e3e  movs    r0, r1
00070e40  movs    r1, r7
00070e42  movs    r0, r0
00070e44  bl      #0x58e46
00070e48  strb    r7, [r5, #0x11]
