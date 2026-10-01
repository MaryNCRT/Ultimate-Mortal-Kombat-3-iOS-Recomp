========================================================================
ZNSt6vectorISsSaISsEEaSERKS1_  0x0009c99c  1028 bytes   Mayhem.mm
========================================================================

0009c99c  push    {r4, r5, r6, r7, lr}
0009c99e  add     r7, sp, #0xc
0009c9a0  push.w  {r8, sl, fp}
0009c9a4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
0009c9a8  sub     sp, #0xc8
0009c9aa  ldr     r3, [pc, #0x3d8]
0009c9ac  str     r0, [sp, #8]
0009c9ae  add     r0, sp, #0x90
0009c9b0  add     r3, pc ; -> 0x000f3438  0x0
0009c9b2  str     r1, [sp, #4]
0009c9b4  ldr     r3, [r3]
0009c9b6  str     r7, [sp, #0xb0]
0009c9b8  str.w   sp, [sp, #0xb8]
0009c9bc  str     r3, [sp, #0xa8]
0009c9be  ldr     r3, [pc, #0x3c8]
0009c9c0  add     r3, pc ; -> 0x000ee364  GCC_except_table61
0009c9c2  str     r3, [sp, #0xac]
0009c9c4  ldr     r3, [pc, #0x3c4]
0009c9c6  add     r3, pc ; -> 0x0009cc52  
0009c9c8  orr     r3, r3, #1
0009c9cc  str     r3, [sp, #0xb4]
0009c9ce  blx     #0xdd4ac ; -> Unwind_SjLj_Register
0009c9d2  ldr     r0, [sp, #4]
0009c9d4  ldr     r1, [sp, #8]
0009c9d6  cmp     r0, r1
0009c9d8  beq     #0x9ca86
0009c9da  ldr     r2, [r0, #4]
0009c9dc  str     r2, [sp, #0x18]
0009c9de  ldr     r3, [r0]
0009c9e0  str     r3, [sp, #0x14]
0009c9e2  rsb     r3, r3, r2
0009c9e6  asrs    r3, r3, #2
0009c9e8  str     r3, [sp, #0xc]
0009c9ea  ldr     r3, [r1, #8]
0009c9ec  ldr     r2, [r1]
0009c9ee  ldr     r4, [sp, #0xc]
0009c9f0  subs    r3, r3, r2
0009c9f2  cmp.w   r4, r3, asr #2
0009c9f6  bhi.w   #0x9cb2a
0009c9fa  ldr     r1, [sp, #8]
0009c9fc  ldr     r4, [sp, #0xc]
0009c9fe  ldr     r3, [r1, #4]
0009ca00  subs    r3, r3, r2
0009ca02  asrs    r3, r3, #2
0009ca04  cmp     r4, r3
0009ca06  bhi     #0x9caa0
0009ca08  cmp     r4, #0
0009ca0a  str     r2, [sp, #0x6c]
0009ca0c  str     r4, [sp, #0x28]
0009ca0e  ble     #0x9ca46
0009ca10  ldr     r0, [sp, #0x14]
0009ca12  str     r2, [sp, #0x58]
0009ca14  str     r4, [sp, #0x78]
0009ca16  str     r0, [sp, #0x54]
0009ca18  ldr     r1, [sp, #0x54]
0009ca1a  ldr     r0, [sp, #0x58]
0009ca1c  mov.w   r3, #-1
0009ca20  str     r3, [sp, #0x94]
0009ca22  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009ca26  ldr     r1, [sp, #0x54]
0009ca28  ldr     r2, [sp, #0x58]
0009ca2a  ldr     r3, [sp, #0x78]
0009ca2c  adds    r1, #4
0009ca2e  adds    r2, #4
0009ca30  adds.w  r3, r3, #-1
0009ca34  str     r1, [sp, #0x54]
0009ca36  str     r2, [sp, #0x58]
0009ca38  str     r3, [sp, #0x78]
0009ca3a  bne     #0x9ca18
0009ca3c  ldr     r4, [sp, #0x28]
0009ca3e  ldr     r0, [sp, #0x6c]
0009ca40  lsls    r3, r4, #2
0009ca42  adds    r0, r0, r3
0009ca44  str     r0, [sp, #0x6c]
0009ca46  ldr     r1, [sp, #8]
0009ca48  ldr     r3, [sp, #0x6c]
0009ca4a  ldr     r1, [r1, #4]
0009ca4c  cmp     r1, r3
0009ca4e  str     r1, [sp, #0x48]
0009ca50  beq     #0x9ca7a
0009ca52  ldr     r2, [pc, #0x33c]
0009ca54  str     r3, [sp, #0x44]
0009ca56  add     r2, pc ; -> 0x000f3370  0x0
0009ca58  ldr     r2, [r2]
0009ca5a  str     r2, [sp, #0x80]
0009ca5c  b       #0x9ca60
0009ca5e  mov     r3, r0
0009ca60  ldr     r3, [r3]
0009ca62  ldr     r2, [sp, #0x80]
0009ca64  sub.w   r0, r3, #0xc
0009ca68  cmp     r2, r0
0009ca6a  bne.w   #0x9cbcc
0009ca6e  ldr     r0, [sp, #0x44]
0009ca70  ldr     r1, [sp, #0x48]
0009ca72  adds    r0, #4
0009ca74  cmp     r0, r1
0009ca76  str     r0, [sp, #0x44]
0009ca78  bne     #0x9ca5e
0009ca7a  ldr     r3, [sp, #0xc]
0009ca7c  lsls    r2, r3, #2
0009ca7e  ldr     r4, [sp, #8]
0009ca80  ldr     r3, [r4]
0009ca82  add     r3, r2
0009ca84  str     r3, [r4, #4]
0009ca86  add     r0, sp, #0x90
0009ca88  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
0009ca8c  ldr     r0, [sp, #8]
0009ca8e  sub.w   sp, r7, #0x58
0009ca92  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009ca96  sub.w   sp, r7, #0x18
0009ca9a  pop.w   {r8, sl, fp}
0009ca9e  pop     {r4, r5, r6, r7, pc}
0009caa0  lsls    r3, r3, #2
0009caa2  ldr     r4, [sp, #0x14]
0009caa4  asrs    r3, r3, #2
0009caa6  cmp     r3, #0
0009caa8  str     r3, [sp, #0x30]
0009caaa  str     r4, [sp, #0x2c]
0009caac  ble     #0x9cad4
0009caae  str     r2, [sp, #0x60]
0009cab0  ldr     r1, [sp, #0x2c]
0009cab2  ldr     r0, [sp, #0x60]
0009cab4  mov.w   r3, #-1
0009cab8  str     r3, [sp, #0x94]
0009caba  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009cabe  ldr     r0, [sp, #0x2c]
0009cac0  ldr     r1, [sp, #0x60]
0009cac2  ldr     r2, [sp, #0x30]
0009cac4  adds    r0, #4
0009cac6  adds    r1, #4
0009cac8  adds.w  r2, r2, #-1
0009cacc  str     r0, [sp, #0x2c]
0009cace  str     r1, [sp, #0x60]
0009cad0  str     r2, [sp, #0x30]
0009cad2  bne     #0x9cab0
0009cad4  ldr     r3, [sp, #4]
0009cad6  ldr     r4, [sp, #8]
0009cad8  ldr     r0, [sp, #4]
0009cada  ldr     r1, [r3]
0009cadc  ldr     r2, [r4, #4]
0009cade  ldr     r3, [r4]
0009cae0  rsb     r3, r3, r2
0009cae4  bic     r3, r3, #3
0009cae8  adds    r1, r1, r3
0009caea  str     r1, [sp, #0x38]
0009caec  ldr     r0, [r0, #4]
0009caee  str     r2, [sp, #0x70]
0009caf0  cmp     r1, r0
0009caf2  str     r0, [sp, #0x34]
0009caf4  beq.w   #0x9cc22
0009caf8  ldr     r2, [sp, #0x70]
0009cafa  str     r2, [sp, #0x5c]
0009cafc  str     r2, [sp, #0x74]
0009cafe  str     r2, [sp, #0x68]
0009cb00  b       #0x9cb06
0009cb02  ldr     r4, [sp, #0x68]
0009cb04  str     r4, [sp, #0x74]
0009cb06  ldr     r3, [sp, #0x68]
0009cb08  cbz     r3, #0x9cb16
0009cb0a  movs    r3, #1
0009cb0c  ldr     r0, [sp, #0x68]
0009cb0e  str     r3, [sp, #0x94]
0009cb10  ldr     r1, [sp, #0x38]
0009cb12  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009cb16  ldr     r0, [sp, #0x38]
0009cb18  ldr     r1, [sp, #0x68]
0009cb1a  ldr     r2, [sp, #0x34]
0009cb1c  adds    r0, #4
0009cb1e  adds    r1, #4
0009cb20  cmp     r2, r0
0009cb22  str     r0, [sp, #0x38]
0009cb24  str     r1, [sp, #0x68]
0009cb26  bne     #0x9cb02
0009cb28  b       #0x9ca7a
0009cb2a  cmp.w   r4, #0x40000000
0009cb2e  bhs.w   #0x9cc48
0009cb32  ldr     r0, [sp, #0xc]
0009cb34  mov.w   r3, #-1
0009cb38  str     r3, [sp, #0x94]
0009cb3a  lsls    r0, r0, #2
0009cb3c  str     r0, [sp, #0x20]
0009cb3e  blx     #0xdd5c0 ; -> Znwm
0009cb42  ldr     r1, [sp, #0x14]
0009cb44  ldr     r2, [sp, #0x18]
0009cb46  cmp     r2, r1
0009cb48  str     r1, [sp, #0x64]
0009cb4a  str     r2, [sp, #0x40]
0009cb4c  str     r0, [sp, #0x88]
0009cb4e  str     r0, [sp, #0x1c]
0009cb50  beq     #0x9cb80
0009cb52  str     r0, [sp, #0x10]
0009cb54  str     r1, [sp, #0x3c]
0009cb56  b       #0x9cb66
0009cb58  ldr     r1, [sp, #0x88]
0009cb5a  ldr     r2, [sp, #0x64]
0009cb5c  rsb     r3, r2, r1
0009cb60  mov     r1, r4
0009cb62  adds    r3, r3, r4
0009cb64  str     r3, [sp, #0x10]
0009cb66  ldr     r3, [sp, #0x10]
0009cb68  cbz     r3, #0x9cb74
0009cb6a  movs    r3, #3
0009cb6c  ldr     r0, [sp, #0x10]
0009cb6e  str     r3, [sp, #0x94]
0009cb70  blx     #0xdd53c ; -> ZNSsC1ERKSs
0009cb74  ldr     r4, [sp, #0x3c]
0009cb76  ldr     r0, [sp, #0x40]
0009cb78  adds    r4, #4
0009cb7a  cmp     r4, r0
0009cb7c  str     r4, [sp, #0x3c]
0009cb7e  bne     #0x9cb58
0009cb80  ldr     r3, [sp, #8]
0009cb82  ldr     r2, [r3]
0009cb84  ldr     r4, [r3, #4]
0009cb86  cmp     r2, r4
0009cb88  str     r4, [sp, #0x24]
0009cb8a  beq     #0x9cbb0
0009cb8c  ldr     r3, [pc, #0x204]
0009cb8e  str     r2, [sp, #0x50]
0009cb90  add     r3, pc ; -> 0x000f3370  0x0
0009cb92  ldr     r3, [r3]
0009cb94  str     r3, [sp, #0x84]
0009cb96  ldr     r4, [sp, #0x50]
0009cb98  ldr     r1, [sp, #0x84]
0009cb9a  ldr     r3, [r4]
0009cb9c  sub.w   r0, r3, #0xc
0009cba0  cmp     r0, r1
0009cba2  bne     #0x9cbf8
0009cba4  ldr     r0, [sp, #0x50]
0009cba6  ldr     r1, [sp, #0x24]
0009cba8  adds    r0, #4
0009cbaa  cmp     r1, r0
0009cbac  str     r0, [sp, #0x50]
0009cbae  bne     #0x9cb96
0009cbb0  ldr     r2, [sp, #8]
0009cbb2  ldr     r0, [r2]
0009cbb4  cbz     r0, #0x9cbba
0009cbb6  blx     #0xdd5a8 ; -> ZdlPv
0009cbba  ldr     r4, [sp, #0x88]
0009cbbc  ldr     r3, [sp, #8]
0009cbbe  str     r4, [r3]
0009cbc0  ldr     r2, [sp, #0x20]
0009cbc2  ldr     r0, [sp, #8]
0009cbc4  add.w   r3, r4, r2
0009cbc8  str     r3, [r0, #8]
0009cbca  b       #0x9ca7e
0009cbcc  subs    r2, r3, #4
0009cbce  ldr     r3, [r3, #-0x4]
0009cbd2  subs    r1, r3, #1
0009cbd4  dmb     ish
0009cbd8  mov     ip, r3
0009cbda  ldrex   r4, [r2]
0009cbde  cmp     r4, r3
0009cbe0  beq     #0x9cc28
0009cbe2  cmp     r4, ip
0009cbe4  mov     r3, r4
0009cbe6  bne     #0x9cbd2
0009cbe8  cmp     r4, #0
0009cbea  bgt.w   #0x9ca6e
0009cbee  add.w   r1, sp, #0xc5
0009cbf2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009cbf6  b       #0x9ca6e
0009cbf8  subs    r2, r3, #4
0009cbfa  ldr     r3, [r3, #-0x4]
0009cbfe  subs    r1, r3, #1
0009cc00  dmb     ish
0009cc04  mov     ip, r3
0009cc06  ldrex   r4, [r2]
0009cc0a  cmp     r4, r3
0009cc0c  beq     #0x9cc38
0009cc0e  cmp     r4, ip
0009cc10  mov     r3, r4
0009cc12  bne     #0x9cbfe
0009cc14  cmp     r4, #0
0009cc16  bgt     #0x9cba4
0009cc18  add.w   r1, sp, #0xc6
0009cc1c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009cc20  b       #0x9cba4
0009cc22  ldr     r1, [sp, #0xc]
0009cc24  lsls    r2, r1, #2
0009cc26  b       #0x9ca7e
0009cc28  strex   lr, r1, [r2]
0009cc2c  cmp.w   lr, #0
0009cc30  bne     #0x9cbda
0009cc32  dmb     ish
0009cc36  b       #0x9cbe2
0009cc38  strex   lr, r1, [r2]
0009cc3c  cmp.w   lr, #0
0009cc40  bne     #0x9cc06
0009cc42  dmb     ish
0009cc46  b       #0x9cc0e
0009cc48  mov.w   r3, #-1
0009cc4c  str     r3, [sp, #0x94]
0009cc4e  blx     #0xdd554 ; -> ZSt17__throw_bad_allocv
0009cc52  ldr     r3, [sp, #0x94]
0009cc54  ldr     r4, [sp, #0x98]
0009cc56  cmp     r3, #1
0009cc58  str     r4, [sp]
0009cc5a  beq     #0x9cca0
0009cc5c  cmp     r3, #2
0009cc5e  beq     #0x9cd0c
0009cc60  cmp     r3, #3
0009cc62  beq     #0x9ccec
0009cc64  cmp     r3, #4
0009cc66  beq     #0x9cca0
0009cc68  ldr     r0, [sp]
0009cc6a  blx     #0xdd5e4 ; -> cxa_begin_catch
0009cc6e  ldr     r0, [sp, #0x70]
0009cc70  ldr     r1, [sp, #0x74]
0009cc72  cmp     r0, r1
0009cc74  beq     #0x9cc98
0009cc76  ldr     r3, [pc, #0x120]
0009cc78  add     r3, pc ; -> 0x000f3370  0x0
0009cc7a  ldr     r3, [r3]
0009cc7c  str     r3, [sp, #0x4c]
0009cc7e  ldr     r2, [sp, #0x5c]
0009cc80  ldr     r4, [sp, #0x4c]
0009cc82  ldr     r3, [r2]
0009cc84  sub.w   r0, r3, #0xc
0009cc88  cmp     r4, r0
0009cc8a  bne     #0x9ccb4
0009cc8c  ldr     r0, [sp, #0x5c]
0009cc8e  ldr     r1, [sp, #0x74]
0009cc90  adds    r0, #4
0009cc92  cmp     r0, r1
0009cc94  str     r0, [sp, #0x5c]
0009cc96  bne     #0x9cc7e
0009cc98  movs    r3, #2
0009cc9a  str     r3, [sp, #0x94]
0009cc9c  blx     #0xdd5fc ; -> cxa_rethrow
0009cca0  movs    r3, #0
0009cca2  str     r3, [sp, #0x94]
0009cca4  blx     #0xdd5f0 ; -> cxa_end_catch
0009cca8  ldr     r0, [sp]
0009ccaa  mov.w   r3, #-1
0009ccae  str     r3, [sp, #0x94]
0009ccb0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
0009ccb4  subs    r2, r3, #4
0009ccb6  ldr     r3, [r3, #-0x4]
0009ccba  subs    r1, r3, #1
0009ccbc  dmb     ish
0009ccc0  mov     ip, r3
0009ccc2  ldrex   lr, [r2]
0009ccc6  cmp     lr, r3
0009ccc8  beq     #0x9ccde
0009ccca  cmp     lr, ip
0009cccc  mov     r3, lr
0009ccce  bne     #0x9ccba
0009ccd0  cmp.w   lr, #0
0009ccd4  bgt     #0x9cc8c
0009ccd6  add     r1, sp, #0xc4
0009ccd8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009ccdc  b       #0x9cc8c
0009ccde  strex   r4, r1, [r2]
0009cce2  cmp     r4, #0
0009cce4  bne     #0x9ccc2
0009cce6  dmb     ish
0009ccea  b       #0x9ccca
0009ccec  movs    r3, #0
0009ccee  str     r3, [sp, #0x94]
0009ccf0  blx     #0xdd5f0 ; -> cxa_end_catch
0009ccf4  ldr     r0, [sp]
0009ccf6  blx     #0xdd5e4 ; -> cxa_begin_catch
0009ccfa  ldr     r2, [sp, #0x1c]
0009ccfc  cbz     r2, #0x9cd04
0009ccfe  ldr     r0, [sp, #0x88]
0009cd00  blx     #0xdd5a8 ; -> ZdlPv
0009cd04  movs    r3, #5
0009cd06  str     r3, [sp, #0x94]
0009cd08  blx     #0xdd5fc ; -> cxa_rethrow
0009cd0c  ldr     r0, [sp]
0009cd0e  blx     #0xdd5e4 ; -> cxa_begin_catch
0009cd12  ldr     r0, [sp, #0x88]
0009cd14  ldr     r1, [sp, #0x10]
0009cd16  cmp     r0, r1
0009cd18  beq     #0x9cd40
0009cd1a  ldr.w   r3, [pc, #0x80]
0009cd1e  str     r0, [sp, #0x8c]
0009cd20  add     r3, pc ; -> 0x000f3370  0x0
0009cd22  ldr     r3, [r3]
0009cd24  str     r3, [sp, #0x7c]
0009cd26  ldr     r2, [sp, #0x8c]
0009cd28  ldr     r4, [sp, #0x7c]
0009cd2a  ldr     r3, [r2]
0009cd2c  sub.w   r0, r3, #0xc
0009cd30  cmp     r0, r4
0009cd32  bne     #0x9cd48
0009cd34  ldr     r0, [sp, #0x8c]
0009cd36  ldr     r1, [sp, #0x10]
0009cd38  adds    r0, #4
0009cd3a  cmp     r0, r1
0009cd3c  str     r0, [sp, #0x8c]
0009cd3e  bne     #0x9cd26
0009cd40  movs    r3, #4
0009cd42  str     r3, [sp, #0x94]
0009cd44  blx     #0xdd5fc ; -> cxa_rethrow
0009cd48  subs    r2, r3, #4
0009cd4a  ldr     r3, [r3, #-0x4]
0009cd4e  subs    r1, r3, #1
0009cd50  dmb     ish
0009cd54  mov     ip, r3
0009cd56  ldrex   lr, [r2]
0009cd5a  cmp     lr, r3
0009cd5c  beq     #0x9cd74
0009cd5e  cmp     lr, ip
0009cd60  mov     r3, lr
0009cd62  bne     #0x9cd4e
0009cd64  cmp.w   lr, #0
0009cd68  bgt     #0x9cd34
0009cd6a  add.w   r1, sp, #0xc7
0009cd6e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009cd72  b       #0x9cd34
0009cd74  strex   r4, r1, [r2]
0009cd78  cmp     r4, #0
0009cd7a  bne     #0x9cd56
0009cd7c  dmb     ish
0009cd80  b       #0x9cd5e
0009cd82  nop     
0009cd84  ldr     r4, [r0, #0x28]
0009cd86  movs    r5, r0
0009cd88  adds    r0, r4, r6
0009cd8a  movs    r5, r0
0009cd8c  lsls    r0, r1, #0xa
0009cd8e  movs    r0, r0
0009cd90  ldr     r6, [r2, #0x10]
0009cd92  movs    r5, r0
0009cd94  str     r4, [r3, #0x7c]
0009cd96  movs    r5, r0
0009cd98  str     r4, [r6, #0x6c]
0009cd9a  movs    r5, r0
0009cd9c  str     r4, [r1, #0x64]
0009cd9e  movs    r5, r0
