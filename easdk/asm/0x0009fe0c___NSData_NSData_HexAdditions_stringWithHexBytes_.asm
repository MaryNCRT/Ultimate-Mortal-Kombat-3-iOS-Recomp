========================================================================
-[NSData(NSData_HexAdditions) stringWithHexBytes]  0x0009fe0c  164 bytes   Base64Encode.mm
========================================================================

0009fe0c  push    {r4, r5, r6, r7, lr}
0009fe0e  add     r7, sp, #0xc
0009fe10  push.w  {r8, sl, fp}
0009fe14  ldr     r1, [pc, #0x78]
0009fe16  mov     r6, r0
0009fe18  ldr     r0, [pc, #0x78]
0009fe1a  add     r1, pc ; -> 0x000fcea0  
0009fe1c  ldr     r4, [r1]
0009fe1e  ldr     r1, [pc, #0x78]
0009fe20  add     r0, pc ; -> 0x000fdbf8  
0009fe22  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
0009fe24  ldr     r5, [r0]
0009fe26  ldr.w   fp, [r1]
0009fe2a  mov     r0, r6
0009fe2c  mov     r1, fp
0009fe2e  blx     #0xddbfc ; -> objc_msgSend
0009fe32  mov     r1, r4
0009fe34  movs    r4, #0
0009fe36  lsls    r2, r0, #1
0009fe38  mov     r0, r5
0009fe3a  blx     #0xddbfc ; -> objc_msgSend
0009fe3e  ldr     r1, [pc, #0x5c]
0009fe40  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
0009fe42  ldr     r1, [r1]
0009fe44  mov     sl, r0
0009fe46  mov     r0, r6
0009fe48  blx     #0xddbfc ; -> objc_msgSend
0009fe4c  ldr     r1, [pc, #0x50]
0009fe4e  add     r1, pc ; -> 0x000fce9c  
0009fe50  ldr     r5, [r1]
0009fe52  mov     r8, r0
0009fe54  b       #0x9fe68
0009fe56  ldr     r2, [pc, #0x4c]
0009fe58  ldrb.w  r3, [r4, r8]
0009fe5c  mov     r0, sl
0009fe5e  add     r2, pc ; -> 0x0017f474  
0009fe60  mov     r1, r5
0009fe62  blx     #0xddbfc ; -> objc_msgSend
0009fe66  adds    r4, #1
0009fe68  mov     r0, r6
0009fe6a  mov     r1, fp
0009fe6c  blx     #0xddbfc ; -> objc_msgSend
0009fe70  cmp     r0, r4
0009fe72  bhi     #0x9fe56
0009fe74  ldr     r1, [pc, #0x30]
0009fe76  mov     r0, sl
0009fe78  add     r1, pc ; -> 0x000fce18  
0009fe7a  ldr     r1, [r1]
0009fe7c  blx     #0xddbfc ; -> objc_msgSend
0009fe80  ldr     r1, [pc, #0x28]
0009fe82  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0009fe84  ldr     r1, [r1]
0009fe86  blx     #0xddbfc ; -> objc_msgSend
0009fe8a  pop.w   {r8, sl, fp}
0009fe8e  pop     {r4, r5, r6, r7, pc}
0009fe90  beq     #0x9fd98
0009fe92  movs    r5, r0
0009fe94  ble     #0x9fe40
0009fe96  movs    r5, r0
0009fe98  ldm     r4, {r1, r4, r6}
0009fe9a  movs    r5, r0
0009fe9c  ldm     r4!, {r2, r3, r6}
0009fe9e  movs    r5, r0
0009fea0  beq     #0x9ff38
0009fea2  movs    r5, r0
