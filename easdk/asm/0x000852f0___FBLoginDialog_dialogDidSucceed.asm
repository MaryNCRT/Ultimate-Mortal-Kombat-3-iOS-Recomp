========================================================================
-[FBLoginDialog dialogDidSucceed  0x000852f0  176 bytes   FBLoginDialog.m
========================================================================

000852f0  push    {r4, r5, r6, r7, lr}
000852f2  add     r7, sp, #0xc
000852f4  push.w  {r8, sl, fp}
000852f8  sub     sp, #0xc
000852fa  ldr     r1, [pc, #0x88]
000852fc  str     r0, [sp]
000852fe  mov     r0, r2
00085300  add     r1, pc ; -> 0x000fcdb8  
00085302  mvn     fp, #0x80000000
00085306  ldr     r1, [r1]
00085308  blx     #0xddbfc ; -> objc_msgSend
0008530c  ldr     r2, [pc, #0x78]
0008530e  ldr     r3, [pc, #0x7c]
00085310  add     r2, pc ; -> 0x000fcdc8  
00085312  add     r3, pc ; -> 0x0017ea54  
00085314  ldr.w   r8, [r2]
00085318  mov     r2, r8
0008531a  mov     r6, r0
0008531c  mov     r1, r6
0008531e  add     r0, sp, #4
00085320  blx     #0xddc14 ; -> objc_msgSend_stret
00085324  add     r4, sp, #4
00085326  ldm     r4, {r4, r5}
00085328  cmp     fp, r4
0008532a  mov     sl, r4
0008532c  beq     #0x8536a
0008532e  ldr     r3, [pc, #0x60]
00085330  mov     r2, r8
00085332  add     r0, sp, #4
00085334  add     r3, pc ; -> 0x0017e8a4  
00085336  mov     r1, r6
00085338  blx     #0xddc14 ; -> objc_msgSend_stret
0008533c  ldr     r3, [sp, #4]
0008533e  add.w   r2, r4, r5
00085342  cmp     r3, fp
00085344  beq     #0x85374
00085346  ldr     r1, [pc, #0x4c]
00085348  rsb     r5, r2, r3
0008534c  mov     r0, r6
0008534e  add     r1, pc ; -> 0x000fcdc0  '$]\x0e'
00085350  mov     r3, r5
00085352  ldr     r1, [r1]
00085354  mov     r4, r2
00085356  blx     #0xddbfc ; -> objc_msgSend
0008535a  mov     r2, r0
0008535c  cbz     r2, #0x8536a
0008535e  ldr     r1, [pc, #0x38]
00085360  ldr     r0, [sp]
00085362  add     r1, pc ; -> 0x000fcdbc  ';4\x0e'
00085364  ldr     r1, [r1]
00085366  blx     #0xddbfc ; -> objc_msgSend
0008536a  sub.w   sp, r7, #0x18
0008536e  pop.w   {r8, sl, fp}
00085372  pop     {r4, r5, r6, r7, pc}
00085374  ldr     r1, [pc, #0x24]
00085376  mov     r0, r6
00085378  add     r1, pc ; -> 0x000fcdc4  
0008537a  ldr     r1, [r1]
0008537c  blx     #0xddbfc ; -> objc_msgSend
00085380  mov     r2, r0
00085382  b       #0x8535c
00085384  ldrb    r4, [r6, #0xa]
00085386  movs    r7, r0
00085388  ldrb    r4, [r6, #0xa]
0008538a  movs    r7, r0
0008538c  str     r7, [sp, #0xf8]
0008538e  movs    r7, r1
00085390  str     r5, [sp, #0x1b0]
00085392  movs    r7, r1
00085394  ldrb    r6, [r5, #9]
00085396  movs    r7, r0
00085398  ldrb    r6, [r2, #9]
0008539a  movs    r7, r0
0008539c  ldrb    r0, [r1, #9]
0008539e  movs    r7, r0
