========================================================================
-[Social_Info getUsersInfoFinished  0x000d740c  2740 bytes   Social_Info.mm
========================================================================

000d740c  push    {r4, r5, r6, r7, lr}
000d740e  add     r7, sp, #0xc
000d7410  push.w  {r8, sl, fp}
000d7414  sub.w   sp, sp, #0x26c
000d7418  ldr.w   r1, [pc, #0x920]
000d741c  str     r0, [sp, #0x20]
000d741e  ldr.w   r0, [pc, #0x920]
000d7422  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d7424  str     r2, [sp, #0x1c]
000d7426  ldr     r1, [r1]
000d7428  add     r0, pc ; -> 0x000fdb5c  
000d742a  ldr.w   r4, [pc, #0x918]
000d742e  ldr     r0, [r0]
000d7430  str     r1, [sp, #0x28]
000d7432  ldr.w   r1, [pc, #0x914]
000d7436  add     r4, pc ; -> 0x00181d24  
000d7438  str     r0, [sp, #0x24]
000d743a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d743c  mov     r0, r2
000d743e  ldr     r1, [r1]
000d7440  str     r1, [sp, #0x2c]
000d7442  blx     #0xddbfc ; -> objc_msgSend
000d7446  mov     r2, r4
000d7448  ldr     r1, [sp, #0x28]
000d744a  mov     r3, r0
000d744c  ldr     r0, [sp, #0x24]
000d744e  blx     #0xddbfc ; -> objc_msgSend
000d7452  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d7456  ldr.w   r3, [pc, #0x8f4]
000d745a  add     r3, pc ; -> 0x000f3340  gettingChallenges
000d745c  ldr     r3, [r3]
000d745e  ldrsb.w r4, [r3]
000d7462  cmp     r4, #0
000d7464  beq.w   #0xd7a4c
000d7468  ldr.w   r0, [pc, #0x8e4]
000d746c  ldr.w   r1, [pc, #0x8e4]
000d7470  add     r0, pc ; -> 0x000fdb70  
000d7472  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d7474  ldr     r5, [r0]
000d7476  ldr.w   fp, [r1]
000d747a  mov     r0, r5
000d747c  mov     r1, fp
000d747e  blx     #0xddbfc ; -> objc_msgSend
000d7482  ldr.w   r1, [pc, #0x8d4]
000d7486  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d7488  ldr     r4, [r1]
000d748a  mov     r1, r4
000d748c  blx     #0xddbfc ; -> objc_msgSend
000d7490  mov     r1, fp
000d7492  str     r0, [sp, #0x30]
000d7494  mov     r0, r5
000d7496  blx     #0xddbfc ; -> objc_msgSend
000d749a  mov     r1, r4
000d749c  blx     #0xddbfc ; -> objc_msgSend
000d74a0  ldr.w   r1, [pc, #0x8b8]
000d74a4  movs    r3, #0
000d74a6  add     r2, sp, #0x24c
000d74a8  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d74aa  str     r3, [sp, #0x24c]
000d74ac  ldr     r1, [r1]
000d74ae  str     r3, [sp, #0x250]
000d74b0  str     r3, [sp, #0x254]
000d74b2  str     r3, [sp, #0x258]
000d74b4  str     r3, [sp, #0x25c]
000d74b6  str     r3, [sp, #0x260]
000d74b8  str     r3, [sp, #0x264]
000d74ba  str     r3, [sp, #0x268]
000d74bc  adds    r3, #0x10
000d74be  str     r3, [sp]
000d74c0  add     r3, sp, #0x1ac
000d74c2  str     r1, [sp, #0x38]
000d74c4  str     r0, [sp, #0x34]
000d74c6  ldr     r0, [sp, #0x1c]
000d74c8  blx     #0xddbfc ; -> objc_msgSend
000d74cc  mov     r4, r0
000d74ce  cmp     r0, #0
000d74d0  beq.w   #0xd797e
000d74d4  ldr.w   r1, [pc, #0x888]
000d74d8  ldr     r3, [sp, #0x254]
000d74da  ldr.w   r2, [pc, #0x888]
000d74de  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000d74e0  ldr     r1, [r1]
000d74e2  ldr     r0, [r3]
000d74e4  add     r2, pc ; -> 0x000fcdc8  
000d74e6  str     r1, [sp, #0x3c]
000d74e8  ldr.w   r1, [pc, #0x87c]
000d74ec  str     r0, [sp, #0x98]
000d74ee  ldr.w   r0, [pc, #0x87c]
000d74f2  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d74f4  ldr     r2, [r2]
000d74f6  ldr.w   r8, [r1]
000d74fa  ldr.w   r1, [pc, #0x874]
000d74fe  add     r0, pc ; -> 0x000fdca8  
000d7500  str     r2, [sp, #0x5c]
000d7502  add     r1, pc ; -> 0x000fd294  
000d7504  ldr     r0, [r0]
000d7506  ldr     r1, [r1]
000d7508  ldr.w   r2, [pc, #0x868]
000d750c  str     r0, [sp, #0x40]
000d750e  str     r1, [sp, #0x44]
000d7510  ldr.w   r1, [pc, #0x864]
000d7514  add     r1, pc ; -> 0x000fd16c  
000d7516  ldr     r1, [r1]
000d7518  str     r1, [sp, #0x48]
000d751a  ldr.w   r1, [pc, #0x860]
000d751e  add     r1, pc ; -> 0x000fd530  
000d7520  ldr     r1, [r1]
000d7522  str     r1, [sp, #0x4c]
000d7524  ldr.w   r1, [pc, #0x858]
000d7528  add     r1, pc ; -> 0x000fd2fc  
000d752a  ldr     r1, [r1]
000d752c  str     r1, [sp, #0x50]
000d752e  ldr.w   r1, [pc, #0x854]
000d7532  add     r1, pc ; -> 0x000fd2ac  
000d7534  ldr     r1, [r1]
000d7536  str     r1, [sp, #0x54]
000d7538  ldr.w   r1, [pc, #0x84c]
000d753c  add     r1, pc ; -> 0x000fcdb4  
000d753e  ldr     r1, [r1]
000d7540  str     r1, [sp, #0x58]
000d7542  ldr.w   r1, [pc, #0x848]
000d7546  add     r1, pc ; -> 0x000fd338  
000d7548  ldr     r1, [r1]
000d754a  str     r1, [sp, #0x60]
000d754c  ldr.w   r1, [pc, #0x840]
000d7550  add     r1, pc ; -> 0x000fcdc4  
000d7552  ldr     r1, [r1]
000d7554  str     r1, [sp, #0x64]
000d7556  ldr.w   r1, [pc, #0x83c]
000d755a  add     r1, pc ; -> 0x000fd2b4  
000d755c  ldr     r1, [r1]
000d755e  str     r1, [sp, #0x68]
000d7560  ldr.w   r1, [pc, #0x834]
000d7564  add     r1, pc ; -> 0x000fd2a4  
000d7566  ldr     r1, [r1]
000d7568  str     r1, [sp, #0x6c]
000d756a  ldr.w   r1, [pc, #0x830]
000d756e  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d7570  ldr     r1, [r1]
000d7572  str     r1, [sp, #0x70]
000d7574  ldr.w   r1, [pc, #0x828]
000d7578  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d757a  ldr     r1, [r1]
000d757c  str     r1, [sp, #0x74]
000d757e  ldr.w   r1, [pc, #0x824]
000d7582  str     r4, [sp, #0x90]
000d7584  str     r2, [sp, #0x10]
000d7586  str     r1, [sp, #0x18]
000d7588  b       #0xd758c
000d758a  ldr     r3, [sp, #0x254]
000d758c  movs    r0, #0
000d758e  str     r0, [sp, #0xb8]
000d7590  b       #0xd7594
000d7592  ldr     r3, [sp, #0x254]
000d7594  ldr     r3, [r3]
000d7596  ldr     r1, [sp, #0x98]
000d7598  cmp     r3, r1
000d759a  beq     #0xd75a2
000d759c  ldr     r0, [sp, #0x1c]
000d759e  blx     #0xddbe4 ; -> objc_enumerationMutation
000d75a2  ldr     r3, [sp, #0xb8]
000d75a4  ldr     r2, [sp, #0x250]
000d75a6  ldr     r1, [sp, #0x20]
000d75a8  ldr.w   r2, [r2, r3, lsl #2]
000d75ac  ldr     r3, [sp, #0x18]
000d75ae  add     r3, pc
000d75b0  str     r2, [sp, #0x8c]
000d75b2  ldr     r3, [r3]
000d75b4  ldr     r0, [r1, r3]
000d75b6  ldr     r1, [sp, #0x3c]
000d75b8  blx     #0xddbfc ; -> objc_msgSend
000d75bc  movs    r3, #0
000d75be  ldr     r1, [sp, #0x38]
000d75c0  str     r3, [sp, #0x22c]
000d75c2  str     r3, [sp, #0x230]
000d75c4  str     r3, [sp, #0x234]
000d75c6  str     r3, [sp, #0x238]
000d75c8  str     r3, [sp, #0x23c]
000d75ca  str     r3, [sp, #0x240]
000d75cc  str     r3, [sp, #0x244]
000d75ce  str     r3, [sp, #0x248]
000d75d0  add     r2, sp, #0x22c
000d75d2  adds    r3, #0x10
000d75d4  str     r3, [sp]
000d75d6  add     r3, sp, #0x16c
000d75d8  str     r0, [sp, #0x94]
000d75da  blx     #0xddbfc ; -> objc_msgSend
000d75de  cmp     r0, #0
000d75e0  beq.w   #0xd7782
000d75e4  ldr     r3, [sp, #0x234]
000d75e6  ldr.w   r1, [pc, #0x7c0]
000d75ea  ldr     r2, [r3]
000d75ec  str     r0, [sp, #0x9c]
000d75ee  ldr.w   r0, [pc, #0x7bc]
000d75f2  str     r1, [sp, #8]
000d75f4  str     r2, [sp, #0xa0]
000d75f6  str     r0, [sp, #0x14]
000d75f8  b       #0xd75fc
000d75fa  ldr     r3, [sp, #0x234]
000d75fc  mov.w   sl, #0
000d7600  b       #0xd7604
000d7602  ldr     r3, [sp, #0x234]
000d7604  ldr     r3, [r3]
000d7606  ldr     r2, [sp, #0xa0]
000d7608  cmp     r3, r2
000d760a  beq     #0xd7612
000d760c  ldr     r0, [sp, #0x94]
000d760e  blx     #0xddbe4 ; -> objc_enumerationMutation
000d7612  ldr     r3, [sp, #0x14]
000d7614  ldr     r1, [sp, #0x20]
000d7616  add     r3, pc
000d7618  ldr     r3, [r3]
000d761a  ldr     r0, [r1, r3]
000d761c  ldr     r3, [sp, #0x230]
000d761e  mov     r1, r8
000d7620  ldr.w   r2, [r3, sl, lsl #2]
000d7624  blx     #0xddbfc ; -> objc_msgSend
000d7628  mov     r1, fp
000d762a  mov     r5, r0
000d762c  ldr     r0, [sp, #0x40]
000d762e  blx     #0xddbfc ; -> objc_msgSend
000d7632  ldr     r1, [sp, #0x44]
000d7634  ldr     r2, [sp, #0x8c]
000d7636  blx     #0xddbfc ; -> objc_msgSend
000d763a  ldr     r2, [sp, #8]
000d763c  mov     r1, r8
000d763e  add     r2, pc
000d7640  mov     r6, r0
000d7642  mov     r0, r5
000d7644  blx     #0xddbfc ; -> objc_msgSend
000d7648  ldr     r1, [sp, #0x4c]
000d764a  mov     r4, r0
000d764c  mov     r0, r6
000d764e  blx     #0xddbfc ; -> objc_msgSend
000d7652  ldr     r1, [sp, #0x48]
000d7654  mov     r2, r0
000d7656  mov     r0, r4
000d7658  blx     #0xddbfc ; -> objc_msgSend
000d765c  cmp     r0, #0
000d765e  bne     #0xd7756
000d7660  ldr.w   r2, [pc, #0x74c]
000d7664  mov     r1, r8
000d7666  mov     r0, r5
000d7668  add     r2, pc ; -> 0x0017f1c4  
000d766a  blx     #0xddbfc ; -> objc_msgSend
000d766e  ldr.w   r4, [pc, #0x744]
000d7672  ldr     r1, [sp, #0x50]
000d7674  add     r4, pc ; -> 0x0017f034  
000d7676  mov     r2, r0
000d7678  mov     r0, r6
000d767a  blx     #0xddbfc ; -> objc_msgSend
000d767e  mov     r0, r5
000d7680  mov     r1, r8
000d7682  mov     r2, r4
000d7684  blx     #0xddbfc ; -> objc_msgSend
000d7688  cbz     r0, #0xd76a4
000d768a  mov     r2, r4
000d768c  mov     r1, r8
000d768e  mov     r0, r5
000d7690  blx     #0xddbfc ; -> objc_msgSend
000d7694  ldr     r1, [sp, #0x58]
000d7696  blx     #0xddbfc ; -> objc_msgSend
000d769a  ldr     r1, [sp, #0x54]
000d769c  mov     r2, r0
000d769e  mov     r0, r6
000d76a0  blx     #0xddbfc ; -> objc_msgSend
000d76a4  ldr.w   r4, [pc, #0x710]
000d76a8  mov     r0, r5
000d76aa  mov     r1, r8
000d76ac  add     r4, pc ; -> 0x00180354  
000d76ae  mov     r2, r4
000d76b0  blx     #0xddbfc ; -> objc_msgSend
000d76b4  cbz     r0, #0xd76fa
000d76b6  mov     r2, r4
000d76b8  mov     r1, r8
000d76ba  mov     r0, r5
000d76bc  blx     #0xddbfc ; -> objc_msgSend
000d76c0  ldr.w   r3, [pc, #0x6f8]
000d76c4  ldr     r2, [sp, #0x5c]
000d76c6  add     r3, pc ; -> 0x00181414  
000d76c8  mov     r4, r0
000d76ca  mov     r1, r4
000d76cc  add     r0, sp, #0xe4
000d76ce  blx     #0xddc14 ; -> objc_msgSend_stret
000d76d2  add     r3, sp, #0xe4
000d76d4  mvn     r1, #0x80000000
000d76d8  ldm     r3, {r2, r3}
000d76da  cmp     r1, r2
000d76dc  beq     #0xd76f0
000d76de  add     r2, r3
000d76e0  ldr     r1, [sp, #0x64]
000d76e2  mov     r0, r4
000d76e4  blx     #0xddbfc ; -> objc_msgSend
000d76e8  ldr     r1, [sp, #0x60]
000d76ea  mov     r2, r0
000d76ec  mov     r0, r6
000d76ee  b       #0xd76f6
000d76f0  ldr     r1, [sp, #0x60]
000d76f2  mov     r0, r6
000d76f4  mov     r2, r4
000d76f6  blx     #0xddbfc ; -> objc_msgSend
000d76fa  ldr.w   r4, [pc, #0x6c4]
000d76fe  mov     r0, r5
000d7700  mov     r1, r8
000d7702  add     r4, pc ; -> 0x00180364  
000d7704  mov     r2, r4
000d7706  blx     #0xddbfc ; -> objc_msgSend
000d770a  cbz     r0, #0xd7726
000d770c  mov     r2, r4
000d770e  mov     r1, r8
000d7710  mov     r0, r5
000d7712  blx     #0xddbfc ; -> objc_msgSend
000d7716  ldr     r1, [sp, #0x58]
000d7718  blx     #0xddbfc ; -> objc_msgSend
000d771c  ldr     r1, [sp, #0x68]
000d771e  mov     r2, r0
000d7720  mov     r0, r6
000d7722  blx     #0xddbfc ; -> objc_msgSend
000d7726  ldr.w   r4, [pc, #0x69c]
000d772a  mov     r0, r5
000d772c  mov     r1, r8
000d772e  add     r4, pc ; -> 0x00180374  
000d7730  mov     r2, r4
000d7732  blx     #0xddbfc ; -> objc_msgSend
000d7736  cbz     r0, #0xd774c
000d7738  mov     r1, r8
000d773a  mov     r2, r4
000d773c  mov     r0, r5
000d773e  blx     #0xddbfc ; -> objc_msgSend
000d7742  ldr     r1, [sp, #0x6c]
000d7744  mov     r2, r0
000d7746  mov     r0, r6
000d7748  blx     #0xddbfc ; -> objc_msgSend
000d774c  ldr     r0, [sp, #0x30]
000d774e  ldr     r1, [sp, #0x70]
000d7750  mov     r2, r6
000d7752  blx     #0xddbfc ; -> objc_msgSend
000d7756  mov     r0, r6
000d7758  ldr     r1, [sp, #0x74]
000d775a  blx     #0xddbfc ; -> objc_msgSend
000d775e  ldr     r2, [sp, #0x9c]
000d7760  add.w   sl, sl, #1
000d7764  cmp     r2, sl
000d7766  bhi.w   #0xd7602
000d776a  movs    r3, #0x10
000d776c  ldr     r0, [sp, #0x94]
000d776e  str     r3, [sp]
000d7770  ldr     r1, [sp, #0x38]
000d7772  add     r2, sp, #0x22c
000d7774  add     r3, sp, #0x16c
000d7776  blx     #0xddbfc ; -> objc_msgSend
000d777a  str     r0, [sp, #0x9c]
000d777c  cmp     r0, #0
000d777e  bne.w   #0xd75fa
000d7782  ldr     r3, [sp, #0x10]
000d7784  ldr     r1, [sp, #0x20]
000d7786  add     r3, pc
000d7788  ldr     r3, [r3]
000d778a  ldr     r0, [r1, r3]
000d778c  ldr     r1, [sp, #0x3c]
000d778e  blx     #0xddbfc ; -> objc_msgSend
000d7792  movs    r3, #0
000d7794  ldr     r1, [sp, #0x38]
000d7796  str     r3, [sp, #0x20c]
000d7798  str     r3, [sp, #0x210]
000d779a  str     r3, [sp, #0x214]
000d779c  str     r3, [sp, #0x218]
000d779e  str     r3, [sp, #0x21c]
000d77a0  str     r3, [sp, #0x220]
000d77a2  str     r3, [sp, #0x224]
000d77a4  str     r3, [sp, #0x228]
000d77a6  add     r2, sp, #0x20c
000d77a8  adds    r3, #0x10
000d77aa  str     r3, [sp]
000d77ac  add     r3, sp, #0x12c
000d77ae  str     r0, [sp, #0xe0]
000d77b0  blx     #0xddbfc ; -> objc_msgSend
000d77b4  cmp     r0, #0
000d77b6  beq.w   #0xd7958
000d77ba  ldr     r3, [sp, #0x214]
000d77bc  ldr.w   r1, [pc, #0x608]
000d77c0  ldr     r2, [r3]
000d77c2  str     r0, [sp, #0xa4]
000d77c4  ldr.w   r0, [pc, #0x604]
000d77c8  str     r1, [sp, #4]
000d77ca  str     r2, [sp, #0xa8]
000d77cc  str     r0, [sp, #0xc]
000d77ce  b       #0xd77d2
000d77d0  ldr     r3, [sp, #0x214]
000d77d2  mov.w   sl, #0
000d77d6  b       #0xd77da
000d77d8  ldr     r3, [sp, #0x214]
000d77da  ldr     r3, [r3]
000d77dc  ldr     r2, [sp, #0xa8]
000d77de  cmp     r3, r2
000d77e0  beq     #0xd77e8
000d77e2  ldr     r0, [sp, #0xe0]
000d77e4  blx     #0xddbe4 ; -> objc_enumerationMutation
000d77e8  ldr     r3, [sp, #0xc]
000d77ea  ldr     r1, [sp, #0x20]
000d77ec  add     r3, pc
000d77ee  ldr     r3, [r3]
000d77f0  ldr     r0, [r1, r3]
000d77f2  ldr     r3, [sp, #0x210]
000d77f4  mov     r1, r8
000d77f6  ldr.w   r2, [r3, sl, lsl #2]
000d77fa  blx     #0xddbfc ; -> objc_msgSend
000d77fe  mov     r1, fp
000d7800  mov     r5, r0
000d7802  ldr     r0, [sp, #0x40]
000d7804  blx     #0xddbfc ; -> objc_msgSend
000d7808  ldr     r1, [sp, #0x44]
000d780a  ldr     r2, [sp, #0x8c]
000d780c  blx     #0xddbfc ; -> objc_msgSend
000d7810  ldr     r2, [sp, #4]
000d7812  mov     r1, r8
000d7814  add     r2, pc
000d7816  mov     r6, r0
000d7818  mov     r0, r5
000d781a  blx     #0xddbfc ; -> objc_msgSend
000d781e  ldr     r1, [sp, #0x4c]
000d7820  mov     r4, r0
000d7822  mov     r0, r6
000d7824  blx     #0xddbfc ; -> objc_msgSend
000d7828  ldr     r1, [sp, #0x48]
000d782a  mov     r2, r0
000d782c  mov     r0, r4
000d782e  blx     #0xddbfc ; -> objc_msgSend
000d7832  cmp     r0, #0
000d7834  bne     #0xd792c
000d7836  ldr.w   r2, [pc, #0x598]
000d783a  mov     r1, r8
000d783c  mov     r0, r5
000d783e  add     r2, pc ; -> 0x0017f1c4  
000d7840  blx     #0xddbfc ; -> objc_msgSend
000d7844  ldr.w   r4, [pc, #0x58c]
000d7848  ldr     r1, [sp, #0x50]
000d784a  add     r4, pc ; -> 0x0017f034  
000d784c  mov     r2, r0
000d784e  mov     r0, r6
000d7850  blx     #0xddbfc ; -> objc_msgSend
000d7854  mov     r0, r5
000d7856  mov     r1, r8
000d7858  mov     r2, r4
000d785a  blx     #0xddbfc ; -> objc_msgSend
000d785e  cbz     r0, #0xd787a
000d7860  mov     r2, r4
000d7862  mov     r1, r8
000d7864  mov     r0, r5
000d7866  blx     #0xddbfc ; -> objc_msgSend
000d786a  ldr     r1, [sp, #0x58]
000d786c  blx     #0xddbfc ; -> objc_msgSend
000d7870  ldr     r1, [sp, #0x54]
000d7872  mov     r2, r0
000d7874  mov     r0, r6
000d7876  blx     #0xddbfc ; -> objc_msgSend
000d787a  ldr.w   r4, [pc, #0x55c]
000d787e  mov     r0, r5
000d7880  mov     r1, r8
000d7882  add     r4, pc ; -> 0x00180354  
000d7884  mov     r2, r4
000d7886  blx     #0xddbfc ; -> objc_msgSend
000d788a  cbz     r0, #0xd78d0
000d788c  mov     r2, r4
000d788e  mov     r1, r8
000d7890  mov     r0, r5
000d7892  blx     #0xddbfc ; -> objc_msgSend
000d7896  ldr.w   r3, [pc, #0x544]
000d789a  ldr     r2, [sp, #0x5c]
000d789c  add     r3, pc ; -> 0x00181414  
000d789e  mov     r4, r0
000d78a0  mov     r1, r4
000d78a2  add     r0, sp, #0xe4
000d78a4  blx     #0xddc14 ; -> objc_msgSend_stret
000d78a8  add     r3, sp, #0xe4
000d78aa  mvn     r1, #0x80000000
000d78ae  ldm     r3, {r2, r3}
000d78b0  cmp     r1, r2
000d78b2  beq     #0xd78c6
000d78b4  add     r2, r3
000d78b6  ldr     r1, [sp, #0x64]
000d78b8  mov     r0, r4
000d78ba  blx     #0xddbfc ; -> objc_msgSend
000d78be  ldr     r1, [sp, #0x60]
000d78c0  mov     r2, r0
000d78c2  mov     r0, r6
000d78c4  b       #0xd78cc
000d78c6  ldr     r1, [sp, #0x60]
000d78c8  mov     r0, r6
000d78ca  mov     r2, r4
000d78cc  blx     #0xddbfc ; -> objc_msgSend
000d78d0  ldr.w   r4, [pc, #0x50c]
000d78d4  mov     r0, r5
000d78d6  mov     r1, r8
000d78d8  add     r4, pc ; -> 0x00180364  
000d78da  mov     r2, r4
000d78dc  blx     #0xddbfc ; -> objc_msgSend
000d78e0  cbz     r0, #0xd78fc
000d78e2  mov     r2, r4
000d78e4  mov     r1, r8
000d78e6  mov     r0, r5
000d78e8  blx     #0xddbfc ; -> objc_msgSend
000d78ec  ldr     r1, [sp, #0x58]
000d78ee  blx     #0xddbfc ; -> objc_msgSend
000d78f2  ldr     r1, [sp, #0x68]
000d78f4  mov     r2, r0
000d78f6  mov     r0, r6
000d78f8  blx     #0xddbfc ; -> objc_msgSend
000d78fc  ldr.w   r4, [pc, #0x4e4]
000d7900  mov     r0, r5
000d7902  mov     r1, r8
000d7904  add     r4, pc ; -> 0x00180374  
000d7906  mov     r2, r4
000d7908  blx     #0xddbfc ; -> objc_msgSend
000d790c  cbz     r0, #0xd7922
000d790e  mov     r1, r8
000d7910  mov     r2, r4
000d7912  mov     r0, r5
000d7914  blx     #0xddbfc ; -> objc_msgSend
000d7918  ldr     r1, [sp, #0x6c]
000d791a  mov     r2, r0
000d791c  mov     r0, r6
000d791e  blx     #0xddbfc ; -> objc_msgSend
000d7922  ldr     r0, [sp, #0x34]
000d7924  ldr     r1, [sp, #0x70]
000d7926  mov     r2, r6
000d7928  blx     #0xddbfc ; -> objc_msgSend
000d792c  mov     r0, r6
000d792e  ldr     r1, [sp, #0x74]
000d7930  blx     #0xddbfc ; -> objc_msgSend
000d7934  ldr     r2, [sp, #0xa4]
000d7936  add.w   sl, sl, #1
000d793a  cmp     r2, sl
000d793c  bhi.w   #0xd77d8
000d7940  movs    r3, #0x10
000d7942  ldr     r0, [sp, #0xe0]
000d7944  str     r3, [sp]
000d7946  ldr     r1, [sp, #0x38]
000d7948  add     r2, sp, #0x20c
000d794a  add     r3, sp, #0x12c
000d794c  blx     #0xddbfc ; -> objc_msgSend
000d7950  str     r0, [sp, #0xa4]
000d7952  cmp     r0, #0
000d7954  bne.w   #0xd77d0
000d7958  ldr     r3, [sp, #0xb8]
000d795a  ldr     r0, [sp, #0x90]
000d795c  adds    r3, #1
000d795e  cmp     r0, r3
000d7960  str     r3, [sp, #0xb8]
000d7962  bhi.w   #0xd7592
000d7966  movs    r3, #0x10
000d7968  ldr     r0, [sp, #0x1c]
000d796a  str     r3, [sp]
000d796c  ldr     r1, [sp, #0x38]
000d796e  add     r2, sp, #0x24c
000d7970  add     r3, sp, #0x1ac
000d7972  blx     #0xddbfc ; -> objc_msgSend
000d7976  str     r0, [sp, #0x90]
000d7978  cmp     r0, #0
000d797a  bne.w   #0xd758a
000d797e  ldr.w   r3, [pc, #0x468]
000d7982  mov.w   r1, #0
000d7986  ldr     r2, [sp, #0x20]
000d7988  add     r3, pc ; -> 0x000f3340  gettingChallenges
000d798a  ldr     r3, [r3]
000d798c  strb    r1, [r3]
000d798e  ldr.w   r3, [pc, #0x45c]
000d7992  ldr.w   r1, [pc, #0x45c]
000d7996  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d7998  add     r1, pc ; -> 0x000fcf5c  
000d799a  ldr     r0, [r3]
000d799c  ldr.w   sl, [r1]
000d79a0  ldr.w   r1, [pc, #0x450]
000d79a4  ldr     r0, [r2, r0]
000d79a6  add     r1, pc ; -> 0x000fcf60  
000d79a8  ldr     r2, [sp, #0x34]
000d79aa  ldr.w   r8, [r1]
000d79ae  str     r0, [sp, #0x78]
000d79b0  ldr.w   r0, [pc, #0x444]
000d79b4  ldr.w   r1, [pc, #0x444]
000d79b8  add     r0, pc ; -> 0x000fdb44  
000d79ba  add     r1, pc ; -> 0x000fd298  
000d79bc  ldr.w   fp, [r0]
000d79c0  ldr.w   r0, [pc, #0x43c]
000d79c4  ldr     r4, [r1]
000d79c6  add     r0, pc ; -> 0x000fdc14  
000d79c8  ldr     r5, [r0]
000d79ca  mov     r1, r4
000d79cc  mov     r0, r5
000d79ce  blx     #0xddbfc ; -> objc_msgSend
000d79d2  mov     r1, r4
000d79d4  ldr     r2, [sp, #0x30]
000d79d6  mov     r6, r0
000d79d8  mov     r0, r5
000d79da  blx     #0xddbfc ; -> objc_msgSend
000d79de  mov     r1, r8
000d79e0  mov     r2, r6
000d79e2  mov     r3, r0
000d79e4  movs    r0, #0
000d79e6  str     r0, [sp]
000d79e8  mov     r0, r5
000d79ea  blx     #0xddbfc ; -> objc_msgSend
000d79ee  ldr.w   r2, [pc, #0x414]
000d79f2  ldr.w   r3, [pc, #0x414]
000d79f6  movs    r1, #0
000d79f8  add     r2, pc ; -> 0x00181d34  
000d79fa  str     r1, [sp]
000d79fc  add     r3, pc ; -> 0x00181d44  
000d79fe  mov     r1, r8
000d7a00  mov     r4, r0
000d7a02  mov     r0, r5
000d7a04  blx     #0xddbfc ; -> objc_msgSend
000d7a08  mov     r1, sl
000d7a0a  mov     r2, r4
000d7a0c  mov     r3, r0
000d7a0e  mov     r0, fp
000d7a10  blx     #0xddbfc ; -> objc_msgSend
000d7a14  ldr     r1, [sp, #0x78]
000d7a16  mov     r2, r0
000d7a18  movs    r0, #0x50
000d7a1a  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d7a1e  ldr     r0, [pc, #0x3ec]
000d7a20  ldr.w   r1, [pc, #0x3ec]
000d7a24  movs    r2, #0
000d7a26  add     r0, pc ; -> 0x000f3270  mtxController
000d7a28  add     r1, pc ; -> 0x000fd4b8  
000d7a2a  ldr     r0, [r0]
000d7a2c  ldr     r1, [r1]
000d7a2e  ldr     r0, [r0]
000d7a30  blx     #0xddbfc ; -> objc_msgSend
000d7a34  ldr     r1, [pc, #0x3dc]
000d7a36  ldr     r0, [sp, #0x30]
000d7a38  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d7a3a  ldr     r4, [r1]
000d7a3c  mov     r1, r4
000d7a3e  blx     #0xddbfc ; -> objc_msgSend
000d7a42  ldr     r0, [sp, #0x34]
000d7a44  mov     r1, r4
000d7a46  blx     #0xddbfc ; -> objc_msgSend
000d7a4a  b       #0xd7d32
000d7a4c  ldr     r1, [pc, #0x3c8]
000d7a4e  ldr     r0, [pc, #0x3cc]
000d7a50  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d7a52  add     r0, pc ; -> 0x000fdb70  
000d7a54  ldr.w   fp, [r1]
000d7a58  ldr     r0, [r0]
000d7a5a  mov     r1, fp
000d7a5c  blx     #0xddbfc ; -> objc_msgSend
000d7a60  ldr     r1, [pc, #0x3bc]
000d7a62  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d7a64  ldr     r1, [r1]
000d7a66  blx     #0xddbfc ; -> objc_msgSend
000d7a6a  ldr     r3, [pc, #0x3b8]
000d7a6c  ldr     r1, [pc, #0x3b8]
000d7a6e  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d7a70  add     r1, pc ; -> 0x000fd2e0  
000d7a72  ldr     r3, [r3]
000d7a74  ldr     r1, [r1]
000d7a76  str     r0, [sp, #0x7c]
000d7a78  ldr     r0, [sp, #0x20]
000d7a7a  ldr     r2, [r0, r3]
000d7a7c  blx     #0xddbfc ; -> objc_msgSend
000d7a80  ldr     r1, [pc, #0x3a8]
000d7a82  movs    r3, #0x10
000d7a84  add     r2, sp, #0x1ec
000d7a86  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d7a88  str     r3, [sp]
000d7a8a  ldr     r1, [r1]
000d7a8c  add     r3, sp, #0xec
000d7a8e  str     r4, [sp, #0x1ec]
000d7a90  str     r4, [sp, #0x1f0]
000d7a92  str     r4, [sp, #0x1f4]
000d7a94  str     r4, [sp, #0x1f8]
000d7a96  str     r4, [sp, #0x1fc]
000d7a98  str     r4, [sp, #0x200]
000d7a9a  str     r4, [sp, #0x204]
000d7a9c  str     r4, [sp, #0x208]
000d7a9e  str     r1, [sp, #0xdc]
000d7aa0  str     r0, [sp, #0xac]
000d7aa2  ldr     r0, [sp, #0x1c]
000d7aa4  blx     #0xddbfc ; -> objc_msgSend
000d7aa8  mov     r2, r0
000d7aaa  cmp     r0, #0
000d7aac  beq.w   #0xd7c34
000d7ab0  ldr     r3, [sp, #0x1f4]
000d7ab2  ldr     r0, [pc, #0x37c]
000d7ab4  ldr     r1, [r3]
000d7ab6  add     r0, pc ; -> 0x000fdca8  
000d7ab8  str     r2, [sp, #0xb0]
000d7aba  ldr     r0, [r0]
000d7abc  str     r1, [sp, #0xb4]
000d7abe  ldr.w   r1, [pc, #0x374]
000d7ac2  str     r0, [sp, #0x80]
000d7ac4  add     r1, pc ; -> 0x000fd294  
000d7ac6  ldr     r1, [r1]
000d7ac8  str     r1, [sp, #0xd8]
000d7aca  ldr     r1, [pc, #0x36c]
000d7acc  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d7ace  ldr.w   r8, [r1]
000d7ad2  ldr     r1, [pc, #0x368]
000d7ad4  add     r1, pc ; -> 0x000fd530  
000d7ad6  ldr     r1, [r1]
000d7ad8  str     r1, [sp, #0xd4]
000d7ada  ldr     r1, [pc, #0x364]
000d7adc  add     r1, pc ; -> 0x000fd2fc  
000d7ade  ldr     r1, [r1]
000d7ae0  str     r1, [sp, #0xd0]
000d7ae2  ldr     r1, [pc, #0x360]
000d7ae4  add     r1, pc ; -> 0x000fd2ac  
000d7ae6  ldr     r1, [r1]
000d7ae8  str     r1, [sp, #0xcc]
000d7aea  ldr     r1, [pc, #0x35c]
000d7aec  add     r1, pc ; -> 0x000fcdb4  
000d7aee  ldr     r1, [r1]
000d7af0  str     r1, [sp, #0xc8]
000d7af2  ldr     r1, [pc, #0x358]
000d7af4  add     r1, pc ; -> 0x000fd2a8  
000d7af6  ldr     r1, [r1]
000d7af8  str     r1, [sp, #0x84]
000d7afa  ldr     r1, [pc, #0x354]
000d7afc  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d7afe  ldr     r1, [r1]
000d7b00  str     r1, [sp, #0x88]
000d7b02  ldr     r1, [pc, #0x350]
000d7b04  add     r1, pc ; -> 0x000fd2a4  
000d7b06  ldr     r1, [r1]
000d7b08  str     r1, [sp, #0xc4]
000d7b0a  ldr     r1, [pc, #0x34c]
000d7b0c  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d7b0e  ldr     r1, [r1]
000d7b10  str     r1, [sp, #0xc0]
000d7b12  ldr     r1, [pc, #0x348]
000d7b14  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d7b16  ldr     r1, [r1]
000d7b18  str     r1, [sp, #0xbc]
000d7b1a  b       #0xd7b1e
000d7b1c  ldr     r3, [sp, #0x1f4]
000d7b1e  mov.w   sl, #0
000d7b22  b       #0xd7b26
000d7b24  ldr     r3, [sp, #0x1f4]
000d7b26  ldr     r3, [r3]
000d7b28  ldr     r2, [sp, #0xb4]
000d7b2a  cmp     r3, r2
000d7b2c  beq     #0xd7b34
000d7b2e  ldr     r0, [sp, #0x1c]
000d7b30  blx     #0xddbe4 ; -> objc_enumerationMutation
000d7b34  ldr     r2, [sp, #0x1f0]
000d7b36  mov     r1, fp
000d7b38  ldr     r0, [sp, #0x80]
000d7b3a  ldr.w   r4, [r2, sl, lsl #2]
000d7b3e  blx     #0xddbfc ; -> objc_msgSend
000d7b42  ldr     r1, [sp, #0xd8]
000d7b44  mov     r2, r4
000d7b46  blx     #0xddbfc ; -> objc_msgSend
000d7b4a  ldr     r1, [sp, #0xd4]
000d7b4c  mov     r6, r0
000d7b4e  blx     #0xddbfc ; -> objc_msgSend
000d7b52  mov     r1, r8
000d7b54  mov     r2, r0
000d7b56  ldr     r0, [sp, #0xac]
000d7b58  blx     #0xddbfc ; -> objc_msgSend
000d7b5c  cmp     r0, #0
000d7b5e  beq     #0xd7c0a
000d7b60  ldr     r1, [sp, #0xd4]
000d7b62  mov     r0, r6
000d7b64  blx     #0xddbfc ; -> objc_msgSend
000d7b68  mov     r1, r8
000d7b6a  ldr     r4, [pc, #0x2f4]
000d7b6c  add     r4, pc ; -> 0x0017f034  
000d7b6e  mov     r2, r0
000d7b70  ldr     r0, [sp, #0xac]
000d7b72  blx     #0xddbfc ; -> objc_msgSend
000d7b76  ldr     r2, [pc, #0x2ec]
000d7b78  mov     r1, r8
000d7b7a  add     r2, pc ; -> 0x0017f1c4  
000d7b7c  mov     r5, r0
000d7b7e  blx     #0xddbfc ; -> objc_msgSend
000d7b82  ldr     r1, [sp, #0xd0]
000d7b84  mov     r2, r0
000d7b86  mov     r0, r6
000d7b88  blx     #0xddbfc ; -> objc_msgSend
000d7b8c  mov     r0, r5
000d7b8e  mov     r1, r8
000d7b90  mov     r2, r4
000d7b92  blx     #0xddbfc ; -> objc_msgSend
000d7b96  cbz     r0, #0xd7bb2
000d7b98  mov     r2, r4
000d7b9a  mov     r1, r8
000d7b9c  mov     r0, r5
000d7b9e  blx     #0xddbfc ; -> objc_msgSend
000d7ba2  ldr     r1, [sp, #0xc8]
000d7ba4  blx     #0xddbfc ; -> objc_msgSend
000d7ba8  ldr     r1, [sp, #0xcc]
000d7baa  mov     r2, r0
000d7bac  mov     r0, r6
000d7bae  blx     #0xddbfc ; -> objc_msgSend
000d7bb2  ldr     r4, [pc, #0x2b4]
000d7bb4  mov     r0, r5
000d7bb6  mov     r1, r8
000d7bb8  add     r4, pc ; -> 0x0017f0a4  
000d7bba  mov     r2, r4
000d7bbc  blx     #0xddbfc ; -> objc_msgSend
000d7bc0  cbz     r0, #0xd7bdc
000d7bc2  mov     r2, r4
000d7bc4  mov     r1, r8
000d7bc6  mov     r0, r5
000d7bc8  blx     #0xddbfc ; -> objc_msgSend
000d7bcc  ldr     r1, [sp, #0x88]
000d7bce  blx     #0xddbfc ; -> objc_msgSend
000d7bd2  ldr     r1, [sp, #0x84]
000d7bd4  mov     r2, r0
000d7bd6  mov     r0, r6
000d7bd8  blx     #0xddbfc ; -> objc_msgSend
000d7bdc  ldr     r4, [pc, #0x28c]
000d7bde  mov     r0, r5
000d7be0  mov     r1, r8
000d7be2  add     r4, pc ; -> 0x00180194  
000d7be4  mov     r2, r4
000d7be6  blx     #0xddbfc ; -> objc_msgSend
000d7bea  cbz     r0, #0xd7c00
000d7bec  mov     r1, r8
000d7bee  mov     r2, r4
000d7bf0  mov     r0, r5
000d7bf2  blx     #0xddbfc ; -> objc_msgSend
000d7bf6  ldr     r1, [sp, #0xc4]
000d7bf8  mov     r2, r0
000d7bfa  mov     r0, r6
000d7bfc  blx     #0xddbfc ; -> objc_msgSend
000d7c00  ldr     r0, [sp, #0x7c]
000d7c02  ldr     r1, [sp, #0xc0]
000d7c04  mov     r2, r6
000d7c06  blx     #0xddbfc ; -> objc_msgSend
000d7c0a  mov     r0, r6
000d7c0c  ldr     r1, [sp, #0xbc]
000d7c0e  blx     #0xddbfc ; -> objc_msgSend
000d7c12  ldr     r3, [sp, #0xb0]
000d7c14  add.w   sl, sl, #1
000d7c18  cmp     r3, sl
000d7c1a  bhi     #0xd7b24
000d7c1c  movs    r3, #0x10
000d7c1e  ldr     r0, [sp, #0x1c]
000d7c20  str     r3, [sp]
000d7c22  ldr     r1, [sp, #0xdc]
000d7c24  add     r2, sp, #0x1ec
000d7c26  add     r3, sp, #0xec
000d7c28  blx     #0xddbfc ; -> objc_msgSend
000d7c2c  str     r0, [sp, #0xb0]
000d7c2e  cmp     r0, #0
000d7c30  bne.w   #0xd7b1c
000d7c34  ldr     r0, [pc, #0x238]
000d7c36  mov     r1, fp
000d7c38  ldr.w   r6, [pc, #0x238]
000d7c3c  add     r0, pc ; -> 0x000fdcac  
000d7c3e  ldr     r0, [r0]
000d7c40  blx     #0xddbfc ; -> objc_msgSend
000d7c44  ldr     r3, [pc, #0x230]
000d7c46  ldr     r1, [pc, #0x234]
000d7c48  ldr     r2, [pc, #0x234]
000d7c4a  add     r3, pc ; -> 0x000fd16c  
000d7c4c  add     r1, pc ; -> 0x000fd2a0  
000d7c4e  ldr     r3, [r3]
000d7c50  add     r2, pc ; -> 0x0017f0a4  
000d7c52  ldr     r1, [r1]
000d7c54  add     r6, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d7c56  str     r3, [sp]
000d7c58  movs    r3, #1
000d7c5a  blx     #0xddbfc ; -> objc_msgSend
000d7c5e  ldr     r1, [pc, #0x224]
000d7c60  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d7c62  ldr     r1, [r1]
000d7c64  blx     #0xddbfc ; -> objc_msgSend
000d7c68  ldr     r1, [pc, #0x21c]
000d7c6a  movs    r3, #0
000d7c6c  add     r1, pc ; -> 0x000fd29c  
000d7c6e  ldr     r4, [r1]
000d7c70  ldr     r1, [pc, #0x218]
000d7c72  add     r1, pc ; -> 0x000fcf60  
000d7c74  ldr     r1, [r1]
000d7c76  mov     r2, r0
000d7c78  ldr     r0, [pc, #0x214]
000d7c7a  add     r0, pc ; -> 0x000fdc14  
000d7c7c  ldr.w   sl, [r0]
000d7c80  mov     r0, sl
000d7c82  blx     #0xddbfc ; -> objc_msgSend
000d7c86  mov     r1, r4
000d7c88  ldr     r4, [pc, #0x208]
000d7c8a  add     r4, pc ; -> 0x00181d54  
000d7c8c  mov     r2, r0
000d7c8e  ldr     r0, [sp, #0x7c]
000d7c90  blx     #0xddbfc ; -> objc_msgSend
000d7c94  ldr     r1, [sp, #0x2c]
000d7c96  ldr     r0, [sp, #0x7c]
000d7c98  blx     #0xddbfc ; -> objc_msgSend
000d7c9c  mov     r2, r4
000d7c9e  ldr     r1, [sp, #0x28]
000d7ca0  mov     r3, r0
000d7ca2  ldr     r0, [sp, #0x24]
000d7ca4  blx     #0xddbfc ; -> objc_msgSend
000d7ca8  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d7cac  ldr     r1, [r6]
000d7cae  ldr     r0, [sp, #0x20]
000d7cb0  ldr     r2, [sp, #0x7c]
000d7cb2  ldr.w   r8, [r0, r1]
000d7cb6  ldr     r1, [pc, #0x1e0]
000d7cb8  ldr     r0, [pc, #0x1e0]
000d7cba  add     r1, pc ; -> 0x000fcdec  '(5\x0e'
000d7cbc  add     r0, pc ; -> 0x000fdb44  
000d7cbe  ldr     r4, [r1]
000d7cc0  ldr     r1, [pc, #0x1dc]
000d7cc2  ldr     r5, [r0]
000d7cc4  mov     r0, sl
000d7cc6  add     r1, pc ; -> 0x000fd298  
000d7cc8  ldr     r1, [r1]
000d7cca  blx     #0xddbfc ; -> objc_msgSend
000d7cce  ldr     r3, [pc, #0x1d4]
000d7cd0  mov     r1, r4
000d7cd2  add     r3, pc ; -> 0x00180324  
000d7cd4  mov     r2, r0
000d7cd6  mov     r0, r5
000d7cd8  blx     #0xddbfc ; -> objc_msgSend
000d7cdc  mov     r1, r8
000d7cde  mov     r2, r0
000d7ce0  movs    r0, #0x44
000d7ce2  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000d7ce6  ldr     r1, [pc, #0x1c0]
000d7ce8  ldr     r0, [sp, #0x7c]
000d7cea  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d7cec  ldr     r1, [r1]
000d7cee  blx     #0xddbfc ; -> objc_msgSend
000d7cf2  ldr     r3, [pc, #0x1b8]
000d7cf4  ldr     r1, [sp, #0x20]
000d7cf6  ldr     r2, [pc, #0x1b8]
000d7cf8  add     r3, pc ; -> 0x000fb76c  OBJC_IVAR_$_Social_Info.leaderboardsIndex
000d7cfa  ldr     r0, [r3]
000d7cfc  add     r2, pc ; -> 0x0017e5c4  
000d7cfe  ldr     r5, [r1, r0]
000d7d00  ldr     r1, [pc, #0x1b0]
000d7d02  ldr     r0, [r6]
000d7d04  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000d7d06  ldr     r4, [r1]
000d7d08  ldr     r1, [sp, #0x20]
000d7d0a  ldr     r3, [r1, r0]
000d7d0c  ldr     r1, [sp, #0x28]
000d7d0e  ldr     r0, [sp, #0x24]
000d7d10  blx     #0xddbfc ; -> objc_msgSend
000d7d14  mov     r1, r4
000d7d16  mov     r2, r0
000d7d18  mov     r0, r5
000d7d1a  blx     #0xddbfc ; -> objc_msgSend
000d7d1e  ldr     r0, [pc, #0x198]
000d7d20  ldr     r1, [pc, #0x198]
000d7d22  movs    r2, #0
000d7d24  add     r0, pc ; -> 0x000f3270  mtxController
000d7d26  add     r1, pc ; -> 0x000fd4b8  
000d7d28  ldr     r0, [r0]
000d7d2a  ldr     r1, [r1]
000d7d2c  ldr     r0, [r0]
000d7d2e  blx     #0xddbfc ; -> objc_msgSend
000d7d32  sub.w   sp, r7, #0x18
000d7d36  pop.w   {r8, sl, fp}
000d7d3a  pop     {r4, r5, r6, r7, pc}
000d7d3c  ldrsb   r2, [r7, r1]
000d7d3e  movs    r2, r0
000d7d40  str     r0, [r6, #0x70]
000d7d42  movs    r2, r0
000d7d44  add     r0, sp, #0x3a8
000d7d46  movs    r2, r1
000d7d48  ldrsb   r2, [r0, r1]
000d7d4a  movs    r2, r0
000d7d4c  bkpt    #0xe2
000d7d4e  movs    r1, r0
000d7d50  str     r4, [r7, #0x6c]
000d7d52  movs    r2, r0
000d7d54  strb    r6, [r1, r4]
000d7d56  movs    r2, r0
000d7d58  strb    r6, [r6, r3]
000d7d5a  movs    r2, r0
000d7d5c  strb    r4, [r5, r3]
000d7d5e  movs    r2, r0
000d7d60  ldr     r6, [r1, r6]
000d7d62  movs    r2, r0
000d7d64  ldr     r0, [r4, r3]
000d7d66  movs    r2, r0
000d7d68  strb    r6, [r3, r7]
000d7d6a  movs    r2, r0
000d7d6c  str     r6, [r4, #0x78]
000d7d6e  movs    r2, r0
000d7d70  ldrb    r6, [r1, r6]
000d7d72  movs    r2, r0
000d7d74  adds    r6, #0xf6
000d7d76  movs    r2, r0
000d7d78  ldrb    r4, [r2, r1]
000d7d7a  movs    r2, r0
000d7d7c  str     r6, [r1]
000d7d7e  movs    r2, r0
000d7d80  ldrb    r0, [r2, r7]
000d7d82  movs    r2, r0
000d7d84  ldrb    r6, [r6, r5]
000d7d86  movs    r2, r0
000d7d88  ldr     r4, [r6, r1]
000d7d8a  movs    r2, r0
000d7d8c  ldrb    r6, [r5, r7]
000d7d8e  movs    r2, r0
000d7d90  ldr     r0, [r6, r1]
000d7d92  movs    r2, r0
000d7d94  ldrb    r6, [r2, r5]
000d7d96  movs    r2, r0
000d7d98  ldrb    r4, [r7, r4]
000d7d9a  movs    r2, r0
000d7d9c  strb    r2, [r2, r4]
000d7d9e  movs    r2, r0
000d7da0  strb    r0, [r0, r0]
000d7da2  movs    r2, r0
000d7da4  subs    r0, #0xca
000d7da6  movs    r2, r0
000d7da8  ldrh    r2, [r4, #0x20]
000d7daa  movs    r2, r1
000d7dac  subs    r0, #0x62
000d7dae  movs    r2, r0
000d7db0  ldrb    r0, [r3, #0xd]
000d7db2  movs    r2, r1
000d7db4  ldrb    r4, [r7, #6]
000d7db6  movs    r2, r1
000d7db8  ldrh    r4, [r4, #0x24]
000d7dba  movs    r2, r1
000d7dbc  ldr     r5, [sp, #0x128]
000d7dbe  movs    r2, r1
000d7dc0  ldrh    r6, [r3, #0x22]
000d7dc2  movs    r2, r1
000d7dc4  ldrh    r2, [r0, #0x22]
000d7dc6  movs    r2, r1
000d7dc8  ldrh    r4, [r1, #0x12]
000d7dca  movs    r2, r1
000d7dcc  adds    r6, #0x90
000d7dce  movs    r2, r0
000d7dd0  ldrb    r2, [r0, #6]
000d7dd2  movs    r2, r1
000d7dd4  strb    r6, [r4, #0x1f]
000d7dd6  movs    r2, r1
000d7dd8  ldrh    r6, [r1, #0x16]
000d7dda  movs    r2, r1
000d7ddc  ldr     r3, [sp, #0x1d0]
000d7dde  movs    r2, r1
000d7de0  ldrh    r0, [r1, #0x14]
000d7de2  movs    r2, r1
000d7de4  ldrh    r4, [r5, #0x12]
000d7de6  movs    r2, r1
000d7de8  cbnz    r4, #0xd7e18
000d7dea  movs    r1, r0
000d7dec  subs    r5, #0xda
000d7dee  movs    r2, r0
000d7df0  strb    r0, [r0, r7]
000d7df2  movs    r2, r0
000d7df4  strb    r6, [r6, r6]
000d7df6  movs    r2, r0
000d7df8  str     r0, [r1, #0x18]
000d7dfa  movs    r2, r0
000d7dfc  ldr     r2, [r3, r3]
000d7dfe  movs    r2, r0
000d7e00  str     r2, [r1, #0x24]
000d7e02  movs    r2, r0
000d7e04  adr     r3, #0xe0
000d7e06  movs    r2, r1
000d7e08  adr     r3, #0x110
000d7e0a  movs    r2, r1
