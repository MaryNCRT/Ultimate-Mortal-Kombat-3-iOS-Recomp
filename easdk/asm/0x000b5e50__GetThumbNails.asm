========================================================================
GetThumbNails  0x000b5e50  308 bytes   EAMTX_Main.mm
========================================================================

000b5e50  push    {r4, r5, r6, r7, lr}
000b5e52  add     r7, sp, #0xc
000b5e54  push.w  {r8, sl, fp}
000b5e58  ldr     r4, [pc, #0xd8]
000b5e5a  mov     r5, r0
000b5e5c  add     r4, pc ; -> 0x0038c140  m_ThumbsList
000b5e5e  ldr     r0, [r4]
000b5e60  cbz     r0, #0xb5e78
000b5e62  ldr     r1, [pc, #0xd4]
000b5e64  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000b5e66  ldr     r1, [r1]
000b5e68  blx     #0xddbfc ; -> objc_msgSend
000b5e6c  ldr     r1, [pc, #0xcc]
000b5e6e  ldr     r0, [r4]
000b5e70  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5e72  ldr     r1, [r1]
000b5e74  blx     #0xddbfc ; -> objc_msgSend
000b5e78  ldr     r0, [pc, #0xc4]
000b5e7a  ldr     r1, [pc, #0xc8]
000b5e7c  add     r0, pc ; -> 0x000fdb70  
000b5e7e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b5e80  ldr     r0, [r0]
000b5e82  ldr     r1, [r1]
000b5e84  blx     #0xddbfc ; -> objc_msgSend
000b5e88  ldr     r1, [pc, #0xbc]
000b5e8a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b5e8c  ldr     r1, [r1]
000b5e8e  blx     #0xddbfc ; -> objc_msgSend
000b5e92  ldr     r3, [pc, #0xb8]
000b5e94  ldr     r1, [pc, #0xb8]
000b5e96  ldr     r2, [pc, #0xbc]
000b5e98  add     r3, pc ; -> 0x0038c140  m_ThumbsList
000b5e9a  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b5e9c  add     r2, pc ; -> 0x0017fea4  
000b5e9e  ldr     r1, [r1]
000b5ea0  str     r0, [r3]
000b5ea2  mov     r0, r5
000b5ea4  blx     #0xddbfc ; -> objc_msgSend
000b5ea8  ldr     r1, [pc, #0xac]
000b5eaa  movs    r5, #0
000b5eac  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b5eae  ldr.w   fp, [r1]
000b5eb2  ldr     r1, [pc, #0xa8]
000b5eb4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b5eb6  ldr.w   sl, [r1]
000b5eba  ldr     r1, [pc, #0xa4]
000b5ebc  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b5ebe  ldr.w   r8, [r1]
000b5ec2  mov     r6, r0
000b5ec4  b       #0xb5ee6
000b5ec6  ldr     r0, [pc, #0x9c]
000b5ec8  mov     r2, r5
000b5eca  mov     r1, r8
000b5ecc  add     r0, pc ; -> 0x0038c140  m_ThumbsList
000b5ece  adds    r5, #1
000b5ed0  ldr     r4, [r0]
000b5ed2  mov     r0, r6
000b5ed4  blx     #0xddbfc ; -> objc_msgSend
000b5ed8  bl      #0xb5cb0 ; -> Z12GetBannerObjP12NSDictionary
000b5edc  mov     r1, sl
000b5ede  mov     r2, r0
000b5ee0  mov     r0, r4
000b5ee2  blx     #0xddbfc ; -> objc_msgSend
000b5ee6  mov     r0, r6
000b5ee8  mov     r1, fp
000b5eea  blx     #0xddbfc ; -> objc_msgSend
000b5eee  cmp     r0, r5
000b5ef0  bhi     #0xb5ec6
000b5ef2  ldr     r4, [pc, #0x74]
000b5ef4  add     r4, pc ; -> 0x0038c1a0  thumbsUpdatedTime
000b5ef6  ldr     r0, [r4]
000b5ef8  cbz     r0, #0xb5f08
000b5efa  ldr     r1, [pc, #0x70]
000b5efc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b5efe  ldr     r1, [r1]
000b5f00  blx     #0xddbfc ; -> objc_msgSend
000b5f04  movs    r3, #0
000b5f06  str     r3, [r4]
000b5f08  ldr     r0, [pc, #0x64]
000b5f0a  ldr     r1, [pc, #0x68]
000b5f0c  add     r0, pc ; -> 0x000fdbb4  
000b5f0e  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b5f10  ldr     r0, [r0]
000b5f12  ldr     r1, [r1]
000b5f14  blx     #0xddbfc ; -> objc_msgSend
000b5f18  ldr     r1, [pc, #0x5c]
000b5f1a  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000b5f1c  ldr     r1, [r1]
000b5f1e  blx     #0xddbfc ; -> objc_msgSend
000b5f22  ldr     r3, [pc, #0x58]
000b5f24  add     r3, pc ; -> 0x0038c1a0  thumbsUpdatedTime
000b5f26  str     r0, [r3]
000b5f28  ldr     r0, [pc, #0x54]
000b5f2a  add     r0, pc ; -> 0x0038c140  m_ThumbsList
000b5f2c  ldr     r0, [r0]
000b5f2e  pop.w   {r8, sl, fp}
000b5f32  pop     {r4, r5, r6, r7, pc}
000b5f34  str     r0, [r4, #0x2c]
000b5f36  movs    r5, r5
000b5f38  ldr     r4, [r4, #0x40]
000b5f3a  movs    r4, r0
000b5f3c  ldr     r0, [r1, #0x30]
000b5f3e  movs    r4, r0
000b5f40  ldrb    r0, [r6, #0x13]
000b5f42  movs    r4, r0
000b5f44  ldr     r2, [r0, #0x30]
000b5f46  movs    r4, r0
000b5f48  ldr     r2, [r6, #0x2c]
000b5f4a  movs    r4, r0
000b5f4c  str     r4, [r4, #0x28]
000b5f4e  movs    r5, r5
000b5f50  ldr     r2, [r2, #0x44]
000b5f52  movs    r4, r0
000b5f54  adr     r0, #0x10
000b5f56  movs    r4, r1
000b5f58  ldr     r0, [r2, #0x3c]
000b5f5a  movs    r4, r0
000b5f5c  ldr     r4, [r1, #0x3c]
000b5f5e  movs    r4, r0
000b5f60  ldr     r4, [r7, #0x38]
000b5f62  movs    r4, r0
000b5f64  str     r0, [r6, #0x24]
000b5f66  movs    r5, r5
000b5f68  str     r0, [r5, #0x28]
000b5f6a  movs    r5, r5
000b5f6c  ldr     r4, [r7, #0x24]
000b5f6e  movs    r4, r0
000b5f70  ldrb    r4, [r4, #0x12]
000b5f72  movs    r4, r0
000b5f74  ldr     r6, [r6, #0x48]
000b5f76  movs    r4, r0
000b5f78  ldr     r2, [r6, #0x58]
000b5f7a  movs    r4, r0
000b5f7c  str     r0, [r7, #0x24]
000b5f7e  movs    r5, r5
000b5f80  str     r2, [r2, #0x20]
000b5f82  movs    r5, r5
