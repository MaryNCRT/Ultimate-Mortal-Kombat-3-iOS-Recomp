========================================================================
FillFeedItems  0x000b76ac  680 bytes   EAMTX_Main.mm
========================================================================

000b76ac  push    {r4, r5, r6, r7, lr}
000b76ae  add     r7, sp, #0xc
000b76b0  push.w  {r8, sl, fp}
000b76b4  sub     sp, #0x50
000b76b6  str     r1, [sp]
000b76b8  ldr     r1, [pc, #0x218]
000b76ba  ldr     r2, [pc, #0x21c]
000b76bc  mov.w   sl, #0
000b76c0  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b76c2  add     r2, pc ; -> 0x00180114  
000b76c4  ldr     r6, [r1]
000b76c6  mov     r1, r6
000b76c8  blx     #0xddbfc ; -> objc_msgSend
000b76cc  ldr     r1, [pc, #0x20c]
000b76ce  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b76d0  ldr     r1, [r1]
000b76d2  str     r1, [sp, #8]
000b76d4  str     r0, [sp, #4]
000b76d6  ldr     r0, [pc, #0x208]
000b76d8  add     r0, pc ; -> 0x000fdb70  
000b76da  ldr     r0, [r0]
000b76dc  blx     #0xddbfc ; -> objc_msgSend
000b76e0  ldr     r1, [pc, #0x200]
000b76e2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b76e4  ldr     r1, [r1]
000b76e6  str     r1, [sp, #0xc]
000b76e8  blx     #0xddbfc ; -> objc_msgSend
000b76ec  ldr     r1, [pc, #0x1f8]
000b76ee  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000b76f0  ldr     r1, [r1]
000b76f2  blx     #0xddbfc ; -> objc_msgSend
000b76f6  ldr     r1, [pc, #0x1f4]
000b76f8  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b76fa  ldr     r1, [r1]
000b76fc  str     r1, [sp, #0x10]
000b76fe  ldr     r1, [pc, #0x1f0]
000b7700  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b7702  ldr     r1, [r1]
000b7704  str     r1, [sp, #0x14]
000b7706  ldr     r1, [pc, #0x1ec]
000b7708  add     r1, pc ; -> 0x000fd240  
000b770a  ldr     r1, [r1]
000b770c  str     r1, [sp, #0x1c]
000b770e  ldr     r1, [pc, #0x1e8]
000b7710  mov     fp, r0
000b7712  ldr     r0, [pc, #0x1e8]
000b7714  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b7716  ldr.w   r8, [r1]
000b771a  ldr     r1, [pc, #0x1e4]
000b771c  add     r0, pc ; -> 0x000fdcb4  
000b771e  add     r1, pc ; -> 0x000fd23c  
000b7720  ldr     r0, [r0]
000b7722  ldr     r1, [r1]
000b7724  str     r0, [sp, #0x18]
000b7726  str     r1, [sp, #0x20]
000b7728  ldr     r1, [pc, #0x1d8]
000b772a  ldr     r0, [pc, #0x1dc]
000b772c  add     r1, pc ; -> 0x000fd238  
000b772e  add     r0, pc ; -> 0x000fdbb4  
000b7730  ldr     r1, [r1]
000b7732  ldr     r0, [r0]
000b7734  str     r1, [sp, #0x24]
000b7736  ldr     r1, [pc, #0x1d4]
000b7738  str     r0, [sp, #0x34]
000b773a  add     r1, pc ; -> 0x000fd234  
000b773c  ldr     r1, [r1]
000b773e  str     r1, [sp, #0x28]
000b7740  ldr     r1, [pc, #0x1cc]
000b7742  add     r1, pc ; -> 0x000fd230  
000b7744  ldr     r1, [r1]
000b7746  str     r1, [sp, #0x2c]
000b7748  ldr     r1, [pc, #0x1c8]
000b774a  add     r1, pc ; -> 0x000fd228  
000b774c  ldr     r1, [r1]
000b774e  str     r1, [sp, #0x30]
000b7750  ldr     r1, [pc, #0x1c4]
000b7752  add     r1, pc ; -> 0x000fcdb0  'a4\x0e'
000b7754  ldr     r1, [r1]
000b7756  str     r1, [sp, #0x38]
000b7758  ldr     r1, [pc, #0x1c0]
000b775a  add     r1, pc ; -> 0x000fd22c  
000b775c  ldr     r1, [r1]
000b775e  str     r1, [sp, #0x3c]
000b7760  ldr     r1, [pc, #0x1bc]
000b7762  add     r1, pc ; -> 0x000fd224  
000b7764  ldr     r1, [r1]
000b7766  str     r1, [sp, #0x40]
000b7768  ldr     r1, [pc, #0x1b8]
000b776a  add     r1, pc ; -> 0x000fd474  
000b776c  ldr     r1, [r1]
000b776e  str     r1, [sp, #0x44]
000b7770  ldr     r1, [pc, #0x1b4]
000b7772  add     r1, pc ; -> 0x000fd220  
000b7774  ldr     r1, [r1]
000b7776  str     r1, [sp, #0x48]
000b7778  ldr     r1, [pc, #0x1b0]
000b777a  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b777c  ldr     r1, [r1]
000b777e  str     r1, [sp, #0x4c]
000b7780  b       #0xb789e
000b7782  mov     r2, sl
000b7784  ldr     r1, [sp, #0x14]
000b7786  ldr     r0, [sp, #4]
000b7788  blx     #0xddbfc ; -> objc_msgSend
000b778c  ldr     r1, [sp, #8]
000b778e  add.w   sl, sl, #1
000b7792  mov     r5, r0
000b7794  ldr     r0, [sp, #0x18]
000b7796  blx     #0xddbfc ; -> objc_msgSend
000b779a  ldr     r1, [sp, #0xc]
000b779c  blx     #0xddbfc ; -> objc_msgSend
000b77a0  ldr     r2, [pc, #0x18c]
000b77a2  mov     r1, r6
000b77a4  add     r2, pc ; -> 0x00180124  
000b77a6  mov     r4, r0
000b77a8  mov     r0, r5
000b77aa  blx     #0xddbfc ; -> objc_msgSend
000b77ae  mov     r1, r8
000b77b0  blx     #0xddbfc ; -> objc_msgSend
000b77b4  ldr     r1, [sp, #0x1c]
000b77b6  mov     r2, r0
000b77b8  mov     r0, r4
000b77ba  blx     #0xddbfc ; -> objc_msgSend
000b77be  ldr     r2, [pc, #0x174]
000b77c0  mov     r1, r6
000b77c2  mov     r0, r5
000b77c4  add     r2, pc ; -> 0x00180134  
000b77c6  blx     #0xddbfc ; -> objc_msgSend
000b77ca  mov     r1, r8
000b77cc  blx     #0xddbfc ; -> objc_msgSend
000b77d0  ldr     r1, [sp, #0x20]
000b77d2  mov     r2, r0
000b77d4  mov     r0, r4
000b77d6  blx     #0xddbfc ; -> objc_msgSend
000b77da  ldr     r2, [pc, #0x15c]
000b77dc  mov     r1, r6
000b77de  mov     r0, r5
000b77e0  add     r2, pc ; -> 0x00180144  
000b77e2  blx     #0xddbfc ; -> objc_msgSend
000b77e6  mov     r1, r8
000b77e8  blx     #0xddbfc ; -> objc_msgSend
000b77ec  ldr     r1, [sp, #0x24]
000b77ee  mov     r2, r0
000b77f0  mov     r0, r4
000b77f2  blx     #0xddbfc ; -> objc_msgSend
000b77f6  ldr     r2, [pc, #0x144]
000b77f8  mov     r1, r6
000b77fa  mov     r0, r5
000b77fc  add     r2, pc ; -> 0x00180154  
000b77fe  blx     #0xddbfc ; -> objc_msgSend
000b7802  ldr     r1, [sp, #0x28]
000b7804  mov     r2, r0
000b7806  mov     r0, r4
000b7808  blx     #0xddbfc ; -> objc_msgSend
000b780c  ldr     r2, [pc, #0x130]
000b780e  mov     r1, r6
000b7810  mov     r0, r5
000b7812  add     r2, pc ; -> 0x00180164  
000b7814  blx     #0xddbfc ; -> objc_msgSend
000b7818  ldr     r1, [sp, #0x2c]
000b781a  mov     r2, r0
000b781c  mov     r0, r4
000b781e  blx     #0xddbfc ; -> objc_msgSend
000b7822  ldr     r2, [pc, #0x120]
000b7824  mov     r1, r6
000b7826  mov     r0, r5
000b7828  add     r2, pc ; -> 0x00180174  
000b782a  blx     #0xddbfc ; -> objc_msgSend
000b782e  ldr     r1, [sp, #0x3c]
000b7830  blx     #0xddbfc ; -> objc_msgSend
000b7834  ldr     r1, [sp, #0x38]
000b7836  vmov    s12, r0
000b783a  vcvt.f64.s32 d7, s12
000b783e  ldr     r0, [sp, #0x34]
000b7840  vmov    r2, r3, d7
000b7844  blx     #0xddbfc ; -> objc_msgSend
000b7848  ldr     r1, [sp, #0x30]
000b784a  mov     r2, r0
000b784c  mov     r0, r4
000b784e  blx     #0xddbfc ; -> objc_msgSend
000b7852  ldr     r2, [pc, #0xf4]
000b7854  mov     r1, r6
000b7856  mov     r0, r5
000b7858  add     r2, pc ; -> 0x00180184  
000b785a  blx     #0xddbfc ; -> objc_msgSend
000b785e  ldr     r1, [sp, #0x40]
000b7860  mov     r2, r0
000b7862  mov     r0, r4
000b7864  blx     #0xddbfc ; -> objc_msgSend
000b7868  ldr     r2, [pc, #0xe0]
000b786a  mov     r1, r6
000b786c  mov     r0, r5
000b786e  add     r2, pc ; -> 0x0017fe44  
000b7870  blx     #0xddbfc ; -> objc_msgSend
000b7874  ldr     r1, [sp, #0x44]
000b7876  mov     r2, r0
000b7878  mov     r0, r4
000b787a  blx     #0xddbfc ; -> objc_msgSend
000b787e  ldr     r2, [pc, #0xd0]
000b7880  mov     r1, r6
000b7882  mov     r0, r5
000b7884  add     r2, pc ; -> 0x00180194  
000b7886  blx     #0xddbfc ; -> objc_msgSend
000b788a  ldr     r1, [sp, #0x48]
000b788c  mov     r2, r0
000b788e  mov     r0, r4
000b7890  blx     #0xddbfc ; -> objc_msgSend
000b7894  mov     r0, fp
000b7896  ldr     r1, [sp, #0x4c]
000b7898  mov     r2, r4
000b789a  blx     #0xddbfc ; -> objc_msgSend
000b789e  ldr     r0, [sp, #4]
000b78a0  ldr     r1, [sp, #0x10]
000b78a2  blx     #0xddbfc ; -> objc_msgSend
000b78a6  cmp     r0, sl
000b78a8  bhi.w   #0xb7782
000b78ac  mov     r0, fp
000b78ae  ldr     r1, [sp, #0x10]
000b78b0  blx     #0xddbfc ; -> objc_msgSend
000b78b4  mov     r2, r0
000b78b6  cbz     r0, #0xb78c0
000b78b8  ldr     r1, [sp]
000b78ba  movs    r0, #0x2e
000b78bc  mov     r2, fp
000b78be  b       #0xb78c4
000b78c0  ldr     r1, [sp]
000b78c2  movs    r0, #0x30
000b78c4  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000b78c8  sub.w   sp, r7, #0x18
000b78cc  pop.w   {r8, sl, fp}
000b78d0  pop     {r4, r5, r6, r7, pc}
000b78d2  nop     
000b78d4  strb    r4, [r5, r0]
000b78d6  movs    r4, r0
000b78d8  ldrh    r6, [r1, #0x12]
000b78da  movs    r4, r1
000b78dc  strh    r2, [r6, r2]
000b78de  movs    r4, r0
000b78e0  str     r4, [r2, #0x48]
000b78e2  movs    r4, r0
000b78e4  strh    r2, [r3, r2]
000b78e6  movs    r4, r0
000b78e8  strh    r6, [r4, r5]
000b78ea  movs    r4, r0
000b78ec  strh    r4, [r0, r6]
000b78ee  movs    r4, r0
000b78f0  strh    r0, [r7, r5]
000b78f2  movs    r4, r0
000b78f4  ldrh    r4, [r6, r4]
000b78f6  movs    r4, r0
000b78f8  strh    r0, [r2, r7]
000b78fa  movs    r4, r0
000b78fc  str     r4, [r2, #0x58]
000b78fe  movs    r4, r0
000b7900  ldrh    r2, [r3, r4]
000b7902  movs    r4, r0
000b7904  ldrh    r0, [r1, r4]
000b7906  movs    r4, r0
000b7908  str     r2, [r0, #0x48]
000b790a  movs    r4, r0
000b790c  ldrh    r6, [r6, r3]
000b790e  movs    r4, r0
000b7910  ldrh    r2, [r5, r3]
000b7912  movs    r4, r0
000b7914  ldrh    r2, [r3, r3]
000b7916  movs    r4, r0
000b7918  ldrsb   r2, [r3, r1]
000b791a  movs    r4, r0
000b791c  ldrh    r6, [r1, r3]
000b791e  movs    r4, r0
000b7920  ldrh    r6, [r7, r2]
000b7922  movs    r4, r0
000b7924  ldrb    r6, [r0, r4]
000b7926  movs    r4, r0
000b7928  ldrh    r2, [r5, r2]
000b792a  movs    r4, r0
000b792c  strh    r6, [r0, r4]
000b792e  movs    r4, r0
000b7930  ldrh    r4, [r7, #0xa]
000b7932  movs    r4, r1
000b7934  ldrh    r4, [r5, #0xa]
000b7936  movs    r4, r1
000b7938  ldrh    r0, [r4, #0xa]
000b793a  movs    r4, r1
000b793c  ldrh    r4, [r2, #0xa]
000b793e  movs    r4, r1
000b7940  ldrh    r6, [r1, #0xa]
000b7942  movs    r4, r1
000b7944  ldrh    r0, [r1, #0xa]
000b7946  movs    r4, r1
000b7948  ldrh    r0, [r5, #8]
000b794a  movs    r4, r1
000b794c  strh    r2, [r2, #0x2e]
000b794e  movs    r4, r1
000b7950  ldrh    r4, [r1, #8]
000b7952  movs    r4, r1
