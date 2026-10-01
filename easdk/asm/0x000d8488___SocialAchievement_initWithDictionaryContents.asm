========================================================================
-[SocialAchievement initWithDictionaryContents  0x000d8488  236 bytes   SocialAchievement.m
========================================================================

000d8488  push    {r4, r5, r6, r7, lr}
000d848a  add     r7, sp, #0xc
000d848c  sub     sp, #8
000d848e  ldr     r3, [pc, #0xac]
000d8490  ldr     r1, [pc, #0xac]
000d8492  str     r0, [sp]
000d8494  add     r3, pc ; -> 0x000fddec  
000d8496  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d8498  ldr     r3, [r3]
000d849a  ldr     r1, [r1]
000d849c  mov     r0, sp
000d849e  mov     r6, r2
000d84a0  str     r3, [sp, #4]
000d84a2  blx     #0xddc08 ; -> objc_msgSendSuper2
000d84a6  mov     r4, r0
000d84a8  cmp     r0, #0
000d84aa  beq     #0xd8534
000d84ac  ldr     r1, [pc, #0x94]
000d84ae  ldr     r2, [pc, #0x98]
000d84b0  mov     r0, r6
000d84b2  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d84b4  add     r2, pc ; -> 0x00181fe4  
000d84b6  ldr     r5, [r1]
000d84b8  mov     r1, r5
000d84ba  blx     #0xddbfc ; -> objc_msgSend
000d84be  ldr     r1, [pc, #0x8c]
000d84c0  add     r1, pc ; -> 0x000fd324  
000d84c2  ldr     r1, [r1]
000d84c4  mov     r2, r0
000d84c6  mov     r0, r4
000d84c8  blx     #0xddbfc ; -> objc_msgSend
000d84cc  ldr     r2, [pc, #0x80]
000d84ce  mov     r1, r5
000d84d0  mov     r0, r6
000d84d2  add     r2, pc ; -> 0x00181ff4  
000d84d4  blx     #0xddbfc ; -> objc_msgSend
000d84d8  ldr     r1, [pc, #0x78]
000d84da  add     r1, pc ; -> 0x000fd884  
000d84dc  ldr     r1, [r1]
000d84de  mov     r2, r0
000d84e0  mov     r0, r4
000d84e2  blx     #0xddbfc ; -> objc_msgSend
000d84e6  ldr     r2, [pc, #0x70]
000d84e8  mov     r1, r5
000d84ea  mov     r0, r6
000d84ec  add     r2, pc ; -> 0x00182004  
000d84ee  blx     #0xddbfc ; -> objc_msgSend
000d84f2  ldr     r1, [pc, #0x68]
000d84f4  add     r1, pc ; -> 0x000fd880  
000d84f6  ldr     r1, [r1]
000d84f8  mov     r2, r0
000d84fa  mov     r0, r4
000d84fc  blx     #0xddbfc ; -> objc_msgSend
000d8500  ldr     r3, [pc, #0x5c]
000d8502  ldr     r1, [pc, #0x60]
000d8504  movs    r2, #0x12
000d8506  add     r3, pc ; -> 0x000fb93c  OBJC_IVAR_$_SocialAchievement.achievementTypeURI
000d8508  add     r1, pc ; -> 0x000fcdc4  
000d850a  ldr     r3, [r3]
000d850c  ldr     r1, [r1]
000d850e  ldr     r0, [r4, r3]
000d8510  blx     #0xddbfc ; -> objc_msgSend
000d8514  ldr     r1, [pc, #0x50]
000d8516  add     r1, pc ; -> 0x000fd87c  
000d8518  ldr     r1, [r1]
000d851a  mov     r2, r0
000d851c  mov     r0, r4
000d851e  blx     #0xddbfc ; -> objc_msgSend
000d8522  ldr     r3, [pc, #0x48]
000d8524  movs    r2, #0
000d8526  add     r3, pc ; -> 0x000fb948  OBJC_IVAR_$_SocialAchievement.count
000d8528  ldr     r3, [r3]
000d852a  str     r2, [r4, r3]
000d852c  ldr     r3, [pc, #0x40]
000d852e  add     r3, pc ; -> 0x000fb94c  OBJC_IVAR_$_SocialAchievement.userHasAchievement
000d8530  ldr     r3, [r3]
000d8532  strb    r2, [r4, r3]
000d8534  mov     r0, r4
000d8536  sub.w   sp, r7, #0xc
000d853a  pop     {r4, r5, r6, r7, pc}
000d853c  ldr     r4, [r2, r5]
000d853e  movs    r2, r0
000d8540  add     lr, ip
000d8542  movs    r2, r0
000d8544  mov     r6, r3
000d8546  movs    r2, r0
000d8548  ldr     r3, [sp, #0xb0]
000d854a  movs    r2, r1
000d854c  ldr     r6, [pc, #0x180]
000d854e  movs    r2, r0
000d8550  ldr     r3, [sp, #0x78]
000d8552  movs    r2, r1
000d8554  strh    r6, [r4, r6]
000d8556  movs    r2, r0
000d8558  ldr     r3, [sp, #0x50]
000d855a  movs    r2, r1
000d855c  strh    r0, [r1, r6]
000d855e  movs    r2, r0
000d8560  adds    r4, #0x32
000d8562  movs    r2, r0
000d8564  ldr     r0, [pc, #0x2e0]
000d8566  movs    r2, r0
000d8568  strh    r2, [r4, r5]
000d856a  movs    r2, r0
000d856c  adds    r4, #0x1e
000d856e  movs    r2, r0
000d8570  adds    r4, #0x1a
000d8572  movs    r2, r0
