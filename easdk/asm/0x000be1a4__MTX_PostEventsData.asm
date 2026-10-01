========================================================================
MTX_PostEventsData  0x000be1a4  136 bytes   EAMTX_Main.mm
========================================================================

000be1a4  push    {r4, r5, r7, lr}
000be1a6  add     r7, sp, #8
000be1a8  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be1ac  ldr     r4, [pc, #0x54]
000be1ae  ldr     r1, [pc, #0x58]
000be1b0  add     r4, pc ; -> 0x0038c0e4  mtxController
000be1b2  add     r1, pc ; -> 0x000fd6dc  
000be1b4  ldr     r0, [r4]
000be1b6  ldr     r1, [r1]
000be1b8  blx     #0xddbfc ; -> objc_msgSend
000be1bc  ldr     r1, [pc, #0x4c]
000be1be  movs    r2, #1
000be1c0  add     r1, pc ; -> 0x000fd6b8  
000be1c2  ldr     r1, [r1]
000be1c4  mov     r5, r0
000be1c6  ldr     r0, [r4]
000be1c8  blx     #0xddbfc ; -> objc_msgSend
000be1cc  ldr     r3, [pc, #0x40]
000be1ce  movs    r2, #1
000be1d0  add     r3, pc ; -> 0x0038c1a9  m_bDebugEnabled
000be1d2  strb    r2, [r3]
000be1d4  ldr     r3, [pc, #0x3c]
000be1d6  add     r3, pc ; -> 0x0038c0f8  connectionType
000be1d8  ldr     r2, [r3]
000be1da  ldr     r3, [pc, #0x3c]
000be1dc  add     r3, pc ; -> 0x001809f4  
000be1de  cmp     r2, r3
000be1e0  bne     #0xbe1e8
000be1e2  ldr     r3, [pc, #0x38]
000be1e4  add     r3, pc ; -> 0x0038c118  eventsToPost
000be1e6  b       #0xbe1f4
000be1e8  ldr     r3, [pc, #0x34]
000be1ea  add     r3, pc ; -> 0x00180a04  
000be1ec  cmp     r2, r3
000be1ee  bne     #0xbe1f8
000be1f0  ldr     r3, [pc, #0x30]
000be1f2  add     r3, pc ; -> 0x0038c118  eventsToPost
000be1f4  movs    r2, #0xc8
000be1f6  b       #0xbe1fe
000be1f8  ldr     r3, [pc, #0x2c]
000be1fa  movs    r2, #0x64
000be1fc  add     r3, pc ; -> 0x0038c118  eventsToPost
000be1fe  str     r2, [r3]
000be200  mov     r0, r5
000be202  pop     {r4, r5, r7, pc}
000be204  svc     #0x30
000be206  movs    r4, r5
