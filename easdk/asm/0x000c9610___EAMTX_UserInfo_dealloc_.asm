========================================================================
-[EAMTX_UserInfo dealloc]  0x000c9610  344 bytes   EAMTX_UserInfo.mm
========================================================================

000c9610  push    {r4, r5, r7, lr}
000c9612  add     r7, sp, #8
000c9614  sub     sp, #8
000c9616  ldr     r3, [pc, #0x104]
000c9618  ldr     r1, [pc, #0x104]
000c961a  mov     r5, r0
000c961c  add     r3, pc ; -> 0x000f84f0  OBJC_IVAR_$_EAMTX_UserInfo.m_Email
000c961e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c9620  ldr     r3, [r3]
000c9622  ldr     r4, [r1]
000c9624  ldr     r0, [r0, r3]
000c9626  mov     r1, r4
000c9628  blx     #0xddbfc ; -> objc_msgSend
000c962c  ldr     r3, [pc, #0xf4]
000c962e  mov     r1, r4
000c9630  add     r3, pc ; -> 0x000f84f4  OBJC_IVAR_$_EAMTX_UserInfo.m_Password
000c9632  ldr     r3, [r3]
000c9634  ldr     r0, [r5, r3]
000c9636  blx     #0xddbfc ; -> objc_msgSend
000c963a  ldr     r3, [pc, #0xec]
000c963c  mov     r1, r4
000c963e  add     r3, pc ; -> 0x000f84f8  OBJC_IVAR_$_EAMTX_UserInfo.m_DOB
000c9640  ldr     r3, [r3]
000c9642  ldr     r0, [r5, r3]
000c9644  blx     #0xddbfc ; -> objc_msgSend
000c9648  ldr     r3, [pc, #0xe0]
000c964a  mov     r1, r4
000c964c  add     r3, pc ; -> 0x000f84fc  OBJC_IVAR_$_EAMTX_UserInfo.m_LangCode
000c964e  ldr     r3, [r3]
000c9650  ldr     r0, [r5, r3]
000c9652  blx     #0xddbfc ; -> objc_msgSend
000c9656  ldr     r3, [pc, #0xd8]
000c9658  mov     r1, r4
000c965a  add     r3, pc ; -> 0x000f8500  OBJC_IVAR_$_EAMTX_UserInfo.m_AppVersion
000c965c  ldr     r3, [r3]
000c965e  ldr     r0, [r5, r3]
000c9660  blx     #0xddbfc ; -> objc_msgSend
000c9664  ldr     r3, [pc, #0xcc]
000c9666  mov     r1, r4
000c9668  add     r3, pc ; -> 0x000f8504  OBJC_IVAR_$_EAMTX_UserInfo.m_DeviceToken
000c966a  ldr     r3, [r3]
000c966c  ldr     r0, [r5, r3]
000c966e  blx     #0xddbfc ; -> objc_msgSend
000c9672  ldr     r3, [pc, #0xc4]
000c9674  mov     r1, r4
000c9676  add     r3, pc ; -> 0x000f8508  OBJC_IVAR_$_EAMTX_UserInfo.m_ListLastUpdatedTime
000c9678  ldr     r3, [r3]
000c967a  ldr     r0, [r5, r3]
000c967c  blx     #0xddbfc ; -> objc_msgSend
000c9680  ldr     r3, [pc, #0xb8]
000c9682  mov     r1, r4
000c9684  add     r3, pc ; -> 0x000f850c  OBJC_IVAR_$_EAMTX_UserInfo.m_ItemsLastUpdatedTime
000c9686  ldr     r3, [r3]
000c9688  ldr     r0, [r5, r3]
000c968a  blx     #0xddbfc ; -> objc_msgSend
000c968e  ldr     r3, [pc, #0xb0]
000c9690  mov     r1, r4
000c9692  add     r3, pc ; -> 0x000f8510  OBJC_IVAR_$_EAMTX_UserInfo.m_TrackingData
000c9694  ldr     r3, [r3]
000c9696  ldr     r0, [r5, r3]
000c9698  blx     #0xddbfc ; -> objc_msgSend
000c969c  ldr     r3, [pc, #0xa4]
000c969e  mov     r1, r4
000c96a0  add     r3, pc ; -> 0x000f8514  OBJC_IVAR_$_EAMTX_UserInfo.m_EventsCounter
000c96a2  ldr     r3, [r3]
000c96a4  ldr     r0, [r5, r3]
000c96a6  blx     #0xddbfc ; -> objc_msgSend
000c96aa  ldr     r3, [pc, #0x9c]
000c96ac  mov     r1, r4
000c96ae  add     r3, pc ; -> 0x000f8518  OBJC_IVAR_$_EAMTX_UserInfo.m_DisabledEvents
000c96b0  ldr     r3, [r3]
000c96b2  ldr     r0, [r5, r3]
000c96b4  blx     #0xddbfc ; -> objc_msgSend
000c96b8  ldr     r3, [pc, #0x90]
000c96ba  mov     r1, r4
000c96bc  add     r3, pc ; -> 0x000f851c  OBJC_IVAR_$_EAMTX_UserInfo.m_Messages
000c96be  ldr     r3, [r3]
000c96c0  ldr     r0, [r5, r3]
000c96c2  blx     #0xddbfc ; -> objc_msgSend
000c96c6  ldr     r3, [pc, #0x88]
000c96c8  mov     r1, r4
000c96ca  add     r3, pc ; -> 0x000f8520  OBJC_IVAR_$_EAMTX_UserInfo.m_ExcludedMessageIds
000c96cc  ldr     r3, [r3]
000c96ce  ldr     r0, [r5, r3]
000c96d0  blx     #0xddbfc ; -> objc_msgSend
000c96d4  ldr     r3, [pc, #0x7c]
000c96d6  mov     r1, r4
000c96d8  add     r3, pc ; -> 0x000f8524  OBJC_IVAR_$_EAMTX_UserInfo.m_BundleId
000c96da  ldr     r3, [r3]
000c96dc  ldr     r0, [r5, r3]
000c96de  blx     #0xddbfc ; -> objc_msgSend
000c96e2  ldr     r3, [pc, #0x74]
000c96e4  mov     r1, r4
000c96e6  add     r3, pc ; -> 0x000f8528  OBJC_IVAR_$_EAMTX_UserInfo.m_MayhemGameCode
000c96e8  ldr     r3, [r3]
000c96ea  ldr     r0, [r5, r3]
000c96ec  blx     #0xddbfc ; -> objc_msgSend
000c96f0  ldr     r3, [pc, #0x68]
000c96f2  mov     r1, r4
000c96f4  add     r3, pc ; -> 0x000f852c  OBJC_IVAR_$_EAMTX_UserInfo.m_FacebookAppId
000c96f6  ldr     r3, [r3]
000c96f8  ldr     r0, [r5, r3]
000c96fa  blx     #0xddbfc ; -> objc_msgSend
000c96fe  ldr     r3, [pc, #0x60]
000c9700  ldr     r1, [pc, #0x60]
000c9702  mov     r0, sp
000c9704  add     r3, pc ; -> 0x000fdda0  
000c9706  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000c9708  ldr     r3, [r3]
000c970a  ldr     r1, [r1]
000c970c  str     r5, [sp]
000c970e  str     r3, [sp, #4]
000c9710  blx     #0xddc08 ; -> objc_msgSendSuper2
000c9714  sub.w   sp, r7, #8
000c9718  pop     {r4, r5, r7, pc}
000c971a  nop     
000c971c  cdp     p0, #0xd, c0, c0, c2, #0
000c9720  adds    r3, #0x5a
000c9722  movs    r3, r0
000c9724  cdp     p0, #0xc, c0, c0, c2, #0
000c9728  cdp     p0, #0xb, c0, c6, c2, #0
000c972c  cdp     p0, #0xa, c0, c12, c2, #0
000c9730  cdp     p0, #0xa, c0, c2, c2, #0
000c9734  cdp     p0, #9, c0, c8, c2, #0
000c9738  cdp     p0, #8, c0, c14, c2, #0
000c973c  cdp     p0, #8, c0, c4, c2, #0
000c9740  cdp     p0, #7, c0, c10, c2, #0
000c9744  cdp     p0, #7, c0, c0, c2, #0
000c9748  cdp     p0, #6, c0, c6, c2, #0
000c974c  cdp     p0, #5, c0, c12, c2, #0
000c9750  cdp     p0, #5, c0, c2, c2, #0
000c9754  cdp     p0, #4, c0, c8, c2, #0
000c9758  cdp     p0, #3, c0, c14, c2, #0
000c975c  cdp     p0, #3, c0, c4, c2, #0
000c9760  mov     r8, r3
000c9762  movs    r3, r0
000c9764  adds    r2, #0x96
000c9766  movs    r3, r0
