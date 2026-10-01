========================================================================
ZN6Mayhem7Request11HandleErrorEPv  0x0008b870  304 bytes   Mayhem.mm
========================================================================

0008b870  push    {r4, r5, r6, r7, lr}
0008b872  add     r7, sp, #0xc
0008b874  push.w  {r8, sl, fp}
0008b878  ldr     r3, [pc, #0xec]
0008b87a  ldr     r2, [pc, #0xf0]
0008b87c  mov     fp, r0
0008b87e  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
0008b880  add     r2, pc ; -> 0x0017f064  
0008b882  ldr     r6, [r3]
0008b884  mov     r0, r1
0008b886  mov     r1, r6
0008b888  blx     #0xddbfc ; -> objc_msgSend
0008b88c  ldr     r1, [pc, #0xe0]
0008b88e  movs    r2, #0
0008b890  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
0008b892  ldr     r1, [r1]
0008b894  blx     #0xddbfc ; -> objc_msgSend
0008b898  mov     r4, r0
0008b89a  cmp     r0, #0
0008b89c  beq     #0x8b960
0008b89e  ldr     r1, [pc, #0xd4]
0008b8a0  add     r1, pc ; -> 0x000fcfac  'hS\x0e'
0008b8a2  ldr     r5, [r1]
0008b8a4  mov     r1, r5
0008b8a6  blx     #0xddbfc ; -> objc_msgSend
0008b8aa  ldr     r2, [pc, #0xcc]
0008b8ac  mov     r1, r6
0008b8ae  add     r2, pc ; -> 0x0017f074  
0008b8b0  blx     #0xddbfc ; -> objc_msgSend
0008b8b4  mov     r1, r5
0008b8b6  mov     r8, r0
0008b8b8  mov     r0, r4
0008b8ba  blx     #0xddbfc ; -> objc_msgSend
0008b8be  ldr     r2, [pc, #0xbc]
0008b8c0  mov     r1, r6
0008b8c2  add     r2, pc ; -> 0x0017e754  
0008b8c4  blx     #0xddbfc ; -> objc_msgSend
0008b8c8  mov     r1, r5
0008b8ca  mov     sl, r0
0008b8cc  mov     r0, r4
0008b8ce  blx     #0xddbfc ; -> objc_msgSend
0008b8d2  ldr     r2, [pc, #0xac]
0008b8d4  mov     r1, r6
0008b8d6  add     r2, pc ; -> 0x0017f084  
0008b8d8  blx     #0xddbfc ; -> objc_msgSend
0008b8dc  mov     r5, r0
0008b8de  cmp.w   r8, #0
0008b8e2  beq     #0x8b8f4
0008b8e4  ldr     r1, [pc, #0x9c]
0008b8e6  mov     r0, r8
0008b8e8  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
0008b8ea  ldr     r1, [r1]
0008b8ec  blx     #0xddbfc ; -> objc_msgSend
0008b8f0  str.w   r0, [fp, #0x14]
0008b8f4  cmp.w   sl, #0
0008b8f8  beq     #0x8b92c
0008b8fa  ldr     r1, [pc, #0x8c]
0008b8fc  ldr     r0, [pc, #0x8c]
0008b8fe  add     r1, pc ; -> 0x000fcf68  
0008b900  add     r0, pc ; -> 0x000fdb5c  
0008b902  ldr     r4, [r1]
0008b904  ldr     r1, [pc, #0x88]
0008b906  ldr     r0, [r0]
0008b908  add     r1, pc ; -> 0x000fcf58  
0008b90a  ldr     r1, [r1]
0008b90c  blx     #0xddbfc ; -> objc_msgSend
0008b910  mov     r1, r4
0008b912  mov     r2, r0
0008b914  mov     r0, sl
0008b916  blx     #0xddbfc ; -> objc_msgSend
0008b91a  mov     r4, r0
0008b91c  blx     #0xdde0c ; -> strlen
0008b920  mov     r1, r4
0008b922  mov     r2, r0
0008b924  add.w   r0, fp, #0x18
0008b928  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0008b92c  cbz     r5, #0x8b960
0008b92e  ldr     r1, [pc, #0x64]
0008b930  ldr     r0, [pc, #0x64]
0008b932  add     r1, pc ; -> 0x000fcf68  
0008b934  add     r0, pc ; -> 0x000fdb5c  
0008b936  ldr     r4, [r1]
0008b938  ldr     r1, [pc, #0x60]
0008b93a  ldr     r0, [r0]
0008b93c  add     r1, pc ; -> 0x000fcf58  
0008b93e  ldr     r1, [r1]
0008b940  blx     #0xddbfc ; -> objc_msgSend
0008b944  mov     r1, r4
0008b946  mov     r2, r0
0008b948  mov     r0, r5
0008b94a  blx     #0xddbfc ; -> objc_msgSend
0008b94e  mov     r4, r0
0008b950  blx     #0xdde0c ; -> strlen
0008b954  mov     r1, r4
0008b956  mov     r2, r0
0008b958  add.w   r0, fp, #0x1c
0008b95c  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0008b960  pop.w   {r8, sl, fp}
0008b964  pop     {r4, r5, r6, r7, pc}
0008b966  nop     
0008b968  asrs    r2, r2, #9
0008b96a  movs    r7, r0
0008b96c  adds    r7, #0xe0
0008b96e  movs    r7, r1
0008b970  asrs    r0, r5, #7
0008b972  movs    r7, r0
0008b974  asrs    r0, r1, #0x1c
0008b976  movs    r7, r0
0008b978  adds    r7, #0xc2
0008b97a  movs    r7, r1
0008b97c  cmp     r6, #0x8e
0008b97e  movs    r7, r1
0008b980  adds    r7, #0xaa
0008b982  movs    r7, r1
0008b984  asrs    r4, r7, #7
0008b986  movs    r7, r0
0008b988  asrs    r6, r4, #0x19
0008b98a  movs    r7, r0
0008b98c  movs    r2, #0x58
0008b98e  movs    r7, r0
0008b990  asrs    r4, r1, #0x19
0008b992  movs    r7, r0
0008b994  asrs    r2, r6, #0x18
0008b996  movs    r7, r0
0008b998  movs    r2, #0x24
0008b99a  movs    r7, r0
0008b99c  asrs    r0, r3, #0x18
0008b99e  movs    r7, r0
