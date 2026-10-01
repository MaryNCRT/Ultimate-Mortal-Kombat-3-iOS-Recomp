========================================================================
-[FBRequest post  0x000858ec  160 bytes   FBRequest.m
========================================================================

000858ec  push    {r4, r5, r6, r7, lr}
000858ee  add     r7, sp, #0xc
000858f0  ldr     r1, [pc, #0x6c]
000858f2  mov     r6, r3
000858f4  ldr     r3, [pc, #0x6c]
000858f6  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000858f8  mov     r5, r0
000858fa  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
000858fc  ldr     r1, [r1]
000858fe  mov     r0, r2
00085900  ldr     r4, [r3]
00085902  blx     #0xddbfc ; -> objc_msgSend
00085906  ldr     r3, [pc, #0x60]
00085908  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
0008590a  str     r0, [r5, r4]
0008590c  ldr     r4, [r3]
0008590e  cbz     r6, #0x85944
00085910  ldr     r0, [pc, #0x58]
00085912  ldr     r1, [pc, #0x5c]
00085914  add     r0, pc ; -> 0x000fdbf4  
00085916  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00085918  ldr     r0, [r0]
0008591a  ldr     r1, [r1]
0008591c  blx     #0xddbfc ; -> objc_msgSend
00085920  ldr     r1, [pc, #0x50]
00085922  mov     r2, r6
00085924  add     r1, pc ; -> 0x000fce14  'r<\x0e'
00085926  ldr     r1, [r1]
00085928  blx     #0xddbfc ; -> objc_msgSend
0008592c  ldr     r3, [pc, #0x48]
0008592e  ldr     r1, [pc, #0x4c]
00085930  str     r0, [r5, r4]
00085932  add     r3, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
00085934  add     r1, pc ; -> 0x000fce08  'Z<\x0e'
00085936  ldr     r3, [r3]
00085938  ldr     r1, [r1]
0008593a  mov     r2, r5
0008593c  ldr     r0, [r5, r3]
0008593e  blx     #0xddbfc ; -> objc_msgSend
00085942  pop     {r4, r5, r6, r7, pc}
00085944  ldr     r0, [pc, #0x38]
00085946  ldr     r1, [pc, #0x3c]
00085948  add     r0, pc ; -> 0x000fdbf4  
0008594a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0008594c  ldr     r0, [r0]
0008594e  ldr     r1, [r1]
00085950  blx     #0xddbfc ; -> objc_msgSend
00085954  ldr     r1, [pc, #0x30]
00085956  add     r1, pc ; -> 0x000fc980  '$(\x0e'
00085958  ldr     r1, [r1]
0008595a  blx     #0xddbfc ; -> objc_msgSend
0008595e  b       #0x8592c
00085960  strb    r6, [r2, #0xf]
00085962  movs    r7, r0
00085964  lsls    r2, r1, #3
00085966  movs    r7, r0
00085968  lsls    r4, r0, #3
0008596a  movs    r7, r0
0008596c  strh    r4, [r3, #0x16]
0008596e  movs    r7, r0
00085970  strb    r2, [r5, #1]
00085972  movs    r7, r0
00085974  strb    r4, [r5, #0x13]
00085976  movs    r7, r0
00085978  lsls    r2, r1, #2
0008597a  movs    r7, r0
0008597c  strb    r0, [r2, #0x13]
0008597e  movs    r7, r0
00085980  strh    r0, [r5, #0x14]
00085982  movs    r7, r0
00085984  strb    r6, [r6]
00085986  movs    r7, r0
00085988  strb    r6, [r4]
0008598a  movs    r7, r0
