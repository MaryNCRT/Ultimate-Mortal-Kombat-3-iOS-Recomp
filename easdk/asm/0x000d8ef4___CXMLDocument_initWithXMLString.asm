========================================================================
-[CXMLDocument initWithXMLString  0x000d8ef4  388 bytes   CXMLDocument.m
========================================================================

000d8ef4  push    {r4, r5, r6, r7, lr}
000d8ef6  add     r7, sp, #0xc
000d8ef8  push.w  {r8, sl, fp}
000d8efc  sub     sp, #0x28
000d8efe  ldr     r3, [pc, #0x128]
000d8f00  mov     sl, r1
000d8f02  ldr     r1, [pc, #0x128]
000d8f04  add     r3, pc ; -> 0x000fddf4  
000d8f06  str     r0, [sp, #0x20]
000d8f08  ldr     r3, [r3]
000d8f0a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d8f0c  add     r0, sp, #0x20
000d8f0e  ldr     r1, [r1]
000d8f10  mov     r4, r2
000d8f12  ldr.w   fp, [sp, #0x48]
000d8f16  str     r3, [sp, #0x24]
000d8f18  blx     #0xddc08 ; -> objc_msgSendSuper2
000d8f1c  mov     r5, r0
000d8f1e  cmp     r0, #0
000d8f20  beq     #0xd901a
000d8f22  ldr     r1, [pc, #0x10c]
000d8f24  mov     r0, r4
000d8f26  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000d8f28  ldr     r1, [r1]
000d8f2a  blx     #0xddbfc ; -> objc_msgSend
000d8f2e  blx     #0xdded8 ; -> xmlParseDoc
000d8f32  mov     r4, r0
000d8f34  cmp     r0, #0
000d8f36  beq     #0xd8fa6
000d8f38  ldr     r3, [pc, #0xf8]
000d8f3a  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d8f3c  ldr     r6, [r3]
000d8f3e  ldr     r3, [r6]
000d8f40  str     r0, [r5, r3]
000d8f42  ldr     r3, [r6]
000d8f44  ldr     r3, [r5, r3]
000d8f46  ldr     r3, [r3]
000d8f48  cmp     r3, #0
000d8f4a  beq     #0xd8f9c
000d8f4c  ldr     r0, [pc, #0xe8]
000d8f4e  ldr     r1, [pc, #0xec]
000d8f50  add     r0, pc ; -> 0x000fdcd4  
000d8f52  add     r1, pc ; -> 0x000fd860  
000d8f54  ldr     r0, [r0]
000d8f56  ldr     r1, [r1]
000d8f58  blx     #0xddbfc ; -> objc_msgSend
000d8f5c  ldr     r1, [pc, #0xe0]
000d8f5e  ldr     r2, [pc, #0xe4]
000d8f60  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d8f62  add     r2, pc ; -> 0x000ec400  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLDocument.m'
000d8f64  ldr     r4, [r1]
000d8f66  ldr     r1, [pc, #0xe0]
000d8f68  add     r1, pc ; -> 0x000fd77c  
000d8f6a  ldr     r1, [r1]
000d8f6c  mov     r8, r0
000d8f6e  ldr     r0, [pc, #0xdc]
000d8f70  add     r0, pc ; -> 0x000fdb5c  
000d8f72  ldr     r0, [r0]
000d8f74  blx     #0xddbfc ; -> objc_msgSend
000d8f78  ldr     r3, [pc, #0xd4]
000d8f7a  movs    r2, #0x40
000d8f7c  mov     r1, r4
000d8f7e  add     r3, pc ; -> 0x00181f34  
000d8f80  str     r2, [sp, #4]
000d8f82  str     r3, [sp, #8]
000d8f84  mov     r2, sl
000d8f86  movs    r3, #0
000d8f88  str     r3, [sp, #0xc]
000d8f8a  str     r3, [sp, #0x10]
000d8f8c  str     r3, [sp, #0x14]
000d8f8e  str     r3, [sp, #0x18]
000d8f90  str     r3, [sp, #0x1c]
000d8f92  mov     r3, r5
000d8f94  str     r0, [sp]
000d8f96  mov     r0, r8
000d8f98  blx     #0xddbfc ; -> objc_msgSend
000d8f9c  ldr     r3, [r6]
000d8f9e  movs    r4, #0
000d8fa0  ldr     r3, [r5, r3]
000d8fa2  str     r5, [r3]
000d8fa4  b       #0xd9000
000d8fa6  blx     #0xdde90 ; -> xmlGetLastError
000d8faa  ldr     r1, [pc, #0xa8]
000d8fac  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000d8fae  ldr     r6, [r1]
000d8fb0  ldr     r1, [pc, #0xa4]
000d8fb2  add     r1, pc ; -> 0x000fd77c  
000d8fb4  ldr     r1, [r1]
000d8fb6  mov     r3, r0
000d8fb8  ldr     r0, [pc, #0xa0]
000d8fba  ldr     r2, [r3, #8]
000d8fbc  add     r0, pc ; -> 0x000fdb44  
000d8fbe  ldr.w   r8, [r0]
000d8fc2  ldr     r0, [pc, #0x9c]
000d8fc4  add     r0, pc ; -> 0x000fdb5c  
000d8fc6  ldr     r0, [r0]
000d8fc8  blx     #0xddbfc ; -> objc_msgSend
000d8fcc  ldr     r3, [pc, #0x94]
000d8fce  mov     r1, r6
000d8fd0  str     r4, [sp]
000d8fd2  add     r3, pc ; -> 0x000f3430  0x0
000d8fd4  ldr     r3, [r3]
000d8fd6  ldr     r3, [r3]
000d8fd8  mov     r2, r0
000d8fda  mov     r0, r8
000d8fdc  blx     #0xddbfc ; -> objc_msgSend
000d8fe0  ldr     r1, [pc, #0x84]
000d8fe2  ldr     r2, [pc, #0x88]
000d8fe4  add     r1, pc ; -> 0x000fce5c  
000d8fe6  add     r2, pc ; -> 0x00181f44  
000d8fe8  ldr     r1, [r1]
000d8fea  mov     r3, r0
000d8fec  ldr     r0, [pc, #0x80]
000d8fee  str     r3, [sp]
000d8ff0  movs    r3, #1
000d8ff2  add     r0, pc ; -> 0x000fdc04  
000d8ff4  ldr     r0, [r0]
000d8ff6  blx     #0xddbfc ; -> objc_msgSend
000d8ffa  mov     r4, r0
000d8ffc  blx     #0xddef0 ; -> xmlResetLastError
000d9000  cmp.w   fp, #0
000d9004  beq     #0xd900a
000d9006  str.w   r4, [fp]
000d900a  cbz     r4, #0xd901a
000d900c  ldr     r1, [pc, #0x64]
000d900e  mov     r0, r5
000d9010  movs    r5, #0
000d9012  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d9014  ldr     r1, [r1]
000d9016  blx     #0xddbfc ; -> objc_msgSend
000d901a  mov     r0, r5
000d901c  sub.w   sp, r7, #0x18
000d9020  pop.w   {r8, sl, fp}
000d9024  pop     {r4, r5, r6, r7, pc}
000d9026  nop     
000d9028  ldr     r6, [pc, #0x3b0]
000d902a  movs    r2, r0
000d902c  subs    r2, #0x72
000d902e  movs    r2, r0
000d9030  subs    r2, #0xf6
000d9032  movs    r2, r0
000d9034  adr     r4, #0x48
000d9036  movs    r1, r0
000d9038  ldr     r5, [pc, #0x200]
000d903a  movs    r2, r0
000d903c  ldr     r1, [pc, #0x28]
000d903e  movs    r2, r0
000d9040  ldr     r0, [pc, #0x3e0]
000d9042  movs    r2, r0
000d9044  adds    r4, #0x9a
000d9046  movs    r1, r0
000d9048  ldr     r0, [pc, #0x40]
000d904a  movs    r2, r0
000d904c  ldr     r3, [pc, #0x3a0]
000d904e  movs    r2, r0
000d9050  ldrh    r2, [r6, #0x3c]
000d9052  movs    r2, r1
000d9054  subs    r2, #0x4c
000d9056  movs    r2, r0
000d9058  blxns   r8
000d905a  movs    r2, r0
000d905c  ldr     r3, [pc, #0x210]
000d905e  movs    r2, r0
000d9060  ldr     r3, [pc, #0x250]
000d9062  movs    r2, r0
000d9064  adr     r4, #0x168
000d9066  movs    r1, r0
000d9068  subs    r6, #0x74
000d906a  movs    r2, r0
000d906c  ldrh    r2, [r3, #0x3a]
000d906e  movs    r2, r1
000d9070  ldr     r4, [pc, #0x38]
000d9072  movs    r2, r0
000d9074  subs    r1, #0x66
000d9076  movs    r2, r0
