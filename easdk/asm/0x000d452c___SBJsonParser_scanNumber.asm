========================================================================
-[SBJsonParser scanNumber  0x000d452c  756 bytes   SBJsonParser.mm
========================================================================

000d452c  push    {r4, r5, r6, r7, lr}
000d452e  add     r7, sp, #0xc
000d4530  sub     sp, #8
000d4532  ldr     r3, [pc, #0x268]
000d4534  mov     r6, r2
000d4536  mov     r4, r0
000d4538  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d453a  ldr     r2, [r3]
000d453c  ldr     r5, [r0, r2]
000d453e  ldrsb.w r3, [r5]
000d4542  cmp     r3, #0x2d
000d4544  bne     #0xd454a
000d4546  adds    r3, r5, #1
000d4548  str     r3, [r0, r2]
000d454a  ldr     r0, [pc, #0x254]
000d454c  add     r0, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d454e  ldr     r1, [r0]
000d4550  ldr     r2, [r4, r1]
000d4552  ldrsb.w r3, [r2]
000d4556  cmp     r3, #0x30
000d4558  bne.w   #0xd4754
000d455c  adds    r3, r2, #1
000d455e  cmp     r3, #1
000d4560  str     r3, [r4, r1]
000d4562  beq.w   #0xd4754
000d4566  ldr     r3, [r0]
000d4568  ldr     r3, [r4, r3]
000d456a  ldrsb.w r2, [r3]
000d456e  cmp     r2, #0xff
000d4570  bhi     #0xd45e6
000d4572  ldr     r3, [pc, #0x230]
000d4574  add     r3, pc ; -> 0x000f344c  0x0
000d4576  ldr     r1, [r3]
000d4578  lsls    r3, r2, #2
000d457a  adds    r3, r3, r1
000d457c  ldr     r3, [r3, #0x34]
000d457e  tst.w   r3, #0x400
000d4582  beq     #0xd45e6
000d4584  ldr     r3, [pc, #0x220]
000d4586  ldr     r1, [pc, #0x224]
000d4588  add     r3, pc ; -> 0x00182484  
000d458a  add     r1, pc ; -> 0x000fd91c  
000d458c  b       #0xd478a
000d458e  ldr     r3, [pc, #0x220]
000d4590  add     r3, pc ; -> 0x000f344c  0x0
000d4592  ldr     r0, [r3]
000d4594  lsls    r3, r2, #2
000d4596  adds    r3, r3, r0
000d4598  ldr     r3, [r3, #0x34]
000d459a  tst.w   r3, #0x400
000d459e  beq.w   #0xd4766
000d45a2  ldr.w   lr, [pc, #0x210]
000d45a6  b       #0xd45b8
000d45a8  ldr     r3, [pc, #0x20c]
000d45aa  ldr.w   r1, [pc, #0x210]
000d45ae  add     r3, pc ; -> 0x00182494  
000d45b0  add     r1, pc ; -> 0x000fd91c  
000d45b2  b       #0xd478a
000d45b4  ldr.w   lr, [pc, #0x1fc]
000d45b8  mov     r3, lr
000d45ba  add     r3, pc
000d45bc  ldr.w   ip, [r3]
000d45c0  ldr.w   r0, [r4, ip]
000d45c4  ldrsb.w r2, [r0]
000d45c8  cmp     r2, #0xff
000d45ca  bhi     #0xd45e6
000d45cc  ldr     r3, [pc, #0x1f0]
000d45ce  add     r3, pc ; -> 0x000f344c  0x0
000d45d0  ldr     r1, [r3]
000d45d2  lsls    r3, r2, #2
000d45d4  adds    r3, r3, r1
000d45d6  ldr     r3, [r3, #0x34]
000d45d8  tst.w   r3, #0x400
000d45dc  beq     #0xd45e6
000d45de  adds    r3, r0, #1
000d45e0  str.w   r3, [r4, ip]
000d45e4  b       #0xd45b8
000d45e6  ldr     r0, [pc, #0x1dc]
000d45e8  add     r0, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d45ea  ldr     r1, [r0]
000d45ec  ldr     r2, [r4, r1]
000d45ee  ldrsb.w r3, [r2]
000d45f2  cmp     r3, #0x2e
000d45f4  bne     #0xd4658
000d45f6  adds    r3, r2, #1
000d45f8  cmp     r3, #1
000d45fa  str     r3, [r4, r1]
000d45fc  beq     #0xd4658
000d45fe  ldr     r3, [r0]
000d4600  add.w   ip, r4, r3
000d4604  ldr     r0, [r4, r3]
000d4606  ldrsb.w r2, [r0]
000d460a  cmp     r2, #0xff
000d460c  bhi.w   #0xd476e
000d4610  ldr     r3, [pc, #0x1b4]
000d4612  add     r3, pc ; -> 0x000f344c  0x0
000d4614  ldr     r1, [r3]
000d4616  lsls    r3, r2, #2
000d4618  adds    r3, r3, r1
000d461a  ldr     r3, [r3, #0x34]
000d461c  tst.w   r3, #0x400
000d4620  beq.w   #0xd476e
000d4624  ldr.w   lr, [pc, #0x1a4]
000d4628  b       #0xd463e
000d462a  ldr.w   r3, [pc, #0x1a4]
000d462e  add     r3, pc ; -> 0x000f344c  0x0
000d4630  ldr     r1, [r3]
000d4632  lsls    r3, r2, #2
000d4634  adds    r3, r3, r1
000d4636  ldr     r3, [r3, #0x34]
000d4638  tst.w   r3, #0x400
000d463c  beq     #0xd4658
000d463e  adds    r3, r0, #1
000d4640  str.w   r3, [ip]
000d4644  mov     r3, lr
000d4646  add     r3, pc
000d4648  ldr     r3, [r3]
000d464a  add.w   ip, r4, r3
000d464e  ldr     r0, [r4, r3]
000d4650  ldrsb.w r2, [r0]
000d4654  cmp     r2, #0xff
000d4656  bls     #0xd462a
000d4658  ldr.w   r0, [pc, #0x178]
000d465c  add     r0, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d465e  ldr.w   ip, [r0]
000d4662  ldr.w   r1, [r4, ip]
000d4666  ldrsb.w r3, [r1]
000d466a  cmp     r3, #0x45
000d466c  ite     ne
000d466e  movne   r2, #0
000d4670  moveq   r2, #1
000d4672  cmp     r3, #0x65
000d4674  ite     ne
000d4676  movne   r3, r2
000d4678  orreq   r3, r2, #1
000d467c  cmp     r3, #0
000d467e  beq     #0xd46fe
000d4680  adds    r3, r1, #1
000d4682  str.w   r3, [r4, ip]
000d4686  ldr     r0, [r0]
000d4688  ldr     r1, [r4, r0]
000d468a  ldrsb.w r3, [r1]
000d468e  cmp     r3, #0x2b
000d4690  ite     ne
000d4692  movne   r2, #0
000d4694  moveq   r2, #1
000d4696  cmp     r3, #0x2d
000d4698  ite     ne
000d469a  movne   r3, r2
000d469c  orreq   r3, r2, #1
000d46a0  cbz     r3, #0xd46a6
000d46a2  adds    r3, r1, #1
000d46a4  str     r3, [r4, r0]
000d46a6  ldr     r3, [pc, #0x130]
000d46a8  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d46aa  ldr     r3, [r3]
000d46ac  add.w   ip, r4, r3
000d46b0  ldr     r0, [r4, r3]
000d46b2  ldrsb.w r2, [r0]
000d46b6  cmp     r2, #0xff
000d46b8  bhi     #0xd4778
000d46ba  ldr     r3, [pc, #0x120]
000d46bc  add     r3, pc ; -> 0x000f344c  0x0
000d46be  ldr     r1, [r3]
000d46c0  lsls    r3, r2, #2
000d46c2  adds    r3, r3, r1
000d46c4  ldr     r3, [r3, #0x34]
000d46c6  tst.w   r3, #0x400
000d46ca  beq     #0xd4778
000d46cc  ldr.w   lr, [pc, #0x110]
000d46d0  b       #0xd46e4
000d46d2  ldr     r3, [pc, #0x110]
000d46d4  add     r3, pc ; -> 0x000f344c  0x0
000d46d6  ldr     r1, [r3]
000d46d8  lsls    r3, r2, #2
000d46da  adds    r3, r3, r1
000d46dc  ldr     r3, [r3, #0x34]
000d46de  tst.w   r3, #0x400
000d46e2  beq     #0xd46fe
000d46e4  adds    r3, r0, #1
000d46e6  str.w   r3, [ip]
000d46ea  mov     r3, lr
000d46ec  add     r3, pc
000d46ee  ldr     r3, [r3]
000d46f0  add.w   ip, r4, r3
000d46f4  ldr     r0, [r4, r3]
000d46f6  ldrsb.w r2, [r0]
000d46fa  cmp     r2, #0xff
000d46fc  bls     #0xd46d2
000d46fe  ldr     r0, [pc, #0xe8]
000d4700  ldr     r1, [pc, #0xe8]
000d4702  add     r0, pc ; -> 0x000fdb5c  
000d4704  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d4706  ldr     r0, [r0]
000d4708  ldr     r1, [r1]
000d470a  blx     #0xddbfc ; -> objc_msgSend
000d470e  ldr     r3, [pc, #0xe0]
000d4710  ldr     r1, [pc, #0xe0]
000d4712  movs    r2, #4
000d4714  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d4716  add     r1, pc ; -> 0x000fd038  
000d4718  ldr     r3, [r3]
000d471a  ldr     r1, [r1]
000d471c  str     r2, [sp]
000d471e  subs    r2, #4
000d4720  ldr     r3, [r4, r3]
000d4722  str     r2, [sp, #4]
000d4724  mov     r2, r5
000d4726  subs    r3, r3, r5
000d4728  blx     #0xddbfc ; -> objc_msgSend
000d472c  ldr     r1, [pc, #0xc8]
000d472e  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d4730  ldr     r1, [r1]
000d4732  mov     r5, r0
000d4734  blx     #0xddbfc ; -> objc_msgSend
000d4738  cbz     r5, #0xd4782
000d473a  ldr     r0, [pc, #0xc0]
000d473c  ldr     r1, [pc, #0xc0]
000d473e  mov     r2, r5
000d4740  add     r0, pc ; -> 0x000fdcf8  
000d4742  add     r1, pc ; -> 0x000fd934  ' \x19\x0f'
000d4744  ldr     r0, [r0]
000d4746  ldr     r1, [r1]
000d4748  blx     #0xddbfc ; -> objc_msgSend
000d474c  str     r0, [r6]
000d474e  cbz     r0, #0xd4782
000d4750  movs    r0, #1
000d4752  b       #0xd4796
000d4754  ldr     r3, [pc, #0xac]
000d4756  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d4758  ldr     r3, [r3]
000d475a  ldr     r1, [r4, r3]
000d475c  ldrsb.w r2, [r1]
000d4760  cmp     r2, #0xff
000d4762  bls.w   #0xd458e
000d4766  cmp     r5, r1
000d4768  bne.w   #0xd45a8
000d476c  b       #0xd45b4
000d476e  ldr     r3, [pc, #0x98]
000d4770  ldr     r1, [pc, #0x98]
000d4772  add     r3, pc ; -> 0x001824a4  
000d4774  add     r1, pc ; -> 0x000fd91c  
000d4776  b       #0xd478a
000d4778  ldr     r3, [pc, #0x94]
000d477a  ldr     r1, [pc, #0x98]
000d477c  add     r3, pc ; -> 0x001824b4  
000d477e  add     r1, pc ; -> 0x000fd91c  
000d4780  b       #0xd478a
000d4782  ldr     r3, [pc, #0x94]
000d4784  ldr     r1, [pc, #0x94]
000d4786  add     r3, pc ; -> 0x001824c4  
000d4788  add     r1, pc ; -> 0x000fd91c  
000d478a  mov     r0, r4
000d478c  ldr     r1, [r1]
000d478e  movs    r2, #2
000d4790  blx     #0xddbfc ; -> objc_msgSend
000d4794  movs    r0, #0
000d4796  sub.w   sp, r7, #0xc
000d479a  pop     {r4, r5, r6, r7, pc}
000d479c  str     r4, [r0, #0x60]
000d479e  movs    r2, r0
000d47a0  str     r0, [r6, #0x5c]
000d47a2  movs    r2, r0
000d47a4  cdp     p0, #0xd, c0, c4, c1, #0
000d47a8  udf     #0xf8
000d47aa  movs    r2, r1
000d47ac  str     r3, [sp, #0x238]
000d47ae  movs    r2, r0
000d47b0  cdp     p0, #0xb, c0, c8, c1, #0
000d47b4  str     r2, [r0, #0x58]
000d47b6  movs    r2, r0
000d47b8  udf     #0xe2
000d47ba  movs    r2, r1
000d47bc  str     r3, [sp, #0x1a0]
000d47be  movs    r2, r0
000d47c0  cdp     p0, #7, c0, c10, c1, #0
000d47c4  str     r4, [r2, #0x54]
000d47c6  movs    r2, r0
000d47c8  cdp     p0, #3, c0, c6, c1, #0
000d47cc  str     r6, [r6, #0x4c]
000d47ce  movs    r2, r0
000d47d0  cdp     p0, #1, c0, c10, c1, #0
000d47d4  str     r0, [r4, #0x4c]
000d47d6  movs    r2, r0
000d47d8  str     r4, [r2, #0x48]
000d47da  movs    r2, r0
000d47dc  stc     p0, c0, [ip, #4]
000d47e0  str     r0, [r2, #0x44]
000d47e2  movs    r2, r0
000d47e4  ldcl    p0, c0, [r4, #-4]!
000d47e8  str     r4, [sp, #0x158]
000d47ea  movs    r2, r0
000d47ec  strh    r4, [r7, #0x12]
000d47ee  movs    r2, r0
000d47f0  str     r0, [r5, #0x40]
000d47f2  movs    r2, r0
000d47f4  ldrh    r6, [r3, #8]
000d47f6  movs    r2, r0
000d47f8  strh    r6, [r4, #0x18]
000d47fa  movs    r2, r0
000d47fc  str     r5, [sp, #0x2d0]
000d47fe  movs    r2, r0
000d4800  str     r1, [sp, #0x3b8]
000d4802  movs    r2, r0
000d4804  str     r6, [r4, #0x3c]
000d4806  movs    r2, r0
000d4808  ble     #0xd4868
000d480a  movs    r2, r1
000d480c  str     r1, [sp, #0x290]
000d480e  movs    r2, r0
000d4810  ble     #0xd487c
000d4812  movs    r2, r1
000d4814  str     r1, [sp, #0x268]
000d4816  movs    r2, r0
000d4818  ble     #0xd4890
000d481a  movs    r2, r1
000d481c  str     r1, [sp, #0x240]
000d481e  movs    r2, r0
