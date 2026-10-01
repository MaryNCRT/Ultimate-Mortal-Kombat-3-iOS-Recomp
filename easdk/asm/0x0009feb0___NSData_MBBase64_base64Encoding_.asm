========================================================================
-[NSData(MBBase64) base64Encoding]  0x0009feb0  388 bytes   Base64Encode.mm
========================================================================

0009feb0  push    {r4, r5, r6, r7, lr}
0009feb2  add     r7, sp, #0xc
0009feb4  push.w  {r8, sl, fp}
0009feb8  sub     sp, #0x18
0009feba  ldr     r1, [pc, #0x14c]
0009febc  mov     r6, r0
0009febe  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
0009fec0  ldr.w   sl, [r1]
0009fec4  mov     r1, sl
0009fec6  blx     #0xddbfc ; -> objc_msgSend
0009feca  cbnz    r0, #0x9feda
0009fecc  ldr     r0, [pc, #0x13c]
0009fece  add     r0, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
0009fed0  sub.w   sp, r7, #0x18
0009fed4  pop.w   {r8, sl, fp}
0009fed8  pop     {r4, r5, r6, r7, pc}
0009feda  mov     r1, sl
0009fedc  mov     r0, r6
0009fede  blx     #0xddbfc ; -> objc_msgSend
0009fee2  ldr     r3, [pc, #0x12c]
0009fee4  adds    r0, #2
0009fee6  umull   r2, r0, r3, r0
0009feea  lsrs    r0, r0, #1
0009feec  lsls    r0, r0, #2
0009feee  blx     #0xddb84 ; -> malloc
0009fef2  str     r0, [sp, #8]
0009fef4  cmp     r0, #0
0009fef6  beq     #0x9fed0
0009fef8  ldr     r1, [pc, #0x118]
0009fefa  ldr.w   r8, [sp, #8]
0009fefe  mov.w   fp, #0
0009ff02  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
0009ff04  movs    r3, #4
0009ff06  ldr     r1, [r1]
0009ff08  str     r3, [sp, #0x10]
0009ff0a  str     r1, [sp, #0xc]
0009ff0c  ldr     r3, [sp, #0x10]
0009ff0e  mov     r0, r6
0009ff10  mov     r1, sl
0009ff12  subs    r4, r3, #4
0009ff14  blx     #0xddbfc ; -> objc_msgSend
0009ff18  cmp     fp, r0
0009ff1a  bhs     #0x9ffd6
0009ff1c  ldr     r1, [pc, #0xf8]
0009ff1e  add.w   r0, sp, #0x15
0009ff22  movs    r2, #3
0009ff24  add     r1, pc ; -> 0x000de1f8  ZZ34-[NSData(MBBase64) base64Encoding]E4C.86
0009ff26  blx     #0xddb9c ; -> memcpy
0009ff2a  movs    r5, #0
0009ff2c  mov     r4, r5
0009ff2e  mov     r0, r6
0009ff30  mov     r1, sl
0009ff32  blx     #0xddbfc ; -> objc_msgSend
0009ff36  cmp     r0, fp
0009ff38  bls     #0x9ffd2
0009ff3a  ldr     r1, [sp, #0xc]
0009ff3c  mov     r0, r6
0009ff3e  blx     #0xddbfc ; -> objc_msgSend
0009ff42  add.w   r3, sp, #0x15
0009ff46  ldrb.w  r2, [r0, fp]
0009ff4a  add.w   fp, fp, #1
0009ff4e  strb    r2, [r4, r3]
0009ff50  adds    r3, r5, #1
0009ff52  adds    r4, #1
0009ff54  sxth    r1, r3
0009ff56  cmp     r1, #3
0009ff58  uxth    r5, r3
0009ff5a  bne     #0x9ff2e
0009ff5c  ldrb.w  r2, [sp, #0x15]
0009ff60  ldr.w   ip, [pc, #0xb8]
0009ff64  lsrs    r3, r2, #2
0009ff66  add     ip, pc ; -> 0x000e5e04  ZL13encodingTable
0009ff68  and     r2, r2, #3
0009ff6c  ldrb.w  r3, [ip, r3]
0009ff70  strb.w  r3, [r8]
0009ff74  ldrb.w  r0, [sp, #0x16]
0009ff78  lsrs    r3, r0, #4
0009ff7a  orr.w   r3, r3, r2, lsl #4
0009ff7e  cmp     r1, #1
0009ff80  ldrb.w  r3, [ip, r3]
0009ff84  strb.w  r3, [r8, #1]
0009ff88  ble     #0x9ffca
0009ff8a  ldrb.w  r3, [sp, #0x17]
0009ff8e  and     r2, r0, #0xf
0009ff92  lsrs    r3, r3, #6
0009ff94  orr.w   r3, r3, r2, lsl #2
0009ff98  ldrb.w  r3, [ip, r3]
0009ff9c  strb.w  r3, [r8, #2]
0009ffa0  cmp     r1, #2
0009ffa2  ble     #0x9ffc2
0009ffa4  ldrb.w  r3, [sp, #0x17]
0009ffa8  ldr     r2, [pc, #0x74]
0009ffaa  and     r3, r3, #0x3f
0009ffae  add     r2, pc ; -> 0x000e5e04  ZL13encodingTable
0009ffb0  ldrb    r3, [r2, r3]
0009ffb2  strb.w  r3, [r8, #3]
0009ffb6  ldr     r2, [sp, #0x10]
0009ffb8  add.w   r8, r8, #4
0009ffbc  adds    r2, #4
0009ffbe  str     r2, [sp, #0x10]
0009ffc0  b       #0x9ff0c
0009ffc2  movs    r3, #0x3d
0009ffc4  strb.w  r3, [r8, #3]
0009ffc8  b       #0x9ffb6
0009ffca  movs    r3, #0x3d
0009ffcc  strb.w  r3, [r8, #2]
0009ffd0  b       #0x9ffa0
0009ffd2  sxth    r1, r5
0009ffd4  b       #0x9ff5c
0009ffd6  ldr     r0, [pc, #0x4c]
0009ffd8  ldr     r1, [pc, #0x4c]
0009ffda  add     r0, pc ; -> 0x000fdb5c  
0009ffdc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0009ffde  ldr     r0, [r0]
0009ffe0  ldr     r1, [r1]
0009ffe2  blx     #0xddbfc ; -> objc_msgSend
0009ffe6  ldr     r1, [pc, #0x44]
0009ffe8  movs    r3, #1
0009ffea  ldr     r2, [sp, #8]
0009ffec  add     r1, pc ; -> 0x000fd038  
0009ffee  str     r3, [sp]
0009fff0  str     r3, [sp, #4]
0009fff2  ldr     r1, [r1]
0009fff4  mov     r3, r4
0009fff6  blx     #0xddbfc ; -> objc_msgSend
0009fffa  ldr     r1, [pc, #0x34]
0009fffc  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0009fffe  ldr     r1, [r1]
000a0000  blx     #0xddbfc ; -> objc_msgSend
000a0004  b       #0x9fed0
000a0006  nop     
000a0008  ldm     r3!, {r1, r2, r4, r5, r7}
000a000a  movs    r5, r0
000a000c  b       #0x9f854
000a000e  movs    r5, r1
000a0010  add     r2, sp, #0x2ac
000a0012  add     r2, sp, #0x2a8
000a0014  ldm     r3, {r1, r3, r7}
000a0016  movs    r5, r0
000a0018  b       #0xa05bc
000a001a  movs    r3, r0
000a001c  ldrsh   r2, [r3, r2]
000a001e  movs    r4, r0
000a0020  ldrsh   r2, [r2, r1]
000a0022  movs    r4, r0
000a0024  blt     #0xa0124
000a0026  movs    r5, r0
000a0028  ldm     r1!, {r2, r5, r7}
000a002a  movs    r5, r0
000a002c  beq     #0xa00c0
000a002e  movs    r5, r0
000a0030  ldm     r2!, {r3, r4, r6}
000a0032  movs    r5, r0
