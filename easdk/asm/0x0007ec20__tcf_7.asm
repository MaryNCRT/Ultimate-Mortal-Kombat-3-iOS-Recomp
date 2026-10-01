========================================================================
tcf_7  0x0007ec20  24 bytes   EASDK_Handler.mm
========================================================================

0007ec20  push    {r7, lr}
0007ec22  add     r7, sp, #0
0007ec24  ldr     r0, [pc, #0xc]
0007ec26  add     r0, pc ; -> 0x00379bbc  friendsList
0007ec28  ldr     r0, [r0]
0007ec2a  cbz     r0, #0x7ec30
0007ec2c  blx     #0xdd5a8 ; -> ZdlPv
0007ec30  pop     {r7, pc}
0007ec32  nop     
0007ec34  add     r7, sp, #0x248
0007ec36  movs    r7, r5
