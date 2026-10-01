========================================================================
tcf_0  0x0008000c  208 bytes   EASDK_Handler.mm
========================================================================

0008000c  push    {r4, r5, r6, r7, lr}
0008000e  add     r7, sp, #0xc
00080010  push.w  {r8, sl, fp}
00080014  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00080018  sub     sp, #0x44
0008001a  ldr     r3, [pc, #0xa8]
0008001c  add     r0, sp, #0x10
0008001e  str     r7, [sp, #0x30]
00080020  add     r3, pc ; -> 0x000f301c  0x0
00080022  str.w   sp, [sp, #0x38]
00080026  ldr     r3, [r3]
00080028  str     r3, [sp, #0x28]
0008002a  ldr     r3, [pc, #0x9c]
0008002c  add     r3, pc ; -> 0x000ee0cc  GCC_except_table5
0008002e  str     r3, [sp, #0x2c]
00080030  ldr     r3, [pc, #0x98]
00080032  add     r3, pc ; -> 0x000800a6  
00080034  orr     r3, r3, #1
00080038  str     r3, [sp, #0x34]
0008003a  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0008003e  ldr     r3, [pc, #0x90]
00080040  add     r3, pc ; -> 0x00379b34  m_leaderboards
00080042  ldr     r2, [r3]
00080044  ldr     r3, [r3, #4]
00080046  cmp     r2, r3
00080048  str     r3, [sp, #4]
0008004a  beq     #0x80082
0008004c  str     r2, [sp, #0xc]
0008004e  b       #0x8005c
00080050  ldr     r3, [sp, #0xc]
00080052  ldr     r2, [sp, #4]
00080054  adds    r3, #4
00080056  cmp     r2, r3
00080058  str     r3, [sp, #0xc]
0008005a  beq     #0x80082
0008005c  ldr     r2, [sp, #0xc]
0008005e  ldr     r2, [r2]
00080060  str     r2, [sp, #8]
00080062  cmp     r2, #0
00080064  beq     #0x80050
00080066  ldr     r3, [r2]
00080068  ldr     r0, [sp, #8]
0008006a  ldr     r2, [r3, #8]
0008006c  movs    r3, #1
0008006e  str     r3, [sp, #0x14]
00080070  blx     r2
00080072  cmp     r0, #0
00080074  beq     #0x80050
00080076  ldr     r2, [sp, #8]
00080078  ldr     r3, [r2]
0008007a  mov     r0, r2
0008007c  ldr     r3, [r3, #4]
0008007e  blx     r3
00080080  b       #0x80050
00080082  ldr     r0, [pc, #0x50]
00080084  add     r0, pc ; -> 0x00379b34  m_leaderboards
00080086  ldr     r0, [r0]
00080088  cbz     r0, #0x8008e
0008008a  blx     #0xdd5a8 ; -> ZdlPv
0008008e  add     r0, sp, #0x10
00080090  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00080094  sub.w   sp, r7, #0x58
00080098  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008009c  sub.w   sp, r7, #0x18
000800a0  pop.w   {r8, sl, fp}
000800a4  pop     {r4, r5, r6, r7, pc}
000800a6  ldr     r0, [pc, #0x30]
000800a8  ldr     r3, [sp, #0x18]
000800aa  add     r0, pc ; -> 0x00379b34  m_leaderboards
000800ac  str     r3, [sp]
000800ae  ldr     r0, [r0]
000800b0  cbz     r0, #0x800b6
000800b2  blx     #0xdd5a8 ; -> ZdlPv
000800b6  ldr     r0, [sp]
000800b8  mov.w   r3, #-1
000800bc  str     r3, [sp, #0x14]
000800be  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000800c2  nop     
000800c4  cmp     r7, #0xf8
000800c6  movs    r7, r0
000800c8  b       #0x80204
000800ca  movs    r6, r0
000800cc  lsls    r0, r6, #1
000800ce  movs    r0, r0
000800d0  ldr     r2, [sp, #0x3c0]
000800d2  movs    r7, r5
000800d4  ldr     r2, [sp, #0x2b0]
000800d6  movs    r7, r5
000800d8  ldr     r2, [sp, #0x218]
000800da  movs    r7, r5
