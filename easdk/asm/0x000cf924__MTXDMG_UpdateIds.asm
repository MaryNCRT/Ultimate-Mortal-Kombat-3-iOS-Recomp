========================================================================
MTXDMG_UpdateIds  0x000cf924  140 bytes   EAMTX_DMGController.mm
========================================================================

000cf924  push    {r4, r5, r6, r7, lr}
000cf926  add     r7, sp, #0xc
000cf928  str     r8, [sp, #-0x4]!
000cf92c  ldr     r4, [pc, #0x64]
000cf92e  mov     ip, r0
000cf930  mov     r5, r1
000cf932  add     r4, pc ; -> 0x0017cfdc  gpDMGController
000cf934  mov     r6, r2
000cf936  ldr     r0, [r4]
000cf938  mov     r8, r3
000cf93a  cbz     r0, #0xcf98c
000cf93c  ldr     r1, [pc, #0x58]
000cf93e  mov     r2, ip
000cf940  add     r1, pc ; -> 0x000fd8b4  
000cf942  ldr     r1, [r1]
000cf944  blx     #0xddbfc ; -> objc_msgSend
000cf948  ldr     r1, [pc, #0x50]
000cf94a  ldr     r0, [r4]
000cf94c  mov     r2, r5
000cf94e  add     r1, pc ; -> 0x000fd8b0  
000cf950  ldr     r1, [r1]
000cf952  blx     #0xddbfc ; -> objc_msgSend
000cf956  ldr     r1, [pc, #0x48]
000cf958  ldr     r0, [r4]
000cf95a  ldr     r2, [sp, #0x18]
000cf95c  add     r1, pc ; -> 0x000fd8ac  
000cf95e  ldr     r1, [r1]
000cf960  blx     #0xddbfc ; -> objc_msgSend
000cf964  ldr     r1, [pc, #0x3c]
000cf966  ldr     r0, [r4]
000cf968  mov     r2, r6
000cf96a  add     r1, pc ; -> 0x000fd8a8  
000cf96c  ldr     r1, [r1]
000cf96e  blx     #0xddbfc ; -> objc_msgSend
000cf972  ldr     r1, [pc, #0x34]
000cf974  ldr     r0, [r4]
000cf976  mov     r2, r8
000cf978  add     r1, pc ; -> 0x000fd8a0  
000cf97a  ldr     r1, [r1]
000cf97c  blx     #0xddbfc ; -> objc_msgSend
000cf980  ldr     r1, [pc, #0x28]
000cf982  ldr     r0, [r4]
000cf984  add     r1, pc ; -> 0x000fd898  
000cf986  ldr     r1, [r1]
000cf988  blx     #0xddbfc ; -> objc_msgSend
000cf98c  ldr     r8, [sp], #4
000cf990  pop     {r4, r5, r6, r7, pc}
000cf992  nop     
000cf994  bvs     #0xcf8e4
000cf996  movs    r2, r1
000cf998  svc     #0x70
000cf99a  movs    r2, r0
000cf99c  svc     #0x5e
000cf99e  movs    r2, r0
000cf9a0  svc     #0x4c
000cf9a2  movs    r2, r0
000cf9a4  svc     #0x3a
000cf9a6  movs    r2, r0
000cf9a8  svc     #0x24
000cf9aa  movs    r2, r0
000cf9ac  svc     #0x10
000cf9ae  movs    r2, r0
