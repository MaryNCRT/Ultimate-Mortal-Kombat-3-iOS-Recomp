========================================================================
-[EAMTX_Category initWithCoder  0x000ccf1c  264 bytes   EAMTX_Category.mm
========================================================================

000ccf1c  push    {r4, r5, r6, r7, lr}
000ccf1e  add     r7, sp, #0xc
000ccf20  str     r8, [sp, #-0x4]!
000ccf24  sub     sp, #8
000ccf26  ldr     r3, [pc, #0xc4]
000ccf28  ldr     r1, [pc, #0xc4]
000ccf2a  str     r0, [sp]
000ccf2c  add     r3, pc ; -> 0x000fddac  
000ccf2e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000ccf30  ldr     r3, [r3]
000ccf32  ldr     r1, [r1]
000ccf34  mov     r0, sp
000ccf36  mov     r6, r2
000ccf38  str     r3, [sp, #4]
000ccf3a  blx     #0xddc08 ; -> objc_msgSendSuper2
000ccf3e  mov     r4, r0
000ccf40  cmp     r0, #0
000ccf42  beq     #0xccfe0
000ccf44  ldr     r1, [pc, #0xac]
000ccf46  ldr     r2, [pc, #0xb0]
000ccf48  mov     r0, r6
000ccf4a  add     r1, pc ; -> 0x000fd214  
000ccf4c  add     r2, pc ; -> 0x00180074  
000ccf4e  ldr     r5, [r1]
000ccf50  mov     r1, r5
000ccf52  blx     #0xddbfc ; -> objc_msgSend
000ccf56  ldr     r1, [pc, #0xa4]
000ccf58  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000ccf5a  ldr.w   r8, [r1]
000ccf5e  mov     r1, r8
000ccf60  blx     #0xddbfc ; -> objc_msgSend
000ccf64  ldr     r1, [pc, #0x98]
000ccf66  add     r1, pc ; -> 0x000fd424  
000ccf68  ldr     r1, [r1]
000ccf6a  mov     r2, r0
000ccf6c  mov     r0, r4
000ccf6e  blx     #0xddbfc ; -> objc_msgSend
000ccf72  ldr     r2, [pc, #0x90]
000ccf74  mov     r1, r5
000ccf76  mov     r0, r6
000ccf78  add     r2, pc ; -> 0x0017fe24  
000ccf7a  blx     #0xddbfc ; -> objc_msgSend
000ccf7e  ldr     r1, [pc, #0x88]
000ccf80  add     r1, pc ; -> 0x000fd20c  
000ccf82  ldr     r1, [r1]
000ccf84  mov     r2, r0
000ccf86  mov     r0, r4
000ccf88  blx     #0xddbfc ; -> objc_msgSend
000ccf8c  ldr     r2, [pc, #0x7c]
000ccf8e  mov     r1, r5
000ccf90  mov     r0, r6
000ccf92  add     r2, pc ; -> 0x00181e54  
000ccf94  blx     #0xddbfc ; -> objc_msgSend
000ccf98  ldr     r1, [pc, #0x74]
000ccf9a  add     r1, pc ; -> 0x000fd420  
000ccf9c  ldr     r1, [r1]
000ccf9e  mov     r2, r0
000ccfa0  mov     r0, r4
000ccfa2  blx     #0xddbfc ; -> objc_msgSend
000ccfa6  ldr     r2, [pc, #0x6c]
000ccfa8  mov     r1, r5
000ccfaa  mov     r0, r6
000ccfac  add     r2, pc ; -> 0x00181e64  
000ccfae  blx     #0xddbfc ; -> objc_msgSend
000ccfb2  ldr     r1, [pc, #0x64]
000ccfb4  add     r1, pc ; -> 0x000fd41c  
000ccfb6  ldr     r1, [r1]
000ccfb8  mov     r2, r0
000ccfba  mov     r0, r4
000ccfbc  blx     #0xddbfc ; -> objc_msgSend
000ccfc0  ldr     r2, [pc, #0x58]
000ccfc2  mov     r1, r5
000ccfc4  mov     r0, r6
000ccfc6  add     r2, pc ; -> 0x00181e74  
000ccfc8  blx     #0xddbfc ; -> objc_msgSend
000ccfcc  mov     r1, r8
000ccfce  blx     #0xddbfc ; -> objc_msgSend
000ccfd2  ldr     r1, [pc, #0x4c]
000ccfd4  add     r1, pc ; -> 0x000fd5f8  
000ccfd6  ldr     r1, [r1]
000ccfd8  mov     r2, r0
000ccfda  mov     r0, r4
000ccfdc  blx     #0xddbfc ; -> objc_msgSend
000ccfe0  mov     r0, r4
000ccfe2  sub.w   sp, r7, #0x10
000ccfe6  ldr     r8, [sp], #4
000ccfea  pop     {r4, r5, r6, r7, pc}
000ccfec  lsrs    r4, r7, #0x19
000ccfee  movs    r3, r0
