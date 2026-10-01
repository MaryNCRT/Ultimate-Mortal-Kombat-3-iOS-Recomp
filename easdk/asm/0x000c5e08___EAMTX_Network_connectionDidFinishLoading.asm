========================================================================
-[EAMTX_Network connectionDidFinishLoading  0x000c5e08  1872 bytes   EAMTX_Network.mm
========================================================================

000c5e08  push    {r4, r5, r6, r7, lr}
000c5e0a  add     r7, sp, #0xc
000c5e0c  push.w  {r8, sl, fp}
000c5e10  sub     sp, #0x10
000c5e12  ldr.w   r4, [pc, #0x5a8]
000c5e16  mov     sl, r0
000c5e18  add     r4, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c5e1a  ldr     r3, [r4]
000c5e1c  ldr     r3, [r0, r3]
000c5e1e  cmp     r3, #0xb
000c5e20  bne.w   #0xc626e
000c5e24  ldr.w   r3, [pc, #0x598]
000c5e28  add     r3, pc ; -> 0x000f7da0  OBJC_IVAR_$_EAMTX_Network.m_ReturnContentType
000c5e2a  ldr     r0, [r3]
000c5e2c  ldr.w   r0, [sl, r0]
000c5e30  cmp     r0, #0
000c5e32  beq.w   #0xc626e
000c5e36  ldr.w   r1, [pc, #0x58c]
000c5e3a  ldr.w   r2, [pc, #0x58c]
000c5e3e  add     r1, pc ; -> 0x000fd16c  
000c5e40  add     r2, pc ; -> 0x00181094  
000c5e42  ldr     r1, [r1]
000c5e44  blx     #0xddbfc ; -> objc_msgSend
000c5e48  cmp     r0, #0
000c5e4a  beq.w   #0xc626e
000c5e4e  ldr.w   r3, [pc, #0x57c]
000c5e52  add     r3, pc ; -> 0x000f7d80  OBJC_IVAR_$_EAMTX_Network.resumingDownload
000c5e54  ldr     r3, [r3]
000c5e56  ldrb.w  r3, [sl, r3]
000c5e5a  cmp     r3, #0
000c5e5c  beq.w   #0xc6058
000c5e60  ldr.w   r0, [pc, #0x56c]
000c5e64  ldr.w   r1, [pc, #0x56c]
000c5e68  ldr.w   r5, [pc, #0x56c]
000c5e6c  add     r0, pc ; -> 0x000f3330  dCachedData
000c5e6e  add     r1, pc ; -> 0x000fd124  
000c5e70  ldr     r0, [r0]
000c5e72  add     r5, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c5e74  ldr.w   r8, [r1]
000c5e78  ldr.w   r1, [pc, #0x560]
000c5e7c  str     r0, [sp, #4]
000c5e7e  ldr     r3, [r5]
000c5e80  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
000c5e82  ldr.w   fp, [r0]
000c5e86  ldr     r1, [r1]
000c5e88  ldr.w   r0, [sl, r3]
000c5e8c  blx     #0xddbfc ; -> objc_msgSend
000c5e90  ldr.w   r1, [pc, #0x54c]
000c5e94  ldr     r3, [r5]
000c5e96  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c5e98  ldr     r1, [r1]
000c5e9a  mov     r6, r0
000c5e9c  ldr.w   r0, [sl, r3]
000c5ea0  blx     #0xddbfc ; -> objc_msgSend
000c5ea4  mov     r2, r6
000c5ea6  mov     r1, r8
000c5ea8  mov     r3, r0
000c5eaa  mov     r0, fp
000c5eac  blx     #0xddbfc ; -> objc_msgSend
000c5eb0  ldr.w   r0, [pc, #0x530]
000c5eb4  ldr.w   r1, [pc, #0x530]
000c5eb8  add     r0, pc ; -> 0x000fdbf4  
000c5eba  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c5ebc  ldr     r0, [r0]
000c5ebe  ldr     r1, [r1]
000c5ec0  blx     #0xddbfc ; -> objc_msgSend
000c5ec4  ldr.w   r1, [pc, #0x524]
000c5ec8  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c5eca  ldr     r1, [r1]
000c5ecc  blx     #0xddbfc ; -> objc_msgSend
000c5ed0  ldr.w   r1, [pc, #0x51c]
000c5ed4  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c5ed6  ldr     r1, [r1]
000c5ed8  blx     #0xddbfc ; -> objc_msgSend
000c5edc  ldr.w   r1, [pc, #0x514]
000c5ee0  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c5ee2  ldr     r5, [r1]
000c5ee4  ldr.w   r1, [pc, #0x510]
000c5ee8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c5eea  ldr.w   r8, [r1]
000c5eee  ldr.w   r1, [pc, #0x50c]
000c5ef2  add     r1, pc ; -> 0x0017e5c4  
000c5ef4  str     r1, [sp]
000c5ef6  ldr     r3, [r4]
000c5ef8  mov     r1, r8
000c5efa  ldr     r2, [sp]
000c5efc  ldr.w   r3, [sl, r3]
000c5f00  mov     r6, r0
000c5f02  ldr.w   r0, [pc, #0x4fc]
000c5f06  add     r0, pc ; -> 0x000fdb5c  
000c5f08  ldr.w   fp, [r0]
000c5f0c  mov     r0, fp
000c5f0e  blx     #0xddbfc ; -> objc_msgSend
000c5f12  ldr.w   r3, [pc, #0x4f0]
000c5f16  mov     r1, r5
000c5f18  add     r3, pc ; -> 0x00180604  
000c5f1a  mov     r2, r0
000c5f1c  mov     r0, r6
000c5f1e  blx     #0xddbfc ; -> objc_msgSend
000c5f22  ldr.w   r3, [pc, #0x4e4]
000c5f26  mov     r1, r8
000c5f28  ldr     r2, [sp]
000c5f2a  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c5f2c  mov     r0, fp
000c5f2e  ldr     r3, [r3]
000c5f30  ldr.w   r3, [sl, r3]
000c5f34  blx     #0xddbfc ; -> objc_msgSend
000c5f38  ldr.w   r3, [pc, #0x4d0]
000c5f3c  mov     r1, r5
000c5f3e  add     r3, pc ; -> 0x00180614  
000c5f40  mov     r2, r0
000c5f42  mov     r0, r6
000c5f44  blx     #0xddbfc ; -> objc_msgSend
000c5f48  ldr.w   r3, [pc, #0x4c4]
000c5f4c  mov     r1, r8
000c5f4e  ldr     r2, [sp]
000c5f50  add     r3, pc ; -> 0x000f7d94  OBJC_IVAR_$_EAMTX_Network.moduleId
000c5f52  mov     r0, fp
000c5f54  ldr     r3, [r3]
000c5f56  ldr.w   r3, [sl, r3]
000c5f5a  blx     #0xddbfc ; -> objc_msgSend
000c5f5e  ldr.w   r3, [pc, #0x4b4]
000c5f62  mov     r1, r5
000c5f64  add     r3, pc ; -> 0x00180634  
000c5f66  mov     r2, r0
000c5f68  mov     r0, r6
000c5f6a  blx     #0xddbfc ; -> objc_msgSend
000c5f6e  ldr.w   r3, [pc, #0x4a8]
000c5f72  mov     r1, r8
000c5f74  ldr     r2, [sp]
000c5f76  add     r3, pc ; -> 0x000f7d98  OBJC_IVAR_$_EAMTX_Network.moduleState
000c5f78  mov     r0, fp
000c5f7a  ldr     r3, [r3]
000c5f7c  ldr.w   r3, [sl, r3]
000c5f80  blx     #0xddbfc ; -> objc_msgSend
000c5f84  ldr.w   r3, [pc, #0x494]
000c5f88  mov     r1, r5
000c5f8a  add     r3, pc ; -> 0x00180644  
000c5f8c  mov     r2, r0
000c5f8e  mov     r0, r6
000c5f90  blx     #0xddbfc ; -> objc_msgSend
000c5f94  ldr     r1, [sp, #4]
000c5f96  ldr.w   r3, [pc, #0x488]
000c5f9a  mov     r0, r6
000c5f9c  ldr     r2, [r1]
000c5f9e  add     r3, pc ; -> 0x00180624  
000c5fa0  mov     r1, r5
000c5fa2  blx     #0xddbfc ; -> objc_msgSend
000c5fa6  ldr.w   r3, [pc, #0x47c]
000c5faa  mov     r1, r8
000c5fac  ldr     r2, [sp]
000c5fae  add     r3, pc ; -> 0x000f7d90  OBJC_IVAR_$_EAMTX_Network.itemSellId
000c5fb0  mov     r0, fp
000c5fb2  ldr     r3, [r3]
000c5fb4  ldr.w   r3, [sl, r3]
000c5fb8  blx     #0xddbfc ; -> objc_msgSend
000c5fbc  ldr.w   r3, [pc, #0x468]
000c5fc0  mov     r1, r5
000c5fc2  add     r3, pc ; -> 0x00180434  
000c5fc4  mov     r2, r0
000c5fc6  mov     r0, r6
000c5fc8  blx     #0xddbfc ; -> objc_msgSend
000c5fcc  mov     r1, r8
000c5fce  ldr     r2, [sp]
000c5fd0  movs    r3, #1
000c5fd2  mov     r0, fp
000c5fd4  blx     #0xddbfc ; -> objc_msgSend
000c5fd8  ldr.w   r3, [pc, #0x450]
000c5fdc  mov     r1, r5
000c5fde  add     r3, pc ; -> 0x00181044  
000c5fe0  mov     r2, r0
000c5fe2  mov     r0, r6
000c5fe4  blx     #0xddbfc ; -> objc_msgSend
000c5fe8  ldr.w   r3, [pc, #0x444]
000c5fec  add     r3, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c5fee  ldr     r2, [r3]
000c5ff0  ldr.w   r2, [sl, r2]
000c5ff4  cbz     r2, #0xc6004
000c5ff6  ldr.w   r3, [pc, #0x43c]
000c5ffa  mov     r0, r6
000c5ffc  mov     r1, r5
000c5ffe  add     r3, pc ; -> 0x00180484  
000c6000  blx     #0xddbfc ; -> objc_msgSend
000c6004  ldr.w   r0, [pc, #0x430]
000c6008  ldr.w   r1, [pc, #0x430]
000c600c  add     r0, pc ; -> 0x000f3270  mtxController
000c600e  add     r1, pc ; -> 0x000fd4bc  
000c6010  ldr     r0, [r0]
000c6012  ldr     r1, [r1]
000c6014  ldr     r0, [r0]
000c6016  blx     #0xddbfc ; -> objc_msgSend
000c601a  ldr.w   r1, [pc, #0x424]
000c601e  mov     r2, r6
000c6020  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c6022  ldr     r1, [r1]
000c6024  blx     #0xddbfc ; -> objc_msgSend
000c6028  ldr     r3, [sp, #4]
000c602a  ldr     r0, [r3]
000c602c  cbz     r0, #0xc604c
000c602e  ldr.w   r1, [pc, #0x414]
000c6032  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c6034  ldr     r1, [r1]
000c6036  blx     #0xddbfc ; -> objc_msgSend
000c603a  cbz     r0, #0xc604c
000c603c  ldr     r1, [sp, #4]
000c603e  ldr     r0, [r1]
000c6040  ldr.w   r1, [pc, #0x404]
000c6044  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c6046  ldr     r1, [r1]
000c6048  blx     #0xddbfc ; -> objc_msgSend
000c604c  ldr     r3, [pc, #0x3fc]
000c604e  add     r3, pc ; -> 0x000f3330  dCachedData
000c6050  ldr     r2, [r3]
000c6052  movs    r3, #0
000c6054  str     r3, [r2]
000c6056  b       #0xc61a8
000c6058  ldr     r0, [pc, #0x3f4]
000c605a  ldr     r1, [pc, #0x3f8]
000c605c  ldr.w   fp, [pc, #0x3f8]
000c6060  add     r0, pc ; -> 0x000fdbf4  
000c6062  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c6064  ldr     r0, [r0]
000c6066  ldr     r1, [r1]
000c6068  blx     #0xddbfc ; -> objc_msgSend
000c606c  ldr     r1, [pc, #0x3ec]
000c606e  add     fp, pc ; -> 0x0017e5c4  
000c6070  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c6072  ldr     r1, [r1]
000c6074  blx     #0xddbfc ; -> objc_msgSend
000c6078  ldr     r1, [pc, #0x3e4]
000c607a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c607c  ldr     r1, [r1]
000c607e  blx     #0xddbfc ; -> objc_msgSend
000c6082  ldr     r1, [pc, #0x3e0]
000c6084  ldr     r3, [pc, #0x3e0]
000c6086  mov     r2, fp
000c6088  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c608a  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c608c  ldr     r4, [r1]
000c608e  ldr     r1, [pc, #0x3dc]
000c6090  ldr     r3, [r3]
000c6092  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c6094  ldr     r6, [r1]
000c6096  ldr.w   r3, [sl, r3]
000c609a  mov     r1, r6
000c609c  mov     r5, r0
000c609e  ldr     r0, [pc, #0x3d0]
000c60a0  add     r0, pc ; -> 0x000fdb5c  
000c60a2  ldr.w   r8, [r0]
000c60a6  mov     r0, r8
000c60a8  blx     #0xddbfc ; -> objc_msgSend
000c60ac  ldr     r3, [pc, #0x3c4]
000c60ae  mov     r1, r4
000c60b0  add     r3, pc ; -> 0x00180604  
000c60b2  mov     r2, r0
000c60b4  mov     r0, r5
000c60b6  blx     #0xddbfc ; -> objc_msgSend
000c60ba  ldr     r3, [pc, #0x3bc]
000c60bc  mov     r1, r6
000c60be  mov     r2, fp
000c60c0  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c60c2  mov     r0, r8
000c60c4  ldr     r3, [r3]
000c60c6  ldr.w   r3, [sl, r3]
000c60ca  blx     #0xddbfc ; -> objc_msgSend
000c60ce  ldr     r3, [pc, #0x3ac]
000c60d0  mov     r1, r4
000c60d2  add     r3, pc ; -> 0x00180614  
000c60d4  mov     r2, r0
000c60d6  mov     r0, r5
000c60d8  blx     #0xddbfc ; -> objc_msgSend
000c60dc  ldr     r3, [pc, #0x3a0]
000c60de  mov     r1, r6
000c60e0  mov     r2, fp
000c60e2  add     r3, pc ; -> 0x000f7d94  OBJC_IVAR_$_EAMTX_Network.moduleId
000c60e4  mov     r0, r8
000c60e6  ldr     r3, [r3]
000c60e8  ldr.w   r3, [sl, r3]
000c60ec  blx     #0xddbfc ; -> objc_msgSend
000c60f0  ldr     r3, [pc, #0x390]
000c60f2  mov     r1, r4
000c60f4  add     r3, pc ; -> 0x00180634  
000c60f6  mov     r2, r0
000c60f8  mov     r0, r5
000c60fa  blx     #0xddbfc ; -> objc_msgSend
000c60fe  ldr     r3, [pc, #0x388]
000c6100  mov     r1, r6
000c6102  mov     r2, fp
000c6104  add     r3, pc ; -> 0x000f7d98  OBJC_IVAR_$_EAMTX_Network.moduleState
000c6106  mov     r0, r8
000c6108  ldr     r3, [r3]
000c610a  ldr.w   r3, [sl, r3]
000c610e  blx     #0xddbfc ; -> objc_msgSend
000c6112  ldr     r3, [pc, #0x378]
000c6114  mov     r1, r4
000c6116  add     r3, pc ; -> 0x00180644  
000c6118  mov     r2, r0
000c611a  mov     r0, r5
000c611c  blx     #0xddbfc ; -> objc_msgSend
000c6120  ldr     r2, [pc, #0x36c]
000c6122  ldr     r3, [pc, #0x370]
000c6124  mov     r0, r5
000c6126  add     r2, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6128  add     r3, pc ; -> 0x00180624  
000c612a  ldr     r2, [r2]
000c612c  mov     r1, r4
000c612e  ldr.w   r2, [sl, r2]
000c6132  blx     #0xddbfc ; -> objc_msgSend
000c6136  ldr     r3, [pc, #0x360]
000c6138  mov     r1, r6
000c613a  mov     r2, fp
000c613c  add     r3, pc ; -> 0x000f7d90  OBJC_IVAR_$_EAMTX_Network.itemSellId
000c613e  mov     r0, r8
000c6140  ldr     r3, [r3]
000c6142  ldr.w   r3, [sl, r3]
000c6146  blx     #0xddbfc ; -> objc_msgSend
000c614a  ldr     r3, [pc, #0x350]
000c614c  mov     r1, r4
000c614e  add     r3, pc ; -> 0x00180434  
000c6150  mov     r2, r0
000c6152  mov     r0, r5
000c6154  blx     #0xddbfc ; -> objc_msgSend
000c6158  mov     r1, r6
000c615a  mov     r2, fp
000c615c  movs    r3, #1
000c615e  mov     r0, r8
000c6160  blx     #0xddbfc ; -> objc_msgSend
000c6164  ldr     r3, [pc, #0x338]
000c6166  mov     r1, r4
000c6168  add     r3, pc ; -> 0x00181044  
000c616a  mov     r2, r0
000c616c  mov     r0, r5
000c616e  blx     #0xddbfc ; -> objc_msgSend
000c6172  ldr     r3, [pc, #0x330]
000c6174  add     r3, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c6176  ldr     r2, [r3]
000c6178  ldr.w   r2, [sl, r2]
000c617c  cbz     r2, #0xc618a
000c617e  ldr     r3, [pc, #0x328]
000c6180  mov     r0, r5
000c6182  mov     r1, r4
000c6184  add     r3, pc ; -> 0x00180484  
000c6186  blx     #0xddbfc ; -> objc_msgSend
000c618a  ldr     r0, [pc, #0x320]
000c618c  ldr     r1, [pc, #0x320]
000c618e  add     r0, pc ; -> 0x000f3270  mtxController
000c6190  add     r1, pc ; -> 0x000fd4bc  
000c6192  ldr     r0, [r0]
000c6194  ldr     r1, [r1]
000c6196  ldr     r0, [r0]
000c6198  blx     #0xddbfc ; -> objc_msgSend
000c619c  ldr     r1, [pc, #0x314]
000c619e  mov     r2, r5
000c61a0  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c61a2  ldr     r1, [r1]
000c61a4  blx     #0xddbfc ; -> objc_msgSend
000c61a8  ldr     r3, [pc, #0x30c]
000c61aa  movs    r2, #0
000c61ac  add     r3, pc ; -> 0x000f7d84  OBJC_IVAR_$_EAMTX_Network.noofAttempts
000c61ae  ldr     r3, [r3]
000c61b0  str.w   r2, [sl, r3]
000c61b4  b       #0xc61fe
000c61b6  ldr     r3, [pc, #0x304]
000c61b8  mov     r0, r5
000c61ba  mov     r1, r4
000c61bc  add     r3, pc ; -> 0x00180484  
000c61be  blx     #0xddbfc ; -> objc_msgSend
000c61c2  ldr     r0, [pc, #0x2fc]
000c61c4  ldr     r1, [pc, #0x2fc]
000c61c6  add     r0, pc ; -> 0x000f3270  mtxController
000c61c8  add     r1, pc ; -> 0x000fd4bc  
000c61ca  ldr     r0, [r0]
000c61cc  ldr     r1, [r1]
000c61ce  ldr     r0, [r0]
000c61d0  blx     #0xddbfc ; -> objc_msgSend
000c61d4  ldr     r1, [pc, #0x2f0]
000c61d6  mov     r2, r5
000c61d8  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c61da  ldr     r1, [r1]
000c61dc  blx     #0xddbfc ; -> objc_msgSend
000c61e0  ldr     r3, [sp, #8]
000c61e2  cbz     r3, #0xc61fe
000c61e4  ldr     r1, [pc, #0x2e4]
000c61e6  mov     r0, r3
000c61e8  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c61ea  ldr     r1, [r1]
000c61ec  blx     #0xddbfc ; -> objc_msgSend
000c61f0  cbz     r0, #0xc61fe
000c61f2  ldr     r1, [pc, #0x2dc]
000c61f4  ldr     r0, [sp, #8]
000c61f6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c61f8  ldr     r1, [r1]
000c61fa  blx     #0xddbfc ; -> objc_msgSend
000c61fe  ldr     r4, [pc, #0x2d4]
000c6200  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c6202  ldr     r0, [r4]
000c6204  ldr.w   r0, [sl, r0]
000c6208  cbz     r0, #0xc6226
000c620a  ldr     r1, [pc, #0x2cc]
000c620c  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c620e  ldr     r1, [r1]
000c6210  blx     #0xddbfc ; -> objc_msgSend
000c6214  cbz     r0, #0xc6226
000c6216  ldr     r1, [pc, #0x2c4]
000c6218  ldr     r3, [r4]
000c621a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c621c  ldr.w   r0, [sl, r3]
000c6220  ldr     r1, [r1]
000c6222  blx     #0xddbfc ; -> objc_msgSend
000c6226  ldr     r4, [pc, #0x2b8]
000c6228  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c622a  ldr     r0, [r4]
000c622c  ldr.w   r0, [sl, r0]
000c6230  cbz     r0, #0xc624e
000c6232  ldr     r1, [pc, #0x2b0]
000c6234  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c6236  ldr     r1, [r1]
000c6238  blx     #0xddbfc ; -> objc_msgSend
000c623c  cbz     r0, #0xc624e
000c623e  ldr     r1, [pc, #0x2a8]
000c6240  ldr     r3, [r4]
000c6242  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c6244  ldr.w   r0, [sl, r3]
000c6248  ldr     r1, [r1]
000c624a  blx     #0xddbfc ; -> objc_msgSend
000c624e  ldr     r3, [pc, #0x29c]
000c6250  movs    r2, #0
000c6252  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c6254  ldr     r3, [r3]
000c6256  str.w   r2, [sl, r3]
000c625a  ldr     r3, [pc, #0x294]
000c625c  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c625e  ldr     r3, [r3]
000c6260  str.w   r2, [sl, r3]
000c6264  sub.w   sp, r7, #0x18
000c6268  pop.w   {r8, sl, fp}
000c626c  pop     {r4, r5, r6, r7, pc}
000c626e  ldr     r0, [pc, #0x284]
000c6270  ldr     r1, [pc, #0x284]
000c6272  ldr.w   r8, [pc, #0x288]
000c6276  add     r0, pc ; -> 0x000fdb5c  
000c6278  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c627a  ldr.w   fp, [r0]
000c627e  ldr     r5, [r1]
000c6280  add     r8, pc ; -> 0x0017e5c4  
000c6282  mov     r0, fp
000c6284  mov     r1, r5
000c6286  blx     #0xddbfc ; -> objc_msgSend
000c628a  ldr     r3, [pc, #0x274]
000c628c  ldr     r1, [pc, #0x274]
000c628e  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6290  add     r1, pc ; -> 0x000fcfb4  '_U\x0e'
000c6292  ldr     r3, [r3]
000c6294  ldr     r1, [r1]
000c6296  ldr.w   r2, [sl, r3]
000c629a  movs    r3, #4
000c629c  blx     #0xddbfc ; -> objc_msgSend
000c62a0  ldr     r1, [pc, #0x264]
000c62a2  add     r1, pc ; -> 0x000fd7b4  
000c62a4  ldr     r4, [r1]
000c62a6  ldr     r1, [pc, #0x264]
000c62a8  add     r1, pc ; -> 0x000fcf28  
000c62aa  ldr     r1, [r1]
000c62ac  str     r0, [sp, #8]
000c62ae  ldr     r0, [pc, #0x260]
000c62b0  add     r0, pc ; -> 0x000fdc10  
000c62b2  ldr     r0, [r0]
000c62b4  blx     #0xddbfc ; -> objc_msgSend
000c62b8  mov     r1, r4
000c62ba  mov     r2, r0
000c62bc  ldr     r0, [sp, #8]
000c62be  blx     #0xddbfc ; -> objc_msgSend
000c62c2  mov     r1, r5
000c62c4  str     r0, [sp, #0xc]
000c62c6  ldr     r0, [pc, #0x24c]
000c62c8  add     r0, pc ; -> 0x000fdbf4  
000c62ca  ldr     r0, [r0]
000c62cc  blx     #0xddbfc ; -> objc_msgSend
000c62d0  ldr     r1, [pc, #0x244]
000c62d2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c62d4  ldr     r1, [r1]
000c62d6  blx     #0xddbfc ; -> objc_msgSend
000c62da  ldr     r1, [pc, #0x240]
000c62dc  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c62de  ldr     r1, [r1]
000c62e0  blx     #0xddbfc ; -> objc_msgSend
000c62e4  ldr     r1, [pc, #0x238]
000c62e6  ldr     r3, [pc, #0x23c]
000c62e8  mov     r2, r8
000c62ea  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c62ec  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c62ee  ldr     r4, [r1]
000c62f0  ldr     r1, [pc, #0x234]
000c62f2  ldr     r3, [r3]
000c62f4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c62f6  ldr     r6, [r1]
000c62f8  ldr.w   r3, [sl, r3]
000c62fc  mov     r1, r6
000c62fe  mov     r5, r0
000c6300  mov     r0, fp
000c6302  blx     #0xddbfc ; -> objc_msgSend
000c6306  ldr     r3, [pc, #0x224]
000c6308  mov     r1, r4
000c630a  add     r3, pc ; -> 0x00180604  
000c630c  mov     r2, r0
000c630e  mov     r0, r5
000c6310  blx     #0xddbfc ; -> objc_msgSend
000c6314  ldr     r3, [pc, #0x218]
000c6316  mov     r1, r6
000c6318  mov     r2, r8
000c631a  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c631c  mov     r0, fp
000c631e  ldr     r3, [r3]
000c6320  ldr.w   r3, [sl, r3]
000c6324  blx     #0xddbfc ; -> objc_msgSend
000c6328  ldr     r3, [pc, #0x208]
000c632a  mov     r1, r4
000c632c  add     r3, pc ; -> 0x00180614  
000c632e  mov     r2, r0
000c6330  mov     r0, r5
000c6332  blx     #0xddbfc ; -> objc_msgSend
000c6336  ldr     r3, [pc, #0x200]
000c6338  mov     r1, r6
000c633a  mov     r2, r8
000c633c  add     r3, pc ; -> 0x000f7d94  OBJC_IVAR_$_EAMTX_Network.moduleId
000c633e  mov     r0, fp
000c6340  ldr     r3, [r3]
000c6342  ldr.w   r3, [sl, r3]
000c6346  blx     #0xddbfc ; -> objc_msgSend
000c634a  ldr     r3, [pc, #0x1f0]
000c634c  mov     r1, r4
000c634e  add     r3, pc ; -> 0x00180634  
000c6350  mov     r2, r0
000c6352  mov     r0, r5
000c6354  blx     #0xddbfc ; -> objc_msgSend
000c6358  ldr     r3, [pc, #0x1e4]
000c635a  mov     r1, r6
000c635c  mov     r2, r8
000c635e  add     r3, pc ; -> 0x000f7d98  OBJC_IVAR_$_EAMTX_Network.moduleState
000c6360  mov     r0, fp
000c6362  ldr     r3, [r3]
000c6364  ldr.w   r3, [sl, r3]
000c6368  blx     #0xddbfc ; -> objc_msgSend
000c636c  ldr     r3, [pc, #0x1d4]
000c636e  mov     r1, r4
000c6370  add     r3, pc ; -> 0x00180644  
000c6372  mov     r2, r0
000c6374  mov     r0, r5
000c6376  blx     #0xddbfc ; -> objc_msgSend
000c637a  ldr     r3, [pc, #0x1cc]
000c637c  mov     r1, r6
000c637e  mov     r2, r8
000c6380  add     r3, pc ; -> 0x000f7d90  OBJC_IVAR_$_EAMTX_Network.itemSellId
000c6382  mov     r0, fp
000c6384  ldr     r3, [r3]
000c6386  ldr.w   r3, [sl, r3]
000c638a  blx     #0xddbfc ; -> objc_msgSend
000c638e  ldr     r3, [pc, #0x1bc]
000c6390  mov     r1, r4
000c6392  add     r3, pc ; -> 0x00180434  
000c6394  mov     r2, r0
000c6396  mov     r0, r5
000c6398  blx     #0xddbfc ; -> objc_msgSend
000c639c  ldr     r3, [pc, #0x1b0]
000c639e  ldr     r2, [sp, #0xc]
000c63a0  mov     r0, r5
000c63a2  add     r3, pc ; -> 0x00180624  
000c63a4  mov     r1, r4
000c63a6  blx     #0xddbfc ; -> objc_msgSend
000c63aa  ldr     r3, [pc, #0x1a8]
000c63ac  add     r3, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c63ae  ldr     r2, [r3]
000c63b0  ldr.w   r2, [sl, r2]
000c63b4  cmp     r2, #0
000c63b6  bne.w   #0xc61b6
000c63ba  b       #0xc61c2
000c63bc  subs    r4, r5, #5
000c63be  movs    r3, r0
000c63c0  subs    r4, r6, #5
000c63c2  movs    r3, r0
000c63c4  strb    r2, [r5, #0xc]
000c63c6  movs    r3, r0
000c63c8  sxtb    r0, r2
000c63ca  movs    r3, r1
000c63cc  subs    r2, r5, #4
000c63ce  movs    r3, r0
000c63d0  bmi     #0xc6354
000c63d2  movs    r2, r0
000c63d4  strb    r2, [r6, #0xa]
000c63d6  movs    r3, r0
000c63d8  subs    r6, r4, #4
000c63da  movs    r3, r0
000c63dc  ldr     r4, [r1, #0x40]
000c63de  movs    r3, r0
000c63e0  ldr     r6, [r3, #0x3c]
000c63e2  movs    r3, r0
000c63e4  ldrb    r0, [r7, #0x14]
000c63e6  movs    r3, r0
000c63e8  ldr     r6, [r0, #0x2c]
000c63ea  movs    r3, r0
000c63ec  ldr     r4, [r6, #0x28]
000c63ee  movs    r3, r0
000c63f0  ldr     r0, [r0, #0x38]
000c63f2  movs    r3, r0
000c63f4  ldr     r4, [r6, #0x3c]
000c63f6  movs    r3, r0
000c63f8  ldr     r4, [r6, #0x38]
000c63fa  movs    r3, r0
000c63fc  strh    r6, [r1, #0x36]
000c63fe  movs    r3, r1
000c6400  ldrb    r2, [r2, #0x11]
000c6402  movs    r3, r0
000c6404  adr     r6, #0x3a0
000c6406  movs    r3, r1
000c6408  subs    r6, r3, #1
000c640a  movs    r3, r0
000c640c  adr     r6, #0x348
000c640e  movs    r3, r1
000c6410  subs    r0, r0, #1
000c6412  movs    r3, r0
000c6414  adr     r6, #0x330
000c6416  movs    r3, r1
000c6418  subs    r6, r3, #0
000c641a  movs    r3, r0
000c641c  adr     r6, #0x2d8
000c641e  movs    r3, r1
000c6420  adr     r6, #0x208
000c6422  movs    r3, r1
000c6424  adds    r6, r3, #7
000c6426  movs    r3, r0
000c6428  adr     r4, #0x1b8
000c642a  movs    r3, r1
000c642c  add     sp, #0x188
000c642e  movs    r3, r1
000c6430  subs    r0, r3, r1
000c6432  movs    r3, r0
000c6434  adr     r4, #0x208
000c6436  movs    r3, r1
000c6438  bhs     #0xc64fc
000c643a  movs    r2, r0
000c643c  strb    r2, [r5, #0x12]
000c643e  movs    r3, r0
000c6440  ldr     r0, [r4, #0x24]
000c6442  movs    r3, r0
000c6444  strb    r6, [r2, #0x1e]
000c6446  movs    r3, r0
000c6448  ldr     r4, [r6, #0x10]
000c644a  movs    r3, r0
000c644c  bhs     #0xc640c
000c644e  movs    r2, r0
000c6450  ldrb    r0, [r2, #0xe]
000c6452  movs    r3, r0
000c6454  ldr     r6, [r3, #0x10]
000c6456  movs    r3, r0
000c6458  strh    r2, [r2, #0x2a]
000c645a  movs    r3, r1
000c645c  ldr     r4, [r1, #0x10]
000c645e  movs    r3, r0
000c6460  ldr     r2, [r3, #0x1c]
000c6462  movs    r3, r0
000c6464  ldr     r4, [r1, #0x24]
000c6466  movs    r3, r0
000c6468  adds    r2, r7, #3
000c646a  movs    r3, r0
000c646c  ldr     r2, [r1, #0x20]
000c646e  movs    r3, r0
000c6470  ldrb    r0, [r7, #0xa]
000c6472  movs    r3, r0
000c6474  adr     r5, #0x140
000c6476  movs    r3, r1
000c6478  adds    r0, r1, #3
000c647a  movs    r3, r0
000c647c  adr     r5, #0xf8
000c647e  movs    r3, r1
000c6480  adds    r6, r5, #2
000c6482  movs    r3, r0
000c6484  adr     r5, #0xf0
000c6486  movs    r3, r1
000c6488  adds    r0, r2, #2
000c648a  movs    r3, r0
000c648c  adr     r5, #0xa8
000c648e  movs    r3, r1
000c6490  adds    r2, r6, #1
000c6492  movs    r3, r0
000c6494  adr     r4, #0x3e0
000c6496  movs    r3, r1
000c6498  adds    r0, r2, #1
000c649a  movs    r3, r0
000c649c  adr     r2, #0x388
000c649e  movs    r3, r1
000c64a0  add     r6, sp, #0x360
000c64a2  movs    r3, r1
000c64a4  adds    r0, r2, r3
000c64a6  movs    r3, r0
000c64a8  adr     r2, #0x3f0
000c64aa  movs    r3, r1
000c64ac  beq     #0xc646c
000c64ae  movs    r2, r0
000c64b0  strb    r0, [r5, #0xc]
000c64b2  movs    r3, r0
000c64b4  ldr     r0, [r4, #0xc]
000c64b6  movs    r3, r0
000c64b8  subs    r4, r2, r7
000c64ba  movs    r3, r0
000c64bc  adr     r2, #0x310
000c64be  movs    r3, r1
000c64c0  beq     #0xc6410
000c64c2  movs    r2, r0
000c64c4  strb    r0, [r6, #0xb]
000c64c6  movs    r3, r0
000c64c8  ldr     r0, [r5, #8]
000c64ca  movs    r3, r0
000c64cc  strb    r0, [r4, #0x17]
000c64ce  movs    r3, r0
000c64d0  str     r2, [r0, #0x78]
000c64d2  movs    r3, r0
000c64d4  subs    r0, r4, r6
000c64d6  movs    r3, r0
000c64d8  strb    r4, [r7, #0x16]
000c64da  movs    r3, r0
000c64dc  str     r6, [r3, #0x74]
000c64de  movs    r3, r0
000c64e0  subs    r0, r6, r5
000c64e2  movs    r3, r0
000c64e4  strb    r4, [r2, #0x16]
000c64e6  movs    r3, r0
000c64e8  str     r6, [r6, #0x70]
000c64ea  movs    r3, r0
000c64ec  subs    r6, r1, r5
000c64ee  movs    r3, r0
000c64f0  subs    r4, r7, r4
000c64f2  movs    r3, r0
000c64f4  ldrb    r2, [r4, #3]
000c64f6  movs    r3, r0
000c64f8  str     r0, [r1, #0x70]
000c64fa  movs    r3, r0
000c64fc  strh    r0, [r0, #0x1a]
000c64fe  movs    r3, r1
000c6500  subs    r2, r1, r4
000c6502  movs    r3, r0
000c6504  ldr     r0, [r4, #0x50]
000c6506  movs    r3, r0
000c6508  strb    r6, [r1, #0x14]
000c650a  movs    r3, r0
000c650c  ldr     r4, [r7, #0x44]
000c650e  movs    r3, r0
000c6510  ldrb    r4, [r3, #5]
000c6512  movs    r3, r0
000c6514  ldrb    r0, [r5, #4]
000c6516  movs    r3, r0
000c6518  str     r2, [r5, #0x68]
000c651a  movs    r3, r0
000c651c  str     r0, [r7, #0x74]
000c651e  movs    r3, r0
000c6520  str     r2, [r5, #0x7c]
000c6522  movs    r3, r0
000c6524  subs    r0, r3, r2
000c6526  movs    r3, r0
000c6528  str     r0, [r5, #0x78]
000c652a  movs    r3, r0
000c652c  adr     r2, #0x3d8
000c652e  movs    r3, r1
000c6530  subs    r6, r5, r1
000c6532  movs    r3, r0
000c6534  adr     r2, #0x390
000c6536  movs    r3, r1
000c6538  subs    r4, r2, r1
000c653a  movs    r3, r0
000c653c  adr     r2, #0x388
000c653e  movs    r3, r1
000c6540  subs    r6, r6, r0
000c6542  movs    r3, r0
000c6544  adr     r2, #0x340
000c6546  movs    r3, r1
000c6548  subs    r4, r1, r0
000c654a  movs    r3, r0
000c654c  adr     r0, #0x278
000c654e  movs    r3, r1
000c6550  adr     r2, #0x1f8
000c6552  movs    r3, r1
000c6554  asrs    r0, r3, #0x1a
000c6556  movs    r3, r0
