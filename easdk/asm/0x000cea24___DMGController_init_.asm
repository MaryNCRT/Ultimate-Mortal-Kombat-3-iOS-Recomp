========================================================================
-[DMGController init]  0x000cea24  384 bytes   DMGController.mm
========================================================================

000cea24  push    {r4, r5, r6, r7, lr}
000cea26  add     r7, sp, #0xc
000cea28  push.w  {r8, sl, fp}
000cea2c  sub     sp, #0x3c
000cea2e  ldr     r1, [pc, #0x128]
000cea30  ldr     r3, [pc, #0x128]
000cea32  str     r0, [sp, #0x34]
000cea34  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cea36  add     r3, pc ; -> 0x000fddbc  
000cea38  ldr     r6, [r1]
000cea3a  ldr     r3, [r3]
000cea3c  add     r0, sp, #0x34
000cea3e  mov     r1, r6
000cea40  str     r3, [sp, #0x38]
000cea42  blx     #0xddc08 ; -> objc_msgSendSuper2
000cea46  mov     r8, r0
000cea48  cmp     r0, #0
000cea4a  beq     #0xceb48
000cea4c  ldr     r0, [pc, #0x110]
000cea4e  ldr     r1, [pc, #0x114]
000cea50  add     r0, pc ; -> 0x000fdb80  
000cea52  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000cea54  ldr     r0, [r0]
000cea56  ldr     r1, [r1]
000cea58  blx     #0xddbfc ; -> objc_msgSend
000cea5c  ldr     r1, [pc, #0x108]
000cea5e  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
000cea60  ldr     r1, [r1]
000cea62  blx     #0xddbfc ; -> objc_msgSend
000cea66  ldr     r3, [pc, #0x104]
000cea68  ldr     r1, [pc, #0x104]
000cea6a  add     r3, pc ; -> 0x0038c1e8  prevOrientation
000cea6c  add     r1, pc ; -> 0x000fc9e4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x6c
000cea6e  ldr     r1, [r1]
000cea70  str     r1, [sp, #0xc]
000cea72  str     r0, [r3]
000cea74  ldr     r0, [pc, #0xfc]
000cea76  add     r0, pc ; -> 0x000fdb54  
000cea78  ldr     r0, [r0]
000cea7a  str     r0, [sp, #8]
000cea7c  blx     #0xddbfc ; -> objc_msgSend
000cea80  ldr     r2, [pc, #0xf4]
000cea82  add     r2, pc ; -> 0x000fcd70  'L2\x0e'
000cea84  ldr     r2, [r2]
000cea86  str     r2, [sp, #0x10]
000cea88  mov     r1, r0
000cea8a  add     r0, sp, #0x24
000cea8c  blx     #0xddc14 ; -> objc_msgSend_stret
000cea90  vldr    s12, [pc, #0xc0]
000cea94  vldr    s14, [sp, #0x2c]
000cea98  vcmpe.f32 s14, s12
000cea9c  vmrs    apsr_nzcv, fpscr
000ceaa0  ble     #0xceabc
000ceaa2  vldr    s14, [sp, #0x30]
000ceaa6  vcmpe.f32 s14, s12
000ceaaa  vmrs    apsr_nzcv, fpscr
000ceaae  ble     #0xceabc
000ceab0  ldr     r3, [pc, #0xc8]
000ceab2  movs    r2, #1
000ceab4  add     r3, pc ; -> 0x000f9e58  OBJC_IVAR_$_DMGController.mClientType
000ceab6  ldr     r3, [r3]
000ceab8  str.w   r2, [r8, r3]
000ceabc  ldr     r1, [pc, #0xc0]
000ceabe  ldr     r0, [pc, #0xc4]
000ceac0  ldr     r3, [pc, #0xc4]
000ceac2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000ceac4  add     r0, pc ; -> 0x000fdcec  
000ceac6  ldr     r4, [r1]
000ceac8  add     r3, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ceaca  ldr     r0, [r0]
000ceacc  ldr     r5, [r3]
000ceace  mov     r1, r4
000cead0  blx     #0xddbfc ; -> objc_msgSend
000cead4  mov     r1, r6
000cead6  blx     #0xddbfc ; -> objc_msgSend
000ceada  ldr     r6, [pc, #0xb0]
000ceadc  mov     r1, r4
000ceade  add     r4, sp, #0x14
000ceae0  add     r6, pc ; -> 0x000f9a2c  OBJC_IVAR_$_DMGController.window
000ceae2  str.w   r0, [r8, r5]
000ceae6  ldr     r0, [pc, #0xa8]
000ceae8  ldr.w   fp, [r6]
000ceaec  add     r0, pc ; -> 0x000fdcf0  
000ceaee  ldr     r0, [r0]
000ceaf0  blx     #0xddbfc ; -> objc_msgSend
000ceaf4  ldr     r1, [pc, #0x9c]
000ceaf6  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000ceaf8  ldr     r5, [r1]
000ceafa  ldr     r1, [sp, #0xc]
000ceafc  mov     sl, r0
000ceafe  ldr     r0, [sp, #8]
000ceb00  blx     #0xddbfc ; -> objc_msgSend
000ceb04  ldr     r2, [sp, #0x10]
000ceb06  mov     r1, r0
000ceb08  add     r0, sp, #0x14
000ceb0a  blx     #0xddc14 ; -> objc_msgSend_stret
000ceb0e  add     r0, sp, #0x1c
000ceb10  ldm     r0, {r0, r1}
000ceb12  stm.w   sp, {r0, r1}
000ceb16  mov     r1, r5
000ceb18  ldm.w   r4, {r2, r3}
000ceb1c  mov     r0, sl
000ceb1e  blx     #0xddbfc ; -> objc_msgSend
000ceb22  ldr     r1, [pc, #0x74]
000ceb24  add     r1, pc ; -> 0x000fcca0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x328
000ceb26  ldr     r1, [r1]
000ceb28  str.w   r0, [r8, fp]
000ceb2c  ldr     r0, [pc, #0x6c]
000ceb2e  add     r0, pc ; -> 0x000fdbc4  
000ceb30  ldr     r0, [r0]
000ceb32  blx     #0xddbfc ; -> objc_msgSend
000ceb36  ldr     r1, [pc, #0x68]
000ceb38  ldr     r3, [r6]
000ceb3a  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
000ceb3c  ldr     r1, [r1]
000ceb3e  mov     r2, r0
000ceb40  ldr.w   r0, [r8, r3]
000ceb44  blx     #0xddbfc ; -> objc_msgSend
000ceb48  mov     r0, r8
000ceb4a  sub.w   sp, r7, #0x18
000ceb4e  pop.w   {r8, sl, fp}
000ceb52  pop     {r4, r5, r6, r7, pc}
000ceb54  movs    r0, r0
000ceb56  add     r0, r0
000ceb58  svc     #0x48
000ceb5a  movs    r2, r0
000ceb5c  usat    r0, #2, r2
