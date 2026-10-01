========================================================================
MTXDMG_EnterMoreGames  0x000cfc5c  304 bytes   EAMTX_DMGController.mm
========================================================================

000cfc5c  push    {r4, r5, r6, r7, lr}
000cfc5e  add     r7, sp, #0xc
000cfc60  push.w  {r8, sl, fp}
000cfc64  ldr     r4, [pc, #0xd8]
000cfc66  mov     sl, r3
000cfc68  ldr     r3, [pc, #0xd8]
000cfc6a  mov     r5, r0
000cfc6c  ldr     r0, [pc, #0xd8]
000cfc6e  add     r3, pc ; -> 0x0038c1f8  bShowingMoreGames
000cfc70  add     r4, pc ; -> 0x0038c1f0  gpImgLoader
000cfc72  add     r0, pc ; -> 0x000cf9b1  ZL18DMGMTXEventHandler11MTX_EventIDiPv
000cfc74  mov     r6, r1
000cfc76  mov     r8, r2
000cfc78  mov.w   fp, #1
000cfc7c  strb.w  fp, [r3]
000cfc80  bl      #0xb753c ; -> Z19MTX_RegisterHandlerPFv11MTX_EventIDiPvE
000cfc84  ldr     r3, [r4]
000cfc86  cbnz    r3, #0xcfca4
000cfc88  ldr     r0, [pc, #0xc0]
000cfc8a  ldr     r1, [pc, #0xc4]
000cfc8c  add     r0, pc ; -> 0x000fdce0  
000cfc8e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cfc90  ldr     r0, [r0]
000cfc92  ldr     r1, [r1]
000cfc94  blx     #0xddbfc ; -> objc_msgSend
000cfc98  ldr     r1, [pc, #0xb8]
000cfc9a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cfc9c  ldr     r1, [r1]
000cfc9e  blx     #0xddbfc ; -> objc_msgSend
000cfca2  str     r0, [r4]
000cfca4  ldr     r0, [pc, #0xb0]
000cfca6  ldr     r1, [pc, #0xb4]
000cfca8  add     r0, pc ; -> 0x000fdce4  
000cfcaa  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cfcac  ldr     r0, [r0]
000cfcae  ldr     r1, [r1]
000cfcb0  blx     #0xddbfc ; -> objc_msgSend
000cfcb4  ldr     r1, [pc, #0xa8]
000cfcb6  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cfcb8  ldr     r1, [r1]
000cfcba  blx     #0xddbfc ; -> objc_msgSend
000cfcbe  ldr     r3, [pc, #0xa4]
000cfcc0  add     r3, pc ; -> 0x0017cfdc  gpDMGController
000cfcc2  str     r0, [r3]
000cfcc4  cmp     r0, #0
000cfcc6  beq     #0xcfd3a
000cfcc8  ldr     r1, [pc, #0x9c]
000cfcca  mov     r2, r5
000cfccc  ldr     r4, [pc, #0x9c]
000cfcce  add     r1, pc ; -> 0x000fd8b4  
000cfcd0  ldr     r1, [r1]
000cfcd2  blx     #0xddbfc ; -> objc_msgSend
000cfcd6  ldr     r1, [pc, #0x98]
000cfcd8  add     r4, pc ; -> 0x0017cfdc  gpDMGController
000cfcda  mov     r2, r6
000cfcdc  add     r1, pc ; -> 0x000fd8b0  
000cfcde  ldr     r0, [r4]
000cfce0  ldr     r1, [r1]
000cfce2  blx     #0xddbfc ; -> objc_msgSend
000cfce6  ldr     r1, [pc, #0x8c]
000cfce8  ldr     r0, [r4]
000cfcea  ldr     r2, [sp, #0x24]
000cfcec  add     r1, pc ; -> 0x000fd8ac  
000cfcee  ldr     r1, [r1]
000cfcf0  blx     #0xddbfc ; -> objc_msgSend
000cfcf4  ldr     r1, [pc, #0x80]
000cfcf6  ldr     r0, [r4]
000cfcf8  mov     r2, r8
000cfcfa  add     r1, pc ; -> 0x000fd8a8  
000cfcfc  ldr     r1, [r1]
000cfcfe  blx     #0xddbfc ; -> objc_msgSend
000cfd02  ldr     r1, [pc, #0x78]
000cfd04  ldr     r0, [r4]
000cfd06  mov     r2, sl
000cfd08  add     r1, pc ; -> 0x000fd8a4  
000cfd0a  ldr     r1, [r1]
000cfd0c  blx     #0xddbfc ; -> objc_msgSend
000cfd10  ldr     r1, [pc, #0x6c]
000cfd12  ldr     r0, [r4]
000cfd14  ldr     r2, [sp, #0x20]
000cfd16  add     r1, pc ; -> 0x000fd8a0  
000cfd18  ldr     r1, [r1]
000cfd1a  blx     #0xddbfc ; -> objc_msgSend
000cfd1e  ldr     r1, [pc, #0x64]
000cfd20  ldr     r0, [r4]
000cfd22  ldr     r2, [sp, #0x28]
000cfd24  add     r1, pc ; -> 0x000fd89c  
000cfd26  ldr     r1, [r1]
000cfd28  blx     #0xddbfc ; -> objc_msgSend
000cfd2c  ldr     r1, [pc, #0x58]
000cfd2e  ldr     r0, [r4]
000cfd30  add     r1, pc ; -> 0x000fd898  
000cfd32  ldr     r1, [r1]
000cfd34  blx     #0xddbfc ; -> objc_msgSend
000cfd38  mov     r0, fp
000cfd3a  pop.w   {r8, sl, fp}
000cfd3e  pop     {r4, r5, r6, r7, pc}
000cfd40  stm     r5!, {r2, r3, r4, r5, r6}
000cfd42  movs    r3, r5
000cfd44  stm     r5!, {r1, r2, r7}
000cfd46  movs    r3, r5
000cfd48  ldc2    p15, c15, [fp, #-0x3fc]!
000cfd4c  b       #0xcfdf0
000cfd4e  movs    r2, r0
000cfd50  ldm     r4, {r1, r4, r5, r6, r7}
000cfd52  movs    r2, r0
000cfd54  ldm     r4!, {r1, r5, r6, r7}
000cfd56  movs    r2, r0
000cfd58  b       #0xcfdcc
000cfd5a  movs    r2, r0
000cfd5c  ldm     r4, {r1, r2, r4, r6, r7}
000cfd5e  movs    r2, r0
000cfd60  ldm     r4!, {r1, r2, r6, r7}
000cfd62  movs    r2, r0
000cfd64  blo     #0xcfd98
000cfd66  movs    r2, r1
000cfd68  blt     #0xcfd30
000cfd6a  movs    r2, r0
000cfd6c  blo     #0xcfd70
000cfd6e  movs    r2, r1
000cfd70  blt     #0xcfd14
000cfd72  movs    r2, r0
000cfd74  blt     #0xcfcf0
000cfd76  movs    r2, r0
000cfd78  blt     #0xcfcd0
000cfd7a  movs    r2, r0
000cfd7c  blt     #0xcfcb0
000cfd7e  movs    r2, r0
000cfd80  blt     #0xcfc90
000cfd82  movs    r2, r0
000cfd84  blt     #0xcfe70
000cfd86  movs    r2, r0
000cfd88  blt     #0xcfe54
000cfd8a  movs    r2, r0
