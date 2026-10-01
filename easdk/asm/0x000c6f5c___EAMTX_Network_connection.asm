========================================================================
-[EAMTX_Network connection  0x000c6f5c  1180 bytes   EAMTX_Network.mm
========================================================================

000c6f5c  push    {r4, r5, r6, r7, lr}
000c6f5e  add     r7, sp, #0xc
000c6f60  push.w  {r8, sl, fp}
000c6f64  sub     sp, #4
000c6f66  ldr     r3, [pc, #0x374]
000c6f68  mov     r6, r0
000c6f6a  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c6f6c  ldr     r3, [r3]
000c6f6e  ldr     r3, [r0, r3]
000c6f70  cmp     r3, #0xb
000c6f72  bne.w   #0xc71a0
000c6f76  ldr     r3, [pc, #0x368]
000c6f78  add     r3, pc ; -> 0x000f7d84  OBJC_IVAR_$_EAMTX_Network.noofAttempts
000c6f7a  ldr     r3, [r3]
000c6f7c  ldr     r3, [r0, r3]
000c6f7e  cmp     r3, #4
000c6f80  bgt.w   #0xc71a0
000c6f84  ldr.w   r3, [pc, #0x35c]
000c6f88  ldr.w   r1, [pc, #0x35c]
000c6f8c  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6f8e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c6f90  ldr     r3, [r3]
000c6f92  ldr.w   sl, [r1]
000c6f96  ldr     r0, [r0, r3]
000c6f98  mov     r1, sl
000c6f9a  blx     #0xddbfc ; -> objc_msgSend
000c6f9e  cmp     r0, #0
000c6fa0  beq.w   #0xc71a0
000c6fa4  ldr     r4, [pc, #0x344]
000c6fa6  add     r4, pc ; -> 0x000f7da0  OBJC_IVAR_$_EAMTX_Network.m_ReturnContentType
000c6fa8  ldr     r0, [r4]
000c6faa  ldr     r0, [r6, r0]
000c6fac  cmp     r0, #0
000c6fae  beq.w   #0xc71a0
000c6fb2  ldr.w   r1, [pc, #0x33c]
000c6fb6  ldr.w   r2, [pc, #0x33c]
000c6fba  add     r1, pc ; -> 0x000fd16c  
000c6fbc  add     r2, pc ; -> 0x00181b14  
000c6fbe  ldr     r5, [r1]
000c6fc0  mov     r1, r5
000c6fc2  blx     #0xddbfc ; -> objc_msgSend
000c6fc6  cbz     r0, #0xc6fec
000c6fc8  ldr     r3, [r4]
000c6fca  ldr     r2, [pc, #0x32c]
000c6fcc  mov     r1, r5
000c6fce  ldr     r0, [r6, r3]
000c6fd0  add     r2, pc ; -> 0x00181b24  
000c6fd2  blx     #0xddbfc ; -> objc_msgSend
000c6fd6  cbz     r0, #0xc6fec
000c6fd8  ldr     r3, [r4]
000c6fda  ldr     r2, [pc, #0x320]
000c6fdc  mov     r1, r5
000c6fde  ldr     r0, [r6, r3]
000c6fe0  add     r2, pc ; -> 0x00181b34  
000c6fe2  blx     #0xddbfc ; -> objc_msgSend
000c6fe6  cmp     r0, #0
000c6fe8  bne.w   #0xc71a0
000c6fec  ldr     r3, [pc, #0x310]
000c6fee  add     r3, pc ; -> 0x000f3330  dCachedData
000c6ff0  ldr     r4, [r3]
000c6ff2  ldr     r3, [r4]
000c6ff4  cbnz    r3, #0xc7014
000c6ff6  ldr.w   r0, [pc, #0x30c]
000c6ffa  ldr     r1, [pc, #0x30c]
000c6ffc  add     r0, pc ; -> 0x000fdbbc  
000c6ffe  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000c7000  ldr     r0, [r0]
000c7002  ldr     r1, [r1]
000c7004  blx     #0xddbfc ; -> objc_msgSend
000c7008  ldr     r1, [pc, #0x300]
000c700a  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c700c  ldr     r1, [r1]
000c700e  blx     #0xddbfc ; -> objc_msgSend
000c7012  str     r0, [r4]
000c7014  ldr     r1, [pc, #0x2f8]
000c7016  ldr.w   fp, [r4]
000c701a  ldr     r4, [pc, #0x2f8]
000c701c  add     r1, pc ; -> 0x000fd124  
000c701e  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c7020  ldr.w   r8, [r1]
000c7024  ldr     r1, [pc, #0x2f0]
000c7026  ldr     r3, [r4]
000c7028  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
000c702a  ldr     r0, [r6, r3]
000c702c  ldr     r1, [r1]
000c702e  blx     #0xddbfc ; -> objc_msgSend
000c7032  ldr     r3, [r4]
000c7034  mov     r1, sl
000c7036  ldr     r4, [pc, #0x2e4]
000c7038  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c703a  mov     r5, r0
000c703c  ldr     r0, [r6, r3]
000c703e  blx     #0xddbfc ; -> objc_msgSend
000c7042  mov     r1, r8
000c7044  mov     r2, r5
000c7046  mov     r3, r0
000c7048  mov     r0, fp
000c704a  blx     #0xddbfc ; -> objc_msgSend
000c704e  ldr     r3, [pc, #0x2d0]
000c7050  ldr.w   ip, [pc, #0x2d0]
000c7054  ldr     r0, [pc, #0x2d0]
000c7056  add     r3, pc ; -> 0x000f3334  downloadedBytesSize
000c7058  add     ip, pc ; -> 0x000f7d84  OBJC_IVAR_$_EAMTX_Network.noofAttempts
000c705a  ldr     r2, [r3]
000c705c  movs    r3, #0
000c705e  ldr     r1, [pc, #0x2cc]
000c7060  add     r0, pc ; -> 0x000fdb5c  
000c7062  str     r3, [r2]
000c7064  ldr     r3, [pc, #0x2c8]
000c7066  movs    r2, #1
000c7068  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c706a  add     r3, pc ; -> 0x000f7d80  OBJC_IVAR_$_EAMTX_Network.resumingDownload
000c706c  ldr     r1, [r1]
000c706e  ldr     r3, [r3]
000c7070  ldr     r0, [r0]
000c7072  strb    r2, [r6, r3]
000c7074  ldr.w   r2, [ip]
000c7078  ldr     r3, [r6, r2]
000c707a  adds    r3, #1
000c707c  str     r3, [r6, r2]
000c707e  ldr.w   r3, [ip]
000c7082  ldr     r2, [pc, #0x2b0]
000c7084  ldr     r3, [r6, r3]
000c7086  add     r2, pc ; -> 0x00181c04  
000c7088  blx     #0xddbfc ; -> objc_msgSend
000c708c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7090  ldr     r0, [r4]
000c7092  ldr     r0, [r6, r0]
000c7094  cbz     r0, #0xc70b0
000c7096  ldr     r1, [pc, #0x2a0]
000c7098  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c709a  ldr     r1, [r1]
000c709c  blx     #0xddbfc ; -> objc_msgSend
000c70a0  cbz     r0, #0xc70b0
000c70a2  ldr     r1, [pc, #0x298]
000c70a4  ldr     r3, [r4]
000c70a6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c70a8  ldr     r0, [r6, r3]
000c70aa  ldr     r1, [r1]
000c70ac  blx     #0xddbfc ; -> objc_msgSend
000c70b0  ldr     r4, [pc, #0x28c]
000c70b2  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c70b4  ldr     r0, [r4]
000c70b6  ldr     r0, [r6, r0]
000c70b8  cbz     r0, #0xc70d4
000c70ba  ldr     r1, [pc, #0x288]
000c70bc  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c70be  ldr     r1, [r1]
000c70c0  blx     #0xddbfc ; -> objc_msgSend
000c70c4  cbz     r0, #0xc70d4
000c70c6  ldr     r1, [pc, #0x280]
000c70c8  ldr     r3, [r4]
000c70ca  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c70cc  ldr     r0, [r6, r3]
000c70ce  ldr     r1, [r1]
000c70d0  blx     #0xddbfc ; -> objc_msgSend
000c70d4  ldr     r3, [pc, #0x274]
000c70d6  movs    r5, #0
000c70d8  ldr     r0, [pc, #0x274]
000c70da  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c70dc  mov     r1, sl
000c70de  ldr     r3, [r3]
000c70e0  add     r0, pc ; -> 0x000f3330  dCachedData
000c70e2  ldr     r0, [r0]
000c70e4  str     r5, [r6, r3]
000c70e6  ldr     r3, [pc, #0x26c]
000c70e8  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c70ea  ldr     r3, [r3]
000c70ec  str     r5, [r6, r3]
000c70ee  ldr     r3, [pc, #0x268]
000c70f0  ldr     r0, [r0]
000c70f2  add     r3, pc ; -> 0x000f7d78  OBJC_IVAR_$_EAMTX_Network.startingByteIdx
000c70f4  ldr     r4, [r3]
000c70f6  blx     #0xddbfc ; -> objc_msgSend
000c70fa  ldr     r3, [pc, #0x260]
000c70fc  ldr     r1, [pc, #0x260]
000c70fe  add     r3, pc ; -> 0x000f7da8  OBJC_IVAR_$_EAMTX_Network.m_LastRequestURL
000c7100  add     r1, pc ; -> 0x000fd4c4  
000c7102  ldr     r1, [r1]
000c7104  str     r0, [r6, r4]
000c7106  ldr     r3, [r3]
000c7108  ldr     r0, [pc, #0x258]
000c710a  ldr     r2, [r6, r3]
000c710c  add     r0, pc ; -> 0x0017ea14  
000c710e  mov     r3, r5
000c7110  str     r0, [sp]
000c7112  mov     r0, r6
000c7114  blx     #0xddbfc ; -> objc_msgSend
000c7118  b       #0xc72d2
000c711a  ldr     r3, [pc, #0x24c]
000c711c  mov     r0, r5
000c711e  mov     r1, r4
000c7120  add     r3, pc ; -> 0x00180484  
000c7122  blx     #0xddbfc ; -> objc_msgSend
000c7126  ldr     r0, [pc, #0x244]
000c7128  ldr     r1, [pc, #0x244]
000c712a  ldr     r4, [pc, #0x248]
000c712c  add     r0, pc ; -> 0x000f3270  mtxController
000c712e  add     r1, pc ; -> 0x000fd4bc  
000c7130  ldr     r0, [r0]
000c7132  ldr     r1, [r1]
000c7134  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c7136  ldr     r0, [r0]
000c7138  blx     #0xddbfc ; -> objc_msgSend
000c713c  ldr     r1, [pc, #0x238]
000c713e  mov     r2, r5
000c7140  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000c7142  ldr     r1, [r1]
000c7144  blx     #0xddbfc ; -> objc_msgSend
000c7148  ldr     r0, [r4]
000c714a  ldr     r0, [r6, r0]
000c714c  cbz     r0, #0xc7168
000c714e  ldr     r1, [pc, #0x22c]
000c7150  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c7152  ldr     r1, [r1]
000c7154  blx     #0xddbfc ; -> objc_msgSend
000c7158  cbz     r0, #0xc7168
000c715a  ldr     r1, [pc, #0x224]
000c715c  ldr     r3, [r4]
000c715e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c7160  ldr     r0, [r6, r3]
000c7162  ldr     r1, [r1]
000c7164  blx     #0xddbfc ; -> objc_msgSend
000c7168  ldr     r4, [pc, #0x218]
000c716a  add     r4, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c716c  ldr     r0, [r4]
000c716e  ldr     r0, [r6, r0]
000c7170  cbz     r0, #0xc718c
000c7172  ldr     r1, [pc, #0x214]
000c7174  add     r1, pc ; -> 0x000fd7cc  'X\x03\x0f'
000c7176  ldr     r1, [r1]
000c7178  blx     #0xddbfc ; -> objc_msgSend
000c717c  cbz     r0, #0xc718c
000c717e  ldr     r1, [pc, #0x20c]
000c7180  ldr     r3, [r4]
000c7182  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c7184  ldr     r0, [r6, r3]
000c7186  ldr     r1, [r1]
000c7188  blx     #0xddbfc ; -> objc_msgSend
000c718c  ldr     r3, [pc, #0x200]
000c718e  movs    r2, #0
000c7190  add     r3, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c7192  ldr     r3, [r3]
000c7194  str     r2, [r6, r3]
000c7196  ldr     r3, [pc, #0x1fc]
000c7198  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c719a  ldr     r3, [r3]
000c719c  str     r2, [r6, r3]
000c719e  b       #0xc72d2
000c71a0  ldr     r0, [pc, #0x1f4]
000c71a2  ldr.w   fp, [pc, #0x1f8]
000c71a6  add     r0, pc ; -> 0x00181c14  
000c71a8  blx     #0xdd3e0 ; -> NSLog
000c71ac  ldr     r3, [pc, #0x1f0]
000c71ae  ldr     r0, [pc, #0x1f4]
000c71b0  ldr     r1, [pc, #0x1f4]
000c71b2  add     r3, pc ; -> 0x000f7d84  OBJC_IVAR_$_EAMTX_Network.noofAttempts
000c71b4  add     r0, pc ; -> 0x000f3270  mtxController
000c71b6  ldr     r3, [r3]
000c71b8  ldr     r0, [r0]
000c71ba  add     r1, pc ; -> 0x000fd7c4  '_\x05\x0f'
000c71bc  movs    r2, #0
000c71be  ldr     r1, [r1]
000c71c0  str     r2, [r6, r3]
000c71c2  adds    r2, #1
000c71c4  ldr     r0, [r0]
000c71c6  blx     #0xddbfc ; -> objc_msgSend
000c71ca  ldr     r0, [pc, #0x1e0]
000c71cc  ldr     r1, [pc, #0x1e0]
000c71ce  add     fp, pc ; -> 0x0017e5c4  
000c71d0  add     r0, pc ; -> 0x000fdbf4  
000c71d2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c71d4  ldr     r0, [r0]
000c71d6  ldr     r1, [r1]
000c71d8  blx     #0xddbfc ; -> objc_msgSend
000c71dc  ldr     r1, [pc, #0x1d4]
000c71de  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c71e0  ldr     r1, [r1]
000c71e2  blx     #0xddbfc ; -> objc_msgSend
000c71e6  ldr     r1, [pc, #0x1d0]
000c71e8  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c71ea  ldr     r1, [r1]
000c71ec  blx     #0xddbfc ; -> objc_msgSend
000c71f0  ldr     r1, [pc, #0x1c8]
000c71f2  ldr     r3, [pc, #0x1cc]
000c71f4  mov     r2, fp
000c71f6  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c71f8  add     r3, pc ; -> 0x000f7d88  OBJC_IVAR_$_EAMTX_Network.networkState
000c71fa  ldr     r4, [r1]
000c71fc  ldr     r1, [pc, #0x1c4]
000c71fe  ldr     r3, [r3]
000c7200  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7202  ldr.w   r8, [r1]
000c7206  ldr     r3, [r6, r3]
000c7208  mov     r1, r8
000c720a  mov     r5, r0
000c720c  ldr     r0, [pc, #0x1b8]
000c720e  add     r0, pc ; -> 0x000fdb5c  
000c7210  ldr.w   sl, [r0]
000c7214  mov     r0, sl
000c7216  blx     #0xddbfc ; -> objc_msgSend
000c721a  ldr     r3, [pc, #0x1b0]
000c721c  mov     r1, r4
000c721e  add     r3, pc ; -> 0x00180604  
000c7220  mov     r2, r0
000c7222  mov     r0, r5
000c7224  blx     #0xddbfc ; -> objc_msgSend
000c7228  ldr     r3, [pc, #0x1a4]
000c722a  mov     r1, r8
000c722c  mov     r2, fp
000c722e  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c7230  mov     r0, sl
000c7232  ldr     r3, [r3]
000c7234  ldr     r3, [r6, r3]
000c7236  blx     #0xddbfc ; -> objc_msgSend
000c723a  ldr     r3, [pc, #0x198]
000c723c  mov     r1, r4
000c723e  add     r3, pc ; -> 0x00180614  
000c7240  mov     r2, r0
000c7242  mov     r0, r5
000c7244  blx     #0xddbfc ; -> objc_msgSend
000c7248  ldr     r3, [pc, #0x18c]
000c724a  mov     r1, r8
000c724c  mov     r2, fp
000c724e  add     r3, pc ; -> 0x000f7d94  OBJC_IVAR_$_EAMTX_Network.moduleId
000c7250  mov     r0, sl
000c7252  ldr     r3, [r3]
000c7254  ldr     r3, [r6, r3]
000c7256  blx     #0xddbfc ; -> objc_msgSend
000c725a  ldr     r3, [pc, #0x180]
000c725c  mov     r1, r4
000c725e  add     r3, pc ; -> 0x00180634  
000c7260  mov     r2, r0
000c7262  mov     r0, r5
000c7264  blx     #0xddbfc ; -> objc_msgSend
000c7268  ldr     r3, [pc, #0x174]
000c726a  mov     r1, r8
000c726c  mov     r2, fp
000c726e  add     r3, pc ; -> 0x000f7d98  OBJC_IVAR_$_EAMTX_Network.moduleState
000c7270  mov     r0, sl
000c7272  ldr     r3, [r3]
000c7274  ldr     r3, [r6, r3]
000c7276  blx     #0xddbfc ; -> objc_msgSend
000c727a  ldr     r3, [pc, #0x168]
000c727c  mov     r1, r4
000c727e  add     r3, pc ; -> 0x00180644  
000c7280  mov     r2, r0
000c7282  mov     r0, r5
000c7284  blx     #0xddbfc ; -> objc_msgSend
000c7288  ldr     r3, [pc, #0x15c]
000c728a  mov     r1, r8
000c728c  mov     r2, fp
000c728e  add     r3, pc ; -> 0x000f7d90  OBJC_IVAR_$_EAMTX_Network.itemSellId
000c7290  mov     r0, sl
000c7292  ldr     r3, [r3]
000c7294  ldr     r3, [r6, r3]
000c7296  blx     #0xddbfc ; -> objc_msgSend
000c729a  ldr     r3, [pc, #0x150]
000c729c  mov     r1, r4
000c729e  add     r3, pc ; -> 0x00180434  
000c72a0  mov     r2, r0
000c72a2  mov     r0, r5
000c72a4  blx     #0xddbfc ; -> objc_msgSend
000c72a8  mov     r1, r8
000c72aa  mov     r2, fp
000c72ac  movs    r3, #1
000c72ae  mov     r0, sl
000c72b0  blx     #0xddbfc ; -> objc_msgSend
000c72b4  ldr     r3, [pc, #0x138]
000c72b6  mov     r1, r4
000c72b8  add     r3, pc ; -> 0x0017f064  
000c72ba  mov     r2, r0
000c72bc  mov     r0, r5
000c72be  blx     #0xddbfc ; -> objc_msgSend
000c72c2  ldr     r3, [pc, #0x130]
000c72c4  add     r3, pc ; -> 0x000f7a48  OBJC_IVAR_$_EAMTX_Network.itemIdentifier
000c72c6  ldr     r2, [r3]
000c72c8  ldr     r2, [r6, r2]
000c72ca  cmp     r2, #0
000c72cc  bne.w   #0xc711a
000c72d0  b       #0xc7126
000c72d2  sub.w   sp, r7, #0x18
000c72d6  pop.w   {r8, sl, fp}
000c72da  pop     {r4, r5, r6, r7, pc}
000c72dc  lsrs    r2, r3, #0x18
000c72de  movs    r3, r0
000c72e0  lsrs    r0, r1, #0x18
000c72e2  movs    r3, r0
000c72e4  lsrs    r4, r1, #0x18
000c72e6  movs    r3, r0
000c72e8  ldrh    r6, [r4, r3]
000c72ea  movs    r3, r0
000c72ec  lsrs    r6, r6, #0x17
000c72ee  movs    r3, r0
000c72f0  str     r6, [r5, #0x18]
000c72f2  movs    r3, r0
000c72f4  add     r3, sp, #0x150
000c72f6  movs    r3, r1
000c72f8  add     r3, sp, #0x140
000c72fa  movs    r3, r1
000c72fc  add     r3, sp, #0x140
000c72fe  movs    r3, r1
000c7300  stm     r3!, {r1, r2, r3, r4, r5}
000c7302  movs    r2, r0
000c7304  ldr     r4, [r7, #0x38]
000c7306  movs    r3, r0
000c7308  ldrb    r2, [r2, r4]
000c730a  movs    r3, r0
000c730c  ldrb    r2, [r0, r3]
000c730e  movs    r3, r0
000c7310  str     r4, [r0, #0x10]
000c7312  movs    r3, r0
000c7314  lsrs    r2, r7, #0x15
000c7316  movs    r3, r0
000c7318  ldrh    r4, [r4, r1]
000c731a  movs    r3, r0
000c731c  lsrs    r0, r5, #0x15
000c731e  movs    r3, r0
000c7320  stm     r2!, {r1, r3, r4, r6, r7}
000c7322  movs    r2, r0
000c7324  lsrs    r0, r5, #0x14
000c7326  movs    r3, r0
000c7328  ldr     r0, [r7, #0x2c]
000c732a  movs    r3, r0
000c732c  ldrh    r4, [r6, r0]
000c732e  movs    r3, r0
000c7330  lsrs    r2, r2, #0x14
000c7332  movs    r3, r0
000c7334  add     r3, sp, #0x1e8
000c7336  movs    r3, r1
000c7338  str     r0, [r6, #0x70]
000c733a  movs    r3, r0
000c733c  ldr     r2, [r2, r3]
000c733e  movs    r3, r0
000c7340  lsrs    r6, r4, #0x13
000c7342  movs    r3, r0
000c7344  str     r4, [r1, #0x70]
000c7346  movs    r3, r0
000c7348  ldr     r6, [r5, r2]
000c734a  movs    r3, r0
000c734c  lsrs    r6, r0, #0x13
000c734e  movs    r3, r0
000c7350  stm     r2!, {r2, r3, r6}
000c7352  movs    r2, r0
000c7354  lsrs    r0, r6, #0x12
000c7356  movs    r3, r0
000c7358  lsrs    r2, r0, #0x12
000c735a  movs    r3, r0
000c735c  lsrs    r6, r4, #0x12
000c735e  movs    r3, r0
000c7360  str     r0, [r0, #0x3c]
000c7362  movs    r3, r0
000c7364  ldrb    r4, [r0, #4]
000c7366  movs    r3, r1
000c7368  str     r3, [sp, #0x180]
000c736a  movs    r3, r1
000c736c  stm     r1!, {r6}
000c736e  movs    r2, r0
000c7370  str     r2, [r1, #0x38]
000c7372  movs    r3, r0
000c7374  lsrs    r4, r5, #0x11
000c7376  movs    r3, r0
000c7378  ldr     r0, [r0, r5]
000c737a  movs    r3, r0
000c737c  str     r0, [r7, #0x64]
000c737e  movs    r3, r0
000c7380  ldr     r2, [r3, r0]
000c7382  movs    r3, r0
000c7384  lsrs    r6, r5, #0x10
000c7386  movs    r3, r0
000c7388  str     r4, [r2, #0x64]
000c738a  movs    r3, r0
000c738c  ldrsb   r6, [r6, r7]
000c738e  movs    r3, r0
000c7390  lsrs    r0, r2, #0x10
000c7392  movs    r3, r0
000c7394  lsrs    r0, r0, #0x10
000c7396  movs    r3, r0
000c7398  add     r2, sp, #0x1a8
000c739a  movs    r3, r1
000c739c  strb    r2, [r6, #0xf]
000c739e  movs    r3, r1
000c73a0  lsrs    r6, r1, #0xf
000c73a2  movs    r3, r0
000c73a4  stm     r0!, {r3, r4, r5, r7}
000c73a6  movs    r2, r0
000c73a8  str     r6, [r0, #0x60]
000c73aa  movs    r3, r0
000c73ac  ldr     r0, [r4, #0x20]
000c73ae  movs    r3, r0
000c73b0  ldrsb   r6, [r5, r6]
000c73b2  movs    r3, r0
000c73b4  ldrsb   r6, [r3, r6]
000c73b6  movs    r3, r0
000c73b8  ldr     r4, [r5, r1]
000c73ba  movs    r3, r0
000c73bc  ldr     r6, [r3, r3]
000c73be  movs    r3, r0
000c73c0  lsrs    r4, r1, #0xe
000c73c2  movs    r3, r0
000c73c4  ldr     r4, [r3, r2]
000c73c6  movs    r3, r0
000c73c8  ldr     r2, [r1, #0x14]
000c73ca  movs    r3, r0
000c73cc  str     r3, [sp, #0x388]
000c73ce  movs    r3, r1
000c73d0  lsrs    r2, r3, #0xd
000c73d2  movs    r3, r0
000c73d4  str     r3, [sp, #0x348]
000c73d6  movs    r3, r1
000c73d8  lsrs    r2, r0, #0xd
000c73da  movs    r3, r0
000c73dc  str     r3, [sp, #0x348]
000c73de  movs    r3, r1
000c73e0  lsrs    r6, r4, #0xc
000c73e2  movs    r3, r0
000c73e4  str     r3, [sp, #0x308]
000c73e6  movs    r3, r1
000c73e8  lsrs    r6, r7, #0xb
000c73ea  movs    r3, r0
000c73ec  str     r1, [sp, #0x248]
000c73ee  movs    r3, r1
000c73f0  ldrb    r0, [r5, #0x16]
000c73f2  movs    r3, r1
000c73f4  lsls    r0, r0, #0x1e
000c73f6  movs    r3, r0
