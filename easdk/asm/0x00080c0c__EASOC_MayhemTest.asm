========================================================================
EASOC_MayhemTest  0x00080c0c  1952 bytes   EASDK_Handler.mm
========================================================================

00080c0c  push    {r4, r5, r6, r7, lr}
00080c0e  add     r7, sp, #0xc
00080c10  push.w  {r8, sl, fp}
00080c14  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00080c18  sub     sp, #0xf8
00080c1a  ldr.w   r3, [pc, #0x6c4]
00080c1e  str     r0, [sp, #8]
00080c20  add     r0, sp, #0xa8
00080c22  add     r3, pc ; -> 0x000f301c  0x0
00080c24  str     r7, [sp, #0xc8]
00080c26  ldr     r3, [r3]
00080c28  str.w   sp, [sp, #0xd0]
00080c2c  str     r3, [sp, #0xc0]
00080c2e  ldr.w   r3, [pc, #0x6b4]
00080c32  add     r3, pc ; -> 0x000ee146  GCC_except_table11
00080c34  str     r3, [sp, #0xc4]
00080c36  ldr.w   r3, [pc, #0x6b0]
00080c3a  add     r3, pc ; -> 0x0008114c  
00080c3c  orr     r3, r3, #1
00080c40  str     r3, [sp, #0xcc]
00080c42  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00080c46  ldr.w   r3, [pc, #0x6a4]
00080c4a  add     r3, pc ; -> 0x0017589c  mhState
00080c4c  ldr     r3, [r3]
00080c4e  cmp     r3, #1
00080c50  beq.w   #0x80d8a
00080c54  cmp     r3, #2
00080c56  beq     #0x80d30
00080c58  cmp     r3, #0
00080c5a  bne     #0x80d18
00080c5c  mov.w   r2, #-1
00080c60  str     r2, [sp, #0xac]
00080c62  bl      #0x7ec38 ; -> EASOC_FBIsLoggedIn
00080c66  cmp     r0, #0
00080c68  bne.w   #0x80df2
00080c6c  ldr.w   r0, [pc, #0x680]
00080c70  mov.w   r2, #-1
00080c74  str     r2, [sp, #0xac]
00080c76  add     r0, pc ; -> 0x0017e6b4  
00080c78  blx     #0xdd3e0 ; -> NSLog
00080c7c  movs    r0, #0x68
00080c7e  blx     #0xdd5c0 ; -> Znwm
00080c82  movs    r3, #8
00080c84  movs    r1, #1
00080c86  str     r3, [sp, #0xac]
00080c88  str     r0, [sp, #0x14]
00080c8a  str     r0, [sp, #0x18]
00080c8c  bl      #0x8e4c0 ; -> ZN6Mayhem14GetUserRequestC1Eb
00080c90  ldr     r4, [sp, #0x14]
00080c92  ldr     r2, [sp, #0x18]
00080c94  add     r3, sp, #0xec
00080c96  str     r3, [sp, #0x58]
00080c98  str     r4, [sp, #0xec]
00080c9a  cbz     r2, #0x80cae
00080c9c  adds.w  r0, r4, #8
00080ca0  beq     #0x80cae
00080ca2  ldr     r3, [r4, #8]
00080ca4  ldr     r2, [r3, #0xc]
00080ca6  mov.w   r3, #-1
00080caa  str     r3, [sp, #0xac]
00080cac  blx     r2
00080cae  ldr     r3, [sp, #0xec]
00080cb0  str     r3, [sp, #0x60]
00080cb2  cbz     r3, #0x80cc2
00080cb4  add.w   r0, r3, #8
00080cb8  ldr     r3, [r3, #8]
00080cba  ldr     r2, [r3, #0xc]
00080cbc  movs    r3, #7
00080cbe  str     r3, [sp, #0xac]
00080cc0  blx     r2
00080cc2  ldr.w   r3, [pc, #0x630]
00080cc6  ldr     r2, [sp, #0x60]
00080cc8  add     r3, pc ; -> 0x00379b44  m_pendingMayhemUser
00080cca  ldr     r4, [r3]
00080ccc  str     r2, [r3]
00080cce  str     r4, [sp, #0x5c]
00080cd0  cbz     r4, #0x80cea
00080cd2  add.w   r3, r4, #8
00080cd6  str     r3, [sp, #0x64]
00080cd8  ldr     r3, [r4, #8]
00080cda  ldr     r0, [sp, #0x64]
00080cdc  ldr     r2, [r3, #8]
00080cde  movs    r3, #7
00080ce0  str     r3, [sp, #0xac]
00080ce2  blx     r2
00080ce4  cmp     r0, #0
00080ce6  bne.w   #0x80fb4
00080cea  ldr     r4, [sp, #0x58]
00080cec  ldr     r4, [r4]
00080cee  str     r4, [sp, #0x70]
00080cf0  cbz     r4, #0x80d0e
00080cf2  ldr     r2, [sp, #0x70]
00080cf4  ldr     r4, [sp, #0x70]
00080cf6  adds    r4, #8
00080cf8  str     r4, [sp, #0x74]
00080cfa  ldr     r3, [r2, #8]
00080cfc  mov     r0, r4
00080cfe  ldr     r2, [r3, #8]
00080d00  mov.w   r3, #-1
00080d04  str     r3, [sp, #0xac]
00080d06  blx     r2
00080d08  cmp     r0, #0
00080d0a  bne.w   #0x80fa8
00080d0e  ldr.w   r3, [pc, #0x5e8]
00080d12  movs    r2, #1
00080d14  add     r3, pc ; -> 0x0017589c  mhState
00080d16  str     r2, [r3]
00080d18  add     r0, sp, #0xa8
00080d1a  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00080d1e  sub.w   sp, r7, #0x58
00080d22  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
00080d26  sub.w   sp, r7, #0x18
00080d2a  pop.w   {r8, sl, fp}
00080d2e  pop     {r4, r5, r6, r7, pc}
00080d30  ldr.w   r0, [pc, #0x5c8]
00080d34  add     r4, sp, #0xdc
00080d36  str     r4, [sp, #0x94]
00080d38  add     r0, pc ; -> 0x00379b4c  m_mayhemToken
00080d3a  ldr     r0, [r0]
00080d3c  str     r0, [sp, #0xdc]
00080d3e  cbz     r0, #0x80d4c
00080d40  ldr     r3, [r0]
00080d42  ldr     r2, [r3, #0xc]
00080d44  mov.w   r3, #-1
00080d48  str     r3, [sp, #0xac]
00080d4a  blx     r2
00080d4c  ldr     r0, [sp, #0xdc]
00080d4e  cmp     r0, #0
00080d50  beq.w   #0x810a6
00080d54  movs    r2, #1
00080d56  str     r2, [sp, #0xac]
00080d58  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00080d5c  cmp     r0, #0
00080d5e  bne.w   #0x80eac
00080d62  ldr     r3, [sp, #0x94]
00080d64  ldr     r3, [r3]
00080d66  str     r3, [sp, #0x9c]
00080d68  cmp     r3, #0
00080d6a  beq     #0x80d18
00080d6c  ldr     r3, [r3]
00080d6e  ldr     r0, [sp, #0x9c]
00080d70  ldr     r2, [r3, #8]
00080d72  mov.w   r3, #-1
00080d76  str     r3, [sp, #0xac]
00080d78  blx     r2
00080d7a  cmp     r0, #0
00080d7c  beq     #0x80d18
00080d7e  ldr     r4, [sp, #0x9c]
00080d80  ldr     r3, [r4]
00080d82  mov     r0, r4
00080d84  ldr     r3, [r3, #4]
00080d86  blx     r3
00080d88  b       #0x80d18
00080d8a  ldr.w   r0, [pc, #0x574]
00080d8e  mov.w   r2, #-1
00080d92  str     r2, [sp, #0xac]
00080d94  add     r0, pc ; -> 0x0017e364  kGraphBaseURL+0x234
00080d96  blx     #0xdd3e0 ; -> NSLog
00080d9a  ldr.w   r0, [pc, #0x568]
00080d9e  add     r0, pc ; -> 0x00379b44  m_pendingMayhemUser
00080da0  ldr     r0, [r0]
00080da2  cmp     r0, #0
00080da4  beq.w   #0x81092
00080da8  adds    r0, #8
00080daa  mov.w   r3, #-1
00080dae  str     r3, [sp, #0xac]
00080db0  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00080db4  cmp     r0, #0
00080db6  beq     #0x80d18
00080db8  ldr.w   r0, [pc, #0x54c]
00080dbc  add     r0, pc ; -> 0x00379b44  m_pendingMayhemUser
00080dbe  ldr     r0, [r0]
00080dc0  cmp     r0, #0
00080dc2  beq.w   #0x810c8
00080dc6  ldr     r3, [r0]
00080dc8  mov.w   r4, #-1
00080dcc  ldr     r3, [r3, #0x10]
00080dce  str     r4, [sp, #0xac]
00080dd0  blx     r3
00080dd2  cmp     r0, #0
00080dd4  bne.w   #0x80efa
00080dd8  ldr.w   r2, [pc, #0x530]
00080ddc  add     r2, pc ; -> 0x0017589c  mhState
00080dde  ldr     r3, [r2]
00080de0  cmp     r3, #4
00080de2  beq     #0x80d18
00080de4  ldr     r3, [sp, #8]
00080de6  cmp     r3, #0
00080de8  beq.w   #0x80eee
00080dec  movs    r3, #4
00080dee  str     r3, [r2]
00080df0  b       #0x80d18
00080df2  ldr.w   r0, [pc, #0x51c]
00080df6  add     r0, pc ; -> 0x0017e6a4  
00080df8  blx     #0xdd3e0 ; -> NSLog
00080dfc  movs    r0, #0x68
00080dfe  blx     #0xdd5c0 ; -> Znwm
00080e02  ldr.w   r3, [pc, #0x510]
00080e06  add     r3, pc ; -> 0x00175898  conn
00080e08  ldr     r3, [r3]
00080e0a  str     r0, [sp, #0xc]
00080e0c  str     r0, [sp, #0x10]
00080e0e  add.w   r1, r3, #4
00080e12  ldm     r1, {r1, r2}
00080e14  movs    r3, #0xa
00080e16  str     r3, [sp, #0xac]
00080e18  subs    r3, #9
00080e1a  bl      #0x8e39c ; -> ZN6Mayhem14GetUserRequestC1Exb
00080e1e  ldr     r4, [sp, #0xc]
00080e20  ldr     r2, [sp, #0x10]
00080e22  add     r3, sp, #0xf0
00080e24  str     r3, [sp, #0x38]
00080e26  str     r4, [sp, #0xf0]
00080e28  cbz     r2, #0x80e3c
00080e2a  adds.w  r0, r4, #8
00080e2e  beq     #0x80e3c
00080e30  ldr     r3, [r4, #8]
00080e32  ldr     r2, [r3, #0xc]
00080e34  mov.w   r3, #-1
00080e38  str     r3, [sp, #0xac]
00080e3a  blx     r2
00080e3c  ldr     r3, [sp, #0xf0]
00080e3e  str     r3, [sp, #0x40]
00080e40  cbz     r3, #0x80e50
00080e42  add.w   r0, r3, #8
00080e46  ldr     r3, [r3, #8]
00080e48  ldr     r2, [r3, #0xc]
00080e4a  movs    r3, #9
00080e4c  str     r3, [sp, #0xac]
00080e4e  blx     r2
00080e50  ldr.w   r3, [pc, #0x4c4]
00080e54  ldr     r2, [sp, #0x40]
00080e56  add     r3, pc ; -> 0x00379b44  m_pendingMayhemUser
00080e58  ldr     r4, [r3]
00080e5a  str     r2, [r3]
00080e5c  str     r4, [sp, #0x3c]
00080e5e  cbz     r4, #0x80e78
00080e60  add.w   r3, r4, #8
00080e64  str     r3, [sp, #0x44]
00080e66  ldr     r3, [r4, #8]
00080e68  ldr     r0, [sp, #0x44]
00080e6a  ldr     r2, [r3, #8]
00080e6c  movs    r3, #9
00080e6e  str     r3, [sp, #0xac]
00080e70  blx     r2
00080e72  cmp     r0, #0
00080e74  bne.w   #0x80f9e
00080e78  ldr     r4, [sp, #0x38]
00080e7a  ldr     r4, [r4]
00080e7c  str     r4, [sp, #0x50]
00080e7e  cmp     r4, #0
00080e80  beq.w   #0x80d0e
00080e84  ldr     r2, [sp, #0x50]
00080e86  ldr     r4, [sp, #0x50]
00080e88  adds    r4, #8
00080e8a  str     r4, [sp, #0x54]
00080e8c  ldr     r3, [r2, #8]
00080e8e  mov     r0, r4
00080e90  ldr     r2, [r3, #8]
00080e92  mov.w   r3, #-1
00080e96  str     r3, [sp, #0xac]
00080e98  blx     r2
00080e9a  cmp     r0, #0
00080e9c  beq.w   #0x80d0e
00080ea0  ldr     r4, [sp, #0x50]
00080ea2  ldr     r0, [sp, #0x54]
00080ea4  ldr     r3, [r4, #8]
00080ea6  ldr     r3, [r3, #4]
00080ea8  blx     r3
00080eaa  b       #0x80d0e
00080eac  ldr     r0, [sp, #0xdc]
00080eae  cmp     r0, #0
00080eb0  beq.w   #0x810dc
00080eb4  movs    r3, #1
00080eb6  str     r3, [sp, #0xac]
00080eb8  bl      #0x8b824 ; -> ZNK6Mayhem5Token7IsValidEv
00080ebc  cbz     r0, #0x80ed4
00080ebe  ldr.w   r0, [pc, #0x45c]
00080ec2  add     r0, pc ; -> 0x0017e6d4  
00080ec4  blx     #0xdd3e0 ; -> NSLog
00080ec8  ldr.w   r3, [pc, #0x454]
00080ecc  movs    r2, #3
00080ece  add     r3, pc ; -> 0x0017589c  mhState
00080ed0  str     r2, [r3]
00080ed2  b       #0x80d62
00080ed4  ldr.w   r0, [pc, #0x44c]
00080ed8  movs    r4, #1
00080eda  str     r4, [sp, #0xac]
00080edc  add     r0, pc ; -> 0x0017e6e4  
00080ede  blx     #0xdd3e0 ; -> NSLog
00080ee2  ldr.w   r3, [pc, #0x444]
00080ee6  movs    r2, #5
00080ee8  add     r3, pc ; -> 0x0017589c  mhState
00080eea  str     r2, [r3]
00080eec  b       #0x80d62
00080eee  ldr.w   r3, [pc, #0x43c]
00080ef2  movs    r2, #3
00080ef4  add     r3, pc ; -> 0x0017589c  mhState
00080ef6  str     r2, [r3]
00080ef8  b       #0x80d18
00080efa  ldr.w   r0, [pc, #0x434]
00080efe  add     r0, pc ; -> 0x0017e6c4  
00080f00  blx     #0xdd3e0 ; -> NSLog
00080f04  ldr.w   r0, [pc, #0x42c]
00080f08  add     r0, pc ; -> 0x00379b44  m_pendingMayhemUser
00080f0a  ldr     r0, [r0]
00080f0c  cmp     r0, #0
00080f0e  beq.w   #0x810f0
00080f12  ldr     r3, [r0]
00080f14  mov.w   r2, #-1
00080f18  ldr     r3, [r3, #8]
00080f1a  str     r2, [sp, #0xac]
00080f1c  blx     r3
00080f1e  ldr.w   r3, [pc, #0x418]
00080f22  add     r3, pc ; -> 0x00379b40  m_mayhemID
00080f24  str     r3, [sp]
00080f26  mov     r1, r0
00080f28  mov     r0, r3
00080f2a  blx     #0xdd518 ; -> ZNSs6assignERKSs
00080f2e  ldr.w   r0, [pc, #0x40c]
00080f32  add     r0, pc ; -> 0x00379b4c  m_mayhemToken
00080f34  ldr     r0, [r0]
00080f36  cmp     r0, #0
00080f38  beq     #0x80fd6
00080f3a  str     r0, [sp, #0xe0]
00080f3c  add     r2, sp, #0xe0
00080f3e  str     r2, [sp, #0x88]
00080f40  ldr     r3, [r0]
00080f42  mov.w   r4, #-1
00080f46  ldr     r3, [r3, #0xc]
00080f48  str     r4, [sp, #0xac]
00080f4a  blx     r3
00080f4c  ldr     r0, [sp, #0xe0]
00080f4e  cmp     r0, #0
00080f50  beq.w   #0x81104
00080f54  movs    r2, #2
00080f56  str     r2, [sp, #0xac]
00080f58  bl      #0x8b824 ; -> ZNK6Mayhem5Token7IsValidEv
00080f5c  cmp     r0, #0
00080f5e  beq     #0x80fbe
00080f60  ldr     r0, [pc, #0x3dc]
00080f62  add     r0, pc ; -> 0x0017e6d4  
00080f64  blx     #0xdd3e0 ; -> NSLog
00080f68  ldr.w   r3, [pc, #0x3d8]
00080f6c  movs    r2, #3
00080f6e  add     r3, pc ; -> 0x0017589c  mhState
00080f70  str     r2, [r3]
00080f72  ldr     r3, [sp, #0x88]
00080f74  ldr     r3, [r3]
00080f76  str     r3, [sp, #0x90]
00080f78  cmp     r3, #0
00080f7a  beq.w   #0x80d18
00080f7e  ldr     r3, [r3]
00080f80  ldr     r0, [sp, #0x90]
00080f82  ldr     r2, [r3, #8]
00080f84  mov.w   r3, #-1
00080f88  str     r3, [sp, #0xac]
00080f8a  blx     r2
00080f8c  cmp     r0, #0
00080f8e  beq.w   #0x80d18
00080f92  ldr     r4, [sp, #0x90]
00080f94  ldr     r3, [r4]
00080f96  mov     r0, r4
00080f98  ldr     r3, [r3, #4]
00080f9a  blx     r3
00080f9c  b       #0x80d18
00080f9e  ldr     r3, [r4, #8]
00080fa0  ldr     r0, [sp, #0x44]
00080fa2  ldr     r3, [r3, #4]
00080fa4  blx     r3
00080fa6  b       #0x80e78
00080fa8  ldr     r4, [sp, #0x70]
00080faa  ldr     r0, [sp, #0x74]
00080fac  ldr     r3, [r4, #8]
00080fae  ldr     r3, [r3, #4]
00080fb0  blx     r3
00080fb2  b       #0x80d0e
00080fb4  ldr     r3, [r4, #8]
00080fb6  ldr     r0, [sp, #0x64]
00080fb8  ldr     r3, [r3, #4]
00080fba  blx     r3
00080fbc  b       #0x80cea
00080fbe  ldr.w   r0, [pc, #0x388]
00080fc2  movs    r3, #2
00080fc4  str     r3, [sp, #0xac]
00080fc6  add     r0, pc ; -> 0x0017e6e4  
00080fc8  blx     #0xdd3e0 ; -> NSLog
00080fcc  ldr     r3, [pc, #0x37c]
00080fce  movs    r2, #5
00080fd0  add     r3, pc ; -> 0x0017589c  mhState
00080fd2  str     r2, [r3]
00080fd4  b       #0x80f72
00080fd6  ldr     r1, [pc, #0x378]
00080fd8  movs    r3, #6
00080fda  add     r0, sp, #0xe8
00080fdc  add     r1, pc ; -> 0x00175870  spotlight_Anim+0x268
00080fde  str     r3, [sp, #0xac]
00080fe0  add.w   r2, sp, #0xf7
00080fe4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00080fe8  movs    r3, #5
00080fea  movs    r0, #0x64
00080fec  str     r3, [sp, #0xac]
00080fee  blx     #0xdd5c0 ; -> Znwm
00080ff2  movs    r3, #4
00080ff4  str     r0, [sp, #0x7c]
00080ff6  str     r0, [sp, #0x1c]
00080ff8  str     r3, [sp, #0xac]
00080ffa  ldr     r1, [sp]
00080ffc  add     r2, sp, #0xe8
00080ffe  bl      #0x8d2c4 ; -> ZN6Mayhem5TokenC1ERKSsS2_
00081002  ldr     r2, [sp, #0x7c]
00081004  ldr     r3, [sp, #0x1c]
00081006  add     r4, sp, #0xe4
00081008  str     r4, [sp, #0x78]
0008100a  str     r2, [sp, #0xe4]
0008100c  cbz     r3, #0x8101a
0008100e  ldr     r3, [r2]
00081010  ldr     r0, [sp, #0x7c]
00081012  ldr     r2, [r3, #0xc]
00081014  movs    r3, #5
00081016  str     r3, [sp, #0xac]
00081018  blx     r2
0008101a  ldr     r4, [sp, #0xe4]
0008101c  str     r4, [sp, #0xa0]
0008101e  cbz     r4, #0x8102c
00081020  ldr     r3, [r4]
00081022  mov     r0, r4
00081024  ldr     r2, [r3, #0xc]
00081026  movs    r3, #3
00081028  str     r3, [sp, #0xac]
0008102a  blx     r2
0008102c  ldr     r3, [pc, #0x324]
0008102e  ldr     r2, [sp, #0xa0]
00081030  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
00081032  ldr.w   lr, [r3]
00081036  str     r2, [r3]
00081038  str.w   lr, [sp, #0xa4]
0008103c  mov     r3, lr
0008103e  cbz     r3, #0x81054
00081040  ldr.w   r3, [lr]
00081044  mov     r4, lr
00081046  mov     r0, lr
00081048  ldr     r2, [r3, #8]
0008104a  movs    r3, #3
0008104c  str     r3, [sp, #0xac]
0008104e  blx     r2
00081050  cmp     r0, #0
00081052  bne     #0x810be
00081054  ldr     r2, [sp, #0x78]
00081056  ldr     r2, [r2]
00081058  str     r2, [sp, #0x84]
0008105a  cbz     r2, #0x8106c
0008105c  ldr     r4, [sp, #0x84]
0008105e  ldr     r3, [r4]
00081060  mov     r0, r4
00081062  ldr     r2, [r3, #8]
00081064  movs    r3, #5
00081066  str     r3, [sp, #0xac]
00081068  blx     r2
0008106a  cbnz    r0, #0x81088
0008106c  ldr     r3, [pc, #0x2e8]
0008106e  ldr     r2, [sp, #0xe8]
00081070  add     r3, pc ; -> 0x000f3370  0x0
00081072  sub.w   r0, r2, #0xc
00081076  ldr     r3, [r3]
00081078  cmp     r0, r3
0008107a  bne     #0x8111c
0008107c  ldr.w   r3, [pc, #0x2dc]
00081080  movs    r2, #2
00081082  add     r3, pc ; -> 0x0017589c  mhState
00081084  str     r2, [r3]
00081086  b       #0x80d18
00081088  ldr     r3, [r4]
0008108a  ldr     r0, [sp, #0x84]
0008108c  ldr     r3, [r3, #4]
0008108e  blx     r3
00081090  b       #0x8106c
00081092  ldr     r0, [pc, #0x2cc]
00081094  ldr     r1, [pc, #0x2cc]
00081096  ldr     r3, [pc, #0x2d0]
00081098  add     r0, pc ; -> 0x000e23bc  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem11UserRequestEEptEvE8__func__
0008109a  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
0008109c  add     r3, pc ; -> 0x00175710  'm_obj'
0008109e  movw    r2, #0x109
000810a2  blx     #0xdd5cc ; -> assert_rtn
000810a6  ldr     r0, [pc, #0x2c4]
000810a8  ldr     r1, [pc, #0x2c4]
000810aa  ldr     r3, [pc, #0x2c8]
000810ac  movs    r2, #1
000810ae  add     r0, pc ; -> 0x000e23d4  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
000810b0  str     r2, [sp, #0xac]
000810b2  add     r1, pc ; -> 0x00175718  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000810b4  add     r3, pc ; -> 0x0017578c  'm_obj'
000810b6  add.w   r2, r2, #0x10e
000810ba  blx     #0xdd5cc ; -> assert_rtn
000810be  ldr     r3, [r4]
000810c0  ldr     r0, [sp, #0xa4]
000810c2  ldr     r3, [r3, #4]
000810c4  blx     r3
000810c6  b       #0x81054
000810c8  ldr     r0, [pc, #0x2ac]
000810ca  ldr     r1, [pc, #0x2b0]
000810cc  ldr     r3, [pc, #0x2b0]
000810ce  add     r0, pc ; -> 0x000e23bc  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem11UserRequestEEptEvE8__func__
000810d0  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000810d2  add     r3, pc ; -> 0x00175710  'm_obj'
000810d4  movw    r2, #0x109
000810d8  blx     #0xdd5cc ; -> assert_rtn
000810dc  ldr     r0, [pc, #0x2a4]
000810de  ldr     r1, [pc, #0x2a8]
000810e0  ldr     r3, [pc, #0x2a8]
000810e2  add     r0, pc ; -> 0x000e23d4  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
000810e4  add     r1, pc ; -> 0x00175718  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000810e6  add     r3, pc ; -> 0x0017578c  'm_obj'
000810e8  movw    r2, #0x10f
000810ec  blx     #0xdd5cc ; -> assert_rtn
000810f0  ldr     r0, [pc, #0x29c]
000810f2  ldr     r1, [pc, #0x2a0]
000810f4  ldr     r3, [pc, #0x2a0]
000810f6  add     r0, pc ; -> 0x000e23bc  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem11UserRequestEEptEvE8__func__
000810f8  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000810fa  add     r3, pc ; -> 0x00175710  'm_obj'
000810fc  movw    r2, #0x109
00081100  blx     #0xdd5cc ; -> assert_rtn
00081104  ldr     r0, [pc, #0x294]
00081106  ldr     r1, [pc, #0x298]
00081108  ldr     r3, [pc, #0x298]
0008110a  movs    r2, #2
0008110c  add     r0, pc ; -> 0x000e23d4  ZZNK4midp27SafeReferenceCountedPointerIN6Mayhem5TokenEEptEvE8__func__
0008110e  str     r2, [sp, #0xac]
00081110  add     r1, pc ; -> 0x00175718  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081112  add     r3, pc ; -> 0x0017578c  'm_obj'
00081114  movw    r2, #0x10f
00081118  blx     #0xdd5cc ; -> assert_rtn
0008111c  ldr     r3, [r2, #-0x4]
00081120  subs    r1, r2, #4
00081122  b       #0x8112c
00081124  cmp     r4, ip
00081126  mov     r3, r4
00081128  beq.w   #0x812c0
0008112c  subs    r2, r3, #1
0008112e  dmb     ish
00081132  mov     ip, r3
00081134  ldrex   r4, [r1]
00081138  cmp     r4, r3
0008113a  bne     #0x81124
0008113c  strex   lr, r2, [r1]
00081140  cmp.w   lr, #0
00081144  bne     #0x81134
00081146  dmb     ish
0008114a  b       #0x81124
0008114c  ldr     r3, [sp, #0xac]
0008114e  ldr.w   lr, [sp, #0xb0]
00081152  cmp     r3, #1
00081154  str.w   lr, [sp, #4]
00081158  beq.w   #0x81298
0008115c  cmp     r3, #2
0008115e  beq     #0x81226
00081160  cmp     r3, #3
00081162  beq.w   #0x81266
00081166  cmp     r3, #4
00081168  beq     #0x8124c
0008116a  cmp     r3, #5
0008116c  beq     #0x811b8
0008116e  cmp     r3, #6
00081170  beq     #0x811f8
00081172  cmp     r3, #7
00081174  beq     #0x811f4
00081176  cmp     r3, #8
00081178  beq     #0x811c4
0008117a  cmp     r3, #9
0008117c  beq     #0x811b2
0008117e  ldr     r3, [sp, #0x94]
00081180  str.w   lr, [sp, #0x34]
00081184  ldr     r3, [r3]
00081186  str     r3, [sp, #0x98]
00081188  cbz     r3, #0x811a2
0008118a  ldr     r3, [r3]
0008118c  ldr     r0, [sp, #0x98]
0008118e  ldr     r2, [r3, #8]
00081190  movs    r3, #0
00081192  str     r3, [sp, #0xac]
00081194  blx     r2
00081196  cbz     r0, #0x811a2
00081198  ldr     r4, [sp, #0x98]
0008119a  ldr     r3, [r4]
0008119c  mov     r0, r4
0008119e  ldr     r3, [r3, #4]
000811a0  blx     r3
000811a2  ldr     r2, [sp, #0x34]
000811a4  mov     r0, r2
000811a6  mov.w   r3, #-1
000811aa  str     r2, [sp, #4]
000811ac  str     r3, [sp, #0xac]
000811ae  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000811b2  ldr     r0, [sp, #0xc]
000811b4  blx     #0xdd5a8 ; -> ZdlPv
000811b8  ldr     r0, [sp, #4]
000811ba  mov.w   r3, #-1
000811be  str     r3, [sp, #0xac]
000811c0  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000811c4  ldr     r2, [sp, #4]
000811c6  ldr     r3, [sp, #0x38]
000811c8  str     r2, [sp, #0x20]
000811ca  ldr     r3, [r3]
000811cc  str     r3, [sp, #0x48]
000811ce  cbz     r3, #0x811ee
000811d0  add.w   r4, r3, #8
000811d4  str     r4, [sp, #0x4c]
000811d6  ldr     r3, [r3, #8]
000811d8  mov     r0, r4
000811da  ldr     r2, [r3, #8]
000811dc  movs    r3, #0
000811de  str     r3, [sp, #0xac]
000811e0  blx     r2
000811e2  cbz     r0, #0x811ee
000811e4  ldr     r2, [sp, #0x48]
000811e6  ldr     r0, [sp, #0x4c]
000811e8  ldr     r3, [r2, #8]
000811ea  ldr     r3, [r3, #4]
000811ec  blx     r3
000811ee  ldr     r3, [sp, #0x20]
000811f0  str     r3, [sp, #4]
000811f2  b       #0x811b8
000811f4  ldr     r0, [sp, #0x14]
000811f6  b       #0x811b4
000811f8  ldr     r2, [sp, #4]
000811fa  ldr     r3, [sp, #0x58]
000811fc  str     r2, [sp, #0x24]
000811fe  ldr     r3, [r3]
00081200  str     r3, [sp, #0x68]
00081202  cbz     r3, #0x81222
00081204  add.w   r4, r3, #8
00081208  str     r4, [sp, #0x6c]
0008120a  ldr     r3, [r3, #8]
0008120c  mov     r0, r4
0008120e  ldr     r2, [r3, #8]
00081210  movs    r3, #0
00081212  str     r3, [sp, #0xac]
00081214  blx     r2
00081216  cbz     r0, #0x81222
00081218  ldr     r2, [sp, #0x68]
0008121a  ldr     r0, [sp, #0x6c]
0008121c  ldr     r3, [r2, #8]
0008121e  ldr     r3, [r3, #4]
00081220  blx     r3
00081222  ldr     r3, [sp, #0x24]
00081224  b       #0x811f0
00081226  ldr     r3, [sp, #4]
00081228  ldr     r4, [sp, #0x78]
0008122a  str     r3, [sp, #0x28]
0008122c  ldr     r4, [r4]
0008122e  str     r4, [sp, #0x80]
00081230  cbz     r4, #0x81248
00081232  ldr     r3, [r4]
00081234  mov     r0, r4
00081236  ldr     r2, [r3, #8]
00081238  movs    r3, #0
0008123a  str     r3, [sp, #0xac]
0008123c  blx     r2
0008123e  cbz     r0, #0x81248
00081240  ldr     r3, [r4]
00081242  ldr     r0, [sp, #0x80]
00081244  ldr     r3, [r3, #4]
00081246  blx     r3
00081248  ldr     r2, [sp, #0x28]
0008124a  str     r2, [sp, #4]
0008124c  ldr     r3, [pc, #0x158]
0008124e  ldr     r1, [sp, #0xe8]
00081250  ldr     r2, [sp, #4]
00081252  add     r3, pc ; -> 0x000f3370  0x0
00081254  sub.w   r0, r1, #0xc
00081258  ldr     r3, [r3]
0008125a  str     r2, [sp, #0x2c]
0008125c  cmp     r0, r3
0008125e  bne     #0x8126e
00081260  ldr     r2, [sp, #0x2c]
00081262  str     r2, [sp, #4]
00081264  b       #0x811b8
00081266  ldr     r0, [sp, #0x7c]
00081268  blx     #0xdd5a8 ; -> ZdlPv
0008126c  b       #0x8124c
0008126e  ldr     r3, [r1, #-0x4]
00081272  subs    r2, r1, #4
00081274  subs    r1, r3, #1
00081276  dmb     ish
0008127a  mov     ip, r3
0008127c  ldrex   r4, [r2]
00081280  cmp     r4, r3
00081282  beq     #0x812d0
00081284  cmp     r4, ip
00081286  mov     r3, r4
00081288  bne     #0x81274
0008128a  cmp     r4, #0
0008128c  bgt     #0x81260
0008128e  add.w   r1, sp, #0xf6
00081292  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00081296  b       #0x81260
00081298  ldr     r4, [sp, #4]
0008129a  ldr     r2, [sp, #0x88]
0008129c  str     r4, [sp, #0x30]
0008129e  ldr     r2, [r2]
000812a0  str     r2, [sp, #0x8c]
000812a2  cbz     r2, #0x812bc
000812a4  ldr     r3, [r2]
000812a6  ldr     r0, [sp, #0x8c]
000812a8  ldr     r2, [r3, #8]
000812aa  movs    r3, #0
000812ac  str     r3, [sp, #0xac]
000812ae  blx     r2
000812b0  cbz     r0, #0x812bc
000812b2  ldr     r4, [sp, #0x8c]
000812b4  ldr     r3, [r4]
000812b6  mov     r0, r4
000812b8  ldr     r3, [r3, #4]
000812ba  blx     r3
000812bc  ldr     r2, [sp, #0x30]
000812be  b       #0x811a4
000812c0  cmp     r4, #0
000812c2  bgt.w   #0x8107c
000812c6  add.w   r1, sp, #0xf5
000812ca  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000812ce  b       #0x8107c
000812d0  strex   lr, r1, [r2]
000812d4  cmp.w   lr, #0
000812d8  bne     #0x8127c
000812da  dmb     ish
000812de  b       #0x81284
000812e0  movs    r3, #0xf6
000812e2  movs    r7, r0
000812e4  bpl     #0x81308
000812e6  movs    r6, r0
000812e8  lsls    r6, r1, #0x14
000812ea  movs    r0, r0
000812ec  ldr     r4, [pc, #0x138]
000812ee  movs    r7, r1
000812f0  bge     #0x81368
000812f2  movs    r7, r1
000812f4  ldrh    r0, [r7, #0x32]
000812f6  movs    r7, r5
000812f8  ldr     r3, [pc, #0x210]
000812fa  movs    r7, r1
000812fc  ldrh    r0, [r2, #0x30]
000812fe  movs    r7, r5
00081300  bpl     #0x8129c
00081302  movs    r7, r1
00081304  ldrh    r2, [r4, #0x2c]
00081306  movs    r7, r5
00081308  ldrh    r4, [r0, #0x2c]
0008130a  movs    r7, r5
0008130c  ldr     r2, [pc, #0x2f0]
0008130e  movs    r7, r1
00081310  bhi     #0x81268
00081312  movs    r7, r1
00081314  ldr     r2, [pc, #0x238]
00081316  movs    r7, r1
00081318  ldrh    r2, [r5, #0x26]
0008131a  movs    r7, r5
0008131c  bhi     #0x8133c
0008131e  movs    r7, r1
00081320  ldr     r1, [pc, #0x328]
00081322  movs    r7, r1
00081324  bhi     #0x81330
00081326  movs    r7, r1
00081328  ldr     r1, [pc, #0x2c0]
0008132a  movs    r7, r1
0008132c  ldr     r1, [pc, #0x290]
0008132e  movs    r7, r1
00081330  bvc     #0x812b8
00081332  movs    r7, r1
00081334  ldrh    r0, [r7, #0x20]
00081336  movs    r7, r5
00081338  ldrh    r2, [r3, #0x20]
0008133a  movs    r7, r5
0008133c  ldrh    r6, [r2, #0x20]
0008133e  movs    r7, r5
00081340  bvc     #0x81420
00081342  movs    r7, r1
00081344  ldr     r1, [pc, #0xa8]
00081346  movs    r7, r1
00081348  bvc     #0x81380
0008134a  movs    r7, r1
0008134c  ldr     r0, [pc, #0x320]
0008134e  movs    r7, r1
00081350  ldr     r0, [pc, #0x240]
00081352  movs    r7, r1
00081354  ldrh    r0, [r3, #0x18]
00081356  movs    r7, r5
00081358  movs    r2, #0xfc
0008135a  movs    r7, r0
0008135c  ldr     r0, [pc, #0x58]
0008135e  movs    r7, r1
00081360  asrs    r0, r4, #0xc
00081362  movs    r6, r0
00081364  cmp     lr, pc
00081366  movs    r7, r1
00081368  mov     r0, lr
0008136a  movs    r7, r1
0008136c  asrs    r2, r4, #0xc
0008136e  movs    r6, r0
00081370  mov     r2, ip
00081372  movs    r7, r1
00081374  mov     ip, sl
00081376  movs    r7, r1
00081378  asrs    r2, r5, #0xb
0008137a  movs    r6, r0
0008137c  cmp     r8, sb
0008137e  movs    r7, r1
00081380  mov     r2, r7
00081382  movs    r7, r1
00081384  asrs    r6, r5, #0xb
00081386  movs    r6, r0
00081388  mov     r0, r6
0008138a  movs    r7, r1
0008138c  mov     sl, r4
0008138e  movs    r7, r1
00081390  asrs    r2, r0, #0xb
00081392  movs    r6, r0
00081394  cmp     r8, r4
00081396  movs    r7, r1
00081398  mov     r2, r2
0008139a  movs    r7, r1
0008139c  asrs    r4, r0, #0xb
0008139e  movs    r6, r0
000813a0  mov     r4, r0
000813a2  movs    r7, r1
000813a4  mov     r6, lr
000813a6  movs    r7, r1
000813a8  movs    r1, #0x1a
000813aa  movs    r7, r0
