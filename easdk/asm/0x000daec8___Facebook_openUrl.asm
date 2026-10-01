========================================================================
-[Facebook openUrl  0x000daec8  272 bytes   Facebook.m
========================================================================

000daec8  push    {r4, r5, r6, r7, lr}
000daeca  add     r7, sp, #0xc
000daecc  push.w  {r8, sl}
000daed0  sub     sp, #8
000daed2  ldr     r1, [pc, #0xc4]
000daed4  mov     r5, r3
000daed6  mov     sl, r2
000daed8  add     r1, pc ; -> 0x000fd5e0  
000daeda  ldr     r2, [pc, #0xc0]
000daedc  ldr     r4, [r1]
000daede  ldr     r3, [pc, #0xc0]
000daee0  mov     r6, r0
000daee2  add     r2, pc ; -> 0x00182a24  
000daee4  add     r3, pc ; -> 0x0017eb04  
000daee6  mov     r0, r5
000daee8  mov     r1, r4
000daeea  blx     #0xddbfc ; -> objc_msgSend
000daeee  ldr     r2, [pc, #0xb4]
000daef0  ldr     r3, [pc, #0xb4]
000daef2  mov     r0, r5
000daef4  add     r2, pc ; -> 0x0017e114  kSDK
000daef6  add     r3, pc ; -> 0x00182964  
000daef8  ldr     r2, [r2]
000daefa  mov     r1, r4
000daefc  blx     #0xddbfc ; -> objc_msgSend
000daf00  ldr     r2, [pc, #0xa8]
000daf02  ldr     r3, [pc, #0xac]
000daf04  mov     r0, r5
000daf06  add     r2, pc ; -> 0x0017e118  kSDKVersion
000daf08  add     r3, pc ; -> 0x00182a34  
000daf0a  ldr     r2, [r2]
000daf0c  mov     r1, r4
000daf0e  blx     #0xddbfc ; -> objc_msgSend
000daf12  ldr     r1, [pc, #0xa0]
000daf14  mov     r0, r6
000daf16  add     r1, pc ; -> 0x000fd9e0  
000daf18  ldr     r1, [r1]
000daf1a  blx     #0xddbfc ; -> objc_msgSend
000daf1e  tst.w   r0, #0xff
000daf22  beq     #0xdaf3e
000daf24  ldr     r1, [pc, #0x90]
000daf26  mov     r0, r6
000daf28  add     r1, pc ; -> 0x000fd9c8  '\x13\x1c\x0f'
000daf2a  ldr     r1, [r1]
000daf2c  blx     #0xddbfc ; -> objc_msgSend
000daf30  ldr     r3, [pc, #0x88]
000daf32  mov     r1, r4
000daf34  add     r3, pc ; -> 0x001829a4  
000daf36  mov     r2, r0
000daf38  mov     r0, r5
000daf3a  blx     #0xddbfc ; -> objc_msgSend
000daf3e  ldr     r4, [pc, #0x80]
000daf40  ldr     r1, [pc, #0x80]
000daf42  add     r4, pc ; -> 0x000fc510  OBJC_IVAR_$_Facebook._request
000daf44  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000daf46  ldr     r3, [r4]
000daf48  ldr     r1, [r1]
000daf4a  ldr     r0, [r6, r3]
000daf4c  blx     #0xddbfc ; -> objc_msgSend
000daf50  ldr     r0, [pc, #0x74]
000daf52  ldr     r1, [pc, #0x78]
000daf54  ldr     r3, [sp, #0x28]
000daf56  add     r0, pc ; -> 0x000fdbf0  
000daf58  add     r1, pc ; -> 0x000fdaec  
000daf5a  ldr.w   r8, [r4]
000daf5e  mov     r2, r5
000daf60  str     r3, [sp]
000daf62  ldr     r1, [r1]
000daf64  ldr     r3, [sp, #0x24]
000daf66  ldr     r0, [r0]
000daf68  str.w   sl, [sp, #4]
000daf6c  blx     #0xddbfc ; -> objc_msgSend
000daf70  ldr     r1, [pc, #0x5c]
000daf72  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000daf74  ldr     r1, [r1]
000daf76  blx     #0xddbfc ; -> objc_msgSend
000daf7a  ldr     r1, [pc, #0x58]
000daf7c  add     r1, pc ; -> 0x000fcee4  
000daf7e  ldr     r1, [r1]
000daf80  str.w   r0, [r6, r8]
000daf84  ldr     r0, [r4]
000daf86  ldr     r0, [r6, r0]
000daf88  blx     #0xddbfc ; -> objc_msgSend
000daf8c  sub.w   sp, r7, #0x14
000daf90  pop.w   {r8, sl}
000daf94  pop     {r4, r5, r6, r7, pc}
000daf96  nop     
000daf98  movs    r7, #4
000daf9a  movs    r2, r0
000daf9c  ldrb    r6, [r7, #0xc]
000daf9e  movs    r2, r1
000dafa0  subs    r4, #0x1c
000dafa2  movs    r2, r1
000dafa4  adds    r2, #0x1c
000dafa6  movs    r2, r1
000dafa8  ldrb    r2, [r5, #9]
000dafaa  movs    r2, r1
000dafac  adds    r2, #0xe
000dafae  movs    r2, r1
000dafb0  ldrb    r0, [r5, #0xc]
000dafb2  movs    r2, r1
000dafb4  cmp     r2, #0xc6
000dafb6  movs    r2, r0
000dafb8  cmp     r2, #0x9c
000dafba  movs    r2, r0
000dafbc  ldrb    r4, [r5, #9]
000dafbe  movs    r2, r1
000dafc0  asrs    r2, r1, #0x17
000dafc2  movs    r2, r0
000dafc4  subs    r4, r6, r0
000dafc6  movs    r2, r0
000dafc8  cmp     r4, #0x96
000dafca  movs    r2, r0
000dafcc  cmp     r3, #0x90
000dafce  movs    r2, r0
000dafd0  adds    r2, r3, #5
000dafd2  movs    r2, r0
000dafd4  subs    r4, r4, #5
000dafd6  movs    r2, r0
