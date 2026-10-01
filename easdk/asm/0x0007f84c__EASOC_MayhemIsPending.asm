========================================================================
EASOC_MayhemIsPending  0x0007f84c  64 bytes   EASDK_Handler.mm
========================================================================

0007f84c  push    {r7, lr}
0007f84e  add     r7, sp, #0
0007f850  ldr     r0, [pc, #0x28]
0007f852  add     r0, pc ; -> 0x00379b44  m_pendingMayhemUser
0007f854  ldr     r0, [r0]
0007f856  cbz     r0, #0x7f868
0007f858  adds    r0, #8
0007f85a  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
0007f85e  rsbs.w  r0, r0, #1
0007f862  it      lo
0007f864  movlo   r0, #0
0007f866  pop     {r7, pc}
0007f868  ldr     r0, [pc, #0x14]
0007f86a  ldr     r1, [pc, #0x18]
0007f86c  ldr     r3, [pc, #0x18]
0007f86e  add     r0, pc ; -> 0x000e23bc  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem11UserRequestEEptEvE8__func__
0007f870  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0007f872  add     r3, pc ; -> 0x00175710  'm_obj'
0007f874  movw    r2, #0x109
0007f878  blx     #0xdd5cc ; -> assert_rtn
0007f87c  adr     r2, #0x3b8
0007f87e  movs    r7, r5
0007f880  cmp     r3, #0x4a
0007f882  movs    r6, r0
0007f884  ldrsh   r0, [r5, r0]
0007f886  movs    r7, r1
0007f888  ldrsh   r2, [r3, r2]
0007f88a  movs    r7, r1
