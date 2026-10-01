========================================================================
-[FacebookAgent request  0x000db95c  1104 bytes   FacebookAgent.mm
========================================================================

000db95c  push    {r4, r5, r6, r7, lr}
000db95e  add     r7, sp, #0xc
000db960  str     r8, [sp, #-0x4]!
000db964  mov     r5, r3
000db966  ldr     r3, [pc, #0x348]
000db968  mov     r4, r0
000db96a  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db96c  ldr     r2, [r3]
000db96e  ldr     r3, [r0, r2]
000db970  cmp     r3, #1
000db972  bne     #0xdb9fa
000db974  ldr     r1, [pc, #0x33c]
000db976  ldr     r0, [pc, #0x340]
000db978  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000db97a  add     r0, pc ; -> 0x000fdc14  
000db97c  ldr     r6, [r1]
000db97e  ldr     r1, [pc, #0x33c]
000db980  ldr     r0, [r0]
000db982  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000db984  ldr     r1, [r1]
000db986  blx     #0xddbfc ; -> objc_msgSend
000db98a  mov     r1, r6
000db98c  mov     r2, r0
000db98e  mov     r0, r5
000db990  blx     #0xddbfc ; -> objc_msgSend
000db994  tst.w   r0, #0xff
000db998  beq     #0xdb9aa
000db99a  ldr     r1, [pc, #0x324]
000db99c  mov     r0, r5
000db99e  movs    r2, #0
000db9a0  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000db9a2  ldr     r1, [r1]
000db9a4  blx     #0xddbfc ; -> objc_msgSend
000db9a8  mov     r5, r0
000db9aa  ldr     r3, [pc, #0x318]
000db9ac  ldr     r1, [pc, #0x318]
000db9ae  ldr     r6, [pc, #0x31c]
000db9b0  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000db9b2  add     r1, pc ; -> 0x000fd998  '\x06\x0c\x0f'
000db9b4  ldr     r3, [r3]
000db9b6  add     r6, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000db9b8  ldr.w   r8, [r1]
000db9bc  ldr     r1, [pc, #0x310]
000db9be  movs    r2, #0
000db9c0  str     r2, [r4, r3]
000db9c2  ldr     r3, [r6]
000db9c4  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000db9c6  mov     r2, r8
000db9c8  ldr     r1, [r1]
000db9ca  ldr     r0, [r4, r3]
000db9cc  blx     #0xddbfc ; -> objc_msgSend
000db9d0  tst.w   r0, #0xff
000db9d4  beq.w   #0xdbca8
000db9d8  ldr     r3, [pc, #0x2f8]
000db9da  ldr     r0, [r6]
000db9dc  ldr.w   r1, [pc, #0x2f8]
000db9e0  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000db9e2  ldr     r6, [r4, r0]
000db9e4  ldr     r0, [r3]
000db9e6  add     r1, pc ; -> 0x000fd9c8  '\x13\x1c\x0f'
000db9e8  ldr     r1, [r1]
000db9ea  ldr     r0, [r4, r0]
000db9ec  blx     #0xddbfc ; -> objc_msgSend
000db9f0  mov     r1, r8
000db9f2  mov     r2, r5
000db9f4  mov     r3, r0
000db9f6  mov     r0, r6
000db9f8  b       #0xdbaec
000db9fa  cmp     r3, #2
000db9fc  bne     #0xdba18
000db9fe  ldr     r6, [pc, #0x2dc]
000dba00  ldr     r1, [pc, #0x2dc]
000dba02  subs    r3, #2
000dba04  add     r6, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dba06  str     r3, [r0, r2]
000dba08  ldr     r3, [r6]
000dba0a  add     r1, pc ; -> 0x000fd994  
000dba0c  ldr.w   r8, [r1]
000dba10  ldr     r1, [pc, #0x2d0]
000dba12  ldr     r0, [r0, r3]
000dba14  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dba16  b       #0xdba34
000dba18  cmp     r3, #3
000dba1a  bne     #0xdba4e
000dba1c  ldr     r6, [pc, #0x2c8]
000dba1e  ldr     r1, [pc, #0x2cc]
000dba20  subs    r3, #3
000dba22  add     r6, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dba24  str     r3, [r0, r2]
000dba26  ldr     r3, [r6]
000dba28  add     r1, pc ; -> 0x000fd990  
000dba2a  ldr.w   r8, [r1]
000dba2e  ldr     r1, [pc, #0x2c0]
000dba30  ldr     r0, [r0, r3]
000dba32  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dba34  ldr     r1, [r1]
000dba36  mov     r2, r8
000dba38  blx     #0xddbfc ; -> objc_msgSend
000dba3c  tst.w   r0, #0xff
000dba40  beq.w   #0xdbca8
000dba44  ldr     r0, [r6]
000dba46  mov     r1, r8
000dba48  mov     r2, r5
000dba4a  ldr     r0, [r4, r0]
000dba4c  b       #0xdbca4
000dba4e  cmp     r3, #8
000dba50  bne     #0xdbb02
000dba52  ldr     r1, [pc, #0x2a0]
000dba54  ldr.w   r0, [pc, #0x2a0]
000dba58  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000dba5a  add     r0, pc ; -> 0x000fdc14  
000dba5c  ldr     r6, [r1]
000dba5e  ldr     r1, [pc, #0x29c]
000dba60  ldr     r0, [r0]
000dba62  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000dba64  ldr     r1, [r1]
000dba66  blx     #0xddbfc ; -> objc_msgSend
000dba6a  mov     r1, r6
000dba6c  mov     r2, r0
000dba6e  mov     r0, r5
000dba70  blx     #0xddbfc ; -> objc_msgSend
000dba74  tst.w   r0, #0xff
000dba78  beq     #0xdba8a
000dba7a  ldr     r1, [pc, #0x284]
000dba7c  mov     r0, r5
000dba7e  movs    r2, #0
000dba80  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000dba82  ldr     r1, [r1]
000dba84  blx     #0xddbfc ; -> objc_msgSend
000dba88  mov     r5, r0
000dba8a  ldr     r1, [pc, #0x278]
000dba8c  ldr     r3, [pc, #0x278]
000dba8e  ldr     r2, [pc, #0x27c]
000dba90  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000dba92  add     r3, pc ; -> 0x000fc8c4  OBJC_IVAR_$_FacebookAgent.hasOfflinePermission
000dba94  add     r2, pc ; -> 0x0017eab4  
000dba96  ldr     r1, [r1]
000dba98  mov     r0, r5
000dba9a  ldr     r6, [r3]
000dba9c  blx     #0xddbfc ; -> objc_msgSend
000dbaa0  ldr     r1, [pc, #0x26c]
000dbaa2  add     r1, pc ; -> 0x000fd6d0  
000dbaa4  ldr     r1, [r1]
000dbaa6  blx     #0xddbfc ; -> objc_msgSend
000dbaaa  ldr     r3, [pc, #0x268]
000dbaac  add     r3, pc ; -> 0x000fc8cc  OBJC_IVAR_$_FacebookAgent.permissionRequested
000dbaae  strb    r0, [r4, r6]
000dbab0  ldr     r2, [r3]
000dbab2  ldrsb   r2, [r4, r2]
000dbab4  cbz     r2, #0xdbaf2
000dbab6  ldr     r3, [pc, #0x260]
000dbab8  ldr     r1, [pc, #0x260]
000dbaba  ldr     r5, [pc, #0x264]
000dbabc  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbabe  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dbac0  ldr     r3, [r3]
000dbac2  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbac4  ldr     r6, [r1]
000dbac6  ldr     r1, [pc, #0x25c]
000dbac8  movs    r2, #0
000dbaca  str     r2, [r4, r3]
000dbacc  ldr     r3, [r5]
000dbace  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbad0  mov     r2, r6
000dbad2  ldr     r1, [r1]
000dbad4  ldr     r0, [r4, r3]
000dbad6  blx     #0xddbfc ; -> objc_msgSend
000dbada  tst.w   r0, #0xff
000dbade  beq.w   #0xdbca8
000dbae2  ldr     r0, [r5]
000dbae4  movs    r2, #1
000dbae6  mov     r1, r6
000dbae8  mov     r3, r2
000dbaea  ldr     r0, [r4, r0]
000dbaec  blx     #0xddbfc ; -> objc_msgSend
000dbaf0  b       #0xdbca8
000dbaf2  ldr     r1, [pc, #0x234]
000dbaf4  mov     r0, r4
000dbaf6  mov     r3, r2
000dbaf8  add     r1, pc ; -> 0x000fd9ac  'i\x1b\x0f'
000dbafa  ldr     r1, [r1]
000dbafc  blx     #0xddbfc ; -> objc_msgSend
000dbb00  b       #0xdbca8
000dbb02  cmp     r3, #7
000dbb04  bne     #0xdbbb4
000dbb06  ldr.w   r1, [pc, #0x224]
000dbb0a  ldr     r0, [pc, #0x224]
000dbb0c  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000dbb0e  add     r0, pc ; -> 0x000fdc14  
000dbb10  ldr     r6, [r1]
000dbb12  ldr     r1, [pc, #0x220]
000dbb14  ldr     r0, [r0]
000dbb16  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000dbb18  ldr     r1, [r1]
000dbb1a  blx     #0xddbfc ; -> objc_msgSend
000dbb1e  mov     r1, r6
000dbb20  mov     r2, r0
000dbb22  mov     r0, r5
000dbb24  blx     #0xddbfc ; -> objc_msgSend
000dbb28  tst.w   r0, #0xff
000dbb2c  beq     #0xdbb3e
000dbb2e  ldr     r1, [pc, #0x208]
000dbb30  mov     r0, r5
000dbb32  movs    r2, #0
000dbb34  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000dbb36  ldr     r1, [r1]
000dbb38  blx     #0xddbfc ; -> objc_msgSend
000dbb3c  mov     r5, r0
000dbb3e  ldr     r1, [pc, #0x1fc]
000dbb40  ldr     r3, [pc, #0x1fc]
000dbb42  ldr     r2, [pc, #0x200]
000dbb44  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000dbb46  add     r3, pc ; -> 0x000fc8c0  OBJC_IVAR_$_FacebookAgent.hasPublishPermission
000dbb48  add     r2, pc ; -> 0x00182554  
000dbb4a  ldr     r1, [r1]
000dbb4c  mov     r0, r5
000dbb4e  ldr     r6, [r3]
000dbb50  blx     #0xddbfc ; -> objc_msgSend
000dbb54  ldr     r1, [pc, #0x1f0]
000dbb56  add     r1, pc ; -> 0x000fd6d0  
000dbb58  ldr     r1, [r1]
000dbb5a  blx     #0xddbfc ; -> objc_msgSend
000dbb5e  ldr     r3, [pc, #0x1ec]
000dbb60  add     r3, pc ; -> 0x000fc8cc  OBJC_IVAR_$_FacebookAgent.permissionRequested
000dbb62  strb    r0, [r4, r6]
000dbb64  ldr     r3, [r3]
000dbb66  ldrsb   r3, [r4, r3]
000dbb68  cbz     r3, #0xdbba6
000dbb6a  ldr     r3, [pc, #0x1e4]
000dbb6c  ldr     r1, [pc, #0x1e4]
000dbb6e  ldr     r5, [pc, #0x1e8]
000dbb70  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbb72  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dbb74  ldr     r3, [r3]
000dbb76  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbb78  ldr     r6, [r1]
000dbb7a  ldr     r1, [pc, #0x1e0]
000dbb7c  mov.w   r8, #0
000dbb80  str.w   r8, [r4, r3]
000dbb84  ldr     r3, [r5]
000dbb86  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbb88  mov     r2, r6
000dbb8a  ldr     r1, [r1]
000dbb8c  ldr     r0, [r4, r3]
000dbb8e  blx     #0xddbfc ; -> objc_msgSend
000dbb92  tst.w   r0, #0xff
000dbb96  beq.w   #0xdbca8
000dbb9a  ldr     r0, [r5]
000dbb9c  movs    r2, #1
000dbb9e  mov     r1, r6
000dbba0  mov     r3, r8
000dbba2  ldr     r0, [r4, r0]
000dbba4  b       #0xdbaec
000dbba6  ldr     r1, [pc, #0x1b8]
000dbba8  mov     r0, r4
000dbbaa  add     r1, pc ; -> 0x000fd98c  '}\x1b\x0f'
000dbbac  ldr     r1, [r1]
000dbbae  blx     #0xddbfc ; -> objc_msgSend
000dbbb2  b       #0xdbca8
000dbbb4  cmp     r3, #6
000dbbb6  bne     #0xdbbe8
000dbbb8  ldr.w   r1, [pc, #0x1a8]
000dbbbc  ldr     r5, [pc, #0x1a8]
000dbbbe  subs    r3, #6
000dbbc0  add     r1, pc ; -> 0x000fd988  
000dbbc2  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbbc4  ldr     r6, [r1]
000dbbc6  ldr     r1, [pc, #0x1a4]
000dbbc8  str     r3, [r0, r2]
000dbbca  ldr     r3, [r5]
000dbbcc  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbbce  mov     r2, r6
000dbbd0  ldr     r1, [r1]
000dbbd2  ldr     r0, [r0, r3]
000dbbd4  blx     #0xddbfc ; -> objc_msgSend
000dbbd8  tst.w   r0, #0xff
000dbbdc  beq     #0xdbca8
000dbbde  ldr     r0, [r5]
000dbbe0  movs    r2, #1
000dbbe2  mov     r1, r6
000dbbe4  ldr     r0, [r4, r0]
000dbbe6  b       #0xdbca4
000dbbe8  cmp     r3, #0xa
000dbbea  bne     #0xdbca8
000dbbec  ldr     r1, [pc, #0x180]
000dbbee  ldr     r0, [pc, #0x184]
000dbbf0  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000dbbf2  add     r0, pc ; -> 0x000fdc14  
000dbbf4  ldr     r6, [r1]
000dbbf6  ldr     r1, [pc, #0x180]
000dbbf8  ldr     r0, [r0]
000dbbfa  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000dbbfc  ldr     r1, [r1]
000dbbfe  blx     #0xddbfc ; -> objc_msgSend
000dbc02  mov     r1, r6
000dbc04  mov     r2, r0
000dbc06  mov     r0, r5
000dbc08  blx     #0xddbfc ; -> objc_msgSend
000dbc0c  tst.w   r0, #0xff
000dbc10  beq     #0xdbc6c
000dbc12  ldr     r1, [pc, #0x168]
000dbc14  mov     r0, r5
000dbc16  movs    r2, #0
000dbc18  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000dbc1a  ldr     r5, [pc, #0x164]
000dbc1c  ldr     r1, [r1]
000dbc1e  blx     #0xddbfc ; -> objc_msgSend
000dbc22  ldr     r1, [pc, #0x160]
000dbc24  ldr     r3, [pc, #0x160]
000dbc26  ldr     r2, [pc, #0x164]
000dbc28  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dbc2a  add     r3, pc ; -> 0x000fdb5c  
000dbc2c  ldr     r6, [r1]
000dbc2e  ldr     r1, [pc, #0x160]
000dbc30  add     r2, pc ; -> 0x00182564  
000dbc32  ldr.w   r8, [r3]
000dbc36  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000dbc38  add     r5, pc ; -> 0x0017ef54  
000dbc3a  ldr     r1, [r1]
000dbc3c  blx     #0xddbfc ; -> objc_msgSend
000dbc40  mov     r1, r6
000dbc42  mov     r2, r5
000dbc44  mov     r3, r0
000dbc46  mov     r0, r8
000dbc48  blx     #0xddbfc ; -> objc_msgSend
000dbc4c  cbz     r0, #0xdbc6c
000dbc4e  ldr     r3, [pc, #0x144]
000dbc50  ldr     r1, [pc, #0x144]
000dbc52  add     r3, pc ; -> 0x000fc550  OBJC_IVAR_$_FacebookAgent.fbLikeId
000dbc54  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000dbc56  ldr     r3, [r3]
000dbc58  ldr     r1, [r1]
000dbc5a  ldr     r2, [r4, r3]
000dbc5c  blx     #0xddbfc ; -> objc_msgSend
000dbc60  tst.w   r0, #0xff
000dbc64  it      ne
000dbc66  movne.w r8, #1
000dbc6a  bne     #0xdbc70
000dbc6c  mov.w   r8, #0
000dbc70  ldr     r3, [pc, #0x128]
000dbc72  ldr     r1, [pc, #0x12c]
000dbc74  ldr     r5, [pc, #0x12c]
000dbc76  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbc78  add     r1, pc ; -> 0x000fd984  
000dbc7a  ldr     r3, [r3]
000dbc7c  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbc7e  ldr     r6, [r1]
000dbc80  ldr     r1, [pc, #0x124]
000dbc82  movs    r2, #0
000dbc84  str     r2, [r4, r3]
000dbc86  ldr     r3, [r5]
000dbc88  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbc8a  mov     r2, r6
000dbc8c  ldr     r1, [r1]
000dbc8e  ldr     r0, [r4, r3]
000dbc90  blx     #0xddbfc ; -> objc_msgSend
000dbc94  tst.w   r0, #0xff
000dbc98  beq     #0xdbca8
000dbc9a  ldr     r0, [r5]
000dbc9c  sxtb.w  r2, r8
000dbca0  mov     r1, r6
000dbca2  ldr     r0, [r4, r0]
000dbca4  blx     #0xddbfc ; -> objc_msgSend
000dbca8  ldr     r8, [sp], #4
000dbcac  pop     {r4, r5, r6, r7, pc}
000dbcae  nop     
000dbcb0  lsrs    r2, r3, #0x1d
000dbcb2  movs    r2, r0
000dbcb4  asrs    r4, r0, #0x14
000dbcb6  movs    r2, r0
000dbcb8  movs    r2, #0x96
000dbcba  movs    r2, r0
000dbcbc  asrs    r6, r0, #2
000dbcbe  movs    r2, r0
000dbcc0  asrs    r0, r3, #3
000dbcc2  movs    r2, r0
000dbcc4  lsrs    r4, r2, #0x1c
000dbcc6  movs    r2, r0
000dbcc8  subs    r2, r4, #7
000dbcca  movs    r2, r0
000dbccc  lsrs    r6, r6, #0x1b
000dbcce  movs    r2, r0
000dbcd0  asrs    r0, r1, #0xb
000dbcd2  movs    r2, r0
000dbcd4  lsrs    r4, r2, #0x1b
000dbcd6  movs    r2, r0
000dbcd8  subs    r6, r3, #7
000dbcda  movs    r2, r0
000dbcdc  lsrs    r0, r5, #0x1a
000dbcde  movs    r2, r0
000dbce0  subs    r6, r0, #6
000dbce2  movs    r2, r0
000dbce4  asrs    r0, r7, #9
000dbce6  movs    r2, r0
000dbce8  lsrs    r2, r1, #0x1a
000dbcea  movs    r2, r0
000dbcec  subs    r4, r4, #5
000dbcee  movs    r2, r0
000dbcf0  asrs    r2, r3, #9
000dbcf2  movs    r2, r0
000dbcf4  asrs    r4, r4, #0x10
000dbcf6  movs    r2, r0
000dbcf8  movs    r1, #0xb6
000dbcfa  movs    r2, r0
000dbcfc  lsrs    r6, r4, #0x1e
000dbcfe  movs    r2, r0
000dbd00  lsrs    r0, r7, #0x1f
000dbd02  movs    r2, r0
000dbd04  asrs    r4, r3, #1
000dbd06  movs    r2, r0
000dbd08  lsrs    r6, r5, #0x18
000dbd0a  movs    r2, r0
000dbd0c  adds    r0, #0x1c
000dbd0e  movs    r2, r1
000dbd10  adds    r2, r5, #0
000dbd12  movs    r2, r0
000dbd14  lsrs    r4, r3, #0x18
000dbd16  movs    r2, r0
000dbd18  lsrs    r0, r1, #0x18
000dbd1a  movs    r2, r0
000dbd1c  subs    r2, r4, #3
000dbd1e  movs    r2, r0
000dbd20  lsrs    r2, r5, #0x17
000dbd22  movs    r2, r0
000dbd24  asrs    r6, r7, #6
000dbd26  movs    r2, r0
000dbd28  subs    r0, r6, #2
000dbd2a  movs    r2, r0
000dbd2c  asrs    r0, r6, #0xd
000dbd2e  movs    r2, r0
000dbd30  movs    r1, #2
000dbd32  movs    r2, r0
000dbd34  lsrs    r2, r6, #0x1b
000dbd36  movs    r2, r0
000dbd38  lsrs    r4, r0, #0x1d
000dbd3a  movs    r2, r0
000dbd3c  lsrs    r0, r5, #0x1e
000dbd3e  movs    r2, r0
000dbd40  lsrs    r6, r6, #0x15
000dbd42  movs    r2, r0
000dbd44  ldr     r0, [r1, #0x20]
000dbd46  movs    r2, r1
000dbd48  subs    r6, r6, r5
000dbd4a  movs    r2, r0
000dbd4c  lsrs    r0, r5, #0x15
000dbd4e  movs    r2, r0
000dbd50  lsrs    r4, r2, #0x15
000dbd52  movs    r2, r0
000dbd54  subs    r6, r5, #0
000dbd56  movs    r2, r0
000dbd58  lsrs    r6, r6, #0x14
000dbd5a  movs    r2, r0
000dbd5c  asrs    r6, r0, #4
000dbd5e  movs    r2, r0
000dbd60  adds    r6, r3, #7
000dbd62  movs    r2, r0
000dbd64  adds    r4, r0, #7
000dbd66  movs    r2, r0
000dbd68  lsrs    r2, r5, #0x13
000dbd6a  movs    r2, r0
000dbd6c  asrs    r0, r0, #3
000dbd6e  movs    r2, r0
000dbd70  asrs    r4, r1, #0xa
000dbd72  movs    r2, r0
000dbd74  movs    r0, #0x1e
000dbd76  movs    r2, r0
000dbd78  lsrs    r6, r1, #0x18
000dbd7a  movs    r2, r0
000dbd7c  lsrs    r0, r4, #0x19
000dbd7e  movs    r2, r0
000dbd80  adds    r3, #0x18
000dbd82  movs    r2, r1
000dbd84  lsrs    r4, r6, #0x19
000dbd86  movs    r2, r0
000dbd88  subs    r6, r5, #4
000dbd8a  movs    r2, r0
000dbd8c  ldr     r0, [r6, #0x10]
000dbd8e  movs    r2, r1
000dbd90  lsrs    r6, r6, #0x1a
000dbd92  movs    r2, r0
000dbd94  lsrs    r2, r7, #3
000dbd96  movs    r2, r0
000dbd98  asrs    r4, r1, #0x20
000dbd9a  movs    r2, r0
000dbd9c  lsrs    r6, r1, #0x11
000dbd9e  movs    r2, r0
000dbda0  adds    r0, r1, #4
000dbda2  movs    r2, r0
000dbda4  lsrs    r0, r6, #0x10
000dbda6  movs    r2, r0
000dbda8  asrs    r4, r0, #0x20
000dbdaa  movs    r2, r0
