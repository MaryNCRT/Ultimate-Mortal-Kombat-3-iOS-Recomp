========================================================================
ZN6Mayhem15PostUserRequest3runEv  0x000960c4  7288 bytes   Mayhem.mm
========================================================================

000960c4  push    {r4, r5, r6, r7, lr}
000960c6  add     r7, sp, #0xc
000960c8  push.w  {r8, sl, fp}
000960cc  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000960d0  sub.w   sp, sp, #0x258
000960d4  ldr.w   r3, [pc, #0xae8]
000960d8  str     r0, [sp, #0x4c]
000960da  add     r0, sp, #0x150
000960dc  add     r3, pc ; -> 0x000f3438  0x0
000960de  str     r7, [sp, #0x170]
000960e0  ldr     r3, [r3]
000960e2  str.w   sp, [sp, #0x178]
000960e6  str     r3, [sp, #0x168]
000960e8  ldr.w   r3, [pc, #0xad8]
000960ec  add     r3, pc ; -> 0x000ee502  GCC_except_table92
000960ee  str     r3, [sp, #0x16c]
000960f0  ldr.w   r3, [pc, #0xad4]
000960f4  add     r3, pc ; -> 0x00097162  
000960f6  orr     r3, r3, #1
000960fa  str     r3, [sp, #0x174]
000960fc  blx     #0xdd4ac ; -> Unwind_SjLj_Register
00096100  ldr.w   r3, [pc, #0xac8]
00096104  ldr.w   r0, [pc, #0xac8]
00096108  add     r1, sp, #0x154
0009610a  add     r3, pc ; -> 0x000fdb5c  
0009610c  str     r1, [sp, #0x3c]
0009610e  ldr     r3, [r3]
00096110  add     r0, pc ; -> 0x0017f3c4  
00096112  str     r0, [sp, #0x48]
00096114  add     r0, sp, #0x210
00096116  str     r3, [sp, #0x50]
00096118  ldr.w   r3, [pc, #0xab8]
0009611c  add     r3, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
0009611e  ldr     r3, [r3]
00096120  str     r3, [sp, #0x54]
00096122  mov.w   r3, #-1
00096126  str     r3, [r1]
00096128  bl      #0x8bb28 ; -> ZN6Mayhem12getMayhemURLEv
0009612c  ldr     r2, [sp, #0x210]
0009612e  ldr     r4, [sp, #0x3c]
00096130  movs    r3, #0x28
00096132  str     r2, [sp, #0x10c]
00096134  str     r3, [r4]
00096136  ldr     r0, [sp, #0x50]
00096138  ldr     r1, [sp, #0x54]
0009613a  ldr     r2, [sp, #0x48]
0009613c  ldr     r3, [sp, #0x10c]
0009613e  blx     #0xddbfc ; -> objc_msgSend
00096142  ldr.w   r3, [pc, #0xa94]
00096146  ldr     r1, [sp, #0x10c]
00096148  str     r0, [sp, #0x58]
0009614a  add     r3, pc ; -> 0x000f3370  0x0
0009614c  sub.w   r0, r1, #0xc
00096150  ldr     r3, [r3]
00096152  cmp     r0, r3
00096154  str     r3, [sp, #0x110]
00096156  bne.w   #0x96a44
0009615a  ldr.w   r3, [pc, #0xa80]
0009615e  add     r0, sp, #0x154
00096160  str     r0, [sp, #0x38]
00096162  add     r3, pc ; -> 0x000fcf68  
00096164  ldr     r3, [r3]
00096166  str     r3, [sp, #0x5c]
00096168  ldr.w   r3, [pc, #0xa74]
0009616c  add     r3, pc ; -> 0x000fcf58  
0009616e  ldr     r3, [r3]
00096170  str     r3, [sp, #0x60]
00096172  mov.w   r3, #-1
00096176  str     r3, [r0]
00096178  ldr     r1, [sp, #0x60]
0009617a  ldr     r0, [sp, #0x50]
0009617c  blx     #0xddbfc ; -> objc_msgSend
00096180  ldr     r1, [sp, #0x5c]
00096182  mov     r2, r0
00096184  ldr     r0, [sp, #0x58]
00096186  blx     #0xddbfc ; -> objc_msgSend
0009618a  ldr     r2, [sp, #0x38]
0009618c  movs    r3, #0x27
0009618e  str     r3, [r2]
00096190  add     r2, sp, #0x250
00096192  adds    r2, #7
00096194  mov     r1, r0
00096196  add     r0, sp, #0x20c
00096198  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009619c  add     r3, sp, #0x154
0009619e  movs    r2, #0x26
000961a0  str     r2, [r3]
000961a2  add     r0, sp, #0x184
000961a4  add     r1, sp, #0x20c
000961a6  bl      #0x8b474 ; -> ZN6Mayhem11HTTPRequestC1ERKSs
000961aa  ldr     r3, [sp, #0x20c]
000961ac  ldr     r1, [sp, #0x110]
000961ae  sub.w   r0, r3, #0xc
000961b2  cmp     r1, r0
000961b4  bne.w   #0x96a16
000961b8  ldr.w   r1, [pc, #0xa28]
000961bc  add     r3, sp, #0x154
000961be  movs    r2, #0x25
000961c0  str     r2, [r3]
000961c2  add     r2, sp, #0x250
000961c4  add     r1, pc ; -> 0x00175f5c  'POST'
000961c6  add     r0, sp, #0x208
000961c8  adds    r2, #6
000961ca  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000961ce  add     r3, sp, #0x154
000961d0  movs    r2, #0x24
000961d2  str     r2, [r3]
000961d4  add     r0, sp, #0x184
000961d6  add     r1, sp, #0x208
000961d8  bl      #0x8b3e8 ; -> ZN6Mayhem11HTTPRequest9SetMethodERKSs
000961dc  ldr     r3, [sp, #0x208]
000961de  ldr     r1, [sp, #0x110]
000961e0  sub.w   r0, r3, #0xc
000961e4  cmp     r1, r0
000961e6  bne.w   #0x96a74
000961ea  ldr     r0, [sp, #0x110]
000961ec  ldr.w   r1, [pc, #0x9f8]
000961f0  add     r2, sp, #0x154
000961f2  adds    r0, #0xc
000961f4  str     r0, [sp, #0x114]
000961f6  str     r0, [sp, #0x204]
000961f8  str     r0, [sp, #0x200]
000961fa  str     r0, [sp, #0x1fc]
000961fc  str     r0, [sp, #0x1f8]
000961fe  ldr.w   r0, [pc, #0x9ec]
00096202  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
00096204  str     r2, [sp, #0x34]
00096206  add     r0, pc ; -> 0x000fdb50  
00096208  movs    r3, #0x23
0009620a  ldr     r0, [r0]
0009620c  ldr     r1, [r1]
0009620e  str     r3, [r2]
00096210  blx     #0xddbfc ; -> objc_msgSend
00096214  ldr.w   r1, [pc, #0x9d8]
00096218  ldr     r4, [sp, #0x34]
0009621a  movs    r2, #0x23
0009621c  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
0009621e  str     r2, [r4]
00096220  ldr     r1, [r1]
00096222  blx     #0xddbfc ; -> objc_msgSend
00096226  str     r0, [sp, #0x64]
00096228  ldr     r1, [sp, #0x60]
0009622a  ldr     r0, [sp, #0x50]
0009622c  blx     #0xddbfc ; -> objc_msgSend
00096230  mov     r2, r0
00096232  ldr     r1, [sp, #0x5c]
00096234  ldr     r0, [sp, #0x64]
00096236  blx     #0xddbfc ; -> objc_msgSend
0009623a  add     r2, sp, #0x250
0009623c  mov     r1, r0
0009623e  movs    r3, #0x22
00096240  add     r0, sp, #0x1f4
00096242  str     r3, [r4]
00096244  adds    r2, #5
00096246  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009624a  ldr     r4, [sp, #0x4c]
0009624c  add.w   r2, r4, #0x60
00096250  ldm     r2, {r2, r3}
00096252  cmp.w   r2, #-1
00096256  beq.w   #0x96912
0009625a  ldr.w   r1, [pc, #0x998]
0009625e  add     r3, sp, #0x154
00096260  movs    r2, #0x21
00096262  add     r1, pc ; -> 0x000e4d98  'facebook'
00096264  str     r2, [r3]
00096266  add     r0, sp, #0x204
00096268  subs    r2, #0x19
0009626a  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0009626e  add     r0, sp, #0x1fc
00096270  add     r1, sp, #0x204
00096272  blx     #0xdd518 ; -> ZNSs6assignERKSs
00096276  ldr     r2, [sp, #0x4c]
00096278  add     r0, sp, #0x1f8
0009627a  add.w   r1, r2, #0x68
0009627e  blx     #0xdd518 ; -> ZNSs6assignERKSs
00096282  ldr     r0, [sp, #0x4c]
00096284  ldr.w   r2, [pc, #0x970]
00096288  ldr     r1, [sp, #0x54]
0009628a  add.w   r3, r0, #0x60
0009628e  ldm     r3, {r3, r4}
00096290  add     r2, pc ; -> 0x0017ede4  
00096292  ldr     r0, [sp, #0x50]
00096294  str     r4, [sp]
00096296  blx     #0xddbfc ; -> objc_msgSend
0009629a  str     r0, [sp, #0x68]
0009629c  ldr     r1, [sp, #0x60]
0009629e  ldr     r0, [sp, #0x50]
000962a0  blx     #0xddbfc ; -> objc_msgSend
000962a4  mov     r2, r0
000962a6  ldr     r1, [sp, #0x5c]
000962a8  ldr     r0, [sp, #0x68]
000962aa  blx     #0xddbfc ; -> objc_msgSend
000962ae  str     r0, [sp, #0x118]
000962b0  blx     #0xdde0c ; -> strlen
000962b4  ldr     r1, [sp, #0x118]
000962b6  mov     r2, r0
000962b8  add     r0, sp, #0x200
000962ba  blx     #0xdd50c ; -> ZNSs6assignEPKcm
000962be  ldr.w   r1, [pc, #0x93c]
000962c2  add     r2, sp, #0x154
000962c4  movs    r3, #0x20
000962c6  str     r2, [sp, #0x30]
000962c8  add     r1, pc ; -> 0x00175f64  'mh_auth_method'
000962ca  str     r3, [r2]
000962cc  add     r0, sp, #0x1f0
000962ce  add     r2, sp, #0x254
000962d0  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
000962d4  ldr     r4, [sp, #0x30]
000962d6  movs    r3, #0x1f
000962d8  add     r0, sp, #0x184
000962da  add     r1, sp, #0x1f0
000962dc  str     r3, [r4]
000962de  add     r2, sp, #0x1fc
000962e0  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
000962e4  ldr     r3, [sp, #0x1f0]
000962e6  ldr     r1, [sp, #0x110]
000962e8  sub.w   r0, r3, #0xc
000962ec  cmp     r1, r0
000962ee  bne.w   #0x969ea
000962f2  ldr.w   r1, [pc, #0x90c]
000962f6  add     r0, sp, #0x154
000962f8  add     r2, sp, #0x250
000962fa  str     r0, [sp, #0x2c]
000962fc  movs    r3, #0x1e
000962fe  add     r1, pc ; -> 0x00175f74  'mh_auth_params'
00096300  str     r3, [r0]
00096302  adds    r2, #3
00096304  add     r0, sp, #0x1ec
00096306  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009630a  ldr     r1, [sp, #0x2c]
0009630c  movs    r3, #0x1d
0009630e  add     r0, sp, #0x184
00096310  add     r2, sp, #0x1f8
00096312  str     r3, [r1]
00096314  add     r1, sp, #0x1ec
00096316  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
0009631a  ldr     r3, [sp, #0x1ec]
0009631c  ldr     r1, [sp, #0x110]
0009631e  sub.w   r0, r3, #0xc
00096322  cmp     r1, r0
00096324  bne.w   #0x969bc
00096328  ldr.w   r1, [pc, #0x8d8]
0009632c  add     r0, sp, #0x154
0009632e  add     r2, sp, #0x250
00096330  str     r0, [sp, #0x28]
00096332  movs    r3, #0x1c
00096334  add     r1, pc ; -> 0x00175f84  'iphone_udid'
00096336  str     r3, [r0]
00096338  adds    r2, #2
0009633a  add     r0, sp, #0x1e8
0009633c  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00096340  ldr     r1, [sp, #0x28]
00096342  movs    r3, #0x1b
00096344  add     r0, sp, #0x184
00096346  add     r2, sp, #0x1f4
00096348  str     r3, [r1]
0009634a  add     r1, sp, #0x1e8
0009634c  bl      #0x8f0ac ; -> ZN6Mayhem11HTTPRequest9AddHeaderERKSsS2_
00096350  ldr     r3, [sp, #0x1e8]
00096352  ldr     r1, [sp, #0x110]
00096354  sub.w   r0, r3, #0xc
00096358  cmp     r1, r0
0009635a  bne.w   #0x96990
0009635e  add     r0, sp, #0x154
00096360  movs    r3, #0x21
00096362  str     r0, [sp, #0x24]
00096364  str     r3, [r0]
00096366  movs    r0, #0x14
00096368  blx     #0xdd5c0 ; -> Znwm
0009636c  ldr     r2, [sp, #0x24]
0009636e  ldr.w   r1, [pc, #0x898]
00096372  str     r0, [sp, #0x6c]
00096374  movs    r3, #0x1a
00096376  str     r3, [r2]
00096378  add     r1, pc ; -> 0x00175f90  'EASellID'
0009637a  ldr     r0, [sp, #0x6c]
0009637c  bl      #0x9dd84 ; -> ZN4midp6StringC1EPKc
00096380  add     r3, sp, #0x154
00096382  str     r3, [sp, #0x20]
00096384  ldr     r4, [sp, #0x20]
00096386  movs    r3, #0x21
00096388  str     r3, [r4]
0009638a  ldr     r0, [sp, #0x6c]
0009638c  bl      #0x9d590 ; -> ZN4midp6System11getPropertyEPNS_6StringE
00096390  str     r0, [sp, #0x11c]
00096392  str     r0, [sp, #0x140]
00096394  cbz     r0, #0x9639c
00096396  ldr     r3, [r0]
00096398  ldr     r3, [r3, #0xc]
0009639a  blx     r3
0009639c  ldr     r0, [sp, #0x20]
0009639e  movs    r3, #0x19
000963a0  str     r3, [r0]
000963a2  bl      #0x9e748 ; -> ZN13LocaleManager11getInstanceEv
000963a6  bl      #0x9e754 ; -> ZNK13LocaleManager9getLocaleEv
000963aa  str     r0, [sp, #0x148]
000963ac  cmp     r0, #0
000963ae  beq.w   #0x96978
000963b2  ldr     r3, [r0]
000963b4  ldr     r3, [r3, #0xc]
000963b6  blx     r3
000963b8  ldr     r0, [sp, #0x20]
000963ba  movs    r1, #0x18
000963bc  str     r1, [r0]
000963be  ldr     r0, [sp, #0x148]
000963c0  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
000963c4  cmp     r0, #2
000963c6  beq     #0x963fc
000963c8  ldr     r0, [sp, #0x148]
000963ca  movs    r1, #0
000963cc  movs    r2, #2
000963ce  bl      #0x9dbc8 ; -> ZNK4midp6String9substringEii
000963d2  ldr     r2, [sp, #0x148]
000963d4  str     r0, [sp, #0x144]
000963d6  cmp     r2, r0
000963d8  beq     #0x963fc
000963da  cbz     r0, #0x963e2
000963dc  ldr     r3, [r0]
000963de  ldr     r3, [r3, #0xc]
000963e0  blx     r3
000963e2  ldr     r4, [sp, #0x148]
000963e4  ldr     r0, [sp, #0x20]
000963e6  movs    r1, #0x18
000963e8  ldr     r3, [r4]
000963ea  ldr     r3, [r3, #8]
000963ec  str     r1, [r0]
000963ee  ldr     r0, [sp, #0x148]
000963f0  blx     r3
000963f2  cmp     r0, #0
000963f4  bne.w   #0x9696e
000963f8  ldr     r2, [sp, #0x144]
000963fa  str     r2, [sp, #0x148]
000963fc  ldr     r3, [sp, #0x140]
000963fe  cmp     r3, #0
00096400  beq.w   #0x96aa4
00096404  ldr     r4, [sp, #0x140]
00096406  add.w   lr, sp, #0x154
0009640a  movs    r3, #0x18
0009640c  ldr     r4, [r4, #8]
0009640e  str.w   lr, [sp, #0x1c]
00096412  str     r4, [sp, #0x70]
00096414  str.w   r3, [lr]
00096418  ldr     r0, [sp, #0x50]
0009641a  ldr     r1, [sp, #0x60]
0009641c  blx     #0xddbfc ; -> objc_msgSend
00096420  mov     r2, r0
00096422  ldr     r1, [sp, #0x5c]
00096424  ldr     r0, [sp, #0x70]
00096426  blx     #0xddbfc ; -> objc_msgSend
0009642a  ldr     r2, [sp, #0x1c]
0009642c  movs    r3, #0x17
0009642e  mov     r1, r0
00096430  add     r0, sp, #0x1e4
00096432  str     r3, [r2]
00096434  add     r2, sp, #0x250
00096436  adds    r2, #1
00096438  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
0009643c  ldr     r3, [sp, #0x148]
0009643e  cmp     r3, #0
00096440  beq.w   #0x96ac2
00096444  ldr     r0, [sp, #0x148]
00096446  ldr     r1, [sp, #0x1c]
00096448  movs    r3, #0x16
0009644a  ldr     r0, [r0, #8]
0009644c  str     r0, [sp, #0x74]
0009644e  str     r3, [r1]
00096450  ldr     r0, [sp, #0x50]
00096452  ldr     r1, [sp, #0x60]
00096454  blx     #0xddbfc ; -> objc_msgSend
00096458  mov     r2, r0
0009645a  ldr     r1, [sp, #0x5c]
0009645c  ldr     r0, [sp, #0x74]
0009645e  blx     #0xddbfc ; -> objc_msgSend
00096462  ldr     r2, [sp, #0x1c]
00096464  mov     r1, r0
00096466  movs    r3, #0x15
00096468  add     r0, sp, #0x1e0
0009646a  str     r3, [r2]
0009646c  add     r2, sp, #0x250
0009646e  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00096472  ldr     r4, [sp, #0x1c]
00096474  movs    r3, #0x14
00096476  add     r0, sp, #0x1dc
00096478  str     r3, [r4]
0009647a  bl      #0x8be80 ; -> ZN6Mayhem17getMayhemGameNameEv
0009647e  ldr     r0, [sp, #0x114]
00096480  ldr.w   r1, [pc, #0x788]
00096484  movs    r3, #0x13
00096486  add     r2, sp, #0x204
00096488  str     r0, [sp, #0x1d8]
0009648a  add     r1, pc ; -> 0x00175f9c  'application='
0009648c  str     r3, [r4]
0009648e  add     r0, sp, #0x1d4
00096490  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00096494  movs    r3, #0x12
00096496  add     r0, sp, #0x1d0
00096498  str     r3, [r4]
0009649a  add     r1, sp, #0x1d4
0009649c  blx     #0xdd53c ; -> ZNSsC1ERKSs
000964a0  ldr.w   r1, [pc, #0x76c]
000964a4  movs    r3, #6
000964a6  add     r0, sp, #0x1d0
000964a8  add     r1, pc ; -> 0x00175fac  '\n'
000964aa  str     r3, [r4]
000964ac  movs    r2, #1
000964ae  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
000964b2  movs    r3, #0x11
000964b4  add     r0, sp, #0x1d8
000964b6  str     r3, [r4]
000964b8  add     r1, sp, #0x1d0
000964ba  blx     #0xdd500 ; -> ZNSs6appendERKSs
000964be  ldr     r3, [sp, #0x1d0]
000964c0  ldr     r1, [sp, #0x110]
000964c2  sub.w   r0, r3, #0xc
000964c6  cmp     r1, r0
000964c8  bne.w   #0x96e78
000964cc  ldr     r3, [sp, #0x1d4]
000964ce  ldr     r1, [sp, #0x110]
000964d0  sub.w   r0, r3, #0xc
000964d4  cmp     r1, r0
000964d6  bne.w   #0x96dc0
000964da  ldr.w   r1, [pc, #0x738]
000964de  add     r0, sp, #0x154
000964e0  movs    r3, #0x13
000964e2  str     r0, [sp, #0x18]
000964e4  add     r1, pc ; -> 0x00175fb0  'applicationUserId='
000964e6  str     r3, [r0]
000964e8  add     r2, sp, #0x200
000964ea  add     r0, sp, #0x1cc
000964ec  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
000964f0  ldr     r1, [sp, #0x18]
000964f2  movs    r3, #0x10
000964f4  add     r0, sp, #0x1c8
000964f6  str     r3, [r1]
000964f8  add     r1, sp, #0x1cc
000964fa  blx     #0xdd53c ; -> ZNSsC1ERKSs
000964fe  ldr     r2, [sp, #0x18]
00096500  ldr.w   r1, [pc, #0x714]
00096504  movs    r3, #5
00096506  add     r0, sp, #0x1c8
00096508  str     r3, [r2]
0009650a  add     r1, pc ; -> 0x00175fc4  '\n'
0009650c  movs    r2, #1
0009650e  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00096512  ldr     r4, [sp, #0x18]
00096514  movs    r3, #0xf
00096516  add     r0, sp, #0x1d8
00096518  add     r1, sp, #0x1c8
0009651a  str     r3, [r4]
0009651c  blx     #0xdd500 ; -> ZNSs6appendERKSs
00096520  ldr     r3, [sp, #0x1c8]
00096522  ldr     r1, [sp, #0x110]
00096524  sub.w   r0, r3, #0xc
00096528  cmp     r1, r0
0009652a  bne.w   #0x96d92
0009652e  ldr     r3, [sp, #0x1cc]
00096530  ldr     r1, [sp, #0x110]
00096532  sub.w   r0, r3, #0xc
00096536  cmp     r1, r0
00096538  bne.w   #0x96d62
0009653c  ldr.w   r1, [pc, #0x6dc]
00096540  add     r0, sp, #0x154
00096542  movs    r3, #0x13
00096544  str     r0, [sp, #0x14]
00096546  add     r1, pc ; -> 0x00175fc8  'game='
00096548  str     r3, [r0]
0009654a  add     r2, sp, #0x1dc
0009654c  add     r0, sp, #0x1c4
0009654e  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00096552  ldr     r1, [sp, #0x14]
00096554  movs    r3, #0xe
00096556  add     r0, sp, #0x1c0
00096558  str     r3, [r1]
0009655a  add     r1, sp, #0x1c4
0009655c  blx     #0xdd53c ; -> ZNSsC1ERKSs
00096560  ldr     r2, [sp, #0x14]
00096562  ldr.w   r1, [pc, #0x6bc]
00096566  movs    r3, #4
00096568  add     r0, sp, #0x1c0
0009656a  str     r3, [r2]
0009656c  add     r1, pc ; -> 0x00175fd0  '\n'
0009656e  movs    r2, #1
00096570  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00096574  ldr     r4, [sp, #0x14]
00096576  movs    r3, #0xd
00096578  add     r0, sp, #0x1d8
0009657a  add     r1, sp, #0x1c0
0009657c  str     r3, [r4]
0009657e  blx     #0xdd500 ; -> ZNSs6appendERKSs
00096582  ldr     r3, [sp, #0x1c0]
00096584  ldr     r1, [sp, #0x110]
00096586  sub.w   r0, r3, #0xc
0009658a  cmp     r1, r0
0009658c  bne.w   #0x96d34
00096590  ldr     r3, [sp, #0x1c4]
00096592  ldr     r1, [sp, #0x110]
00096594  sub.w   r0, r3, #0xc
00096598  cmp     r1, r0
0009659a  bne.w   #0x96d06
0009659e  add     r3, sp, #0x154
000965a0  str     r3, [sp, #0x10]
000965a2  ldr     r4, [sp, #0x10]
000965a4  ldr     r0, [sp, #0x4c]
000965a6  ldr.w   r1, [pc, #0x67c]
000965aa  movs    r3, #0x13
000965ac  add.w   r2, r0, #0x5c
000965b0  add     r1, pc ; -> 0x00175fd4  'displayName='
000965b2  str     r3, [r4]
000965b4  add     r0, sp, #0x1bc
000965b6  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
000965ba  movs    r3, #0xc
000965bc  add     r0, sp, #0x1b8
000965be  str     r3, [r4]
000965c0  add     r1, sp, #0x1bc
000965c2  blx     #0xdd53c ; -> ZNSsC1ERKSs
000965c6  ldr.w   r1, [pc, #0x660]
000965ca  movs    r3, #3
000965cc  add     r0, sp, #0x1b8
000965ce  add     r1, pc ; -> 0x00175fe4  '\n'
000965d0  str     r3, [r4]
000965d2  movs    r2, #1
000965d4  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
000965d8  movs    r3, #0xb
000965da  add     r0, sp, #0x1d8
000965dc  str     r3, [r4]
000965de  add     r1, sp, #0x1b8
000965e0  blx     #0xdd500 ; -> ZNSs6appendERKSs
000965e4  ldr     r3, [sp, #0x1b8]
000965e6  ldr     r1, [sp, #0x110]
000965e8  sub.w   r0, r3, #0xc
000965ec  cmp     r1, r0
000965ee  bne.w   #0x96cd8
000965f2  ldr     r3, [sp, #0x1bc]
000965f4  ldr     r1, [sp, #0x110]
000965f6  sub.w   r0, r3, #0xc
000965fa  cmp     r1, r0
000965fc  bne.w   #0x96cac
00096600  ldr.w   r1, [pc, #0x628]
00096604  add     r0, sp, #0x154
00096606  movs    r3, #0x13
00096608  str     r0, [sp, #0xc]
0009660a  add     r1, pc ; -> 0x00175fe8  'sellId='
0009660c  str     r3, [r0]
0009660e  add     r2, sp, #0x1e4
00096610  add     r0, sp, #0x1b4
00096612  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00096616  ldr     r1, [sp, #0xc]
00096618  movs    r3, #0xa
0009661a  add     r0, sp, #0x1b0
0009661c  str     r3, [r1]
0009661e  add     r1, sp, #0x1b4
00096620  blx     #0xdd53c ; -> ZNSsC1ERKSs
00096624  ldr     r2, [sp, #0xc]
00096626  ldr.w   r1, [pc, #0x608]
0009662a  movs    r3, #2
0009662c  add     r0, sp, #0x1b0
0009662e  str     r3, [r2]
00096630  add     r1, pc ; -> 0x00175ff0  '\n'
00096632  movs    r2, #1
00096634  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00096638  ldr     r4, [sp, #0xc]
0009663a  movs    r3, #9
0009663c  add     r0, sp, #0x1d8
0009663e  add     r1, sp, #0x1b0
00096640  str     r3, [r4]
00096642  blx     #0xdd500 ; -> ZNSs6appendERKSs
00096646  ldr     r3, [sp, #0x1b0]
00096648  ldr     r1, [sp, #0x110]
0009664a  sub.w   r0, r3, #0xc
0009664e  cmp     r1, r0
00096650  bne.w   #0x96b90
00096654  ldr     r3, [sp, #0x1b4]
00096656  ldr     r1, [sp, #0x110]
00096658  sub.w   r0, r3, #0xc
0009665c  cmp     r1, r0
0009665e  bne.w   #0x96b62
00096662  ldr.w   r1, [pc, #0x5d0]
00096666  add     r0, sp, #0x154
00096668  movs    r3, #0x13
0009666a  str     r0, [sp, #8]
0009666c  add     r1, pc ; -> 0x00175ff4  'locale='
0009666e  str     r3, [r0]
00096670  add     r2, sp, #0x1e0
00096672  add     r0, sp, #0x1ac
00096674  bl      #0x9ba4c ; -> ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_EPKS3_RKS6_
00096678  ldr     r1, [sp, #8]
0009667a  movs    r3, #8
0009667c  add     r0, sp, #0x1a8
0009667e  str     r3, [r1]
00096680  add     r1, sp, #0x1ac
00096682  blx     #0xdd53c ; -> ZNSsC1ERKSs
00096686  ldr     r3, [sp, #8]
00096688  ldr.w   r1, [pc, #0x5ac]
0009668c  movs    r2, #1
0009668e  add     r0, sp, #0x1a8
00096690  add     r1, pc ; -> 0x00175ffc  '\n'
00096692  str     r2, [r3]
00096694  blx     #0xdd4f4 ; -> ZNSs6appendEPKcm
00096698  ldr     r4, [sp, #8]
0009669a  movs    r3, #7
0009669c  add     r0, sp, #0x1d8
0009669e  add     r1, sp, #0x1a8
000966a0  str     r3, [r4]
000966a2  blx     #0xdd500 ; -> ZNSs6appendERKSs
000966a6  ldr     r3, [sp, #0x1a8]
000966a8  ldr     r1, [sp, #0x110]
000966aa  sub.w   r0, r3, #0xc
000966ae  cmp     r1, r0
000966b0  bne.w   #0x96b36
000966b4  ldr     r3, [sp, #0x1ac]
000966b6  ldr     r1, [sp, #0x110]
000966b8  sub.w   r0, r3, #0xc
000966bc  cmp     r1, r0
000966be  bne.w   #0x96b08
000966c2  add     r3, sp, #0x154
000966c4  movs    r2, #0x13
000966c6  str     r2, [r3]
000966c8  add     r0, sp, #0x184
000966ca  add     r1, sp, #0x1d8
000966cc  bl      #0x8b3dc ; -> ZN6Mayhem11HTTPRequest7SetBodyERKSs
000966d0  add     r0, sp, #0x184
000966d2  bl      #0x8f6f0 ; -> ZN6Mayhem11HTTPRequest9DoRequestEv
000966d6  str     r0, [sp, #0x78]
000966d8  ldr.w   r1, [pc, #0x560]
000966dc  ldr.w   r0, [pc, #0x560]
000966e0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000966e2  add     r0, pc ; -> 0x000fdc00  
000966e4  ldr     r1, [r1]
000966e6  ldr     r0, [r0]
000966e8  blx     #0xddbfc ; -> objc_msgSend
000966ec  ldr.w   r1, [pc, #0x554]
000966f0  ldr     r2, [sp, #0x78]
000966f2  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000966f4  ldr     r1, [r1]
000966f6  blx     #0xddbfc ; -> objc_msgSend
000966fa  ldr.w   r1, [pc, #0x54c]
000966fe  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
00096700  ldr     r1, [r1]
00096702  blx     #0xddbfc ; -> objc_msgSend
00096706  str     r0, [sp, #0x7c]
00096708  ldr     r0, [sp, #0x4c]
0009670a  ldr.w   r1, [pc, #0x540]
0009670e  ldr     r0, [r0, #0x18]
00096710  add     r1, pc ; -> 0x000fcfa4  
00096712  ldr     r1, [r1]
00096714  str     r0, [sp, #0x80]
00096716  blx     #0xddbfc ; -> objc_msgSend
0009671a  ldr.w   r1, [pc, #0x534]
0009671e  ldr     r0, [sp, #0x7c]
00096720  ldr     r2, [sp, #0x80]
00096722  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00096724  ldr     r1, [r1]
00096726  blx     #0xddbfc ; -> objc_msgSend
0009672a  ldr.w   r1, [pc, #0x528]
0009672e  ldr     r0, [sp, #0x7c]
00096730  add     r1, pc ; -> 0x000fce60  '8U\x0e'
00096732  ldr     r1, [r1]
00096734  blx     #0xddbfc ; -> objc_msgSend
00096738  tst.w   r0, #0xff
0009673c  bne.w   #0x96848
00096740  ldr.w   r1, [pc, #0x514]
00096744  ldr     r2, [sp, #0x4c]
00096746  add     r3, sp, #0x154
00096748  add     r1, pc ; -> 0x000fcf9c  
0009674a  adds    r2, #8
0009674c  str     r2, [sp, #0x14c]
0009674e  movs    r2, #0x13
00096750  str     r2, [r3]
00096752  ldr     r1, [r1]
00096754  ldr     r0, [sp, #0x80]
00096756  blx     #0xddbfc ; -> objc_msgSend
0009675a  add     r3, sp, #0x154
0009675c  movs    r2, #0x13
0009675e  str     r2, [r3]
00096760  mov     r1, r0
00096762  ldr     r0, [sp, #0x14c]
00096764  bl      #0x8b870 ; -> ZN6Mayhem7Request11HandleErrorEPv
00096768  ldr     r3, [sp, #0x4c]
0009676a  movs    r1, #2
0009676c  add.w   r0, r3, #8
00096770  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00096774  ldr     r3, [sp, #0x1d8]
00096776  ldr     r1, [sp, #0x110]
00096778  sub.w   r0, r3, #0xc
0009677c  cmp     r1, r0
0009677e  bne.w   #0x96e1c
00096782  ldr     r3, [sp, #0x1dc]
00096784  ldr     r1, [sp, #0x110]
00096786  sub.w   r0, r3, #0xc
0009678a  cmp     r1, r0
0009678c  bne.w   #0x96f02
00096790  ldr     r3, [sp, #0x1e0]
00096792  ldr     r1, [sp, #0x110]
00096794  sub.w   r0, r3, #0xc
00096798  cmp     r1, r0
0009679a  bne.w   #0x96ed6
0009679e  ldr     r3, [sp, #0x1e4]
000967a0  ldr     r1, [sp, #0x110]
000967a2  sub.w   r0, r3, #0xc
000967a6  cmp     r1, r0
000967a8  bne.w   #0x96ea8
000967ac  ldr     r0, [sp, #0x148]
000967ae  cbz     r0, #0x967c6
000967b0  ldr     r1, [sp, #0x148]
000967b2  movs    r2, #0x19
000967b4  ldr     r3, [r1]
000967b6  ldr     r1, [r3, #8]
000967b8  add     r3, sp, #0x154
000967ba  str     r2, [r3]
000967bc  ldr     r0, [sp, #0x148]
000967be  blx     r1
000967c0  cmp     r0, #0
000967c2  bne.w   #0x96962
000967c6  ldr     r4, [sp, #0x11c]
000967c8  movs    r2, #0x21
000967ca  ldr     r3, [r4]
000967cc  ldr     r1, [r3, #8]
000967ce  add     r3, sp, #0x154
000967d0  str     r2, [r3]
000967d2  ldr     r0, [sp, #0x11c]
000967d4  blx     r1
000967d6  cmp     r0, #0
000967d8  bne.w   #0x96950
000967dc  ldr     r3, [sp, #0x1f4]
000967de  ldr     r2, [sp, #0x110]
000967e0  sub.w   r0, r3, #0xc
000967e4  cmp     r2, r0
000967e6  bne.w   #0x96df0
000967ea  ldr     r3, [sp, #0x1f8]
000967ec  ldr     r1, [sp, #0x110]
000967ee  sub.w   r0, r3, #0xc
000967f2  cmp     r1, r0
000967f4  bne.w   #0x96e48
000967f8  ldr     r3, [sp, #0x1fc]
000967fa  ldr     r1, [sp, #0x110]
000967fc  sub.w   r0, r3, #0xc
00096800  cmp     r1, r0
00096802  bne.w   #0x96ada
00096806  ldr     r3, [sp, #0x200]
00096808  ldr     r1, [sp, #0x110]
0009680a  sub.w   r0, r3, #0xc
0009680e  cmp     r1, r0
00096810  bne.w   #0x96f58
00096814  ldr     r3, [sp, #0x204]
00096816  ldr     r1, [sp, #0x110]
00096818  sub.w   r0, r3, #0xc
0009681c  cmp     r1, r0
0009681e  bne.w   #0x96f2e
00096822  add     r3, sp, #0x154
00096824  mov.w   r2, #-1
00096828  add     r0, sp, #0x184
0009682a  str     r2, [r3]
0009682c  bl      #0x8d4bc ; -> ZN6Mayhem11HTTPRequestD1Ev
00096830  add     r0, sp, #0x150
00096832  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00096836  sub.w   sp, r7, #0x58
0009683a  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0009683e  sub.w   sp, r7, #0x18
00096842  pop.w   {r8, sl, fp}
00096846  pop     {r4, r5, r6, r7, pc}
00096848  ldr.w   r3, [pc, #0x410]
0009684c  ldr     r0, [sp, #0x80]
0009684e  add     r3, pc ; -> 0x000fcf9c  
00096850  ldr     r3, [r3]
00096852  str     r3, [sp, #0x84]
00096854  mov     r1, r3
00096856  blx     #0xddbfc ; -> objc_msgSend
0009685a  ldr.w   r3, [pc, #0x404]
0009685e  ldr.w   r2, [pc, #0x404]
00096862  add     r3, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
00096864  add     r2, pc ; -> 0x0017f064  
00096866  ldr     r3, [r3]
00096868  str     r3, [sp, #0x88]
0009686a  mov     r1, r3
0009686c  blx     #0xddbfc ; -> objc_msgSend
00096870  str     r0, [sp, #0x8c]
00096872  cmp     r0, #0
00096874  bne.w   #0x96740
00096878  ldr     r0, [sp, #0x80]
0009687a  ldr     r1, [sp, #0x84]
0009687c  blx     #0xddbfc ; -> objc_msgSend
00096880  ldr     r2, [pc, #0x3e4]
00096882  ldr     r1, [sp, #0x88]
00096884  add     r2, pc ; -> 0x0017f194  
00096886  blx     #0xddbfc ; -> objc_msgSend
0009688a  ldr.w   r3, [pc, #0x3e0]
0009688e  ldr     r2, [sp, #0x8c]
00096890  add     r3, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00096892  ldr     r3, [r3]
00096894  str     r3, [sp, #0x90]
00096896  mov     r1, r3
00096898  blx     #0xddbfc ; -> objc_msgSend
0009689c  ldr.w   r1, [pc, #0x3d0]
000968a0  add     r1, pc ; -> 0x000fcfa0  
000968a2  ldr     r1, [r1]
000968a4  blx     #0xddbfc ; -> objc_msgSend
000968a8  ldr     r2, [pc, #0x3c8]
000968aa  ldr     r1, [sp, #0x88]
000968ac  add     r2, pc ; -> 0x0017f2d4  
000968ae  blx     #0xddbfc ; -> objc_msgSend
000968b2  ldr     r1, [sp, #0x90]
000968b4  ldr     r2, [sp, #0x8c]
000968b6  blx     #0xddbfc ; -> objc_msgSend
000968ba  ldr     r1, [pc, #0x3bc]
000968bc  add     r1, pc ; -> 0x000fcc28  'tS\x0e'
000968be  ldr     r1, [r1]
000968c0  blx     #0xddbfc ; -> objc_msgSend
000968c4  ldr     r1, [pc, #0x3b4]
000968c6  ldr     r2, [pc, #0x3b8]
000968c8  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000968ca  add     r2, pc ; -> 0x0017e794  
000968cc  ldr     r1, [r1]
000968ce  blx     #0xddbfc ; -> objc_msgSend
000968d2  ldr     r1, [sp, #0x90]
000968d4  movs    r2, #2
000968d6  blx     #0xddbfc ; -> objc_msgSend
000968da  str     r0, [sp, #0x94]
000968dc  ldr     r1, [sp, #0x60]
000968de  ldr     r0, [sp, #0x50]
000968e0  blx     #0xddbfc ; -> objc_msgSend
000968e4  mov     r2, r0
000968e6  ldr     r1, [sp, #0x5c]
000968e8  ldr     r0, [sp, #0x94]
000968ea  blx     #0xddbfc ; -> objc_msgSend
000968ee  ldr     r1, [sp, #0x4c]
000968f0  str     r0, [sp, #0x13c]
000968f2  adds    r1, #0x58
000968f4  str     r1, [sp, #0x138]
000968f6  blx     #0xdde0c ; -> strlen
000968fa  ldr     r1, [sp, #0x13c]
000968fc  mov     r2, r0
000968fe  ldr     r0, [sp, #0x138]
00096900  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00096904  ldr     r2, [sp, #0x4c]
00096906  movs    r1, #1
00096908  add.w   r0, r2, #8
0009690c  bl      #0x8b3f4 ; -> ZN6Mayhem7Request9SetResultENS_13RequestResultE
00096910  b       #0x96774
00096912  cmp.w   r3, #-1
00096916  bne.w   #0x9625a
0009691a  ldr     r1, [sp, #0x34]
0009691c  ldr.w   lr, [pc, #0x364]
00096920  adds    r3, #0x22
00096922  adds    r2, #7
00096924  mov     r0, lr
00096926  add     r0, pc
00096928  str     r0, [sp, #0x40]
0009692a  str     r3, [r1]
0009692c  add     r0, sp, #0x204
0009692e  ldr     r1, [sp, #0x40]
00096930  blx     #0xdd50c ; -> ZNSs6assignEPKcm
00096934  add     r0, sp, #0x1fc
00096936  ldr     r1, [sp, #0x40]
00096938  movs    r2, #6
0009693a  blx     #0xdd50c ; -> ZNSs6assignEPKcm
0009693e  add     r0, sp, #0x1f8
00096940  add     r1, sp, #0x1f4
00096942  blx     #0xdd518 ; -> ZNSs6assignERKSs
00096946  add     r0, sp, #0x200
00096948  add     r1, sp, #0x1f4
0009694a  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009694e  b       #0x962be
00096950  ldr     r1, [sp, #0x11c]
00096952  movs    r2, #0x21
00096954  ldr     r3, [r1]
00096956  ldr     r1, [r3, #4]
00096958  add     r3, sp, #0x154
0009695a  str     r2, [r3]
0009695c  ldr     r0, [sp, #0x11c]
0009695e  blx     r1
00096960  b       #0x967dc
00096962  ldr     r2, [sp, #0x148]
00096964  ldr     r3, [r2]
00096966  mov     r0, r2
00096968  ldr     r3, [r3, #4]
0009696a  blx     r3
0009696c  b       #0x967c6
0009696e  ldr     r3, [r4]
00096970  ldr     r0, [sp, #0x148]
00096972  ldr     r3, [r3, #4]
00096974  blx     r3
00096976  b       #0x963f8
00096978  ldr     r4, [sp, #0x20]
0009697a  ldr     r0, [pc, #0x30c]
0009697c  ldr     r1, [pc, #0x30c]
0009697e  ldr     r3, [pc, #0x310]
00096980  movs    r2, #0x18
00096982  add     r0, pc ; -> 0x000e5948  ZZN4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
00096984  str     r2, [r4]
00096986  add     r1, pc ; -> 0x00175adc  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00096988  add     r3, pc ; -> 0x00175b50  'm__obj'
0009698a  adds    r2, #0xa3
0009698c  blx     #0xdd5cc ; -> assert_rtn
00096990  subs    r2, r3, #4
00096992  ldr     r3, [r3, #-0x4]
00096996  subs    r1, r3, #1
00096998  dmb     ish
0009699c  mov     ip, r3
0009699e  ldrex   r4, [r2]
000969a2  cmp     r4, r3
000969a4  beq.w   #0x96fe0
000969a8  cmp     r4, ip
000969aa  mov     r3, r4
000969ac  bne     #0x96996
000969ae  cmp     r4, #0
000969b0  bgt.w   #0x9635e
000969b4  add     r1, sp, #0x244
000969b6  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000969ba  b       #0x9635e
000969bc  subs    r2, r3, #4
000969be  ldr     r3, [r3, #-0x4]
000969c2  subs    r1, r3, #1
000969c4  dmb     ish
000969c8  mov     ip, r3
000969ca  ldrex   r4, [r2]
000969ce  cmp     r4, r3
000969d0  beq.w   #0x96fce
000969d4  cmp     r4, ip
000969d6  mov     r3, r4
000969d8  bne     #0x969c2
000969da  cmp     r4, #0
000969dc  bgt.w   #0x96328
000969e0  add     r1, sp, #0x240
000969e2  adds    r1, #6
000969e4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
000969e8  b       #0x96328
000969ea  subs    r2, r3, #4
000969ec  ldr     r3, [r3, #-0x4]
000969f0  subs    r1, r3, #1
000969f2  dmb     ish
000969f6  mov     ip, r3
000969f8  ldrex   r4, [r2]
000969fc  cmp     r4, r3
000969fe  beq.w   #0x96fbc
00096a02  cmp     r4, ip
00096a04  mov     r3, r4
00096a06  bne     #0x969f0
00096a08  cmp     r4, #0
00096a0a  bgt.w   #0x962f2
00096a0e  add     r1, sp, #0x248
00096a10  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096a14  b       #0x962f2
00096a16  subs    r2, r3, #4
00096a18  ldr     r3, [r3, #-0x4]
00096a1c  subs    r1, r3, #1
00096a1e  dmb     ish
00096a22  mov     ip, r3
00096a24  ldrex   r4, [r2]
00096a28  cmp     r4, r3
00096a2a  beq.w   #0x96faa
00096a2e  cmp     r4, ip
00096a30  mov     r3, r4
00096a32  bne     #0x96a1c
00096a34  cmp     r4, #0
00096a36  bgt.w   #0x961b8
00096a3a  add     r1, sp, #0x24c
00096a3c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096a40  b.w     #0x961b8
00096a44  ldr     r3, [r1, #-0x4]
00096a48  subs    r2, r1, #4
00096a4a  subs    r1, r3, #1
00096a4c  dmb     ish
00096a50  mov     ip, r3
00096a52  ldrex   r4, [r2]
00096a56  cmp     r4, r3
00096a58  beq.w   #0x96f98
00096a5c  cmp     r4, ip
00096a5e  mov     r3, r4
00096a60  bne     #0x96a4a
00096a62  cmp     r4, #0
00096a64  bgt.w   #0x9615a
00096a68  add     r1, sp, #0x248
00096a6a  adds    r1, #7
00096a6c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096a70  b.w     #0x9615a
00096a74  subs    r2, r3, #4
00096a76  ldr     r3, [r3, #-0x4]
00096a7a  subs    r1, r3, #1
00096a7c  dmb     ish
00096a80  mov     ip, r3
00096a82  ldrex   r4, [r2]
00096a86  cmp     r4, r3
00096a88  beq.w   #0x96f86
00096a8c  cmp     r4, ip
00096a8e  mov     r3, r4
00096a90  bne     #0x96a7a
00096a92  cmp     r4, #0
00096a94  bgt.w   #0x961ea
00096a98  add     r1, sp, #0x248
00096a9a  adds    r1, #2
00096a9c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096aa0  b.w     #0x961ea
00096aa4  ldr     r0, [pc, #0x1ec]
00096aa6  ldr     r1, [pc, #0x1f0]
00096aa8  ldr.w   r3, [pc, #0x1f0]
00096aac  add     r2, sp, #0x154
00096aae  mov.w   ip, #0x18
00096ab2  add     r0, pc ; -> 0x000e5948  ZZN4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
00096ab4  str.w   ip, [r2]
00096ab8  add     r1, pc ; -> 0x00175adc  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00096aba  add     r3, pc ; -> 0x00175b50  'm__obj'
00096abc  movs    r2, #0xbb
00096abe  blx     #0xdd5cc ; -> assert_rtn
00096ac2  ldr     r4, [sp, #0x1c]
00096ac4  ldr     r0, [pc, #0x1d8]
00096ac6  ldr     r1, [pc, #0x1dc]
00096ac8  ldr     r3, [pc, #0x1dc]
00096aca  movs    r2, #0x16
00096acc  add     r0, pc ; -> 0x000e5948  ZZN4midp23ReferenceCountedPointerINS_6StringEEptEvE8__func__
00096ace  str     r2, [r4]
00096ad0  add     r1, pc ; -> 0x00175adc  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00096ad2  add     r3, pc ; -> 0x00175b50  'm__obj'
00096ad4  adds    r2, #0xa5
00096ad6  blx     #0xdd5cc ; -> assert_rtn
00096ada  subs    r2, r3, #4
00096adc  ldr     r3, [r3, #-0x4]
00096ae0  subs    r1, r3, #1
00096ae2  dmb     ish
00096ae6  mov     ip, r3
00096ae8  ldrex   lr, [r2]
00096aec  cmp     lr, r3
00096aee  beq.w   #0x970d6
00096af2  cmp     lr, ip
00096af4  mov     r3, lr
00096af6  bne     #0x96ae0
00096af8  cmp.w   lr, #0
00096afc  bgt.w   #0x96806
00096b00  add     r1, sp, #0x218
00096b02  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096b06  b       #0x96806
00096b08  subs    r2, r3, #4
00096b0a  ldr     r3, [r3, #-0x4]
00096b0e  subs    r1, r3, #1
00096b10  dmb     ish
00096b14  mov     ip, r3
00096b16  ldrex   r4, [r2]
00096b1a  cmp     r4, r3
00096b1c  beq.w   #0x970c4
00096b20  cmp     r4, ip
00096b22  mov     r3, r4
00096b24  bne     #0x96b0e
00096b26  cmp     r4, #0
00096b28  bgt.w   #0x966c2
00096b2c  add     r1, sp, #0x220
00096b2e  adds    r1, #6
00096b30  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096b34  b       #0x966c2
00096b36  subs    r2, r3, #4
00096b38  ldr     r3, [r3, #-0x4]
00096b3c  subs    r1, r3, #1
00096b3e  dmb     ish
00096b42  mov     ip, r3
00096b44  ldrex   r4, [r2]
00096b48  cmp     r4, r3
00096b4a  beq.w   #0x970b2
00096b4e  cmp     r4, ip
00096b50  mov     r3, r4
00096b52  bne     #0x96b3c
00096b54  cmp     r4, #0
00096b56  bgt.w   #0x966b4
00096b5a  add     r1, sp, #0x228
00096b5c  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096b60  b       #0x966b4
00096b62  subs    r2, r3, #4
00096b64  ldr     r3, [r3, #-0x4]
00096b68  subs    r1, r3, #1
00096b6a  dmb     ish
00096b6e  mov     ip, r3
00096b70  ldrex   r4, [r2]
00096b74  cmp     r4, r3
00096b76  beq.w   #0x970a0
00096b7a  cmp     r4, ip
00096b7c  mov     r3, r4
00096b7e  bne     #0x96b68
00096b80  cmp     r4, #0
00096b82  bgt.w   #0x96662
00096b86  add     r1, sp, #0x228
00096b88  adds    r1, #3
00096b8a  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096b8e  b       #0x96662
00096b90  subs    r2, r3, #4
00096b92  ldr     r3, [r3, #-0x4]
00096b96  subs    r1, r3, #1
00096b98  dmb     ish
00096b9c  mov     ip, r3
00096b9e  ldrex   r4, [r2]
00096ba2  cmp     r4, r3
00096ba4  beq.w   #0x9708e
00096ba8  cmp     r4, ip
00096baa  mov     r3, r4
00096bac  bne     #0x96b96
00096bae  cmp     r4, #0
00096bb0  bgt.w   #0x96654
00096bb4  add     r1, sp, #0x228
00096bb6  adds    r1, #5
00096bb8  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00096bbc  b       #0x96654
00096bbe  nop     
00096bc0  blo     #0x96c74
00096bc2  movs    r5, r0
00096bc4  strh    r2, [r2, #0x20]
00096bc6  movs    r5, r0
00096bc8  asrs    r2, r5, #1
00096bca  movs    r0, r0
00096bcc  ldrb    r6, [r1, #9]
00096bce  movs    r6, r0
00096bd0  str     r2, [sp, #0x2c0]
00096bd2  movs    r6, r1
00096bd4  ldr     r0, [r0, #0x18]
00096bd6  movs    r6, r0
00096bd8  bhs     #0x96c20
00096bda  movs    r5, r0
00096bdc  ldr     r2, [r0, #0x60]
00096bde  movs    r6, r0
00096be0  ldr     r0, [r5, #0x5c]
00096be2  movs    r6, r0
00096be4  ldc2    p0, c0, [r4, #0x34]
00096be8  str     r2, [r5, #0x7c]
00096bea  movs    r6, r0
00096bec  ldrb    r6, [r0, #5]
00096bee  movs    r6, r0
00096bf0  ldr     r0, [r1, #0x58]
00096bf2  movs    r6, r0
