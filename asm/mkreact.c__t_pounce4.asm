========================================================================
t_pounce4  0x000446bc  148 bytes   mkreact.c
========================================================================

000446bc  push    {r4, r5, r6, r7, lr}
000446be  add     r7, sp, #0xc
000446c0  ldr.w   r2, [r0, #0xa4]
000446c4  mov     r4, r0
000446c6  ldr.w   r5, [r0, #0x108]
000446ca  adds    r3, r2, #1
000446cc  ldr.w   r6, [r0, r3, lsl #3]
000446d0  cbnz    r6, #0x446fe
000446d2  mov     r0, r5
000446d4  bl      #0x54e38 ; -> get_his_action
000446d8  ldr     r0, [r5, #0x20]
000446da  movw    r3, #0x20f
000446de  cmp     r0, r3
000446e0  beq     #0x44722
000446e2  ldr     r2, [pc, #0x60]
000446e4  ldr.w   r3, [r4, #0xa4]
000446e8  add     r2, pc ; -> 0x00041f8d  t_getup_reaction_exit
000446ea  lsls    r3, r3, #3
000446ec  adds    r3, r3, r4
000446ee  mov     r0, r6
000446f0  str     r2, [r3, #4]
000446f2  ldr.w   r3, [r4, #0xa4]
000446f6  adds    r3, #1
000446f8  str.w   r6, [r4, r3, lsl #3]
000446fc  pop     {r4, r5, r6, r7, pc}
000446fe  cmp.w   r6, #0x4a0
00044702  it      ne
00044704  mvnne   r0, #2
00044708  bne     #0x446fc
0004470a  ldr     r1, [pc, #0x3c]
0004470c  lsls    r3, r2, #3
0004470e  adds    r3, r3, r4
00044710  add     r1, pc ; -> 0x00041f8d  t_getup_reaction_exit
00044712  str     r1, [r3, #4]
00044714  ldr.w   r3, [r4, #0xa4]
00044718  movs    r0, #0
0004471a  adds    r3, #1
0004471c  str.w   r0, [r4, r3, lsl #3]
00044720  b       #0x446fc
00044722  ldr.w   r3, [r4, #0xa4]
00044726  mov.w   r2, #0x4a0
0004472a  adds    r3, #1
0004472c  str.w   r2, [r4, r3, lsl #3]
00044730  ldr.w   r2, [pc, #0x18]
00044734  ldr.w   r3, [r4, #0xa4]
00044738  add     r2, pc ; -> 0x00044675  t_suspend_wait_action_jsrp
0004473a  adds    r3, #1
0004473c  str.w   r3, [r4, #0xa4]
00044740  b       #0x446ea
00044742  nop     
00044744  bhi     #0x4468a
