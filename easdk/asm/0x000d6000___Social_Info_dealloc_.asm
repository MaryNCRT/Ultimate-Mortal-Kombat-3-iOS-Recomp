========================================================================
-[Social_Info dealloc]  0x000d6000  596 bytes   Social_Info.mm
========================================================================

000d6000  push    {r4, r5, r7, lr}
000d6002  add     r7, sp, #8
000d6004  sub     sp, #8
000d6006  ldr     r3, [pc, #0x1c8]
000d6008  ldr     r1, [pc, #0x1c8]
000d600a  mov     r4, r0
000d600c  add     r3, pc ; -> 0x000fae84  OBJC_IVAR_$_Social_Info.challengeId
000d600e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d6010  ldr     r3, [r3]
000d6012  ldr     r5, [r1]
000d6014  ldr     r0, [r0, r3]
000d6016  mov     r1, r5
000d6018  blx     #0xddbfc ; -> objc_msgSend
000d601c  ldr     r3, [pc, #0x1b8]
000d601e  mov     r1, r5
000d6020  add     r3, pc ; -> 0x000fae88  OBJC_IVAR_$_Social_Info.opponentId
000d6022  ldr     r3, [r3]
000d6024  ldr     r0, [r4, r3]
000d6026  blx     #0xddbfc ; -> objc_msgSend
000d602a  ldr     r3, [pc, #0x1b0]
000d602c  mov     r1, r5
000d602e  add     r3, pc ; -> 0x000fae8c  OBJC_IVAR_$_Social_Info.friendId
000d6030  ldr     r3, [r3]
000d6032  ldr     r0, [r4, r3]
000d6034  blx     #0xddbfc ; -> objc_msgSend
000d6038  ldr     r3, [pc, #0x1a4]
000d603a  mov     r1, r5
000d603c  add     r3, pc ; -> 0x000fae90  OBJC_IVAR_$_Social_Info.language
000d603e  ldr     r3, [r3]
000d6040  ldr     r0, [r4, r3]
000d6042  blx     #0xddbfc ; -> objc_msgSend
000d6046  ldr     r3, [pc, #0x19c]
000d6048  mov     r1, r5
000d604a  add     r3, pc ; -> 0x000fae94  OBJC_IVAR_$_Social_Info.achievementTypeCode
000d604c  ldr     r3, [r3]
000d604e  ldr     r0, [r4, r3]
000d6050  blx     #0xddbfc ; -> objc_msgSend
000d6054  ldr     r3, [pc, #0x190]
000d6056  mov     r1, r5
000d6058  add     r3, pc ; -> 0x000fae98  OBJC_IVAR_$_Social_Info.friendsList
000d605a  ldr     r3, [r3]
000d605c  ldr     r0, [r4, r3]
000d605e  blx     #0xddbfc ; -> objc_msgSend
000d6062  ldr     r3, [pc, #0x188]
000d6064  mov     r1, r5
000d6066  add     r3, pc ; -> 0x000fae6c  OBJC_IVAR_$_Social_Info.params
000d6068  ldr     r3, [r3]
000d606a  ldr     r0, [r4, r3]
000d606c  blx     #0xddbfc ; -> objc_msgSend
000d6070  ldr     r3, [pc, #0x17c]
000d6072  mov     r1, r5
000d6074  add     r3, pc ; -> 0x000fae9c  OBJC_IVAR_$_Social_Info.gameName
000d6076  ldr     r3, [r3]
000d6078  ldr     r0, [r4, r3]
000d607a  blx     #0xddbfc ; -> objc_msgSend
000d607e  ldr     r3, [pc, #0x174]
000d6080  mov     r1, r5
000d6082  add     r3, pc ; -> 0x000faea0  OBJC_IVAR_$_Social_Info.gameVersion
000d6084  ldr     r3, [r3]
000d6086  ldr     r0, [r4, r3]
000d6088  blx     #0xddbfc ; -> objc_msgSend
000d608c  ldr     r3, [pc, #0x168]
000d608e  mov     r1, r5
000d6090  add     r3, pc ; -> 0x000faea4  OBJC_IVAR_$_Social_Info.platform
000d6092  ldr     r3, [r3]
000d6094  ldr     r0, [r4, r3]
000d6096  blx     #0xddbfc ; -> objc_msgSend
000d609a  ldr     r3, [pc, #0x160]
000d609c  mov     r1, r5
000d609e  add     r3, pc ; -> 0x000faea8  OBJC_IVAR_$_Social_Info.fbuid
000d60a0  ldr     r3, [r3]
000d60a2  ldr     r0, [r4, r3]
000d60a4  blx     #0xddbfc ; -> objc_msgSend
000d60a8  ldr     r3, [pc, #0x154]
000d60aa  mov     r1, r5
000d60ac  add     r3, pc ; -> 0x000faeac  OBJC_IVAR_$_Social_Info.fbAccessToken
000d60ae  ldr     r3, [r3]
000d60b0  ldr     r0, [r4, r3]
000d60b2  blx     #0xddbfc ; -> objc_msgSend
000d60b6  ldr     r3, [pc, #0x14c]
000d60b8  mov     r1, r5
000d60ba  add     r3, pc ; -> 0x000faeb0  OBJC_IVAR_$_Social_Info.mhSessionKey
000d60bc  ldr     r3, [r3]
000d60be  ldr     r0, [r4, r3]
000d60c0  blx     #0xddbfc ; -> objc_msgSend
000d60c4  ldr     r3, [pc, #0x140]
000d60c6  mov     r1, r5
000d60c8  add     r3, pc ; -> 0x000faeb4  OBJC_IVAR_$_Social_Info.appName
000d60ca  ldr     r3, [r3]
000d60cc  ldr     r0, [r4, r3]
000d60ce  blx     #0xddbfc ; -> objc_msgSend
000d60d2  ldr     r3, [pc, #0x138]
000d60d4  mov     r1, r5
000d60d6  add     r3, pc ; -> 0x000faeb8  OBJC_IVAR_$_Social_Info.achievementTypes
000d60d8  ldr     r3, [r3]
000d60da  ldr     r0, [r4, r3]
000d60dc  blx     #0xddbfc ; -> objc_msgSend
000d60e0  ldr     r3, [pc, #0x12c]
000d60e2  mov     r1, r5
000d60e4  add     r3, pc ; -> 0x000fae70  OBJC_IVAR_$_Social_Info.mUser
000d60e6  ldr     r3, [r3]
000d60e8  ldr     r0, [r4, r3]
000d60ea  blx     #0xddbfc ; -> objc_msgSend
000d60ee  ldr     r3, [pc, #0x124]
000d60f0  mov     r1, r5
000d60f2  add     r3, pc ; -> 0x000fae78  OBJC_IVAR_$_Social_Info.friendsArray
000d60f4  ldr     r3, [r3]
000d60f6  ldr     r0, [r4, r3]
000d60f8  blx     #0xddbfc ; -> objc_msgSend
000d60fc  ldr     r3, [pc, #0x118]
000d60fe  mov     r1, r5
000d6100  add     r3, pc ; -> 0x000fae80  OBJC_IVAR_$_Social_Info.completedChallenges
000d6102  ldr     r3, [r3]
000d6104  ldr     r0, [r4, r3]
000d6106  blx     #0xddbfc ; -> objc_msgSend
000d610a  ldr     r3, [pc, #0x110]
000d610c  mov     r1, r5
000d610e  add     r3, pc ; -> 0x000fae7c  OBJC_IVAR_$_Social_Info.pendingChallenges
000d6110  ldr     r3, [r3]
000d6112  ldr     r0, [r4, r3]
000d6114  blx     #0xddbfc ; -> objc_msgSend
000d6118  ldr     r3, [pc, #0x104]
000d611a  mov     r1, r5
000d611c  add     r3, pc ; -> 0x000faebc  OBJC_IVAR_$_Social_Info.currentStatType
000d611e  ldr     r3, [r3]
000d6120  ldr     r0, [r4, r3]
000d6122  blx     #0xddbfc ; -> objc_msgSend
000d6126  ldr     r3, [pc, #0xfc]
000d6128  mov     r1, r5
000d612a  add     r3, pc ; -> 0x000faec0  OBJC_IVAR_$_Social_Info.currentPeriod
000d612c  ldr     r3, [r3]
000d612e  ldr     r0, [r4, r3]
000d6130  blx     #0xddbfc ; -> objc_msgSend
000d6134  ldr     r3, [pc, #0xf0]
000d6136  mov     r1, r5
000d6138  add     r3, pc ; -> 0x000faec4  OBJC_IVAR_$_Social_Info.templateId
000d613a  ldr     r3, [r3]
000d613c  ldr     r0, [r4, r3]
000d613e  blx     #0xddbfc ; -> objc_msgSend
000d6142  ldr     r3, [pc, #0xe8]
000d6144  mov     r1, r5
000d6146  add     r3, pc ; -> 0x000faec8  OBJC_IVAR_$_Social_Info.currentGamedata
000d6148  ldr     r3, [r3]
000d614a  ldr     r0, [r4, r3]
000d614c  blx     #0xddbfc ; -> objc_msgSend
000d6150  ldr     r3, [pc, #0xdc]
000d6152  mov     r1, r5
000d6154  add     r3, pc ; -> 0x000faecc  OBJC_IVAR_$_Social_Info.challengesMayhemIds
000d6156  ldr     r3, [r3]
000d6158  ldr     r0, [r4, r3]
000d615a  blx     #0xddbfc ; -> objc_msgSend
000d615e  ldr     r3, [pc, #0xd4]
000d6160  mov     r1, r5
000d6162  add     r3, pc ; -> 0x000fb76c  OBJC_IVAR_$_Social_Info.leaderboardsIndex
000d6164  ldr     r3, [r3]
000d6166  ldr     r0, [r4, r3]
000d6168  blx     #0xddbfc ; -> objc_msgSend
000d616c  ldr     r3, [pc, #0xc8]
000d616e  mov     r1, r5
000d6170  add     r3, pc ; -> 0x000fae64  OBJC_IVAR_$_Social_Info.friendsLBQ
000d6172  ldr     r3, [r3]
000d6174  ldr     r0, [r4, r3]
000d6176  blx     #0xddbfc ; -> objc_msgSend
000d617a  ldr     r3, [pc, #0xc0]
000d617c  mov     r1, r5
000d617e  add     r3, pc ; -> 0x000fae74  OBJC_IVAR_$_Social_Info.friendsLastUpdatedTime
000d6180  ldr     r3, [r3]
000d6182  ldr     r0, [r4, r3]
000d6184  blx     #0xddbfc ; -> objc_msgSend
000d6188  ldr     r3, [pc, #0xb4]
000d618a  mov     r1, r5
000d618c  add     r3, pc ; -> 0x000faed0  OBJC_IVAR_$_Social_Info.achievementsUserId
000d618e  ldr     r3, [r3]
000d6190  ldr     r0, [r4, r3]
000d6192  blx     #0xddbfc ; -> objc_msgSend
000d6196  ldr     r3, [pc, #0xac]
000d6198  mov     r1, r5
000d619a  add     r3, pc ; -> 0x000fb77c  OBJC_IVAR_$_Social_Info.permissions
000d619c  ldr     r3, [r3]
000d619e  ldr     r0, [r4, r3]
000d61a0  blx     #0xddbfc ; -> objc_msgSend
000d61a4  ldr     r3, [pc, #0xa0]
000d61a6  mov     r1, r5
000d61a8  add     r3, pc ; -> 0x000fae68  OBJC_IVAR_$_Social_Info.friendsIdsQ
000d61aa  ldr     r3, [r3]
000d61ac  ldr     r0, [r4, r3]
000d61ae  blx     #0xddbfc ; -> objc_msgSend
000d61b2  ldr     r3, [pc, #0x98]
000d61b4  ldr     r1, [pc, #0x98]
000d61b6  mov     r0, sp
000d61b8  add     r3, pc ; -> 0x000fdde8  
000d61ba  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d61bc  ldr     r3, [r3]
000d61be  ldr     r1, [r1]
000d61c0  str     r4, [sp]
000d61c2  str     r3, [sp, #4]
000d61c4  blx     #0xddc08 ; -> objc_msgSendSuper2
000d61c8  sub.w   sp, r7, #8
000d61cc  pop     {r4, r5, r7, pc}
000d61ce  nop     
000d61d0  ldr     r6, [pc, #0x1d0]
000d61d2  movs    r2, r0
000d61d4  ldr     r2, [r5, #0x14]
000d61d6  movs    r2, r0
000d61d8  ldr     r6, [pc, #0x190]
000d61da  movs    r2, r0
000d61dc  ldr     r6, [pc, #0x168]
000d61de  movs    r2, r0
000d61e0  ldr     r6, [pc, #0x140]
000d61e2  movs    r2, r0
000d61e4  ldr     r6, [pc, #0x118]
000d61e6  movs    r2, r0
000d61e8  ldr     r6, [pc, #0xf0]
000d61ea  movs    r2, r0
000d61ec  ldr     r6, [pc, #8]
000d61ee  movs    r2, r0
000d61f0  ldr     r6, [pc, #0x90]
000d61f2  movs    r2, r0
000d61f4  ldr     r6, [pc, #0x68]
000d61f6  movs    r2, r0
000d61f8  ldr     r6, [pc, #0x40]
000d61fa  movs    r2, r0
000d61fc  ldr     r6, [pc, #0x18]
000d61fe  movs    r2, r0
000d6200  ldr     r5, [pc, #0x3f0]
000d6202  movs    r2, r0
000d6204  ldr     r5, [pc, #0x3c8]
000d6206  movs    r2, r0
000d6208  ldr     r5, [pc, #0x3a0]
000d620a  movs    r2, r0
000d620c  ldr     r5, [pc, #0x378]
000d620e  movs    r2, r0
000d6210  ldr     r5, [pc, #0x220]
000d6212  movs    r2, r0
000d6214  ldr     r5, [pc, #0x208]
000d6216  movs    r2, r0
000d6218  ldr     r5, [pc, #0x1f0]
000d621a  movs    r2, r0
000d621c  ldr     r5, [pc, #0x1a8]
000d621e  movs    r2, r0
000d6220  ldr     r5, [pc, #0x270]
000d6222  movs    r2, r0
000d6224  ldr     r5, [pc, #0x248]
000d6226  movs    r2, r0
000d6228  ldr     r5, [pc, #0x220]
000d622a  movs    r2, r0
000d622c  ldr     r5, [pc, #0x1f8]
000d622e  movs    r2, r0
000d6230  ldr     r5, [pc, #0x1d0]
000d6232  movs    r2, r0
000d6234  ldrsb   r6, [r0, r0]
000d6236  movs    r2, r0
000d6238  ldr     r4, [pc, #0x3c0]
000d623a  movs    r2, r0
000d623c  ldr     r4, [pc, #0x3c8]
000d623e  movs    r2, r0
000d6240  ldr     r5, [pc, #0x100]
000d6242  movs    r2, r0
000d6244  strb    r6, [r3, r7]
000d6246  movs    r2, r0
000d6248  ldr     r4, [pc, #0x2f0]
000d624a  movs    r2, r0
000d624c  ldrb    r4, [r5, #0x10]
000d624e  movs    r2, r0
000d6250  str     r2, [r4, #0x7c]
000d6252  movs    r2, r0
