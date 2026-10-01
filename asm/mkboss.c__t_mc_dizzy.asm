========================================================================
t_mc_dizzy  0x000abb44  176 bytes   mkboss.c
========================================================================

000abb44  push    {r4, r5, r6, r7, lr}
000abb46  add     r7, sp, #0xc
000abb48  ldr.w   r2, [r0, #0xa4]
000abb4c  mov     r4, r0
000abb4e  ldr.w   r5, [r0, #0x108]
000abb52  adds    r3, r2, #1
000abb54  ldr.w   r6, [r0, r3, lsl #3]
000abb58  cbnz    r6, #0xabb8a
000abb5a  mov.w   r3, #0x1f4
000abb5e  mov     r0, r5
000abb60  str     r3, [r5, #0x1c]
000abb62  bl      #0xab6bc ; -> bossrandper
000abb66  ldr     r0, [r5, #0x5c]
000abb68  cmp     r0, #0
000abb6a  beq     #0xabbb2
000abb6c  ldr     r3, [pc, #0x78]
000abb6e  mov     r0, r6
000abb70  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abb72  ldr     r2, [r3]
000abb74  ldr.w   r3, [r4, #0xa4]
000abb78  lsls    r3, r3, #3
000abb7a  adds    r3, r3, r4
000abb7c  str     r2, [r3, #4]
000abb7e  ldr.w   r3, [r4, #0xa4]
000abb82  adds    r3, #1
000abb84  str.w   r6, [r4, r3, lsl #3]
000abb88  pop     {r4, r5, r6, r7, pc}
000abb8a  movw    r3, #0x6a5
000abb8e  cmp     r6, r3
000abb90  it      ne
000abb92  mvnne   r0, #2
000abb96  bne     #0xabb88
000abb98  ldr     r3, [pc, #0x50]
000abb9a  movs    r0, #0
000abb9c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000abb9e  ldr     r1, [r3]
000abba0  lsls    r3, r2, #3
000abba2  adds    r3, r3, r4
000abba4  str     r1, [r3, #4]
000abba6  ldr.w   r3, [r4, #0xa4]
000abbaa  adds    r3, #1
000abbac  str.w   r0, [r4, r3, lsl #3]
000abbb0  b       #0xabb88
000abbb2  movs    r3, #0x80
000abbb4  str     r3, [r5, #0x44]
000abbb6  ldr.w   r3, [r4, #0xa4]
000abbba  movw    r2, #0x6a5
000abbbe  adds    r3, #1
000abbc0  str.w   r2, [r4, r3, lsl #3]
000abbc4  ldr.w   r3, [r4, #0xa4]
000abbc8  adds    r2, r3, #1
000abbca  ldr     r3, [pc, #0x24]
000abbcc  str.w   r2, [r4, #0xa4]
000abbd0  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000abbd2  ldr     r1, [r3]
000abbd4  lsls    r3, r2, #3
000abbd6  adds    r3, r3, r4
000abbd8  str     r1, [r3, #4]
000abbda  ldr.w   r3, [r4, #0xa4]
000abbde  adds    r3, #1
000abbe0  str.w   r0, [r4, r3, lsl #3]
000abbe4  b       #0xabb88
000abbe6  nop     
000abbe8  ldrb    r4, [r6, #2]
000abbea  movs    r4, r0
000abbec  ldrb    r0, [r5, #0xd]
000abbee  movs    r4, r0
000abbf0  ldrb    r0, [r5]
000abbf2  movs    r4, r0
