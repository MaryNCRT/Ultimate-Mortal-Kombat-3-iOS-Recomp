========================================================================
MTX_ShowMoreGames  0x000bdeb0  156 bytes   EAMTX_Main.mm
========================================================================

000bdeb0  push    {r4, r5, r6, r7, lr}
000bdeb2  add     r7, sp, #0xc
000bdeb4  push.w  {r8, sl, fp}
000bdeb8  sub     sp, #0x10
000bdeba  str     r0, [sp, #0xc]
000bdebc  ldr     r0, [pc, #0x70]
000bdebe  mov     fp, r1
000bdec0  ldr     r4, [pc, #0x70]
000bdec2  add     r0, pc ; -> 0x000baf19  Z19MTX_DMGEventHandler11MTX_EventIDiPv
000bdec4  bl      #0xcf864 ; -> Z22MTXDMG_RegisterHandlerPFv11MTX_EventIDiPvE
000bdec8  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000bdecc  ldr     r1, [pc, #0x68]
000bdece  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000bded0  add     r1, pc ; -> 0x000fd5d8  
000bded2  ldr     r0, [r4]
000bded4  ldr     r1, [r1]
000bded6  blx     #0xddbfc ; -> objc_msgSend
000bdeda  ldr     r1, [pc, #0x60]
000bdedc  add     r1, pc ; -> 0x000fd5d4  
000bdede  ldr     r1, [r1]
000bdee0  mov     sl, r0
000bdee2  ldr     r0, [r4]
000bdee4  blx     #0xddbfc ; -> objc_msgSend
000bdee8  ldr     r1, [pc, #0x54]
000bdeea  add     r1, pc ; -> 0x000fd6a4  
000bdeec  ldr     r1, [r1]
000bdeee  mov     r8, r0
000bdef0  ldr     r0, [r4]
000bdef2  blx     #0xddbfc ; -> objc_msgSend
000bdef6  ldr     r1, [pc, #0x4c]
000bdef8  add     r1, pc ; -> 0x000fd58c  
000bdefa  ldr     r1, [r1]
000bdefc  mov     r6, r0
000bdefe  ldr     r0, [r4]
000bdf00  blx     #0xddbfc ; -> objc_msgSend
000bdf04  ldr     r1, [pc, #0x40]
000bdf06  add     r1, pc ; -> 0x000fd440  
000bdf08  ldr     r1, [r1]
000bdf0a  mov     r5, r0
000bdf0c  ldr     r0, [r4]
000bdf0e  blx     #0xddbfc ; -> objc_msgSend
000bdf12  mov     r1, r8
000bdf14  mov     r2, r6
000bdf16  ldr     r3, [sp, #0xc]
000bdf18  str     r5, [sp]
000bdf1a  str.w   fp, [sp, #8]
000bdf1e  str     r0, [sp, #4]
000bdf20  mov     r0, sl
000bdf22  bl      #0xcfc5c ; -> Z21MTXDMG_EnterMoreGamesiiiP8NSStringS0_iS0_
000bdf26  sub.w   sp, r7, #0x18
000bdf2a  pop.w   {r8, sl, fp}
000bdf2e  pop     {r4, r5, r6, r7, pc}
000bdf30  beq     #0xbdfda
000bdf32  vrshr.u32 d30, d6, #1
000bdf36  movs    r4, r5
