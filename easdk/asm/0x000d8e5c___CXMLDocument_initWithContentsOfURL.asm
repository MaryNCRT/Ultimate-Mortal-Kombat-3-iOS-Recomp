========================================================================
-[CXMLDocument initWithContentsOfURL  0x000d8e5c  80 bytes   CXMLDocument.m
========================================================================

000d8e5c  push    {r4, r5, r6, r7, lr}
000d8e5e  add     r7, sp, #0xc
000d8e60  sub     sp, #8
000d8e62  ldr     r4, [sp, #0x20]
000d8e64  mov     r5, r0
000d8e66  mov     r6, r3
000d8e68  cbz     r4, #0xd8e6e
000d8e6a  movs    r3, #0
000d8e6c  str     r3, [r4]
000d8e6e  ldr     r0, [pc, #0x30]
000d8e70  ldr     r1, [pc, #0x30]
000d8e72  movs    r3, #2
000d8e74  add     r0, pc ; -> 0x000fdb6c  
000d8e76  add     r1, pc ; -> 0x000fd850  '\x06\x10\x0f'
000d8e78  ldr     r0, [r0]
000d8e7a  ldr     r1, [r1]
000d8e7c  str     r4, [sp]
000d8e7e  blx     #0xddbfc ; -> objc_msgSend
000d8e82  mov     r2, r0
000d8e84  cbz     r0, #0xd8e9a
000d8e86  ldr     r1, [pc, #0x20]
000d8e88  ldr     r3, [sp, #0x1c]
000d8e8a  mov     r0, r5
000d8e8c  add     r1, pc ; -> 0x000fd858  '7\x0f\x0f'
000d8e8e  str     r4, [sp, #4]
000d8e90  str     r3, [sp]
000d8e92  ldr     r1, [r1]
000d8e94  mov     r3, r6
000d8e96  blx     #0xddbfc ; -> objc_msgSend
000d8e9a  sub.w   sp, r7, #0xc
000d8e9e  pop     {r4, r5, r6, r7, pc}
000d8ea0  ldr     r4, [pc, #0x3d0]
000d8ea2  movs    r2, r0
000d8ea4  ldr     r1, [pc, #0x358]
000d8ea6  movs    r2, r0
000d8ea8  ldr     r1, [pc, #0x320]
000d8eaa  movs    r2, r0
