========================================================================
-[Facebook fbDialogNotLogin  0x000da528  76 bytes   Facebook.m
========================================================================

000da528  push    {r4, r5, r6, r7, lr}
000da52a  add     r7, sp, #0xc
000da52c  ldr     r1, [pc, #0x34]
000da52e  sxtb    r6, r2
000da530  mov     r5, r0
000da532  add     r1, pc ; -> 0x000fdac4  
000da534  ldr     r1, [r1]
000da536  blx     #0xddbfc ; -> objc_msgSend
000da53a  ldr     r1, [pc, #0x2c]
000da53c  add     r1, pc ; -> 0x000fdaa8  '4\x1b\x0f'
000da53e  ldr     r4, [r1]
000da540  ldr     r1, [pc, #0x28]
000da542  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000da544  mov     r2, r4
000da546  ldr     r1, [r1]
000da548  blx     #0xddbfc ; -> objc_msgSend
000da54c  tst.w   r0, #0xff
000da550  beq     #0xda562
000da552  ldr     r3, [pc, #0x1c]
000da554  mov     r1, r4
000da556  mov     r2, r6
000da558  add     r3, pc ; -> 0x000fc50c  OBJC_IVAR_$_Facebook._sessionDelegate
000da55a  ldr     r0, [r3]
000da55c  ldr     r0, [r5, r0]
000da55e  blx     #0xddbfc ; -> objc_msgSend
000da562  pop     {r4, r5, r6, r7, pc}
000da564  adds    r5, #0x8e
000da566  movs    r2, r0
000da568  adds    r5, #0x68
000da56a  movs    r2, r0
000da56c  movs    r7, #0x4a
000da56e  movs    r2, r0
000da570  subs    r0, r6, #6
000da572  movs    r2, r0
