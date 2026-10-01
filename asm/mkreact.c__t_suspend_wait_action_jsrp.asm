========================================================================
t_suspend_wait_action_jsrp  0x00044674  72 bytes   mkreact.c
========================================================================

00044674  push    {r4, r5, r6, r7, lr}
00044676  add     r7, sp, #0xc
00044678  ldr.w   r3, [r0, #0xa4]
0004467c  mov     r4, r0
0004467e  ldr.w   r5, [r0, #0x108]
00044682  adds    r3, #1
00044684  ldr.w   r6, [r0, r3, lsl #3]
00044688  cbnz    r6, #0x446b0
0004468a  mov     r0, r5
0004468c  bl      #0x54e38 ; -> get_his_action
00044690  ldr     r3, [r5, #0x20]
00044692  ldr     r2, [pc, #0x24]
00044694  mov     r0, r6
00044696  str     r3, [r5, #0x48]
00044698  ldr.w   r3, [r4, #0xa4]
0004469c  add     r2, pc ; -> 0x00041e49  t_susp3
0004469e  lsls    r3, r3, #3
000446a0  adds    r3, r3, r4
000446a2  str     r2, [r3, #4]
000446a4  ldr.w   r3, [r4, #0xa4]
000446a8  adds    r3, #1
000446aa  str.w   r6, [r4, r3, lsl #3]
000446ae  pop     {r4, r5, r6, r7, pc}
000446b0  mvn     r0, #2
000446b4  b       #0x446ae
000446b6  nop     
000446b8  bvc     #0x4460e
