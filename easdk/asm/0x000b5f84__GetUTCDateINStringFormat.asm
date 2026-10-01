========================================================================
GetUTCDateINStringFormat  0x000b5f84  248 bytes   EAMTX_Main.mm
========================================================================

000b5f84  push    {r4, r5, r6, r7, lr}
000b5f86  add     r7, sp, #0xc
000b5f88  str     r8, [sp, #-0x4]!
000b5f8c  mov     r8, r0
000b5f8e  cbnz    r0, #0xb5f98
000b5f90  ldr     r0, [pc, #0xb0]
000b5f92  add     r0, pc ; -> 0x0038c0fc  emptyStr
000b5f94  ldr     r5, [r0]
000b5f96  b       #0xb603a
000b5f98  ldr     r0, [pc, #0xac]
000b5f9a  ldr     r1, [pc, #0xb0]
000b5f9c  ldr     r2, [pc, #0xb0]
000b5f9e  add     r0, pc ; -> 0x000fdc84  
000b5fa0  add     r1, pc ; -> 0x000fd588  
000b5fa2  ldr     r4, [r0]
000b5fa4  add     r2, pc ; -> 0x0017feb4  
000b5fa6  ldr     r1, [r1]
000b5fa8  mov     r0, r4
000b5faa  blx     #0xddbfc ; -> objc_msgSend
000b5fae  ldr     r1, [pc, #0xa4]
000b5fb0  add     r1, pc ; -> 0x000fd598  
000b5fb2  ldr     r1, [r1]
000b5fb4  mov     r6, r0
000b5fb6  mov     r0, r4
000b5fb8  blx     #0xddbfc ; -> objc_msgSend
000b5fbc  ldr     r1, [pc, #0x98]
000b5fbe  add     r1, pc ; -> 0x000fd584  
000b5fc0  ldr     r4, [r1]
000b5fc2  mov     r1, r4
000b5fc4  mov     r5, r0
000b5fc6  mov     r0, r6
000b5fc8  blx     #0xddbfc ; -> objc_msgSend
000b5fcc  mov     r1, r4
000b5fce  mov     r6, r0
000b5fd0  mov     r0, r5
000b5fd2  blx     #0xddbfc ; -> objc_msgSend
000b5fd6  ldr     r1, [pc, #0x84]
000b5fd8  add     r1, pc ; -> 0x000fd580  
000b5fda  ldr     r1, [r1]
000b5fdc  rsb     r0, r0, r6
000b5fe0  vmov    s12, r0
000b5fe4  vcvt.f64.s32 d7, s12
000b5fe8  mov     r0, r8
000b5fea  vmov    r2, r3, d7
000b5fee  blx     #0xddbfc ; -> objc_msgSend
000b5ff2  ldr     r1, [pc, #0x6c]
000b5ff4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5ff6  ldr     r1, [r1]
000b5ff8  mov     r5, r0
000b5ffa  ldr     r0, [pc, #0x68]
000b5ffc  add     r0, pc ; -> 0x000fdc88  
000b5ffe  ldr     r0, [r0]
000b6000  blx     #0xddbfc ; -> objc_msgSend
000b6004  ldr     r1, [pc, #0x60]
000b6006  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6008  ldr     r1, [r1]
000b600a  blx     #0xddbfc ; -> objc_msgSend
000b600e  ldr     r1, [pc, #0x5c]
000b6010  ldr     r2, [pc, #0x5c]
000b6012  add     r1, pc ; -> 0x000fd57c  
000b6014  add     r2, pc ; -> 0x0017fec4  
000b6016  ldr     r1, [r1]
000b6018  mov     r4, r0
000b601a  blx     #0xddbfc ; -> objc_msgSend
000b601e  ldr     r1, [pc, #0x54]
000b6020  mov     r2, r5
000b6022  mov     r0, r4
000b6024  add     r1, pc ; -> 0x000fd578  
000b6026  ldr     r1, [r1]
000b6028  blx     #0xddbfc ; -> objc_msgSend
000b602c  ldr     r1, [pc, #0x48]
000b602e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b6030  ldr     r1, [r1]
000b6032  mov     r5, r0
000b6034  mov     r0, r4
000b6036  blx     #0xddbfc ; -> objc_msgSend
000b603a  mov     r0, r5
000b603c  ldr     r8, [sp], #4
000b6040  pop     {r4, r5, r6, r7, pc}
000b6042  nop     
000b6044  str     r6, [r4, #0x14]
000b6046  movs    r5, r5
000b6048  ldrb    r2, [r4, #0x13]
000b604a  movs    r4, r0
000b604c  strb    r4, [r4, #0x17]
000b604e  movs    r4, r0
000b6050  ldr     r7, [sp, #0x30]
000b6052  movs    r4, r1
000b6054  strb    r4, [r4, #0x17]
000b6056  movs    r4, r0
000b6058  strb    r2, [r0, #0x17]
000b605a  movs    r4, r0
000b605c  strb    r4, [r4, #0x16]
000b605e  movs    r4, r0
000b6060  ldr     r4, [r1, #0x18]
000b6062  movs    r4, r0
000b6064  ldrb    r0, [r1, #0x12]
000b6066  movs    r4, r0
000b6068  ldr     r6, [r6, #0x14]
000b606a  movs    r4, r0
000b606c  strb    r6, [r4, #0x15]
000b606e  movs    r4, r0
000b6070  ldr     r6, [sp, #0x2b0]
000b6072  movs    r4, r1
000b6074  strb    r0, [r2, #0x15]
000b6076  movs    r4, r0
000b6078  ldr     r2, [r1, #0x14]
000b607a  movs    r4, r0
