========================================================================
t_dont_zap_teles  0x00069634  212 bytes   mkdrone.c
========================================================================

00069634  ldr.w   r3, [r0, #0xa4]
00069638  ldr.w   r2, [r0, #0x108]
0006963c  adds    r3, #1
0006963e  ldr.w   r3, [r0, r3, lsl #3]
00069642  cbz     r3, #0x6964a
00069644  mvn     r0, #2
00069648  bx      lr
0006964a  ldr     r3, [r2]
0006964c  ldr     r3, [r3, #4]
0006964e  ldr     r3, [r3, #0x24]
00069650  str     r3, [r2, #0x1c]
00069652  cmp     r3, #0x14
00069654  ite     ne
00069656  movne   r2, #0
00069658  moveq   r2, #1
0006965a  cmp     r3, #0x12
0006965c  it      eq
0006965e  orreq   r2, r2, #1
00069662  cbz     r2, #0x696b0
00069664  ldr.w   r3, [r0, #0xa4]
00069668  cmp     r3, #0
0006966a  ble     #0x696c6
0006966c  subs    r3, #1
0006966e  str.w   r3, [r0, #0xa4]
00069672  ldr.w   r1, [r0, #0xa4]
00069676  adds    r3, r1, #1
00069678  lsls    r2, r3, #3
0006967a  adds    r2, r2, r0
0006967c  ldr.w   ip, [r2, #4]
00069680  adds    r2, r3, #1
00069682  ldr.w   r2, [r0, r2, lsl #3]
00069686  str.w   r2, [r0, r3, lsl #3]
0006968a  lsls    r3, r1, #3
0006968c  adds    r3, r3, r0
0006968e  ldr     r2, [pc, #0x6c]
00069690  str.w   ip, [r3, #4]
00069694  ldr.w   r3, [r0, #0xa4]
00069698  add     r2, pc ; -> 0x00067895  t_run_in_close
0006969a  lsls    r3, r3, #3
0006969c  adds    r3, r3, r0
0006969e  str     r2, [r3, #4]
000696a0  ldr.w   r3, [r0, #0xa4]
000696a4  movs    r2, #0
000696a6  adds    r3, #1
000696a8  str.w   r2, [r0, r3, lsl #3]
000696ac  mov     r0, r2
000696ae  b       #0x69648
000696b0  cmp     r3, #0x11
000696b2  beq     #0x69664
000696b4  ldr.w   r3, [r0, #0xa4]
000696b8  cmp     r3, #0
000696ba  ble     #0x696e2
000696bc  subs    r3, #1
000696be  str.w   r3, [r0, #0xa4]
000696c2  mov     r0, r2
000696c4  b       #0x69648
000696c6  ldr.w   r2, [pc, #0x38]
000696ca  lsls    r3, r3, #3
000696cc  adds    r3, r3, r0
000696ce  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000696d0  ldr     r2, [r2]
000696d2  str     r2, [r3, #4]
000696d4  ldr.w   r3, [r0, #0xa4]
000696d8  movs    r2, #0
000696da  adds    r3, #1
000696dc  str.w   r2, [r0, r3, lsl #3]
000696e0  b       #0x69672
000696e2  ldr     r1, [pc, #0x20]
000696e4  lsls    r3, r3, #3
000696e6  adds    r3, r3, r0
000696e8  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
000696ea  ldr     r1, [r1]
000696ec  str     r1, [r3, #4]
000696ee  ldr.w   r3, [r0, #0xa4]
000696f2  adds    r3, #1
000696f4  str.w   r2, [r0, r3, lsl #3]
000696f8  mov     r0, r2
000696fa  b       #0x69648
000696fc  b       #0x69af2
000696fe  vshr.u32 d26, d22, #1
00069702  movs    r0, r1
00069704  adr     r0, #0x70
00069706  movs    r0, r1
