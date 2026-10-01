========================================================================
-[DMGViewController downloadPage]  0x000d0644  792 bytes   DMGViewController.mm
========================================================================

000d0644  push    {r4, r5, r6, r7, lr}
000d0646  add     r7, sp, #0xc
000d0648  push.w  {r8, sl, fp}
000d064c  sub     sp, #0x34
000d064e  ldr     r3, [pc, #0x270]
000d0650  ldr     r2, [pc, #0x270]
000d0652  mov     r6, r0
000d0654  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d0656  add     r2, pc ; -> 0x00180a34  
000d0658  ldr     r3, [r3]
000d065a  ldr     r3, [r0, r3]
000d065c  cmp     r3, r2
000d065e  beq.w   #0xd08b6
000d0662  ldr     r3, [pc, #0x264]
000d0664  add     r3, pc ; -> 0x000fa2b0  OBJC_IVAR_$_DMGViewController.showingLocalData
000d0666  ldr     r3, [r3]
000d0668  ldrsb   r3, [r0, r3]
000d066a  cmp     r3, #0
000d066c  bne.w   #0xd08b6
000d0670  ldr.w   r3, [pc, #0x258]
000d0674  ldr.w   r1, [pc, #0x258]
000d0678  ldr     r2, [pc, #0x258]
000d067a  add     r3, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d067c  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
000d067e  ldr     r3, [r3]
000d0680  ldr     r1, [r1]
000d0682  add     r2, pc ; -> 0x00182704  
000d0684  ldr     r0, [r0, r3]
000d0686  str     r1, [sp]
000d0688  blx     #0xddbfc ; -> objc_msgSend
000d068c  ldr     r2, [pc, #0x248]
000d068e  ldr     r3, [pc, #0x24c]
000d0690  add     r2, pc ; -> 0x000fcdc8  
000d0692  add     r3, pc ; -> 0x00182714  
000d0694  ldr.w   fp, [r2]
000d0698  mov     r2, fp
000d069a  mov     sl, r0
000d069c  mov     r1, sl
000d069e  add     r0, sp, #0x2c
000d06a0  blx     #0xddc14 ; -> objc_msgSend_stret
000d06a4  add     r2, sp, #0x2c
000d06a6  ldm     r2, {r2, r3}
000d06a8  mvn     r1, #0x80000000
000d06ac  cmp     r2, r1
000d06ae  beq     #0xd0708
000d06b0  ldr     r1, [pc, #0x22c]
000d06b2  ldr     r5, [pc, #0x230]
000d06b4  ldr     r2, [pc, #0x230]
000d06b6  add     r1, pc ; -> 0x000fda70  '# \x0f'
000d06b8  add     r5, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d06ba  ldr.w   sl, [r1]
000d06be  ldr     r1, [pc, #0x22c]
000d06c0  ldr     r3, [r5]
000d06c2  add     r2, pc ; -> 0x00182724  
000d06c4  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d06c6  ldr     r4, [r1]
000d06c8  ldr     r0, [r6, r3]
000d06ca  mov     r1, r4
000d06cc  blx     #0xddbfc ; -> objc_msgSend
000d06d0  ldr     r3, [r5]
000d06d2  ldr     r2, [pc, #0x21c]
000d06d4  mov     r1, r4
000d06d6  add     r2, pc ; -> 0x00182734  
000d06d8  mov     r8, r0
000d06da  ldr     r0, [r6, r3]
000d06dc  blx     #0xddbfc ; -> objc_msgSend
000d06e0  mov     r1, sl
000d06e2  mov     r2, r8
000d06e4  mov     r3, r0
000d06e6  mov     r0, r6
000d06e8  blx     #0xddbfc ; -> objc_msgSend
000d06ec  ldr     r1, [pc, #0x204]
000d06ee  mov     r0, r6
000d06f0  add     r1, pc ; -> 0x000fda6c  'p \x0f'
000d06f2  ldr     r1, [r1]
000d06f4  blx     #0xddbfc ; -> objc_msgSend
000d06f8  ldr     r1, [pc, #0x1fc]
000d06fa  ldr     r0, [r5]
000d06fc  add     r1, pc ; -> 0x000fd8e4  '\x7f\x15\x0f'
000d06fe  ldr     r0, [r6, r0]
000d0700  ldr     r1, [r1]
000d0702  blx     #0xddbfc ; -> objc_msgSend
000d0706  b       #0xd08b6
000d0708  ldr     r1, [pc, #0x1f0]
000d070a  ldr     r2, [pc, #0x1f4]
000d070c  mov     r0, sl
000d070e  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000d0710  add     r2, pc ; -> 0x00182744  
000d0712  ldr     r1, [r1]
000d0714  mov.w   r8, #1
000d0718  str     r1, [sp, #4]
000d071a  blx     #0xddbfc ; -> objc_msgSend
000d071e  ldr     r1, [pc, #0x1e4]
000d0720  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d0722  ldr     r1, [r1]
000d0724  str     r1, [sp, #8]
000d0726  ldr     r1, [pc, #0x1e0]
000d0728  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000d072a  ldr     r1, [r1]
000d072c  str     r1, [sp, #0xc]
000d072e  ldr     r1, [pc, #0x1dc]
000d0730  add     r1, pc ; -> 0x000fd350  
000d0732  ldr     r1, [r1]
000d0734  str     r1, [sp, #0x10]
000d0736  ldr     r1, [pc, #0x1d8]
000d0738  str     r0, [sp, #0x28]
000d073a  ldr     r0, [pc, #0x1d8]
000d073c  add     r1, pc ; -> 0x000fda40  
000d073e  ldr     r1, [r1]
000d0740  add     r0, pc ; -> 0x000fdb5c  
000d0742  ldr     r0, [r0]
000d0744  str     r1, [sp, #0x14]
000d0746  ldr     r1, [pc, #0x1d0]
000d0748  str     r0, [sp, #0x20]
000d074a  add     r1, pc ; -> 0x000fda3c  
000d074c  ldr     r1, [r1]
000d074e  str     r1, [sp, #0x18]
000d0750  ldr     r1, [pc, #0x1c8]
000d0752  add     r1, pc ; -> 0x000fcaec  '\x19\x1a\x0e'
000d0754  ldr     r1, [r1]
000d0756  str     r1, [sp, #0x1c]
000d0758  ldr     r1, [pc, #0x1c4]
000d075a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d075c  ldr     r1, [r1]
000d075e  str     r1, [sp, #0x24]
000d0760  b       #0xd07f6
000d0762  ldr     r1, [sp, #0xc]
000d0764  mov     r2, r8
000d0766  ldr     r0, [sp, #0x28]
000d0768  blx     #0xddbfc ; -> objc_msgSend
000d076c  ldr     r3, [pc, #0x1b4]
000d076e  mov     r2, fp
000d0770  add     r3, pc ; -> 0x00182754  
000d0772  mov     r4, r0
000d0774  mov     r1, r4
000d0776  add     r0, sp, #0x2c
000d0778  blx     #0xddc14 ; -> objc_msgSend_stret
000d077c  add     r2, sp, #0x2c
000d077e  ldm     r2, {r2, r3}
000d0780  mvn     r1, #0x80000000
000d0784  cmp     r1, r2
000d0786  beq     #0xd0792
000d0788  mov     r0, r4
000d078a  ldr     r1, [sp, #0x10]
000d078c  blx     #0xddbfc ; -> objc_msgSend
000d0790  mov     r4, r0
000d0792  ldr     r3, [pc, #0x194]
000d0794  mov     r1, r4
000d0796  mov     r2, fp
000d0798  add     r3, pc ; -> 0x00182764  
000d079a  add     r0, sp, #0x2c
000d079c  blx     #0xddc14 ; -> objc_msgSend_stret
000d07a0  add     r2, sp, #0x2c
000d07a2  ldm     r2, {r2, r3}
000d07a4  mvn     r1, #0x80000000
000d07a8  cmp     r2, r1
000d07aa  beq     #0xd07f2
000d07ac  mov     r2, r4
000d07ae  ldr     r1, [sp, #0x14]
000d07b0  mov     r0, r6
000d07b2  blx     #0xddbfc ; -> objc_msgSend
000d07b6  mov     r2, r4
000d07b8  ldr     r1, [sp, #0x18]
000d07ba  mov     r5, r0
000d07bc  mov     r3, r5
000d07be  mov     r0, r6
000d07c0  blx     #0xddbfc ; -> objc_msgSend
000d07c4  ldr     r2, [pc, #0x164]
000d07c6  ldr     r3, [pc, #0x168]
000d07c8  mov     r0, r4
000d07ca  add     r2, pc ; -> 0x0017e8a4  
000d07cc  add     r3, pc ; -> 0x00182774  
000d07ce  ldr     r1, [sp, #0x1c]
000d07d0  blx     #0xddbfc ; -> objc_msgSend
000d07d4  ldr     r2, [pc, #0x15c]
000d07d6  ldr     r1, [sp, #0x24]
000d07d8  mov     r3, r5
000d07da  add     r2, pc ; -> 0x00182784  
000d07dc  mov     r4, r0
000d07de  ldr     r0, [sp, #0x20]
000d07e0  blx     #0xddbfc ; -> objc_msgSend
000d07e4  ldr     r1, [sp, #0x1c]
000d07e6  mov     r2, r4
000d07e8  mov     r3, r0
000d07ea  mov     r0, sl
000d07ec  blx     #0xddbfc ; -> objc_msgSend
000d07f0  mov     sl, r0
000d07f2  add.w   r8, r8, #1
000d07f6  ldr     r0, [sp, #0x28]
000d07f8  ldr     r1, [sp, #8]
000d07fa  blx     #0xddbfc ; -> objc_msgSend
000d07fe  cmp     r0, r8
000d0800  bhi     #0xd0762
000d0802  ldr     r3, [pc, #0x134]
000d0804  ldr     r2, [pc, #0x134]
000d0806  ldr     r1, [sp]
000d0808  add     r3, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d080a  add     r2, pc ; -> 0x0017d004  script
000d080c  ldr     r3, [r3]
000d080e  ldr     r2, [r2]
000d0810  ldr     r0, [r6, r3]
000d0812  blx     #0xddbfc ; -> objc_msgSend
000d0816  cmp     r0, #0
000d0818  beq     #0xd088e
000d081a  ldr     r2, [pc, #0x124]
000d081c  ldr     r1, [sp, #4]
000d081e  mov.w   r8, #0
000d0822  add     r2, pc ; -> 0x0017fe54  
000d0824  blx     #0xddbfc ; -> objc_msgSend
000d0828  mov     fp, r0
000d082a  b       #0xd0882
000d082c  mov     r2, r8
000d082e  ldr     r1, [sp, #0xc]
000d0830  mov     r0, fp
000d0832  blx     #0xddbfc ; -> objc_msgSend
000d0836  ldr     r1, [sp, #0x14]
000d0838  add.w   r8, r8, #1
000d083c  mov     r4, r0
000d083e  mov     r2, r4
000d0840  mov     r0, r6
000d0842  blx     #0xddbfc ; -> objc_msgSend
000d0846  mov     r2, r4
000d0848  ldr     r1, [sp, #0x18]
000d084a  mov     r5, r0
000d084c  mov     r3, r5
000d084e  mov     r0, r6
000d0850  blx     #0xddbfc ; -> objc_msgSend
000d0854  ldr     r2, [pc, #0xec]
000d0856  ldr     r3, [pc, #0xf0]
000d0858  mov     r0, r4
000d085a  add     r2, pc ; -> 0x0017e8a4  
000d085c  add     r3, pc ; -> 0x00182774  
000d085e  ldr     r1, [sp, #0x1c]
000d0860  blx     #0xddbfc ; -> objc_msgSend
000d0864  ldr     r2, [pc, #0xe4]
000d0866  ldr     r1, [sp, #0x24]
000d0868  mov     r3, r5
000d086a  add     r2, pc ; -> 0x00182794  
000d086c  mov     r4, r0
000d086e  ldr     r0, [sp, #0x20]
000d0870  blx     #0xddbfc ; -> objc_msgSend
000d0874  ldr     r1, [sp, #0x1c]
000d0876  mov     r2, r4
000d0878  mov     r3, r0
000d087a  mov     r0, sl
000d087c  blx     #0xddbfc ; -> objc_msgSend
000d0880  mov     sl, r0
000d0882  mov     r0, fp
000d0884  ldr     r1, [sp, #8]
000d0886  blx     #0xddbfc ; -> objc_msgSend
000d088a  cmp     r0, r8
000d088c  bhi     #0xd082c
000d088e  ldr     r3, [pc, #0xc0]
000d0890  add     r3, pc ; -> 0x000f3304  mCachedHTMLData
000d0892  ldr     r4, [r3]
000d0894  ldr     r0, [r4]
000d0896  cbz     r0, #0xd08a6
000d0898  ldr     r1, [pc, #0xb8]
000d089a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d089c  ldr     r1, [r1]
000d089e  blx     #0xddbfc ; -> objc_msgSend
000d08a2  movs    r3, #0
000d08a4  str     r3, [r4]
000d08a6  ldr     r1, [pc, #0xb0]
000d08a8  mov     r0, sl
000d08aa  str.w   sl, [r4]
000d08ae  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d08b0  ldr     r1, [r1]
000d08b2  blx     #0xddbfc ; -> objc_msgSend
000d08b6  sub.w   sp, r7, #0x18
000d08ba  pop.w   {r8, sl, fp}
000d08be  pop     {r4, r5, r6, r7, pc}
000d08c0  ldr     r4, [sp, #0x140]
000d08c2  movs    r2, r0
000d08c4  lsls    r2, r3, #0xf
000d08c6  movs    r3, r1
000d08c8  ldr     r4, [sp, #0x120]
000d08ca  movs    r2, r0
000d08cc  ldr     r4, [sp, #0x88]
000d08ce  movs    r2, r0
000d08d0  stm     r6!, {r6, r7}
000d08d2  movs    r2, r0
000d08d4  movs    r0, #0x7e
000d08d6  movs    r3, r1
000d08d8  stm     r7!, {r2, r4, r5}
000d08da  movs    r2, r0
000d08dc  movs    r0, #0x7e
000d08de  movs    r3, r1
000d08e0  blo     #0xd0850
000d08e2  movs    r2, r0
000d08e4  ldr     r3, [sp, #0x3a0]
000d08e6  movs    r2, r0
000d08e8  movs    r0, #0x5e
000d08ea  movs    r3, r1
000d08ec  blo     #0xd0868
000d08ee  movs    r2, r0
000d08f0  movs    r0, #0x5a
000d08f2  movs    r3, r1
000d08f4  blo     #0xd09e8
000d08f6  movs    r2, r0
000d08f8  bne     #0xd08c4
000d08fa  movs    r2, r0
000d08fc  ldm     r0!, {r1, r2, r7}
000d08fe  movs    r2, r0
000d0900  movs    r0, #0x30
000d0902  movs    r3, r1
000d0904  stm     r3!, {r2, r3, r4, r6}
000d0906  movs    r2, r0
000d0908  stm     r3!, {r4, r6}
000d090a  movs    r2, r0
000d090c  ldm     r4, {r2, r3, r4}
000d090e  movs    r2, r0
000d0910  blo     #0xd0914
000d0912  movs    r2, r0
000d0914  bmi     #0xd0948
000d0916  movs    r2, r0
000d0918  bhs     #0xd08f8
000d091a  movs    r2, r0
000d091c  stm     r3!, {r1, r2, r4, r7}
000d091e  movs    r2, r0
000d0920  stm     r3!, {r1, r6}
000d0922  movs    r2, r0
000d0924  subs    r0, r4, #7
000d0926  movs    r3, r1
000d0928  subs    r0, r1, #7
000d092a  movs    r3, r1
000d092c  b       #0xd0adc
000d092e  movs    r2, r1
000d0930  subs    r4, r4, #6
000d0932  movs    r3, r1
000d0934  subs    r6, r4, #6
000d0936  movs    r3, r1
000d0938  ldr     r2, [sp, #0x250]
000d093a  movs    r2, r0
000d093c  stm     r7!, {r1, r2, r4, r5, r6, r7}
000d093e  movs    r2, r1
