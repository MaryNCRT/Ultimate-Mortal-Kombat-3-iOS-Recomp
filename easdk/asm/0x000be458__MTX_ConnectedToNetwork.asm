========================================================================
MTX_ConnectedToNetwork  0x000be458  36 bytes   EAMTX_Main.mm
========================================================================

000be458  push    {r7, lr}
000be45a  add     r7, sp, #0
000be45c  bl      #0xbe3cc ; -> Z28MTX_GetNetworkConnectionTypev
000be460  ldr     r3, [pc, #0x10]
000be462  add     r3, pc ; -> 0x0038c0f8  connectionType
000be464  str     r0, [r3]
000be466  ldr     r3, [pc, #0x10]
000be468  add     r3, pc ; -> 0x00180a34  
000be46a  subs    r0, r0, r3
000be46c  it      ne
000be46e  movne   r0, #1
000be470  pop     {r7, pc}
000be472  nop     
000be474  bgt     #0xbe39c
000be476  movs    r4, r5
000be478  movs    r5, #0xc8
000be47a  movs    r4, r1
