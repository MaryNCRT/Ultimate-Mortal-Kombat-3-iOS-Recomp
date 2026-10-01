========================================================================
ZN6Mayhem15threadRunMethodEPv  0x0008b5a0  264 bytes   Mayhem.mm
========================================================================

0008b5a0  push    {r4, r5, r6, r7, lr}
0008b5a2  add     r7, sp, #0xc
0008b5a4  push.w  {r8, sl, fp}
0008b5a8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0008b5ac  sub     sp, #0x40
0008b5ae  ldr     r3, [pc, #0xd4]
0008b5b0  str     r0, [sp, #4]
0008b5b2  add     r0, sp, #0xc
0008b5b4  add     r3, pc ; -> 0x000f3438  0x0
0008b5b6  str     r7, [sp, #0x2c]
0008b5b8  ldr     r3, [r3]
0008b5ba  str.w   sp, [sp, #0x34]
0008b5be  str     r3, [sp, #0x24]
0008b5c0  ldr     r3, [pc, #0xc4]
0008b5c2  add     r3, pc ; -> 0x000ee1cc  GCC_except_table0
0008b5c4  str     r3, [sp, #0x28]
0008b5c6  ldr     r3, [pc, #0xc4]
0008b5c8  add     r3, pc ; -> 0x0008b630  
0008b5ca  orr     r3, r3, #1
0008b5ce  str     r3, [sp, #0x30]
0008b5d0  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008b5d4  ldr     r0, [pc, #0xb8]
0008b5d6  ldr     r1, [pc, #0xbc]
0008b5d8  mov.w   r3, #-1
0008b5dc  add     r0, pc ; -> 0x000fdb3c  
0008b5de  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008b5e0  ldr     r0, [r0]
0008b5e2  ldr     r1, [r1]
0008b5e4  str     r3, [sp, #0x10]
0008b5e6  blx     #0xddbfc ; -> objc_msgSend
0008b5ea  ldr     r1, [pc, #0xac]
0008b5ec  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0008b5ee  ldr     r1, [r1]
0008b5f0  blx     #0xddbfc ; -> objc_msgSend
0008b5f4  ldr     r2, [sp, #4]
0008b5f6  str     r0, [sp, #8]
0008b5f8  ldr     r3, [r2]
0008b5fa  ldr     r0, [sp, #4]
0008b5fc  ldr     r2, [r3, #0x10]
0008b5fe  movs    r3, #2
0008b600  str     r3, [sp, #0x10]
0008b602  blx     r2
0008b604  ldr     r1, [pc, #0x94]
0008b606  ldr     r0, [sp, #8]
0008b608  mov.w   r3, #-1
0008b60c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008b60e  str     r3, [sp, #0x10]
0008b610  ldr     r1, [r1]
0008b612  blx     #0xddbfc ; -> objc_msgSend
0008b616  add     r0, sp, #0xc
0008b618  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0008b61c  movs    r0, #0
0008b61e  sub.w   sp, r7, #0x58
0008b622  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008b626  sub.w   sp, r7, #0x18
0008b62a  pop.w   {r8, sl, fp}
0008b62e  pop     {r4, r5, r6, r7, pc}
0008b630  ldr     r3, [sp, #0x10]
0008b632  ldr     r2, [sp, #0x14]
0008b634  cmp     r3, #1
0008b636  str     r2, [sp]
0008b638  ldr     r2, [sp, #0x18]
0008b63a  beq     #0x8b664
0008b63c  cmp     r3, #2
0008b63e  beq     #0x8b648
0008b640  movs    r3, #0
0008b642  str     r3, [sp, #0x10]
0008b644  blx     #0xddbd8 ; -> objc_end_catch
0008b648  ldr     r1, [pc, #0x54]
0008b64a  ldr     r0, [sp, #8]
0008b64c  movs    r3, #0
0008b64e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
0008b650  str     r3, [sp, #0x10]
0008b652  ldr     r1, [r1]
0008b654  blx     #0xddbfc ; -> objc_msgSend
0008b658  ldr     r0, [sp]
0008b65a  mov.w   r3, #-1
0008b65e  str     r3, [sp, #0x10]
0008b660  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0008b664  cmp     r2, #1
0008b666  bne     #0x8b648
0008b668  str     r3, [sp, #0x10]
0008b66a  ldr     r0, [sp]
0008b66c  blx     #0xddbc0 ; -> objc_begin_catch
0008b670  mov     r1, r0
0008b672  ldr     r0, [pc, #0x30]
0008b674  add     r0, pc ; -> 0x0017eff4  
0008b676  blx     #0xdd3e0 ; -> NSLog
0008b67a  movs    r3, #0
0008b67c  str     r3, [sp, #0x10]
0008b67e  blx     #0xddbd8 ; -> objc_end_catch
0008b682  b       #0x8b604
0008b684  ldrb    r0, [r0, #0x1a]
0008b686  movs    r6, r0
0008b688  cmp     r4, #6
0008b68a  movs    r6, r0
0008b68c  lsls    r4, r4, #1
0008b68e  movs    r0, r0
0008b690  movs    r5, #0x5c
0008b692  movs    r7, r0
0008b694  asrs    r2, r4, #0xe
0008b696  movs    r7, r0
0008b698  asrs    r0, r2, #0xe
0008b69a  movs    r7, r0
0008b69c  asrs    r4, r5, #0xd
0008b69e  movs    r7, r0
0008b6a0  asrs    r2, r5, #0xc
0008b6a2  movs    r7, r0
0008b6a4  subs    r1, #0x7c
0008b6a6  movs    r7, r1
