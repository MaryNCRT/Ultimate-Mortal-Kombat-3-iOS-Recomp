========================================================================
t_sz_zap_hit  0x0007c000  256 bytes   mkzap.c
========================================================================

0007c000  push    {r4, r5, r6, r7, lr}
0007c002  add     r7, sp, #0xc
0007c004  str     r8, [sp, #-0x4]!
0007c008  ldr.w   r2, [r0, #0xa4]
0007c00c  mov     r5, r0
0007c00e  ldr.w   r4, [r0, #0x108]
0007c012  adds    r3, r2, #1
0007c014  ldr.w   r6, [r0, r3, lsl #3]
0007c018  cmp     r6, #0
0007c01a  bne     #0x7c0ce
0007c01c  ldr     r3, [pc, #0xd4]
0007c01e  mov     r0, r4
0007c020  mov.w   r8, #4
0007c024  str     r3, [r4, #0x1c]
0007c026  bl      #0x57c18 ; -> hob_ochar_sound
0007c02a  ldr     r0, [r4, #8]
0007c02c  bl      #0x55a60 ; -> stop_a8
0007c030  ldr     r3, [r4, #8]
0007c032  mov     r0, r4
0007c034  ldrsh.w r2, [r3, #0x12]
0007c038  str     r2, [r4, #0x38]
0007c03a  ldr.w   r1, [r5, #0xf8]
0007c03e  lsls    r3, r1, #2
0007c040  adds    r3, r3, r5
0007c042  str.w   r2, [r3, #0xa8]
0007c046  adds    r3, r1, #1
0007c048  str.w   r3, [r5, #0xf8]
0007c04c  bl      #0x570f8 ; -> match_me_with_him
0007c050  mov     r0, r4
0007c052  bl      #0x55394 ; -> flip_multi
0007c056  mov     r0, r4
0007c058  mvn     r3, #0x8f
0007c05c  str     r6, [r4, #0x20]
0007c05e  str     r3, [r4, #0x1c]
0007c060  bl      #0x570ac ; -> multi_adjust_xy
0007c064  ldr.w   r3, [r5, #0xf8]
0007c068  mov     r0, r4
0007c06a  subs    r3, #1
0007c06c  str.w   r3, [r5, #0xf8]
0007c070  lsls    r3, r3, #2
0007c072  adds    r3, r3, r5
0007c074  ldr     r2, [r4, #8]
0007c076  ldr.w   r3, [r3, #0xa8]
0007c07a  str     r3, [r4, #0x38]
0007c07c  strh    r3, [r2, #0x12]
0007c07e  movs    r3, #0x24
0007c080  str.w   r8, [r4, #0x1c]
0007c084  str     r3, [r4, #0x40]
0007c086  bl      #0x35210 ; -> borrow_char_ani
0007c08a  mov     r0, r4
0007c08c  movs    r3, #3
0007c08e  str     r3, [r4, #0x54]
0007c090  bl      #0x55488 ; -> find_part_a14
0007c094  str.w   r8, [r4, #0x1c]
0007c098  ldr.w   r3, [r5, #0xa4]
0007c09c  movw    r2, #0x829
0007c0a0  mov     r0, r6
0007c0a2  adds    r3, #1
0007c0a4  str.w   r2, [r5, r3, lsl #3]
0007c0a8  ldr.w   r3, [r5, #0xa4]
0007c0ac  adds    r2, r3, #1
0007c0ae  ldr     r3, [pc, #0x48]
0007c0b0  str.w   r2, [r5, #0xa4]
0007c0b4  add     r3, pc ; -> 0x000f37cc  t_mframew
0007c0b6  ldr     r1, [r3]
0007c0b8  lsls    r3, r2, #3
0007c0ba  adds    r3, r3, r5
0007c0bc  str     r1, [r3, #4]
0007c0be  ldr.w   r3, [r5, #0xa4]
0007c0c2  adds    r3, #1
0007c0c4  str.w   r6, [r5, r3, lsl #3]
0007c0c8  ldr     r8, [sp], #4
0007c0cc  pop     {r4, r5, r6, r7, pc}
0007c0ce  movw    r3, #0x829
0007c0d2  cmp     r6, r3
0007c0d4  it      ne
0007c0d6  mvnne   r0, #2
0007c0da  bne     #0x7c0c8
0007c0dc  ldr     r1, [pc, #0x1c]
0007c0de  lsls    r3, r2, #3
0007c0e0  adds    r3, r3, r5
0007c0e2  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
0007c0e4  str     r1, [r3, #4]
0007c0e6  ldr.w   r3, [r5, #0xa4]
0007c0ea  movs    r0, #0
0007c0ec  adds    r3, #1
0007c0ee  str.w   r0, [r5, r3, lsl #3]
0007c0f2  b       #0x7c0c8
0007c0f4  movs    r3, r0
0007c0f6  movs    r4, r0
0007c0f8  strb    r4, [r2, #0x1c]
0007c0fa  movs    r7, r0
0007c0fc  str     r5, [sp, #0x1fc]
