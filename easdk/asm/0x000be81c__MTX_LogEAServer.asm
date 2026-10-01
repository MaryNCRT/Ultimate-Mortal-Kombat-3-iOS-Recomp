========================================================================
MTX_LogEAServer  0x000be81c  1188 bytes   EAMTX_Main.mm
========================================================================

000be81c  push    {r4, r5, r6, r7, lr}
000be81e  add     r7, sp, #0xc
000be820  push.w  {r8, sl, fp}
000be824  sub     sp, #0x20
000be826  str     r1, [sp, #8]
000be828  ldr     r1, [pc, #0x39c]
000be82a  mov     r8, r0
000be82c  ldr     r0, [pc, #0x39c]
000be82e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000be830  str     r2, [sp, #4]
000be832  add     r0, pc ; -> 0x000fdb5c  
000be834  ldr.w   fp, [r1]
000be838  ldr     r0, [r0]
000be83a  ldr     r2, [pc, #0x394]
000be83c  str     r3, [sp]
000be83e  mov     r1, fp
000be840  add     r2, pc ; -> 0x00180a54  
000be842  mov     r3, r8
000be844  str     r0, [sp, #0xc]
000be846  blx     #0xddbfc ; -> objc_msgSend
000be84a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000be84e  bl      #0xbd408 ; -> Z18CheckMTXControllerv
000be852  ldr     r0, [pc, #0x380]
000be854  ldr     r1, [pc, #0x380]
000be856  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000be858  add     r1, pc ; -> 0x000fd6bc  
000be85a  ldr     r0, [r0]
000be85c  ldr     r1, [r1]
000be85e  blx     #0xddbfc ; -> objc_msgSend
000be862  mov     sl, r0
000be864  cmp     r0, #0
000be866  bne.w   #0xbebbc
000be86a  ldr     r3, [pc, #0x370]
000be86c  add     r3, pc ; -> 0x0038c110  sessionId
000be86e  ldr     r3, [r3]
000be870  cbnz    r3, #0xbe876
000be872  bl      #0xbe4ec ; -> Z15generateSessionv
000be876  ldr     r1, [pc, #0x368]
000be878  ldr.w   r0, [pc, #0x368]
000be87c  add     r1, pc ; -> 0x000fd66c  
000be87e  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000be880  ldr     r1, [r1]
000be882  ldr     r0, [r0]
000be884  str     r1, [sp, #0x10]
000be886  blx     #0xddbfc ; -> objc_msgSend
000be88a  cbnz    r0, #0xbe890
000be88c  bl      #0xb6be0 ; -> Z25fillEventsCounterDefaultsv
000be890  ldr     r4, [pc, #0x354]
000be892  ldr     r1, [pc, #0x358]
000be894  add     r4, pc ; -> 0x0038c0e4  mtxController
000be896  add     r1, pc ; -> 0x000fd668  
000be898  ldr     r0, [r4]
000be89a  ldr     r1, [r1]
000be89c  blx     #0xddbfc ; -> objc_msgSend
000be8a0  vmov    d7, r0, r1
000be8a4  vcmp.f64 d7, #0
000be8a8  vmrs    apsr_nzcv, fpscr
000be8ac  bne     #0xbe8be
000be8ae  ldr     r1, [pc, #0x340]
000be8b0  ldr     r0, [r4]
000be8b2  movs    r2, #0
000be8b4  add     r1, pc ; -> 0x000fd6cc  
000be8b6  ldr     r3, [pc, #0x33c]
000be8b8  ldr     r1, [r1]
000be8ba  blx     #0xddbfc ; -> objc_msgSend
000be8be  ldr     r4, [pc, #0x338]
000be8c0  ldr     r1, [pc, #0x338]
000be8c2  add     r4, pc ; -> 0x0038c0e4  mtxController
000be8c4  add     r1, pc ; -> 0x000fd664  
000be8c6  ldr     r0, [r4]
000be8c8  ldr     r1, [r1]
000be8ca  blx     #0xddbfc ; -> objc_msgSend
000be8ce  vmov    d7, r0, r1
000be8d2  vcmp.f64 d7, #0
000be8d6  vmrs    apsr_nzcv, fpscr
000be8da  bne     #0xbe8ec
000be8dc  ldr     r1, [pc, #0x320]
000be8de  ldr     r0, [r4]
000be8e0  movs    r2, #0
000be8e2  add     r1, pc ; -> 0x000fd6c8  
000be8e4  ldr     r3, [pc, #0x31c]
000be8e6  ldr     r1, [r1]
000be8e8  blx     #0xddbfc ; -> objc_msgSend
000be8ec  ldr     r1, [pc, #0x318]
000be8ee  ldr     r4, [pc, #0x31c]
000be8f0  add     r1, pc ; -> 0x000fd660  
000be8f2  add     r4, pc ; -> 0x0038c0e4  mtxController
000be8f4  ldr     r1, [r1]
000be8f6  ldr     r0, [r4]
000be8f8  str     r1, [sp, #0x14]
000be8fa  blx     #0xddbfc ; -> objc_msgSend
000be8fe  vmov    d7, r0, r1
000be902  vcmp.f64 d7, #0
000be906  vmrs    apsr_nzcv, fpscr
000be90a  bne     #0xbe91c
000be90c  ldr     r1, [pc, #0x300]
000be90e  ldr     r0, [r4]
000be910  movs    r2, #0
000be912  add     r1, pc ; -> 0x000fd6c4  
000be914  ldr     r3, [pc, #0x2fc]
000be916  ldr     r1, [r1]
000be918  blx     #0xddbfc ; -> objc_msgSend
000be91c  ldr     r4, [pc, #0x2f8]
000be91e  add     r4, pc ; -> 0x0017cf0c  m_RefreshEventFilters
000be920  ldrb    r3, [r4]
000be922  cbz     r3, #0xbe94c
000be924  ldr     r1, [pc, #0x2f4]
000be926  ldr     r0, [pc, #0x2f8]
000be928  add     r1, pc ; -> 0x000fd6d4  
000be92a  add     r0, pc ; -> 0x0038c0e4  mtxController
000be92c  ldr     r6, [r1]
000be92e  ldr     r1, [pc, #0x2f4]
000be930  ldr     r5, [r0]
000be932  add     r1, pc ; -> 0x000fd6dc  
000be934  mov     r0, r5
000be936  ldr     r1, [r1]
000be938  blx     #0xddbfc ; -> objc_msgSend
000be93c  mov     r1, r6
000be93e  movs    r2, #8
000be940  mov     r3, r0
000be942  mov     r0, r5
000be944  blx     #0xddbfc ; -> objc_msgSend
000be948  strb.w  sl, [r4]
000be94c  mov     r0, r8
000be94e  bl      #0xb6eb4 ; -> Z10AllowEventi
000be952  cmp     r0, #0
000be954  beq.w   #0xbebbe
000be958  ldr     r0, [pc, #0x2cc]
000be95a  ldr     r1, [pc, #0x2d0]
000be95c  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000be95e  add     r1, pc ; -> 0x000fd6b0  
000be960  ldr     r0, [r0]
000be962  ldr     r1, [r1]
000be964  blx     #0xddbfc ; -> objc_msgSend
000be968  cmp     r0, #0
000be96a  bgt     #0xbe9ac
000be96c  ldr.w   r4, [pc, #0x2c0]
000be970  ldr     r1, [pc, #0x2c0]
000be972  add     r4, pc ; -> 0x0038c0e4  mtxController
000be974  add     r1, pc ; -> 0x000fd67c  
000be976  ldr     r0, [r4]
000be978  ldr     r1, [r1]
000be97a  blx     #0xddbfc ; -> objc_msgSend
000be97e  cbnz    r0, #0xbe9ac
000be980  bl      #0xbe3cc ; -> Z28MTX_GetNetworkConnectionTypev
000be984  ldr     r3, [pc, #0x2b0]
000be986  add     r3, pc ; -> 0x00180a34  
000be988  cmp     r0, r3
000be98a  beq     #0xbe9ac
000be98c  ldr     r1, [pc, #0x2ac]
000be98e  ldr     r4, [r4]
000be990  add     r1, pc ; -> 0x000fd6d4  
000be992  ldr     r5, [r1]
000be994  ldr     r1, [pc, #0x2a8]
000be996  mov     r0, r4
000be998  add     r1, pc ; -> 0x000fd6dc  
000be99a  ldr     r1, [r1]
000be99c  blx     #0xddbfc ; -> objc_msgSend
000be9a0  mov     r1, r5
000be9a2  movs    r2, #3
000be9a4  mov     r3, r0
000be9a6  mov     r0, r4
000be9a8  blx     #0xddbfc ; -> objc_msgSend
000be9ac  ldr     r1, [pc, #0x294]
000be9ae  ldr     r4, [pc, #0x298]
000be9b0  add     r1, pc ; -> 0x000fd65c  
000be9b2  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000be9b4  ldr     r1, [r1]
000be9b6  ldr     r0, [r4]
000be9b8  str     r1, [sp, #0x18]
000be9ba  blx     #0xddbfc ; -> objc_msgSend
000be9be  cbnz    r0, #0xbe9e8
000be9c0  ldr     r0, [pc, #0x288]
000be9c2  ldr     r1, [pc, #0x28c]
000be9c4  add     r0, pc ; -> 0x000fdbf4  
000be9c6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000be9c8  ldr     r0, [r0]
000be9ca  ldr     r1, [r1]
000be9cc  blx     #0xddbfc ; -> objc_msgSend
000be9d0  ldr     r1, [pc, #0x280]
000be9d2  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000be9d4  ldr     r1, [r1]
000be9d6  blx     #0xddbfc ; -> objc_msgSend
000be9da  ldr     r1, [pc, #0x27c]
000be9dc  add     r1, pc ; -> 0x000fd678  
000be9de  ldr     r1, [r1]
000be9e0  mov     r2, r0
000be9e2  ldr     r0, [r4]
000be9e4  blx     #0xddbfc ; -> objc_msgSend
000be9e8  sub.w   r3, r8, #0x4e00
000be9ec  subs    r3, #0x20
000be9ee  cmp     r3, #1
000be9f0  str     r3, [sp, #0x1c]
000be9f2  bhi     #0xbea0e
000be9f4  ldr     r3, [pc, #0x264]
000be9f6  ldr     r2, [pc, #0x268]
000be9f8  ldr     r0, [sp, #0xc]
000be9fa  add     r3, pc ; -> 0x0038c11c  lastEventTypeId
000be9fc  add     r2, pc ; -> 0x0017e5c4  
000be9fe  ldr     r3, [r3]
000bea00  mov     r1, fp
000bea02  blx     #0xddbfc ; -> objc_msgSend
000bea06  movs    r3, #0xf
000bea08  str     r3, [sp, #8]
000bea0a  str     r0, [sp, #4]
000bea0c  b       #0xbea34
000bea0e  sub.w   r3, r8, #0x7500
000bea12  subs    r3, #0x5b
000bea14  movw    r2, #0x4e22
000bea18  subs.w  r2, r8, r2
000bea1c  it      ne
000bea1e  movne   r2, #1
000bea20  cmp     r3, #1
000bea22  ite     ls
000bea24  movls   r3, #0
000bea26  andhi   r3, r2, #1
000bea2a  cbz     r3, #0xbea34
000bea2c  ldr     r3, [pc, #0x234]
000bea2e  add     r3, pc ; -> 0x0038c11c  lastEventTypeId
000bea30  str.w   r8, [r3]
000bea34  ldr     r0, [pc, #0x230]
000bea36  ldr     r1, [pc, #0x234]
000bea38  ldr     r5, [pc, #0x234]
000bea3a  add     r0, pc ; -> 0x000fdbf4  
000bea3c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bea3e  ldr     r0, [r0]
000bea40  ldr     r1, [r1]
000bea42  blx     #0xddbfc ; -> objc_msgSend
000bea46  ldr     r1, [pc, #0x22c]
000bea48  add     r5, pc ; -> 0x0017e5c4  
000bea4a  ldr.w   sl, [pc, #0x22c]
000bea4e  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bea50  ldr     r1, [r1]
000bea52  blx     #0xddbfc ; -> objc_msgSend
000bea56  ldr     r1, [pc, #0x224]
000bea58  mov     r2, r5
000bea5a  mov     r3, r8
000bea5c  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000bea5e  add     sl, pc ; -> 0x0038c0e8  mtxUserInfo
000bea60  ldr     r4, [r1]
000bea62  mov     r1, fp
000bea64  mov     r6, r0
000bea66  ldr     r0, [sp, #0xc]
000bea68  blx     #0xddbfc ; -> objc_msgSend
000bea6c  ldr     r3, [pc, #0x210]
000bea6e  mov     r1, r4
000bea70  add     r3, pc ; -> 0x0017ffd4  
000bea72  mov     r2, r0
000bea74  mov     r0, r6
000bea76  blx     #0xddbfc ; -> objc_msgSend
000bea7a  ldr     r2, [pc, #0x208]
000bea7c  mov     r1, fp
000bea7e  ldr     r0, [sp, #0xc]
000bea80  add     r2, pc ; -> 0x0038c114  stepNum
000bea82  ldr     r3, [r2]
000bea84  adds    r3, #1
000bea86  str     r3, [r2]
000bea88  mov     r2, r5
000bea8a  blx     #0xddbfc ; -> objc_msgSend
000bea8e  ldr     r3, [pc, #0x1f8]
000bea90  mov     r1, r4
000bea92  add     r3, pc ; -> 0x0017ffe4  
000bea94  mov     r2, r0
000bea96  mov     r0, r6
000bea98  blx     #0xddbfc ; -> objc_msgSend
000bea9c  ldr     r2, [pc, #0x1ec]
000bea9e  ldr     r3, [pc, #0x1f0]
000beaa0  mov     r1, r4
000beaa2  add     r2, pc ; -> 0x0038c110  sessionId
000beaa4  add     r3, pc ; -> 0x0017fff4  
000beaa6  ldr     r2, [r2]
000beaa8  mov     r0, r6
000beaaa  blx     #0xddbfc ; -> objc_msgSend
000beaae  mov     r2, r5
000beab0  mov     r1, fp
000beab2  ldr     r3, [sp, #8]
000beab4  ldr     r0, [sp, #0xc]
000beab6  blx     #0xddbfc ; -> objc_msgSend
000beaba  ldr     r3, [pc, #0x1d8]
000beabc  mov     r1, r4
000beabe  add     r3, pc ; -> 0x00180004  
000beac0  mov     r2, r0
000beac2  mov     r0, r6
000beac4  blx     #0xddbfc ; -> objc_msgSend
000beac8  ldr     r0, [sp, #4]
000beaca  bl      #0xb6424 ; -> Z15CheckNullStringP8NSObject
000beace  ldr     r3, [pc, #0x1c8]
000bead0  mov     r1, r4
000bead2  add     r3, pc ; -> 0x00180014  
000bead4  mov     r2, r0
000bead6  mov     r0, r6
000bead8  blx     #0xddbfc ; -> objc_msgSend
000beadc  mov     r2, r5
000beade  mov     r1, fp
000beae0  ldr     r3, [sp]
000beae2  ldr     r0, [sp, #0xc]
000beae4  blx     #0xddbfc ; -> objc_msgSend
000beae8  ldr     r3, [pc, #0x1b0]
000beaea  mov     r1, r4
000beaec  add     r3, pc ; -> 0x00180024  
000beaee  mov     r2, r0
000beaf0  mov     r0, r6
000beaf2  blx     #0xddbfc ; -> objc_msgSend
000beaf6  ldr     r0, [sp, #0x40]
000beaf8  bl      #0xb6424 ; -> Z15CheckNullStringP8NSObject
000beafc  ldr     r3, [pc, #0x1a0]
000beafe  mov     r1, r4
000beb00  add     r3, pc ; -> 0x00180034  
000beb02  mov     r2, r0
000beb04  mov     r0, r6
000beb06  blx     #0xddbfc ; -> objc_msgSend
000beb0a  ldr     r0, [sp, #0x44]
000beb0c  bl      #0xb5f84 ; -> Z24GetUTCDateINStringFormatP6NSDate
000beb10  ldr     r3, [pc, #0x190]
000beb12  mov     r1, r4
000beb14  ldr     r4, [pc, #0x190]
000beb16  add     r3, pc ; -> 0x00180044  
000beb18  add     r4, pc ; -> 0x0038c0e4  mtxController
000beb1a  mov     r2, r0
000beb1c  mov     r0, r6
000beb1e  blx     #0xddbfc ; -> objc_msgSend
000beb22  ldr     r1, [sp, #0x18]
000beb24  ldr.w   r0, [sl]
000beb28  blx     #0xddbfc ; -> objc_msgSend
000beb2c  ldr     r1, [pc, #0x17c]
000beb2e  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000beb30  ldr     r1, [r1]
000beb32  blx     #0xddbfc ; -> objc_msgSend
000beb36  ldr     r1, [sp, #0x14]
000beb38  mov     r5, r0
000beb3a  ldr     r0, [r4]
000beb3c  blx     #0xddbfc ; -> objc_msgSend
000beb40  vmov    s10, r5
000beb44  vcvt.f64.u32 d7, s10
000beb48  vmov    d6, r0, r1
000beb4c  vcmp.f64 d7, d6
000beb50  vmrs    apsr_nzcv, fpscr
000beb54  blt     #0xbeba8
000beb56  ldr     r3, [sp, #0x1c]
000beb58  cmp     r3, #1
000beb5a  bls     #0xbeba8
000beb5c  ldr     r1, [pc, #0x150]
000beb5e  ldr     r5, [r4]
000beb60  ldr.w   r0, [sl]
000beb64  add     r1, pc ; -> 0x000fd670  
000beb66  ldr     r4, [r1]
000beb68  ldr     r1, [sp, #0x18]
000beb6a  blx     #0xddbfc ; -> objc_msgSend
000beb6e  ldr     r1, [pc, #0x144]
000beb70  add     r1, pc ; -> 0x000fd674  
000beb72  ldr     r1, [r1]
000beb74  blx     #0xddbfc ; -> objc_msgSend
000beb78  mov     r1, r4
000beb7a  mov     r2, r0
000beb7c  mov     r0, r5
000beb7e  blx     #0xddbfc ; -> objc_msgSend
000beb82  ldr     r1, [sp, #0x18]
000beb84  ldr.w   r0, [sl]
000beb88  blx     #0xddbfc ; -> objc_msgSend
000beb8c  ldr     r1, [pc, #0x128]
000beb8e  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000beb90  ldr     r4, [r1]
000beb92  mov     r1, r4
000beb94  blx     #0xddbfc ; -> objc_msgSend
000beb98  ldr     r1, [sp, #0x10]
000beb9a  ldr.w   r0, [sl]
000beb9e  blx     #0xddbfc ; -> objc_msgSend
000beba2  mov     r1, r4
000beba4  blx     #0xddbfc ; -> objc_msgSend
000beba8  mov     r0, r8
000bebaa  mov     r1, r6
000bebac  bl      #0xb6828 ; -> Z15addEventToArrayiP19NSMutableDictionary
000bebb0  ldr     r1, [pc, #0x108]
000bebb2  mov     r0, r6
000bebb4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bebb6  ldr     r1, [r1]
000bebb8  blx     #0xddbfc ; -> objc_msgSend
000bebbc  movs    r0, #1
000bebbe  sub.w   sp, r7, #0x18
000bebc2  pop.w   {r8, sl, fp}
000bebc6  pop     {r4, r5, r6, r7, pc}
000bebc8  b       #0xbf0a8
000bebca  movs    r3, r0
000bebcc  ssat16  r0, #4, r6
000bebd0  movs    r2, #0x10
000bebd2  movs    r4, r1
000bebd4  bhi     #0xbeaf4
000bebd6  movs    r4, r5
000bebd8  cdp     p0, #6, c0, c0, c3, #0
000bebdc  bhi     #0xbeb20
000bebde  movs    r4, r5
000bebe0  stcl    p0, c0, [ip, #0xc]!
000bebe4  bhi     #0xbecb4
000bebe6  movs    r4, r5
000bebe8  bhi     #0xbec84
000bebea  movs    r4, r5
000bebec  stcl    p0, c0, [lr, #0xc]
000bebf0  cdp     p0, #1, c0, c4, c3, #0
000bebf4  movs    r0, r0
000bebf6  eors    r6, r1
000bebf8  bhi     #0xbec38
000bebfa  movs    r4, r5
000bebfc  ldc     p0, c0, [ip, #0xc]
000bec00  stcl    p0, c0, [r2, #0xc]!
