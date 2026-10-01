========================================================================
MTX_DMGEventHandler  0x000baf18  16 bytes   EAMTX_Main.mm
========================================================================

000baf18  push    {r7, lr}
000baf1a  add     r7, sp, #0
000baf1c  cmp     r0, #0x21
000baf1e  bne     #0xbaf24
000baf20  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000baf24  pop     {r7, pc}
000baf26  nop     
