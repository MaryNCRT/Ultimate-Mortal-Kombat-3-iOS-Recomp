========================================================================
MTX_CancelNetworkRequest  0x000bb64c  1308 bytes   EAMTX_Main.mm
========================================================================

000bb64c  push    {r4, r5, r6, r7, lr}
000bb64e  add     r7, sp, #0xc
000bb650  push.w  {r8, sl, fp}
000bb654  sub     sp, #0xc
000bb656  ldr.w   r1, [pc, #0x434]
000bb65a  mov     fp, r0
000bb65c  ldr.w   r0, [pc, #0x430]
000bb660  add     r1, pc ; -> 0x000fd68c  
000bb662  ldr     r1, [r1]
000bb664  add     r0, pc ; -> 0x0038c0e4  mtxController
000bb666  ldr     r0, [r0]
000bb668  str     r1, [sp]
000bb66a  blx     #0xddbfc ; -> objc_msgSend
000bb66e  ldr.w   r1, [pc, #0x424]
000bb672  ldr.w   r3, [pc, #0x424]
000bb676  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bb678  add     r3, pc ; -> 0x0017e5c4  
000bb67a  ldr     r4, [r1]
000bb67c  ldr.w   r1, [pc, #0x41c]
000bb680  mov     r2, r3
000bb682  str     r3, [sp, #4]
000bb684  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bb686  mov     r3, fp
000bb688  ldr.w   r8, [r1]
000bb68c  mov     r1, r8
000bb68e  mov     r5, r0
000bb690  ldr.w   r0, [pc, #0x40c]
000bb694  add     r0, pc ; -> 0x000fdb5c  
000bb696  ldr.w   sl, [r0]
000bb69a  mov     r0, sl
000bb69c  blx     #0xddbfc ; -> objc_msgSend
000bb6a0  mov     r1, r4
000bb6a2  mov     r2, r0
000bb6a4  mov     r0, r5
000bb6a6  blx     #0xddbfc ; -> objc_msgSend
000bb6aa  mov     r5, r0
000bb6ac  cmp     r0, #0
000bb6ae  beq.w   #0xbb900
000bb6b2  ldr     r1, [pc, #0x3f0]
000bb6b4  add     r1, pc ; -> 0x000fd690  
000bb6b6  ldr     r1, [r1]
000bb6b8  blx     #0xddbfc ; -> objc_msgSend
000bb6bc  ldr     r1, [pc, #0x3e8]
000bb6be  mov     r0, r5
000bb6c0  add     r1, pc ; -> 0x000fd688  
000bb6c2  ldr     r4, [r1]
000bb6c4  mov     r1, r4
000bb6c6  blx     #0xddbfc ; -> objc_msgSend
000bb6ca  cmp     r0, #0x1f
000bb6cc  ble.w   #0xbb98a
000bb6d0  mov     r0, r5
000bb6d2  mov     r1, r4
000bb6d4  blx     #0xddbfc ; -> objc_msgSend
000bb6d8  cmp     r0, #0x30
000bb6da  bgt.w   #0xbb98a
000bb6de  ldr.w   r1, [pc, #0x3cc]
000bb6e2  mov     r0, r5
000bb6e4  add     r1, pc ; -> 0x000fd684  
000bb6e6  ldr     r1, [r1]
000bb6e8  blx     #0xddbfc ; -> objc_msgSend
000bb6ec  mov     r1, r8
000bb6ee  ldr     r2, [sp, #4]
000bb6f0  ldr     r3, [pc, #0x3bc]
000bb6f2  mov     r4, r0
000bb6f4  mov     r0, sl
000bb6f6  blx     #0xddbfc ; -> objc_msgSend
000bb6fa  mov     r1, r4
000bb6fc  mov     r2, r0
000bb6fe  movs    r0, #0x37
000bb700  b       #0xbb8fc
000bb702  ldr     r1, [pc, #0x3b0]
000bb704  mov     r0, r5
000bb706  add     r1, pc ; -> 0x000fd684  
000bb708  ldr     r1, [r1]
000bb70a  blx     #0xddbfc ; -> objc_msgSend
000bb70e  mov     r1, r0
000bb710  movs    r0, #0x16
000bb712  b       #0xbb8fa
000bb714  ldr     r1, [pc, #0x3a0]
000bb716  mov     r0, r5
000bb718  add     r1, pc ; -> 0x000fd684  
000bb71a  ldr     r1, [r1]
000bb71c  blx     #0xddbfc ; -> objc_msgSend
000bb720  mov     r1, r0
000bb722  movs    r0, #0x1a
000bb724  b       #0xbb8fa
000bb726  ldr     r1, [pc, #0x394]
000bb728  mov     r0, r5
000bb72a  add     r1, pc ; -> 0x000fd684  
000bb72c  ldr     r1, [r1]
000bb72e  blx     #0xddbfc ; -> objc_msgSend
000bb732  mov     r1, r0
000bb734  movs    r0, #8
000bb736  b       #0xbb8fa
000bb738  ldr     r1, [pc, #0x384]
000bb73a  mov     r0, r5
000bb73c  add     r1, pc ; -> 0x000fd684  
000bb73e  ldr     r1, [r1]
000bb740  blx     #0xddbfc ; -> objc_msgSend
000bb744  mov     r1, r0
000bb746  movs    r0, #0x18
000bb748  b       #0xbb8fa
000bb74a  ldr     r1, [pc, #0x378]
000bb74c  mov     r0, r5
000bb74e  add     r1, pc ; -> 0x000fd684  
000bb750  ldr     r1, [r1]
000bb752  blx     #0xddbfc ; -> objc_msgSend
000bb756  mov     r1, r0
000bb758  movs    r0, #0x1e
000bb75a  b       #0xbb8fa
000bb75c  ldr     r0, [pc, #0x368]
000bb75e  ldr     r1, [pc, #0x36c]
000bb760  add     r0, pc ; -> 0x000fdbf4  
000bb762  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bb764  ldr     r0, [r0]
000bb766  ldr     r1, [r1]
000bb768  blx     #0xddbfc ; -> objc_msgSend
000bb76c  ldr     r1, [pc, #0x360]
000bb76e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bb770  ldr     r1, [r1]
000bb772  blx     #0xddbfc ; -> objc_msgSend
000bb776  ldr     r1, [pc, #0x35c]
000bb778  ldr     r3, [pc, #0x35c]
000bb77a  mov     r2, r6
000bb77c  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bb77e  add     r3, pc ; -> 0x001803f4  
000bb780  ldr     r1, [r1]
000bb782  mov     r4, r0
000bb784  blx     #0xddbfc ; -> objc_msgSend
000bb788  ldr     r1, [pc, #0x350]
000bb78a  mov     r0, r5
000bb78c  add     r1, pc ; -> 0x000fd684  
000bb78e  ldr     r1, [r1]
000bb790  blx     #0xddbfc ; -> objc_msgSend
000bb794  mov     r2, r4
000bb796  mov     r1, r0
000bb798  movs    r0, #0x14
000bb79a  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb79e  ldr     r1, [pc, #0x340]
000bb7a0  mov     r0, r4
000bb7a2  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bb7a4  ldr     r1, [r1]
000bb7a6  blx     #0xddbfc ; -> objc_msgSend
000bb7aa  ldr     r1, [pc, #0x338]
000bb7ac  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bb7ae  b       #0xbb8dc
000bb7b0  movs    r0, #0x20
000bb7b2  b       #0xbb8f8
000bb7b4  ldr     r3, [pc, #0x330]
000bb7b6  add     r3, pc ; -> 0x0038c1ba  bWaitingForLoginButton
000bb7b8  ldrsb.w r1, [r3]
000bb7bc  cbz     r1, #0xbb7c6
000bb7be  movs    r2, #0
000bb7c0  movs    r0, #0x3d
000bb7c2  strb    r2, [r3]
000bb7c4  b       #0xbb8f8
000bb7c6  ldr     r2, [pc, #0x324]
000bb7c8  add     r2, pc ; -> 0x0038c1bb  bWaitingForLoginButton
000bb7ca  ldrsb.w r3, [r2]
000bb7ce  cmp     r3, #0
000bb7d0  beq.w   #0xbb900
000bb7d4  strb    r1, [r2]
000bb7d6  ldr     r0, [pc, #0x318]
000bb7d8  ldr     r1, [pc, #0x318]
000bb7da  ldr.w   r6, [pc, #0x31c]
000bb7de  add     r0, pc ; -> 0x000fdbf4  
000bb7e0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bb7e2  ldr     r0, [r0]
000bb7e4  ldr     r1, [r1]
000bb7e6  blx     #0xddbfc ; -> objc_msgSend
000bb7ea  ldr     r1, [pc, #0x310]
000bb7ec  add     r6, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000bb7ee  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bb7f0  ldr     r1, [r1]
000bb7f2  blx     #0xddbfc ; -> objc_msgSend
000bb7f6  ldr     r1, [pc, #0x308]
000bb7f8  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000bb7fa  ldr     r1, [r1]
000bb7fc  blx     #0xddbfc ; -> objc_msgSend
000bb800  ldr     r1, [pc, #0x300]
000bb802  ldr     r2, [pc, #0x304]
000bb804  ldr     r3, [pc, #0x304]
000bb806  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bb808  add     r2, pc ; -> 0x001804a4  
000bb80a  ldr     r4, [r1]
000bb80c  add     r3, pc ; -> 0x001801e4  
000bb80e  mov     r1, r4
000bb810  mov     r5, r0
000bb812  blx     #0xddbfc ; -> objc_msgSend
000bb816  ldr     r3, [pc, #0x2f8]
000bb818  mov     r0, r5
000bb81a  mov     r1, r4
000bb81c  add     r3, pc ; -> 0x001801f4  
000bb81e  mov     r2, r6
000bb820  blx     #0xddbfc ; -> objc_msgSend
000bb824  mov     r1, r8
000bb826  ldr     r2, [sp, #4]
000bb828  ldr     r3, [pc, #0x2e8]
000bb82a  mov     r0, sl
000bb82c  blx     #0xddbfc ; -> objc_msgSend
000bb830  ldr     r3, [pc, #0x2e4]
000bb832  mov     r1, r4
000bb834  add     r3, pc ; -> 0x00180204  
000bb836  mov     r2, r0
000bb838  mov     r0, r5
000bb83a  blx     #0xddbfc ; -> objc_msgSend
000bb83e  ldr     r3, [pc, #0x2dc]
000bb840  mov     r0, r5
000bb842  mov     r1, r4
000bb844  add     r3, pc ; -> 0x00180214  
000bb846  mov     r2, r6
000bb848  blx     #0xddbfc ; -> objc_msgSend
000bb84c  ldr     r3, [pc, #0x2d0]
000bb84e  mov     r0, r5
000bb850  mov     r1, r4
000bb852  mov     r2, r6
000bb854  add     r3, pc ; -> 0x00180224  
000bb856  blx     #0xddbfc ; -> objc_msgSend
000bb85a  movs    r0, #0x39
000bb85c  mov     r1, fp
000bb85e  mov     r2, r5
000bb860  b       #0xbb8fc
000bb862  ldr     r0, [pc, #0x2c0]
000bb864  ldr     r1, [pc, #0x2c0]
000bb866  add     r0, pc ; -> 0x000fdbf4  
000bb868  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bb86a  ldr     r0, [r0]
000bb86c  ldr     r1, [r1]
000bb86e  blx     #0xddbfc ; -> objc_msgSend
000bb872  ldr     r1, [pc, #0x2b8]
000bb874  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bb876  ldr     r1, [r1]
000bb878  blx     #0xddbfc ; -> objc_msgSend
000bb87c  ldr     r1, [pc, #0x2b0]
000bb87e  ldr     r3, [pc, #0x2b4]
000bb880  mov     r2, r6
000bb882  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bb884  add     r3, pc ; -> 0x001803f4  
000bb886  ldr     r1, [r1]
000bb888  str     r1, [sp, #8]
000bb88a  mov     r4, r0
000bb88c  blx     #0xddbfc ; -> objc_msgSend
000bb890  ldr     r3, [pc, #0x2a4]
000bb892  add     r3, pc ; -> 0x0038c1ae  downloadingAsset
000bb894  ldrb    r3, [r3]
000bb896  cbz     r3, #0xbb89c
000bb898  movs    r0, #0x2b
000bb89a  b       #0xbb8c4
000bb89c  ldr     r1, [pc, #0x29c]
000bb89e  mov     r0, r5
000bb8a0  add     r1, pc ; -> 0x000fd680  
000bb8a2  ldr     r1, [r1]
000bb8a4  blx     #0xddbfc ; -> objc_msgSend
000bb8a8  mov     r1, r8
000bb8aa  ldr     r2, [sp, #4]
000bb8ac  mov     r3, r0
000bb8ae  mov     r0, sl
000bb8b0  blx     #0xddbfc ; -> objc_msgSend
000bb8b4  ldr     r3, [pc, #0x288]
000bb8b6  ldr     r1, [sp, #8]
000bb8b8  add     r3, pc ; -> 0x00180434  
000bb8ba  mov     r2, r0
000bb8bc  mov     r0, r4
000bb8be  blx     #0xddbfc ; -> objc_msgSend
000bb8c2  movs    r0, #0xd
000bb8c4  mov     r1, fp
000bb8c6  mov     r2, r4
000bb8c8  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb8cc  ldr     r1, [pc, #0x274]
000bb8ce  mov     r0, r4
000bb8d0  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bb8d2  ldr     r1, [r1]
000bb8d4  blx     #0xddbfc ; -> objc_msgSend
000bb8d8  ldr     r1, [pc, #0x26c]
000bb8da  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bb8dc  ldr     r1, [r1]
000bb8de  mov     r0, r4
000bb8e0  blx     #0xddbfc ; -> objc_msgSend
000bb8e4  b       #0xbb900
000bb8e6  movs    r0, #2
000bb8e8  b       #0xbb8f8
000bb8ea  movs    r0, #0x1c
000bb8ec  b       #0xbb8f8
000bb8ee  movs    r0, #5
000bb8f0  b       #0xbb8f8
000bb8f2  movs    r0, #0x2f
000bb8f4  b       #0xbb8f8
000bb8f6  movs    r0, #0x32
000bb8f8  mov     r1, fp
000bb8fa  mov     r2, r6
000bb8fc  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bb900  ldr     r4, [pc, #0x248]
000bb902  ldr     r1, [sp]
000bb904  add     r4, pc ; -> 0x0038c0e4  mtxController
000bb906  ldr     r0, [r4]
000bb908  blx     #0xddbfc ; -> objc_msgSend
000bb90c  ldr     r1, [pc, #0x240]
000bb90e  mov     r3, fp
000bb910  ldr     r2, [sp, #4]
000bb912  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000bb914  ldr     r6, [r1]
000bb916  mov     r1, r8
000bb918  mov     r5, r0
000bb91a  mov     r0, sl
000bb91c  blx     #0xddbfc ; -> objc_msgSend
000bb920  mov     r1, r6
000bb922  mov     r2, r0
000bb924  mov     r0, r5
000bb926  blx     #0xddbfc ; -> objc_msgSend
000bb92a  ldr     r1, [pc, #0x228]
000bb92c  ldr     r0, [r4]
000bb92e  add     r1, pc ; -> 0x000fd694  
000bb930  ldr     r1, [r1]
000bb932  blx     #0xddbfc ; -> objc_msgSend
000bb936  mov     r1, r8
000bb938  ldr     r2, [sp, #4]
000bb93a  mov     r3, fp
000bb93c  mov     r4, r0
000bb93e  mov     r0, sl
000bb940  blx     #0xddbfc ; -> objc_msgSend
000bb944  mov     r1, r6
000bb946  mov     r2, r0
000bb948  mov     r0, r4
000bb94a  ldr     r4, [pc, #0x20c]
000bb94c  blx     #0xddbfc ; -> objc_msgSend
000bb950  add     r4, pc ; -> 0x0038c0c4  mtxtransObserver
000bb952  ldr     r0, [r4]
000bb954  cmp     r0, #0
000bb956  beq.w   #0xbba80
000bb95a  ldr     r1, [pc, #0x200]
000bb95c  add     r1, pc ; -> 0x000fd684  
000bb95e  ldr     r1, [r1]
000bb960  blx     #0xddbfc ; -> objc_msgSend
000bb964  cmp     r0, fp
000bb966  bne.w   #0xbba80
000bb96a  ldr     r1, [pc, #0x1f4]
000bb96c  ldr     r0, [r4]
000bb96e  movs    r2, #2
000bb970  add     r1, pc ; -> 0x000fd69c  
000bb972  ldr     r1, [r1]
000bb974  blx     #0xddbfc ; -> objc_msgSend
000bb978  ldr.w   r1, [pc, #0x1e8]
000bb97c  ldr     r0, [r4]
000bb97e  movs    r2, #2
000bb980  add     r1, pc ; -> 0x000fd698  
000bb982  ldr     r1, [r1]
000bb984  blx     #0xddbfc ; -> objc_msgSend
000bb988  b       #0xbba80
000bb98a  mov     r1, r8
000bb98c  ldr     r2, [sp, #4]
000bb98e  ldr.w   r3, [pc, #0x120]
000bb992  mov     r0, sl
000bb994  blx     #0xddbfc ; -> objc_msgSend
000bb998  mov     r1, r4
000bb99a  mov     r6, r0
000bb99c  mov     r0, r5
000bb99e  blx     #0xddbfc ; -> objc_msgSend
000bb9a2  subs    r0, #1
000bb9a4  cmp     r0, #0x32
000bb9a6  bhi     #0xbb900
000bb9a8  adr     r3, #4
000bb9aa  add.w   r3, r3, r0, lsl #2
000bb9ae  mov     pc, r3
000bb9b0  b.w     #0xbb8e6
000bb9b4  b.w     #0xbb900
000bb9b8  b.w     #0xbb900
000bb9bc  b.w     #0xbb900
000bb9c0  b.w     #0xbb900
000bb9c4  b.w     #0xbb7b4
000bb9c8  b.w     #0xbb900
000bb9cc  b.w     #0xbb900
000bb9d0  b.w     #0xbb8ee
000bb9d4  b.w     #0xbb900
000bb9d8  b.w     #0xbb862
000bb9dc  b.w     #0xbb900
000bb9e0  b.w     #0xbb900
000bb9e4  b.w     #0xbb726
000bb9e8  b.w     #0xbb900
000bb9ec  b.w     #0xbb900
000bb9f0  b.w     #0xbb862
000bb9f4  b.w     #0xbb900
000bb9f8  b.w     #0xbb900
000bb9fc  b.w     #0xbb900
000bba00  b.w     #0xbb900
000bba04  b.w     #0xbb900
000bba08  b.w     #0xbb75c
000bba0c  b.w     #0xbb738
000bba10  b.w     #0xbb74a
000bba14  b.w     #0xbb7b0
000bba18  b.w     #0xbb900
000bba1c  b.w     #0xbb702
000bba20  b.w     #0xbb714
000bba24  b.w     #0xbb8ea
000bba28  b.w     #0xbb900
000bba2c  b.w     #0xbb900
000bba30  b.w     #0xbb900
000bba34  b.w     #0xbb900
000bba38  b.w     #0xbb900
000bba3c  b.w     #0xbb900
000bba40  b.w     #0xbb900
000bba44  b.w     #0xbb900
000bba48  b.w     #0xbb900
000bba4c  b.w     #0xbb900
000bba50  b.w     #0xbb900
000bba54  b.w     #0xbb900
000bba58  b.w     #0xbb900
000bba5c  b.w     #0xbb900
000bba60  b.w     #0xbb900
000bba64  b.w     #0xbb900
000bba68  b.w     #0xbb900
000bba6c  b.w     #0xbb900
000bba70  b.w     #0xbb900
000bba74  b.w     #0xbb8f2
000bba78  b.w     #0xbb8f6
000bba7c  b.w     #0xbb900
000bba80  sub.w   sp, r7, #0x18
000bba84  pop.w   {r8, sl, fp}
000bba88  pop     {r4, r5, r6, r7, pc}
000bba8a  nop     
000bba8c  movs    r0, #0x28
000bba8e  movs    r4, r0
000bba90  lsrs    r4, r7, #9
000bba92  movs    r5, r5
000bba94  asrs    r6, r6, #0x11
000bba96  movs    r4, r0
000bba98  cmp     r7, #0x48
000bba9a  movs    r4, r1
000bba9c  asrs    r0, r3, #0x10
000bba9e  movs    r4, r0
000bbaa0  movs    r4, #0xc4
000bbaa2  movs    r4, r0
000bbaa4  subs    r0, r3, #7
000bbaa6  movs    r4, r0
000bbaa8  subs    r4, r0, #7
000bbaaa  movs    r4, r0
000bbaac  subs    r4, r3, #6
000bbaae  movs    r4, r0
