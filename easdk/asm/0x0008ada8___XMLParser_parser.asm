========================================================================
-[XMLParser parser  0x0008ada8  36 bytes   Mayhem.mm
========================================================================

0008ada8  push    {r7, lr}
0008adaa  add     r7, sp, #0
0008adac  ldr     r1, [pc, #0x14]
0008adae  mov     r2, r3
0008adb0  add     r1, pc ; -> 0x000f6430  OBJC_IVAR_$_XMLParser.m_currentElement
0008adb2  ldr     r1, [r1]
0008adb4  ldr     r0, [r0, r1]
0008adb6  cbz     r0, #0x8adc2
0008adb8  ldr     r1, [pc, #0xc]
0008adba  add     r1, pc ; -> 0x000fcfc8  
0008adbc  ldr     r1, [r1]
0008adbe  blx     #0xddbfc ; -> objc_msgSend
0008adc2  pop     {r7, pc}
