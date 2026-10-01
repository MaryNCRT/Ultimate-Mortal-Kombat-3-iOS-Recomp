========================================================================
ZNK6Mayhem5Token7IsValidEv  0x0008b824  32 bytes   Mayhem.mm
========================================================================

0008b824  push    {r7, lr}
0008b826  add     r7, sp, #0
0008b828  ldr     r3, [r0, #0x58]
0008b82a  mov     r2, r0
0008b82c  ldr     r0, [r3, #-0xc]
0008b830  cbz     r0, #0x8b840
0008b832  mov     r0, r2
0008b834  bl      #0x8b584 ; -> ZNK6Mayhem5Token9IsExpiredEv
0008b838  rsbs.w  r0, r0, #1
0008b83c  it      lo
0008b83e  movlo   r0, #0
0008b840  pop     {r7, pc}
0008b842  nop     
