========================================================================
-[DMGViewController openTargetURL]  0x000d04a4  228 bytes   DMGViewController.mm
========================================================================

000d04a4  push    {r4, r5, r6, r7, lr}
000d04a6  add     r7, sp, #0xc
000d04a8  push.w  {r8, sl, fp}
000d04ac  ldr     r3, [pc, #0xac]
000d04ae  mov     r4, r0
000d04b0  add     r3, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d04b2  ldr     r0, [r3]
000d04b4  ldr     r0, [r4, r0]
000d04b6  cbz     r0, #0xd04c2
000d04b8  ldr     r1, [pc, #0xa4]
000d04ba  add     r1, pc ; -> 0x000fcc50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2d8
000d04bc  ldr     r1, [r1]
000d04be  blx     #0xddbfc ; -> objc_msgSend
000d04c2  ldr     r5, [pc, #0xa0]
000d04c4  add     r5, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d04c6  ldr     r0, [r5]
000d04c8  ldr     r0, [r4, r0]
000d04ca  cmp     r0, #0
000d04cc  beq     #0xd0556
000d04ce  ldr     r1, [pc, #0x98]
000d04d0  add     r1, pc ; -> 0x000fda34  ']\x14\x0f'
000d04d2  ldr     r1, [r1]
000d04d4  blx     #0xddbfc ; -> objc_msgSend
000d04d8  uxtb    r6, r0
000d04da  cmp     r6, #0
000d04dc  bne     #0xd0556
000d04de  ldr     r1, [pc, #0x8c]
000d04e0  ldr     r3, [r5]
000d04e2  add     r1, pc ; -> 0x000fda14  'R\x14\x0f'
000d04e4  ldr.w   sl, [r1]
000d04e8  ldr     r0, [r4, r3]
000d04ea  mov     r1, sl
000d04ec  blx     #0xddbfc ; -> objc_msgSend
000d04f0  cmp     r0, #0
000d04f2  beq     #0xd0556
000d04f4  ldr     r1, [pc, #0x78]
000d04f6  ldr     r3, [r5]
000d04f8  mov     r2, r6
000d04fa  add     r1, pc ; -> 0x000fda24  
000d04fc  ldr     r0, [r4, r3]
000d04fe  ldr     r1, [r1]
000d0500  blx     #0xddbfc ; -> objc_msgSend
000d0504  ldr     r0, [pc, #0x6c]
000d0506  ldr     r1, [pc, #0x70]
000d0508  add     r0, pc ; -> 0x000fdb80  
000d050a  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000d050c  ldr     r0, [r0]
000d050e  ldr     r1, [r1]
000d0510  blx     #0xddbfc ; -> objc_msgSend
000d0514  ldr     r1, [pc, #0x64]
000d0516  ldr     r3, [r5]
000d0518  add     r1, pc ; -> 0x000fcbac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x234
000d051a  ldr.w   r8, [r1]
000d051e  mov     r1, sl
000d0520  mov     fp, r0
000d0522  ldr     r0, [r4, r3]
000d0524  blx     #0xddbfc ; -> objc_msgSend
000d0528  mov     r1, r8
000d052a  mov     r2, r0
000d052c  mov     r0, fp
000d052e  blx     #0xddbfc ; -> objc_msgSend
000d0532  ldr     r3, [r5]
000d0534  mov     r1, sl
000d0536  ldr     r0, [r4, r3]
000d0538  blx     #0xddbfc ; -> objc_msgSend
000d053c  ldr     r1, [pc, #0x40]
000d053e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d0540  ldr     r1, [r1]
000d0542  blx     #0xddbfc ; -> objc_msgSend
000d0546  ldr     r1, [pc, #0x3c]
000d0548  ldr     r0, [r5]
000d054a  mov     r2, r6
000d054c  add     r1, pc ; -> 0x000fda78  
000d054e  ldr     r0, [r4, r0]
000d0550  ldr     r1, [r1]
000d0552  blx     #0xddbfc ; -> objc_msgSend
000d0556  pop.w   {r8, sl, fp}
000d055a  pop     {r4, r5, r6, r7, pc}
000d055c  ldr     r6, [sp, #0x50]
000d055e  movs    r2, r0
000d0560  stm     r7!, {r1, r4, r7}
000d0562  movs    r2, r0
000d0564  ldr     r5, [sp, #0x370]
000d0566  movs    r2, r0
000d0568  bpl     #0xd062c
000d056a  movs    r2, r0
000d056c  bpl     #0xd05cc
000d056e  movs    r2, r0
000d0570  bpl     #0xd05c0
000d0572  movs    r2, r0
000d0574  bvs     #0xd0660
000d0576  movs    r2, r0
000d0578  stm     r5!, {r1, r4, r5, r6, r7}
000d057a  movs    r2, r0
000d057c  stm     r6!, {r4, r7}
000d057e  movs    r2, r0
000d0580  stm     r4!, {r1, r3, r4, r5}
000d0582  movs    r2, r0
000d0584  bpl     #0xd05d8
000d0586  movs    r2, r0
