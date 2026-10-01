========================================================================
-[FBDialog dismissWithSuccess  0x000829bc  132 bytes   FBDialog.m
========================================================================

000829bc  push    {r4, r5, r6, r7, lr}
000829be  add     r7, sp, #0xc
000829c0  str     r8, [sp, #-0x4]!
000829c4  tst.w   r2, #0xff
000829c8  mov     r4, r0
000829ca  sxtb.w  r8, r3
000829ce  beq     #0x82a10
000829d0  ldr     r5, [pc, #0x50]
000829d2  ldr     r1, [pc, #0x54]
000829d4  add     r5, pc ; -> 0x000f51bc  OBJC_IVAR_$_FBDialog._delegate
000829d6  add     r1, pc ; -> 0x000fcc68  'L6\x0e'
000829d8  ldr     r3, [r5]
000829da  ldr     r6, [r1]
000829dc  ldr     r1, [pc, #0x4c]
000829de  ldr     r0, [r0, r3]
000829e0  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000829e2  ldr     r1, [r1]
000829e4  mov     r2, r6
000829e6  blx     #0xddbfc ; -> objc_msgSend
000829ea  tst.w   r0, #0xff
000829ee  beq     #0x829fc
000829f0  ldr     r3, [r5]
000829f2  mov     r1, r6
000829f4  mov     r2, r4
000829f6  ldr     r0, [r4, r3]
000829f8  blx     #0xddbfc ; -> objc_msgSend
000829fc  ldr     r1, [pc, #0x30]
000829fe  mov     r0, r4
00082a00  mov     r2, r8
00082a02  add     r1, pc ; -> 0x000fcbfc  ',(\x0e'
00082a04  ldr     r1, [r1]
00082a06  blx     #0xddbfc ; -> objc_msgSend
00082a0a  ldr     r8, [sp], #4
00082a0e  pop     {r4, r5, r6, r7, pc}
00082a10  ldr     r5, [pc, #0x20]
00082a12  ldr     r1, [pc, #0x24]
00082a14  add     r5, pc ; -> 0x000f51bc  OBJC_IVAR_$_FBDialog._delegate
00082a16  add     r1, pc ; -> 0x000fcc00  '5+\x0e'
00082a18  ldr     r3, [r5]
00082a1a  ldr     r6, [r1]
00082a1c  ldr     r1, [pc, #0x1c]
00082a1e  ldr     r0, [r0, r3]
00082a20  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00082a22  b       #0x829e2
00082a24  movs    r7, #0xe4
00082a26  movs    r7, r0
00082a28  adr     r2, #0x238
00082a2a  movs    r7, r0
00082a2c  adr     r2, #0x2b0
00082a2e  movs    r7, r0
00082a30  adr     r1, #0x3d8
00082a32  movs    r7, r0
00082a34  movs    r7, #0xa4
00082a36  movs    r7, r0
00082a38  adr     r1, #0x398
00082a3a  movs    r7, r0
00082a3c  adr     r2, #0x1b0
00082a3e  movs    r7, r0
