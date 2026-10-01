========================================================================
EASOC_FBGetFriendName  0x0007facc  436 bytes   EASDK_Handler.mm
========================================================================

0007facc  push    {r4, r5, r6, r7, lr}
0007face  add     r7, sp, #0xc
0007fad0  push.w  {r8, sl, fp}
0007fad4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0007fad8  sub     sp, #0x5c
0007fada  ldr     r3, [pc, #0x184]
0007fadc  str     r0, [sp]
0007fade  add     r0, sp, #0x14
0007fae0  add     r3, pc ; -> 0x000f301c  0x0
0007fae2  str     r7, [sp, #0x34]
0007fae4  ldr     r3, [r3]
0007fae6  str.w   sp, [sp, #0x3c]
0007faea  str     r3, [sp, #0x2c]
0007faec  ldr     r3, [pc, #0x174]
0007faee  add     r3, pc ; -> 0x000ee0ba  GCC_except_table1
0007faf0  str     r3, [sp, #0x30]
0007faf2  ldr     r3, [pc, #0x174]
0007faf4  add     r3, pc ; -> 0x0007fc04  
0007faf6  orr     r3, r3, #1
0007fafa  str     r3, [sp, #0x38]
0007fafc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0007fb00  ldr     r3, [pc, #0x168]
0007fb02  add     r3, pc ; -> 0x00175898  conn
0007fb04  ldr     r3, [r3]
0007fb06  cmp     r3, #0
0007fb08  beq     #0x7fb7e
0007fb0a  ldr     r0, [pc, #0x164]
0007fb0c  ldr     r1, [sp]
0007fb0e  mov.w   r3, #-1
0007fb12  add     r0, pc ; -> 0x00175898  conn
0007fb14  ldr     r0, [r0]
0007fb16  str     r3, [sp, #0x18]
0007fb18  bl      #0x88614 ; -> ZNK12FBConnection9GetFriendEi
0007fb1c  mov     r1, r0
0007fb1e  str     r0, [sp, #4]
0007fb20  ldm     r1!, {r2, r3}
0007fb22  add     r0, sp, #0x50
0007fb24  str     r2, [sp, #0x48]
0007fb26  str     r3, [sp, #0x4c]
0007fb28  blx     #0xdd53c ; -> ZNSsC1ERKSs
0007fb2c  ldr     r3, [sp, #4]
0007fb2e  add     r0, sp, #0x54
0007fb30  add.w   r1, r3, #0xc
0007fb34  movs    r3, #1
0007fb36  str     r3, [sp, #0x18]
0007fb38  blx     #0xdd53c ; -> ZNSsC1ERKSs
0007fb3c  ldr     r3, [pc, #0x134]
0007fb3e  ldr     r2, [sp, #0x54]
0007fb40  ldr.w   lr, [sp, #0x50]
0007fb44  add     r3, pc ; -> 0x000f3370  0x0
0007fb46  sub.w   r0, r2, #0xc
0007fb4a  ldr     r3, [r3]
0007fb4c  str.w   lr, [sp, #0x10]
0007fb50  cmp     r0, r3
0007fb52  str     r3, [sp, #0xc]
0007fb54  it      eq
0007fb56  moveq   r3, lr
0007fb58  bne     #0x7fb8c
0007fb5a  ldr     r2, [sp, #0xc]
0007fb5c  sub.w   r0, r3, #0xc
0007fb60  cmp     r2, r0
0007fb62  bne     #0x7fbb0
0007fb64  add     r0, sp, #0x14
0007fb66  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0007fb6a  ldr     r0, [sp, #0x10]
0007fb6c  sub.w   sp, r7, #0x58
0007fb70  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0007fb74  sub.w   sp, r7, #0x18
0007fb78  pop.w   {r8, sl, fp}
0007fb7c  pop     {r4, r5, r6, r7, pc}
0007fb7e  ldr     r0, [pc, #0xf8]
0007fb80  subs    r3, #1
0007fb82  str     r3, [sp, #0x18]
0007fb84  add     r0, pc ; -> 0x0017d9cc  'FB NOT CONNECTED'
0007fb86  blx     #0xddcb0 ; -> puts
0007fb8a  b       #0x7fb0a
0007fb8c  ldr     r3, [r2, #-0x4]
0007fb90  subs    r1, r2, #4
0007fb92  subs    r2, r3, #1
0007fb94  dmb     ish
0007fb98  mov     ip, r3
0007fb9a  ldrex   r4, [r1]
0007fb9e  cmp     r4, r3
0007fba0  beq     #0x7fbea
0007fba2  cmp     r4, ip
0007fba4  mov     r3, r4
0007fba6  bne     #0x7fb92
0007fba8  cmp     r4, #0
0007fbaa  ble     #0x7fbfa
0007fbac  ldr     r3, [sp, #0x50]
0007fbae  b       #0x7fb5a
0007fbb0  subs    r2, r3, #4
0007fbb2  ldr     r3, [r3, #-0x4]
0007fbb6  subs    r1, r3, #1
0007fbb8  dmb     ish
0007fbbc  mov     ip, r3
0007fbbe  ldrex   r4, [r2]
0007fbc2  cmp     r4, r3
0007fbc4  beq     #0x7fbda
0007fbc6  cmp     r4, ip
0007fbc8  mov     r3, r4
0007fbca  bne     #0x7fbb6
0007fbcc  cmp     r4, #0
0007fbce  bgt     #0x7fb64
0007fbd0  add.w   r1, sp, #0x59
0007fbd4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007fbd8  b       #0x7fb64
0007fbda  strex   lr, r1, [r2]
0007fbde  cmp.w   lr, #0
0007fbe2  bne     #0x7fbbe
0007fbe4  dmb     ish
0007fbe8  b       #0x7fbc6
0007fbea  strex   lr, r2, [r1]
0007fbee  cmp.w   lr, #0
0007fbf2  bne     #0x7fb9a
0007fbf4  dmb     ish
0007fbf8  b       #0x7fba2
0007fbfa  add.w   r1, sp, #0x5a
0007fbfe  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007fc02  b       #0x7fbac
0007fc04  ldr     r3, [pc, #0x74]
0007fc06  ldr     r1, [sp, #0x50]
0007fc08  ldr     r4, [sp, #0x1c]
0007fc0a  add     r3, pc ; -> 0x000f3370  0x0
0007fc0c  sub.w   r0, r1, #0xc
0007fc10  ldr     r3, [r3]
0007fc12  str     r4, [sp, #8]
0007fc14  cmp     r0, r3
0007fc16  bne     #0x7fc24
0007fc18  ldr     r0, [sp, #8]
0007fc1a  mov.w   r3, #-1
0007fc1e  str     r3, [sp, #0x18]
0007fc20  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0007fc24  ldr     r3, [r1, #-0x4]
0007fc28  subs    r2, r1, #4
0007fc2a  subs    r1, r3, #1
0007fc2c  dmb     ish
0007fc30  mov     ip, r3
0007fc32  ldrex   lr, [r2]
0007fc36  cmp     lr, r3
0007fc38  beq     #0x7fc50
0007fc3a  cmp     lr, ip
0007fc3c  mov     r3, lr
0007fc3e  bne     #0x7fc2a
0007fc40  cmp.w   lr, #0
0007fc44  bgt     #0x7fc18
0007fc46  add.w   r1, sp, #0x5b
0007fc4a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007fc4e  b       #0x7fc18
0007fc50  strex   r4, r1, [r2]
0007fc54  cmp     r4, #0
0007fc56  bne     #0x7fc32
0007fc58  dmb     ish
0007fc5c  b       #0x7fc3a
0007fc5e  nop     
0007fc60  adds    r5, #0x38
0007fc62  movs    r7, r0
0007fc64  b       #0x7f7f8
0007fc66  movs    r6, r0
0007fc68  lsls    r4, r1, #4
0007fc6a  movs    r0, r0
0007fc6c  ldrb    r2, [r2, r6]
0007fc6e  movs    r7, r1
0007fc70  ldrb    r2, [r0, r6]
0007fc72  movs    r7, r1
0007fc74  subs    r0, #0x28
0007fc76  movs    r7, r0
0007fc78  udf     #0x44
0007fc7a  movs    r7, r1
0007fc7c  adds    r7, #0x62
0007fc7e  movs    r7, r0
