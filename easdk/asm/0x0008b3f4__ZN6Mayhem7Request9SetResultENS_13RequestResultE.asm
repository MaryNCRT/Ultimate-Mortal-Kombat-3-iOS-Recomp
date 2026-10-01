========================================================================
ZN6Mayhem7Request9SetResultENS_13RequestResultE  0x0008b3f4  28 bytes   Mayhem.mm
========================================================================

0008b3f4  push    {r4, r5, r6, r7, lr}
0008b3f6  add     r7, sp, #0xc
0008b3f8  add.w   r4, r0, #0x20
0008b3fc  mov     r5, r0
0008b3fe  mov     r0, r4
0008b400  mov     r6, r1
0008b402  blx     #0xddc8c ; -> pthread_mutex_lock
0008b406  mov     r0, r4
0008b408  str     r6, [r5, #0x4c]
0008b40a  blx     #0xddc98 ; -> pthread_mutex_unlock
0008b40e  pop     {r4, r5, r6, r7, pc}
