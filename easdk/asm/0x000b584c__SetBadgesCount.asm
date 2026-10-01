========================================================================
SetBadgesCount  0x000b584c  576 bytes   EAMTX_Main.mm
========================================================================

000b584c  push    {r4, r5, r6, r7, lr}
000b584e  add     r7, sp, #0xc
000b5850  push.w  {r8, sl, fp}
000b5854  sub     sp, #0x30
000b5856  str     r0, [sp]
000b5858  cmp     r0, #0
000b585a  beq.w   #0xb5a1a
000b585e  ldr     r4, [pc, #0x1c4]
000b5860  add     r4, pc ; -> 0x0038c194  m_BadgesDict
000b5862  ldr     r3, [r4]
000b5864  cbnz    r3, #0xb5884
000b5866  ldr.w   r0, [pc, #0x1c0]
000b586a  ldr     r1, [pc, #0x1c0]
000b586c  add     r0, pc ; -> 0x000fdbf4  
000b586e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5870  ldr     r0, [r0]
000b5872  ldr     r1, [r1]
000b5874  blx     #0xddbfc ; -> objc_msgSend
000b5878  ldr     r1, [pc, #0x1b4]
000b587a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b587c  ldr     r1, [r1]
000b587e  blx     #0xddbfc ; -> objc_msgSend
000b5882  str     r0, [r4]
000b5884  ldr     r1, [pc, #0x1ac]
000b5886  ldr     r0, [sp]
000b5888  mov.w   r8, #0
000b588c  add     r1, pc ; -> 0x000fd3c8  
000b588e  ldr     r1, [r1]
000b5890  blx     #0xddbfc ; -> objc_msgSend
000b5894  ldr     r1, [pc, #0x1a0]
000b5896  ldr     r2, [pc, #0x1a4]
000b5898  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000b589a  add     r2, pc ; -> 0x0017fe54  
000b589c  ldr     r1, [r1]
000b589e  blx     #0xddbfc ; -> objc_msgSend
000b58a2  ldr     r1, [pc, #0x19c]
000b58a4  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b58a6  ldr     r1, [r1]
000b58a8  str     r1, [sp, #4]
000b58aa  ldr     r1, [pc, #0x198]
000b58ac  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b58ae  ldr     r1, [r1]
000b58b0  str     r1, [sp, #8]
000b58b2  ldr     r1, [pc, #0x194]
000b58b4  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b58b6  ldr     r1, [r1]
000b58b8  str     r1, [sp, #0xc]
000b58ba  ldr     r1, [pc, #0x190]
000b58bc  str     r0, [sp, #0x24]
000b58be  ldr     r0, [pc, #0x190]
000b58c0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b58c2  ldr     r1, [r1]
000b58c4  add     r0, pc ; -> 0x000fdb70  
000b58c6  ldr     r0, [r0]
000b58c8  str     r1, [sp, #0x2c]
000b58ca  ldr     r1, [pc, #0x188]
000b58cc  str     r0, [sp, #0x10]
000b58ce  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b58d0  ldr     r0, [pc, #0x184]
000b58d2  ldr     r1, [r1]
000b58d4  add     r0, pc ; -> 0x000fdb5c  
000b58d6  str     r1, [sp, #0x28]
000b58d8  ldr     r1, [pc, #0x180]
000b58da  ldr     r0, [r0]
000b58dc  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b58de  ldr     r1, [r1]
000b58e0  str     r0, [sp, #0x1c]
000b58e2  str     r1, [sp, #0x14]
000b58e4  ldr     r1, [pc, #0x178]
000b58e6  add     r1, pc ; -> 0x000fd6e0  
000b58e8  ldr     r1, [r1]
000b58ea  str     r1, [sp, #0x18]
000b58ec  ldr     r1, [pc, #0x174]
000b58ee  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b58f0  ldr.w   fp, [r1]
000b58f4  ldr     r1, [pc, #0x170]
000b58f6  add     r1, pc ; -> 0x000fd3d8  
000b58f8  ldr.w   sl, [r1]
000b58fc  ldr     r1, [pc, #0x16c]
000b58fe  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b5900  ldr     r1, [r1]
000b5902  str     r1, [sp, #0x20]
000b5904  b       #0xb598e
000b5906  ldr     r1, [sp, #8]
000b5908  mov     r2, r8
000b590a  ldr     r0, [sp, #0x24]
000b590c  blx     #0xddbfc ; -> objc_msgSend
000b5910  ldr     r4, [pc, #0x15c]
000b5912  ldr     r1, [sp, #0xc]
000b5914  add     r4, pc ; -> 0x0038c194  m_BadgesDict
000b5916  mov     r6, r0
000b5918  mov     r2, r6
000b591a  ldr     r0, [r4]
000b591c  blx     #0xddbfc ; -> objc_msgSend
000b5920  cbz     r0, #0xb5926
000b5922  mov     r5, r0
000b5924  b       #0xb5942
000b5926  ldr     r1, [sp, #0x2c]
000b5928  ldr     r0, [sp, #0x10]
000b592a  blx     #0xddbfc ; -> objc_msgSend
000b592e  ldr     r1, [sp, #0x28]
000b5930  blx     #0xddbfc ; -> objc_msgSend
000b5934  ldr     r1, [sp, #0x14]
000b5936  mov     r3, r6
000b5938  mov     r5, r0
000b593a  mov     r2, r5
000b593c  ldr     r0, [r4]
000b593e  blx     #0xddbfc ; -> objc_msgSend
000b5942  mov     r1, sl
000b5944  ldr     r0, [sp]
000b5946  blx     #0xddbfc ; -> objc_msgSend
000b594a  ldr     r4, [pc, #0x128]
000b594c  mov     r1, fp
000b594e  add     r4, pc ; -> 0x0017e5c4  
000b5950  mov     r2, r4
000b5952  mov     r3, r0
000b5954  ldr     r0, [sp, #0x1c]
000b5956  blx     #0xddbfc ; -> objc_msgSend
000b595a  ldr     r1, [sp, #0x18]
000b595c  mov     r2, r0
000b595e  mov     r0, r5
000b5960  blx     #0xddbfc ; -> objc_msgSend
000b5964  mvn     r3, #0x80000000
000b5968  cmp     r0, r3
000b596a  bne     #0xb598a
000b596c  mov     r1, sl
000b596e  ldr     r0, [sp]
000b5970  blx     #0xddbfc ; -> objc_msgSend
000b5974  mov     r1, fp
000b5976  mov     r2, r4
000b5978  mov     r3, r0
000b597a  ldr     r0, [sp, #0x1c]
000b597c  blx     #0xddbfc ; -> objc_msgSend
000b5980  ldr     r1, [sp, #0x20]
000b5982  mov     r2, r0
000b5984  mov     r0, r5
000b5986  blx     #0xddbfc ; -> objc_msgSend
000b598a  add.w   r8, r8, #1
000b598e  ldr     r0, [sp, #0x24]
000b5990  ldr     r1, [sp, #4]
000b5992  blx     #0xddbfc ; -> objc_msgSend
000b5996  cmp     r0, r8
000b5998  bhi     #0xb5906
000b599a  ldr     r0, [pc, #0xdc]
000b599c  ldr     r2, [pc, #0xdc]
000b599e  ldr     r1, [sp, #0xc]
000b59a0  add     r0, pc ; -> 0x0038c194  m_BadgesDict
000b59a2  add     r2, pc ; -> 0x0017fe64  
000b59a4  ldr     r0, [r0]
000b59a6  blx     #0xddbfc ; -> objc_msgSend
000b59aa  cbz     r0, #0xb59b0
000b59ac  mov     r5, r0
000b59ae  b       #0xb59d2
000b59b0  ldr     r1, [sp, #0x2c]
000b59b2  ldr     r0, [sp, #0x10]
000b59b4  blx     #0xddbfc ; -> objc_msgSend
000b59b8  ldr     r1, [sp, #0x28]
000b59ba  blx     #0xddbfc ; -> objc_msgSend
000b59be  ldr     r3, [pc, #0xc0]
000b59c0  ldr     r1, [sp, #0x14]
000b59c2  add     r3, pc ; -> 0x0017fe64  
000b59c4  mov     r5, r0
000b59c6  ldr     r0, [pc, #0xbc]
000b59c8  mov     r2, r5
000b59ca  add     r0, pc ; -> 0x0038c194  m_BadgesDict
000b59cc  ldr     r0, [r0]
000b59ce  blx     #0xddbfc ; -> objc_msgSend
000b59d2  mov     r1, sl
000b59d4  ldr     r0, [sp]
000b59d6  blx     #0xddbfc ; -> objc_msgSend
000b59da  ldr     r4, [pc, #0xac]
000b59dc  mov     r1, fp
000b59de  add     r4, pc ; -> 0x0017e5c4  
000b59e0  mov     r2, r4
000b59e2  mov     r3, r0
000b59e4  ldr     r0, [sp, #0x1c]
000b59e6  blx     #0xddbfc ; -> objc_msgSend
000b59ea  ldr     r1, [sp, #0x18]
000b59ec  mov     r2, r0
000b59ee  mov     r0, r5
000b59f0  blx     #0xddbfc ; -> objc_msgSend
000b59f4  mvn     r3, #0x80000000
000b59f8  cmp     r0, r3
000b59fa  bne     #0xb5a1a
000b59fc  mov     r1, sl
000b59fe  ldr     r0, [sp]
000b5a00  blx     #0xddbfc ; -> objc_msgSend
000b5a04  mov     r1, fp
000b5a06  mov     r2, r4
000b5a08  mov     r3, r0
000b5a0a  ldr     r0, [sp, #0x1c]
000b5a0c  blx     #0xddbfc ; -> objc_msgSend
000b5a10  ldr     r1, [sp, #0x20]
000b5a12  mov     r2, r0
000b5a14  mov     r0, r5
000b5a16  blx     #0xddbfc ; -> objc_msgSend
000b5a1a  sub.w   sp, r7, #0x18
000b5a1e  pop.w   {r8, sl, fp}
000b5a22  pop     {r4, r5, r6, r7, pc}
000b5a24  ldr     r0, [r6, #0x10]
000b5a26  movs    r5, r5
000b5a28  strh    r4, [r0, #0x1c]
000b5a2a  movs    r4, r0
000b5a2c  strb    r2, [r2, #4]
000b5a2e  movs    r4, r0
000b5a30  strb    r2, [r0, #4]
000b5a32  movs    r4, r0
000b5a34  ldrb    r0, [r7, #0xc]
000b5a36  movs    r4, r0
000b5a38  strb    r4, [r7, #0x1b]
000b5a3a  movs    r4, r0
000b5a3c  adr     r5, #0x2d8
000b5a3e  movs    r4, r1
000b5a40  strb    r0, [r3, #7]
000b5a42  movs    r4, r0
000b5a44  strb    r4, [r1, #7]
000b5a46  movs    r4, r0
000b5a48  strb    r0, [r7, #8]
000b5a4a  movs    r4, r0
000b5a4c  strb    r0, [r0, #3]
000b5a4e  movs    r4, r0
000b5a50  strh    r0, [r5, #0x14]
000b5a52  movs    r4, r0
000b5a54  strb    r6, [r5, #2]
000b5a56  movs    r4, r0
000b5a58  strh    r4, [r0, #0x14]
000b5a5a  movs    r4, r0
000b5a5c  strb    r0, [r7, #7]
000b5a5e  movs    r4, r0
000b5a60  ldrb    r6, [r6, #0x17]
000b5a62  movs    r4, r0
000b5a64  strb    r6, [r5, #6]
000b5a66  movs    r4, r0
000b5a68  ldrb    r6, [r3, #0xb]
000b5a6a  movs    r4, r0
000b5a6c  strb    r2, [r0, #6]
000b5a6e  movs    r4, r0
000b5a70  ldr     r4, [r7, #4]
000b5a72  movs    r5, r5
000b5a74  ldrh    r2, [r6, #0x22]
000b5a76  movs    r4, r1
000b5a78  str     r0, [r6, #0x7c]
000b5a7a  movs    r5, r5
000b5a7c  adr     r4, #0x2f8
000b5a7e  movs    r4, r1
000b5a80  adr     r4, #0x278
000b5a82  movs    r4, r1
000b5a84  str     r6, [r0, #0x7c]
000b5a86  movs    r5, r5
000b5a88  ldrh    r2, [r4, #0x1e]
000b5a8a  movs    r4, r1
