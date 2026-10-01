========================================================================
CheckMTXController  0x000bd408  1232 bytes   EAMTX_Main.mm
========================================================================

000bd408  push    {r4, r5, r6, r7, lr}
000bd40a  add     r7, sp, #0xc
000bd40c  push.w  {r8, sl, fp}
000bd410  sub     sp, #4
000bd412  ldr     r4, [pc, #0x350]
000bd414  add     r4, pc ; -> 0x0038c0e4  mtxController
000bd416  ldr     r0, [r4]
000bd418  cmp     r0, #0
000bd41a  bne.w   #0xbd71e
000bd41e  ldr     r1, [pc, #0x348]
000bd420  ldr     r0, [pc, #0x348]
000bd422  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bd424  add     r0, pc ; -> 0x000fdc74  
000bd426  ldr     r1, [r1]
000bd428  ldr     r0, [r0]
000bd42a  str     r1, [sp]
000bd42c  blx     #0xddbfc ; -> objc_msgSend
000bd430  ldr.w   r1, [pc, #0x33c]
000bd434  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bd436  ldr.w   fp, [r1]
000bd43a  mov     r1, fp
000bd43c  blx     #0xddbfc ; -> objc_msgSend
000bd440  ldr     r1, [pc, #0x330]
000bd442  add     r1, pc ; -> 0x000fd5c8  
000bd444  ldr     r1, [r1]
000bd446  str     r0, [r4]
000bd448  blx     #0xddbfc ; -> objc_msgSend
000bd44c  ldr     r3, [pc, #0x328]
000bd44e  movs    r2, #1
000bd450  add     r3, pc ; -> 0x0038c19c  bHasPaidItems
000bd452  strb    r2, [r3]
000bd454  ldr     r3, [pc, #0x324]
000bd456  add     r3, pc ; -> 0x0038c104  serverAddr
000bd458  ldr     r3, [r3]
000bd45a  cmp     r3, #0
000bd45c  bne.w   #0xbd5a2
000bd460  ldr     r0, [pc, #0x31c]
000bd462  ldr     r1, [pc, #0x320]
000bd464  add     r0, pc ; -> 0x000fdb60  
000bd466  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000bd468  ldr     r0, [r0]
000bd46a  ldr     r1, [r1]
000bd46c  blx     #0xddbfc ; -> objc_msgSend
000bd470  ldr.w   r1, [pc, #0x314]
000bd474  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000bd476  ldr     r1, [r1]
000bd478  blx     #0xddbfc ; -> objc_msgSend
000bd47c  ldr     r1, [pc, #0x30c]
000bd47e  ldr     r2, [pc, #0x310]
000bd480  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bd482  add     r2, pc ; -> 0x00180744  
000bd484  ldr     r1, [r1]
000bd486  blx     #0xddbfc ; -> objc_msgSend
000bd48a  cbz     r0, #0xbd490
000bd48c  mov     r4, r0
000bd48e  b       #0xbd49c
000bd490  ldr     r0, [pc, #0x300]
000bd492  ldr     r4, [pc, #0x304]
000bd494  add     r0, pc ; -> 0x00180754  
000bd496  blx     #0xdd3e0 ; -> NSLog
000bd49a  add     r4, pc ; -> 0x00180764  
000bd49c  ldr     r1, [pc, #0x2fc]
000bd49e  ldr     r2, [pc, #0x300]
000bd4a0  mov     r0, r4
000bd4a2  add     r1, pc ; -> 0x000fd16c  
000bd4a4  add     r2, pc ; -> 0x0017e444  kGraphBaseURL+0x314
000bd4a6  ldr     r5, [r1]
000bd4a8  mov     r1, r5
000bd4aa  blx     #0xddbfc ; -> objc_msgSend
000bd4ae  cbnz    r0, #0xbd4d8
000bd4b0  ldr     r3, [pc, #0x2f0]
000bd4b2  ldr     r2, [pc, #0x2f4]
000bd4b4  add     r3, pc ; -> 0x0038c104  serverAddr
000bd4b6  add     r2, pc ; -> 0x00180774  
000bd4b8  str     r2, [r3]
000bd4ba  ldr     r3, [pc, #0x2f0]
000bd4bc  ldr     r2, [pc, #0x2f0]
000bd4be  add     r3, pc ; -> 0x0038c108  trackingAddr
000bd4c0  add     r2, pc ; -> 0x00180784  
000bd4c2  str     r2, [r3]
000bd4c4  ldr     r3, [pc, #0x2ec]
000bd4c6  ldr     r2, [pc, #0x2f0]
000bd4c8  add     r3, pc ; -> 0x0038c10c  akamaiAddr
000bd4ca  add     r2, pc ; -> 0x00180794  
000bd4cc  str     r2, [r3]
000bd4ce  ldr     r2, [pc, #0x2ec]
000bd4d0  ldr     r3, [pc, #0x2ec]
000bd4d2  add     r2, pc ; -> 0x001807a4  
000bd4d4  add     r3, pc ; -> 0x0038c1bc  mayhemServerAddr
000bd4d6  b       #0xbd5a0
000bd4d8  ldr     r2, [pc, #0x2e8]
000bd4da  mov     r0, r4
000bd4dc  mov     r1, r5
000bd4de  add     r2, pc ; -> 0x001807b4  
000bd4e0  blx     #0xddbfc ; -> objc_msgSend
000bd4e4  cbnz    r0, #0xbd50e
000bd4e6  ldr     r3, [pc, #0x2e0]
000bd4e8  ldr     r2, [pc, #0x2e0]
000bd4ea  add     r3, pc ; -> 0x0038c104  serverAddr
000bd4ec  add     r2, pc ; -> 0x00180774  
000bd4ee  str     r2, [r3]
000bd4f0  ldr     r3, [pc, #0x2dc]
000bd4f2  ldr     r2, [pc, #0x2e0]
000bd4f4  add     r3, pc ; -> 0x0038c108  trackingAddr
000bd4f6  add     r2, pc ; -> 0x00180784  
000bd4f8  str     r2, [r3]
000bd4fa  ldr     r3, [pc, #0x2dc]
000bd4fc  ldr     r2, [pc, #0x2dc]
000bd4fe  add     r3, pc ; -> 0x0038c10c  akamaiAddr
000bd500  add     r2, pc ; -> 0x00180794  
000bd502  str     r2, [r3]
000bd504  ldr     r2, [pc, #0x2d8]
000bd506  ldr     r3, [pc, #0x2dc]
000bd508  add     r2, pc ; -> 0x001807c4  
000bd50a  add     r3, pc ; -> 0x0038c1bc  mayhemServerAddr
000bd50c  b       #0xbd5a0
000bd50e  ldr     r2, [pc, #0x2d8]
000bd510  mov     r0, r4
000bd512  mov     r1, r5
000bd514  add     r2, pc ; -> 0x001807d4  
000bd516  blx     #0xddbfc ; -> objc_msgSend
000bd51a  cbnz    r0, #0xbd544
000bd51c  ldr     r3, [pc, #0x2cc]
000bd51e  ldr     r2, [pc, #0x2d0]
000bd520  add     r3, pc ; -> 0x0038c104  serverAddr
000bd522  add     r2, pc ; -> 0x001807e4  
000bd524  str     r2, [r3]
000bd526  ldr     r3, [pc, #0x2cc]
000bd528  ldr     r2, [pc, #0x2cc]
000bd52a  add     r3, pc ; -> 0x0038c108  trackingAddr
000bd52c  add     r2, pc ; -> 0x001807f4  
000bd52e  str     r2, [r3]
000bd530  ldr     r3, [pc, #0x2c8]
000bd532  ldr     r2, [pc, #0x2cc]
000bd534  add     r3, pc ; -> 0x0038c10c  akamaiAddr
000bd536  add     r2, pc ; -> 0x00180804  
000bd538  str     r2, [r3]
000bd53a  ldr     r2, [pc, #0x2c8]
000bd53c  ldr     r3, [pc, #0x2c8]
000bd53e  add     r2, pc ; -> 0x001807c4  
000bd540  add     r3, pc ; -> 0x0038c1bc  mayhemServerAddr
000bd542  b       #0xbd5a0
000bd544  ldr     r2, [pc, #0x2c4]
000bd546  mov     r0, r4
000bd548  mov     r1, r5
000bd54a  add     r2, pc ; -> 0x00180814  
000bd54c  blx     #0xddbfc ; -> objc_msgSend
000bd550  cbnz    r0, #0xbd57a
000bd552  ldr     r3, [pc, #0x2bc]
000bd554  ldr     r2, [pc, #0x2bc]
000bd556  add     r3, pc ; -> 0x0038c104  serverAddr
000bd558  add     r2, pc ; -> 0x00180824  
000bd55a  str     r2, [r3]
000bd55c  ldr     r3, [pc, #0x2b8]
000bd55e  ldr     r2, [pc, #0x2bc]
000bd560  add     r3, pc ; -> 0x0038c108  trackingAddr
000bd562  add     r2, pc ; -> 0x00180834  
000bd564  str     r2, [r3]
000bd566  ldr     r3, [pc, #0x2b8]
000bd568  ldr     r2, [pc, #0x2b8]
000bd56a  add     r3, pc ; -> 0x0038c10c  akamaiAddr
000bd56c  add     r2, pc ; -> 0x00180844  
000bd56e  str     r2, [r3]
000bd570  ldr     r2, [pc, #0x2b4]
000bd572  ldr     r3, [pc, #0x2b8]
000bd574  add     r2, pc ; -> 0x00180854  
000bd576  add     r3, pc ; -> 0x0038c1bc  mayhemServerAddr
000bd578  b       #0xbd5a0
000bd57a  ldr     r3, [pc, #0x2b4]
000bd57c  ldr     r2, [pc, #0x2b4]
000bd57e  add     r3, pc ; -> 0x0038c104  serverAddr
000bd580  add     r2, pc ; -> 0x00180864  
000bd582  str     r2, [r3]
000bd584  ldr     r3, [pc, #0x2b0]
000bd586  ldr     r2, [pc, #0x2b4]
000bd588  add     r3, pc ; -> 0x0038c108  trackingAddr
000bd58a  add     r2, pc ; -> 0x00180874  
000bd58c  str     r2, [r3]
000bd58e  ldr     r3, [pc, #0x2b0]
000bd590  ldr     r2, [pc, #0x2b0]
000bd592  add     r3, pc ; -> 0x0038c10c  akamaiAddr
000bd594  add     r2, pc ; -> 0x00180884  
000bd596  str     r2, [r3]
000bd598  ldr     r2, [pc, #0x2ac]
000bd59a  ldr     r3, [pc, #0x2b0]
000bd59c  add     r2, pc ; -> 0x00180894  
000bd59e  add     r3, pc ; -> 0x0038c1bc  mayhemServerAddr
000bd5a0  str     r2, [r3]
000bd5a2  ldr     r0, [pc, #0x2ac]
000bd5a4  ldr     r1, [pc, #0x2ac]
000bd5a6  add     r0, pc ; -> 0x000fdb60  
000bd5a8  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000bd5aa  ldr.w   r8, [r0]
000bd5ae  ldr     r6, [r1]
000bd5b0  mov     r0, r8
000bd5b2  mov     r1, r6
000bd5b4  blx     #0xddbfc ; -> objc_msgSend
000bd5b8  ldr     r1, [pc, #0x29c]
000bd5ba  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000bd5bc  ldr     r5, [r1]
000bd5be  mov     r1, r5
000bd5c0  blx     #0xddbfc ; -> objc_msgSend
000bd5c4  ldr     r1, [pc, #0x294]
000bd5c6  ldr     r2, [pc, #0x298]
000bd5c8  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bd5ca  add     r2, pc ; -> 0x001808a4  
000bd5cc  ldr     r4, [r1]
000bd5ce  mov     r1, r4
000bd5d0  blx     #0xddbfc ; -> objc_msgSend
000bd5d4  cmp     r0, #0
000bd5d6  beq.w   #0xbd74e
000bd5da  ldr     r1, [pc, #0x288]
000bd5dc  add     r1, pc ; -> 0x000fd6d0  
000bd5de  ldr     r1, [r1]
000bd5e0  blx     #0xddbfc ; -> objc_msgSend
000bd5e4  tst.w   r0, #0xff
000bd5e8  beq.w   #0xbd74e
000bd5ec  ldr     r3, [pc, #0x278]
000bd5ee  ldr.w   r0, [pc, #0x27c]
000bd5f2  movs    r2, #1
000bd5f4  add     r3, pc ; -> 0x0038c1a8  m_bDebugEnabled
000bd5f6  add     r0, pc ; -> 0x001808b4  
000bd5f8  strb    r2, [r3]
000bd5fa  blx     #0xdd3e0 ; -> NSLog
000bd5fe  mov     r1, r6
000bd600  mov     r0, r8
000bd602  blx     #0xddbfc ; -> objc_msgSend
000bd606  mov     r1, r5
000bd608  blx     #0xddbfc ; -> objc_msgSend
000bd60c  ldr.w   r2, [pc, #0x260]
000bd610  mov     r1, r4
000bd612  add     r2, pc ; -> 0x001808c4  
000bd614  blx     #0xddbfc ; -> objc_msgSend
000bd618  cbnz    r0, #0xbd620
000bd61a  add.w   r0, r0, #0xe10
000bd61e  b       #0xbd63a
000bd620  ldr     r1, [pc, #0x250]
000bd622  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000bd624  ldr     r1, [r1]
000bd626  blx     #0xddbfc ; -> objc_msgSend
000bd62a  vmov    s12, r0
000bd62e  vcvt.f32.s32 s14, s12
000bd632  vcvt.s32.f32 s14, s14
000bd636  vmov    r0, s14
000bd63a  ldr     r3, [pc, #0x23c]
000bd63c  ldr     r1, [pc, #0x23c]
000bd63e  ldr     r4, [pc, #0x240]
000bd640  add     r3, pc ; -> 0x0038c1d0  mCacheTime
000bd642  add     r1, pc ; -> 0x0017ff54  
000bd644  str     r0, [r3]
000bd646  ldr     r0, [pc, #0x23c]
000bd648  add     r4, pc ; -> 0x001808e4  
000bd64a  add     r0, pc ; -> 0x001808d4  
000bd64c  blx     #0xdd3e0 ; -> NSLog
000bd650  ldr     r0, [pc, #0x234]
000bd652  ldr     r1, [pc, #0x238]
000bd654  add     r0, pc ; -> 0x000fdb5c  
000bd656  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bd658  ldr     r6, [r0]
000bd65a  ldr     r5, [r1]
000bd65c  bl      #0xbd3a8 ; -> Z18GetHardwareVersionv
000bd660  mov     r2, r4
000bd662  ldr     r4, [pc, #0x22c]
000bd664  mov     r1, r5
000bd666  add     r4, pc ; -> 0x001808f4  
000bd668  mov     r3, r0
000bd66a  mov     r0, r6
000bd66c  blx     #0xddbfc ; -> objc_msgSend
000bd670  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bd674  ldr     r0, [pc, #0x21c]
000bd676  ldr     r1, [pc, #0x220]
000bd678  add     r0, pc ; -> 0x000fdb50  
000bd67a  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000bd67c  ldr.w   sl, [r0]
000bd680  ldr.w   r8, [r1]
000bd684  mov     r0, sl
000bd686  mov     r1, r8
000bd688  blx     #0xddbfc ; -> objc_msgSend
000bd68c  ldr     r1, [pc, #0x20c]
000bd68e  add     r1, pc ; -> 0x000fcb70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1f8
000bd690  ldr     r1, [r1]
000bd692  blx     #0xddbfc ; -> objc_msgSend
000bd696  mov     r2, r4
000bd698  mov     r1, r5
000bd69a  ldr     r4, [pc, #0x204]
000bd69c  add     r4, pc ; -> 0x00180904  
000bd69e  mov     r3, r0
000bd6a0  mov     r0, r6
000bd6a2  blx     #0xddbfc ; -> objc_msgSend
000bd6a6  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bd6aa  mov     r1, r8
000bd6ac  mov     r0, sl
000bd6ae  blx     #0xddbfc ; -> objc_msgSend
000bd6b2  ldr     r1, [pc, #0x1f0]
000bd6b4  add     r1, pc ; -> 0x000fd5c4  
000bd6b6  ldr     r1, [r1]
000bd6b8  blx     #0xddbfc ; -> objc_msgSend
000bd6bc  mov     r2, r4
000bd6be  mov     r1, r5
000bd6c0  ldr     r4, [pc, #0x1e4]
000bd6c2  add     r4, pc ; -> 0x0038c0e4  mtxController
000bd6c4  mov     r3, r0
000bd6c6  mov     r0, r6
000bd6c8  blx     #0xddbfc ; -> objc_msgSend
000bd6cc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bd6d0  bl      #0xb744c ; -> Z16CheckMTXUserInfov
000bd6d4  bl      #0xb7268 ; -> Z15CheckSocialInfov
000bd6d8  bl      #0xcf9d4 ; -> Z14MTXDMG_StartUpv
000bd6dc  ldr     r0, [pc, #0x1cc]
000bd6de  ldr     r1, [sp]
000bd6e0  add     r0, pc ; -> 0x000fdbf4  
000bd6e2  ldr     r0, [r0]
000bd6e4  blx     #0xddbfc ; -> objc_msgSend
000bd6e8  mov     r1, fp
000bd6ea  blx     #0xddbfc ; -> objc_msgSend
000bd6ee  ldr     r3, [pc, #0x1c0]
000bd6f0  add     r3, pc ; -> 0x0038c1c4  requestParams
000bd6f2  str     r0, [r3]
000bd6f4  bl      #0xbbb68 ; -> Z13GetPFlagCountv
000bd6f8  ldr     r3, [pc, #0x1b8]
000bd6fa  ldr     r1, [pc, #0x1bc]
000bd6fc  add     r3, pc ; -> 0x0038c158  pCount
000bd6fe  add     r1, pc ; -> 0x000fd5c0  
000bd700  ldr     r1, [r1]
000bd702  str     r0, [r3]
000bd704  ldr     r0, [r4]
000bd706  blx     #0xddbfc ; -> objc_msgSend
000bd70a  mov     r3, r0
000bd70c  cbnz    r0, #0xbd758
000bd70e  ldr     r1, [pc, #0x1ac]
000bd710  ldr     r0, [r4]
000bd712  movs    r2, #6
000bd714  add     r1, pc ; -> 0x000fd6d4  
000bd716  ldr     r1, [r1]
000bd718  blx     #0xddbfc ; -> objc_msgSend
000bd71c  b       #0xbd758
000bd71e  ldr     r1, [pc, #0x1a0]
000bd720  add     r1, pc ; -> 0x000fd5b8  
000bd722  ldr     r1, [r1]
000bd724  blx     #0xddbfc ; -> objc_msgSend
000bd728  cbnz    r0, #0xbd758
000bd72a  ldr     r3, [pc, #0x198]
000bd72c  add     r3, pc ; -> 0x0038c1d4  timerForceStopped
000bd72e  ldrsb.w r3, [r3]
000bd732  cbnz    r3, #0xbd758
000bd734  ldr     r0, [pc, #0x190]
000bd736  add     r0, pc ; -> 0x00180914  
000bd738  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bd73c  ldr     r0, [pc, #0x18c]
000bd73e  ldr     r1, [pc, #0x190]
000bd740  add     r0, pc ; -> 0x0038c0e4  mtxController
000bd742  add     r1, pc ; -> 0x000fd5bc  
000bd744  ldr     r0, [r0]
000bd746  ldr     r1, [r1]
000bd748  blx     #0xddbfc ; -> objc_msgSend
000bd74c  b       #0xbd758
000bd74e  ldr     r3, [pc, #0x184]
000bd750  movs    r2, #0
000bd752  add     r3, pc ; -> 0x0038c1a8  m_bDebugEnabled
000bd754  strb    r2, [r3]
000bd756  b       #0xbd5fe
000bd758  sub.w   sp, r7, #0x18
000bd75c  pop.w   {r8, sl, fp}
000bd760  pop     {r4, r5, r6, r7, pc}
000bd762  nop     
000bd764  stcl    p0, c0, [ip], {0x2c}
000bd768  adcs    r0, lr, #0x830000
000bd76c  lsrs    r4, r1, #1
000bd76e  movs    r4, r0
000bd770  adc     r0, r8, #0x830000
000bd774  lsls    r2, r0, #6
000bd776  movs    r4, r0
000bd778  stcl    p0, c0, [r8, #-0xb0]
000bd77c  stc     p0, c0, [sl], #0xb0
000bd780  lsls    r0, r7, #0x1b
000bd782  movs    r4, r0
000bd784  subs.w  r0, r2, #0x830000
