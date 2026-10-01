========================================================================
GetTickerObj  0x000b5a8c  280 bytes   EAMTX_Main.mm
========================================================================

000b5a8c  push    {r4, r5, r6, r7, lr}
000b5a8e  add     r7, sp, #0xc
000b5a90  mov     r6, r0
000b5a92  ldr     r0, [pc, #0xc8]
000b5a94  add     r0, pc ; -> 0x0038c144  m_CurrTicker
000b5a96  ldr     r0, [r0]
000b5a98  cbz     r0, #0xb5aa4
000b5a9a  ldr     r1, [pc, #0xc4]
000b5a9c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5a9e  ldr     r1, [r1]
000b5aa0  blx     #0xddbfc ; -> objc_msgSend
000b5aa4  ldr     r0, [pc, #0xbc]
000b5aa6  ldr     r1, [pc, #0xc0]
000b5aa8  ldr     r5, [pc, #0xc0]
000b5aaa  add     r0, pc ; -> 0x000fdc98  
000b5aac  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5aae  ldr     r0, [r0]
000b5ab0  ldr     r1, [r1]
000b5ab2  blx     #0xddbfc ; -> objc_msgSend
000b5ab6  ldr     r1, [pc, #0xb8]
000b5ab8  add     r5, pc ; -> 0x0038c144  m_CurrTicker
000b5aba  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b5abc  ldr     r1, [r1]
000b5abe  blx     #0xddbfc ; -> objc_msgSend
000b5ac2  ldr     r1, [pc, #0xb0]
000b5ac4  ldr     r2, [pc, #0xb0]
000b5ac6  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b5ac8  add     r2, pc ; -> 0x0017fe14  
000b5aca  ldr     r4, [r1]
000b5acc  mov     r1, r4
000b5ace  str     r0, [r5]
000b5ad0  mov     r0, r6
000b5ad2  blx     #0xddbfc ; -> objc_msgSend
000b5ad6  ldr     r1, [pc, #0xa4]
000b5ad8  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b5ada  ldr     r1, [r1]
000b5adc  blx     #0xddbfc ; -> objc_msgSend
000b5ae0  ldr     r1, [pc, #0x9c]
000b5ae2  add     r1, pc ; -> 0x000fd210  
000b5ae4  ldr     r1, [r1]
000b5ae6  mov     r2, r0
000b5ae8  ldr     r0, [r5]
000b5aea  blx     #0xddbfc ; -> objc_msgSend
000b5aee  ldr     r2, [pc, #0x94]
000b5af0  mov     r1, r4
000b5af2  mov     r0, r6
000b5af4  add     r2, pc ; -> 0x0017fe24  
000b5af6  blx     #0xddbfc ; -> objc_msgSend
000b5afa  ldr     r1, [pc, #0x8c]
000b5afc  add     r1, pc ; -> 0x000fd20c  
000b5afe  ldr     r1, [r1]
000b5b00  mov     r2, r0
000b5b02  ldr     r0, [r5]
000b5b04  blx     #0xddbfc ; -> objc_msgSend
000b5b08  ldr     r2, [pc, #0x80]
000b5b0a  mov     r1, r4
000b5b0c  mov     r0, r6
000b5b0e  add     r2, pc ; -> 0x0017fe34  
000b5b10  blx     #0xddbfc ; -> objc_msgSend
000b5b14  ldr     r1, [pc, #0x78]
000b5b16  add     r1, pc ; -> 0x000fd208  
000b5b18  ldr     r1, [r1]
000b5b1a  mov     r2, r0
000b5b1c  ldr     r0, [r5]
000b5b1e  blx     #0xddbfc ; -> objc_msgSend
000b5b22  ldr     r2, [pc, #0x70]
000b5b24  mov     r1, r4
000b5b26  mov     r0, r6
000b5b28  add     r2, pc ; -> 0x0017e754  
000b5b2a  blx     #0xddbfc ; -> objc_msgSend
000b5b2e  ldr     r1, [pc, #0x68]
000b5b30  add     r1, pc ; -> 0x000fd200  
000b5b32  ldr     r1, [r1]
000b5b34  mov     r2, r0
000b5b36  ldr     r0, [r5]
000b5b38  blx     #0xddbfc ; -> objc_msgSend
000b5b3c  ldr     r2, [pc, #0x5c]
000b5b3e  mov     r1, r4
000b5b40  mov     r0, r6
000b5b42  add     r2, pc ; -> 0x0017fe44  
000b5b44  blx     #0xddbfc ; -> objc_msgSend
000b5b48  ldr     r1, [pc, #0x54]
000b5b4a  add     r1, pc ; -> 0x000fd204  
000b5b4c  ldr     r1, [r1]
000b5b4e  mov     r2, r0
000b5b50  ldr     r0, [r5]
000b5b52  blx     #0xddbfc ; -> objc_msgSend
000b5b56  ldr     r0, [r5]
000b5b58  pop     {r4, r5, r6, r7, pc}
000b5b5a  nop     
000b5b5c  str     r4, [r5, #0x68]
000b5b5e  movs    r5, r5
000b5b60  ldr     r4, [r3, #0x6c]
000b5b62  movs    r4, r0
000b5b64  strh    r2, [r5, #0xe]
000b5b66  movs    r4, r0
000b5b68  ldr     r4, [r2, #0x6c]
000b5b6a  movs    r4, r0
000b5b6c  str     r0, [r1, #0x68]
000b5b6e  movs    r5, r5
000b5b70  ldr     r2, [r0, #0x6c]
000b5b72  movs    r4, r0
000b5b74  strb    r6, [r4]
000b5b76  movs    r4, r0
000b5b78  adr     r3, #0x120
000b5b7a  movs    r4, r1
000b5b7c  strb    r4, [r1]
000b5b7e  movs    r4, r0
000b5b80  strb    r2, [r5, #0x1c]
000b5b82  movs    r4, r0
000b5b84  adr     r3, #0xb0
000b5b86  movs    r4, r1
000b5b88  strb    r4, [r1, #0x1c]
000b5b8a  movs    r4, r0
000b5b8c  adr     r3, #0x88
000b5b8e  movs    r4, r1
000b5b90  strb    r6, [r5, #0x1b]
000b5b92  movs    r4, r0
000b5b94  ldrh    r0, [r5, #0x20]
000b5b96  movs    r4, r1
000b5b98  strb    r4, [r1, #0x1b]
000b5b9a  movs    r4, r0
000b5b9c  adr     r2, #0x3f8
000b5b9e  movs    r4, r1
000b5ba0  strb    r6, [r6, #0x1a]
000b5ba2  movs    r4, r0
