========================================================================
-[EAMTX_TransObserver completeTransaction  0x000c78e0  76 bytes   EAMTX_TransObserver.mm
========================================================================

000c78e0  push    {r4, r7, lr}
000c78e2  add     r7, sp, #4
000c78e4  ldr     r3, [pc, #0x30]
000c78e6  mov     r4, r2
000c78e8  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c78ea  ldr     r3, [r3]
000c78ec  ldrb    r3, [r3]
000c78ee  cbnz    r3, #0xc7916
000c78f0  ldr     r1, [pc, #0x28]
000c78f2  add     r1, pc ; -> 0x000fd730  '\x0b\x01\x0f'
000c78f4  ldr     r1, [r1]
000c78f6  blx     #0xddbfc ; -> objc_msgSend
000c78fa  ldr     r0, [pc, #0x24]
000c78fc  ldr     r1, [pc, #0x24]
000c78fe  add     r0, pc ; -> 0x000fdc6c  
000c7900  add     r1, pc ; -> 0x000fd644  
000c7902  ldr     r0, [r0]
000c7904  ldr     r1, [r1]
000c7906  blx     #0xddbfc ; -> objc_msgSend
000c790a  ldr     r1, [pc, #0x1c]
000c790c  mov     r2, r4
000c790e  add     r1, pc ; -> 0x000fd72c  
000c7910  ldr     r1, [r1]
000c7912  blx     #0xddbfc ; -> objc_msgSend
000c7916  pop     {r4, r7, pc}
000c7918  cbnz    r4, #0xc7940
000c791a  movs    r2, r0
000c791c  ldrsh   r2, [r7, r0]
000c791e  movs    r3, r0
000c7920  str     r2, [r5, #0x34]
000c7922  movs    r3, r0
000c7924  ldrb    r0, [r0, r5]
000c7926  movs    r3, r0
000c7928  ldrsh   r2, [r3, r0]
000c792a  movs    r3, r0
