========================================================================
-[CXMLDocument initWithData  0x000d9078  244 bytes   CXMLDocument.m
========================================================================

000d9078  push    {r4, r5, r6, r7, lr}
000d907a  add     r7, sp, #0xc
000d907c  push.w  {r8, sl, fp}
000d9080  sub     sp, #0xc
000d9082  mov     r8, r3
000d9084  ldr     r3, [pc, #0xc0]
000d9086  ldr     r1, [pc, #0xc4]
000d9088  str     r0, [sp, #4]
000d908a  add     r3, pc ; -> 0x000fddf4  
000d908c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d908e  ldr     r3, [r3]
000d9090  ldr     r1, [r1]
000d9092  add     r0, sp, #4
000d9094  mov     r5, r2
000d9096  ldr.w   fp, [sp, #0x30]
000d909a  str     r3, [sp, #8]
000d909c  blx     #0xddc08 ; -> objc_msgSendSuper2
000d90a0  mov     r4, r0
000d90a2  cmp     r0, #0
000d90a4  beq     #0xd913c
000d90a6  cmp     r5, #0
000d90a8  beq     #0xd9108
000d90aa  ldr     r1, [pc, #0xa4]
000d90ac  mov     r0, r5
000d90ae  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d90b0  ldr     r6, [r1]
000d90b2  mov     r1, r6
000d90b4  blx     #0xddbfc ; -> objc_msgSend
000d90b8  cbz     r0, #0xd9108
000d90ba  mov     r0, r8
000d90bc  blx     #0xdd1b8 ; -> CFStringConvertNSStringEncodingToEncoding
000d90c0  blx     #0xdd1ac ; -> CFStringConvertEncodingToIANACharSetName
000d90c4  movs    r1, #0
000d90c6  blx     #0xdd1e8 ; -> CFStringGetCStringPtr
000d90ca  ldr     r1, [pc, #0x88]
000d90cc  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
000d90ce  ldr     r1, [r1]
000d90d0  mov     sl, r0
000d90d2  mov     r0, r5
000d90d4  blx     #0xddbfc ; -> objc_msgSend
000d90d8  mov     r1, r6
000d90da  mov     r8, r0
000d90dc  mov     r0, r5
000d90de  blx     #0xddbfc ; -> objc_msgSend
000d90e2  movs    r3, #0x41
000d90e4  movs    r2, #0
000d90e6  str     r3, [sp]
000d90e8  mov     r3, sl
000d90ea  mov     r1, r0
000d90ec  mov     r0, r8
000d90ee  blx     #0xddee4 ; -> xmlReadMemory
000d90f2  cbz     r0, #0xd9108
000d90f4  ldr     r3, [pc, #0x60]
000d90f6  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d90f8  ldr     r2, [r3]
000d90fa  ldr     r3, [r2]
000d90fc  str     r0, [r4, r3]
000d90fe  ldr     r3, [r2]
000d9100  movs    r0, #0
000d9102  ldr     r3, [r4, r3]
000d9104  str     r4, [r3]
000d9106  b       #0xd9122
000d9108  ldr     r0, [pc, #0x50]
000d910a  ldr     r1, [pc, #0x54]
000d910c  ldr     r2, [pc, #0x54]
000d910e  add     r0, pc ; -> 0x000fdc04  
000d9110  add     r1, pc ; -> 0x000fce5c  
000d9112  movs    r3, #0
000d9114  ldr     r0, [r0]
000d9116  str     r3, [sp]
000d9118  add     r2, pc ; -> 0x00181f44  
000d911a  ldr     r1, [r1]
000d911c  subs    r3, #1
000d911e  blx     #0xddbfc ; -> objc_msgSend
000d9122  cmp.w   fp, #0
000d9126  beq     #0xd912c
000d9128  str.w   r0, [fp]
000d912c  cbz     r0, #0xd913c
000d912e  ldr     r1, [pc, #0x38]
000d9130  mov     r0, r4
000d9132  movs    r4, #0
000d9134  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d9136  ldr     r1, [r1]
000d9138  blx     #0xddbfc ; -> objc_msgSend
000d913c  mov     r0, r4
000d913e  sub.w   sp, r7, #0x18
000d9142  pop.w   {r8, sl, fp}
000d9146  pop     {r4, r5, r6, r7, pc}
000d9148  ldr     r5, [pc, #0x198]
000d914a  movs    r2, r0
000d914c  subs    r0, #0xf0
000d914e  movs    r2, r0
000d9150  subs    r1, #0xc6
000d9152  movs    r2, r0
000d9154  subs    r1, #0xc0
000d9156  movs    r2, r0
000d9158  adr     r2, #0x158
000d915a  movs    r1, r0
000d915c  ldr     r2, [pc, #0x3c8]
000d915e  movs    r2, r0
000d9160  subs    r5, #0x48
000d9162  movs    r2, r0
000d9164  ldrh    r0, [r5, #0x30]
000d9166  movs    r2, r1
000d9168  subs    r0, #0x44
000d916a  movs    r2, r0
