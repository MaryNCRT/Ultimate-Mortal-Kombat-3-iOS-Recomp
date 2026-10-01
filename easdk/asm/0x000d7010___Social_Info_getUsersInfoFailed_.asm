========================================================================
-[Social_Info getUsersInfoFailed]  0x000d7010  304 bytes   Social_Info.mm
========================================================================

000d7010  push    {r4, r5, r6, r7, lr}
000d7012  add     r7, sp, #0xc
000d7014  str     r8, [sp, #-0x4]!
000d7018  ldr     r1, [pc, #0xd0]
000d701a  mov     r8, r0
000d701c  ldr     r0, [pc, #0xd0]
000d701e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d7020  ldr     r6, [pc, #0xd0]
000d7022  add     r0, pc ; -> 0x000fdbf4  
000d7024  ldr     r1, [r1]
000d7026  ldr     r0, [r0]
000d7028  blx     #0xddbfc ; -> objc_msgSend
000d702c  ldr     r1, [pc, #0xc8]
000d702e  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d7030  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d7032  ldr     r1, [r1]
000d7034  blx     #0xddbfc ; -> objc_msgSend
000d7038  ldr     r1, [pc, #0xc0]
000d703a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d703c  ldr     r1, [r1]
000d703e  blx     #0xddbfc ; -> objc_msgSend
000d7042  ldr     r1, [pc, #0xbc]
000d7044  ldr     r2, [pc, #0xbc]
000d7046  ldr     r3, [pc, #0xc0]
000d7048  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000d704a  add     r2, pc ; -> 0x001804a4  
000d704c  ldr     r5, [r1]
000d704e  add     r3, pc ; -> 0x001801e4  
000d7050  mov     r1, r5
000d7052  mov     r4, r0
000d7054  blx     #0xddbfc ; -> objc_msgSend
000d7058  ldr     r3, [pc, #0xb0]
000d705a  mov     r0, r4
000d705c  mov     r1, r5
000d705e  add     r3, pc ; -> 0x001801f4  
000d7060  mov     r2, r6
000d7062  blx     #0xddbfc ; -> objc_msgSend
000d7066  ldr     r0, [pc, #0xa8]
000d7068  ldr     r1, [pc, #0xa8]
000d706a  ldr     r2, [pc, #0xac]
000d706c  add     r0, pc ; -> 0x000fdb5c  
000d706e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d7070  add     r2, pc ; -> 0x0017e5c4  
000d7072  ldr     r1, [r1]
000d7074  ldr     r3, [pc, #0xa4]
000d7076  ldr     r0, [r0]
000d7078  blx     #0xddbfc ; -> objc_msgSend
000d707c  ldr     r3, [pc, #0xa0]
000d707e  mov     r1, r5
000d7080  add     r3, pc ; -> 0x00180204  
000d7082  mov     r2, r0
000d7084  mov     r0, r4
000d7086  blx     #0xddbfc ; -> objc_msgSend
000d708a  ldr     r3, [pc, #0x98]
000d708c  mov     r0, r4
000d708e  mov     r1, r5
000d7090  add     r3, pc ; -> 0x00180214  
000d7092  mov     r2, r6
000d7094  blx     #0xddbfc ; -> objc_msgSend
000d7098  ldr     r3, [pc, #0x8c]
000d709a  mov     r0, r4
000d709c  mov     r1, r5
000d709e  add     r3, pc ; -> 0x00180224  
000d70a0  mov     r2, r6
000d70a2  blx     #0xddbfc ; -> objc_msgSend
000d70a6  ldr     r3, [pc, #0x84]
000d70a8  add     r3, pc ; -> 0x000f3340  gettingChallenges
000d70aa  ldr     r3, [r3]
000d70ac  ldrsb.w r3, [r3]
000d70b0  cbz     r3, #0xd70c0
000d70b2  ldr     r3, [pc, #0x7c]
000d70b4  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d70b6  ldr     r0, [r3]
000d70b8  ldr.w   r1, [r8, r0]
000d70bc  movs    r0, #0x51
000d70be  b       #0xd70cc
000d70c0  ldr     r3, [pc, #0x70]
000d70c2  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d70c4  ldr     r0, [r3]
000d70c6  ldr.w   r1, [r8, r0]
000d70ca  movs    r0, #0x45
000d70cc  mov     r2, r4
000d70ce  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d70d2  ldr     r0, [pc, #0x64]
000d70d4  ldr     r1, [pc, #0x64]
000d70d6  movs    r2, #0
000d70d8  add     r0, pc ; -> 0x000f3270  mtxController
000d70da  add     r1, pc ; -> 0x000fd4b8  
000d70dc  ldr     r0, [r0]
000d70de  ldr     r1, [r1]
000d70e0  ldr     r0, [r0]
000d70e2  blx     #0xddbfc ; -> objc_msgSend
000d70e6  ldr     r8, [sp], #4
000d70ea  pop     {r4, r5, r6, r7, pc}
000d70ec  ldr     r2, [r4, r5]
000d70ee  movs    r2, r0
000d70f0  ldr     r6, [r1, #0x3c]
000d70f2  movs    r2, r0
000d70f4  strb    r2, [r0, #0xb]
000d70f6  movs    r2, r1
000d70f8  ldr     r4, [r1, r5]
000d70fa  movs    r2, r0
000d70fc  ldrh    r2, [r3, r0]
000d70fe  movs    r2, r0
000d7100  ldrh    r4, [r1, r2]
000d7102  movs    r2, r0
000d7104  str     r4, [sp, #0x158]
000d7106  movs    r2, r1
000d7108  str     r1, [sp, #0x248]
000d710a  movs    r2, r1
000d710c  str     r1, [sp, #0x248]
000d710e  movs    r2, r1
000d7110  ldr     r4, [r5, #0x2c]
000d7112  movs    r2, r0
000d7114  ldrh    r6, [r5, r0]
000d7116  movs    r2, r0
000d7118  strb    r0, [r2, #0x15]
000d711a  movs    r2, r1
