========================================================================
GetCategoryObj  0x000b6ff4  396 bytes   EAMTX_Main.mm
========================================================================

000b6ff4  push    {r4, r5, r6, r7, lr}
000b6ff6  add     r7, sp, #0xc
000b6ff8  push.w  {r8, sl, fp}
000b6ffc  sub     sp, #8
000b6ffe  mov     sl, r0
000b7000  ldr     r0, [pc, #0x124]
000b7002  add     r0, pc ; -> 0x0038c18c  m_CurrCat
000b7004  ldr     r0, [r0]
000b7006  cbz     r0, #0xb7012
000b7008  ldr     r1, [pc, #0x120]
000b700a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b700c  ldr     r1, [r1]
000b700e  blx     #0xddbfc ; -> objc_msgSend
000b7012  ldr     r0, [pc, #0x11c]
000b7014  ldr     r1, [pc, #0x11c]
000b7016  ldr.w   r8, [pc, #0x120]
000b701a  add     r0, pc ; -> 0x000fdc9c  
000b701c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b701e  ldr     r0, [r0]
000b7020  ldr     r1, [r1]
000b7022  blx     #0xddbfc ; -> objc_msgSend
000b7026  ldr     r1, [pc, #0x114]
000b7028  add     r8, pc ; -> 0x0038c18c  m_CurrCat
000b702a  ldr     r4, [pc, #0x114]
000b702c  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b702e  ldr     r1, [r1]
000b7030  blx     #0xddbfc ; -> objc_msgSend
000b7034  ldr     r1, [pc, #0x10c]
000b7036  ldr     r3, [pc, #0x110]
000b7038  add     r4, pc ; -> 0x0038c0e4  mtxController
000b703a  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b703c  add     r3, pc ; -> 0x00180074  
000b703e  ldr     r6, [r1]
000b7040  mov     r2, r3
000b7042  mov     r1, r6
000b7044  str.w   r0, [r8]
000b7048  mov     r0, sl
000b704a  str     r3, [sp]
000b704c  blx     #0xddbfc ; -> objc_msgSend
000b7050  ldr     r1, [pc, #0xf8]
000b7052  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b7054  ldr     r1, [r1]
000b7056  str     r1, [sp, #4]
000b7058  blx     #0xddbfc ; -> objc_msgSend
000b705c  ldr     r1, [pc, #0xf0]
000b705e  add     r1, pc ; -> 0x000fd424  
000b7060  ldr     r1, [r1]
000b7062  mov     r2, r0
000b7064  ldr.w   r0, [r8]
000b7068  blx     #0xddbfc ; -> objc_msgSend
000b706c  ldr     r2, [pc, #0xe4]
000b706e  mov     r1, r6
000b7070  mov     r0, sl
000b7072  add     r2, pc ; -> 0x0017fe24  
000b7074  blx     #0xddbfc ; -> objc_msgSend
000b7078  ldr     r1, [pc, #0xdc]
000b707a  add     r1, pc ; -> 0x000fd20c  
000b707c  ldr     r1, [r1]
000b707e  mov     r2, r0
000b7080  ldr.w   r0, [r8]
000b7084  blx     #0xddbfc ; -> objc_msgSend
000b7088  ldr     r1, [pc, #0xd0]
000b708a  ldr     r2, [pc, #0xd4]
000b708c  mov     r0, sl
000b708e  add     r1, pc ; -> 0x000fd460  
000b7090  add     r2, pc ; -> 0x00180084  
000b7092  ldr.w   fp, [r1]
000b7096  mov     r1, r6
000b7098  ldr     r5, [r4]
000b709a  blx     #0xddbfc ; -> objc_msgSend
000b709e  mov     r1, fp
000b70a0  mov     r2, r0
000b70a2  mov     r0, r5
000b70a4  blx     #0xddbfc ; -> objc_msgSend
000b70a8  ldr     r1, [pc, #0xb8]
000b70aa  add     r1, pc ; -> 0x000fd420  
000b70ac  ldr     r1, [r1]
000b70ae  mov     r2, r0
000b70b0  ldr.w   r0, [r8]
000b70b4  blx     #0xddbfc ; -> objc_msgSend
000b70b8  ldr     r2, [pc, #0xac]
000b70ba  mov     r1, r6
000b70bc  mov     r0, sl
000b70be  add     r2, pc ; -> 0x00180094  
000b70c0  ldr     r4, [r4]
000b70c2  blx     #0xddbfc ; -> objc_msgSend
000b70c6  mov     r1, fp
000b70c8  mov     r2, r0
000b70ca  mov     r0, r4
000b70cc  blx     #0xddbfc ; -> objc_msgSend
000b70d0  ldr     r1, [pc, #0x98]
000b70d2  add     r1, pc ; -> 0x000fd41c  
000b70d4  ldr     r1, [r1]
000b70d6  mov     r2, r0
000b70d8  ldr.w   r0, [r8]
000b70dc  blx     #0xddbfc ; -> objc_msgSend
000b70e0  ldr     r2, [sp]
000b70e2  mov     r1, r6
000b70e4  mov     r0, sl
000b70e6  blx     #0xddbfc ; -> objc_msgSend
000b70ea  ldr     r1, [sp, #4]
000b70ec  blx     #0xddbfc ; -> objc_msgSend
000b70f0  ldr     r1, [pc, #0x7c]
000b70f2  ldr     r2, [pc, #0x80]
000b70f4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b70f6  add     r2, pc ; -> 0x0017e5c4  
000b70f8  ldr     r1, [r1]
000b70fa  mov     r3, r0
000b70fc  ldr     r0, [pc, #0x78]
000b70fe  add     r0, pc ; -> 0x000fdb5c  
000b7100  ldr     r0, [r0]
000b7102  blx     #0xddbfc ; -> objc_msgSend
000b7106  bl      #0xb6f84 ; -> Z14GetBadgesCountP8NSString
000b710a  ldr     r1, [pc, #0x70]
000b710c  add     r1, pc ; -> 0x000fd5f8  
000b710e  ldr     r1, [r1]
000b7110  mov     r2, r0
000b7112  ldr.w   r0, [r8]
000b7116  blx     #0xddbfc ; -> objc_msgSend
000b711a  ldr.w   r0, [r8]
000b711e  sub.w   sp, r7, #0x18
000b7122  pop.w   {r8, sl, fp}
000b7126  pop     {r4, r5, r6, r7, pc}
000b7128  str     r6, [r0, r6]
000b712a  movs    r5, r5
000b712c  ldr     r6, [r5, r5]
000b712e  movs    r4, r0
000b7130  ldr     r6, [r7, #0x44]
000b7132  movs    r4, r0
000b7134  ldr     r4, [r4, r5]
000b7136  movs    r4, r0
000b7138  str     r0, [r4, r5]
000b713a  movs    r5, r5
000b713c  ldr     r0, [r2, r5]
000b713e  movs    r4, r0
000b7140  str     r0, [r5, r2]
000b7142  movs    r5, r5
000b7144  ldrh    r2, [r6, r2]
000b7146  movs    r4, r0
000b7148  str     r0, [sp, #0xd0]
000b714a  movs    r4, r1
000b714c  ldrh    r2, [r2, r2]
000b714e  movs    r4, r0
000b7150  str     r2, [r0, #0x3c]
000b7152  movs    r4, r0
000b7154  ldrh    r6, [r5, #0x2c]
000b7156  movs    r4, r1
000b7158  str     r6, [r1, #0x18]
000b715a  movs    r4, r0
000b715c  str     r6, [r1, #0x3c]
000b715e  movs    r4, r0
000b7160  ldrh    r0, [r6, #0x3e]
000b7162  movs    r4, r1
000b7164  str     r2, [r6, #0x34]
000b7166  movs    r4, r0
000b7168  ldrh    r2, [r2, #0x3e]
000b716a  movs    r4, r1
000b716c  str     r6, [r0, #0x34]
000b716e  movs    r4, r0
000b7170  ldr     r0, [r5, r6]
000b7172  movs    r4, r0
000b7174  strb    r2, [r1, #0x13]
000b7176  movs    r4, r1
000b7178  ldr     r2, [r3, #0x24]
000b717a  movs    r4, r0
000b717c  str     r0, [r5, #0x4c]
000b717e  movs    r4, r0
