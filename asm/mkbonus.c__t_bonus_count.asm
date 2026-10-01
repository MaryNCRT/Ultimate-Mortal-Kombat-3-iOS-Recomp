========================================================================
t_bonus_count  0x0007ccb8  416 bytes   mkbonus.c
========================================================================

0007ccb8  push    {r4, r5, r6, r7, lr}
0007ccba  add     r7, sp, #0xc
0007ccbc  ldr.w   r3, [r0, #0xa4]
0007ccc0  mov     r6, r0
0007ccc2  ldr.w   r4, [r0, #0x108]
0007ccc6  adds    r1, r3, #1
0007ccc8  ldr.w   r5, [r0, r1, lsl #3]
0007cccc  cmp     r5, #0x79
0007ccce  beq     #0x7cdc0
0007ccd0  ble     #0x7cce4
0007ccd2  cmp     r5, #0x84
0007ccd4  beq     #0x7cd76
0007ccd6  cmp     r5, #0xcf
0007ccd8  beq     #0x7cd56
0007ccda  cmp     r5, #0x7e
0007ccdc  beq     #0x7cdc0
0007ccde  mvn     r0, #2
0007cce2  pop     {r4, r5, r6, r7, pc}
0007cce4  cbz     r5, #0x7cd12
0007cce6  cmp     r5, #0x73
0007cce8  bne     #0x7ccde
0007ccea  mov     r0, r4
0007ccec  bl      #0x7cb80 ; -> get_winner_ochar
0007ccf0  ldr     r1, [r4, #0x1c]
0007ccf2  cmp     r1, #0x19
0007ccf4  beq     #0x7cdea
0007ccf6  mov     r0, r4
0007ccf8  adds    r1, #0x3f
0007ccfa  bl      #0x57dd0 ; -> tsound_func
0007ccfe  ldr.w   r3, [r6, #0xa4]
0007cd02  movs    r2, #0x7e
0007cd04  movs    r0, #0x6e
0007cd06  adds    r3, #1
0007cd08  str.w   r2, [r6, r3, lsl #3]
0007cd0c  str.w   r0, [r6, #0xfc]
0007cd10  b       #0x7cce2
0007cd12  ldr     r3, [pc, #0x128]
0007cd14  add     r3, pc ; -> 0x000f357c  G
0007cd16  ldr     r3, [r3]
0007cd18  ldr.w   r2, [r3, #0x368]
0007cd1c  str     r2, [r4, #0x1c]
0007cd1e  ldr.w   r3, [r3, #0x36c]
0007cd22  cmp     r3, r2
0007cd24  str     r3, [r4, #0x20]
0007cd26  beq     #0x7ce20
0007cd28  mov     r0, r4
0007cd2a  bl      #0x7cbe0 ; -> get_winner_text
0007cd2e  mov     r0, r4
0007cd30  bl      #0x7cc38 ; -> do_winner_text
0007cd34  mov     r0, r4
0007cd36  mov     r1, r5
0007cd38  bl      #0x7cc0c ; -> do_winner_char
0007cd3c  mov     r0, r4
0007cd3e  bl      #0x7cbfc ; -> play_ending_chord
0007cd42  ldr.w   r3, [r6, #0xa4]
0007cd46  movs    r2, #0x73
0007cd48  movs    r0, #0x28
0007cd4a  adds    r3, #1
0007cd4c  str.w   r2, [r6, r3, lsl #3]
0007cd50  str.w   r0, [r6, #0xfc]
0007cd54  b       #0x7cce2
0007cd56  ldr     r2, [pc, #0xe8]
0007cd58  lsls    r3, r3, #3
0007cd5a  adds    r3, r3, r0
0007cd5c  add     r2, pc ; -> 0x0007cb3d  t_bonus_exit
0007cd5e  str     r2, [r3, #4]
0007cd60  ldr.w   r3, [r0, #0xa4]
0007cd64  movs    r0, #0
0007cd66  adds    r3, #1
0007cd68  str.w   r0, [r6, r3, lsl #3]
0007cd6c  b       #0x7cce2
0007cd6e  ldr.w   r3, [r2, #0x36c]
0007cd72  cmp     r3, #0xa6
0007cd74  beq     #0x7cdce
0007cd76  ldr     r3, [pc, #0xcc]
0007cd78  add     r3, pc ; -> 0x000f357c  G
0007cd7a  ldr     r2, [r3]
0007cd7c  ldrh.w  r0, [r2, #0x450]
0007cd80  sxth    r3, r0
0007cd82  str     r3, [r4, #0x1c]
0007cd84  cmp     r0, #0
0007cd86  beq     #0x7ce06
0007cd88  ldrh.w  r2, [r2, #0x458]
0007cd8c  sxth    r3, r2
0007cd8e  str     r3, [r4, #0x1c]
0007cd90  cbnz    r2, #0x7cd96
0007cd92  movs    r3, #1
0007cd94  str     r3, [r4, #0x1c]
0007cd96  ldr     r3, [r4, #0x1c]
0007cd98  mov     r0, r4
0007cd9a  subs    r2, r3, #1
0007cd9c  ldr     r3, [pc, #0xa8]
0007cd9e  str     r2, [r4, #0x1c]
0007cda0  add     r3, pc ; -> 0x00174b5c  fatality_animations
0007cda2  ldr.w   r3, [r3, r2, lsl #2]
0007cda6  str     r3, [r4, #0x1c]
0007cda8  bl      #0x58d70 ; -> create_fx
0007cdac  ldr.w   r3, [r6, #0xa4]
0007cdb0  movs    r2, #0xcf
0007cdb2  movs    r0, #2
0007cdb4  adds    r3, #1
0007cdb6  str.w   r2, [r6, r3, lsl #3]
0007cdba  str.w   r0, [r6, #0xfc]
0007cdbe  b       #0x7cce2
0007cdc0  ldr     r3, [pc, #0x88]
0007cdc2  add     r3, pc ; -> 0x000f357c  G
0007cdc4  ldr     r2, [r3]
0007cdc6  ldr.w   r3, [r2, #0x368]
0007cdca  cmp     r3, #0xa6
0007cdcc  bne     #0x7cd6e
0007cdce  mov     r0, r4
0007cdd0  movs    r1, #0x61
0007cdd2  bl      #0x57dd0 ; -> tsound_func
0007cdd6  ldr.w   r3, [r6, #0xa4]
0007cdda  movs    r2, #0x84
0007cddc  movs    r0, #0x5a
0007cdde  adds    r3, #1
0007cde0  str.w   r2, [r6, r3, lsl #3]
0007cde4  str.w   r0, [r6, #0xfc]
0007cde8  b       #0x7cce2
0007cdea  mov     r0, r4
0007cdec  subs    r1, #0x18
0007cdee  bl      #0x57dbc ; -> rsnd_func
0007cdf2  ldr.w   r3, [r6, #0xa4]
0007cdf6  movs    r2, #0x79
0007cdf8  mov     r0, r5
0007cdfa  adds    r3, #1
0007cdfc  str.w   r2, [r6, r3, lsl #3]
0007ce00  str.w   r5, [r6, #0xfc]
0007ce04  b       #0x7cce2
0007ce06  ldr.w   r3, [r6, #0xa4]
0007ce0a  ldr     r2, [pc, #0x44]
0007ce0c  lsls    r3, r3, #3
0007ce0e  adds    r3, r3, r6
0007ce10  add     r2, pc ; -> 0x0007cb3d  t_bonus_exit
0007ce12  str     r2, [r3, #4]
0007ce14  ldr.w   r3, [r6, #0xa4]
0007ce18  adds    r3, #1
0007ce1a  str.w   r0, [r6, r3, lsl #3]
0007ce1e  b       #0x7cce2
0007ce20  ldr.w   r3, [r0, #0xa4]
0007ce24  ldr     r2, [pc, #0x2c]
0007ce26  lsls    r3, r3, #3
0007ce28  adds    r3, r3, r0
0007ce2a  add     r2, pc ; -> 0x0007cc4d  t_bonus_count_draw
0007ce2c  str     r2, [r3, #4]
0007ce2e  ldr.w   r3, [r0, #0xa4]
0007ce32  adds    r3, #1
0007ce34  str.w   r5, [r0, r3, lsl #3]
0007ce38  mov     r0, r5
0007ce3a  b       #0x7cce2
0007ce3c  ldr     r4, [r4, #4]
0007ce3e  movs    r7, r0
0007ce40  ldc2l   p15, c15, [sp, #0x3fc]
0007ce44  ldr     r0, [r0]
0007ce46  movs    r7, r0
0007ce48  ldrb    r0, [r7, #0x16]
0007ce4a  movs    r7, r1
0007ce4c  str     r6, [r6, #0x78]
0007ce4e  movs    r7, r0
0007ce50  stc2    p15, c15, [sb, #-0x3fc]!
0007ce54  mrc2    p15, #0, apsr_nzcv, c15, c15, #7
