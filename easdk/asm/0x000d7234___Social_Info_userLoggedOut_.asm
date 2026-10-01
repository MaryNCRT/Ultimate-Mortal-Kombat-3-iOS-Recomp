========================================================================
-[Social_Info userLoggedOut]  0x000d7234  212 bytes   Social_Info.mm
========================================================================

000d7234  push    {r4, r5, r6, r7, lr}
000d7236  add     r7, sp, #0xc
000d7238  ldr     r3, [pc, #0x98]
000d723a  mov     r4, r0
000d723c  add     r3, pc ; -> 0x000fb770  OBJC_IVAR_$_Social_Info.renewTokenTimer
000d723e  ldr     r0, [r3]
000d7240  ldr     r0, [r4, r0]
000d7242  cbz     r0, #0xd724e
000d7244  ldr     r1, [pc, #0x90]
000d7246  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000d7248  ldr     r1, [r1]
000d724a  blx     #0xddbfc ; -> objc_msgSend
000d724e  ldr     r3, [pc, #0x8c]
000d7250  movs    r1, #0
000d7252  movs    r0, #0x3a
000d7254  add     r3, pc ; -> 0x000f333c  isLoggingOut
000d7256  ldr     r5, [pc, #0x88]
000d7258  ldr     r2, [r3]
000d725a  movs    r3, #1
000d725c  add     r5, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d725e  movs    r6, #0
000d7260  strb    r3, [r2]
000d7262  mov     r2, r1
000d7264  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d7268  ldr     r0, [pc, #0x78]
000d726a  ldr     r3, [pc, #0x7c]
000d726c  ldr     r1, [pc, #0x7c]
000d726e  add     r0, pc ; -> 0x000f3270  mtxController
000d7270  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d7272  ldr     r0, [r0]
000d7274  ldr     r3, [r3]
000d7276  add     r1, pc ; -> 0x000fd6d4  
000d7278  movs    r2, #0x23
000d727a  ldr     r0, [r0]
000d727c  ldr     r3, [r4, r3]
000d727e  ldr     r1, [r1]
000d7280  blx     #0xddbfc ; -> objc_msgSend
000d7284  ldr     r1, [pc, #0x68]
000d7286  mov     r0, r4
000d7288  movs    r2, #0
000d728a  add     r1, pc ; -> 0x000fd308  
000d728c  ldr     r1, [r1]
000d728e  blx     #0xddbfc ; -> objc_msgSend
000d7292  ldr     r1, [pc, #0x60]
000d7294  mov     r0, r4
000d7296  mov     r2, r5
000d7298  add     r1, pc ; -> 0x000fd7e0  'U\n\x0f'
000d729a  ldr     r1, [r1]
000d729c  blx     #0xddbfc ; -> objc_msgSend
000d72a0  ldr     r1, [pc, #0x54]
000d72a2  mov     r0, r4
000d72a4  mov     r2, r5
000d72a6  add     r1, pc ; -> 0x000fd2f0  
000d72a8  ldr     r1, [r1]
000d72aa  blx     #0xddbfc ; -> objc_msgSend
000d72ae  ldr     r3, [pc, #0x4c]
000d72b0  ldr     r1, [pc, #0x4c]
000d72b2  mov     r0, r4
000d72b4  add     r3, pc ; -> 0x000f3338  isLoggingOut
000d72b6  add     r1, pc ; -> 0x000fd7dc  '_\n\x0f'
000d72b8  ldr     r3, [r3]
000d72ba  mov     r2, r5
000d72bc  ldr     r1, [r1]
000d72be  strb    r6, [r3]
000d72c0  blx     #0xddbfc ; -> objc_msgSend
000d72c4  ldr     r1, [pc, #0x3c]
000d72c6  mov     r0, r4
000d72c8  mov     r2, r6
000d72ca  add     r1, pc ; -> 0x000fd7d8  '>\n\x0f'
000d72cc  ldr     r1, [r1]
000d72ce  blx     #0xddbfc ; -> objc_msgSend
000d72d2  pop     {r4, r5, r6, r7, pc}
000d72d4  cmp     r0, r6
000d72d6  movs    r2, r0
000d72d8  ldrsb   r6, [r4, r5]
000d72da  movs    r2, r0
000d72dc  stm     r0!, {r2, r5, r6, r7}
000d72de  movs    r1, r0
000d72e0  strb    r4, [r2, #2]
000d72e2  movs    r2, r1
000d72e4  itee    al
000d72e6  movs    r1, r0
000d72e8  cmp     r0, r0
000d72ea  movs    r2, r0
000d72ec  str     r2, [r3, #0x44]
000d72ee  movs    r2, r0
000d72f0  str     r2, [r7, #4]
000d72f2  movs    r2, r0
000d72f4  str     r4, [r0, #0x54]
000d72f6  movs    r2, r0
000d72f8  str     r6, [r0, #4]
000d72fa  movs    r2, r0
000d72fc  stm     r0!, {r7}
000d72fe  movs    r1, r0
000d7300  str     r2, [r4, #0x50]
000d7302  movs    r2, r0
000d7304  str     r2, [r1, #0x50]
000d7306  movs    r2, r0
