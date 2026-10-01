========================================================================
ZN6Mayhem4Stat11FillFromXMLEPv  0x00090eb0  2528 bytes   Mayhem.mm
========================================================================

00090eb0  push    {r4, r5, r6, r7, lr}
00090eb2  add     r7, sp, #0xc
00090eb4  push.w  {r8, sl, fp}
00090eb8  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
00090ebc  sub     sp, #0x108
00090ebe  ldr.w   r3, [pc, #0x978]
00090ec2  str     r0, [sp, #4]
00090ec4  add     r0, sp, #0x98
00090ec6  add     r3, pc ; -> 0x000f3438  0x0
00090ec8  str     r1, [sp]
00090eca  ldr     r3, [r3]
00090ecc  str     r7, [sp, #0xb8]
00090ece  str.w   sp, [sp, #0xc0]
00090ed2  str     r3, [sp, #0xb0]
00090ed4  ldr.w   r3, [pc, #0x964]
00090ed8  add     r3, pc ; -> 0x000ee3f2  GCC_except_table74
00090eda  str     r3, [sp, #0xb4]
00090edc  ldr.w   r3, [pc, #0x960]
00090ee0  add     r3, pc ; -> 0x00091582  
00090ee2  orr     r3, r3, #1
00090ee6  str     r3, [sp, #0xbc]
00090ee8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00090eec  ldr.w   r3, [pc, #0x954]
00090ef0  ldr     r1, [sp]
00090ef2  mov.w   r2, #-1
00090ef6  add     r3, pc ; -> 0x000fcfa0  
00090ef8  str     r2, [sp, #0x9c]
00090efa  ldr     r3, [r3]
00090efc  str     r1, [sp, #8]
00090efe  mov     r0, r1
00090f00  mov     r1, r3
00090f02  str     r3, [sp, #0xc]
00090f04  blx     #0xddbfc ; -> objc_msgSend
00090f08  ldr.w   r3, [pc, #0x93c]
00090f0c  ldr.w   r2, [pc, #0x93c]
00090f10  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00090f12  add     r2, pc ; -> 0x0017f114  
00090f14  ldr     r3, [r3]
00090f16  mov     r1, r3
00090f18  str     r3, [sp, #0x10]
00090f1a  blx     #0xddbfc ; -> objc_msgSend
00090f1e  ldr.w   r3, [pc, #0x930]
00090f22  movs    r2, #0
00090f24  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00090f26  ldr     r3, [r3]
00090f28  mov     r1, r3
00090f2a  str     r3, [sp, #0x14]
00090f2c  blx     #0xddbfc ; -> objc_msgSend
00090f30  ldr     r1, [sp, #0xc]
00090f32  str     r0, [sp, #0x18]
00090f34  ldr     r0, [sp, #8]
00090f36  blx     #0xddbfc ; -> objc_msgSend
00090f3a  ldr.w   r2, [pc, #0x918]
00090f3e  ldr     r1, [sp, #0x10]
00090f40  add     r2, pc ; -> 0x0017f124  
00090f42  blx     #0xddbfc ; -> objc_msgSend
00090f46  movs    r2, #0
00090f48  ldr     r1, [sp, #0x14]
00090f4a  blx     #0xddbfc ; -> objc_msgSend
00090f4e  ldr     r1, [sp, #0xc]
00090f50  str     r0, [sp, #0x1c]
00090f52  ldr     r0, [sp, #8]
00090f54  blx     #0xddbfc ; -> objc_msgSend
00090f58  ldr.w   r2, [pc, #0x8fc]
00090f5c  ldr     r1, [sp, #0x10]
00090f5e  add     r2, pc ; -> 0x0017f134  
00090f60  blx     #0xddbfc ; -> objc_msgSend
00090f64  movs    r2, #0
00090f66  ldr     r1, [sp, #0x14]
00090f68  blx     #0xddbfc ; -> objc_msgSend
00090f6c  ldr     r1, [sp, #0xc]
00090f6e  str     r0, [sp, #0x20]
00090f70  ldr     r0, [sp, #8]
00090f72  blx     #0xddbfc ; -> objc_msgSend
00090f76  ldr.w   r2, [pc, #0x8e4]
00090f7a  ldr     r1, [sp, #0x10]
00090f7c  add     r2, pc ; -> 0x0017f034  
00090f7e  blx     #0xddbfc ; -> objc_msgSend
00090f82  movs    r2, #0
00090f84  ldr     r1, [sp, #0x14]
00090f86  blx     #0xddbfc ; -> objc_msgSend
00090f8a  ldr     r1, [sp, #0xc]
00090f8c  str     r0, [sp, #0x24]
00090f8e  ldr     r0, [sp, #8]
00090f90  blx     #0xddbfc ; -> objc_msgSend
00090f94  ldr.w   r2, [pc, #0x8c8]
00090f98  ldr     r1, [sp, #0x10]
00090f9a  add     r2, pc ; -> 0x0017f144  
00090f9c  blx     #0xddbfc ; -> objc_msgSend
00090fa0  movs    r2, #0
00090fa2  ldr     r1, [sp, #0x14]
00090fa4  blx     #0xddbfc ; -> objc_msgSend
00090fa8  ldr     r1, [sp, #0xc]
00090faa  str     r0, [sp, #0x28]
00090fac  ldr     r0, [sp, #8]
00090fae  blx     #0xddbfc ; -> objc_msgSend
00090fb2  ldr.w   r2, [pc, #0x8b0]
00090fb6  ldr     r1, [sp, #0x10]
00090fb8  add     r2, pc ; -> 0x0017f154  
00090fba  blx     #0xddbfc ; -> objc_msgSend
00090fbe  movs    r2, #0
00090fc0  ldr     r1, [sp, #0x14]
00090fc2  blx     #0xddbfc ; -> objc_msgSend
00090fc6  ldr     r1, [sp, #0xc]
00090fc8  str     r0, [sp, #0x2c]
00090fca  ldr     r0, [sp, #8]
00090fcc  blx     #0xddbfc ; -> objc_msgSend
00090fd0  ldr.w   r2, [pc, #0x894]
00090fd4  ldr     r1, [sp, #0x10]
00090fd6  add     r2, pc ; -> 0x0017f164  
00090fd8  blx     #0xddbfc ; -> objc_msgSend
00090fdc  movs    r2, #0
00090fde  ldr     r1, [sp, #0x14]
00090fe0  blx     #0xddbfc ; -> objc_msgSend
00090fe4  ldr.w   r3, [pc, #0x884]
00090fe8  add     r3, pc ; -> 0x000fcc28  'tS\x0e'
00090fea  ldr     r3, [r3]
00090fec  mov     r1, r3
00090fee  str     r3, [sp, #0x34]
00090ff0  str     r0, [sp, #0x30]
00090ff2  ldr     r0, [sp, #0x18]
00090ff4  blx     #0xddbfc ; -> objc_msgSend
00090ff8  ldr     r1, [sp, #0x34]
00090ffa  str     r0, [sp, #0x48]
00090ffc  ldr     r0, [sp, #0x1c]
00090ffe  blx     #0xddbfc ; -> objc_msgSend
00091002  ldr     r1, [sp, #0x34]
00091004  str     r0, [sp, #0x4c]
00091006  ldr     r0, [sp, #0x20]
00091008  blx     #0xddbfc ; -> objc_msgSend
0009100c  ldr     r1, [sp, #0x34]
0009100e  str     r0, [sp, #0x50]
00091010  ldr     r0, [sp, #0x24]
00091012  blx     #0xddbfc ; -> objc_msgSend
00091016  ldr     r1, [sp, #0x34]
00091018  str     r0, [sp, #0x54]
0009101a  ldr     r0, [sp, #0x28]
0009101c  blx     #0xddbfc ; -> objc_msgSend
00091020  ldr     r1, [sp, #0x34]
00091022  str     r0, [sp, #0x58]
00091024  ldr     r0, [sp, #0x2c]
00091026  blx     #0xddbfc ; -> objc_msgSend
0009102a  ldr     r1, [sp, #0x34]
0009102c  str     r0, [sp, #0x5c]
0009102e  ldr     r0, [sp, #0x30]
00091030  blx     #0xddbfc ; -> objc_msgSend
00091034  ldr     r1, [sp, #0xc]
00091036  str     r0, [sp, #0x60]
00091038  ldr     r0, [sp, #8]
0009103a  blx     #0xddbfc ; -> objc_msgSend
0009103e  ldr.w   r2, [pc, #0x830]
00091042  ldr     r1, [sp, #0x10]
00091044  add     r2, pc ; -> 0x0017f0a4  
00091046  blx     #0xddbfc ; -> objc_msgSend
0009104a  cbz     r0, #0x91060
0009104c  ldr     r1, [sp, #0x14]
0009104e  movs    r2, #0
00091050  mov.w   r3, #-1
00091054  str     r3, [sp, #0x9c]
00091056  blx     #0xddbfc ; -> objc_msgSend
0009105a  ldr     r1, [sp, #0x34]
0009105c  blx     #0xddbfc ; -> objc_msgSend
00091060  str     r0, [sp, #0x64]
00091062  ldr     r1, [sp, #0xc]
00091064  ldr     r0, [sp, #8]
00091066  mov.w   r4, #-1
0009106a  str     r4, [sp, #0x9c]
0009106c  blx     #0xddbfc ; -> objc_msgSend
00091070  ldr.w   r2, [pc, #0x800]
00091074  ldr     r1, [sp, #0x10]
00091076  add     r2, pc ; -> 0x0017f054  
00091078  blx     #0xddbfc ; -> objc_msgSend
0009107c  cbz     r0, #0x91092
0009107e  mov.w   r1, #-1
00091082  movs    r2, #0
00091084  str     r1, [sp, #0x9c]
00091086  ldr     r1, [sp, #0x14]
00091088  blx     #0xddbfc ; -> objc_msgSend
0009108c  ldr     r1, [sp, #0x34]
0009108e  blx     #0xddbfc ; -> objc_msgSend
00091092  str     r0, [sp, #0x68]
00091094  movs    r0, #0x24
00091096  mov.w   r2, #-1
0009109a  str     r2, [sp, #0x9c]
0009109c  blx     #0xdd5c0 ; -> Znwm
000910a0  ldr.w   r3, [pc, #0x7d4]
000910a4  mov.w   r1, #-1
000910a8  add     r3, pc ; -> 0x000f3370  0x0
000910aa  ldr     r3, [r3]
000910ac  str     r3, [sp, #0x90]
000910ae  adds    r3, #0xc
000910b0  str     r0, [sp, #0x6c]
000910b2  str     r3, [r0]
000910b4  ldr     r4, [sp, #0x6c]
000910b6  str     r3, [r4, #4]
000910b8  str     r3, [r4, #8]
000910ba  str     r3, [r4, #0x10]
000910bc  str     r3, [r4, #0x14]
000910be  str     r3, [r4, #0x1c]
000910c0  str     r3, [r4, #0x20]
000910c2  ldr.w   r3, [pc, #0x7b8]
000910c6  str     r1, [r4, #0xc]
000910c8  str     r1, [r4, #0x18]
000910ca  add     r3, pc ; -> 0x000fcf68  
000910cc  ldr     r3, [r3]
000910ce  str     r3, [sp, #0x38]
000910d0  ldr.w   r3, [pc, #0x7ac]
000910d4  add     r3, pc ; -> 0x000fdb5c  
000910d6  ldr     r3, [r3]
000910d8  str     r3, [sp, #0x3c]
000910da  ldr.w   r3, [pc, #0x7a8]
000910de  ldr     r0, [sp, #0x3c]
000910e0  add     r3, pc ; -> 0x000fcf58  
000910e2  ldr     r3, [r3]
000910e4  mov     r1, r3
000910e6  str     r3, [sp, #0x40]
000910e8  blx     #0xddbfc ; -> objc_msgSend
000910ec  ldr     r1, [sp, #0x38]
000910ee  mov     r2, r0
000910f0  ldr     r0, [sp, #0x48]
000910f2  blx     #0xddbfc ; -> objc_msgSend
000910f6  add     r2, sp, #0x104
000910f8  movs    r3, #0xf
000910fa  adds    r2, #3
000910fc  str     r3, [sp, #0x9c]
000910fe  mov     r1, r0
00091100  add     r0, sp, #0xe8
00091102  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00091106  movs    r3, #0xe
00091108  ldr     r0, [sp, #0x6c]
0009110a  str     r3, [sp, #0x9c]
0009110c  add     r1, sp, #0xe8
0009110e  blx     #0xdd518 ; -> ZNSs6assignERKSs
00091112  ldr     r3, [sp, #0xe8]
00091114  ldr     r2, [sp, #0x90]
00091116  sub.w   r0, r3, #0xc
0009111a  cmp     r2, r0
0009111c  bne.w   #0x913f6
00091120  ldr     r1, [sp, #0x40]
00091122  ldr     r0, [sp, #0x3c]
00091124  mov.w   r3, #-1
00091128  str     r3, [sp, #0x9c]
0009112a  blx     #0xddbfc ; -> objc_msgSend
0009112e  ldr     r1, [sp, #0x38]
00091130  mov     r2, r0
00091132  ldr     r0, [sp, #0x4c]
00091134  blx     #0xddbfc ; -> objc_msgSend
00091138  movs    r3, #0xd
0009113a  add.w   r2, sp, #0x106
0009113e  str     r3, [sp, #0x9c]
00091140  mov     r1, r0
00091142  add     r0, sp, #0xe4
00091144  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00091148  ldr     r1, [sp, #0x6c]
0009114a  movs    r3, #0xc
0009114c  str     r3, [sp, #0x9c]
0009114e  adds    r0, r1, #4
00091150  add     r1, sp, #0xe4
00091152  blx     #0xdd518 ; -> ZNSs6assignERKSs
00091156  ldr     r3, [sp, #0xe4]
00091158  ldr     r2, [sp, #0x90]
0009115a  sub.w   r0, r3, #0xc
0009115e  cmp     r2, r0
00091160  bne.w   #0x9147a
00091164  ldr     r1, [sp, #0x40]
00091166  ldr     r0, [sp, #0x3c]
00091168  mov.w   r3, #-1
0009116c  str     r3, [sp, #0x9c]
0009116e  blx     #0xddbfc ; -> objc_msgSend
00091172  ldr     r1, [sp, #0x38]
00091174  mov     r2, r0
00091176  ldr     r0, [sp, #0x50]
00091178  blx     #0xddbfc ; -> objc_msgSend
0009117c  add     r2, sp, #0x104
0009117e  movs    r3, #0xb
00091180  adds    r2, #1
00091182  str     r3, [sp, #0x9c]
00091184  mov     r1, r0
00091186  add     r0, sp, #0xe0
00091188  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009118c  ldr     r1, [sp, #0x6c]
0009118e  movs    r3, #0xa
00091190  str     r3, [sp, #0x9c]
00091192  add.w   r0, r1, #8
00091196  add     r1, sp, #0xe0
00091198  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009119c  ldr     r3, [sp, #0xe0]
0009119e  ldr     r2, [sp, #0x90]
000911a0  sub.w   r0, r3, #0xc
000911a4  cmp     r2, r0
000911a6  bne.w   #0x9144e
000911aa  ldr.w   r3, [pc, #0x6dc]
000911ae  ldr     r0, [sp, #0x54]
000911b0  add     r3, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000911b2  ldr     r3, [r3]
000911b4  str     r3, [sp, #0x44]
000911b6  ldr     r1, [sp, #0x44]
000911b8  mov.w   r3, #-1
000911bc  str     r3, [sp, #0x9c]
000911be  blx     #0xddbfc ; -> objc_msgSend
000911c2  ldr     r1, [sp, #0x6c]
000911c4  str     r0, [r1, #0xc]
000911c6  ldr     r1, [sp, #0x40]
000911c8  ldr     r0, [sp, #0x3c]
000911ca  blx     #0xddbfc ; -> objc_msgSend
000911ce  ldr     r1, [sp, #0x38]
000911d0  mov     r2, r0
000911d2  ldr     r0, [sp, #0x5c]
000911d4  blx     #0xddbfc ; -> objc_msgSend
000911d8  movs    r3, #9
000911da  add     r2, sp, #0x104
000911dc  str     r3, [sp, #0x9c]
000911de  mov     r1, r0
000911e0  add     r0, sp, #0xdc
000911e2  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000911e6  ldr     r1, [sp, #0x6c]
000911e8  movs    r3, #8
000911ea  str     r3, [sp, #0x9c]
000911ec  add.w   r0, r1, #0x10
000911f0  add     r1, sp, #0xdc
000911f2  blx     #0xdd518 ; -> ZNSs6assignERKSs
000911f6  ldr     r3, [sp, #0xdc]
000911f8  ldr     r2, [sp, #0x90]
000911fa  sub.w   r0, r3, #0xc
000911fe  cmp     r2, r0
00091200  bne.w   #0x91424
00091204  ldr     r1, [sp, #0x58]
00091206  cbz     r1, #0x9124e
00091208  ldr     r1, [sp, #0x40]
0009120a  ldr     r0, [sp, #0x3c]
0009120c  mov.w   r3, #-1
00091210  str     r3, [sp, #0x9c]
00091212  blx     #0xddbfc ; -> objc_msgSend
00091216  ldr     r1, [sp, #0x38]
00091218  mov     r2, r0
0009121a  ldr     r0, [sp, #0x58]
0009121c  blx     #0xddbfc ; -> objc_msgSend
00091220  add     r2, sp, #0x100
00091222  movs    r3, #7
00091224  adds    r2, #3
00091226  str     r3, [sp, #0x9c]
00091228  mov     r1, r0
0009122a  add     r0, sp, #0xd8
0009122c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00091230  ldr     r1, [sp, #0x6c]
00091232  movs    r3, #6
00091234  str     r3, [sp, #0x9c]
00091236  add.w   r0, r1, #0x14
0009123a  add     r1, sp, #0xd8
0009123c  blx     #0xdd518 ; -> ZNSs6assignERKSs
00091240  ldr     r3, [sp, #0xd8]
00091242  ldr     r2, [sp, #0x90]
00091244  sub.w   r0, r3, #0xc
00091248  cmp     r2, r0
0009124a  bne.w   #0x914d0
0009124e  ldr     r1, [sp, #0x64]
00091250  cbz     r1, #0x91264
00091252  mov     r0, r1
00091254  ldr     r1, [sp, #0x44]
00091256  mov.w   r3, #-1
0009125a  str     r3, [sp, #0x9c]
0009125c  blx     #0xddbfc ; -> objc_msgSend
00091260  ldr     r2, [sp, #0x6c]
00091262  str     r0, [r2, #0x18]
00091264  ldr     r1, [sp, #0x40]
00091266  ldr     r0, [sp, #0x3c]
00091268  mov.w   r3, #-1
0009126c  str     r3, [sp, #0x9c]
0009126e  blx     #0xddbfc ; -> objc_msgSend
00091272  ldr     r1, [sp, #0x38]
00091274  mov     r2, r0
00091276  ldr     r0, [sp, #0x60]
00091278  blx     #0xddbfc ; -> objc_msgSend
0009127c  movs    r3, #5
0009127e  add.w   r2, sp, #0x102
00091282  str     r3, [sp, #0x9c]
00091284  mov     r1, r0
00091286  add     r0, sp, #0xd4
00091288  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009128c  ldr     r3, [sp, #0x6c]
0009128e  add     r1, sp, #0xd4
00091290  add.w   r0, r3, #0x1c
00091294  movs    r3, #4
00091296  str     r3, [sp, #0x9c]
00091298  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009129c  ldr     r3, [sp, #0xd4]
0009129e  ldr     r4, [sp, #0x90]
000912a0  sub.w   r0, r3, #0xc
000912a4  cmp     r4, r0
000912a6  bne.w   #0x913c8
000912aa  ldr     r1, [sp, #0x68]
000912ac  cmp     r1, #0
000912ae  beq     #0x9133a
000912b0  ldr     r1, [sp, #0x40]
000912b2  ldr     r0, [sp, #0x3c]
000912b4  mov.w   r3, #-1
000912b8  str     r3, [sp, #0x9c]
000912ba  blx     #0xddbfc ; -> objc_msgSend
000912be  ldr     r1, [sp, #0x38]
000912c0  mov     r2, r0
000912c2  ldr     r0, [sp, #0x68]
000912c4  blx     #0xddbfc ; -> objc_msgSend
000912c8  add     r2, sp, #0x100
000912ca  movs    r3, #3
000912cc  adds    r2, #1
000912ce  str     r3, [sp, #0x9c]
000912d0  mov     r1, r0
000912d2  add     r0, sp, #0xd0
000912d4  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000912d8  ldr     r1, [sp, #0x6c]
000912da  movs    r3, #2
000912dc  str     r3, [sp, #0x9c]
000912de  add.w   r0, r1, #0x20
000912e2  add     r1, sp, #0xd0
000912e4  blx     #0xdd518 ; -> ZNSs6assignERKSs
000912e8  ldr     r3, [sp, #0xd0]
000912ea  ldr     r2, [sp, #0x90]
000912ec  sub.w   r0, r3, #0xc
000912f0  cmp     r2, r0
000912f2  bne.w   #0x914a4
000912f6  ldr     r1, [sp, #0x6c]
000912f8  add.w   r0, r1, #0x20
000912fc  ldr     r3, [r1, #0x20]
000912fe  ldr     r3, [r3, #-0x4]
00091302  cmp     r3, #0
00091304  bge     #0x91386
00091306  ldr     r1, [sp, #0x6c]
00091308  add.w   r0, r1, #0x20
0009130c  ldr     r2, [r1, #0x20]
0009130e  str     r2, [sp, #0x94]
00091310  ldr     r3, [r2, #-0x4]
00091314  cmp     r3, #0
00091316  bge     #0x91392
00091318  ldr     r3, [sp, #0x6c]
0009131a  ldr     r0, [sp, #0x94]
0009131c  add     r2, sp, #0x100
0009131e  ldr     r1, [r3, #0x20]
00091320  ldr     r3, [r1, #-0xc]
00091324  adds    r1, r1, r3
00091326  movs    r3, #0x20
00091328  strb.w  r3, [sp, #0x100]
0009132c  adds    r3, #0xb
0009132e  strb.w  r3, [sp, #0xff]
00091332  add.w   r3, sp, #0xff
00091336  bl      #0x9a5b0 ; -> ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_
0009133a  ldr     r4, [sp, #0x6c]
0009133c  add     r0, sp, #0xcc
0009133e  mov.w   r3, #-1
00091342  add.w   r1, r4, #0x10
00091346  str     r3, [sp, #0x9c]
00091348  bl      #0x8b540 ; -> ZN6Mayhem4Stat13StatIDFromURIERKSs
0009134c  ldr.w   r0, [pc, #0x53c]
00091350  movs    r3, #1
00091352  add     r1, sp, #0xcc
00091354  add     r0, pc ; -> 0x00379c00  ZN6Mayhem4Stat14s_statDatabaseE
00091356  str     r3, [sp, #0x9c]
00091358  ldr     r2, [sp, #0x6c]
0009135a  bl      #0x90900 ; -> ZN6Mayhem12StatDatabase11AddStatInfoERKSsPNS_8StatInfoE
0009135e  ldr     r1, [sp, #4]
00091360  str     r0, [r1, #4]
00091362  ldr     r3, [sp, #0xcc]
00091364  ldr     r2, [sp, #0x90]
00091366  sub.w   r0, r3, #0xc
0009136a  cmp     r2, r0
0009136c  bne     #0x9139e
0009136e  add     r0, sp, #0x98
00091370  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00091374  sub.w   sp, r7, #0x58
00091378  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009137c  sub.w   sp, r7, #0x18
00091380  pop.w   {r8, sl, fp}
00091384  pop     {r4, r5, r6, r7, pc}
00091386  mov.w   r3, #-1
0009138a  str     r3, [sp, #0x9c]
0009138c  blx     #0xdd4dc ; -> ZNSs12_M_leak_hardEv
00091390  b       #0x91306
00091392  mov.w   r3, #-1
00091396  str     r3, [sp, #0x9c]
00091398  blx     #0xdd4dc ; -> ZNSs12_M_leak_hardEv
0009139c  b       #0x91318
0009139e  subs    r2, r3, #4
000913a0  ldr     r3, [r3, #-0x4]
000913a4  subs    r1, r3, #1
000913a6  dmb     ish
000913aa  mov     ip, r3
000913ac  ldrex   r4, [r2]
000913b0  cmp     r4, r3
000913b2  beq.w   #0x9150c
000913b6  cmp     r4, ip
000913b8  mov     r3, r4
000913ba  bne     #0x913a4
000913bc  cmp     r4, #0
000913be  bgt     #0x9136e
000913c0  add     r1, sp, #0xf0
000913c2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000913c6  b       #0x9136e
000913c8  subs    r2, r3, #4
000913ca  ldr     r3, [r3, #-0x4]
000913ce  subs    r1, r3, #1
000913d0  dmb     ish
000913d4  mov     ip, r3
000913d6  ldrex   lr, [r2]
000913da  cmp     lr, r3
000913dc  beq.w   #0x91552
000913e0  cmp     lr, ip
000913e2  mov     r3, lr
000913e4  bne     #0x913ce
000913e6  cmp.w   lr, #0
000913ea  bgt.w   #0x912aa
000913ee  add     r1, sp, #0xf4
000913f0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000913f4  b       #0x912aa
000913f6  subs    r2, r3, #4
000913f8  ldr     r3, [r3, #-0x4]
000913fc  subs    r1, r3, #1
000913fe  dmb     ish
00091402  mov     ip, r3
00091404  ldrex   r4, [r2]
00091408  cmp     r4, r3
0009140a  beq.w   #0x91540
0009140e  cmp     r4, ip
00091410  mov     r3, r4
00091412  bne     #0x913fc
00091414  cmp     r4, #0
00091416  bgt.w   #0x91120
0009141a  add.w   r1, sp, #0xfe
0009141e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091422  b       #0x91120
00091424  subs    r2, r3, #4
00091426  ldr     r3, [r3, #-0x4]
0009142a  subs    r1, r3, #1
0009142c  dmb     ish
00091430  mov     ip, r3
00091432  ldrex   r4, [r2]
00091436  cmp     r4, r3
00091438  beq     #0x9152e
0009143a  cmp     r4, ip
0009143c  mov     r3, r4
0009143e  bne     #0x9142a
00091440  cmp     r4, #0
00091442  bgt.w   #0x91204
00091446  add     r1, sp, #0xf8
00091448  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009144c  b       #0x91204
0009144e  subs    r2, r3, #4
00091450  ldr     r3, [r3, #-0x4]
00091454  subs    r1, r3, #1
00091456  dmb     ish
0009145a  mov     ip, r3
0009145c  ldrex   r4, [r2]
00091460  cmp     r4, r3
00091462  beq     #0x9151e
00091464  cmp     r4, ip
00091466  mov     r3, r4
00091468  bne     #0x91454
0009146a  cmp     r4, #0
0009146c  bgt.w   #0x911aa
00091470  add.w   r1, sp, #0xfa
00091474  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091478  b       #0x911aa
0009147a  subs    r2, r3, #4
0009147c  ldr     r3, [r3, #-0x4]
00091480  subs    r1, r3, #1
00091482  dmb     ish
00091486  mov     ip, r3
00091488  ldrex   r4, [r2]
0009148c  cmp     r4, r3
0009148e  beq     #0x914fc
00091490  cmp     r4, ip
00091492  mov     r3, r4
00091494  bne     #0x91480
00091496  cmp     r4, #0
00091498  bgt.w   #0x91164
0009149c  add     r1, sp, #0xfc
0009149e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000914a2  b       #0x91164
000914a4  subs    r2, r3, #4
000914a6  ldr     r3, [r3, #-0x4]
000914aa  subs    r1, r3, #1
000914ac  dmb     ish
000914b0  mov     ip, r3
000914b2  ldrex   r4, [r2]
000914b6  cmp     r4, r3
000914b8  beq     #0x91562
000914ba  cmp     r4, ip
000914bc  mov     r3, r4
000914be  bne     #0x914aa
000914c0  cmp     r4, #0
000914c2  bgt.w   #0x912f6
000914c6  add.w   r1, sp, #0xf2
000914ca  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000914ce  b       #0x912f6
000914d0  subs    r2, r3, #4
000914d2  ldr     r3, [r3, #-0x4]
000914d6  subs    r1, r3, #1
000914d8  dmb     ish
000914dc  mov     ip, r3
000914de  ldrex   r4, [r2]
000914e2  cmp     r4, r3
000914e4  beq     #0x91572
000914e6  cmp     r4, ip
000914e8  mov     r3, r4
000914ea  bne     #0x914d6
000914ec  cmp     r4, #0
000914ee  bgt.w   #0x9124e
000914f2  add.w   r1, sp, #0xf6
000914f6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000914fa  b       #0x9124e
000914fc  strex   lr, r1, [r2]
00091500  cmp.w   lr, #0
00091504  bne     #0x91488
00091506  dmb     ish
0009150a  b       #0x91490
0009150c  strex   lr, r1, [r2]
00091510  cmp.w   lr, #0
00091514  bne.w   #0x913ac
00091518  dmb     ish
0009151c  b       #0x913b6
0009151e  strex   lr, r1, [r2]
00091522  cmp.w   lr, #0
00091526  bne     #0x9145c
00091528  dmb     ish
0009152c  b       #0x91464
0009152e  strex   lr, r1, [r2]
00091532  cmp.w   lr, #0
00091536  bne.w   #0x91432
0009153a  dmb     ish
0009153e  b       #0x9143a
00091540  strex   lr, r1, [r2]
00091544  cmp.w   lr, #0
00091548  bne.w   #0x91404
0009154c  dmb     ish
00091550  b       #0x9140e
00091552  strex   r4, r1, [r2]
00091556  cmp     r4, #0
00091558  bne.w   #0x913d6
0009155c  dmb     ish
00091560  b       #0x913e0
00091562  strex   lr, r1, [r2]
00091566  cmp.w   lr, #0
0009156a  bne     #0x914b2
0009156c  dmb     ish
00091570  b       #0x914ba
00091572  strex   lr, r1, [r2]
00091576  cmp.w   lr, #0
0009157a  bne     #0x914de
0009157c  dmb     ish
00091580  b       #0x914e6
00091582  ldr     r3, [sp, #0x9c]
00091584  ldr     r0, [sp, #0xa0]
00091586  cmp     r3, #1
00091588  beq     #0x915e0
0009158a  cmp     r3, #2
0009158c  beq     #0x915d6
0009158e  cmp     r3, #3
00091590  beq.w   #0x9177c
00091594  cmp     r3, #4
00091596  beq     #0x915d6
00091598  cmp     r3, #5
0009159a  beq.w   #0x9176a
0009159e  cmp     r3, #6
000915a0  beq     #0x915d6
000915a2  cmp     r3, #7
000915a4  beq     #0x9166a
000915a6  cmp     r3, #8
000915a8  beq     #0x915d6
000915aa  cmp     r3, #9
000915ac  beq     #0x91658
000915ae  cmp     r3, #0xa
000915b0  beq     #0x915d6
000915b2  cmp     r3, #0xb
000915b4  beq.w   #0x916f4
000915b8  cmp     r3, #0xc
000915ba  beq     #0x915d6
000915bc  cmp     r3, #0xd
000915be  beq.w   #0x916e2
000915c2  cmp     r3, #0xe
000915c4  beq     #0x915d6
000915c6  ldr     r3, [sp, #0xcc]
000915c8  ldr     r1, [sp, #0x90]
000915ca  str     r0, [sp, #0x8c]
000915cc  sub.w   r0, r3, #0xc
000915d0  cmp     r1, r0
000915d2  bne     #0x915f2
000915d4  ldr     r0, [sp, #0x8c]
000915d6  mov.w   r3, #-1
000915da  str     r3, [sp, #0x9c]
000915dc  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
000915e0  ldr     r3, [sp, #0xd0]
000915e2  ldr     r2, [sp, #0x90]
000915e4  str     r0, [sp, #0x88]
000915e6  sub.w   r0, r3, #0xc
000915ea  cmp     r2, r0
000915ec  bne     #0x9161c
000915ee  ldr     r0, [sp, #0x88]
000915f0  b       #0x915d6
000915f2  subs    r2, r3, #4
000915f4  ldr     r3, [r3, #-0x4]
000915f8  subs    r1, r3, #1
000915fa  dmb     ish
000915fe  mov     ip, r3
00091600  ldrex   r4, [r2]
00091604  cmp     r4, r3
00091606  beq     #0x91648
00091608  cmp     r4, ip
0009160a  mov     r3, r4
0009160c  bne     #0x915f8
0009160e  cmp     r4, #0
00091610  bgt     #0x915d4
00091612  add.w   r1, sp, #0xef
00091616  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009161a  b       #0x915d4
0009161c  subs    r2, r3, #4
0009161e  ldr     r3, [r3, #-0x4]
00091622  subs    r1, r3, #1
00091624  dmb     ish
00091628  mov     ip, r3
0009162a  ldrex   r4, [r2]
0009162e  cmp     r4, r3
00091630  beq.w   #0x917f2
00091634  cmp     r4, ip
00091636  mov     r3, r4
00091638  bne     #0x91622
0009163a  cmp     r4, #0
0009163c  bgt     #0x915ee
0009163e  add.w   r1, sp, #0xf1
00091642  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091646  b       #0x915ee
00091648  strex   lr, r1, [r2]
0009164c  cmp.w   lr, #0
00091650  bne     #0x91600
00091652  dmb     ish
00091656  b       #0x91608
00091658  ldr     r3, [sp, #0xe0]
0009165a  ldr     r2, [sp, #0x90]
0009165c  str     r0, [sp, #0x78]
0009165e  sub.w   r0, r3, #0xc
00091662  cmp     r2, r0
00091664  bne     #0x9167c
00091666  ldr     r0, [sp, #0x78]
00091668  b       #0x915d6
0009166a  ldr     r3, [sp, #0xdc]
0009166c  ldr     r2, [sp, #0x90]
0009166e  str     r0, [sp, #0x7c]
00091670  sub.w   r0, r3, #0xc
00091674  cmp     r2, r0
00091676  bne     #0x916a6
00091678  ldr     r0, [sp, #0x7c]
0009167a  b       #0x915d6
0009167c  subs    r2, r3, #4
0009167e  ldr     r3, [r3, #-0x4]
00091682  subs    r1, r3, #1
00091684  dmb     ish
00091688  mov     ip, r3
0009168a  ldrex   r4, [r2]
0009168e  cmp     r4, r3
00091690  beq     #0x916d2
00091692  cmp     r4, ip
00091694  mov     r3, r4
00091696  bne     #0x91682
00091698  cmp     r4, #0
0009169a  bgt     #0x91666
0009169c  add.w   r1, sp, #0xf9
000916a0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000916a4  b       #0x91666
000916a6  subs    r2, r3, #4
000916a8  ldr     r3, [r3, #-0x4]
000916ac  subs    r1, r3, #1
000916ae  dmb     ish
000916b2  mov     ip, r3
000916b4  ldrex   r4, [r2]
000916b8  cmp     r4, r3
000916ba  beq.w   #0x91814
000916be  cmp     r4, ip
000916c0  mov     r3, r4
000916c2  bne     #0x916ac
000916c4  cmp     r4, #0
000916c6  bgt     #0x91678
000916c8  add.w   r1, sp, #0xf7
000916cc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000916d0  b       #0x91678
000916d2  strex   lr, r1, [r2]
000916d6  cmp.w   lr, #0
000916da  bne     #0x9168a
000916dc  dmb     ish
000916e0  b       #0x91692
000916e2  ldr     r3, [sp, #0xe8]
000916e4  ldr     r1, [sp, #0x90]
000916e6  str     r0, [sp, #0x70]
000916e8  sub.w   r0, r3, #0xc
000916ec  cmp     r1, r0
000916ee  bne     #0x91706
000916f0  ldr     r0, [sp, #0x70]
000916f2  b       #0x915d6
000916f4  ldr     r3, [sp, #0xe4]
000916f6  ldr     r1, [sp, #0x90]
000916f8  str     r0, [sp, #0x74]
000916fa  sub.w   r0, r3, #0xc
000916fe  cmp     r1, r0
00091700  bne     #0x91730
00091702  ldr     r0, [sp, #0x74]
00091704  b       #0x915d6
00091706  subs    r2, r3, #4
00091708  ldr     r3, [r3, #-0x4]
0009170c  subs    r1, r3, #1
0009170e  dmb     ish
00091712  mov     ip, r3
00091714  ldrex   r4, [r2]
00091718  cmp     r4, r3
0009171a  beq     #0x9175a
0009171c  cmp     r4, ip
0009171e  mov     r3, r4
00091720  bne     #0x9170c
00091722  cmp     r4, #0
00091724  bgt     #0x916f0
00091726  add.w   r1, sp, #0xfd
0009172a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0009172e  b       #0x916f0
00091730  subs    r2, r3, #4
00091732  ldr     r3, [r3, #-0x4]
00091736  subs    r1, r3, #1
00091738  dmb     ish
0009173c  mov     ip, r3
0009173e  ldrex   r4, [r2]
00091742  cmp     r4, r3
00091744  beq     #0x91804
00091746  cmp     r4, ip
00091748  mov     r3, r4
0009174a  bne     #0x91736
0009174c  cmp     r4, #0
0009174e  bgt     #0x91702
00091750  add.w   r1, sp, #0xfb
00091754  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00091758  b       #0x91702
0009175a  strex   lr, r1, [r2]
0009175e  cmp.w   lr, #0
00091762  bne     #0x91714
00091764  dmb     ish
00091768  b       #0x9171c
0009176a  ldr     r3, [sp, #0xd8]
0009176c  ldr     r1, [sp, #0x90]
0009176e  str     r0, [sp, #0x80]
00091770  sub.w   r0, r3, #0xc
00091774  cmp     r1, r0
00091776  bne     #0x9178e
00091778  ldr     r0, [sp, #0x80]
0009177a  b       #0x915d6
0009177c  ldr     r3, [sp, #0xd4]
0009177e  ldr     r2, [sp, #0x90]
00091780  str     r0, [sp, #0x84]
00091782  sub.w   r0, r3, #0xc
00091786  cmp     r2, r0
00091788  bne     #0x917b8
0009178a  ldr     r0, [sp, #0x84]
0009178c  b       #0x915d6
0009178e  subs    r2, r3, #4
00091790  ldr     r3, [r3, #-0x4]
00091794  subs    r1, r3, #1
00091796  dmb     ish
0009179a  mov     ip, r3
0009179c  ldrex   r4, [r2]
000917a0  cmp     r4, r3
000917a2  beq     #0x917e2
000917a4  cmp     r4, ip
000917a6  mov     r3, r4
000917a8  bne     #0x91794
000917aa  cmp     r4, #0
000917ac  bgt     #0x91778
000917ae  add.w   r1, sp, #0xf5
000917b2  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000917b6  b       #0x91778
000917b8  subs    r2, r3, #4
000917ba  ldr     r3, [r3, #-0x4]
000917be  subs    r1, r3, #1
000917c0  dmb     ish
000917c4  mov     ip, r3
000917c6  ldrex   r4, [r2]
000917ca  cmp     r4, r3
000917cc  beq     #0x91826
000917ce  cmp     r4, ip
000917d0  mov     r3, r4
000917d2  bne     #0x917be
000917d4  cmp     r4, #0
000917d6  bgt     #0x9178a
000917d8  add.w   r1, sp, #0xf3
000917dc  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000917e0  b       #0x9178a
000917e2  strex   lr, r1, [r2]
000917e6  cmp.w   lr, #0
000917ea  bne     #0x9179c
000917ec  dmb     ish
000917f0  b       #0x917a4
000917f2  strex   lr, r1, [r2]
000917f6  cmp.w   lr, #0
000917fa  bne.w   #0x9162a
000917fe  dmb     ish
00091802  b       #0x91634
00091804  strex   lr, r1, [r2]
00091808  cmp.w   lr, #0
0009180c  bne     #0x9173e
0009180e  dmb     ish
00091812  b       #0x91746
00091814  strex   lr, r1, [r2]
00091818  cmp.w   lr, #0
0009181c  bne.w   #0x916b4
00091820  dmb     ish
00091824  b       #0x916be
00091826  strex   lr, r1, [r2]
0009182a  cmp.w   lr, #0
0009182e  bne     #0x917c6
00091830  dmb     ish
00091834  b       #0x917ce
00091836  nop     
00091838  movs    r5, #0x6e
0009183a  movs    r6, r0
0009183c  bpl     #0x9186c
0009183e  movs    r5, r0
00091840  lsls    r6, r3, #0x1a
00091842  movs    r0, r0
00091844  stm     r0!, {r1, r2, r5, r7}
00091846  movs    r6, r0
00091848  cbnz    r0, #0x918bc
0009184a  movs    r6, r0
0009184c  b       #0x91c4c
0009184e  movs    r6, r1
00091850  cbnz    r4, #0x918a8
00091852  movs    r6, r0
00091854  b       #0x91c18
00091856  movs    r6, r1
00091858  b       #0x91c00
0009185a  movs    r6, r1
0009185c  b       #0x919c8
0009185e  movs    r6, r1
00091860  b       #0x91bb0
00091862  movs    r6, r1
00091864  b       #0x91b98
00091866  movs    r6, r1
00091868  b       #0x91b80
0009186a  movs    r6, r1
0009186c  pop     {r2, r3, r4, r5}
0009186e  movs    r6, r0
00091870  b       #0x9192c
00091872  movs    r6, r1
00091874  svc     #0xda
00091876  movs    r6, r1
00091878  movs    r2, #0xc4
0009187a  movs    r6, r0
0009187c  bkpt    #0x9a
0009187e  movs    r6, r0
00091880  ldm     r2, {r2, r7}
00091882  movs    r6, r0
00091884  bkpt    #0x74
00091886  movs    r6, r0
00091888  cbnz    r4, #0x91898
0009188a  movs    r6, r0
0009188c  ldrh    r0, [r5, #4]
0009188e  movs    r6, r5
