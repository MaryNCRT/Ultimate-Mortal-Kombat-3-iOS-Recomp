========================================================================
t_sk_hammer  0x000aae98  208 bytes   mkboss.c
========================================================================

000aae98  push    {r4, r5, r6, r7, lr}
000aae9a  add     r7, sp, #0xc
000aae9c  str     r8, [sp, #-0x4]!
000aaea0  ldr.w   r2, [r0, #0xa4]
000aaea4  movw    r8, #0x2f2
000aaea8  mov     r4, r0
000aaeaa  adds    r3, r2, #1
000aaeac  ldr.w   r5, [r0, #0x108]
000aaeb0  ldr.w   r6, [r0, r3, lsl #3]
000aaeb4  cmp     r6, r8
000aaeb6  beq     #0xaaf30
000aaeb8  movw    r3, #0x2f5
000aaebc  cmp     r6, r3
000aaebe  beq     #0xaaf18
000aaec0  cbz     r6, #0xaaecc
000aaec2  mvn     r0, #2
000aaec6  ldr     r8, [sp], #4
000aaeca  pop     {r4, r5, r6, r7, pc}
000aaecc  mov     r0, r5
000aaece  bl      #0x587c8 ; -> init_special
000aaed2  mov     r0, r5
000aaed4  str     r6, [r5, #0x1c]
000aaed6  bl      #0x580a4 ; -> group_sound
000aaeda  movs    r3, #0x1a
000aaedc  str     r6, [r5, #0x20]
000aaede  str     r3, [r5, #0x40]
000aaee0  movs    r2, #2
000aaee2  subs    r3, #0x19
000aaee4  str     r2, [r5, #0x48]
000aaee6  str     r2, [r5, #0x44]
000aaee8  str     r3, [r5, #0x1c]
000aaeea  ldr.w   r3, [r4, #0xa4]
000aaeee  mov     r0, r6
000aaef0  adds    r3, #1
000aaef2  str.w   r8, [r4, r3, lsl #3]
000aaef6  ldr.w   r3, [r4, #0xa4]
000aaefa  adds    r2, r3, #1
000aaefc  ldr     r3, [pc, #0x5c]
000aaefe  str.w   r2, [r4, #0xa4]
000aaf02  add     r3, pc ; -> 0x000f3880  t_striker
000aaf04  ldr     r1, [r3]
000aaf06  lsls    r3, r2, #3
000aaf08  adds    r3, r3, r4
000aaf0a  str     r1, [r3, #4]
000aaf0c  ldr.w   r3, [r4, #0xa4]
000aaf10  adds    r3, #1
000aaf12  str.w   r6, [r4, r3, lsl #3]
000aaf16  b       #0xaaec6
000aaf18  ldr     r1, [pc, #0x44]
000aaf1a  lsls    r3, r2, #3
000aaf1c  adds    r3, r3, r0
000aaf1e  add     r1, pc ; -> 0x000a8929  t_boss_post_hit
000aaf20  str     r1, [r3, #4]
000aaf22  ldr.w   r3, [r0, #0xa4]
000aaf26  movs    r0, #0
000aaf28  adds    r3, #1
000aaf2a  str.w   r0, [r4, r3, lsl #3]
000aaf2e  b       #0xaaec6
000aaf30  ldr     r0, [r5, #0x5c]
000aaf32  cbz     r0, #0xaaf44
000aaf34  movs    r0, #0xe
000aaf36  movw    r2, #0x2f5
000aaf3a  str.w   r2, [r4, r3, lsl #3]
000aaf3e  str.w   r0, [r4, #0xfc]
000aaf42  b       #0xaaec6
000aaf44  ldr     r1, [pc, #0x1c]
000aaf46  lsls    r3, r2, #3
000aaf48  adds    r3, r3, r4
000aaf4a  add     r1, pc ; -> 0x000a895d  t_boss_close_miss
000aaf4c  str     r1, [r3, #4]
000aaf4e  ldr.w   r3, [r4, #0xa4]
000aaf52  adds    r3, #1
000aaf54  str.w   r0, [r4, r3, lsl #3]
000aaf58  b       #0xaaec6
000aaf5a  nop     
000aaf5c  ldrh    r2, [r7, #0xa]
000aaf5e  movs    r4, r0
000aaf60  bge     #0xaaf72
000aaf62  vtbl.8  d29, {d15, d16, d17}, d15
