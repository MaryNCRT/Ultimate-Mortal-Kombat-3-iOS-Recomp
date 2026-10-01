========================================================================
+[Reachability reachabilityForLocalWiFi]  0x0009e6ac  104 bytes   Reachability.m
========================================================================

0009e6ac  push    {r4, r7, lr}
0009e6ae  add     r7, sp, #4
0009e6b0  sub     sp, #0x18
0009e6b2  ldr     r3, [pc, #0x50]
0009e6b4  ldr     r1, [pc, #0x50]
0009e6b6  mov     r4, r0
0009e6b8  add     r3, pc ; -> 0x000fdd64  
0009e6ba  add     r1, pc ; -> 0x000fc980  '$(\x0e'
0009e6bc  ldr     r3, [r3]
0009e6be  str     r0, [sp, #0x10]
0009e6c0  ldr     r1, [r1]
0009e6c2  add     r0, sp, #0x10
0009e6c4  str     r3, [sp, #0x14]
0009e6c6  blx     #0xddc08 ; -> objc_msgSendSuper2
0009e6ca  mov     r0, sp
0009e6cc  movs    r1, #0x10
0009e6ce  blx     #0xdd758 ; -> bzero
0009e6d2  ldr     r1, [pc, #0x38]
0009e6d4  movs    r3, #0x10
0009e6d6  mov     r0, r4
0009e6d8  add     r1, pc ; -> 0x000fd018  
0009e6da  mov     r2, sp
0009e6dc  ldr     r1, [r1]
0009e6de  strb.w  r3, [sp]
0009e6e2  subs    r3, #0xe
0009e6e4  strb.w  r3, [sp, #1]
0009e6e8  movw    r3, #0xfea9
0009e6ec  str     r3, [sp, #4]
0009e6ee  blx     #0xddbfc ; -> objc_msgSend
0009e6f2  cbz     r0, #0x9e6fe
0009e6f4  ldr     r3, [pc, #0x18]
0009e6f6  movs    r2, #1
0009e6f8  add     r3, pc ; -> 0x000f665c  OBJC_IVAR_$_Reachability.localWiFiRef
0009e6fa  ldr     r3, [r3]
0009e6fc  strb    r2, [r0, r3]
0009e6fe  sub.w   sp, r7, #4
0009e702  pop     {r4, r7, pc}
0009e704  subw    r0, r8, #0x805
0009e708  b       #0x9ec90
0009e70a  movs    r5, r0
0009e70c  ldmdb   ip!, {r0, r2}
0009e710  ldrb    r0, [r4, #0x1d]
0009e712  movs    r5, r0
