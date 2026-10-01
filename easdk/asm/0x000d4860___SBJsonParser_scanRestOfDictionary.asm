========================================================================
-[SBJsonParser scanRestOfDictionary  0x000d4860  688 bytes   SBJsonParser.mm
========================================================================

000d4860  push    {r4, r5, r6, r7, lr}
000d4862  add     r7, sp, #0xc
000d4864  push.w  {r8, sl, fp}
000d4868  sub     sp, #0x14
000d486a  ldr     r3, [pc, #0x234]
000d486c  str     r2, [sp, #4]
000d486e  mov     r5, r0
000d4870  add     r3, pc ; -> 0x000f32d8  OBJC_IVAR_$_SBJsonBase.maxDepth
000d4872  ldr     r1, [r3]
000d4874  ldr     r3, [r1]
000d4876  ldr     r3, [r0, r3]
000d4878  cmp     r3, #0
000d487a  beq.w   #0xd4a4c
000d487e  ldr     r3, [pc, #0x224]
000d4880  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d4882  ldr     r3, [r3]
000d4884  ldr     r3, [r3]
000d4886  ldr     r2, [r0, r3]
000d4888  adds    r2, #1
000d488a  str     r2, [r0, r3]
000d488c  ldr     r3, [r1]
000d488e  ldr     r3, [r0, r3]
000d4890  cmp     r2, r3
000d4892  bls.w   #0xd4a4c
000d4896  ldr.w   r1, [pc, #0x210]
000d489a  ldr.w   r3, [pc, #0x210]
000d489e  movs    r2, #7
000d48a0  add     r1, pc ; -> 0x000fd91c  
000d48a2  add     r3, pc ; -> 0x00182244  
000d48a4  ldr     r1, [r1]
000d48a6  b       #0xd491c
000d48a8  ldr     r2, [r4]
000d48aa  ldr     r3, [r5, r2]
000d48ac  adds    r3, #1
000d48ae  str     r3, [r5, r2]
000d48b0  b       #0xd48b4
000d48b2  ldr     r6, [pc, #0x1fc]
000d48b4  mov     r4, r6
000d48b6  add     r4, pc
000d48b8  mov.w   r1, #0x4000
000d48bc  ldr     r3, [r4]
000d48be  ldr     r3, [r5, r3]
000d48c0  ldrsb.w r0, [r3]
000d48c4  bl      #0xd3f9c ; -> ZL8__istypeim
000d48c8  cmp     r0, #0
000d48ca  bne     #0xd48a8
000d48cc  ldr     r1, [r4]
000d48ce  ldr     r2, [r5, r1]
000d48d0  ldrsb.w r3, [r2]
000d48d4  cmp     r3, #0x7d
000d48d6  bne.w   #0xd4a80
000d48da  adds    r3, r2, #1
000d48dc  cmp     r3, #1
000d48de  str     r3, [r5, r1]
000d48e0  beq.w   #0xd4a80
000d48e4  ldr     r3, [pc, #0x1cc]
000d48e6  adds    r0, #1
000d48e8  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d48ea  ldr     r3, [r3]
000d48ec  ldr     r2, [r3]
000d48ee  ldr     r3, [r5, r2]
000d48f0  subs    r3, #1
000d48f2  str     r3, [r5, r2]
000d48f4  b       #0xd4a94
000d48f6  adds    r3, r2, #1
000d48f8  cmp     r3, #1
000d48fa  str     r3, [r5, r1]
000d48fc  beq     #0xd490e
000d48fe  mov     r0, r5
000d4900  ldr     r1, [sp, #8]
000d4902  add     r2, sp, #0x10
000d4904  blx     #0xddbfc ; -> objc_msgSend
000d4908  tst.w   r0, #0xff
000d490c  bne     #0xd492e
000d490e  ldr     r1, [pc, #0x1a8]
000d4910  ldr     r3, [pc, #0x1a8]
000d4912  movs    r2, #3
000d4914  add     r1, pc ; -> 0x000fd91c  
000d4916  add     r3, pc ; -> 0x001824d4  
000d4918  ldr     r1, [r1]
000d491a  mov     r0, r5
000d491c  blx     #0xddbfc ; -> objc_msgSend
000d4920  movs    r0, #0
000d4922  b       #0xd4a94
000d4924  ldr     r2, [r4]
000d4926  ldr     r3, [r5, r2]
000d4928  adds    r3, #1
000d492a  str     r3, [r5, r2]
000d492c  b       #0xd4932
000d492e  ldr.w   r8, [pc, #0x190]
000d4932  mov     r4, r8
000d4934  add     r4, pc
000d4936  mov.w   r1, #0x4000
000d493a  ldr     r3, [r4]
000d493c  ldr     r3, [r5, r3]
000d493e  ldrsb.w r0, [r3]
000d4942  bl      #0xd3f9c ; -> ZL8__istypeim
000d4946  mov     r6, r0
000d4948  cmp     r0, #0
000d494a  bne     #0xd4924
000d494c  ldr     r1, [r4]
000d494e  ldr     r2, [r5, r1]
000d4950  ldrsb.w r3, [r2]
000d4954  cmp     r3, #0x3a
000d4956  beq     #0xd4962
000d4958  ldr     r3, [pc, #0x168]
000d495a  ldr     r1, [pc, #0x16c]
000d495c  add     r3, pc ; -> 0x001824e4  
000d495e  add     r1, pc ; -> 0x000fd91c  
000d4960  b       #0xd4990
000d4962  adds    r3, r2, #1
000d4964  mov     r0, r5
000d4966  str     r3, [r5, r1]
000d4968  add     r2, sp, #0xc
000d496a  mov     r1, fp
000d496c  blx     #0xddbfc ; -> objc_msgSend
000d4970  uxtb    r6, r0
000d4972  cbnz    r6, #0xd4998
000d4974  ldr     r0, [pc, #0x154]
000d4976  ldr     r1, [pc, #0x158]
000d4978  ldr     r2, [pc, #0x158]
000d497a  add     r0, pc ; -> 0x000fdb5c  
000d497c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d497e  ldr     r3, [sp, #0x10]
000d4980  ldr     r1, [r1]
000d4982  ldr     r0, [r0]
000d4984  add     r2, pc ; -> 0x001824f4  
000d4986  blx     #0xddbfc ; -> objc_msgSend
000d498a  ldr     r1, [pc, #0x14c]
000d498c  add     r1, pc ; -> 0x000fd91c  
000d498e  mov     r3, r0
000d4990  ldr     r1, [r1]
000d4992  movs    r2, #3
000d4994  mov     r0, r5
000d4996  b       #0xd4a44
000d4998  ldr     r3, [sp, #4]
000d499a  mov     r1, sl
000d499c  ldr     r2, [sp, #0xc]
000d499e  ldr     r6, [pc, #0x13c]
000d49a0  ldr     r0, [r3]
000d49a2  ldr     r3, [sp, #0x10]
000d49a4  blx     #0xddbfc ; -> objc_msgSend
000d49a8  b       #0xd49b2
000d49aa  ldr     r2, [r4]
000d49ac  ldr     r3, [r5, r2]
000d49ae  adds    r3, #1
000d49b0  str     r3, [r5, r2]
000d49b2  mov     r4, r6
000d49b4  add     r4, pc
000d49b6  mov.w   r1, #0x4000
000d49ba  ldr     r3, [r4]
000d49bc  ldr     r3, [r5, r3]
000d49be  ldrsb.w r0, [r3]
000d49c2  bl      #0xd3f9c ; -> ZL8__istypeim
000d49c6  cmp     r0, #0
000d49c8  bne     #0xd49aa
000d49ca  ldr     r1, [r4]
000d49cc  ldr     r2, [r5, r1]
000d49ce  ldrsb.w r3, [r2]
000d49d2  cmp     r3, #0x2c
000d49d4  bne     #0xd4a22
000d49d6  adds    r3, r2, #1
000d49d8  cmp     r3, #1
000d49da  str     r3, [r5, r1]
000d49dc  beq     #0xd4a22
000d49de  ldr.w   r8, [pc, #0x100]
000d49e2  b       #0xd49ec
000d49e4  ldr     r2, [r4]
000d49e6  ldr     r3, [r5, r2]
000d49e8  adds    r3, #1
000d49ea  str     r3, [r5, r2]
000d49ec  mov     r4, r8
000d49ee  add     r4, pc
000d49f0  mov.w   r1, #0x4000
000d49f4  ldr     r3, [r4]
000d49f6  ldr     r3, [r5, r3]
000d49f8  ldrsb.w r0, [r3]
000d49fc  bl      #0xd3f9c ; -> ZL8__istypeim
000d4a00  mov     r6, r0
000d4a02  cmp     r0, #0
000d4a04  bne     #0xd49e4
000d4a06  ldr     r3, [r4]
000d4a08  ldr     r3, [r5, r3]
000d4a0a  ldrsb.w r3, [r3]
000d4a0e  cmp     r3, #0x7d
000d4a10  bne     #0xd4a22
000d4a12  ldr     r1, [pc, #0xd0]
000d4a14  ldr     r3, [pc, #0xd0]
000d4a16  movs    r2, #9
000d4a18  add     r1, pc ; -> 0x000fd91c  
000d4a1a  add     r3, pc ; -> 0x00182504  
000d4a1c  ldr     r1, [r1]
000d4a1e  mov     r0, r5
000d4a20  b       #0xd4a44
000d4a22  ldr     r3, [sp]
000d4a24  add     r3, pc
000d4a26  ldr     r3, [r3]
000d4a28  ldr     r3, [r5, r3]
000d4a2a  ldrsb.w r6, [r3]
000d4a2e  cmp     r6, #0
000d4a30  bne.w   #0xd48b2
000d4a34  ldr     r1, [pc, #0xb4]
000d4a36  ldr.w   r3, [pc, #0xb8]
000d4a3a  movs    r2, #0xb
000d4a3c  add     r1, pc ; -> 0x000fd91c  
000d4a3e  add     r3, pc ; -> 0x00182514  
000d4a40  ldr     r1, [r1]
000d4a42  mov     r0, r5
000d4a44  blx     #0xddbfc ; -> objc_msgSend
000d4a48  mov     r0, r6
000d4a4a  b       #0xd4a94
000d4a4c  ldr     r0, [pc, #0xa4]
000d4a4e  ldr     r1, [pc, #0xa8]
000d4a50  movs    r2, #7
000d4a52  add     r0, pc ; -> 0x000fdbf4  
000d4a54  add     r1, pc ; -> 0x000fd940  'k\x19\x0f'
000d4a56  ldr     r0, [r0]
000d4a58  ldr     r1, [r1]
000d4a5a  blx     #0xddbfc ; -> objc_msgSend
000d4a5e  ldr     r1, [pc, #0x9c]
000d4a60  ldr     r3, [sp, #4]
000d4a62  add     r1, pc ; -> 0x000fd958  
000d4a64  ldr     r1, [r1]
000d4a66  str     r0, [r3]
000d4a68  str     r1, [sp, #8]
000d4a6a  ldr     r1, [pc, #0x94]
000d4a6c  ldr     r3, [pc, #0x94]
000d4a6e  add     r1, pc ; -> 0x000fd968  '\x15\x19\x0f'
000d4a70  ldr.w   fp, [r1]
000d4a74  ldr     r1, [pc, #0x90]
000d4a76  str     r3, [sp]
000d4a78  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000d4a7a  ldr.w   sl, [r1]
000d4a7e  b       #0xd4a22
000d4a80  ldr     r3, [pc, #0x88]
000d4a82  add     r3, pc ; -> 0x000fab40  OBJC_IVAR_$_SBJsonParser.c
000d4a84  ldr     r1, [r3]
000d4a86  ldr     r2, [r5, r1]
000d4a88  ldrsb.w r3, [r2]
000d4a8c  cmp     r3, #0x22
000d4a8e  beq.w   #0xd48f6
000d4a92  b       #0xd490e
000d4a94  sub.w   sp, r7, #0x18
000d4a98  pop.w   {r8, sl, fp}
000d4a9c  pop     {r4, r5, r6, r7, pc}
000d4a9e  nop     
000d4aa0  orn     r0, r4, r1
000d4aa4  orrs.w  r0, r8, r1
000d4aa8  str     r0, [sp, #0x1e0]
000d4aaa  movs    r2, r0
000d4aac  bls     #0xd49ec
000d4aae  movs    r2, r1
000d4ab0  str     r6, [r0, #0x28]
000d4ab2  movs    r2, r0
000d4ab4  ldrd    r0, r0, [r0, #4]!
000d4ab8  str     r0, [sp, #0x10]
000d4aba  movs    r2, r0
000d4abc  blt     #0xd4a34
000d4abe  movs    r2, r1
000d4ac0  str     r0, [r1, #0x20]
000d4ac2  movs    r2, r0
000d4ac4  blt     #0xd49d0
000d4ac6  movs    r2, r1
000d4ac8  ldrh    r2, [r7, #0x3c]
000d4aca  movs    r2, r0
000d4acc  str     r1, [sp, #0x378]
000d4ace  movs    r2, r0
000d4ad0  strh    r0, [r4, #8]
000d4ad2  movs    r2, r0
000d4ad4  blt     #0xd4bb0
000d4ad6  movs    r2, r1
000d4ad8  ldrh    r4, [r1, #0x3c]
000d4ada  movs    r2, r0
000d4adc  str     r0, [r1, #0x18]
000d4ade  movs    r2, r0
000d4ae0  str     r6, [r1, #0x14]
000d4ae2  movs    r2, r0
000d4ae4  ldrh    r0, [r0, #0x38]
000d4ae6  movs    r2, r0
000d4ae8  bge     #0xd4ab8
000d4aea  movs    r2, r1
000d4aec  ldrh    r4, [r3, #0x36]
000d4aee  movs    r2, r0
000d4af0  bge     #0xd4a98
000d4af2  movs    r2, r1
000d4af4  str     r1, [sp, #0x278]
000d4af6  movs    r2, r0
000d4af8  ldrh    r0, [r5, #0x36]
000d4afa  movs    r2, r0
000d4afc  ldrh    r2, [r6, #0x36]
000d4afe  movs    r2, r0
000d4b00  ldrh    r6, [r6, #0x36]
000d4b02  movs    r2, r0
000d4b04  str     r0, [r3, #0x10]
000d4b06  movs    r2, r0
000d4b08  strh    r4, [r3, #2]
000d4b0a  movs    r2, r0
000d4b0c  str     r2, [r7, #8]
000d4b0e  movs    r2, r0
