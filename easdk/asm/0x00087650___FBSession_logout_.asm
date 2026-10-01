========================================================================
-[FBSession logout]  0x00087650  620 bytes   FBSession.m
========================================================================

00087650  push    {r4, r5, r6, r7, lr}
00087652  add     r7, sp, #0xc
00087654  push.w  {r8, sl, fp}
00087658  sub     sp, #0xdc
0008765a  ldr     r3, [pc, #0x210]
0008765c  mov     r8, r0
0008765e  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00087660  ldr     r3, [r3]
00087662  ldr     r3, [r0, r3]
00087664  cmp     r3, #0
00087666  beq.w   #0x877c0
0008766a  movs    r3, #0
0008766c  str     r3, [sp, #0xbc]
0008766e  str     r3, [sp, #0xc0]
00087670  str     r3, [sp, #0xc4]
00087672  str     r3, [sp, #0xc8]
00087674  str     r3, [sp, #0xcc]
00087676  str     r3, [sp, #0xd0]
00087678  str     r3, [sp, #0xd4]
0008767a  str     r3, [sp, #0xd8]
0008767c  ldr     r3, [pc, #0x1f0]
0008767e  ldr.w   r1, [pc, #0x1f4]
00087682  add     r2, sp, #0xbc
00087684  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087686  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
00087688  ldr     r0, [r3]
0008768a  ldr     r1, [r1]
0008768c  movs    r3, #0x10
0008768e  str     r3, [sp]
00087690  ldr.w   r0, [r8, r0]
00087694  add     r3, sp, #0x5c
00087696  str     r1, [sp, #8]
00087698  str     r0, [sp, #4]
0008769a  blx     #0xddbfc ; -> objc_msgSend
0008769e  cmp     r0, #0
000876a0  bne.w   #0x877e0
000876a4  ldr     r1, [pc, #0x1d0]
000876a6  mov     r0, r8
000876a8  ldr.w   r4, [pc, #0x1d0]
000876ac  add     r1, pc ; -> 0x000fceb8  'v?\x0e'
000876ae  movs    r5, #0
000876b0  ldr     r1, [r1]
000876b2  blx     #0xddbfc ; -> objc_msgSend
000876b6  ldr     r3, [pc, #0x1c8]
000876b8  movs    r2, #0
000876ba  movs    r1, #0
000876bc  add     r3, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
000876be  add     r4, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
000876c0  ldr     r3, [r3]
000876c2  add     r3, r8
000876c4  stm.w   r3, {r1, r2}
000876c8  ldr     r1, [pc, #0x1b8]
000876ca  ldr     r3, [r4]
000876cc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000876ce  ldr     r6, [r1]
000876d0  ldr.w   r0, [r8, r3]
000876d4  mov     r1, r6
000876d6  blx     #0xddbfc ; -> objc_msgSend
000876da  ldr     r3, [r4]
000876dc  ldr     r4, [pc, #0x1a8]
000876de  mov     r1, r6
000876e0  add     r4, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
000876e2  str.w   r5, [r8, r3]
000876e6  ldr     r3, [r4]
000876e8  ldr.w   r0, [r8, r3]
000876ec  blx     #0xddbfc ; -> objc_msgSend
000876f0  ldr     r3, [r4]
000876f2  ldr     r4, [pc, #0x198]
000876f4  mov     r1, r6
000876f6  add     r4, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
000876f8  str.w   r5, [r8, r3]
000876fc  ldr     r3, [r4]
000876fe  ldr.w   r0, [r8, r3]
00087702  blx     #0xddbfc ; -> objc_msgSend
00087706  ldr     r1, [pc, #0x188]
00087708  ldr     r3, [r4]
0008770a  mov     r0, r8
0008770c  add     r1, pc ; -> 0x000fceb4  '^@\x0e'
0008770e  ldr     r1, [r1]
00087710  str.w   r5, [r8, r3]
00087714  blx     #0xddbfc ; -> objc_msgSend
00087718  ldr     r3, [pc, #0x178]
0008771a  ldr     r1, [sp, #8]
0008771c  add     r2, sp, #0x9c
0008771e  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087720  str     r5, [sp, #0x9c]
00087722  ldr     r0, [r3]
00087724  movs    r3, #0x10
00087726  str     r3, [sp]
00087728  add     r3, sp, #0x1c
0008772a  ldr.w   r0, [r8, r0]
0008772e  str     r5, [sp, #0xa0]
00087730  str     r5, [sp, #0xa4]
00087732  str     r5, [sp, #0xa8]
00087734  str     r5, [sp, #0xac]
00087736  str     r5, [sp, #0xb0]
00087738  str     r5, [sp, #0xb4]
0008773a  str     r5, [sp, #0xb8]
0008773c  str     r0, [sp, #0x10]
0008773e  blx     #0xddbfc ; -> objc_msgSend
00087742  cmp     r0, #0
00087744  beq     #0x877d6
00087746  ldr     r1, [pc, #0x150]
00087748  ldr     r3, [sp, #0xa4]
0008774a  mov     r6, r0
0008774c  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
0008774e  ldr.w   fp, [r1]
00087752  ldr     r1, [pc, #0x148]
00087754  ldr     r3, [r3]
00087756  add     r1, pc ; -> 0x000fceb0  '\x0c1\x0e'
00087758  ldr.w   sl, [r1]
0008775c  str     r3, [sp, #0x14]
0008775e  movs    r5, #0
00087760  b       #0x8776c
00087762  adds    r5, #1
00087764  cmp     r6, r5
00087766  bls     #0x877a6
00087768  ldr     r3, [sp, #0xa4]
0008776a  ldr     r3, [r3]
0008776c  ldr     r2, [sp, #0x14]
0008776e  cmp     r2, r3
00087770  beq     #0x87780
00087772  ldr     r3, [pc, #0x12c]
00087774  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087776  ldr     r3, [r3]
00087778  ldr.w   r0, [r8, r3]
0008777c  blx     #0xddbe4 ; -> objc_enumerationMutation
00087780  ldr     r0, [sp, #0xa0]
00087782  mov     r1, fp
00087784  mov     r2, sl
00087786  ldr.w   r4, [r0, r5, lsl #2]
0008778a  mov     r0, r4
0008778c  blx     #0xddbfc ; -> objc_msgSend
00087790  tst.w   r0, #0xff
00087794  beq     #0x87762
00087796  mov     r0, r4
00087798  mov     r1, sl
0008779a  mov     r2, r8
0008779c  adds    r5, #1
0008779e  blx     #0xddbfc ; -> objc_msgSend
000877a2  cmp     r6, r5
000877a4  bhi     #0x87768
000877a6  movs    r3, #0x10
000877a8  ldr     r0, [sp, #0x10]
000877aa  str     r3, [sp]
000877ac  ldr     r1, [sp, #8]
000877ae  add     r2, sp, #0x9c
000877b0  add     r3, sp, #0x1c
000877b2  blx     #0xddbfc ; -> objc_msgSend
000877b6  cbz     r0, #0x877d6
000877b8  ldr     r3, [sp, #0xa4]
000877ba  mov     r6, r0
000877bc  ldr     r3, [r3]
000877be  b       #0x8775e
000877c0  ldr     r1, [pc, #0xe0]
000877c2  add     r1, pc ; -> 0x000fceb8  'v?\x0e'
000877c4  ldr     r1, [r1]
000877c6  blx     #0xddbfc ; -> objc_msgSend
000877ca  ldr     r1, [pc, #0xdc]
000877cc  mov     r0, r8
000877ce  add     r1, pc ; -> 0x000fceb4  '^@\x0e'
000877d0  ldr     r1, [r1]
000877d2  blx     #0xddbfc ; -> objc_msgSend
000877d6  sub.w   sp, r7, #0x18
000877da  pop.w   {r8, sl, fp}
000877de  pop     {r4, r5, r6, r7, pc}
000877e0  ldr     r1, [pc, #0xc8]
000877e2  ldr     r3, [sp, #0xc4]
000877e4  mov     sl, r0
000877e6  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000877e8  ldr     r1, [r1]
000877ea  ldr     r3, [r3]
000877ec  str     r1, [sp, #0xc]
000877ee  ldr     r1, [pc, #0xc0]
000877f0  str     r3, [sp, #0x18]
000877f2  add     r1, pc ; -> 0x000fcebc  
000877f4  ldr.w   fp, [r1]
000877f8  movs    r6, #0
000877fa  b       #0x87806
000877fc  adds    r6, #1
000877fe  cmp     sl, r6
00087800  bls     #0x8784c
00087802  ldr     r3, [sp, #0xc4]
00087804  ldr     r3, [r3]
00087806  ldr     r1, [sp, #0x18]
00087808  cmp     r1, r3
0008780a  beq     #0x8781a
0008780c  ldr     r3, [pc, #0xa4]
0008780e  add     r3, pc ; -> 0x000f5d04  OBJC_IVAR_$_FBSession._delegates
00087810  ldr     r3, [r3]
00087812  ldr.w   r0, [r8, r3]
00087816  blx     #0xddbe4 ; -> objc_enumerationMutation
0008781a  ldr     r0, [sp, #0xc0]
0008781c  ldr     r1, [sp, #0xc]
0008781e  mov     r2, fp
00087820  ldr.w   r5, [r0, r6, lsl #2]
00087824  mov     r0, r5
00087826  blx     #0xddbfc ; -> objc_msgSend
0008782a  tst.w   r0, #0xff
0008782e  beq     #0x877fc
00087830  ldr     r3, [pc, #0x84]
00087832  mov     r0, r5
00087834  mov     r1, fp
00087836  add     r3, pc ; -> 0x000f5d14  OBJC_IVAR_$_FBSession._uid
00087838  mov     r2, r8
0008783a  ldr     r3, [r3]
0008783c  adds    r6, #1
0008783e  add     r3, r8
00087840  ldm     r3, {r3, r4}
00087842  str     r4, [sp]
00087844  blx     #0xddbfc ; -> objc_msgSend
00087848  cmp     sl, r6
0008784a  bhi     #0x87802
0008784c  movs    r3, #0x10
0008784e  ldr     r0, [sp, #4]
00087850  str     r3, [sp]
00087852  ldr     r1, [sp, #8]
00087854  add     r2, sp, #0xbc
00087856  add     r3, sp, #0x5c
00087858  blx     #0xddbfc ; -> objc_msgSend
0008785c  cmp     r0, #0
0008785e  beq.w   #0x876a4
00087862  ldr     r3, [sp, #0xc4]
00087864  mov     sl, r0
00087866  ldr     r3, [r3]
00087868  b       #0x877f8
0008786a  nop     
0008786c  b       #0x875dc
0008786e  movs    r6, r0
00087870  b       #0x8756c ; -> -[FBSession deleteFacebookCookies]
00087872  movs    r6, r0
00087874  strh    r6, [r1, r4]
00087876  movs    r7, r0
00087878  ldr     r0, [r1, r0]
0008787a  movs    r7, r0
0008787c  b       #0x8752c
0008787e  movs    r6, r0
00087880  b       #0x8752c
00087882  movs    r6, r0
00087884  strh    r4, [r5, r2]
00087886  movs    r7, r0
00087888  b       #0x874fc
0008788a  movs    r6, r0
0008788c  b       #0x874dc
0008788e  movs    r6, r0
00087890  ldrsb   r4, [r4, r6]
00087892  movs    r7, r0
00087894  b       #0x8745c
00087896  movs    r6, r0
00087898  strb    r0, [r0, r5]
0008789a  movs    r7, r0
0008789c  ldrsb   r6, [r2, r5]
0008789e  movs    r7, r0
000878a0  b       #0x873bc
000878a2  movs    r6, r0
000878a4  ldrsb   r2, [r6, r3]
000878a6  movs    r7, r0
000878a8  ldrsb   r2, [r4, r3]
000878aa  movs    r7, r0
000878ac  strb    r6, [r4, r2]
000878ae  movs    r7, r0
000878b0  ldrsb   r6, [r0, r3]
000878b2  movs    r7, r0
000878b4  b       #0x8729c
000878b6  movs    r6, r0
000878b8  b       #0x87270 ; -> +[FBSession sessionForApplication:getSessionProxy:delegate:]
000878ba  movs    r6, r0
