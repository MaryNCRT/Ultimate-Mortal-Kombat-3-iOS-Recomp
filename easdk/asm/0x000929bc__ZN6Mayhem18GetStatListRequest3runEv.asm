========================================================================
ZN6Mayhem18GetStatListRequest3runEv  0x000929bc  28 bytes   Mayhem.mm
========================================================================

000929bc  push    {r7, lr}
000929be  add     r7, sp, #0
000929c0  ldr     r2, [r0, #0x60]
000929c2  ldr     r3, [r0, #0x5c]
000929c4  rsb     r3, r3, r2
000929c8  lsrs    r3, r3, #2
000929ca  beq     #0x929d2
000929cc  bl      #0x920c0 ; -> ZN6Mayhem18GetStatListRequest15RequestForUsersEv
000929d0  pop     {r7, pc}
000929d2  bl      #0x91890 ; -> ZN6Mayhem18GetStatListRequest26RequestForStatCodeExtendedEv
000929d6  b       #0x929d0
