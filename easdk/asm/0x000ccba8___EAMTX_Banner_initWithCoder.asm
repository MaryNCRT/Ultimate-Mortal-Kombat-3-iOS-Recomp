========================================================================
-[EAMTX_Banner initWithCoder  0x000ccba8  248 bytes   EAMTX_Banner.mm
========================================================================

000ccba8  push    {r4, r5, r6, r7, lr}
000ccbaa  add     r7, sp, #0xc
000ccbac  sub     sp, #8
000ccbae  ldr     r3, [pc, #0xb8]
000ccbb0  ldr     r1, [pc, #0xb8]
000ccbb2  str     r0, [sp]
000ccbb4  add     r3, pc ; -> 0x000fdda8  
000ccbb6  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000ccbb8  ldr     r3, [r3]
000ccbba  ldr     r1, [r1]
000ccbbc  mov     r0, sp
000ccbbe  mov     r6, r2
000ccbc0  str     r3, [sp, #4]
000ccbc2  blx     #0xddc08 ; -> objc_msgSendSuper2
000ccbc6  mov     r4, r0
000ccbc8  cmp     r0, #0
000ccbca  beq     #0xccc5e
000ccbcc  ldr     r1, [pc, #0xa0]
000ccbce  ldr     r2, [pc, #0xa4]
000ccbd0  mov     r0, r6
000ccbd2  add     r1, pc ; -> 0x000fd214  
000ccbd4  add     r2, pc ; -> 0x00181e04  
000ccbd6  ldr     r5, [r1]
000ccbd8  mov     r1, r5
000ccbda  blx     #0xddbfc ; -> objc_msgSend
000ccbde  ldr     r1, [pc, #0x98]
000ccbe0  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000ccbe2  ldr     r1, [r1]
000ccbe4  blx     #0xddbfc ; -> objc_msgSend
000ccbe8  ldr     r1, [pc, #0x90]
000ccbea  add     r1, pc ; -> 0x000fd430  
000ccbec  ldr     r1, [r1]
000ccbee  mov     r2, r0
000ccbf0  mov     r0, r4
000ccbf2  blx     #0xddbfc ; -> objc_msgSend
000ccbf6  ldr     r2, [pc, #0x88]
000ccbf8  mov     r1, r5
000ccbfa  mov     r0, r6
000ccbfc  add     r2, pc ; -> 0x00181e14  
000ccbfe  blx     #0xddbfc ; -> objc_msgSend
000ccc02  ldr     r1, [pc, #0x80]
000ccc04  add     r1, pc ; -> 0x000fd20c  
000ccc06  ldr     r1, [r1]
000ccc08  mov     r2, r0
000ccc0a  mov     r0, r4
000ccc0c  blx     #0xddbfc ; -> objc_msgSend
000ccc10  ldr     r2, [pc, #0x74]
000ccc12  mov     r1, r5
000ccc14  mov     r0, r6
000ccc16  add     r2, pc ; -> 0x00181e24  
000ccc18  blx     #0xddbfc ; -> objc_msgSend
000ccc1c  ldr     r1, [pc, #0x6c]
000ccc1e  add     r1, pc ; -> 0x000fd208  
000ccc20  ldr     r1, [r1]
000ccc22  mov     r2, r0
000ccc24  mov     r0, r4
000ccc26  blx     #0xddbfc ; -> objc_msgSend
000ccc2a  ldr     r2, [pc, #0x64]
000ccc2c  mov     r1, r5
000ccc2e  mov     r0, r6
000ccc30  add     r2, pc ; -> 0x00181e34  
000ccc32  blx     #0xddbfc ; -> objc_msgSend
000ccc36  ldr     r1, [pc, #0x5c]
000ccc38  add     r1, pc ; -> 0x000fd42c  
000ccc3a  ldr     r1, [r1]
000ccc3c  mov     r2, r0
000ccc3e  mov     r0, r4
000ccc40  blx     #0xddbfc ; -> objc_msgSend
000ccc44  ldr     r2, [pc, #0x50]
000ccc46  mov     r1, r5
000ccc48  mov     r0, r6
000ccc4a  add     r2, pc ; -> 0x00181e44  
000ccc4c  blx     #0xddbfc ; -> objc_msgSend
000ccc50  ldr     r1, [pc, #0x48]
000ccc52  add     r1, pc ; -> 0x000fd200  
000ccc54  ldr     r1, [r1]
000ccc56  mov     r2, r0
000ccc58  mov     r0, r4
000ccc5a  blx     #0xddbfc ; -> objc_msgSend
000ccc5e  mov     r0, r4
000ccc60  sub.w   sp, r7, #0xc
000ccc64  pop     {r4, r5, r6, r7, pc}
000ccc66  nop     
000ccc68  asrs    r0, r6, #7
000ccc6a  movs    r3, r0
000ccc6c  stc2l   p0, c0, [r6, #8]
000ccc70  lsls    r6, r7, #0x18
000ccc72  movs    r3, r0
000ccc74  strh    r4, [r5, r0]
000ccc76  movs    r3, r1
000ccc78  vhadd.u8 d0, d4, d2
000ccc7c  lsrs    r2, r0, #1
000ccc7e  movs    r3, r0
000ccc80  strh    r4, [r2, r0]
000ccc82  movs    r3, r1
000ccc84  lsls    r4, r0, #0x18
000ccc86  movs    r3, r0
000ccc88  strh    r2, [r1, r0]
000ccc8a  movs    r3, r1
000ccc8c  lsls    r6, r4, #0x17
000ccc8e  movs    r3, r0
000ccc90  strh    r0, [r0, r0]
000ccc92  movs    r3, r1
000ccc94  lsls    r0, r6, #0x1f
000ccc96  movs    r3, r0
000ccc98  str     r6, [r6, r7]
000ccc9a  movs    r3, r1
000ccc9c  lsls    r2, r5, #0x16
000ccc9e  movs    r3, r0
