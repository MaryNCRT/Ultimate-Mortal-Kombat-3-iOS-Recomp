========================================================================
-[FBRequest parseXMLResponse  0x00086070  508 bytes   FBRequest.m
========================================================================

00086070  push    {r4, r5, r6, r7, lr}
00086072  add     r7, sp, #0xc
00086074  push.w  {r8, sl, fp}
00086078  sub     sp, #0x1c
0008607a  ldr     r1, [pc, #0x184]
0008607c  ldr     r0, [pc, #0x184]
0008607e  mov     sl, r3
00086080  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00086082  add     r0, pc ; -> 0x000fdbfc  
00086084  ldr     r4, [r1]
00086086  ldr     r0, [r0]
00086088  mov     r8, r2
0008608a  mov     r1, r4
0008608c  blx     #0xddbfc ; -> objc_msgSend
00086090  ldr     r1, [pc, #0x174]
00086092  add     r1, pc ; -> 0x000fc980  '$(\x0e'
00086094  ldr     r1, [r1]
00086096  blx     #0xddbfc ; -> objc_msgSend
0008609a  ldr     r1, [pc, #0x170]
0008609c  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008609e  ldr     r6, [r1]
000860a0  mov     r1, r6
000860a2  blx     #0xddbfc ; -> objc_msgSend
000860a6  mov     r1, r4
000860a8  mov     r5, r0
000860aa  ldr     r0, [pc, #0x164]
000860ac  add     r0, pc ; -> 0x000fdc00  
000860ae  ldr     r0, [r0]
000860b0  blx     #0xddbfc ; -> objc_msgSend
000860b4  ldr     r1, [pc, #0x15c]
000860b6  mov     r2, r8
000860b8  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000860ba  ldr     r1, [r1]
000860bc  blx     #0xddbfc ; -> objc_msgSend
000860c0  mov     r1, r6
000860c2  blx     #0xddbfc ; -> objc_msgSend
000860c6  ldr     r1, [pc, #0x150]
000860c8  mov     r2, r5
000860ca  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000860cc  ldr     r1, [r1]
000860ce  mov     r4, r0
000860d0  blx     #0xddbfc ; -> objc_msgSend
000860d4  ldr     r1, [pc, #0x144]
000860d6  mov     r0, r4
000860d8  add     r1, pc ; -> 0x000fce60  '8U\x0e'
000860da  ldr     r1, [r1]
000860dc  blx     #0xddbfc ; -> objc_msgSend
000860e0  ldr     r1, [pc, #0x13c]
000860e2  mov     r0, r5
000860e4  add     r1, pc ; -> 0x000fce58  
000860e6  ldr     r4, [r1]
000860e8  mov     r1, r4
000860ea  blx     #0xddbfc ; -> objc_msgSend
000860ee  mov     r8, r0
000860f0  cbz     r0, #0x86104
000860f2  cmp.w   sl, #0
000860f6  bne     #0x86142
000860f8  movs    r0, #0
000860fa  sub.w   sp, r7, #0x18
000860fe  pop.w   {r8, sl, fp}
00086102  pop     {r4, r5, r6, r7, pc}
00086104  ldr     r1, [pc, #0x11c]
00086106  mov     r0, r5
00086108  add     r1, pc ; -> 0x000fce54  
0008610a  ldr     r1, [r1]
0008610c  blx     #0xddbfc ; -> objc_msgSend
00086110  ldr     r1, [pc, #0x114]
00086112  ldr     r2, [pc, #0x118]
00086114  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00086116  add     r2, pc ; -> 0x0017eb64  
00086118  ldr     r1, [r1]
0008611a  blx     #0xddbfc ; -> objc_msgSend
0008611e  tst.w   r0, #0xff
00086122  bne     #0x86162
00086124  ldr     r1, [pc, #0x108]
00086126  mov     r0, r5
00086128  add     r1, pc ; -> 0x000fce50  
0008612a  ldr     r1, [r1]
0008612c  blx     #0xddbfc ; -> objc_msgSend
00086130  ldr     r1, [pc, #0x100]
00086132  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00086134  ldr     r1, [r1]
00086136  blx     #0xddbfc ; -> objc_msgSend
0008613a  mov     r1, r6
0008613c  blx     #0xddbfc ; -> objc_msgSend
00086140  b       #0x860fa
00086142  mov     r1, r4
00086144  mov     r0, r5
00086146  blx     #0xddbfc ; -> objc_msgSend
0008614a  ldr     r1, [pc, #0xec]
0008614c  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
0008614e  ldr     r1, [r1]
00086150  blx     #0xddbfc ; -> objc_msgSend
00086154  mov     r1, r6
00086156  blx     #0xddbfc ; -> objc_msgSend
0008615a  str.w   r0, [sl]
0008615e  movs    r0, #0
00086160  b       #0x860fa
00086162  ldr     r1, [pc, #0xd8]
00086164  mov     r0, r5
00086166  ldr     r4, [pc, #0xd8]
00086168  add     r1, pc ; -> 0x000fce50  
0008616a  ldr     r1, [r1]
0008616c  blx     #0xddbfc ; -> objc_msgSend
00086170  ldr     r1, [pc, #0xd0]
00086172  ldr     r2, [pc, #0xd4]
00086174  add     r4, pc ; -> 0x0017eb94  
00086176  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00086178  add     r2, pc ; -> 0x0017eb74  
0008617a  ldr     r5, [r1]
0008617c  mov     r1, r5
0008617e  mov     r6, r0
00086180  blx     #0xddbfc ; -> objc_msgSend
00086184  ldr     r1, [pc, #0xc4]
00086186  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
00086188  ldr     r1, [r1]
0008618a  blx     #0xddbfc ; -> objc_msgSend
0008618e  ldr     r1, [pc, #0xc0]
00086190  ldr     r2, [pc, #0xc0]
00086192  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
00086194  add     r2, pc ; -> 0x0017eb84  
00086196  ldr     r1, [r1]
00086198  str     r1, [sp, #0x10]
0008619a  mov     r1, r5
0008619c  str     r0, [sp, #0x18]
0008619e  ldr     r0, [pc, #0xb8]
000861a0  add     r0, pc ; -> 0x000fdb44  
000861a2  ldr     r0, [r0]
000861a4  str     r0, [sp, #0xc]
000861a6  mov     r0, r6
000861a8  blx     #0xddbfc ; -> objc_msgSend
000861ac  ldr     r3, [pc, #0xac]
000861ae  mov     r1, r5
000861b0  mov     r2, r4
000861b2  add     r3, pc ; -> 0x000f3430  0x0
000861b4  ldr     r3, [r3]
000861b6  ldr.w   fp, [r3]
000861ba  str     r0, [sp, #0x14]
000861bc  mov     r0, r6
000861be  blx     #0xddbfc ; -> objc_msgSend
000861c2  mov     r3, fp
000861c4  ldr     r1, [sp, #0x10]
000861c6  ldr     r2, [sp, #0x14]
000861c8  str     r4, [sp, #4]
000861ca  str.w   r8, [sp, #8]
000861ce  str     r0, [sp]
000861d0  ldr     r0, [sp, #0xc]
000861d2  blx     #0xddbfc ; -> objc_msgSend
000861d6  mov     r3, r0
000861d8  cmp.w   sl, #0
000861dc  beq     #0x860f8
000861de  ldr     r0, [pc, #0x80]
000861e0  ldr     r1, [pc, #0x80]
000861e2  ldr     r2, [pc, #0x84]
000861e4  add     r0, pc ; -> 0x000fdc04  
000861e6  add     r1, pc ; -> 0x000fce5c  
000861e8  str     r3, [sp]
000861ea  ldr     r0, [r0]
000861ec  add     r2, pc ; -> 0x0017eba4  
000861ee  ldr     r1, [r1]
000861f0  ldr     r3, [sp, #0x18]
000861f2  blx     #0xddbfc ; -> objc_msgSend
000861f6  str.w   r0, [sl]
000861fa  mov     r0, r8
000861fc  b       #0x860fa
000861fe  nop     
00086200  ldr     r0, [r0, #0x10]
00086202  movs    r7, r0
00086204  ldrb    r6, [r6, #0xd]
00086206  movs    r7, r0
00086208  ldr     r2, [r5, #0xc]
0008620a  movs    r7, r0
0008620c  ldr     r0, [r7, #0x18]
0008620e  movs    r7, r0
00086210  ldrb    r0, [r2, #0xd]
00086212  movs    r7, r0
00086214  ldr     r0, [r5, #0x58]
00086216  movs    r7, r0
00086218  ldr     r2, [r5, #0x38]
0008621a  movs    r7, r0
0008621c  ldr     r4, [r0, #0x58]
0008621e  movs    r7, r0
00086220  ldr     r0, [r6, #0x54]
00086222  movs    r7, r0
00086224  ldr     r0, [r1, #0x54]
00086226  movs    r7, r0
00086228  ldr     r0, [r6, #0x1c]
0008622a  movs    r7, r0
0008622c  ldrh    r2, [r1, #0x12]
0008622e  movs    r7, r1
00086230  ldr     r4, [r4, #0x50]
00086232  movs    r7, r0
00086234  ldr     r2, [r3, #0x38]
00086236  movs    r7, r0
00086238  ldr     r0, [r0, #0x38]
0008623a  movs    r7, r0
0008623c  ldr     r4, [r4, #0x4c]
0008623e  movs    r7, r0
00086240  ldrh    r4, [r3, #0x10]
00086242  movs    r7, r1
00086244  ldr     r2, [r3, #0x14]
00086246  movs    r7, r0
00086248  ldrh    r0, [r7, #0xe]
0008624a  movs    r7, r1
0008624c  ldr     r6, [r3, #0x14]
0008624e  movs    r7, r0
00086250  ldr     r6, [r4, #4]
00086252  movs    r7, r0
00086254  ldrh    r4, [r5, #0xe]
00086256  movs    r7, r1
00086258  ldrb    r0, [r4, #6]
0008625a  movs    r7, r0
0008625c  bhs     #0x86354
0008625e  movs    r6, r0
00086260  ldrb    r4, [r3, #8]
00086262  movs    r7, r0
00086264  ldr     r2, [r6, #0x44]
00086266  movs    r7, r0
00086268  ldrh    r4, [r6, #0xc]
0008626a  movs    r7, r1
