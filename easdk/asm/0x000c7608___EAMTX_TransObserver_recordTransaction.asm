========================================================================
-[EAMTX_TransObserver recordTransaction  0x000c7608  516 bytes   EAMTX_TransObserver.mm
========================================================================

000c7608  push    {r4, r5, r6, r7, lr}
000c760a  add     r7, sp, #0xc
000c760c  push.w  {r8, sl, fp}
000c7610  sub     sp, #0x20
000c7612  ldr     r1, [pc, #0x184]
000c7614  str     r0, [sp, #4]
000c7616  ldr     r0, [pc, #0x184]
000c7618  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c761a  str     r2, [sp]
000c761c  add     r0, pc ; -> 0x000fdb5c  
000c761e  ldr     r5, [r1]
000c7620  ldr     r6, [r0]
000c7622  ldr     r2, [pc, #0x17c]
000c7624  ldr     r4, [pc, #0x17c]
000c7626  mov     r1, r5
000c7628  add     r2, pc ; -> 0x00181544  
000c762a  mov     r0, r6
000c762c  blx     #0xddbfc ; -> objc_msgSend
000c7630  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7634  ldr     r1, [pc, #0x170]
000c7636  ldr     r0, [sp]
000c7638  add     r4, pc ; -> 0x0017ef54  
000c763a  add     r1, pc ; -> 0x000fd71c  
000c763c  ldr     r1, [r1]
000c763e  blx     #0xddbfc ; -> objc_msgSend
000c7642  ldr     r3, [pc, #0x168]
000c7644  ldr     r1, [pc, #0x168]
000c7646  add     r3, pc ; -> 0x000f3284  transId
000c7648  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c764a  ldr     r3, [r3]
000c764c  ldr     r1, [r1]
000c764e  str     r1, [sp, #8]
000c7650  str     r0, [r3]
000c7652  blx     #0xddbfc ; -> objc_msgSend
000c7656  ldr     r1, [pc, #0x15c]
000c7658  ldr     r0, [sp]
000c765a  add     r1, pc ; -> 0x000fd718  
000c765c  ldr     r1, [r1]
000c765e  blx     #0xddbfc ; -> objc_msgSend
000c7662  mov     r1, r5
000c7664  mov     r2, r4
000c7666  movs    r5, #0
000c7668  mov     r3, r0
000c766a  mov     r0, r6
000c766c  blx     #0xddbfc ; -> objc_msgSend
000c7670  ldr     r3, [pc, #0x144]
000c7672  ldr     r1, [sp, #8]
000c7674  add     r3, pc ; -> 0x000f3268  receipt
000c7676  ldr     r3, [r3]
000c7678  str     r0, [r3]
000c767a  blx     #0xddbfc ; -> objc_msgSend
000c767e  ldr     r0, [pc, #0x13c]
000c7680  ldr     r1, [pc, #0x13c]
000c7682  add     r0, pc ; -> 0x000f3274  mtxProdsList
000c7684  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000c7686  ldr     r0, [r0]
000c7688  ldr     r1, [r1]
000c768a  ldr     r0, [r0]
000c768c  blx     #0xddbfc ; -> objc_msgSend
000c7690  ldr     r1, [pc, #0x130]
000c7692  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c7694  ldr     r1, [r1]
000c7696  str     r1, [sp, #0xc]
000c7698  ldr     r1, [pc, #0x12c]
000c769a  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c769c  ldr     r1, [r1]
000c769e  str     r1, [sp, #0x10]
000c76a0  ldr     r1, [pc, #0x128]
000c76a2  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000c76a4  ldr     r1, [r1]
000c76a6  str     r1, [sp, #0x14]
000c76a8  ldr     r1, [pc, #0x124]
000c76aa  mov     r8, r0
000c76ac  add     r1, pc ; -> 0x000fd60c  
000c76ae  ldr     r1, [r1]
000c76b0  str     r1, [sp, #0x18]
000c76b2  ldr     r1, [pc, #0x120]
000c76b4  add     r1, pc ; -> 0x000fd16c  
000c76b6  ldr     r1, [r1]
000c76b8  str     r1, [sp, #0x1c]
000c76ba  ldr     r1, [pc, #0x11c]
000c76bc  add     r1, pc ; -> 0x000fd720  
000c76be  ldr.w   fp, [r1]
000c76c2  ldr     r1, [pc, #0x118]
000c76c4  add     r1, pc ; -> 0x000fd724  
000c76c6  ldr.w   sl, [r1]
000c76ca  b       #0xc7764
000c76cc  ldr     r3, [pc, #0x110]
000c76ce  ldr     r1, [sp, #0x14]
000c76d0  mov     r2, r5
000c76d2  add     r3, pc ; -> 0x000f3274  mtxProdsList
000c76d4  ldr     r0, [r3]
000c76d6  ldr     r4, [r0]
000c76d8  mov     r0, r8
000c76da  blx     #0xddbfc ; -> objc_msgSend
000c76de  ldr     r1, [sp, #0x10]
000c76e0  mov     r2, r0
000c76e2  mov     r0, r4
000c76e4  blx     #0xddbfc ; -> objc_msgSend
000c76e8  ldr     r1, [sp, #0x18]
000c76ea  mov     r6, r0
000c76ec  blx     #0xddbfc ; -> objc_msgSend
000c76f0  mov     r1, fp
000c76f2  mov     r4, r0
000c76f4  ldr     r0, [sp]
000c76f6  blx     #0xddbfc ; -> objc_msgSend
000c76fa  mov     r1, sl
000c76fc  blx     #0xddbfc ; -> objc_msgSend
000c7700  ldr     r1, [sp, #0x1c]
000c7702  mov     r2, r0
000c7704  mov     r0, r4
000c7706  blx     #0xddbfc ; -> objc_msgSend
000c770a  cmp     r0, #0
000c770c  bne     #0xc7762
000c770e  ldr     r1, [pc, #0xd4]
000c7710  mov     r0, r6
000c7712  add     r1, pc ; -> 0x000fd3d8  
000c7714  ldr     r1, [r1]
000c7716  blx     #0xddbfc ; -> objc_msgSend
000c771a  ldr     r3, [pc, #0xcc]
000c771c  ldr     r1, [pc, #0xcc]
000c771e  add     r3, pc ; -> 0x000f3318  iItemSellId
000c7720  add     r1, pc ; -> 0x000fd608  
000c7722  ldr     r3, [r3]
000c7724  ldr     r1, [r1]
000c7726  str     r0, [r3]
000c7728  mov     r0, r6
000c772a  blx     #0xddbfc ; -> objc_msgSend
000c772e  ldr     r3, [pc, #0xc0]
000c7730  add     r3, pc ; -> 0x000f327c  iItemPrice
000c7732  ldr     r3, [r3]
000c7734  stm.w   r3, {r0, r1}
000c7738  ldr     r3, [pc, #0xb8]
000c773a  add     r3, pc ; -> 0x000f331c  currency
000c773c  ldr     r4, [r3]
000c773e  ldr     r0, [r4]
000c7740  cbz     r0, #0xc774c
000c7742  ldr     r1, [pc, #0xb4]
000c7744  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c7746  ldr     r1, [r1]
000c7748  blx     #0xddbfc ; -> objc_msgSend
000c774c  ldr     r1, [pc, #0xac]
000c774e  mov     r0, r6
000c7750  add     r1, pc ; -> 0x000fd714  '|\x02\x0f'
000c7752  ldr     r1, [r1]
000c7754  blx     #0xddbfc ; -> objc_msgSend
000c7758  ldr     r1, [sp, #8]
000c775a  str     r0, [r4]
000c775c  blx     #0xddbfc ; -> objc_msgSend
000c7760  b       #0xc7770
000c7762  adds    r5, #1
000c7764  mov     r0, r8
000c7766  ldr     r1, [sp, #0xc]
000c7768  blx     #0xddbfc ; -> objc_msgSend
000c776c  cmp     r0, r5
000c776e  bhi     #0xc76cc
000c7770  ldr     r0, [pc, #0x8c]
000c7772  ldr     r3, [pc, #0x90]
000c7774  ldr     r1, [pc, #0x90]
000c7776  add     r0, pc ; -> 0x000f3270  mtxController
000c7778  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c777a  ldr     r2, [sp, #4]
000c777c  ldr     r0, [r0]
000c777e  ldr     r3, [r3]
000c7780  add     r1, pc ; -> 0x000fd6d4  
000c7782  ldr     r0, [r0]
000c7784  ldr     r3, [r2, r3]
000c7786  ldr     r1, [r1]
000c7788  movs    r2, #0x12
000c778a  blx     #0xddbfc ; -> objc_msgSend
000c778e  sub.w   sp, r7, #0x18
000c7792  pop.w   {r8, sl, fp}
000c7796  pop     {r4, r5, r6, r7, pc}
000c7798  strb    r4, [r0, r2]
000c779a  movs    r3, r0
000c779c  str     r4, [r7, #0x50]
000c779e  movs    r3, r0
000c77a0  ldr     r7, [sp, #0x60]
000c77a2  movs    r3, r1
000c77a4  ldrb    r0, [r3, #4]
000c77a6  movs    r3, r1
000c77a8  str     r6, [r3, #0xc]
000c77aa  movs    r3, r0
000c77ac  pop     {r1, r3, r4, r5}
000c77ae  movs    r2, r0
000c77b0  ldrsb   r4, [r0, r2]
000c77b2  movs    r3, r0
000c77b4  str     r2, [r7, #8]
000c77b6  movs    r3, r0
000c77b8  cbnz    r0, #0xc7838
000c77ba  movs    r2, r0
000c77bc  cbnz    r6, #0xc783a
000c77be  movs    r2, r0
000c77c0  ldrsb   r0, [r5, r7]
000c77c2  movs    r3, r0
000c77c4  strh    r2, [r5, r7]
000c77c6  movs    r3, r0
000c77c8  strb    r2, [r2, r1]
000c77ca  movs    r3, r0
000c77cc  strh    r6, [r2, r7]
000c77ce  movs    r3, r0
000c77d0  ldrsh   r4, [r3, r5]
000c77d2  movs    r3, r0
000c77d4  ldrh    r4, [r6, r2]
000c77d6  movs    r3, r0
000c77d8  str     r0, [r4, #4]
000c77da  movs    r3, r0
000c77dc  str     r4, [r3, #4]
000c77de  movs    r3, r0
000c77e0  cbnz    r6, #0xc784a
000c77e2  movs    r2, r0
000c77e4  ldrb    r2, [r0, r3]
000c77e6  movs    r3, r0
000c77e8  cbnz    r6, #0xc7868
000c77ea  movs    r2, r0
000c77ec  ldrsh   r4, [r4, r3]
000c77ee  movs    r3, r0
000c77f0  cbnz    r0, #0xc7846
000c77f2  movs    r2, r0
000c77f4  cbnz    r6, #0xc786e
000c77f6  movs    r2, r0
000c77f8  strh    r4, [r6, r0]
000c77fa  movs    r3, r0
000c77fc  ldrsh   r0, [r0, r7]
000c77fe  movs    r3, r0
000c7800  revsh   r6, r6
000c7802  movs    r2, r0
000c7804  lsrs    r0, r2, #1
000c7806  movs    r3, r0
000c7808  ldrsh   r0, [r2, r5]
000c780a  movs    r3, r0
