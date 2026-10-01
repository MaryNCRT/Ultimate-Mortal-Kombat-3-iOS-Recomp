========================================================================
-[FacebookAgent dialog  0x000db670  320 bytes   FacebookAgent.mm
========================================================================

000db670  push    {r4, r5, r6, r7, lr}
000db672  add     r7, sp, #0xc
000db674  str     r8, [sp, #-0x4]!
000db678  ldr     r3, [pc, #0xf4]
000db67a  mov     r4, r0
000db67c  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db67e  ldr     r3, [r3]
000db680  ldr     r3, [r0, r3]
000db682  cmp     r3, #5
000db684  beq     #0xdb6f8
000db686  cmp     r3, #6
000db688  beq     #0xdb690
000db68a  cmp     r3, #4
000db68c  bne     #0xdb736
000db68e  b       #0xdb6be
000db690  ldr     r1, [pc, #0xe0]
000db692  ldr     r5, [pc, #0xe4]
000db694  add     r1, pc ; -> 0x000fd988  
000db696  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db698  ldr     r6, [r1]
000db69a  ldr     r1, [pc, #0xe0]
000db69c  ldr     r3, [r5]
000db69e  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db6a0  mov     r2, r6
000db6a2  ldr     r0, [r0, r3]
000db6a4  ldr     r1, [r1]
000db6a6  blx     #0xddbfc ; -> objc_msgSend
000db6aa  tst.w   r0, #0xff
000db6ae  beq     #0xdb760
000db6b0  ldr     r3, [r5]
000db6b2  mov     r1, r6
000db6b4  movs    r2, #0
000db6b6  ldr     r0, [r4, r3]
000db6b8  blx     #0xddbfc ; -> objc_msgSend
000db6bc  b       #0xdb760
000db6be  ldr     r3, [pc, #0xc0]
000db6c0  ldr     r1, [pc, #0xc0]
000db6c2  ldr     r5, [pc, #0xc4]
000db6c4  add     r3, pc ; -> 0x000fc8c0  OBJC_IVAR_$_FacebookAgent.hasPublishPermission
000db6c6  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000db6c8  ldr     r3, [r3]
000db6ca  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db6cc  ldr     r6, [r1]
000db6ce  ldr     r1, [pc, #0xbc]
000db6d0  mov.w   r8, #0
000db6d4  strb.w  r8, [r0, r3]
000db6d8  ldr     r3, [r5]
000db6da  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db6dc  mov     r2, r6
000db6de  ldr     r1, [r1]
000db6e0  ldr     r0, [r0, r3]
000db6e2  blx     #0xddbfc ; -> objc_msgSend
000db6e6  tst.w   r0, #0xff
000db6ea  beq     #0xdb760
000db6ec  ldr     r3, [r5]
000db6ee  mov     r1, r6
000db6f0  mov     r2, r8
000db6f2  ldr     r0, [r4, r3]
000db6f4  mov     r3, r8
000db6f6  b       #0xdb730
000db6f8  ldr     r3, [pc, #0x94]
000db6fa  ldr     r1, [pc, #0x98]
000db6fc  ldr     r5, [pc, #0x98]
000db6fe  add     r3, pc ; -> 0x000fc8c4  OBJC_IVAR_$_FacebookAgent.hasOfflinePermission
000db700  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000db702  ldr     r3, [r3]
000db704  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db706  ldr     r6, [r1]
000db708  ldr     r1, [pc, #0x90]
000db70a  mov.w   r8, #0
000db70e  strb.w  r8, [r0, r3]
000db712  ldr     r3, [r5]
000db714  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db716  mov     r2, r6
000db718  ldr     r1, [r1]
000db71a  ldr     r0, [r0, r3]
000db71c  blx     #0xddbfc ; -> objc_msgSend
000db720  tst.w   r0, #0xff
000db724  beq     #0xdb760
000db726  ldr     r3, [r5]
000db728  mov     r1, r6
000db72a  mov     r2, r8
000db72c  ldr     r0, [r4, r3]
000db72e  movs    r3, #1
000db730  blx     #0xddbfc ; -> objc_msgSend
000db734  b       #0xdb760
000db736  ldr     r1, [pc, #0x68]
000db738  ldr     r5, [pc, #0x68]
000db73a  add     r1, pc ; -> 0x000fd96c  'M\x0b\x0f'
000db73c  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db73e  ldr     r6, [r1]
000db740  ldr     r1, [pc, #0x64]
000db742  ldr     r3, [r5]
000db744  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db746  mov     r2, r6
000db748  ldr     r0, [r0, r3]
000db74a  ldr     r1, [r1]
000db74c  blx     #0xddbfc ; -> objc_msgSend
000db750  tst.w   r0, #0xff
000db754  beq     #0xdb760
000db756  ldr     r3, [r5]
000db758  mov     r1, r6
000db75a  ldr     r0, [r4, r3]
000db75c  blx     #0xddbfc ; -> objc_msgSend
000db760  ldr     r3, [pc, #0x48]
000db762  movs    r2, #0
000db764  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db766  ldr     r3, [r3]
000db768  str     r2, [r4, r3]
000db76a  ldr     r8, [sp], #4
000db76e  pop     {r4, r5, r6, r7, pc}
000db770  asrs    r0, r1, #9
000db772  movs    r2, r0
000db774  movs    r2, #0xf0
000db776  movs    r2, r0
000db778  asrs    r6, r2, #8
000db77a  movs    r2, r0
000db77c  asrs    r6, r5, #0x17
000db77e  movs    r2, r0
000db780  asrs    r0, r7, #7
000db782  movs    r2, r0
000db784  movs    r2, #0xda
000db786  movs    r2, r0
000db788  asrs    r2, r4, #7
000db78a  movs    r2, r0
000db78c  asrs    r2, r6, #0x16
000db78e  movs    r2, r0
000db790  asrs    r2, r0, #7
000db792  movs    r2, r0
000db794  movs    r2, #0xa0
000db796  movs    r2, r0
000db798  asrs    r0, r5, #6
000db79a  movs    r2, r0
000db79c  asrs    r0, r7, #0x15
000db79e  movs    r2, r0
000db7a0  movs    r2, #0x2e
000db7a2  movs    r2, r0
000db7a4  asrs    r0, r6, #5
000db7a6  movs    r2, r0
000db7a8  asrs    r0, r1, #0x15
000db7aa  movs    r2, r0
000db7ac  asrs    r0, r4, #5
000db7ae  movs    r2, r0
