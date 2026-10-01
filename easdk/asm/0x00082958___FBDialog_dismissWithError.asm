========================================================================
-[FBDialog dismissWithError  0x00082958  100 bytes   FBDialog.m
========================================================================

00082958  push    {r4, r5, r6, r7, lr}
0008295a  add     r7, sp, #0xc
0008295c  push.w  {r8, sl}
00082960  ldr     r1, [pc, #0x48]
00082962  ldr     r5, [pc, #0x4c]
00082964  sxtb.w  r8, r3
00082968  add     r1, pc ; -> 0x000fcbf8  '\x1c+\x0e'
0008296a  add     r5, pc ; -> 0x000f51bc  OBJC_IVAR_$_FBDialog._delegate
0008296c  ldr     r6, [r1]
0008296e  ldr     r1, [pc, #0x44]
00082970  ldr     r3, [r5]
00082972  mov     r4, r0
00082974  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00082976  mov     sl, r2
00082978  ldr     r0, [r0, r3]
0008297a  ldr     r1, [r1]
0008297c  mov     r2, r6
0008297e  blx     #0xddbfc ; -> objc_msgSend
00082982  tst.w   r0, #0xff
00082986  beq     #0x82996
00082988  ldr     r3, [r5]
0008298a  mov     r1, r6
0008298c  mov     r2, r4
0008298e  ldr     r0, [r4, r3]
00082990  mov     r3, sl
00082992  blx     #0xddbfc ; -> objc_msgSend
00082996  ldr     r1, [pc, #0x20]
00082998  mov     r0, r4
0008299a  mov     r2, r8
0008299c  add     r1, pc ; -> 0x000fcbfc  ',(\x0e'
0008299e  ldr     r1, [r1]
000829a0  blx     #0xddbfc ; -> objc_msgSend
000829a4  pop.w   {r8, sl}
000829a8  pop     {r4, r5, r6, r7, pc}
000829aa  nop     
000829ac  adr     r2, #0x230
000829ae  movs    r7, r0
000829b0  cmp     r0, #0x4e
000829b2  movs    r7, r0
000829b4  adr     r3, #0x60
000829b6  movs    r7, r0
000829b8  adr     r2, #0x170
000829ba  movs    r7, r0
