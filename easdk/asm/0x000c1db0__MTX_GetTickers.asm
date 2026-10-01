========================================================================
MTX_GetTickers  0x000c1db0  432 bytes   EAMTX_Main.mm
========================================================================

000c1db0  push    {r4, r5, r6, r7, lr}
000c1db2  add     r7, sp, #0xc
000c1db4  push.w  {r8, sl, fp}
000c1db8  ldr     r6, [pc, #0x140]
000c1dba  mov     r8, r2
000c1dbc  mov     r5, r0
000c1dbe  mov     sl, r1
000c1dc0  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000c1dc4  ldr     r1, [pc, #0x138]
000c1dc6  add     r6, pc ; -> 0x0038c0e4  mtxController
000c1dc8  ldr     r4, [pc, #0x138]
000c1dca  add     r1, pc ; -> 0x000fd6dc  
000c1dcc  ldr     r0, [r6]
000c1dce  ldr     r1, [r1]
000c1dd0  blx     #0xddbfc ; -> objc_msgSend
000c1dd4  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000c1dd6  mov     fp, r0
000c1dd8  mov     r0, r5
000c1dda  bl      #0xb6424 ; -> Z15CheckNullStringP8NSObject
000c1dde  ldr     r1, [pc, #0x128]
000c1de0  add     r1, pc ; -> 0x000fd618  
000c1de2  ldr     r1, [r1]
000c1de4  mov     r2, r0
000c1de6  ldr     r0, [r4]
000c1de8  blx     #0xddbfc ; -> objc_msgSend
000c1dec  ldr     r1, [pc, #0x11c]
000c1dee  ldr     r3, [pc, #0x120]
000c1df0  ldr     r0, [r4]
000c1df2  add     r1, pc ; -> 0x000fd6b0  
000c1df4  add     r3, pc ; -> 0x0038c130  m_iMaxTickers
000c1df6  ldr     r1, [r1]
000c1df8  str.w   r8, [r3]
000c1dfc  blx     #0xddbfc ; -> objc_msgSend
000c1e00  cmp     r0, #0
000c1e02  bgt     #0xc1ed4
000c1e04  ldr     r1, [pc, #0x10c]
000c1e06  ldr     r0, [r6]
000c1e08  add     r1, pc ; -> 0x000fd67c  
000c1e0a  ldr     r1, [r1]
000c1e0c  blx     #0xddbfc ; -> objc_msgSend
000c1e10  cmp     r0, #0
000c1e12  bne     #0xc1ed4
000c1e14  ldr     r1, [pc, #0x100]
000c1e16  ldr     r3, [pc, #0x104]
000c1e18  ldr     r0, [r6]
000c1e1a  add     r1, pc ; -> 0x000fd6b4  
000c1e1c  add     r3, pc ; -> 0x0038c12c  m_iTickerType
000c1e1e  ldr     r1, [r1]
000c1e20  movs    r2, #0x1d
000c1e22  str.w   sl, [r3]
000c1e26  blx     #0xddbfc ; -> objc_msgSend
000c1e2a  ldr     r1, [pc, #0xf4]
000c1e2c  ldr     r0, [r6]
000c1e2e  movs    r2, #3
000c1e30  add     r1, pc ; -> 0x000fd6d4  
000c1e32  ldr     r1, [r1]
000c1e34  b       #0xc1ecc
000c1e36  ldr     r3, [pc, #0xec]
000c1e38  add     r3, pc ; -> 0x0038c12c  m_iTickerType
000c1e3a  ldr     r3, [r3]
000c1e3c  cmp     r3, sl
000c1e3e  bne     #0xc1ede
000c1e40  ldr     r0, [pc, #0xe4]
000c1e42  add     r0, pc ; -> 0x0038c150  tickersLangCode
000c1e44  ldr     r0, [r0]
000c1e46  cbz     r0, #0xc1ea4
000c1e48  ldr     r1, [pc, #0xe0]
000c1e4a  mov     r2, r5
000c1e4c  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000c1e4e  ldr     r1, [r1]
000c1e50  blx     #0xddbfc ; -> objc_msgSend
000c1e54  tst.w   r0, #0xff
000c1e58  beq     #0xc1ede
000c1e5a  ldr     r0, [pc, #0xd4]
000c1e5c  add     r0, pc ; -> 0x0038c1c8  tickersUpdatedtime
000c1e5e  ldr     r0, [r0]
000c1e60  cmp     r0, #0
000c1e62  beq     #0xc1ede
000c1e64  ldr     r1, [pc, #0xcc]
000c1e66  add     r1, pc ; -> 0x000fcef4  
000c1e68  ldr     r1, [r1]
000c1e6a  blx     #0xddbfc ; -> objc_msgSend
000c1e6e  ldr     r3, [pc, #0xc8]
000c1e70  add     r3, pc ; -> 0x0038c1d0  mCacheTime
000c1e72  ldr     r3, [r3]
000c1e74  rsb.w   r3, r3, #0
000c1e78  vmov    s10, r3
000c1e7c  vcvt.f64.s32 d7, s10
000c1e80  vmov    d6, r0, r1
000c1e84  vcmp.f64 d6, d7
000c1e88  vmrs    apsr_nzcv, fpscr
000c1e8c  ble     #0xc1ede
000c1e8e  ldr     r2, [r4]
000c1e90  movs    r0, #0x19
000c1e92  mov     r1, fp
000c1e94  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c1e98  b       #0xc1eea
000c1e9a  ldr     r1, [pc, #0xa0]
000c1e9c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c1e9e  ldr     r1, [r1]
000c1ea0  blx     #0xddbfc ; -> objc_msgSend
000c1ea4  ldr     r1, [pc, #0x98]
000c1ea6  ldr     r3, [pc, #0x9c]
000c1ea8  mov     r0, r5
000c1eaa  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c1eac  add     r3, pc ; -> 0x0038c150  tickersLangCode
000c1eae  ldr     r1, [r1]
000c1eb0  str     r5, [r3]
000c1eb2  blx     #0xddbfc ; -> objc_msgSend
000c1eb6  ldr     r0, [pc, #0x90]
000c1eb8  ldr     r1, [pc, #0x90]
000c1eba  ldr     r3, [pc, #0x94]
000c1ebc  add     r0, pc ; -> 0x0038c0e4  mtxController
000c1ebe  add     r1, pc ; -> 0x000fd6d4  
000c1ec0  ldr     r0, [r0]
000c1ec2  ldr     r1, [r1]
000c1ec4  add     r3, pc ; -> 0x0038c12c  m_iTickerType
000c1ec6  movs    r2, #0x1d
000c1ec8  str.w   sl, [r3]
000c1ecc  mov     r3, fp
000c1ece  blx     #0xddbfc ; -> objc_msgSend
000c1ed2  b       #0xc1eea
000c1ed4  ldr     r4, [pc, #0x7c]
000c1ed6  add     r4, pc ; -> 0x0038c148  m_TickersList
000c1ed8  ldr     r3, [r4]
000c1eda  cmp     r3, #0
000c1edc  bne     #0xc1e36
000c1ede  ldr     r0, [pc, #0x78]
000c1ee0  add     r0, pc ; -> 0x0038c150  tickersLangCode
000c1ee2  ldr     r0, [r0]
000c1ee4  cmp     r0, #0
000c1ee6  bne     #0xc1e9a
000c1ee8  b       #0xc1ea4
000c1eea  ldr     r0, [pc, #0x70]
000c1eec  add     r0, pc ; -> 0x00180fe4  
000c1eee  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c1ef2  mov     r0, fp
000c1ef4  pop.w   {r8, sl, fp}
000c1ef8  pop     {r4, r5, r6, r7, pc}
000c1efa  nop     
000c1efc  adr     r3, #0x68
000c1efe  movs    r4, r5
000c1f00  cbnz    r6, #0xc1f06
000c1f02  movs    r3, r0
000c1f04  adr     r3, #0x40
000c1f06  movs    r4, r5
