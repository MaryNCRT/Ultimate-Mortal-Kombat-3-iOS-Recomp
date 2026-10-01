========================================================================
MTX_DictionaryToPostData  0x000b64ac  104 bytes   EAMTX_Main.mm
========================================================================

000b64ac  push    {r4, r7, lr}
000b64ae  add     r7, sp, #4
000b64b0  ldr     r1, [pc, #0x44]
000b64b2  mov     r4, r0
000b64b4  ldr     r0, [pc, #0x44]
000b64b6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b64b8  add     r0, pc ; -> 0x000fdc70  
000b64ba  ldr     r1, [r1]
000b64bc  ldr     r0, [r0]
000b64be  blx     #0xddbfc ; -> objc_msgSend
000b64c2  ldr     r1, [pc, #0x3c]
000b64c4  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b64c6  ldr     r1, [r1]
000b64c8  blx     #0xddbfc ; -> objc_msgSend
000b64cc  ldr     r1, [pc, #0x34]
000b64ce  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000b64d0  ldr     r1, [r1]
000b64d2  blx     #0xddbfc ; -> objc_msgSend
000b64d6  ldr     r1, [pc, #0x30]
000b64d8  mov     r2, r4
000b64da  add     r1, pc ; -> 0x000fd5dc  
000b64dc  ldr     r1, [r1]
000b64de  blx     #0xddbfc ; -> objc_msgSend
000b64e2  cbnz    r0, #0xb64e8
000b64e4  ldr     r0, [pc, #0x24]
000b64e6  add     r0, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000b64e8  ldr     r1, [pc, #0x24]
000b64ea  movs    r2, #4
000b64ec  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
000b64ee  ldr     r1, [r1]
000b64f0  blx     #0xddbfc ; -> objc_msgSend
000b64f4  pop     {r4, r7, pc}
000b64f6  nop     
000b64f8  str     r2, [r1, #0x4c]
000b64fa  movs    r4, r0
000b64fc  strb    r4, [r6, #0x1e]
000b64fe  movs    r4, r0
000b6500  str     r0, [r7, #0x48]
000b6502  movs    r4, r0
000b6504  str     r6, [r0, #0x58]
000b6506  movs    r4, r0
000b6508  strb    r6, [r7, #3]
000b650a  movs    r4, r0
000b650c  ldrb    r2, [r1, #0x18]
000b650e  movs    r4, r1
000b6510  ldr     r0, [r4]
000b6512  movs    r4, r0
