========================================================================
-[Facebook handleOpenURL  0x000da958  516 bytes   Facebook.m
========================================================================

000da958  push    {r4, r5, r6, r7, lr}
000da95a  add     r7, sp, #0xc
000da95c  push.w  {r8, sl, fp}
000da960  ldr     r1, [pc, #0x18c]
000da962  mov     sl, r0
000da964  mov     r0, r2
000da966  add     r1, pc ; -> 0x000fda18  '\r!\x0f'
000da968  mov     r4, r2
000da96a  ldr     r1, [r1]
000da96c  blx     #0xddbfc ; -> objc_msgSend
000da970  ldr     r1, [pc, #0x180]
000da972  ldr     r3, [pc, #0x184]
000da974  ldr     r2, [pc, #0x184]
000da976  add     r1, pc ; -> 0x000fd1c0  
000da978  add     r3, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000da97a  ldr     r5, [r1]
000da97c  ldr     r1, [pc, #0x180]
000da97e  ldr     r3, [r3]
000da980  add     r2, pc ; -> 0x001829b4  
000da982  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000da984  ldr.w   r3, [sl, r3]
000da988  ldr     r1, [r1]
000da98a  mov     r6, r0
000da98c  ldr     r0, [pc, #0x174]
000da98e  add     r0, pc ; -> 0x000fdb5c  
000da990  ldr     r0, [r0]
000da992  blx     #0xddbfc ; -> objc_msgSend
000da996  mov     r1, r5
000da998  mov     r2, r0
000da99a  mov     r0, r6
000da99c  blx     #0xddbfc ; -> objc_msgSend
000da9a0  uxtb    r0, r0
000da9a2  cmp     r0, #0
000da9a4  beq.w   #0xdaae6
000da9a8  ldr     r1, [pc, #0x15c]
000da9aa  mov     r0, r4
000da9ac  add     r1, pc ; -> 0x000fda20  '(!\x0f'
000da9ae  ldr     r1, [r1]
000da9b0  blx     #0xddbfc ; -> objc_msgSend
000da9b4  mov     r2, r0
000da9b6  cbnz    r0, #0xda9c8
000da9b8  ldr.w   r1, [pc, #0x150]
000da9bc  mov     r0, r4
000da9be  add     r1, pc ; -> 0x000fcdb8  
000da9c0  ldr     r1, [r1]
000da9c2  blx     #0xddbfc ; -> objc_msgSend
000da9c6  mov     r2, r0
000da9c8  ldr     r1, [pc, #0x144]
000da9ca  mov     r0, sl
000da9cc  add     r1, pc ; -> 0x000fdadc  
000da9ce  ldr     r1, [r1]
000da9d0  blx     #0xddbfc ; -> objc_msgSend
000da9d4  ldr     r1, [pc, #0x13c]
000da9d6  ldr     r2, [pc, #0x140]
000da9d8  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000da9da  add     r2, pc ; -> 0x001829a4  
000da9dc  ldr     r4, [r1]
000da9de  mov     r1, r4
000da9e0  mov     r5, r0
000da9e2  blx     #0xddbfc ; -> objc_msgSend
000da9e6  mov     r6, r0
000da9e8  cmp     r0, #0
000da9ea  bne     #0xdaa70
000da9ec  ldr     r2, [pc, #0x12c]
000da9ee  mov     r0, r5
000da9f0  mov     r1, r4
000da9f2  add     r2, pc ; -> 0x0017f064  
000da9f4  blx     #0xddbfc ; -> objc_msgSend
000da9f8  mov     r8, r0
000da9fa  cbz     r0, #0xdaa30
000da9fc  ldr     r1, [pc, #0x120]
000da9fe  ldr     r2, [pc, #0x124]
000daa00  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000daa02  add     r2, pc ; -> 0x001829c4  
000daa04  ldr.w   fp, [r1]
000daa08  mov     r1, fp
000daa0a  blx     #0xddbfc ; -> objc_msgSend
000daa0e  tst.w   r0, #0xff
000daa12  beq     #0xdaad2
000daa14  ldr     r1, [pc, #0x110]
000daa16  movs    r3, #1
000daa18  mov     r0, sl
000daa1a  add     r1, pc ; -> 0x000fdae0  
000daa1c  mov     r2, r6
000daa1e  ldr     r1, [r1]
000daa20  b       #0xdaaca
000daa22  ldr     r1, [pc, #0x108]
000daa24  movs    r2, #0
000daa26  mov     r0, sl
000daa28  add     r1, pc ; -> 0x000fdae0  
000daa2a  mov     r3, r2
000daa2c  ldr     r1, [r1]
000daa2e  b       #0xdaaca
000daa30  ldr     r2, [pc, #0xfc]
000daa32  mov     r0, r5
000daa34  mov     r1, r4
000daa36  add     r2, pc ; -> 0x0017eb74  
000daa38  blx     #0xddbfc ; -> objc_msgSend
000daa3c  cbnz    r0, #0xdaa5e
000daa3e  cmp.w   r8, #0
000daa42  beq     #0xdaa5a
000daa44  ldr     r1, [pc, #0xec]
000daa46  ldr     r2, [pc, #0xf0]
000daa48  mov     r0, r8
000daa4a  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000daa4c  add     r2, pc ; -> 0x001829d4  
000daa4e  ldr     r1, [r1]
000daa50  blx     #0xddbfc ; -> objc_msgSend
000daa54  tst.w   r0, #0xff
000daa58  beq     #0xdaa5e
000daa5a  movs    r2, #1
000daa5c  b       #0xdaa60
000daa5e  movs    r2, #0
000daa60  ldr     r1, [pc, #0xd8]
000daa62  sxtb    r2, r2
000daa64  mov     r0, sl
000daa66  add     r1, pc ; -> 0x000fdad8  
000daa68  ldr     r1, [r1]
000daa6a  blx     #0xddbfc ; -> objc_msgSend
000daa6e  b       #0xdaace
000daa70  ldr     r2, [pc, #0xcc]
000daa72  mov     r1, r4
000daa74  mov     r0, r5
000daa76  add     r2, pc ; -> 0x001829e4  
000daa78  blx     #0xddbfc ; -> objc_msgSend
000daa7c  ldr     r1, [pc, #0xc4]
000daa7e  add     r1, pc ; -> 0x000fdad4  'm%\x0f'
000daa80  ldr     r1, [r1]
000daa82  mov     r4, r0
000daa84  ldr     r0, [pc, #0xc0]
000daa86  add     r0, pc ; -> 0x000fdbb4  
000daa88  ldr.w   r8, [r0]
000daa8c  mov     r0, r8
000daa8e  blx     #0xddbfc ; -> objc_msgSend
000daa92  mov     r5, r0
000daa94  cbz     r4, #0xdaabe
000daa96  ldr     r1, [pc, #0xb4]
000daa98  mov     r0, r4
000daa9a  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000daa9c  ldr     r1, [r1]
000daa9e  blx     #0xddbfc ; -> objc_msgSend
000daaa2  cbz     r0, #0xdaabe
000daaa4  vmov    s12, r0
000daaa8  vcvt.f64.s32 d7, s12
000daaac  ldr     r1, [pc, #0xa0]
000daaae  mov     r0, r8
000daab0  add     r1, pc ; -> 0x000fdad0  'O%\x0f'
000daab2  ldr     r1, [r1]
000daab4  vmov    r2, r3, d7
000daab8  blx     #0xddbfc ; -> objc_msgSend
000daabc  mov     r5, r0
000daabe  ldr     r1, [pc, #0x94]
000daac0  mov     r0, sl
000daac2  mov     r2, r6
000daac4  add     r1, pc ; -> 0x000fdacc  
000daac6  mov     r3, r5
000daac8  ldr     r1, [r1]
000daaca  blx     #0xddbfc ; -> objc_msgSend
000daace  movs    r0, #1
000daad0  b       #0xdaae6
000daad2  ldr     r2, [pc, #0x84]
000daad4  mov     r0, r8
000daad6  mov     r1, fp
000daad8  add     r2, pc ; -> 0x001829f4  
000daada  blx     #0xddbfc ; -> objc_msgSend
000daade  tst.w   r0, #0xff
000daae2  beq     #0xdaa30
000daae4  b       #0xdaa22
000daae6  sxtb    r0, r0
000daae8  pop.w   {r8, sl, fp}
000daaec  pop     {r4, r5, r6, r7, pc}
000daaee  nop     
000daaf0  adds    r0, #0xae
000daaf2  movs    r2, r0
000daaf4  cmp     r0, #0x46
000daaf6  movs    r2, r0
000daaf8  subs    r0, r4, r6
000daafa  movs    r2, r0
000daafc  strh    r0, [r6]
000daafe  movs    r2, r1
000dab00  movs    r1, #0x1a
000dab02  movs    r2, r0
000dab04  adds    r1, #0xca
000dab06  movs    r2, r0
000dab08  adds    r0, #0x70
000dab0a  movs    r2, r0
000dab0c  movs    r3, #0xf6
000dab0e  movs    r2, r0
000dab10  adds    r1, #0xc
000dab12  movs    r2, r0
000dab14  movs    r1, #0x14
000dab16  movs    r2, r0
000dab18  ldrb    r6, [r0, #0x1f]
000dab1a  movs    r2, r1
000dab1c  mov     r6, sp
000dab1e  movs    r2, r1
000dab20  movs    r1, #4
000dab22  movs    r2, r0
000dab24  ldrb    r6, [r7, #0x1e]
000dab26  movs    r2, r1
000dab28  adds    r0, #0xc2
000dab2a  movs    r2, r0
000dab2c  adds    r0, #0xb4
000dab2e  movs    r2, r0
000dab30  asrs    r2, r7
000dab32  movs    r2, r1
000dab34  movs    r0, #0xba
000dab36  movs    r2, r0
000dab38  ldrb    r4, [r0, #0x1e]
000dab3a  movs    r2, r1
000dab3c  adds    r0, #0x6e
000dab3e  movs    r2, r0
000dab40  ldrb    r2, [r5, #0x1d]
000dab42  movs    r2, r1
000dab44  adds    r0, #0x52
000dab46  movs    r2, r0
000dab48  adds    r1, #0x2a
000dab4a  movs    r2, r0
000dab4c  movs    r0, #0x4a
000dab4e  movs    r2, r0
000dab50  adds    r0, #0x1c
000dab52  movs    r2, r0
000dab54  adds    r0, #4
000dab56  movs    r2, r0
000dab58  ldrb    r0, [r3, #0x1c]
000dab5a  movs    r2, r1
