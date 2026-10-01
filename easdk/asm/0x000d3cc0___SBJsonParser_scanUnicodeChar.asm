========================================================================
-[SBJsonParser scanUnicodeChar  0x000d3cc0  276 bytes   SBJsonParser.mm
========================================================================

000d3cc0  push    {r4, r5, r6, r7, lr}
000d3cc2  add     r7, sp, #0xc
000d3cc4  str     r8, [sp, #-0x4]!
000d3cc8  sub     sp, #4
000d3cca  ldr     r1, [pc, #0xe0]
000d3ccc  mov     r8, r2
000d3cce  add.w   r2, sp, #2
000d3cd2  add     r1, pc ; -> 0x000fd938  
000d3cd4  mov     r5, r0
000d3cd6  ldr     r6, [r1]
000d3cd8  mov     r1, r6
000d3cda  blx     #0xddbfc ; -> objc_msgSend
000d3cde  uxtb    r4, r0
000d3ce0  cbnz    r4, #0xd3cfa
000d3ce2  ldr     r1, [pc, #0xcc]
000d3ce4  ldr.w   r3, [pc, #0xcc]
000d3ce8  mov     r0, r5
000d3cea  add     r1, pc ; -> 0x000fd91c  
000d3cec  add     r3, pc ; -> 0x00182354  
000d3cee  ldr     r1, [r1]
000d3cf0  movs    r2, #6
000d3cf2  blx     #0xddbfc ; -> objc_msgSend
000d3cf6  mov     r0, r4
000d3cf8  b       #0xd3da2
000d3cfa  ldrh.w  r3, [sp, #2]
000d3cfe  cmp.w   r3, #0xd800
000d3d02  blo     #0xd3d82
000d3d04  cmp.w   r3, #0xdc00
000d3d08  bhs     #0xd3d64
000d3d0a  ldr     r1, [pc, #0xac]
000d3d0c  add     r1, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d3d0e  ldr     r0, [r1]
000d3d10  ldr     r2, [r5, r0]
000d3d12  ldrsb.w r3, [r2]
000d3d16  cmp     r3, #0x5c
000d3d18  bne     #0xd3d42
000d3d1a  adds    r3, r2, #1
000d3d1c  str     r3, [r5, r0]
000d3d1e  cbz     r3, #0xd3d42
000d3d20  ldr     r1, [r1]
000d3d22  ldr     r2, [r5, r1]
000d3d24  ldrsb.w r3, [r2]
000d3d28  cmp     r3, #0x75
000d3d2a  bne     #0xd3d42
000d3d2c  adds    r3, r2, #1
000d3d2e  str     r3, [r5, r1]
000d3d30  cbz     r3, #0xd3d42
000d3d32  mov     r0, r5
000d3d34  mov     r1, r6
000d3d36  mov     r2, sp
000d3d38  blx     #0xddbfc ; -> objc_msgSend
000d3d3c  tst.w   r0, #0xff
000d3d40  bne     #0xd3d8e
000d3d42  ldr     r3, [pc, #0x78]
000d3d44  ldr     r1, [pc, #0x78]
000d3d46  add     r3, pc ; -> 0x00182364  
000d3d48  add     r1, pc ; -> 0x000fd91c  
000d3d4a  b       #0xd3d74
000d3d4c  ldr     r3, [pc, #0x74]
000d3d4e  ldr     r1, [pc, #0x78]
000d3d50  add     r3, pc ; -> 0x00182374  
000d3d52  add     r1, pc ; -> 0x000fd91c  
000d3d54  b       #0xd3d74
000d3d56  ldrh.w  r3, [sp, #2]
000d3d5a  lsls    r3, r3, #0xa
000d3d5c  add     r3, r1
000d3d5e  strh.w  r3, [sp, #2]
000d3d62  b       #0xd3d82
000d3d64  cmp.w   r3, #0xe000
000d3d68  bhs     #0xd3d82
000d3d6a  ldr     r3, [pc, #0x60]
000d3d6c  ldr.w   r1, [pc, #0x60]
000d3d70  add     r3, pc ; -> 0x00182384  
000d3d72  add     r1, pc ; -> 0x000fd91c  
000d3d74  mov     r0, r5
000d3d76  ldr     r1, [r1]
000d3d78  movs    r2, #6
000d3d7a  blx     #0xddbfc ; -> objc_msgSend
000d3d7e  movs    r0, #0
000d3d80  b       #0xd3da2
000d3d82  ldrh.w  r3, [sp, #2]
000d3d86  movs    r0, #1
000d3d88  strh.w  r3, [r8]
000d3d8c  b       #0xd3da2
000d3d8e  ldrh.w  r3, [sp]
000d3d92  add.w   r1, r3, #0x2400
000d3d96  movw    r3, #0x3fe
000d3d9a  uxth    r2, r1
000d3d9c  cmp     r2, r3
000d3d9e  bls     #0xd3d56
000d3da0  b       #0xd3d4c
000d3da2  sub.w   sp, r7, #0x10
000d3da6  ldr     r8, [sp], #4
000d3daa  pop     {r4, r5, r6, r7, pc}
000d3dac  ldr     r4, [sp, #0x188]
000d3dae  movs    r2, r0
000d3db0  ldr     r4, [sp, #0xb8]
000d3db2  movs    r2, r0
000d3db4  b       #0xd3a80
000d3db6  movs    r2, r1
000d3db8  ldr     r0, [r6, #0x60]
000d3dba  movs    r2, r0
000d3dbc  b       #0xd39f4
000d3dbe  movs    r2, r1
000d3dc0  ldr     r3, [sp, #0x340]
000d3dc2  movs    r2, r0
000d3dc4  b       #0xd3a08
000d3dc6  movs    r2, r1
000d3dc8  ldr     r3, [sp, #0x318]
000d3dca  movs    r2, r0
000d3dcc  b       #0xd39f0
000d3dce  movs    r2, r1
000d3dd0  ldr     r3, [sp, #0x298]
000d3dd2  movs    r2, r0
