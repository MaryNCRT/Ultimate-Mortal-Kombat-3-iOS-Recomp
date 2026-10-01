========================================================================
-[FBPermissionDialog setPermission  0x00085740  44 bytes   FBPermissionDialog.m
========================================================================

00085740  push    {r7, lr}
00085742  add     r7, sp, #0
00085744  sub     sp, #8
00085746  mov     r3, r2
00085748  ldr     r2, [pc, #0x1c]
0008574a  mov.w   ip, #0
0008574e  add     r2, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
00085750  ldr     r2, [r2]
00085752  str.w   ip, [sp]
00085756  add.w   ip, ip, #1
0008575a  str.w   ip, [sp, #4]
0008575e  blx     #0xddc20 ; -> objc_setProperty
00085762  sub.w   sp, r7, #0
00085766  pop     {r7, pc}
00085768  vhadd.u32 d0, d2, d6
