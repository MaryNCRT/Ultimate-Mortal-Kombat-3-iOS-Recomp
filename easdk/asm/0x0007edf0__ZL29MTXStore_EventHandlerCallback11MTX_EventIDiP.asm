========================================================================
ZL29MTXStore_EventHandlerCallback11MTX_EventIDiPv  0x0007edf0  600 bytes   EASDK_Handler.mm
========================================================================

0007edf0  push    {r4, r5, r7, lr}
0007edf2  add     r7, sp, #8
0007edf4  mov     r4, r0
0007edf6  ldr     r0, [pc, #0x1c4]
0007edf8  mov     r5, r2
0007edfa  add     r0, pc ; -> 0x0017e464  kGraphBaseURL+0x334
0007edfc  blx     #0xdd3e0 ; -> NSLog
0007ee00  subs    r0, r4, #1
0007ee02  cmp     r0, #0x24
0007ee04  bhi     #0x7ee9c
0007ee06  tbh     [pc, r0, lsl #1]
0007ee0a  lsls    r7, r1, #1
0007ee0c  lsls    r4, r2, #1
0007ee0e  lsls    r1, r1, #1
0007ee10  lsls    r1, r4, #1
0007ee12  lsls    r6, r4, #1
0007ee14  lsls    r1, r1, #1
0007ee16  lsls    r1, r1, #1
0007ee18  lsls    r1, r1, #1
0007ee1a  lsls    r1, r1, #1
0007ee1c  lsls    r1, r1, #1
0007ee1e  lsls    r1, r1, #1
0007ee20  lsls    r3, r5, #1
0007ee22  lsls    r1, r1, #1
0007ee24  lsls    r0, r6, #1
0007ee26  lsls    r1, r1, #1
0007ee28  lsls    r1, r1, #1
0007ee2a  lsls    r1, r1, #1
0007ee2c  lsls    r1, r1, #1
0007ee2e  lsls    r1, r1, #1
0007ee30  lsls    r1, r1, #1
0007ee32  lsls    r5, r6, #1
0007ee34  lsls    r2, r7, #1
0007ee36  lsls    r1, r1, #1
0007ee38  lsls    r1, r1, #1
0007ee3a  movs    r6, r4
0007ee3c  lsls    r7, r7, #1
0007ee3e  lsls    r7, r3, #2
0007ee40  lsls    r4, r4, #2
0007ee42  lsls    r1, r1, #1
0007ee44  lsls    r1, r1, #1
0007ee46  lsls    r1, r5, #2
0007ee48  lsls    r5, r6, #2
0007ee4a  lsls    r2, r7, #2
0007ee4c  lsls    r7, r7, #2
0007ee4e  lsls    r1, r1, #1
0007ee50  lsls    r4, r0, #3
0007ee52  lsls    r2, r1, #1
0007ee54  lsls    r1, r1, #1
0007ee56  ldr     r0, [pc, #0x168]
0007ee58  add     r0, pc ; -> 0x0017e4f4  kGraphBaseURL+0x3c4
0007ee5a  blx     #0xdd3e0 ; -> NSLog
0007ee5e  bl      #0x7ede4 ; -> EASDK_ConnectedToNetwork
0007ee62  cmp     r0, #0
0007ee64  beq.w   #0x7efb0
0007ee68  cbz     r5, #0x7ee8c
0007ee6a  ldr     r0, [pc, #0x158]
0007ee6c  add     r0, pc ; -> 0x0017e504  kGraphBaseURL+0x3d4
0007ee6e  blx     #0xdd3e0 ; -> NSLog
0007ee72  ldr.w   r3, [pc, #0x154]
0007ee76  movs    r2, #1
0007ee78  add     r3, pc ; -> 0x00175890  tickers
0007ee7a  str     r5, [r3]
0007ee7c  ldr     r3, [pc, #0x14c]
0007ee7e  add     r3, pc ; -> 0x000f337c  displayTicker
0007ee80  ldr     r3, [r3]
0007ee82  str     r2, [r3]
0007ee84  ldr     r3, [pc, #0x148]
0007ee86  add     r3, pc ; -> 0x000f3360  tickerLoaded
0007ee88  ldr     r3, [r3]
0007ee8a  str     r2, [r3]
0007ee8c  ldr     r3, [pc, #0x144]
0007ee8e  add     r3, pc ; -> 0x0017588c  msgShown
0007ee90  ldr     r3, [r3]
0007ee92  cbnz    r3, #0x7ee9c
0007ee94  ldr     r0, [pc, #0x140]
0007ee96  add     r0, pc ; -> 0x0017e524  kGraphBaseURL+0x3f4
0007ee98  blx     #0xdd3e0 ; -> NSLog
0007ee9c  pop     {r4, r5, r7, pc}
0007ee9e  ldr     r0, [pc, #0x13c]
0007eea0  add     r0, pc ; -> 0x0017e584  
0007eea2  blx     #0xdd3e0 ; -> NSLog
0007eea6  b       #0x7ee9c
0007eea8  ldr     r0, [pc, #0x134]
0007eeaa  add     r0, pc ; -> 0x0017e474  kGraphBaseURL+0x344
0007eeac  blx     #0xdd3e0 ; -> NSLog
0007eeb0  b       #0x7ee9c
0007eeb2  ldr     r4, [pc, #0x130]
0007eeb4  ldr     r1, [pc, #0x130]
0007eeb6  add     r4, pc ; -> 0x0017e484  kGraphBaseURL+0x354
0007eeb8  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
0007eeba  ldr     r1, [r1]
0007eebc  mov     r0, r5
0007eebe  blx     #0xddbfc ; -> objc_msgSend
0007eec2  mov     r1, r0
0007eec4  mov     r0, r4
0007eec6  blx     #0xdd3e0 ; -> NSLog
0007eeca  b       #0x7ee9c
0007eecc  ldr     r0, [pc, #0x11c]
0007eece  add     r0, pc ; -> 0x0017e4b4  kGraphBaseURL+0x384
0007eed0  blx     #0xdd3e0 ; -> NSLog
0007eed4  b       #0x7ee9c
0007eed6  ldr     r0, [pc, #0x118]
0007eed8  add     r0, pc ; -> 0x0017e4c4  kGraphBaseURL+0x394
0007eeda  blx     #0xdd3e0 ; -> NSLog
0007eede  b       #0x7ee9c
0007eee0  ldr     r0, [pc, #0x110]
0007eee2  add     r0, pc ; -> 0x0017e544  
0007eee4  blx     #0xdd3e0 ; -> NSLog
0007eee8  b       #0x7ee9c
0007eeea  ldr     r0, [pc, #0x10c]
0007eeec  add     r0, pc ; -> 0x0017e554  
0007eeee  blx     #0xdd3e0 ; -> NSLog
0007eef2  b       #0x7ee9c
0007eef4  ldr     r0, [pc, #0x104]
0007eef6  add     r0, pc ; -> 0x0017e4d4  kGraphBaseURL+0x3a4
0007eef8  blx     #0xdd3e0 ; -> NSLog
0007eefc  b       #0x7ee9c
0007eefe  ldr     r0, [pc, #0x100]
0007ef00  add     r0, pc ; -> 0x0017e4e4  kGraphBaseURL+0x3b4
0007ef02  blx     #0xdd3e0 ; -> NSLog
0007ef06  b       #0x7ee9c
0007ef08  ldr     r3, [pc, #0xf8]
0007ef0a  add     r3, pc ; -> 0x0017588c  msgShown
0007ef0c  ldr     r3, [r3]
0007ef0e  cmp     r3, #0
0007ef10  beq     #0x7efa6
0007ef12  ldr     r1, [pc, #0xf4]
0007ef14  mov     r0, r5
0007ef16  ldr     r4, [pc, #0xf4]
0007ef18  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
0007ef1a  ldr     r1, [r1]
0007ef1c  blx     #0xddbfc ; -> objc_msgSend
0007ef20  add     r4, pc ; -> 0x0017e534  
0007ef22  mov     r1, r5
0007ef24  mov     r2, r0
0007ef26  mov     r0, r4
0007ef28  blx     #0xdd3e0 ; -> NSLog
0007ef2c  bl      #0x7ede4 ; -> EASDK_ConnectedToNetwork
0007ef30  cmp     r0, #0
0007ef32  beq     #0x7ef9c
0007ef34  ldr     r0, [pc, #0xd8]
0007ef36  add     r0, pc ; -> 0x0017e504  kGraphBaseURL+0x3d4
0007ef38  blx     #0xdd3e0 ; -> NSLog
0007ef3c  ldr     r3, [pc, #0xd4]
0007ef3e  add     r3, pc ; -> 0x000f337c  displayTicker
0007ef40  ldr     r2, [r3]
0007ef42  movs    r3, #1
0007ef44  str     r3, [r2]
0007ef46  b       #0x7ee9c
0007ef48  ldr     r0, [pc, #0xcc]
0007ef4a  add     r0, pc ; -> 0x0017e5a4  
0007ef4c  blx     #0xdd3e0 ; -> NSLog
0007ef50  b       #0x7ee9c
0007ef52  ldr     r0, [pc, #0xc8]
0007ef54  add     r0, pc ; -> 0x0017e5b4  
0007ef56  blx     #0xdd3e0 ; -> NSLog
0007ef5a  b       #0x7ee9c
0007ef5c  ldr     r1, [pc, #0xc0]
0007ef5e  mov     r0, r5
0007ef60  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
0007ef62  ldr     r1, [r1]
0007ef64  blx     #0xddbfc ; -> objc_msgSend
0007ef68  mov     r1, r0
0007ef6a  ldr     r0, [pc, #0xb8]
0007ef6c  add     r0, pc ; -> 0x0017e494  kGraphBaseURL+0x364
0007ef6e  blx     #0xdd3e0 ; -> NSLog
0007ef72  b       #0x7ee9c
0007ef74  ldr     r4, [pc, #0xb0]
0007ef76  ldr     r1, [pc, #0xb4]
0007ef78  add     r4, pc ; -> 0x0017e4a4  kGraphBaseURL+0x374
0007ef7a  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
0007ef7c  b       #0x7eeba
0007ef7e  ldr     r0, [pc, #0xb0]
0007ef80  add     r0, pc ; -> 0x0017e564  
0007ef82  blx     #0xdd3e0 ; -> NSLog
0007ef86  b       #0x7ee9c
0007ef88  ldr     r0, [pc, #0xa8]
0007ef8a  add     r0, pc ; -> 0x0017e574  
0007ef8c  blx     #0xdd3e0 ; -> NSLog
0007ef90  b       #0x7ee9c
0007ef92  ldr     r0, [pc, #0xa4]
0007ef94  add     r0, pc ; -> 0x0017e594  
0007ef96  blx     #0xdd3e0 ; -> NSLog
0007ef9a  b       #0x7ee9c
0007ef9c  ldr     r0, [pc, #0x9c]
0007ef9e  add     r0, pc ; -> 0x0017e514  kGraphBaseURL+0x3e4
0007efa0  blx     #0xdd3e0 ; -> NSLog
0007efa4  b       #0x7ee9c
0007efa6  ldr     r0, [pc, #0x98]
0007efa8  add     r0, pc ; -> 0x0017e524  kGraphBaseURL+0x3f4
0007efaa  blx     #0xdd3e0 ; -> NSLog
0007efae  b       #0x7ef12
0007efb0  ldr     r0, [pc, #0x90]
0007efb2  add     r0, pc ; -> 0x0017e514  kGraphBaseURL+0x3e4
0007efb4  blx     #0xdd3e0 ; -> NSLog
0007efb8  b       #0x7ee8c
0007efba  nop     
