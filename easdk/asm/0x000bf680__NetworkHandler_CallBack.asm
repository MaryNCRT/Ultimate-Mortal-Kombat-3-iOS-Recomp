========================================================================
NetworkHandler_CallBack  0x000bf680  9364 bytes   EAMTX_Main.mm
========================================================================

000bf680  push    {r4, r5, r6, r7, lr}
000bf682  add     r7, sp, #0xc
000bf684  push.w  {r8, sl, fp}
000bf688  sub     sp, #0xcc
000bf68a  str     r3, [sp, #0xc]
000bf68c  sub.w   r3, r0, #0x20
000bf690  cmp     r3, #0x10
000bf692  mov     r5, r0
000bf694  mov     r6, r1
000bf696  mov     r8, r2
000bf698  bhi     #0xbf6a4
000bf69a  ldr     r3, [sp, #0xc]
000bf69c  bl      #0xb7954 ; -> Z23SocialResponse_CallBackiP8NSStringii
000bf6a0  b.w     #0xc19ba
000bf6a4  ldr.w   r0, [pc, #0xbf0]
000bf6a8  add     r0, pc ; -> 0x00180b64  
000bf6aa  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bf6ae  ldr.w   r1, [pc, #0xbec]
000bf6b2  ldr.w   r0, [pc, #0xbec]
000bf6b6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bf6b8  add     r0, pc ; -> 0x000fdc70  
000bf6ba  ldr     r1, [r1]
000bf6bc  ldr     r0, [r0]
000bf6be  str     r1, [sp, #0x10]
000bf6c0  blx     #0xddbfc ; -> objc_msgSend
000bf6c4  ldr.w   r1, [pc, #0xbdc]
000bf6c8  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bf6ca  ldr     r1, [r1]
000bf6cc  str     r1, [sp, #0x14]
000bf6ce  blx     #0xddbfc ; -> objc_msgSend
000bf6d2  ldr.w   r1, [pc, #0xbd4]
000bf6d6  mov     r2, r6
000bf6d8  add     r1, pc ; -> 0x000fd4b4  
000bf6da  ldr     r1, [r1]
000bf6dc  mov     r4, r0
000bf6de  blx     #0xddbfc ; -> objc_msgSend
000bf6e2  ldr.w   r1, [pc, #0xbc8]
000bf6e6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bf6e8  ldr     r1, [r1]
000bf6ea  str     r1, [sp, #0x18]
000bf6ec  mov     sl, r0
000bf6ee  mov     fp, r0
000bf6f0  mov     r0, r4
000bf6f2  blx     #0xddbfc ; -> objc_msgSend
000bf6f6  ldr.w   r1, [pc, #0xbb8]
000bf6fa  ldr.w   r2, [pc, #0xbb8]
000bf6fe  mov     r0, sl
000bf700  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bf702  add     r2, pc ; -> 0x001803f4  
000bf704  ldr     r1, [r1]
000bf706  str     r1, [sp, #0x1c]
000bf708  blx     #0xddbfc ; -> objc_msgSend
000bf70c  ldr.w   r1, [pc, #0xba8]
000bf710  add     r1, pc ; -> 0x000fd4b0  
000bf712  ldr     r1, [r1]
000bf714  blx     #0xddbfc ; -> objc_msgSend
000bf718  ldr.w   r2, [pc, #0xba0]
000bf71c  add     r2, pc ; -> 0x00180b74  
000bf71e  vmov    d7, r0, r1
000bf722  ldr.w   r0, [pc, #0xb9c]
000bf726  ldr.w   r1, [pc, #0xb9c]
000bf72a  vcvt.s32.f64 s14, d7
000bf72e  add     r0, pc ; -> 0x000fdb5c  
000bf730  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bf732  ldr     r0, [r0]
000bf734  ldr     r1, [r1]
000bf736  vmov    r3, s14
000bf73a  vmov    r4, s14
000bf73e  str     r1, [sp, #0x24]
000bf740  str     r0, [sp, #0x20]
000bf742  blx     #0xddbfc ; -> objc_msgSend
000bf746  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bf74a  subs    r3, r5, #1
000bf74c  cmp     r3, #0x35
000bf74e  bhi.w   #0xc18a6
000bf752  addw    r2, pc, #8
000bf756  add.w   r2, r2, r3, lsl #2
000bf75a  mov     pc, r2
000bf75c  b.w     #0xbf838
000bf760  b.w     #0xc18a6
000bf764  b.w     #0xbff5c
000bf768  b.w     #0xc012c
000bf76c  b.w     #0xc18a6
000bf770  b.w     #0xbfa22
000bf774  b.w     #0xc18a6
000bf778  b.w     #0xbf8a0
000bf77c  b.w     #0xc0ac6
000bf780  b.w     #0xbff12
000bf784  b.w     #0xc0998
000bf788  b.w     #0xc0b04
000bf78c  b.w     #0xc0b62
000bf790  b.w     #0xc0bc8
000bf794  b.w     #0xc0c44
000bf798  b.w     #0xc1564
000bf79c  b.w     #0xc0fc6
000bf7a0  b.w     #0xc14d4
000bf7a4  b.w     #0xc161a
000bf7a8  b.w     #0xc159a
000bf7ac  b.w     #0xc15d6
000bf7b0  b.w     #0xc1678
000bf7b4  b.w     #0xc1438
000bf7b8  b.w     #0xc1712
000bf7bc  b.w     #0xc1736
000bf7c0  b.w     #0xc0c94
000bf7c4  b.w     #0xc18a6
000bf7c8  b.w     #0xc01fc
000bf7cc  b.w     #0xc0244
000bf7d0  b.w     #0xc0284
000bf7d4  b.w     #0xc18a6
000bf7d8  b.w     #0xc18a6
000bf7dc  b.w     #0xc18a6
000bf7e0  b.w     #0xc18a6
000bf7e4  b.w     #0xc18a6
000bf7e8  b.w     #0xc18a6
000bf7ec  b.w     #0xc18a6
000bf7f0  b.w     #0xc18a6
000bf7f4  b.w     #0xc18a6
000bf7f8  b.w     #0xc18a6
000bf7fc  b.w     #0xc18a6
000bf800  b.w     #0xc18a6
000bf804  b.w     #0xc18a6
000bf808  b.w     #0xc18a6
000bf80c  b.w     #0xc18a6
000bf810  b.w     #0xc18a6
000bf814  b.w     #0xc18a6
000bf818  b.w     #0xc18a6
000bf81c  b.w     #0xc18a6
000bf820  b.w     #0xc1758
000bf824  b.w     #0xc178e
000bf828  b.w     #0xc18a6
000bf82c  b.w     #0xc1844
000bf830  b.w     #0xc17c2
000bf834  b.w     #0xc18a6
000bf838  cmp     r4, #0
000bf83a  blt     #0xbf86e
000bf83c  ldr.w   r3, [pc, #0xa88]
000bf840  add     r3, pc ; -> 0x0038c1a9  m_bDebugEnabled
000bf842  ldrb    r3, [r3]
000bf844  cbz     r3, #0xbf850
000bf846  movs    r0, #1
000bf848  ldr     r1, [sp, #0xc]
000bf84a  movs    r2, #0
000bf84c  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bf850  ldr.w   r0, [pc, #0xa78]
000bf854  ldr.w   r1, [pc, #0xa78]
000bf858  ldr.w   r2, [pc, #0xa78]
000bf85c  add     r0, pc ; -> 0x0038c0e4  mtxController
000bf85e  add     r1, pc ; -> 0x000fd4ac  
000bf860  add     r2, pc ; -> 0x0038c118  eventsToPost
000bf862  ldr     r0, [r0]
000bf864  ldr     r1, [r1]
000bf866  ldr     r2, [r2]
000bf868  blx     #0xddbfc ; -> objc_msgSend
000bf86c  b       #0xbf892
000bf86e  ldr.w   r3, [pc, #0xa68]
000bf872  add     r3, pc ; -> 0x0038c1a9  m_bDebugEnabled
000bf874  ldrb    r3, [r3]
000bf876  cbz     r3, #0xbf892
000bf878  ldr.w   r2, [pc, #0xa60]
000bf87c  ldr     r1, [sp, #0x24]
000bf87e  ldr     r0, [sp, #0x20]
000bf880  add     r2, pc ; -> 0x0017e5c4  
000bf882  mov     r3, r4
000bf884  blx     #0xddbfc ; -> objc_msgSend
000bf888  ldr     r1, [sp, #0xc]
000bf88a  mov     r2, r0
000bf88c  movs    r0, #2
000bf88e  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bf892  ldr.w   r3, [pc, #0xa4c]
000bf896  movs    r2, #0
000bf898  add     r3, pc ; -> 0x0038c1a9  m_bDebugEnabled
000bf89a  strb    r2, [r3]
000bf89c  b.w     #0xc18a6
000bf8a0  cmp     r4, #0
000bf8a2  blt.w   #0xc18a6
000bf8a6  ldr.w   r2, [pc, #0xa3c]
000bf8aa  mov     r0, sl
000bf8ac  ldr     r1, [sp, #0x1c]
000bf8ae  add     r2, pc ; -> 0x00180b84  
000bf8b0  blx     #0xddbfc ; -> objc_msgSend
000bf8b4  ldr.w   r1, [pc, #0xa30]
000bf8b8  ldr.w   r5, [pc, #0xa30]
000bf8bc  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bf8be  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bf8c0  ldr     r1, [r1]
000bf8c2  blx     #0xddbfc ; -> objc_msgSend
000bf8c6  ldr.w   r1, [pc, #0xa28]
000bf8ca  add     r1, pc ; -> 0x000fd4a8  
000bf8cc  ldr     r1, [r1]
000bf8ce  mov     r2, r0
000bf8d0  ldr     r0, [r5]
000bf8d2  subs    r2, #0
000bf8d4  it      ne
000bf8d6  movne   r2, #1
000bf8d8  blx     #0xddbfc ; -> objc_msgSend
000bf8dc  ldr.w   r2, [pc, #0xa14]
000bf8e0  mov     r0, sl
000bf8e2  ldr     r1, [sp, #0x1c]
000bf8e4  add     r2, pc ; -> 0x00180b94  
000bf8e6  blx     #0xddbfc ; -> objc_msgSend
000bf8ea  ldr.w   r1, [pc, #0xa0c]
000bf8ee  add     r1, pc ; -> 0x000fd650  
000bf8f0  ldr.w   sl, [r1]
000bf8f4  mov     r1, sl
000bf8f6  mov     r4, r0
000bf8f8  ldr     r0, [r5]
000bf8fa  blx     #0xddbfc ; -> objc_msgSend
000bf8fe  ldr.w   r1, [pc, #0x9fc]
000bf902  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bf904  ldr     r1, [r1]
000bf906  blx     #0xddbfc ; -> objc_msgSend
000bf90a  cbz     r4, #0xbf932
000bf90c  ldr.w   r1, [pc, #0x9f0]
000bf910  mov     r0, r4
000bf912  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bf914  ldr     r1, [r1]
000bf916  blx     #0xddbfc ; -> objc_msgSend
000bf91a  cbz     r0, #0xbf932
000bf91c  mov     r1, sl
000bf91e  ldr     r0, [r5]
000bf920  blx     #0xddbfc ; -> objc_msgSend
000bf924  ldr.w   r1, [pc, #0x9dc]
000bf928  mov     r2, r4
000bf92a  add     r1, pc ; -> 0x000fd4a4  
000bf92c  ldr     r1, [r1]
000bf92e  blx     #0xddbfc ; -> objc_msgSend
000bf932  ldr.w   r5, [pc, #0x9d4]
000bf936  ldr.w   r1, [pc, #0x9d4]
000bf93a  ldr.w   r4, [pc, #0x9d4]
000bf93e  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bf940  add     r1, pc ; -> 0x000fd654  
000bf942  ldr     r0, [r5]
000bf944  ldr     r1, [r1]
000bf946  blx     #0xddbfc ; -> objc_msgSend
000bf94a  add     r4, pc ; -> 0x00180ba4  
000bf94c  ldr     r1, [sp, #0x24]
000bf94e  mov     r2, r4
000bf950  ldr.w   r4, [pc, #0x9c0]
000bf954  add     r4, pc ; -> 0x00180bb4  
000bf956  mov     r3, r0
000bf958  ldr     r0, [sp, #0x20]
000bf95a  blx     #0xddbfc ; -> objc_msgSend
000bf95e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bf962  mov     r1, sl
000bf964  ldr     r0, [r5]
000bf966  blx     #0xddbfc ; -> objc_msgSend
000bf96a  ldr.w   r1, [pc, #0x9ac]
000bf96e  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bf970  ldr     r1, [r1]
000bf972  blx     #0xddbfc ; -> objc_msgSend
000bf976  mov     r2, r4
000bf978  ldr     r1, [sp, #0x24]
000bf97a  mov     r3, r0
000bf97c  ldr     r0, [sp, #0x20]
000bf97e  blx     #0xddbfc ; -> objc_msgSend
000bf982  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bf986  mov     r1, sl
000bf988  ldr     r0, [r5]
000bf98a  movs    r3, #0
000bf98c  str     r3, [sp, #0xac]
000bf98e  str     r3, [sp, #0xb0]
000bf990  str     r3, [sp, #0xb4]
000bf992  str     r3, [sp, #0xb8]
000bf994  str     r3, [sp, #0xbc]
000bf996  str     r3, [sp, #0xc0]
000bf998  str     r3, [sp, #0xc4]
000bf99a  str     r3, [sp, #0xc8]
000bf99c  blx     #0xddbfc ; -> objc_msgSend
000bf9a0  ldr.w   r1, [pc, #0x978]
000bf9a4  movs    r3, #0x10
000bf9a6  add     r2, sp, #0xac
000bf9a8  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000bf9aa  str     r3, [sp]
000bf9ac  ldr.w   fp, [r1]
000bf9b0  add     r3, sp, #0x6c
000bf9b2  mov     r1, fp
000bf9b4  str     r0, [sp, #0x28]
000bf9b6  blx     #0xddbfc ; -> objc_msgSend
000bf9ba  cmp     r0, #0
000bf9bc  beq.w   #0xc18a6
000bf9c0  ldr     r3, [sp, #0xb4]
000bf9c2  ldr.w   r8, [pc, #0x95c]
000bf9c6  mov     r5, r0
000bf9c8  ldr     r6, [r3]
000bf9ca  b       #0xbf9ce
000bf9cc  ldr     r3, [sp, #0xb4]
000bf9ce  movs    r4, #0
000bf9d0  b       #0xbf9d4
000bf9d2  ldr     r3, [sp, #0xb4]
000bf9d4  ldr     r3, [r3]
000bf9d6  cmp     r3, r6
000bf9d8  beq     #0xbf9ec
000bf9da  ldr.w   r0, [pc, #0x948]
000bf9de  mov     r1, sl
000bf9e0  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bf9e2  ldr     r0, [r0]
000bf9e4  blx     #0xddbfc ; -> objc_msgSend
000bf9e8  blx     #0xddbe4 ; -> objc_enumerationMutation
000bf9ec  ldr     r3, [sp, #0xb0]
000bf9ee  ldr     r1, [sp, #0x24]
000bf9f0  mov     r2, r8
000bf9f2  ldr     r0, [sp, #0x20]
000bf9f4  ldr.w   r3, [r3, r4, lsl #2]
000bf9f8  add     r2, pc
000bf9fa  blx     #0xddbfc ; -> objc_msgSend
000bf9fe  adds    r4, #1
000bfa00  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfa04  cmp     r5, r4
000bfa06  bhi     #0xbf9d2
000bfa08  movs    r3, #0x10
000bfa0a  ldr     r0, [sp, #0x28]
000bfa0c  str     r3, [sp]
000bfa0e  mov     r1, fp
000bfa10  add     r2, sp, #0xac
000bfa12  add     r3, sp, #0x6c
000bfa14  blx     #0xddbfc ; -> objc_msgSend
000bfa18  mov     r5, r0
000bfa1a  cmp     r0, #0
000bfa1c  bne     #0xbf9cc
000bfa1e  b.w     #0xc18a6
000bfa22  cmp     r4, #0
000bfa24  blt.w   #0xbfe3a
000bfa28  ldr.w   r2, [pc, #0x8fc]
000bfa2c  ldr     r1, [sp, #0x1c]
000bfa2e  mov     r0, sl
000bfa30  add     r2, pc ; -> 0x0017ff24  
000bfa32  blx     #0xddbfc ; -> objc_msgSend
000bfa36  ldr.w   r1, [pc, #0x8f4]
000bfa3a  ldr.w   r4, [pc, #0x8f4]
000bfa3e  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bfa40  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000bfa42  ldr     r5, [r1]
000bfa44  mov     r1, r5
000bfa46  blx     #0xddbfc ; -> objc_msgSend
000bfa4a  ldr.w   r1, [pc, #0x8e8]
000bfa4e  add     r1, pc ; -> 0x000fd4a0  
000bfa50  ldr     r1, [r1]
000bfa52  mov     r2, r0
000bfa54  ldr     r0, [r4]
000bfa56  blx     #0xddbfc ; -> objc_msgSend
000bfa5a  ldr.w   r2, [pc, #0x8dc]
000bfa5e  ldr     r1, [sp, #0x1c]
000bfa60  mov     r0, sl
000bfa62  add     r2, pc ; -> 0x00180bd4  
000bfa64  blx     #0xddbfc ; -> objc_msgSend
000bfa68  mov     r1, r5
000bfa6a  blx     #0xddbfc ; -> objc_msgSend
000bfa6e  ldr.w   r1, [pc, #0x8cc]
000bfa72  add     r1, pc ; -> 0x000fd49c  
000bfa74  ldr     r1, [r1]
000bfa76  mov     r2, r0
000bfa78  ldr     r0, [r4]
000bfa7a  blx     #0xddbfc ; -> objc_msgSend
000bfa7e  ldr.w   r2, [pc, #0x8c0]
000bfa82  ldr     r1, [sp, #0x1c]
000bfa84  mov     r0, sl
000bfa86  add     r2, pc ; -> 0x00180be4  
000bfa88  blx     #0xddbfc ; -> objc_msgSend
000bfa8c  ldr.w   r1, [pc, #0x8b4]
000bfa90  add     r1, pc ; -> 0x000fd498  
000bfa92  ldr     r1, [r1]
000bfa94  mov     r2, r0
000bfa96  ldr     r0, [r4]
000bfa98  blx     #0xddbfc ; -> objc_msgSend
000bfa9c  ldr.w   r2, [pc, #0x8a8]
000bfaa0  ldr     r1, [sp, #0x1c]
000bfaa2  mov     r0, sl
000bfaa4  add     r2, pc ; -> 0x0017fed4  
000bfaa6  blx     #0xddbfc ; -> objc_msgSend
000bfaaa  mov     r1, r5
000bfaac  blx     #0xddbfc ; -> objc_msgSend
000bfab0  ldr.w   r1, [pc, #0x898]
000bfab4  add     r1, pc ; -> 0x000fd494  
000bfab6  ldr     r1, [r1]
000bfab8  mov     r2, r0
000bfaba  ldr     r0, [r4]
000bfabc  blx     #0xddbfc ; -> objc_msgSend
000bfac0  ldr.w   r2, [pc, #0x88c]
000bfac4  ldr     r1, [sp, #0x1c]
000bfac6  mov     r0, sl
000bfac8  add     r2, pc ; -> 0x001809a4  
000bfaca  blx     #0xddbfc ; -> objc_msgSend
000bface  mov     r1, r5
000bfad0  blx     #0xddbfc ; -> objc_msgSend
000bfad4  ldr.w   r1, [pc, #0x87c]
000bfad8  add     r1, pc ; -> 0x000fd490  
000bfada  ldr     r1, [r1]
000bfadc  mov     r2, r0
000bfade  ldr     r0, [r4]
000bfae0  blx     #0xddbfc ; -> objc_msgSend
000bfae4  ldr.w   r0, [pc, #0x870]
000bfae8  ldr.w   r1, [pc, #0x870]
000bfaec  add     r0, pc ; -> 0x0038c0e4  mtxController
000bfaee  add     r1, pc ; -> 0x000fd48c  
000bfaf0  ldr     r0, [r0]
000bfaf2  ldr     r1, [r1]
000bfaf4  blx     #0xddbfc ; -> objc_msgSend
000bfaf8  ldr.w   r2, [pc, #0x864]
000bfafc  ldr     r1, [sp, #0x1c]
000bfafe  mov     r0, sl
000bfb00  add     r2, pc ; -> 0x00180bf4  
000bfb02  blx     #0xddbfc ; -> objc_msgSend
000bfb06  ldr.w   r1, [pc, #0x85c]
000bfb0a  add     r1, pc ; -> 0x000fd488  
000bfb0c  ldr     r1, [r1]
000bfb0e  mov     r2, r0
000bfb10  ldr     r0, [r4]
000bfb12  blx     #0xddbfc ; -> objc_msgSend
000bfb16  ldr.w   r2, [pc, #0x850]
000bfb1a  ldr     r1, [sp, #0x1c]
000bfb1c  mov     r0, sl
000bfb1e  add     r2, pc ; -> 0x00180c04  
000bfb20  blx     #0xddbfc ; -> objc_msgSend
000bfb24  ldr.w   r1, [pc, #0x844]
000bfb28  add     r1, pc ; -> 0x000fd484  
000bfb2a  ldr     r1, [r1]
000bfb2c  mov     r2, r0
000bfb2e  ldr     r0, [r4]
000bfb30  blx     #0xddbfc ; -> objc_msgSend
000bfb34  ldr.w   r3, [pc, #0x838]
000bfb38  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bfb3a  ldrsb.w r3, [r3]
000bfb3e  cbnz    r3, #0xbfb4e
000bfb40  ldr.w   r3, [pc, #0x830]
000bfb44  add     r3, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bfb46  ldrsb.w r3, [r3]
000bfb4a  cmp     r3, #0
000bfb4c  beq     #0xbfbde
000bfb4e  ldr.w   r0, [pc, #0x828]
000bfb52  ldr.w   r1, [pc, #0x828]
000bfb56  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000bfb58  add     r1, pc ; -> 0x000fd5a8  
000bfb5a  ldr     r5, [r0]
000bfb5c  ldr     r4, [r1]
000bfb5e  ldr.w   r0, [pc, #0x820]
000bfb62  ldr.w   r1, [pc, #0x820]
000bfb66  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bfb68  add     r1, pc ; -> 0x000fd59c  
000bfb6a  ldr     r0, [r0]
000bfb6c  ldr     r1, [r1]
000bfb6e  blx     #0xddbfc ; -> objc_msgSend
000bfb72  mov     r1, r4
000bfb74  mov     r2, r0
000bfb76  mov     r0, r5
000bfb78  blx     #0xddbfc ; -> objc_msgSend
000bfb7c  ldr.w   r3, [pc, #0x808]
000bfb80  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bfb82  ldrsb.w r3, [r3]
000bfb86  cbz     r3, #0xbfba0
000bfb88  ldr.w   r0, [pc, #0x800]
000bfb8c  add     r0, pc ; -> 0x0038c1c0  buttonType
000bfb8e  ldr     r0, [r0]
000bfb90  bl      #0xb571c ; -> Z11GetFBButtoni
000bfb94  ldr     r1, [sp, #0xc]
000bfb96  mov     r2, r0
000bfb98  movs    r0, #0x3c
000bfb9a  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bfb9e  b       #0xbfbcc
000bfba0  ldr.w   r3, [pc, #0x7ec]
000bfba4  add     r3, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bfba6  ldrsb.w r3, [r3]
000bfbaa  cbz     r3, #0xbfbcc
000bfbac  ldr.w   r0, [pc, #0x7e4]
000bfbb0  ldr.w   r1, [pc, #0x7e4]
000bfbb4  add     r0, pc ; -> 0x0038c1b0  mSocialInfo
000bfbb6  add     r1, pc ; -> 0x000fd444  
000bfbb8  ldr     r0, [r0]
000bfbba  ldr     r1, [r1]
000bfbbc  blx     #0xddbfc ; -> objc_msgSend
000bfbc0  ldr.w   r1, [pc, #0x7d8]
000bfbc4  add     r1, pc ; -> 0x000fd480  
000bfbc6  ldr     r1, [r1]
000bfbc8  blx     #0xddbfc ; -> objc_msgSend
000bfbcc  ldr.w   r3, [pc, #0x7d0]
000bfbd0  movs    r2, #0
000bfbd2  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bfbd4  strb    r2, [r3]
000bfbd6  ldr.w   r3, [pc, #0x7cc]
000bfbda  add     r3, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bfbdc  strb    r2, [r3]
000bfbde  ldr.w   r0, [pc, #0x7c8]
000bfbe2  ldr.w   r5, [pc, #0x7c8]
000bfbe6  ldr.w   r4, [pc, #0x7c8]
000bfbea  add     r0, pc ; -> 0x00180c14  
000bfbec  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfbf0  ldr.w   r1, [pc, #0x7c0]
000bfbf4  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bfbf6  add     r4, pc ; -> 0x00180c24  
000bfbf8  add     r1, pc ; -> 0x000fd5d8  
000bfbfa  ldr     r0, [r5]
000bfbfc  ldr.w   fp, [r1]
000bfc00  mov     r1, fp
000bfc02  blx     #0xddbfc ; -> objc_msgSend
000bfc06  mov     r2, r4
000bfc08  ldr     r1, [sp, #0x24]
000bfc0a  ldr.w   r4, [pc, #0x7ac]
000bfc0e  add     r4, pc ; -> 0x00180c34  
000bfc10  mov     r3, r0
000bfc12  ldr     r0, [sp, #0x20]
000bfc14  blx     #0xddbfc ; -> objc_msgSend
000bfc18  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfc1c  ldr.w   r1, [pc, #0x79c]
000bfc20  ldr     r0, [r5]
000bfc22  add     r1, pc ; -> 0x000fd440  
000bfc24  ldr     r6, [r1]
000bfc26  mov     r1, r6
000bfc28  blx     #0xddbfc ; -> objc_msgSend
000bfc2c  mov     r2, r4
000bfc2e  ldr     r1, [sp, #0x24]
000bfc30  ldr.w   r4, [pc, #0x78c]
000bfc34  add     r4, pc ; -> 0x00180c44  
000bfc36  mov     r3, r0
000bfc38  ldr     r0, [sp, #0x20]
000bfc3a  blx     #0xddbfc ; -> objc_msgSend
000bfc3e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfc42  ldr.w   r1, [pc, #0x780]
000bfc46  ldr     r0, [r5]
000bfc48  add     r1, pc ; -> 0x000fd43c  
000bfc4a  ldr     r1, [r1]
000bfc4c  blx     #0xddbfc ; -> objc_msgSend
000bfc50  mov     r2, r4
000bfc52  ldr     r1, [sp, #0x24]
000bfc54  ldr.w   r4, [pc, #0x770]
000bfc58  add     r4, pc ; -> 0x00180c54  
000bfc5a  mov     r3, r0
000bfc5c  ldr     r0, [sp, #0x20]
000bfc5e  blx     #0xddbfc ; -> objc_msgSend
000bfc62  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfc66  ldr.w   r1, [pc, #0x764]
000bfc6a  ldr     r0, [r5]
000bfc6c  add     r1, pc ; -> 0x000fd6a4  
000bfc6e  ldr     r1, [r1]
000bfc70  str     r1, [sp, #0x2c]
000bfc72  blx     #0xddbfc ; -> objc_msgSend
000bfc76  mov     r2, r4
000bfc78  ldr     r1, [sp, #0x24]
000bfc7a  ldr.w   r4, [pc, #0x754]
000bfc7e  add     r4, pc ; -> 0x00180c64  
000bfc80  mov     r3, r0
000bfc82  ldr     r0, [sp, #0x20]
000bfc84  blx     #0xddbfc ; -> objc_msgSend
000bfc88  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfc8c  ldr.w   r1, [pc, #0x744]
000bfc90  ldr     r0, [r5]
000bfc92  add     r1, pc ; -> 0x000fd5d4  
000bfc94  ldr.w   r8, [r1]
000bfc98  mov     r1, r8
000bfc9a  blx     #0xddbfc ; -> objc_msgSend
000bfc9e  mov     r2, r4
000bfca0  ldr     r1, [sp, #0x24]
000bfca2  ldr.w   r4, [pc, #0x734]
000bfca6  add     r4, pc ; -> 0x00180c74  
000bfca8  mov     r3, r0
000bfcaa  ldr     r0, [sp, #0x20]
000bfcac  blx     #0xddbfc ; -> objc_msgSend
000bfcb0  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfcb4  ldr.w   r1, [pc, #0x724]
000bfcb8  ldr     r0, [r5]
000bfcba  add     r1, pc ; -> 0x000fd5a0  
000bfcbc  ldr     r1, [r1]
000bfcbe  blx     #0xddbfc ; -> objc_msgSend
000bfcc2  mov     r2, r4
000bfcc4  ldr     r1, [sp, #0x24]
000bfcc6  ldr.w   r4, [pc, #0x718]
000bfcca  add     r4, pc ; -> 0x00180c84  
000bfccc  mov     r3, r0
000bfcce  ldr     r0, [sp, #0x20]
000bfcd0  blx     #0xddbfc ; -> objc_msgSend
000bfcd4  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfcd8  ldr.w   r1, [pc, #0x708]
000bfcdc  ldr     r0, [r5]
000bfcde  add     r1, pc ; -> 0x000fd59c  
000bfce0  ldr     r1, [r1]
000bfce2  blx     #0xddbfc ; -> objc_msgSend
000bfce6  mov     r2, r4
000bfce8  ldr     r1, [sp, #0x24]
000bfcea  mov     r3, r0
000bfcec  ldr     r0, [sp, #0x20]
000bfcee  blx     #0xddbfc ; -> objc_msgSend
000bfcf2  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfcf6  ldr.w   r0, [pc, #0x6f0]
000bfcfa  add     r0, pc ; -> 0x00180c94  
000bfcfc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfd00  mov     r1, r6
000bfd02  ldr     r0, [r5]
000bfd04  blx     #0xddbfc ; -> objc_msgSend
000bfd08  bl      #0xcf8a0 ; -> Z16MTXDMG_SendLogini
000bfd0c  ldr.w   r3, [pc, #0x6dc]
000bfd10  add     r3, pc ; -> 0x000f3264  bShowingMoreGames
000bfd12  ldr     r3, [r3]
000bfd14  ldrb    r3, [r3]
000bfd16  cbz     r3, #0xbfd5c
000bfd18  mov     r1, fp
000bfd1a  ldr     r0, [r5]
000bfd1c  blx     #0xddbfc ; -> objc_msgSend
000bfd20  mov     r1, r8
000bfd22  str     r0, [sp, #0x30]
000bfd24  ldr     r0, [r5]
000bfd26  blx     #0xddbfc ; -> objc_msgSend
000bfd2a  ldr     r1, [sp, #0x2c]
000bfd2c  mov     fp, r0
000bfd2e  ldr     r0, [r5]
000bfd30  blx     #0xddbfc ; -> objc_msgSend
000bfd34  ldr.w   r1, [pc, #0x6b8]
000bfd38  add     r1, pc ; -> 0x000fd58c  
000bfd3a  ldr     r1, [r1]
000bfd3c  mov     r8, r0
000bfd3e  ldr     r0, [r5]
000bfd40  blx     #0xddbfc ; -> objc_msgSend
000bfd44  mov     r1, r6
000bfd46  mov     r4, r0
000bfd48  ldr     r0, [r5]
000bfd4a  blx     #0xddbfc ; -> objc_msgSend
000bfd4e  mov     r1, fp
000bfd50  mov     r2, r8
000bfd52  mov     r3, r4
000bfd54  str     r0, [sp]
000bfd56  ldr     r0, [sp, #0x30]
000bfd58  bl      #0xcf924 ; -> Z16MTXDMG_UpdateIdsiiiP8NSStringi
000bfd5c  ldr.w   r1, [pc, #0x694]
000bfd60  ldr.w   r5, [pc, #0x694]
000bfd64  ldr.w   r4, [pc, #0x694]
000bfd68  add     r1, pc ; -> 0x000fd6b0  
000bfd6a  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000bfd6c  ldr     r6, [r1]
000bfd6e  ldr     r0, [r5]
000bfd70  add     r4, pc ; -> 0x00180ca4  
000bfd72  mov     r1, r6
000bfd74  blx     #0xddbfc ; -> objc_msgSend
000bfd78  ldr     r1, [sp, #0x24]
000bfd7a  mov     r2, r4
000bfd7c  mov     r3, r0
000bfd7e  ldr     r0, [sp, #0x20]
000bfd80  blx     #0xddbfc ; -> objc_msgSend
000bfd84  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfd88  ldr     r0, [r5]
000bfd8a  cbz     r0, #0xbfdce
000bfd8c  mov     r1, r6
000bfd8e  blx     #0xddbfc ; -> objc_msgSend
000bfd92  cmp     r0, #0
000bfd94  bgt     #0xbfdce
000bfd96  ldr.w   r4, [pc, #0x668]
000bfd9a  ldr.w   r1, [pc, #0x668]
000bfd9e  add     r4, pc ; -> 0x0038c0e4  mtxController
000bfda0  add     r1, pc ; -> 0x000fd67c  
000bfda2  ldr     r0, [r4]
000bfda4  ldr     r1, [r1]
000bfda6  blx     #0xddbfc ; -> objc_msgSend
000bfdaa  cbnz    r0, #0xbfdce
000bfdac  ldr.w   r1, [pc, #0x658]
000bfdb0  ldr     r0, [r4]
000bfdb2  movs    r2, #6
000bfdb4  add     r1, pc ; -> 0x000fd6b4  
000bfdb6  ldr     r1, [r1]
000bfdb8  blx     #0xddbfc ; -> objc_msgSend
000bfdbc  ldr.w   r1, [pc, #0x64c]
000bfdc0  ldr     r0, [r4]
000bfdc2  movs    r2, #3
000bfdc4  add     r1, pc ; -> 0x000fd6d4  
000bfdc6  ldr     r3, [sp, #0xc]
000bfdc8  ldr     r1, [r1]
000bfdca  blx     #0xddbfc ; -> objc_msgSend
000bfdce  ldr.w   r2, [pc, #0x640]
000bfdd2  ldr     r1, [sp, #0x1c]
000bfdd4  mov     r0, sl
000bfdd6  add     r2, pc ; -> 0x00180cb4  
000bfdd8  blx     #0xddbfc ; -> objc_msgSend
000bfddc  ldr.w   r2, [pc, #0x634]
000bfde0  ldr     r1, [sp, #0x24]
000bfde2  add     r2, pc ; -> 0x00180cc4  
000bfde4  mov     r4, r0
000bfde6  mov     r3, r4
000bfde8  ldr     r0, [sp, #0x20]
000bfdea  blx     #0xddbfc ; -> objc_msgSend
000bfdee  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bfdf2  cmp     r4, #0
000bfdf4  beq.w   #0xc18a6
000bfdf8  ldr.w   r1, [pc, #0x61c]
000bfdfc  mov     r0, r4
000bfdfe  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bfe00  ldr     r1, [r1]
000bfe02  blx     #0xddbfc ; -> objc_msgSend
000bfe06  cmp     r0, #0
000bfe08  beq.w   #0xc18a6
000bfe0c  ldr.w   r0, [pc, #0x60c]
000bfe10  ldr     r1, [sp, #0x10]
000bfe12  add     r0, pc ; -> 0x000fdc8c  
000bfe14  ldr     r0, [r0]
000bfe16  blx     #0xddbfc ; -> objc_msgSend
000bfe1a  ldr     r1, [sp, #0x14]
000bfe1c  blx     #0xddbfc ; -> objc_msgSend
000bfe20  ldr.w   r1, [pc, #0x5fc]
000bfe24  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000bfe26  ldr     r1, [r1]
000bfe28  blx     #0xddbfc ; -> objc_msgSend
000bfe2c  ldr.w   r1, [pc, #0x5f4]
000bfe30  mov     r2, r4
000bfe32  add     r1, pc ; -> 0x000fd47c  
000bfe34  ldr     r1, [r1]
000bfe36  b.w     #0xc170c
000bfe3a  ldr.w   r3, [pc, #0x5ec]
000bfe3e  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bfe40  ldrsb.w r1, [r3]
000bfe44  cbz     r1, #0xbfe62
000bfe46  movs    r2, #0
000bfe48  strb    r2, [r3]
000bfe4a  ldr.w   r2, [pc, #0x5e0]
000bfe4e  ldr     r0, [sp, #0x20]
000bfe50  ldr     r1, [sp, #0x24]
000bfe52  add     r2, pc ; -> 0x0017e5c4  
000bfe54  mov     r3, r4
000bfe56  blx     #0xddbfc ; -> objc_msgSend
000bfe5a  mov     r2, r0
000bfe5c  movs    r0, #0x3d
000bfe5e  b.w     #0xc18a0
000bfe62  ldr.w   r2, [pc, #0x5cc]
000bfe66  add     r2, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bfe68  ldrsb.w r3, [r2]
000bfe6c  cmp     r3, #0
000bfe6e  beq.w   #0xc18a6
000bfe72  ldr.w   r0, [pc, #0x5c0]
000bfe76  strb    r1, [r2]
000bfe78  ldr     r1, [sp, #0x10]
000bfe7a  add     r0, pc ; -> 0x000fdbf4  
000bfe7c  ldr.w   r6, [pc, #0x5b8]
000bfe80  ldr     r0, [r0]
000bfe82  blx     #0xddbfc ; -> objc_msgSend
000bfe86  ldr     r1, [sp, #0x14]
000bfe88  blx     #0xddbfc ; -> objc_msgSend
000bfe8c  ldr.w   r1, [pc, #0x5ac]
000bfe90  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000bfe92  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000bfe94  ldr     r1, [r1]
000bfe96  blx     #0xddbfc ; -> objc_msgSend
000bfe9a  ldr.w   r1, [pc, #0x5a4]
000bfe9e  ldr.w   r2, [pc, #0x5a4]
000bfea2  ldr.w   r3, [pc, #0x5a4]
000bfea6  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bfea8  add     r2, pc ; -> 0x001804a4  
000bfeaa  ldr     r4, [r1]
000bfeac  add     r3, pc ; -> 0x001801e4  
000bfeae  mov     r1, r4
000bfeb0  mov     r5, r0
000bfeb2  blx     #0xddbfc ; -> objc_msgSend
000bfeb6  ldr.w   r3, [pc, #0x594]
000bfeba  mov     r0, r5
000bfebc  mov     r1, r4
000bfebe  add     r3, pc ; -> 0x001801f4  
000bfec0  mov     r2, r6
000bfec2  blx     #0xddbfc ; -> objc_msgSend
000bfec6  ldr.w   r2, [pc, #0x588]
000bfeca  ldr     r1, [sp, #0x24]
000bfecc  ldr.w   r3, [pc, #0x584]
000bfed0  add     r2, pc ; -> 0x0017e5c4  
000bfed2  ldr     r0, [sp, #0x20]
000bfed4  blx     #0xddbfc ; -> objc_msgSend
000bfed8  ldr.w   r3, [pc, #0x57c]
000bfedc  mov     r1, r4
000bfede  add     r3, pc ; -> 0x00180204  
000bfee0  mov     r2, r0
000bfee2  mov     r0, r5
000bfee4  blx     #0xddbfc ; -> objc_msgSend
000bfee8  ldr.w   r3, [pc, #0x570]
000bfeec  mov     r0, r5
000bfeee  mov     r1, r4
000bfef0  add     r3, pc ; -> 0x00180214  
000bfef2  mov     r2, r6
000bfef4  blx     #0xddbfc ; -> objc_msgSend
000bfef8  ldr.w   r3, [pc, #0x564]
000bfefc  mov     r0, r5
000bfefe  mov     r1, r4
000bff00  mov     r2, r6
000bff02  add     r3, pc ; -> 0x00180224  
000bff04  blx     #0xddbfc ; -> objc_msgSend
000bff08  ldr     r1, [sp, #0xc]
000bff0a  movs    r0, #0x39
000bff0c  mov     r2, r5
000bff0e  b.w     #0xc18a2
000bff12  cmp     r4, #0
000bff14  blt     #0xbff44
000bff16  ldr.w   r0, [pc, #0x54c]
000bff1a  ldr.w   r1, [pc, #0x54c]
000bff1e  ldr.w   r4, [pc, #0x54c]
000bff22  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bff24  add     r1, pc ; -> 0x000fd6a4  
000bff26  ldr     r0, [r0]
000bff28  ldr     r1, [r1]
000bff2a  blx     #0xddbfc ; -> objc_msgSend
000bff2e  add     r4, pc ; -> 0x0017e5c4  
000bff30  ldr     r1, [sp, #0x24]
000bff32  mov     r2, r4
000bff34  mov     r3, r0
000bff36  ldr     r0, [sp, #0x20]
000bff38  blx     #0xddbfc ; -> objc_msgSend
000bff3c  mov     r2, r0
000bff3e  movs    r0, #0x2c
000bff40  b.w     #0xc18a0
000bff44  ldr.w   r2, [pc, #0x528]
000bff48  ldr     r0, [sp, #0x20]
000bff4a  ldr     r1, [sp, #0x24]
000bff4c  add     r2, pc ; -> 0x0017e5c4  
000bff4e  mov     r3, r4
000bff50  blx     #0xddbfc ; -> objc_msgSend
000bff54  mov     r2, r0
000bff56  movs    r0, #0x2d
000bff58  b.w     #0xc18a0
000bff5c  cmp     r4, #0
000bff5e  blt     #0xc0050
000bff60  ldr.w   r1, [pc, #0x510]
000bff64  ldr.w   r4, [pc, #0x510]
000bff68  add     r1, pc ; -> 0x000fd6b0  
000bff6a  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000bff6c  ldr.w   r8, [r1]
000bff70  ldr     r0, [r4]
000bff72  mov     r1, r8
000bff74  blx     #0xddbfc ; -> objc_msgSend
000bff78  cmp.w   r0, #-1
000bff7c  beq     #0xbff88
000bff7e  ldr     r0, [r4]
000bff80  mov     r1, r8
000bff82  blx     #0xddbfc ; -> objc_msgSend
000bff86  cbnz    r0, #0xbffb8
000bff88  ldr.w   r2, [pc, #0x4f0]
000bff8c  ldr     r1, [sp, #0x1c]
000bff8e  mov     r0, sl
000bff90  add     r2, pc ; -> 0x0017e974  
000bff92  blx     #0xddbfc ; -> objc_msgSend
000bff96  ldr.w   r1, [pc, #0x4e8]
000bff9a  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bff9c  ldr     r1, [r1]
000bff9e  blx     #0xddbfc ; -> objc_msgSend
000bffa2  ldr.w   r1, [pc, #0x4e0]
000bffa6  add     r1, pc ; -> 0x000fd6ac  
000bffa8  ldr     r1, [r1]
000bffaa  mov     r2, r0
000bffac  ldr.w   r0, [pc, #0x4d8]
000bffb0  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bffb2  ldr     r0, [r0]
000bffb4  blx     #0xddbfc ; -> objc_msgSend
000bffb8  ldr.w   r1, [pc, #0x4d0]
000bffbc  ldr.w   r0, [pc, #0x4d0]
000bffc0  add     r1, pc ; -> 0x000fd4f8  
000bffc2  add     r0, pc ; -> 0x0038c0e4  mtxController
000bffc4  ldr     r4, [r1]
000bffc6  ldr     r0, [r0]
000bffc8  mov     r1, r4
000bffca  blx     #0xddbfc ; -> objc_msgSend
000bffce  cbnz    r0, #0xbfffc
000bffd0  ldr.w   r0, [pc, #0x4c0]
000bffd4  mov     r1, r8
000bffd6  ldr.w   r4, [pc, #0x4c0]
000bffda  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bffdc  ldr     r0, [r0]
000bffde  blx     #0xddbfc ; -> objc_msgSend
000bffe2  add     r4, pc ; -> 0x0017e5c4  
000bffe4  ldr     r1, [sp, #0x24]
000bffe6  mov     r2, r4
000bffe8  mov     r3, r0
000bffea  ldr     r0, [sp, #0x20]
000bffec  blx     #0xddbfc ; -> objc_msgSend
000bfff0  ldr     r1, [sp, #0xc]
000bfff2  mov     r2, r0
000bfff4  movs    r0, #0x26
000bfff6  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bfffa  b       #0xc003e
000bfffc  ldr.w   r5, [pc, #0x49c]
000c0000  mov     r1, r4
000c0002  add     r5, pc ; -> 0x0038c0e4  mtxController
000c0004  ldr     r0, [r5]
000c0006  blx     #0xddbfc ; -> objc_msgSend
000c000a  cmp     r0, #6
000c000c  beq     #0xc003e
000c000e  ldr.w   r1, [pc, #0x490]
000c0012  ldr     r6, [r5]
000c0014  add     r1, pc ; -> 0x000fd6d4  
000c0016  mov     r0, r6
000c0018  ldr.w   sl, [r1]
000c001c  mov     r1, r4
000c001e  blx     #0xddbfc ; -> objc_msgSend
000c0022  ldr     r3, [sp, #0xc]
000c0024  mov     r1, sl
000c0026  mov     r2, r0
000c0028  mov     r0, r6
000c002a  blx     #0xddbfc ; -> objc_msgSend
000c002e  ldr.w   r1, [pc, #0x474]
000c0032  ldr     r0, [r5]
000c0034  movs    r2, #0
000c0036  add     r1, pc ; -> 0x000fd6b4  
000c0038  ldr     r1, [r1]
000c003a  blx     #0xddbfc ; -> objc_msgSend
000c003e  ldr.w   r0, [pc, #0x468]
000c0042  ldr.w   r4, [pc, #0x468]
000c0046  mov     r1, r8
000c0048  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c004a  add     r4, pc ; -> 0x00180cd4  
000c004c  ldr     r0, [r0]
000c004e  b       #0xc018c
000c0050  ldr.w   r1, [pc, #0x45c]
000c0054  ldr.w   r0, [pc, #0x45c]
000c0058  add     r1, pc ; -> 0x000fd4f8  
000c005a  add     r0, pc ; -> 0x0038c0e4  mtxController
000c005c  ldr     r5, [r1]
000c005e  ldr     r0, [r0]
000c0060  mov     r1, r5
000c0062  blx     #0xddbfc ; -> objc_msgSend
000c0066  cmp     r0, #0x1c
000c0068  bne     #0xc0072
000c006a  ldr.w   r2, [pc, #0x44c]
000c006e  add     r2, pc ; -> 0x0017e5c4  
000c0070  b       #0xc0232
000c0072  ldr.w   r0, [pc, #0x448]
000c0076  mov     r1, r5
000c0078  add     r0, pc ; -> 0x0038c0e4  mtxController
000c007a  ldr     r0, [r0]
000c007c  blx     #0xddbfc ; -> objc_msgSend
000c0080  cmp     r0, #0x1d
000c0082  bne     #0xc008c
000c0084  ldr.w   r2, [pc, #0x438]
000c0088  add     r2, pc ; -> 0x0017e5c4  
000c008a  b       #0xc0272
000c008c  ldr.w   r0, [pc, #0x434]
000c0090  mov     r1, r5
000c0092  add     r0, pc ; -> 0x0038c0e4  mtxController
000c0094  ldr     r0, [r0]
000c0096  blx     #0xddbfc ; -> objc_msgSend
000c009a  cmp     r0, #0xe
000c009c  bne     #0xc00a8
000c009e  ldr.w   r2, [pc, #0x428]
000c00a2  add     r2, pc ; -> 0x0017e5c4  
000c00a4  b.w     #0xc0c32
000c00a8  ldr.w   r0, [pc, #0x420]
000c00ac  mov     r1, r5
000c00ae  add     r0, pc ; -> 0x0038c0e4  mtxController
000c00b0  ldr     r0, [r0]
000c00b2  blx     #0xddbfc ; -> objc_msgSend
000c00b6  cmp     r0, #0x18
000c00b8  mov     r6, r0
000c00ba  bne     #0xc00d4
000c00bc  ldr.w   r2, [pc, #0x410]
000c00c0  ldr     r0, [sp, #0x20]
000c00c2  ldr     r1, [sp, #0x24]
000c00c4  add     r2, pc ; -> 0x0017e5c4  
000c00c6  mov     r3, r4
000c00c8  blx     #0xddbfc ; -> objc_msgSend
000c00cc  mov     r2, r0
000c00ce  mov     r0, r6
000c00d0  b.w     #0xc18a0
000c00d4  ldr     r0, [pc, #0x3fc]
000c00d6  mov     r1, r5
000c00d8  add     r0, pc ; -> 0x0038c0e4  mtxController
000c00da  ldr     r0, [r0]
000c00dc  blx     #0xddbfc ; -> objc_msgSend
000c00e0  cmp     r0, #0
000c00e2  bne.w   #0xc18a6
000c00e6  add.w   r3, r4, #0x2700
000c00ea  adds    r3, #0xf
000c00ec  movw    r2, #0x270e
000c00f0  cmp     r3, r2
000c00f2  bhi     #0xc00fe
000c00f4  ldr.w   r2, [pc, #0x3e0]
000c00f8  add     r2, pc ; -> 0x0017e5c4  
000c00fa  b.w     #0xc1654
000c00fe  ldr.w   r0, [pc, #0x3dc]
000c0102  ldr.w   r1, [pc, #0x3dc]
000c0106  ldr.w   r4, [pc, #0x3dc]
000c010a  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c010c  add     r1, pc ; -> 0x000fd6b0  
000c010e  ldr     r0, [r0]
000c0110  ldr     r1, [r1]
000c0112  blx     #0xddbfc ; -> objc_msgSend
000c0116  add     r4, pc ; -> 0x0017e5c4  
000c0118  ldr     r1, [sp, #0x24]
000c011a  mov     r2, r4
000c011c  mov     r3, r0
000c011e  ldr     r0, [sp, #0x20]
000c0120  blx     #0xddbfc ; -> objc_msgSend
000c0124  mov     r2, r0
000c0126  movs    r0, #0x27
000c0128  b.w     #0xc18a0
000c012c  cmp     r4, #0
000c012e  blt     #0xc01a4
000c0130  ldr.w   r2, [pc, #0x3b4]
000c0134  ldr     r1, [sp, #0x1c]
000c0136  mov     r0, sl
000c0138  add     r2, pc ; -> 0x0017e974  
000c013a  blx     #0xddbfc ; -> objc_msgSend
000c013e  ldr     r1, [pc, #0x3ac]
000c0140  ldr     r5, [pc, #0x3ac]
000c0142  ldr.w   r4, [pc, #0x3b0]
000c0146  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000c0148  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c014a  ldr     r1, [r1]
000c014c  blx     #0xddbfc ; -> objc_msgSend
000c0150  ldr     r1, [pc, #0x3a4]
000c0152  add     r4, pc ; -> 0x0017e5c4  
000c0154  add     r1, pc ; -> 0x000fd6a8  
000c0156  ldr     r1, [r1]
000c0158  mov     r2, r0
000c015a  ldr     r0, [r5]
000c015c  blx     #0xddbfc ; -> objc_msgSend
000c0160  ldr     r1, [pc, #0x398]
000c0162  ldr     r0, [r5]
000c0164  add     r1, pc ; -> 0x000fd438  
000c0166  ldr     r6, [r1]
000c0168  mov     r1, r6
000c016a  blx     #0xddbfc ; -> objc_msgSend
000c016e  mov     r2, r4
000c0170  ldr     r1, [sp, #0x24]
000c0172  ldr     r4, [pc, #0x38c]
000c0174  add     r4, pc ; -> 0x00180ce4  
000c0176  mov     r3, r0
000c0178  ldr     r0, [sp, #0x20]
000c017a  blx     #0xddbfc ; -> objc_msgSend
000c017e  ldr     r1, [sp, #0xc]
000c0180  mov     r2, r0
000c0182  movs    r0, #0x28
000c0184  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c0188  ldr     r0, [r5]
000c018a  mov     r1, r6
000c018c  blx     #0xddbfc ; -> objc_msgSend
000c0190  ldr     r1, [sp, #0x24]
000c0192  mov     r2, r4
000c0194  mov     r3, r0
000c0196  ldr     r0, [sp, #0x20]
000c0198  blx     #0xddbfc ; -> objc_msgSend
000c019c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c01a0  b.w     #0xc18a6
000c01a4  ldr     r0, [pc, #0x35c]
000c01a6  ldr     r1, [pc, #0x360]
000c01a8  add     r0, pc ; -> 0x0038c0e4  mtxController
000c01aa  add     r1, pc ; -> 0x000fd4f8  
000c01ac  ldr     r0, [r0]
000c01ae  ldr     r1, [r1]
000c01b0  blx     #0xddbfc ; -> objc_msgSend
000c01b4  cmp     r0, #0
000c01b6  bne.w   #0xc18a6
000c01ba  add.w   r3, r4, #0x2700
000c01be  adds    r3, #0xf
000c01c0  movw    r2, #0x270e
000c01c4  cmp     r3, r2
000c01c6  bhi     #0xc01d0
000c01c8  ldr     r2, [pc, #0x340]
000c01ca  add     r2, pc ; -> 0x0017e5c4  
000c01cc  b.w     #0xc1654
000c01d0  ldr.w   r0, [pc, #0x33c]
000c01d4  ldr     r1, [pc, #0x33c]
000c01d6  ldr.w   r4, [pc, #0x340]
000c01da  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c01dc  add     r1, pc ; -> 0x000fd438  
000c01de  ldr     r0, [r0]
000c01e0  ldr     r1, [r1]
000c01e2  blx     #0xddbfc ; -> objc_msgSend
000c01e6  add     r4, pc ; -> 0x0017e5c4  
000c01e8  ldr     r1, [sp, #0x24]
000c01ea  mov     r2, r4
000c01ec  mov     r3, r0
000c01ee  ldr     r0, [sp, #0x20]
000c01f0  blx     #0xddbfc ; -> objc_msgSend
000c01f4  mov     r2, r0
000c01f6  movs    r0, #0x29
000c01f8  b.w     #0xc18a0
000c01fc  cmp     r4, #0
000c01fe  blt     #0xc0216
000c0200  mov     r0, sl
000c0202  bl      #0xb5cb0 ; -> Z12GetBannerObjP12NSDictionary
000c0206  ldr.w   r3, [pc, #0x314]
000c020a  add     r3, pc ; -> 0x0038c13c  m_MainBanner
000c020c  mov     r2, r0
000c020e  str     r0, [r3]
000c0210  movs    r0, #0x15
000c0212  b.w     #0xc18a0
000c0216  ldr     r0, [pc, #0x308]
000c0218  add     r0, pc ; -> 0x0038c154  bannerLangCode
000c021a  ldr     r0, [r0]
000c021c  cbz     r0, #0xc0224
000c021e  ldr     r1, [sp, #0x18]
000c0220  blx     #0xddbfc ; -> objc_msgSend
000c0224  ldr     r3, [pc, #0x2fc]
000c0226  movs    r2, #0
000c0228  add     r3, pc ; -> 0x0038c154  bannerLangCode
000c022a  str     r2, [r3]
000c022c  ldr.w   r2, [pc, #0x2f8]
000c0230  add     r2, pc ; -> 0x0017e5c4  
000c0232  ldr     r0, [sp, #0x20]
000c0234  ldr     r1, [sp, #0x24]
000c0236  mov     r3, r4
000c0238  blx     #0xddbfc ; -> objc_msgSend
000c023c  mov     r2, r0
000c023e  movs    r0, #0x16
000c0240  b.w     #0xc18a0
000c0244  cmp     r4, #0
000c0246  blt     #0xc0256
000c0248  mov     r0, sl
000c024a  bl      #0xb5ba4 ; -> Z13GetTickerListP12NSDictionary
000c024e  mov     r2, r0
000c0250  movs    r0, #0x19
000c0252  b.w     #0xc18a0
000c0256  ldr.w   r0, [pc, #0x2d4]
000c025a  add     r0, pc ; -> 0x0038c150  tickersLangCode
000c025c  ldr     r0, [r0]
000c025e  cbz     r0, #0xc0266
000c0260  ldr     r1, [sp, #0x18]
000c0262  blx     #0xddbfc ; -> objc_msgSend
000c0266  ldr     r3, [pc, #0x2c8]
000c0268  movs    r2, #0
000c026a  add     r3, pc ; -> 0x0038c150  tickersLangCode
000c026c  str     r2, [r3]
000c026e  ldr     r2, [pc, #0x2c4]
000c0270  add     r2, pc ; -> 0x0017e5c4  
000c0272  ldr     r0, [sp, #0x20]
000c0274  ldr     r1, [sp, #0x24]
000c0276  mov     r3, r4
000c0278  blx     #0xddbfc ; -> objc_msgSend
000c027c  mov     r2, r0
000c027e  movs    r0, #0x1a
000c0280  b.w     #0xc18a0
000c0284  cmp     r4, #0
000c0286  blt.w   #0xc0980
000c028a  cmp.w   sl, #0
000c028e  bne.w   #0xc0538
000c0292  mov     fp, sl
000c0294  b       #0xc095a
000c0296  nop     
000c0298  asrs    r0, r7, #0x12
000c029a  movs    r4, r1
000c029c  bhs     #0xc0234
000c029e  movs    r3, r0
000c02a0  b       #0xbfe0c
000c02a2  movs    r3, r0
000c02a4  bhs     #0xc0210
000c02a6  movs    r3, r0
000c02a8  ble     #0xc025c
000c02aa  movs    r3, r0
000c02ac  bhs     #0xc01d4
000c02ae  movs    r3, r0
000c02b0  blo     #0xc028c
000c02b2  movs    r3, r0
000c02b4  lsrs    r6, r5, #0x13
000c02b6  movs    r4, r1
000c02b8  ble     #0xc01f4
000c02ba  movs    r3, r0
000c02bc  asrs    r4, r2, #0x11
000c02be  movs    r4, r1
000c02c0  b       #0xbfb18
000c02c2  movs    r3, r0
000c02c4  blo     #0xc03a0
000c02c6  movs    r3, r0
000c02c8  ldm     r1!, {r0, r2, r5, r6}
000c02ca  movs    r4, r5
000c02cc  ldm     r0!, {r2, r7}
000c02ce  movs    r4, r5
000c02d0  bgt     #0xc0368
000c02d2  movs    r3, r0
000c02d4  ldm     r0!, {r2, r4, r5, r7}
000c02d6  movs    r4, r5
000c02d8  ldm     r1, {r0, r1, r4, r5}
000c02da  movs    r4, r5
000c02dc  stcl    p0, c0, [r0, #-0x2c]
000c02e0  ldm     r1!, {r0, r2, r3}
000c02e2  movs    r4, r5
000c02e4  asrs    r2, r2, #0xb
000c02e6  movs    r4, r1
000c02e8  bhs     #0xc033c
000c02ea  movs    r3, r0
000c02ec  ldm     r0!, {r1, r2, r5}
000c02ee  movs    r4, r5
000c02f0  blt     #0xc02a8
000c02f2  movs    r3, r0
000c02f4  asrs    r4, r5, #0xa
000c02f6  movs    r4, r1
000c02f8  ble     #0xc03b8
000c02fa  movs    r3, r0
000c02fc  bne     #0xc020c
000c02fe  movs    r3, r0
000c0300  bne     #0xc03d8
000c0302  movs    r3, r0
000c0304  blt     #0xc03f4
000c0306  movs    r3, r0
000c0308  stm     r7!, {r1, r2, r5, r7}
000c030a  movs    r4, r5
000c030c  ble     #0xc0330
000c030e  movs    r3, r0
000c0310  asrs    r6, r2, #9
000c0312  movs    r4, r1
000c0314  asrs    r4, r3, #9
000c0316  movs    r4, r1
000c0318  bne     #0xc0338
000c031a  movs    r3, r0
000c031c  ldm     r7, {r2, r3, r5, r6, r7}
000c031e  movs    r3, r0
000c0320  asrs    r0, r1, #7
000c0322  movs    r4, r1
000c0324  stm     r7!, {r2}
000c0326  movs    r4, r5
000c0328  lsls    r0, r6, #0x13
000c032a  movs    r4, r1
000c032c  beq     #0xc027c
000c032e  movs    r3, r0
000c0330  stm     r6!, {r2, r5, r7}
000c0332  movs    r4, r5
000c0334  bge     #0xc03d4
000c0336  movs    r3, r0
000c0338  asrs    r6, r5, #5
000c033a  movs    r4, r1
000c033c  bge     #0xc038c
000c033e  movs    r3, r0
000c0340  asrs    r2, r3, #5
000c0342  movs    r4, r1
000c0344  bge     #0xc0350
000c0346  movs    r3, r0
000c0348  lsls    r4, r5, #0x10
000c034a  movs    r4, r1
000c034c  bls     #0xc0308
000c034e  movs    r3, r0
000c0350  lsrs    r0, r3, #0x1b
000c0352  movs    r4, r1
000c0354  bls     #0xc02c0
000c0356  movs    r3, r0
000c0358  stm     r5!, {r2, r4, r5, r6, r7}
000c035a  movs    r4, r5
000c035c  bls     #0xc0294
000c035e  movs    r3, r0
000c0360  asrs    r0, r6, #3
000c0362  movs    r4, r1
000c0364  bls     #0xc045c
000c0366  movs    r3, r0
000c0368  asrs    r2, r4, #3
000c036a  movs    r4, r1
000c036c  bls     #0xc0420
000c036e  movs    r3, r0
000c0370  stm     r6!, {r1, r2, r3, r4, r5, r6}
000c0372  movs    r4, r5
000c0374  stm     r6!, {r0, r1, r4, r5, r6}
000c0376  movs    r4, r5
000c0378  stm     r6!, {r1, r2, r4, r6}
000c037a  movs    r4, r5
000c037c  bge     #0xc0418
000c037e  movs    r3, r0
000c0380  stm     r5!, {r1, r2, r3, r4, r5, r6}
000c0382  movs    r4, r5
000c0384  bge     #0xc03e8
000c0386  movs    r3, r0
000c0388  stm     r6!, {r1, r2, r4, r5}
000c038a  movs    r4, r5
000c038c  stm     r6!, {r4, r5}
000c038e  movs    r4, r5
000c0390  stm     r6!, {r0, r1, r4}
000c0392  movs    r4, r5
000c0394  stm     r5!, {r3, r4, r5, r6, r7}
000c0396  movs    r4, r5
000c0398  bhi     #0xc02b0
000c039a  movs    r3, r0
000c039c  bhi     #0xc0310
000c039e  movs    r3, r0
000c03a0  stm     r5!, {r2, r5, r6, r7}
000c03a2  movs    r4, r5
000c03a4  stm     r5!, {r0, r2, r3, r4, r6, r7}
000c03a6  movs    r4, r5
000c03a8  asrs    r6, r4, #0x20
000c03aa  movs    r4, r1
000c03ac  stm     r4!, {r4, r5, r6, r7}
000c03ae  movs    r4, r5
000c03b0  asrs    r2, r5, #0x20
000c03b2  movs    r4, r1
000c03b4  bls     #0xc0370
000c03b6  movs    r3, r0
000c03b8  asrs    r2, r4, #0x20
000c03ba  movs    r4, r1
000c03bc  bhi     #0xc03f4
000c03be  movs    r3, r0
000c03c0  asrs    r4, r1, #0x20
000c03c2  movs    r4, r1
000c03c4  bvc     #0xc03a8
000c03c6  movs    r3, r0
000c03c8  lsrs    r0, r7, #0x1f
000c03ca  movs    r4, r1
000c03cc  bge     #0xc0438
000c03ce  movs    r3, r0
000c03d0  lsrs    r2, r4, #0x1f
000c03d2  movs    r4, r1
000c03d4  bls     #0xc0454
000c03d6  movs    r3, r0
000c03d8  lsrs    r2, r1, #0x1f
000c03da  movs    r4, r1
000c03dc  bhi     #0xc03a4
000c03de  movs    r3, r0
000c03e0  lsrs    r6, r6, #0x1e
000c03e2  movs    r4, r1
000c03e4  bhi     #0xc035c
000c03e6  movs    r3, r0
000c03e8  lsrs    r6, r2, #0x1e
000c03ea  movs    r4, r1
000c03ec  adds    r5, #0x50
000c03ee  movs    r3, r0
000c03f0  bhi     #0xc0494
000c03f2  movs    r3, r0
000c03f4  bls     #0xc0480
000c03f6  movs    r3, r0
000c03f8  stm     r3!, {r1, r3, r4, r5, r6}
000c03fa  movs    r4, r5
000c03fc  lsrs    r0, r6, #0x1c
000c03fe  movs    r4, r1
000c0400  stm     r3!, {r1, r6}
000c0402  movs    r4, r5
000c0404  bhi     #0xc03b8
000c0406  movs    r3, r0
000c0408  bhi     #0xc0404
000c040a  movs    r3, r0
000c040c  bls     #0xc0428
000c040e  movs    r3, r0
000c0410  lsrs    r2, r3, #0x1b
000c0412  movs    r4, r1
000c0414  lsrs    r6, r3, #0x1b
000c0416  movs    r4, r1
000c0418  ldm     r4, {r1, r2, r4, r5, r6}
000c041a  movs    r3, r0
000c041c  udf     #0x76
000c041e  movs    r3, r0
000c0420  ldm     r4, {r4, r5}
000c0422  movs    r3, r0
000c0424  bvs     #0xc04b4
000c0426  movs    r3, r0
000c0428  stm     r3!, {r3, r4, r5, r6}
000c042a  movs    r4, r5
000c042c  b       #0xc030c
000c042e  movs    r3, r1
000c0430  stm     r3!, {r0, r4, r6}
000c0432  movs    r4, r5
000c0434  ble     #0xc0524
000c0436  movs    r3, r0
000c0438  b       #0xbfcfc
000c043a  movs    r3, r1
000c043c  ldm     r3!, {r1, r6, r7}
000c043e  movs    r3, r0
000c0440  ldm     r4!, {r1, r2, r3, r5}
000c0442  movs    r3, r0
000c0444  lsls    r0, r7, #0x17
000c0446  movs    r4, r1
000c0448  lsls    r4, r6, #0xc
000c044a  movs    r4, r1
000c044c  lsls    r2, r6, #0xc
000c044e  movs    r4, r1
000c0450  b       #0xc0234
000c0452  movs    r3, r1
