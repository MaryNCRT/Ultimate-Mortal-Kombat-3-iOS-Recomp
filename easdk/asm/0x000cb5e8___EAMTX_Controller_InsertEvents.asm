========================================================================
-[EAMTX_Controller InsertEvents  0x000cb5e8  860 bytes   EAMTX_Controller.mm
========================================================================

000cb5e8  push    {r4, r5, r6, r7, lr}
000cb5ea  add     r7, sp, #0xc
000cb5ec  push.w  {r8, sl, fp}
000cb5f0  sub     sp, #0x28
000cb5f2  str     r2, [sp, #4]
000cb5f4  ldr     r2, [pc, #0x2d8]
000cb5f6  mov     r4, r0
000cb5f8  add     r2, pc ; -> 0x0038c1e4  bDBCreated
000cb5fa  ldrb    r3, [r2]
000cb5fc  cbnz    r3, #0xcb60c
000cb5fe  ldr     r1, [pc, #0x2d4]
000cb600  adds    r3, #1
000cb602  strb    r3, [r2]
000cb604  add     r1, pc ; -> 0x000fd780  
000cb606  ldr     r1, [r1]
000cb608  blx     #0xddbfc ; -> objc_msgSend
000cb60c  ldr     r1, [pc, #0x2c8]
000cb60e  mov     r0, r4
000cb610  add     r1, pc ; -> 0x000fd788  
000cb612  ldr     r1, [r1]
000cb614  blx     #0xddbfc ; -> objc_msgSend
000cb618  ldr     r1, [pc, #0x2c0]
000cb61a  ldr     r2, [pc, #0x2c4]
000cb61c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cb61e  add     r2, pc ; -> 0x00181724  
000cb620  ldr     r1, [r1]
000cb622  str     r1, [sp, #0xc]
000cb624  mov     r4, r0
000cb626  ldr     r0, [pc, #0x2bc]
000cb628  mov     r3, r4
000cb62a  add     r0, pc ; -> 0x000fdb5c  
000cb62c  ldr     r0, [r0]
000cb62e  str     r0, [sp, #8]
000cb630  blx     #0xddbfc ; -> objc_msgSend
000cb634  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb638  movw    r3, #0x270f
000cb63c  cmp     r4, r3
000cb63e  bgt     #0xcb65a
000cb640  ldr     r2, [sp, #4]
000cb642  cmp     r2, #0
000cb644  beq.w   #0xcb8a2
000cb648  ldr     r1, [pc, #0x29c]
000cb64a  mov     r0, r2
000cb64c  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cb64e  ldr     r1, [r1]
000cb650  blx     #0xddbfc ; -> objc_msgSend
000cb654  cmp     r0, #0
000cb656  bne.w   #0xcb8a2
000cb65a  ldr.w   r1, [pc, #0x290]
000cb65e  ldr     r0, [sp, #4]
000cb660  ldr.w   r4, [pc, #0x28c]
000cb664  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cb666  ldr     r1, [r1]
000cb668  blx     #0xddbfc ; -> objc_msgSend
000cb66c  add     r4, pc ; -> 0x00181734  
000cb66e  ldr     r1, [sp, #0xc]
000cb670  mov     r2, r4
000cb672  mov     r3, r0
000cb674  ldr     r0, [sp, #8]
000cb676  blx     #0xddbfc ; -> objc_msgSend
000cb67a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb67e  b       #0xcb8c6
000cb680  ldr     r1, [pc, #0x270]
000cb682  ldr     r0, [sp, #0x24]
000cb684  mov.w   r2, #-1
000cb688  add     r1, pc ; -> 0x000ea6a0  'insert into trackingdb (session, eventType, step, priority, eventKeyType01, eventValue01, eventKeyType02, eventValue02, timestamp) values (?, ?, ?, ?, ?, ?, ?, ?, ?)'
000cb68a  add     r3, sp, #0x20
000cb68c  str     r4, [sp]
000cb68e  blx     #0xddd94 ; -> sqlite3_prepare
000cb692  cbz     r0, #0xcb6ae
000cb694  ldr     r0, [sp, #0x24]
000cb696  blx     #0xddd64 ; -> sqlite3_errmsg
000cb69a  ldr     r5, [pc, #0x25c]
000cb69c  ldr     r1, [sp, #0xc]
000cb69e  add     r5, pc ; -> 0x00181744  
000cb6a0  mov     r2, r5
000cb6a2  mov     r3, r0
000cb6a4  ldr     r0, [sp, #8]
000cb6a6  blx     #0xddbfc ; -> objc_msgSend
000cb6aa  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb6ae  ldr     r1, [pc, #0x24c]
000cb6b0  mov.w   r3, #-1
000cb6b4  str     r4, [sp, #0x18]
000cb6b6  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cb6b8  str     r3, [sp, #0x14]
000cb6ba  ldr     r1, [r1]
000cb6bc  str     r1, [sp, #0x1c]
000cb6be  ldr     r1, [pc, #0x240]
000cb6c0  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000cb6c2  ldr     r1, [r1]
000cb6c4  str     r1, [sp, #0x10]
000cb6c6  ldr     r1, [pc, #0x23c]
000cb6c8  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000cb6ca  ldr     r6, [r1]
000cb6cc  ldr     r1, [pc, #0x238]
000cb6ce  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000cb6d0  ldr.w   sl, [r1]
000cb6d4  b       #0xcb854
000cb6d6  ldr     r1, [sp, #0x10]
000cb6d8  ldr     r2, [sp, #0x18]
000cb6da  ldr     r0, [sp, #4]
000cb6dc  blx     #0xddbfc ; -> objc_msgSend
000cb6e0  ldr     r2, [pc, #0x228]
000cb6e2  mov     r1, r6
000cb6e4  ldr     r5, [sp, #0x20]
000cb6e6  add     r2, pc ; -> 0x0017fff4  
000cb6e8  mov.w   r8, #-1
000cb6ec  mov     r4, r0
000cb6ee  blx     #0xddbfc ; -> objc_msgSend
000cb6f2  mov     r1, fp
000cb6f4  blx     #0xddbfc ; -> objc_msgSend
000cb6f8  mov     r3, r8
000cb6fa  movs    r1, #1
000cb6fc  str.w   r8, [sp]
000cb700  mov     r2, r0
000cb702  mov     r0, r5
000cb704  blx     #0xddd1c ; -> sqlite3_bind_text
000cb708  ldr     r2, [pc, #0x204]
000cb70a  mov     r1, r6
000cb70c  mov     r0, r4
000cb70e  add     r2, pc ; -> 0x0017ffd4  
000cb710  ldr     r5, [sp, #0x20]
000cb712  blx     #0xddbfc ; -> objc_msgSend
000cb716  mov     r1, sl
000cb718  blx     #0xddbfc ; -> objc_msgSend
000cb71c  movs    r1, #2
000cb71e  mov     r2, r0
000cb720  mov     r0, r5
000cb722  blx     #0xddd10 ; -> sqlite3_bind_int
000cb726  ldr     r2, [pc, #0x1ec]
000cb728  mov     r1, r6
000cb72a  mov     r0, r4
000cb72c  add     r2, pc ; -> 0x0017ffe4  
000cb72e  ldr     r5, [sp, #0x20]
000cb730  blx     #0xddbfc ; -> objc_msgSend
000cb734  mov     r1, sl
000cb736  blx     #0xddbfc ; -> objc_msgSend
000cb73a  movs    r1, #3
000cb73c  mov     r2, r0
000cb73e  mov     r0, r5
000cb740  blx     #0xddd10 ; -> sqlite3_bind_int
000cb744  ldr     r2, [pc, #0x1d0]
000cb746  mov     r1, r6
000cb748  mov     r0, r4
000cb74a  add     r2, pc ; -> 0x00181754  
000cb74c  ldr     r5, [sp, #0x20]
000cb74e  blx     #0xddbfc ; -> objc_msgSend
000cb752  mov     r1, sl
000cb754  blx     #0xddbfc ; -> objc_msgSend
000cb758  movs    r1, #4
000cb75a  mov     r2, r0
000cb75c  mov     r0, r5
000cb75e  blx     #0xddd10 ; -> sqlite3_bind_int
000cb762  ldr     r2, [pc, #0x1b8]
000cb764  mov     r1, r6
000cb766  mov     r0, r4
000cb768  add     r2, pc ; -> 0x00180004  
000cb76a  ldr     r5, [sp, #0x20]
000cb76c  blx     #0xddbfc ; -> objc_msgSend
000cb770  mov     r1, sl
000cb772  blx     #0xddbfc ; -> objc_msgSend
000cb776  movs    r1, #5
000cb778  mov     r2, r0
000cb77a  mov     r0, r5
000cb77c  blx     #0xddd10 ; -> sqlite3_bind_int
000cb780  ldr     r2, [pc, #0x19c]
000cb782  mov     r1, r6
000cb784  mov     r0, r4
000cb786  add     r2, pc ; -> 0x00180014  
000cb788  ldr     r5, [sp, #0x20]
000cb78a  blx     #0xddbfc ; -> objc_msgSend
000cb78e  mov     r1, fp
000cb790  blx     #0xddbfc ; -> objc_msgSend
000cb794  mov     r3, r8
000cb796  movs    r1, #6
000cb798  str.w   r8, [sp]
000cb79c  mov     r2, r0
000cb79e  mov     r0, r5
000cb7a0  blx     #0xddd1c ; -> sqlite3_bind_text
000cb7a4  ldr     r2, [pc, #0x17c]
000cb7a6  mov     r1, r6
000cb7a8  mov     r0, r4
000cb7aa  add     r2, pc ; -> 0x00180024  
000cb7ac  ldr     r5, [sp, #0x20]
000cb7ae  blx     #0xddbfc ; -> objc_msgSend
000cb7b2  mov     r1, sl
000cb7b4  blx     #0xddbfc ; -> objc_msgSend
000cb7b8  movs    r1, #7
000cb7ba  mov     r2, r0
000cb7bc  mov     r0, r5
000cb7be  blx     #0xddd10 ; -> sqlite3_bind_int
000cb7c2  ldr     r2, [pc, #0x164]
000cb7c4  mov     r1, r6
000cb7c6  mov     r0, r4
000cb7c8  add     r2, pc ; -> 0x00180034  
000cb7ca  ldr     r5, [sp, #0x20]
000cb7cc  blx     #0xddbfc ; -> objc_msgSend
000cb7d0  mov     r1, fp
000cb7d2  blx     #0xddbfc ; -> objc_msgSend
000cb7d6  mov     r3, r8
000cb7d8  movs    r1, #8
000cb7da  str.w   r8, [sp]
000cb7de  mov     r2, r0
000cb7e0  mov     r0, r5
000cb7e2  blx     #0xddd1c ; -> sqlite3_bind_text
000cb7e6  ldr     r2, [pc, #0x144]
000cb7e8  mov     r1, r6
000cb7ea  mov     r0, r4
000cb7ec  add     r2, pc ; -> 0x00180044  
000cb7ee  ldr     r5, [sp, #0x20]
000cb7f0  blx     #0xddbfc ; -> objc_msgSend
000cb7f4  mov     r1, fp
000cb7f6  blx     #0xddbfc ; -> objc_msgSend
000cb7fa  movs    r1, #9
000cb7fc  mov     r3, r8
000cb7fe  str.w   r8, [sp]
000cb802  mov     r2, r0
000cb804  mov     r0, r5
000cb806  blx     #0xddd1c ; -> sqlite3_bind_text
000cb80a  ldr     r0, [sp, #0x20]
000cb80c  blx     #0xdddb8 ; -> sqlite3_step
000cb810  cmp     r0, #0x65
000cb812  beq     #0xcb830
000cb814  ldr     r0, [sp, #0x24]
000cb816  blx     #0xddd64 ; -> sqlite3_errmsg
000cb81a  ldr     r4, [pc, #0x114]
000cb81c  ldr     r1, [sp, #0xc]
000cb81e  add     r4, pc ; -> 0x00181764  
000cb820  mov     r2, r4
000cb822  mov     r3, r0
000cb824  ldr     r0, [sp, #8]
000cb826  blx     #0xddbfc ; -> objc_msgSend
000cb82a  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb82e  b       #0xcb838
000cb830  ldr     r0, [sp, #0x24]
000cb832  blx     #0xddd7c ; -> sqlite3_last_insert_rowid
000cb836  str     r0, [sp, #0x14]
000cb838  ldr     r0, [sp, #0x20]
000cb83a  blx     #0xdddac ; -> sqlite3_reset
000cb83e  ldr     r0, [sp, #0x20]
000cb840  blx     #0xddd34 ; -> sqlite3_clear_bindings
000cb844  ldr     r2, [sp, #0x14]
000cb846  movw    r3, #0x2710
000cb84a  cmp     r2, r3
000cb84c  bgt     #0xcb864
000cb84e  ldr     r3, [sp, #0x18]
000cb850  adds    r3, #1
000cb852  str     r3, [sp, #0x18]
000cb854  ldr     r0, [sp, #4]
000cb856  ldr     r1, [sp, #0x1c]
000cb858  blx     #0xddbfc ; -> objc_msgSend
000cb85c  ldr     r2, [sp, #0x18]
000cb85e  cmp     r0, r2
000cb860  bhi.w   #0xcb6d6
000cb864  ldr     r2, [pc, #0xcc]
000cb866  ldr     r1, [sp, #0xc]
000cb868  ldr     r3, [sp, #0x14]
000cb86a  add     r2, pc ; -> 0x00181774  
000cb86c  ldr     r0, [sp, #8]
000cb86e  blx     #0xddbfc ; -> objc_msgSend
000cb872  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb876  ldr     r0, [sp, #0x20]
000cb878  blx     #0xddd70 ; -> sqlite3_finalize
000cb87c  b       #0xcb89a
000cb87e  ldr     r0, [sp, #0x24]
000cb880  blx     #0xddd64 ; -> sqlite3_errmsg
000cb884  ldr.w   r4, [pc, #0xb0]
000cb888  ldr     r1, [sp, #0xc]
000cb88a  add     r4, pc ; -> 0x00181784  
000cb88c  mov     r2, r4
000cb88e  mov     r3, r0
000cb890  ldr     r0, [sp, #8]
000cb892  blx     #0xddbfc ; -> objc_msgSend
000cb896  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb89a  ldr     r0, [sp, #0x24]
000cb89c  blx     #0xddd40 ; -> sqlite3_close
000cb8a0  b       #0xcb8c6
000cb8a2  ldr     r1, [pc, #0x98]
000cb8a4  ldr     r0, [pc, #0x98]
000cb8a6  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cb8a8  add     r0, pc ; -> 0x0038c1e0  dbPath
000cb8aa  ldr.w   fp, [r1]
000cb8ae  ldr     r0, [r0]
000cb8b0  mov     r1, fp
000cb8b2  blx     #0xddbfc ; -> objc_msgSend
000cb8b6  add     r1, sp, #0x24
000cb8b8  blx     #0xddd88 ; -> sqlite3_open
000cb8bc  mov     r4, r0
000cb8be  cmp     r0, #0
000cb8c0  beq.w   #0xcb680
000cb8c4  b       #0xcb87e
000cb8c6  sub.w   sp, r7, #0x18
000cb8ca  pop.w   {r8, sl, fp}
000cb8ce  pop     {r4, r5, r6, r7, pc}
000cb8d0  lsrs    r0, r5, #0xf
000cb8d2  movs    r4, r5
000cb8d4  movs    r1, #0x78
000cb8d6  movs    r3, r0
000cb8d8  movs    r1, #0x74
000cb8da  movs    r3, r0
000cb8dc  asrs    r0, r0, #0x12
000cb8de  movs    r3, r0
000cb8e0  str     r2, [r0, #0x10]
000cb8e2  movs    r3, r1
000cb8e4  movs    r5, #0x2e
000cb8e6  movs    r3, r0
000cb8e8  asrs    r0, r6, #0x10
000cb8ea  movs    r3, r0
000cb8ec  asrs    r0, r3, #0x10
000cb8ee  movs    r3, r0
000cb8f0  str     r4, [r0, #0xc]
000cb8f2  movs    r3, r1
000cb8f4  ands    r0, r4, #1
000cb8f8  str     r2, [r4, #8]
000cb8fa  movs    r3, r1
000cb8fc  asrs    r6, r0, #0xf
000cb8fe  movs    r3, r0
000cb900  asrs    r0, r7, #0xe
000cb902  movs    r3, r0
000cb904  asrs    r4, r4, #0x10
000cb906  movs    r3, r0
000cb908  asrs    r6, r2, #0x10
000cb90a  movs    r3, r0
000cb90c  ldr     r1, [pc, #0x28]
000cb90e  movs    r3, r1
000cb910  ldr     r0, [pc, #0x308]
000cb912  movs    r3, r1
000cb914  ldr     r0, [pc, #0x2d0]
000cb916  movs    r3, r1
000cb918  str     r6, [r0]
000cb91a  movs    r3, r1
000cb91c  ldr     r0, [pc, #0x260]
000cb91e  movs    r3, r1
000cb920  ldr     r0, [pc, #0x228]
000cb922  movs    r3, r1
000cb924  ldr     r0, [pc, #0x1d8]
000cb926  movs    r3, r1
000cb928  ldr     r0, [pc, #0x1a0]
000cb92a  movs    r3, r1
000cb92c  ldr     r0, [pc, #0x150]
000cb92e  movs    r3, r1
000cb930  ldrsh   r2, [r0, r5]
000cb932  movs    r3, r1
000cb934  ldrsh   r6, [r0, r4]
000cb936  movs    r3, r1
000cb938  ldrsh   r6, [r6, r3]
000cb93a  movs    r3, r1
000cb93c  asrs    r6, r6, #5
000cb93e  movs    r3, r0
000cb940  lsrs    r4, r6, #4
000cb942  movs    r4, r5
