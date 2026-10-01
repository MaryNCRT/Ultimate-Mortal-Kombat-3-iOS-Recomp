========================================================================
tl_ssp2  0x0007ae38  240 bytes   mkzap.c
========================================================================

0007ae38  push    {r4, r5, r6, r7, lr}
0007ae3a  add     r7, sp, #0xc
0007ae3c  ldr.w   r3, [r0, #0xa4]
0007ae40  mov     r4, r0
0007ae42  ldr.w   r5, [r0, #0x108]
0007ae46  adds    r3, #1
0007ae48  ldr.w   r3, [r0, r3, lsl #3]
0007ae4c  cmp     r3, #0
0007ae4e  bne     #0x7aec2
0007ae50  ldr.w   r0, [r0, #0xf8]
0007ae54  ldr     r1, [r5, #0x38]
0007ae56  lsls    r2, r0, #2
0007ae58  adds    r2, r2, r4
0007ae5a  str.w   r1, [r2, #0xa8]
0007ae5e  adds    r2, r0, #1
0007ae60  mov     r0, r5
0007ae62  str.w   r2, [r4, #0xf8]
0007ae66  str     r3, [r5, #0x44]
0007ae68  movs    r3, #0x1d
0007ae6a  str     r3, [r5, #0x20]
0007ae6c  bl      #0x79590 ; -> zap_init_special_act
0007ae70  ldr     r3, [pc, #0xa4]
0007ae72  mov     r0, r5
0007ae74  str     r3, [r5, #0x40]
0007ae76  bl      #0x54e38 ; -> get_his_action
0007ae7a  ldr     r2, [r5, #0x20]
0007ae7c  movw    r3, #0x503
0007ae80  cmp     r2, r3
0007ae82  beq     #0x7ae90
0007ae84  adds    r3, #4
0007ae86  cmp     r2, r3
0007ae88  itt     ne
0007ae8a  ldrne.w r3, [pc, #0x90]
0007ae8e  strne   r3, [r5, #0x40]
0007ae90  ldr.w   r3, [r4, #0xa4]
0007ae94  movw    r2, #0x27e
0007ae98  movs    r0, #0
0007ae9a  adds    r3, #1
0007ae9c  str.w   r2, [r4, r3, lsl #3]
0007aea0  ldr.w   r3, [r4, #0xa4]
0007aea4  adds    r2, r3, #1
0007aea6  ldr     r3, [pc, #0x78]
0007aea8  str.w   r2, [r4, #0xa4]
0007aeac  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
0007aeae  ldr     r1, [r3]
0007aeb0  lsls    r3, r2, #3
0007aeb2  adds    r3, r3, r4
0007aeb4  str     r1, [r3, #4]
0007aeb6  ldr.w   r3, [r4, #0xa4]
0007aeba  adds    r3, #1
0007aebc  str.w   r0, [r4, r3, lsl #3]
0007aec0  pop     {r4, r5, r6, r7, pc}
0007aec2  movw    r2, #0x27e
0007aec6  cmp     r3, r2
0007aec8  it      ne
0007aeca  mvnne   r0, #2
0007aece  bne     #0x7aec0
0007aed0  ldr.w   r3, [r4, #0xf8]
0007aed4  mov     r0, r5
0007aed6  subs    r3, #1
0007aed8  str.w   r3, [r4, #0xf8]
0007aedc  lsls    r3, r3, #2
0007aede  adds    r3, r3, r4
0007aee0  ldr     r6, [r5]
0007aee2  ldr.w   r3, [r3, #0xa8]
0007aee6  str     r3, [r5, #0x38]
0007aee8  bl      #0x75964 ; -> create_proj_proc
0007aeec  movw    r3, #0x604
0007aef0  ldr     r2, [pc, #0x30]
0007aef2  add     r2, pc ; -> 0x00074e39  t_scorp_waiting_sleep
0007aef4  str.w   r0, [r6, #0x88]
0007aef8  ldr     r0, [r5]
0007aefa  str     r3, [r5, #0x1c]
0007aefc  str     r3, [r0, #0x18]
0007aefe  ldr.w   r3, [r4, #0xa4]
0007af02  movs    r0, #0
0007af04  lsls    r3, r3, #3
0007af06  adds    r3, r3, r4
0007af08  str     r2, [r3, #4]
0007af0a  ldr.w   r3, [r4, #0xa4]
0007af0e  adds    r3, #1
0007af10  str.w   r0, [r4, r3, lsl #3]
0007af14  b       #0x7aec0
0007af16  nop     
0007af18  movs    r1, r1
0007af1a  movs    r1, r0
0007af1c  movs    r1, r1
0007af1e  movs    r2, r0
0007af20  ldrh    r0, [r2]
0007af22  movs    r7, r0
0007af24  ldr     r7, [sp, #0x10c]
