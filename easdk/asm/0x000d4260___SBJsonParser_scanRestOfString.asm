========================================================================
-[SBJsonParser scanRestOfString  0x000d4260  716 bytes   SBJsonParser.mm
========================================================================

000d4260  push    {r4, r5, r6, r7, lr}
000d4262  add     r7, sp, #0xc
000d4264  push.w  {r8, sl, fp}
000d4268  sub     sp, #0x2c
000d426a  ldr     r1, [pc, #0x258]
000d426c  mov     r8, r0
000d426e  ldr     r0, [pc, #0x258]
000d4270  add     r1, pc ; -> 0x000fcea0  
000d4272  mov     sl, r2
000d4274  add     r0, pc ; -> 0x000fdbf8  
000d4276  ldr     r1, [r1]
000d4278  ldr     r0, [r0]
000d427a  movs    r2, #0x10
000d427c  blx     #0xddbfc ; -> objc_msgSend
000d4280  ldr     r1, [pc, #0x248]
000d4282  ldr     r3, [pc, #0x24c]
000d4284  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d4286  ldr     r1, [r1]
000d4288  str     r3, [sp, #8]
000d428a  str     r1, [sp, #0x14]
000d428c  ldr     r1, [pc, #0x244]
000d428e  add     r1, pc ; -> 0x000fd038  
000d4290  ldr     r1, [r1]
000d4292  str     r1, [sp, #0x18]
000d4294  ldr     r1, [pc, #0x240]
000d4296  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d4298  ldr     r1, [r1]
000d429a  str     r1, [sp, #0x1c]
000d429c  ldr     r1, [pc, #0x23c]
000d429e  str.w   r0, [sl]
000d42a2  ldr     r0, [pc, #0x23c]
000d42a4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d42a6  ldr     r1, [r1]
000d42a8  add     r0, pc ; -> 0x000fdb5c  
000d42aa  ldr.w   fp, [r0]
000d42ae  str     r1, [sp, #0x20]
000d42b0  ldr     r1, [pc, #0x230]
000d42b2  add     r1, pc ; -> 0x000fd93c  
000d42b4  ldr     r1, [r1]
000d42b6  str     r1, [sp, #0x24]
000d42b8  ldr     r1, [pc, #0x22c]
000d42ba  str     r1, [sp, #0x10]
000d42bc  ldr     r1, [pc, #0x22c]
000d42be  str     r1, [sp, #0xc]
000d42c0  ldr     r6, [sp, #0x10]
000d42c2  ldr     r1, [sp, #8]
000d42c4  add     r6, pc
000d42c6  add     r1, pc
000d42c8  ldr     r3, [r6]
000d42ca  ldr.w   r0, [r8, r3]
000d42ce  blx     #0xdddf4 ; -> strcspn
000d42d2  mov     r5, r0
000d42d4  cbz     r0, #0xd431a
000d42d6  ldr     r1, [sp, #0x14]
000d42d8  mov     r0, fp
000d42da  blx     #0xddbfc ; -> objc_msgSend
000d42de  ldr     r3, [r6]
000d42e0  ldr     r1, [sp, #0x18]
000d42e2  ldr.w   r2, [r8, r3]
000d42e6  movs    r3, #4
000d42e8  str     r3, [sp]
000d42ea  subs    r3, #4
000d42ec  str     r3, [sp, #4]
000d42ee  mov     r3, r5
000d42f0  blx     #0xddbfc ; -> objc_msgSend
000d42f4  mov     r4, r0
000d42f6  cbz     r0, #0xd431a
000d42f8  mov     r2, r4
000d42fa  ldr.w   r0, [sl]
000d42fe  ldr     r1, [sp, #0x1c]
000d4300  blx     #0xddbfc ; -> objc_msgSend
000d4304  mov     r0, r4
000d4306  ldr     r1, [sp, #0x20]
000d4308  blx     #0xddbfc ; -> objc_msgSend
000d430c  ldr     r3, [r6]
000d430e  ldr.w   r2, [r8, r3]
000d4312  add.w   r0, r2, r5
000d4316  str.w   r0, [r8, r3]
000d431a  ldr     r3, [sp, #0xc]
000d431c  add     r3, pc
000d431e  ldr     r1, [r3]
000d4320  ldr.w   r2, [r8, r1]
000d4324  ldrsb.w r3, [r2]
000d4328  cmp     r3, #0x22
000d432a  bne     #0xd4336
000d432c  adds    r3, r2, #1
000d432e  movs    r0, #1
000d4330  str.w   r3, [r8, r1]
000d4334  b       #0xd44b8
000d4336  cmp     r3, #0x5c
000d4338  bne.w   #0xd445a
000d433c  adds    r3, r2, #1
000d433e  str.w   r3, [r8, r1]
000d4342  ldrsb.w r2, [r2, #1]
000d4346  uxth    r3, r2
000d4348  strh.w  r2, [sp, #0x2a]
000d434c  sub.w   r2, r3, #0x22
000d4350  cmp     r2, #0x53
000d4352  bhi     #0xd441a
000d4354  tbb     [pc, r2]
000d4358  str     r1, [r6, #0x14]
000d435a  str     r1, [r4, #0x14]
000d435c  str     r1, [r4, #0x14]
000d435e  str     r1, [r4, #0x14]
000d4360  str     r1, [r4, #0x14]
000d4362  str     r1, [r4, #0x14]
000d4364  strb    r1, [r4, #5]
000d4366  str     r1, [r4, #0x14]
000d4368  str     r1, [r4, #0x14]
000d436a  str     r1, [r4, #0x14]
000d436c  str     r1, [r4, #0x14]
000d436e  str     r1, [r4, #0x14]
000d4370  str     r1, [r4, #0x14]
000d4372  str     r1, [r4, #0x14]
000d4374  str     r1, [r4, #0x14]
000d4376  str     r1, [r4, #0x14]
000d4378  str     r1, [r4, #0x14]
000d437a  str     r1, [r4, #0x14]
000d437c  str     r1, [r4, #0x14]
000d437e  str     r1, [r4, #0x14]
000d4380  str     r1, [r4, #0x14]
000d4382  str     r1, [r4, #0x14]
000d4384  str     r1, [r4, #0x14]
000d4386  str     r1, [r4, #0x14]
000d4388  str     r1, [r4, #0x14]
000d438a  str     r1, [r4, #0x14]
000d438c  str     r1, [r4, #0x14]
000d438e  str     r1, [r4, #0x14]
000d4390  str     r1, [r4, #0x14]
000d4392  str     r1, [r6, #0x14]
000d4394  str     r1, [r4, #0x14]
000d4396  str     r1, [r4, #0x14]
000d4398  str     r3, [r5, #0x10]
000d439a  str     r1, [r4, #0x14]
000d439c  str     r1, [r7, #0x10]
000d439e  str     r1, [r4, #0x14]
000d43a0  str     r1, [r4, #0x14]
000d43a2  str     r1, [r4, #0x14]
000d43a4  str     r6, [r5, #0x10]
000d43a6  str     r1, [r4, #0x14]
000d43a8  str     r1, [r6, #0x10]
000d43aa  subs    r6, #0x34
000d43ac  lsls    r1, r4, #1
000d43ae  mov.w   r3, #8
000d43b2  b       #0xd43ce
000d43b4  mov.w   r1, #0xa
000d43b8  b       #0xd43c4
000d43ba  mov.w   r3, #0xd
000d43be  b       #0xd43ce
000d43c0  mov.w   r1, #9
000d43c4  strh.w  r1, [sp, #0x2a]
000d43c8  b       #0xd443a
000d43ca  mov.w   r3, #0xc
000d43ce  strh.w  r3, [sp, #0x2a]
000d43d2  b       #0xd443a
000d43d4  ldr     r3, [pc, #0x118]
000d43d6  mov     r0, r8
000d43d8  ldr     r1, [sp, #0x24]
000d43da  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d43dc  ldr     r2, [r3]
000d43de  ldr.w   r3, [r8, r2]
000d43e2  adds    r3, #1
000d43e4  str.w   r3, [r8, r2]
000d43e8  add.w   r2, sp, #0x2a
000d43ec  blx     #0xddbfc ; -> objc_msgSend
000d43f0  uxtb    r4, r0
000d43f2  cbnz    r4, #0xd4408
000d43f4  ldr.w   r1, [pc, #0xfc]
000d43f8  ldr.w   r3, [pc, #0xfc]
000d43fc  movs    r2, #6
000d43fe  add     r1, pc ; -> 0x000fd91c  
000d4400  add     r3, pc ; -> 0x00182434  
000d4402  ldr     r1, [r1]
000d4404  mov     r0, r8
000d4406  b       #0xd44b2
000d4408  ldr     r3, [pc, #0xf0]
000d440a  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d440c  ldr     r2, [r3]
000d440e  ldr.w   r3, [r8, r2]
000d4412  subs    r3, #1
000d4414  str.w   r3, [r8, r2]
000d4418  b       #0xd443a
000d441a  ldr     r1, [pc, #0xe4]
000d441c  ldr     r2, [pc, #0xe4]
000d441e  mov     r0, fp
000d4420  add     r1, pc ; -> 0x000fd91c  
000d4422  add     r2, pc ; -> 0x00182444  
000d4424  ldr     r4, [r1]
000d4426  ldr     r1, [pc, #0xe0]
000d4428  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d442a  ldr     r1, [r1]
000d442c  blx     #0xddbfc ; -> objc_msgSend
000d4430  movs    r2, #8
000d4432  mov     r1, r4
000d4434  mov     r3, r0
000d4436  mov     r0, r8
000d4438  b       #0xd447e
000d443a  movs    r2, #1
000d443c  ldr.w   r0, [sl]
000d4440  add.w   r1, sp, #0x2a
000d4444  blx     #0xdd188 ; -> CFStringAppendCharacters
000d4448  ldr     r3, [pc, #0xc0]
000d444a  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d444c  ldr     r2, [r3]
000d444e  ldr.w   r3, [r8, r2]
000d4452  adds    r3, #1
000d4454  str.w   r3, [r8, r2]
000d4458  b       #0xd448e
000d445a  cmp     r3, #0x1f
000d445c  bgt     #0xd4486
000d445e  ldr.w   r1, [pc, #0xb0]
000d4462  ldr     r2, [pc, #0xb0]
000d4464  mov     r0, fp
000d4466  add     r1, pc ; -> 0x000fd91c  
000d4468  add     r2, pc ; -> 0x00182454  
000d446a  ldr     r4, [r1]
000d446c  ldr     r1, [pc, #0xa8]
000d446e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d4470  ldr     r1, [r1]
000d4472  blx     #0xddbfc ; -> objc_msgSend
000d4476  movs    r2, #5
000d4478  mov     r1, r4
000d447a  mov     r3, r0
000d447c  mov     r0, r8
000d447e  blx     #0xddbfc ; -> objc_msgSend
000d4482  movs    r0, #0
000d4484  b       #0xd44b8
000d4486  ldr     r0, [pc, #0x94]
000d4488  add     r0, pc ; -> 0x00182464  
000d448a  blx     #0xdd3e0 ; -> NSLog
000d448e  ldr     r3, [pc, #0x90]
000d4490  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d4492  ldr     r3, [r3]
000d4494  ldr.w   r3, [r8, r3]
000d4498  ldrsb.w r4, [r3]
000d449c  cmp     r4, #0
000d449e  bne.w   #0xd42c0
000d44a2  ldr     r1, [pc, #0x80]
000d44a4  ldr.w   r3, [pc, #0x80]
000d44a8  movs    r2, #0xb
000d44aa  add     r1, pc ; -> 0x000fd91c  
000d44ac  add     r3, pc ; -> 0x00182474  
000d44ae  ldr     r1, [r1]
000d44b0  mov     r0, r8
000d44b2  blx     #0xddbfc ; -> objc_msgSend
000d44b6  mov     r0, r4
000d44b8  sub.w   sp, r7, #0x18
000d44bc  pop.w   {r8, sl, fp}
000d44c0  pop     {r4, r5, r6, r7, pc}
000d44c2  nop     
000d44c4  ldrh    r4, [r5, #0x20]
000d44c6  movs    r2, r0
000d44c8  ldr     r1, [sp, #0x200]
000d44ca  movs    r2, r0
000d44cc  strh    r4, [r7, #0x36]
000d44ce  movs    r2, r0
000d44d0  ldrb    r6, [r5, #0x19]
000d44d2  lsls    r6, r3, #1
000d44d4  ldrh    r6, [r4, #0x2c]
000d44d6  movs    r2, r0
000d44d8  ldrh    r2, [r4, #0x1e]
000d44da  movs    r2, r0
000d44dc  strh    r4, [r2, #0x36]
000d44de  movs    r2, r0
000d44e0  ldr     r0, [sp, #0x2c0]
000d44e2  movs    r2, r0
000d44e4  str     r6, [sp, #0x218]
000d44e6  movs    r2, r0
000d44e8  ldr     r0, [r7, #4]
000d44ea  movs    r2, r0
000d44ec  ldr     r0, [r4]
000d44ee  movs    r2, r0
000d44f0  str     r2, [r4, #0x74]
000d44f2  movs    r2, r0
000d44f4  str     r5, [sp, #0x68]
000d44f6  movs    r2, r0
000d44f8  b       #0xd455c
000d44fa  movs    r2, r1
000d44fc  str     r2, [r6, #0x70]
000d44fe  movs    r2, r0
000d4500  str     r4, [sp, #0x3e0]
000d4502  movs    r2, r0
000d4504  b       #0xd4544
000d4506  movs    r2, r1
000d4508  strh    r4, [r6, #0x32]
000d450a  movs    r2, r0
000d450c  str     r2, [r6, #0x6c]
000d450e  movs    r2, r0
000d4510  str     r4, [sp, #0x2c8]
000d4512  movs    r2, r0
000d4514  svc     #0xe8
000d4516  movs    r2, r1
000d4518  strh    r6, [r5, #0x30]
000d451a  movs    r2, r0
000d451c  svc     #0xd8
000d451e  movs    r2, r1
000d4520  str     r4, [r5, #0x68]
000d4522  movs    r2, r0
000d4524  str     r4, [sp, #0x1b8]
000d4526  movs    r2, r0
000d4528  svc     #0xc4
000d452a  movs    r2, r1
