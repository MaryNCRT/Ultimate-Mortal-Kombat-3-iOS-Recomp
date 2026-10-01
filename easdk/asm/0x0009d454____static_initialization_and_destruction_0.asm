========================================================================
__static_initialization_and_destruction_0  0x0009d454  296 bytes   Mayhem.mm
========================================================================

0009d454  push    {r4, r5, r6, r7, lr}
0009d456  add     r7, sp, #0xc
0009d458  push.w  {r8, sl, fp}
0009d45c  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009d460  sub     sp, #0x44
0009d462  ldr     r3, [pc, #0xd8]
0009d464  str     r0, [sp, #8]
0009d466  add     r0, sp, #0xc
0009d468  add     r3, pc ; -> 0x000f3438  0x0
0009d46a  str     r1, [sp, #4]
0009d46c  ldr     r3, [r3]
0009d46e  str     r7, [sp, #0x2c]
0009d470  str.w   sp, [sp, #0x34]
0009d474  str     r3, [sp, #0x24]
0009d476  ldr     r3, [pc, #0xc8]
0009d478  add     r3, pc ; -> 0x000ee1e0  GCC_except_table1
0009d47a  str     r3, [sp, #0x28]
0009d47c  ldr     r3, [pc, #0xc4]
0009d47e  add     r3, pc ; -> 0x0009d530  
0009d480  orr     r3, r3, #1
0009d484  str     r3, [sp, #0x30]
0009d486  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009d48a  ldr     r2, [sp, #8]
0009d48c  cmp     r2, #1
0009d48e  beq     #0x9d4a8
0009d490  add     r0, sp, #0xc
0009d492  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009d496  sub.w   sp, r7, #0x58
0009d49a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009d49e  sub.w   sp, r7, #0x18
0009d4a2  pop.w   {r8, sl, fp}
0009d4a6  pop     {r4, r5, r6, r7, pc}
0009d4a8  ldr     r2, [sp, #4]
0009d4aa  movw    r3, #0xffff
0009d4ae  cmp     r2, r3
0009d4b0  bne     #0x9d490
0009d4b2  ldr     r0, [pc, #0x94]
0009d4b4  add     r0, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
0009d4b6  bl      #0x8ac34 ; -> ZN6Mayhem12UserDatabaseC1Ev
0009d4ba  ldr     r2, [pc, #0x90]
0009d4bc  ldr     r0, [pc, #0x90]
0009d4be  movs    r1, #0
0009d4c0  add     r2, pc ; -> 0x000f3378  0x1000
0009d4c2  add     r0, pc ; -> 0x0008c65d  tcf_0
0009d4c4  ldr     r2, [r2]
0009d4c6  blx     #0xdd5d8 ; -> cxa_atexit
0009d4ca  ldr     r0, [pc, #0x88]
0009d4cc  ldr     r1, [pc, #0x88]
0009d4ce  movs    r3, #2
0009d4d0  add     r0, pc ; -> 0x00379bfc  ZN6Mayhem4User16GET_STRING_ERRORE
0009d4d2  add     r1, pc ; -> 0x000e122c  
0009d4d4  str     r3, [sp, #0x10]
0009d4d6  add.w   r2, sp, #0x43
0009d4da  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009d4de  ldr     r3, [pc, #0x7c]
0009d4e0  ldr.w   r0, [pc, #0x7c]
0009d4e4  movs    r1, #0
0009d4e6  add     r3, pc ; -> 0x000f3378  0x1000
0009d4e8  add     r0, pc ; -> 0x0008e911  tcf_1
0009d4ea  ldr     r3, [r3]
0009d4ec  mov     r2, r3
0009d4ee  str     r3, [sp]
0009d4f0  blx     #0xdd5d8 ; -> cxa_atexit
0009d4f4  ldr     r0, [pc, #0x6c]
0009d4f6  add     r0, pc ; -> 0x00379c00  ZN6Mayhem4Stat14s_statDatabaseE
0009d4f8  bl      #0x8acfc ; -> ZN6Mayhem12StatDatabaseC1Ev
0009d4fc  ldr     r0, [pc, #0x68]
0009d4fe  movs    r1, #0
0009d500  ldr     r2, [sp]
0009d502  add     r0, pc ; -> 0x00094691  tcf_2
0009d504  blx     #0xdd5d8 ; -> cxa_atexit
0009d508  ldr     r0, [pc, #0x60]
0009d50a  ldr     r1, [pc, #0x64]
0009d50c  movs    r3, #1
0009d50e  add     r0, pc ; -> 0x00379c18  ZN6Mayhem4Stat16GET_STRING_ERRORE
0009d510  add     r1, pc ; -> 0x000e122c  
0009d512  str     r3, [sp, #0x10]
0009d514  add.w   r2, sp, #0x42
0009d518  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009d51c  ldr     r2, [pc, #0x54]
0009d51e  ldr.w   r0, [pc, #0x58]
0009d522  movs    r1, #0
0009d524  add     r2, pc ; -> 0x000f3378  0x1000
0009d526  add     r0, pc ; -> 0x0008e8ad  tcf_3
0009d528  ldr     r2, [r2]
0009d52a  blx     #0xdd5d8 ; -> cxa_atexit
0009d52e  b       #0x9d490
0009d530  ldr     r0, [sp, #0x14]
0009d532  mov.w   r3, #-1
0009d536  str     r3, [sp, #0x10]
0009d538  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009d53c  ldrsh   r4, [r1, r7]
0009d53e  movs    r5, r0
0009d540  lsrs    r4, r4, #0x15
0009d542  movs    r5, r0
0009d544  lsls    r6, r5, #2
0009d546  movs    r0, r0
0009d548  stm     r7!, {r2, r3, r5}
0009d54a  movs    r5, r5
0009d54c  ldrsh   r4, [r6, r2]
0009d54e  movs    r5, r0
0009d550  bl      #0x235550
0009d554  stm     r7!, {r3, r5}
0009d556  movs    r5, r5
0009d558  subs    r5, #0x56
0009d55a  movs    r4, r0
0009d55c  ldrsh   r6, [r1, r2]
0009d55e  movs    r5, r0
0009d560  asrs    r5, r4, #0x10
