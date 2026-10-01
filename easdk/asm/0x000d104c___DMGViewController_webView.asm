========================================================================
-[DMGViewController webView  0x000d104c  1472 bytes   DMGViewController.mm
========================================================================

000d104c  push    {r4, r5, r6, r7, lr}
000d104e  add     r7, sp, #0xc
000d1050  push.w  {r8, sl, fp}
000d1054  sub     sp, #0xbc
000d1056  ldr.w   r1, [pc, #0x4a4]
000d105a  str     r0, [sp, #0x18]
000d105c  ldr.w   r0, [pc, #0x4a0]
000d1060  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d1062  str     r3, [sp, #0x14]
000d1064  ldr.w   sl, [r1]
000d1068  ldr.w   r1, [pc, #0x498]
000d106c  add     r0, pc ; -> 0x000fdb5c  
000d106e  ldr     r5, [sp, #0xdc]
000d1070  add     r1, pc ; -> 0x000fcc5c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e4
000d1072  ldr.w   fp, [r0]
000d1076  ldr     r1, [r1]
000d1078  mov     r0, r3
000d107a  ldr.w   r4, [pc, #0x48c]
000d107e  str     r1, [sp, #0x1c]
000d1080  blx     #0xddbfc ; -> objc_msgSend
000d1084  ldr.w   r1, [pc, #0x484]
000d1088  add     r4, pc ; -> 0x00182814  
000d108a  add     r1, pc ; -> 0x000fda1c  '\x1c!\x0f'
000d108c  ldr     r1, [r1]
000d108e  blx     #0xddbfc ; -> objc_msgSend
000d1092  mov     r1, sl
000d1094  mov     r2, r4
000d1096  mov     r3, r0
000d1098  mov     r0, fp
000d109a  blx     #0xddbfc ; -> objc_msgSend
000d109e  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d10a2  cmp     r5, #0
000d10a4  bne.w   #0xd1472
000d10a8  ldr     r1, [sp, #0x1c]
000d10aa  ldr     r0, [sp, #0x14]
000d10ac  blx     #0xddbfc ; -> objc_msgSend
000d10b0  ldr.w   r1, [pc, #0x45c]
000d10b4  add     r1, pc ; -> 0x000fda18  '\r!\x0f'
000d10b6  ldr     r1, [r1]
000d10b8  blx     #0xddbfc ; -> objc_msgSend
000d10bc  ldr.w   r2, [pc, #0x454]
000d10c0  ldr.w   r3, [pc, #0x454]
000d10c4  add     r2, pc ; -> 0x000fcdc8  
000d10c6  add     r3, pc ; -> 0x00182824  
000d10c8  ldr     r2, [r2]
000d10ca  mov     r1, r0
000d10cc  add     r0, sp, #0x54
000d10ce  blx     #0xddc14 ; -> objc_msgSend_stret
000d10d2  add     r2, sp, #0x54
000d10d4  ldm     r2, {r2, r3}
000d10d6  mvn     r1, #0x80000000
000d10da  cmp     r2, r1
000d10dc  beq     #0xd10e4
000d10de  bl      #0xcfbf0 ; -> Z20MTXDMG_ExitMoreGamesv
000d10e2  b       #0xd146e
000d10e4  ldr     r1, [sp, #0x1c]
000d10e6  ldr     r0, [sp, #0x14]
000d10e8  blx     #0xddbfc ; -> objc_msgSend
000d10ec  ldr.w   r1, [pc, #0x42c]
000d10f0  add     r1, pc ; -> 0x000fcdb8  
000d10f2  ldr     r1, [r1]
000d10f4  blx     #0xddbfc ; -> objc_msgSend
000d10f8  ldr.w   r2, [pc, #0x424]
000d10fc  mov     r1, sl
000d10fe  add     r2, pc ; -> 0x00182834  
000d1100  mov     r4, r0
000d1102  mov     r3, r4
000d1104  mov     r0, fp
000d1106  blx     #0xddbfc ; -> objc_msgSend
000d110a  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d110e  ldr.w   r1, [pc, #0x414]
000d1112  add     r1, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d1114  str     r1, [sp, #0x3c]
000d1116  cmp     r4, #0
000d1118  beq.w   #0xd127c
000d111c  ldr.w   r1, [pc, #0x408]
000d1120  ldr.w   r2, [pc, #0x408]
000d1124  mov     r0, r4
000d1126  add     r1, pc ; -> 0x000fcf98  '\x1bU\x0e'
000d1128  add     r2, pc ; -> 0x0017e8a4  
000d112a  ldr     r1, [r1]
000d112c  str     r1, [sp, #0x20]
000d112e  blx     #0xddbfc ; -> objc_msgSend
000d1132  ldr     r1, [pc, #0x3fc]
000d1134  movs    r3, #0x10
000d1136  add     r2, sp, #0x9c
000d1138  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d113a  str     r3, [sp]
000d113c  ldr     r1, [r1]
000d113e  add     r3, sp, #0x5c
000d1140  str     r5, [sp, #0x9c]
000d1142  str     r5, [sp, #0xa0]
000d1144  str     r5, [sp, #0xa4]
000d1146  str     r5, [sp, #0xa8]
000d1148  str     r5, [sp, #0xac]
000d114a  str     r5, [sp, #0xb0]
000d114c  str     r5, [sp, #0xb4]
000d114e  str     r5, [sp, #0xb8]
000d1150  str     r1, [sp, #0x24]
000d1152  str     r0, [sp, #0x4c]
000d1154  blx     #0xddbfc ; -> objc_msgSend
000d1158  cmp     r0, #0
000d115a  beq.w   #0xd127c
000d115e  ldr.w   r1, [pc, #0x3d4]
000d1162  ldr     r3, [sp, #0xa4]
000d1164  mov     r8, r0
000d1166  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d1168  ldr     r1, [r1]
000d116a  ldr     r2, [r3]
000d116c  str     r5, [sp, #0x44]
000d116e  str     r5, [sp, #0x48]
000d1170  str     r1, [sp, #0x28]
000d1172  ldr.w   r1, [pc, #0x3c4]
000d1176  str     r2, [sp, #0x50]
000d1178  ldr     r2, [pc, #0x3c0]
000d117a  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000d117c  ldr     r1, [r1]
000d117e  str     r2, [sp, #0x10]
000d1180  str     r1, [sp, #0x2c]
000d1182  ldr     r1, [pc, #0x3bc]
000d1184  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000d1186  ldr     r1, [r1]
000d1188  str     r1, [sp, #0x30]
000d118a  ldr     r1, [pc, #0x3b8]
000d118c  add     r1, pc ; -> 0x000fd6d0  
000d118e  ldr     r1, [r1]
000d1190  str     r1, [sp, #0x34]
000d1192  ldr     r1, [pc, #0x3b4]
000d1194  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d1196  ldr     r1, [r1]
000d1198  str     r1, [sp, #0x38]
000d119a  ldr     r1, [sp, #0x3c]
000d119c  str     r1, [sp, #0x40]
000d119e  b       #0xd11a2
000d11a0  ldr     r3, [sp, #0xa4]
000d11a2  movs    r5, #0
000d11a4  b       #0xd11a8
000d11a6  ldr     r3, [sp, #0xa4]
000d11a8  ldr     r3, [r3]
000d11aa  ldr     r1, [sp, #0x50]
000d11ac  cmp     r3, r1
000d11ae  beq     #0xd11b6
000d11b0  ldr     r0, [sp, #0x4c]
000d11b2  blx     #0xddbe4 ; -> objc_enumerationMutation
000d11b6  ldr     r3, [sp, #0xa0]
000d11b8  ldr     r2, [sp, #0x10]
000d11ba  ldr     r1, [sp, #0x20]
000d11bc  ldr.w   r0, [r3, r5, lsl #2]
000d11c0  add     r2, pc
000d11c2  blx     #0xddbfc ; -> objc_msgSend
000d11c6  mov     r4, r0
000d11c8  cmp     r0, #0
000d11ca  beq     #0xd125e
000d11cc  ldr     r1, [sp, #0x28]
000d11ce  blx     #0xddbfc ; -> objc_msgSend
000d11d2  cmp     r0, #2
000d11d4  bne     #0xd125e
000d11d6  movs    r2, #0
000d11d8  mov     r0, r4
000d11da  ldr     r1, [sp, #0x2c]
000d11dc  blx     #0xddbfc ; -> objc_msgSend
000d11e0  movs    r2, #1
000d11e2  ldr     r1, [sp, #0x2c]
000d11e4  mov     r6, r0
000d11e6  mov     r0, r4
000d11e8  blx     #0xddbfc ; -> objc_msgSend
000d11ec  ldr     r2, [pc, #0x35c]
000d11ee  ldr     r1, [sp, #0x30]
000d11f0  add     r2, pc ; -> 0x00182844  
000d11f2  mov     r4, r0
000d11f4  mov     r0, r6
000d11f6  blx     #0xddbfc ; -> objc_msgSend
000d11fa  tst.w   r0, #0xff
000d11fe  it      ne
000d1200  strne   r4, [sp, #0x3c]
000d1202  bne     #0xd125e
000d1204  ldr     r2, [pc, #0x348]
000d1206  mov     r0, r6
000d1208  ldr     r1, [sp, #0x30]
000d120a  add     r2, pc ; -> 0x00182854  
000d120c  blx     #0xddbfc ; -> objc_msgSend
000d1210  tst.w   r0, #0xff
000d1214  beq     #0xd122c
000d1216  mov     r0, r4
000d1218  ldr     r1, [sp, #0x34]
000d121a  blx     #0xddbfc ; -> objc_msgSend
000d121e  tst.w   r0, #0xff
000d1222  ite     eq
000d1224  moveq   r2, #0
000d1226  movne   r2, #1
000d1228  str     r2, [sp, #0x44]
000d122a  b       #0xd125e
000d122c  ldr     r2, [pc, #0x324]
000d122e  mov     r0, r6
000d1230  ldr     r1, [sp, #0x30]
000d1232  add     r2, pc ; -> 0x00182864  
000d1234  blx     #0xddbfc ; -> objc_msgSend
000d1238  tst.w   r0, #0xff
000d123c  it      ne
000d123e  strne   r4, [sp, #0x40]
000d1240  bne     #0xd125e
000d1242  ldr     r2, [pc, #0x314]
000d1244  mov     r0, r6
000d1246  ldr     r1, [sp, #0x30]
000d1248  add     r2, pc ; -> 0x00182874  
000d124a  blx     #0xddbfc ; -> objc_msgSend
000d124e  tst.w   r0, #0xff
000d1252  beq     #0xd125e
000d1254  mov     r0, r4
000d1256  ldr     r1, [sp, #0x38]
000d1258  blx     #0xddbfc ; -> objc_msgSend
000d125c  str     r0, [sp, #0x48]
000d125e  adds    r5, #1
000d1260  cmp     r8, r5
000d1262  bhi     #0xd11a6
000d1264  movs    r3, #0x10
000d1266  ldr     r0, [sp, #0x4c]
000d1268  str     r3, [sp]
000d126a  ldr     r1, [sp, #0x24]
000d126c  add     r2, sp, #0x9c
000d126e  add     r3, sp, #0x5c
000d1270  blx     #0xddbfc ; -> objc_msgSend
000d1274  mov     r8, r0
000d1276  cmp     r0, #0
000d1278  bne     #0xd11a0
000d127a  b       #0xd1286
000d127c  ldr     r3, [sp, #0x3c]
000d127e  movs    r1, #0
000d1280  str     r1, [sp, #0x48]
000d1282  str     r1, [sp, #0x44]
000d1284  str     r3, [sp, #0x40]
000d1286  ldr     r2, [pc, #0x2d4]
000d1288  mov     r1, sl
000d128a  ldr     r3, [sp, #0x3c]
000d128c  add     r2, pc ; -> 0x00182884  
000d128e  mov     r0, fp
000d1290  blx     #0xddbfc ; -> objc_msgSend
000d1294  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d1298  ldr     r2, [pc, #0x2c4]
000d129a  mov     r1, sl
000d129c  ldr     r3, [sp, #0x44]
000d129e  add     r2, pc ; -> 0x00182894  
000d12a0  mov     r0, fp
000d12a2  blx     #0xddbfc ; -> objc_msgSend
000d12a6  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d12aa  ldr     r2, [pc, #0x2b8]
000d12ac  mov     r1, sl
000d12ae  ldr     r3, [sp, #0x40]
000d12b0  add     r2, pc ; -> 0x001828a4  
000d12b2  mov     r0, fp
000d12b4  blx     #0xddbfc ; -> objc_msgSend
000d12b8  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d12bc  ldr     r2, [pc, #0x2a8]
000d12be  mov     r1, sl
000d12c0  ldr     r3, [sp, #0x48]
000d12c2  add     r2, pc ; -> 0x001828b4  
000d12c4  mov     r0, fp
000d12c6  blx     #0xddbfc ; -> objc_msgSend
000d12ca  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d12ce  ldr     r3, [pc, #0x29c]
000d12d0  ldr     r1, [pc, #0x29c]
000d12d2  ldr     r2, [sp, #0x18]
000d12d4  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d12d6  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d12d8  ldr     r3, [r3]
000d12da  ldr     r1, [r1]
000d12dc  ldr     r0, [r2, r3]
000d12de  blx     #0xddbfc ; -> objc_msgSend
000d12e2  cmp     r0, #1
000d12e4  beq     #0xd12fc
000d12e6  ldr     r3, [pc, #0x28c]
000d12e8  ldr     r1, [sp, #0x18]
000d12ea  add     r3, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d12ec  ldr     r3, [r3]
000d12ee  ldr     r0, [r1, r3]
000d12f0  ldr     r1, [pc, #0x284]
000d12f2  add     r1, pc ; -> 0x000fda5c  
000d12f4  ldr     r1, [r1]
000d12f6  blx     #0xddbfc ; -> objc_msgSend
000d12fa  str     r0, [sp, #0x40]
000d12fc  ldr     r2, [sp, #0x44]
000d12fe  cbz     r2, #0xd1322
000d1300  ldr     r3, [pc, #0x278]
000d1302  ldr     r1, [sp, #0x18]
000d1304  ldr     r2, [sp, #0x3c]
000d1306  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1308  ldr     r3, [r3]
000d130a  ldr     r0, [r1, r3]
000d130c  ldr     r1, [pc, #0x270]
000d130e  movs    r3, #0xd
000d1310  str     r3, [sp, #4]
000d1312  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000d1314  ldr     r3, [sp, #0x40]
000d1316  ldr     r1, [r1]
000d1318  str     r2, [sp]
000d131a  movw    r2, #0x7541
000d131e  str     r3, [sp, #8]
000d1320  b       #0xd137c
000d1322  ldr     r1, [sp, #0x48]
000d1324  cmp     r1, #0
000d1326  ble     #0xd135c
000d1328  ldr     r3, [pc, #0x258]
000d132a  ldr     r2, [sp, #0x18]
000d132c  ldr     r1, [pc, #0x258]
000d132e  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1330  ldr     r0, [r3]
000d1332  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000d1334  ldr     r3, [sp, #0x48]
000d1336  ldr     r4, [r1]
000d1338  ldr     r6, [r2, r0]
000d133a  ldr     r2, [pc, #0x250]
000d133c  mov     r1, sl
000d133e  mov     r0, fp
000d1340  add     r2, pc ; -> 0x0017e5c4  
000d1342  blx     #0xddbfc ; -> objc_msgSend
000d1346  ldr     r3, [sp, #0x3c]
000d1348  mov     r1, r4
000d134a  movw    r2, #0x7542
000d134e  str     r3, [sp]
000d1350  movs    r3, #0xf
000d1352  str     r3, [sp, #4]
000d1354  subs    r3, #3
000d1356  str     r0, [sp, #8]
000d1358  mov     r0, r6
000d135a  b       #0xd137e
000d135c  ldr     r3, [pc, #0x230]
000d135e  ldr     r1, [sp, #0x18]
000d1360  ldr     r2, [sp, #0x3c]
000d1362  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1364  ldr     r3, [r3]
000d1366  ldr     r0, [r1, r3]
000d1368  ldr     r1, [pc, #0x228]
000d136a  movs    r3, #0xd
000d136c  str     r3, [sp, #4]
000d136e  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000d1370  ldr     r3, [sp, #0x40]
000d1372  ldr     r1, [r1]
000d1374  str     r2, [sp]
000d1376  movw    r2, #0x7532
000d137a  str     r3, [sp, #8]
000d137c  movs    r3, #0xc
000d137e  blx     #0xddbfc ; -> objc_msgSend
000d1382  bl      #0xbe1a4 ; -> Z18MTX_PostEventsDatav
000d1386  ldr     r3, [pc, #0x210]
000d1388  ldr     r1, [sp, #0x18]
000d138a  ldr     r2, [pc, #0x210]
000d138c  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d138e  ldr     r3, [r3]
000d1390  add     r2, pc ; -> 0x00180a34  
000d1392  ldr     r3, [r1, r3]
000d1394  cmp     r3, r2
000d1396  bne     #0xd13dc
000d1398  ldr     r1, [pc, #0x204]
000d139a  ldr     r4, [pc, #0x208]
000d139c  ldr     r2, [sp, #0x18]
000d139e  add     r1, pc ; -> 0x000fda70  '# \x0f'
000d13a0  add     r4, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d13a2  ldr.w   r8, [r1]
000d13a6  ldr     r1, [pc, #0x200]
000d13a8  ldr     r3, [r4]
000d13aa  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d13ac  ldr     r5, [r1]
000d13ae  ldr     r0, [r2, r3]
000d13b0  ldr     r2, [pc, #0x1f8]
000d13b2  mov     r1, r5
000d13b4  add     r2, pc ; -> 0x00182724  
000d13b6  blx     #0xddbfc ; -> objc_msgSend
000d13ba  ldr     r3, [r4]
000d13bc  ldr     r1, [sp, #0x18]
000d13be  ldr     r2, [pc, #0x1f0]
000d13c0  add     r2, pc ; -> 0x001828c4  
000d13c2  mov     r6, r0
000d13c4  ldr     r0, [r1, r3]
000d13c6  mov     r1, r5
000d13c8  blx     #0xddbfc ; -> objc_msgSend
000d13cc  mov     r1, r8
000d13ce  mov     r2, r6
000d13d0  mov     r3, r0
000d13d2  ldr     r0, [sp, #0x18]
000d13d4  blx     #0xddbfc ; -> objc_msgSend
000d13d8  movs    r0, #0
000d13da  b       #0xd14f0
000d13dc  ldr     r1, [sp, #0x1c]
000d13de  ldr     r0, [sp, #0x14]
000d13e0  blx     #0xddbfc ; -> objc_msgSend
000d13e4  ldr     r1, [pc, #0x1cc]
000d13e6  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d13e8  ldr     r1, [r1]
000d13ea  blx     #0xddbfc ; -> objc_msgSend
000d13ee  ldr     r3, [pc, #0x1c8]
000d13f0  ldr     r1, [sp, #0x18]
000d13f2  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d13f4  ldr     r3, [r3]
000d13f6  mov     r2, r0
000d13f8  ldr     r0, [r1, r3]
000d13fa  ldr     r1, [pc, #0x1c0]
000d13fc  add     r1, pc ; -> 0x000fda78  
000d13fe  ldr     r1, [r1]
000d1400  blx     #0xddbfc ; -> objc_msgSend
000d1404  ldr     r3, [pc, #0x1b8]
000d1406  ldr     r2, [sp, #0x18]
000d1408  add     r3, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d140a  ldr     r0, [r3]
000d140c  ldr     r0, [r2, r0]
000d140e  cbz     r0, #0xd141a
000d1410  ldr     r1, [pc, #0x1b0]
000d1412  add     r1, pc ; -> 0x000fcc1c  'b+\x0e'
000d1414  ldr     r1, [r1]
000d1416  blx     #0xddbfc ; -> objc_msgSend
000d141a  ldr     r3, [pc, #0x1ac]
000d141c  ldr     r1, [sp, #0x18]
000d141e  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1420  ldr     r3, [r3]
000d1422  ldr     r0, [r1, r3]
000d1424  ldr     r1, [pc, #0x1a4]
000d1426  add     r1, pc ; -> 0x000fda14  'R\x14\x0f'
000d1428  ldr     r1, [r1]
000d142a  blx     #0xddbfc ; -> objc_msgSend
000d142e  cmp     r0, #0
000d1430  beq     #0xd14f0
000d1432  ldr     r3, [pc, #0x19c]
000d1434  ldr     r1, [pc, #0x19c]
000d1436  ldr     r2, [sp, #0x18]
000d1438  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d143a  add     r1, pc ; -> 0x000fda24  
000d143c  ldr     r3, [r3]
000d143e  ldr     r1, [r1]
000d1440  movs    r5, #0
000d1442  ldr     r0, [r2, r3]
000d1444  movs    r2, #1
000d1446  blx     #0xddbfc ; -> objc_msgSend
000d144a  ldr     r3, [sp, #0x18]
000d144c  ldr     r0, [pc, #0x188]
000d144e  ldr     r1, [pc, #0x18c]
000d1450  movs    r2, #0
000d1452  str     r3, [sp]
000d1454  ldr     r3, [pc, #0x188]
000d1456  add     r0, pc ; -> 0x000fdb58  
000d1458  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
000d145a  add     r3, pc ; -> 0x000fd8c0  
000d145c  ldr     r0, [r0]
000d145e  ldr     r3, [r3]
000d1460  ldr     r1, [r1]
000d1462  str     r5, [sp, #8]
000d1464  str     r5, [sp, #0xc]
000d1466  str     r3, [sp, #4]
000d1468  ldr     r3, [pc, #0x178]
000d146a  blx     #0xddbfc ; -> objc_msgSend
000d146e  mov     r0, r5
000d1470  b       #0xd14f0
000d1472  cmp     r5, #5
000d1474  bne     #0xd14ee
000d1476  ldr     r3, [pc, #0x170]
000d1478  ldr     r1, [sp, #0x18]
000d147a  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d147c  ldr     r3, [r3]
000d147e  ldr     r0, [r1, r3]
000d1480  ldr     r1, [pc, #0x168]
000d1482  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d1484  ldr     r1, [r1]
000d1486  blx     #0xddbfc ; -> objc_msgSend
000d148a  cmp     r0, #1
000d148c  bne     #0xd1494
000d148e  ldr     r5, [pc, #0x160]
000d1490  add     r5, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d1492  b       #0xd14aa
000d1494  ldr     r3, [pc, #0x15c]
000d1496  ldr     r1, [pc, #0x160]
000d1498  ldr     r2, [sp, #0x18]
000d149a  add     r3, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d149c  add     r1, pc ; -> 0x000fda5c  
000d149e  ldr     r3, [r3]
000d14a0  ldr     r1, [r1]
000d14a2  ldr     r0, [r2, r3]
000d14a4  blx     #0xddbfc ; -> objc_msgSend
000d14a8  mov     r5, r0
000d14aa  ldr     r1, [sp, #0x1c]
000d14ac  ldr     r0, [sp, #0x14]
000d14ae  blx     #0xddbfc ; -> objc_msgSend
000d14b2  ldr     r1, [pc, #0x148]
000d14b4  add     r1, pc ; -> 0x000fda20  '(!\x0f'
000d14b6  ldr     r1, [r1]
000d14b8  blx     #0xddbfc ; -> objc_msgSend
000d14bc  ldr     r1, [pc, #0x140]
000d14be  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d14c0  ldr     r1, [r1]
000d14c2  mov     r4, r0
000d14c4  blx     #0xddbfc ; -> objc_msgSend
000d14c8  cmp     r0, #0
000d14ca  ble     #0xd14ee
000d14cc  ldr     r3, [pc, #0x134]
000d14ce  ldr     r1, [pc, #0x138]
000d14d0  movw    r2, #0x7534
000d14d4  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d14d6  add     r1, pc ; -> 0x000fd8e0  '\r\x15\x0f'
000d14d8  ldr     r0, [r3]
000d14da  ldr     r3, [sp, #0x18]
000d14dc  ldr     r1, [r1]
000d14de  ldr     r0, [r3, r0]
000d14e0  movs    r3, #0xd
000d14e2  str     r3, [sp, #4]
000d14e4  subs    r3, #1
000d14e6  str     r4, [sp]
000d14e8  str     r5, [sp, #8]
000d14ea  blx     #0xddbfc ; -> objc_msgSend
000d14ee  movs    r0, #1
000d14f0  sub.w   sp, r7, #0x18
000d14f4  pop.w   {r8, sl, fp}
000d14f8  pop     {r4, r5, r6, r7, pc}
000d14fa  nop     
000d14fc  rev     r4, r7
000d14fe  movs    r2, r0
000d1500  ldm     r2, {r2, r3, r5, r6, r7}
000d1502  movs    r2, r0
000d1504  cbnz    r0, #0xd1582
000d1506  movs    r2, r0
000d1508  asrs    r0, r1, #0x1e
000d150a  movs    r3, r1
000d150c  ldm     r1, {r1, r2, r3, r7}
000d150e  movs    r2, r0
000d1510  ldm     r1!, {r5, r6}
000d1512  movs    r2, r0
000d1514  pop     {pc}
000d1516  movs    r2, r0
000d1518  asrs    r2, r3, #0x1d
000d151a  movs    r3, r1
000d151c  pop     {r2, r6, r7}
000d151e  movs    r2, r0
000d1520  asrs    r2, r6, #0x1c
000d1522  movs    r3, r1
000d1524  bne     #0xd14e4
000d1526  movs    r2, r1
000d1528  bkpt    #0x6e
000d152a  movs    r2, r0
000d152c  bvc     #0xd1620
000d152e  movs    r2, r1
