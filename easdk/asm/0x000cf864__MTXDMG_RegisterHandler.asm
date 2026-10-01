========================================================================
MTXDMG_RegisterHandler  0x000cf864  16 bytes   EAMTX_DMGController.mm
========================================================================

000cf864  ldr     r3, [pc, #8]
000cf866  add     r3, pc ; -> 0x0038c1ec  gpMTXDMG_EventCB
000cf868  str     r0, [r3]
000cf86a  movs    r0, #1
000cf86c  bx      lr
000cf86e  nop     
000cf870  ldm     r1, {r1, r7}
000cf872  movs    r3, r5
