========================================================================
-[FBConnectionImpl init  0x0008892c  96 bytes   FBConnection.mm
========================================================================

0008892c  push    {r4, r7, lr}
0008892e  add     r7, sp, #4
00088930  ldr     r3, [pc, #0x38]
00088932  ldr     r1, [pc, #0x3c]
00088934  mov     r4, r0
00088936  add     r3, pc ; -> 0x00379bd0  m_connection
00088938  add     r1, pc ; -> 0x000fcf78  '.J\x0e'
0008893a  str     r2, [r3]
0008893c  ldr     r3, [pc, #0x34]
0008893e  movs    r2, #0
00088940  ldr     r1, [r1]
00088942  add     r3, pc ; -> 0x00379bd4  m_loggedIn
00088944  strb    r2, [r3]
00088946  ldr     r3, [pc, #0x30]
00088948  add     r3, pc ; -> 0x00379be0  m_showing
0008894a  strb    r2, [r3]
0008894c  ldr     r3, [pc, #0x2c]
0008894e  ldr     r2, [pc, #0x30]
00088950  add     r3, pc ; -> 0x0017da24  ZL9DevApiKey
00088952  add     r2, pc ; -> 0x00379bd8  m_APIKey
00088954  ldr     r3, [r3]
00088956  str     r3, [r2]
00088958  ldr     r3, [pc, #0x28]
0008895a  ldr     r2, [pc, #0x2c]
0008895c  add     r3, pc ; -> 0x0017da28  ZL12DevApiSecret
0008895e  add     r2, pc ; -> 0x00379bdc  m_APISecret
00088960  ldr     r3, [r3]
00088962  str     r3, [r2]
00088964  blx     #0xddbfc ; -> objc_msgSend
00088968  mov     r0, r4
0008896a  pop     {r4, r7, pc}
0008896c  asrs    r6, r2, #0xa
0008896e  movs    r7, r5
00088970  mov     r4, r7
00088972  movs    r7, r0
00088974  asrs    r6, r1, #0xa
00088976  movs    r7, r5
00088978  asrs    r4, r2, #0xa
0008897a  movs    r7, r5
0008897c  str     r0, [r2, r3]
0008897e  movs    r7, r1
00088980  asrs    r2, r0, #0xa
00088982  movs    r7, r5
00088984  str     r0, [r1, r3]
00088986  movs    r7, r1
00088988  asrs    r2, r7, #9
0008898a  movs    r7, r5
