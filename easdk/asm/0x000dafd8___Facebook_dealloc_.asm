========================================================================
-[Facebook dealloc]  0x000dafd8  180 bytes   Facebook.m
========================================================================

000dafd8  push    {r4, r5, r7, lr}
000dafda  add     r7, sp, #8
000dafdc  sub     sp, #8
000dafde  ldr     r3, [pc, #0x84]
000dafe0  ldr     r1, [pc, #0x84]
000dafe2  mov     r5, r0
000dafe4  add     r3, pc ; -> 0x000fc508  OBJC_IVAR_$_Facebook._accessToken
000dafe6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dafe8  ldr     r3, [r3]
000dafea  ldr     r4, [r1]
000dafec  ldr     r0, [r0, r3]
000dafee  mov     r1, r4
000daff0  blx     #0xddbfc ; -> objc_msgSend
000daff4  ldr     r3, [pc, #0x74]
000daff6  mov     r1, r4
000daff8  add     r3, pc ; -> 0x000fc504  OBJC_IVAR_$_Facebook._expirationDate
000daffa  ldr     r3, [r3]
000daffc  ldr     r0, [r5, r3]
000daffe  blx     #0xddbfc ; -> objc_msgSend
000db002  ldr     r3, [pc, #0x6c]
000db004  mov     r1, r4
000db006  add     r3, pc ; -> 0x000fc510  OBJC_IVAR_$_Facebook._request
000db008  ldr     r3, [r3]
000db00a  ldr     r0, [r5, r3]
000db00c  blx     #0xddbfc ; -> objc_msgSend
000db010  ldr     r3, [pc, #0x60]
000db012  mov     r1, r4
000db014  add     r3, pc ; -> 0x000fc514  OBJC_IVAR_$_Facebook._loginDialog
000db016  ldr     r3, [r3]
000db018  ldr     r0, [r5, r3]
000db01a  blx     #0xddbfc ; -> objc_msgSend
000db01e  ldr     r3, [pc, #0x58]
000db020  mov     r1, r4
000db022  add     r3, pc ; -> 0x000fc518  OBJC_IVAR_$_Facebook._fbDialog
000db024  ldr     r3, [r3]
000db026  ldr     r0, [r5, r3]
000db028  blx     #0xddbfc ; -> objc_msgSend
000db02c  ldr     r3, [pc, #0x4c]
000db02e  mov     r1, r4
000db030  add     r3, pc ; -> 0x000fc51c  OBJC_IVAR_$_Facebook._appId
000db032  ldr     r3, [r3]
000db034  ldr     r0, [r5, r3]
000db036  blx     #0xddbfc ; -> objc_msgSend
000db03a  ldr     r3, [pc, #0x44]
000db03c  mov     r1, r4
000db03e  add     r3, pc ; -> 0x000fc520  OBJC_IVAR_$_Facebook._permissions
000db040  ldr     r3, [r3]
000db042  ldr     r0, [r5, r3]
000db044  blx     #0xddbfc ; -> objc_msgSend
000db048  ldr     r3, [pc, #0x38]
000db04a  ldr     r1, [pc, #0x3c]
000db04c  mov     r0, sp
000db04e  add     r3, pc ; -> 0x000fde00  
000db050  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000db052  ldr     r3, [r3]
000db054  ldr     r1, [r1]
000db056  str     r5, [sp]
000db058  str     r3, [sp, #4]
000db05a  blx     #0xddc08 ; -> objc_msgSendSuper2
000db05e  sub.w   sp, r7, #8
000db062  pop     {r4, r5, r7, pc}
000db064  asrs    r0, r4, #0x14
000db066  movs    r2, r0
000db068  adds    r2, r2, r6
000db06a  movs    r2, r0
000db06c  asrs    r0, r1, #0x14
000db06e  movs    r2, r0
000db070  asrs    r6, r0, #0x14
000db072  movs    r2, r0
000db074  asrs    r4, r7, #0x13
000db076  movs    r2, r0
000db078  asrs    r2, r6, #0x13
000db07a  movs    r2, r0
000db07c  asrs    r0, r5, #0x13
000db07e  movs    r2, r0
000db080  asrs    r6, r3, #0x13
000db082  movs    r2, r0
000db084  cmp     r5, #0xae
000db086  movs    r2, r0
000db088  adds    r4, r1, r5
000db08a  movs    r2, r0
