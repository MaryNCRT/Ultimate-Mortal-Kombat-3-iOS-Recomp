========================================================================
-[EAMTX_Controller DeleteEvents  0x000cbcd8  272 bytes   EAMTX_Controller.mm
========================================================================

000cbcd8  push    {r4, r5, r6, r7, lr}
000cbcda  add     r7, sp, #0xc
000cbcdc  sub     sp, #0xc
000cbcde  mov     r4, r2
000cbce0  ldr     r2, [pc, #0xcc]
000cbce2  add     r2, pc ; -> 0x0038c1e4  bDBCreated
000cbce4  ldrb    r3, [r2]
000cbce6  cbnz    r3, #0xcbcf6
000cbce8  ldr     r1, [pc, #0xc8]
000cbcea  adds    r3, #1
000cbcec  strb    r3, [r2]
000cbcee  add     r1, pc ; -> 0x000fd780  
000cbcf0  ldr     r1, [r1]
000cbcf2  blx     #0xddbfc ; -> objc_msgSend
000cbcf6  ldr     r0, [pc, #0xc0]
000cbcf8  ldr     r1, [pc, #0xc0]
000cbcfa  add     r0, pc ; -> 0x0038c1e0  dbPath
000cbcfc  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cbcfe  ldr     r0, [r0]
000cbd00  ldr     r1, [r1]
000cbd02  blx     #0xddbfc ; -> objc_msgSend
000cbd06  add     r1, sp, #8
000cbd08  blx     #0xddd88 ; -> sqlite3_open
000cbd0c  cmp     r0, #0
000cbd0e  bne     #0xcbd7e
000cbd10  ldr     r1, [pc, #0xac]
000cbd12  str     r0, [sp]
000cbd14  mov.w   r2, #-1
000cbd18  add     r1, pc ; -> 0x000ea890  'delete from trackingdb where rowid in ( select rowid from trackingdb order by priority desc, session desc, step desc, rowid desc limit ?)'
000cbd1a  ldr     r0, [sp, #8]
000cbd1c  add     r3, sp, #4
000cbd1e  blx     #0xddda0 ; -> sqlite3_prepare_v2
000cbd22  cbnz    r0, #0xcbd76
000cbd24  movs    r1, #1
000cbd26  mov     r2, r4
000cbd28  ldr     r0, [sp, #4]
000cbd2a  blx     #0xddd10 ; -> sqlite3_bind_int
000cbd2e  ldr     r0, [sp, #4]
000cbd30  blx     #0xdddb8 ; -> sqlite3_step
000cbd34  cmp     r0, #0x65
000cbd36  beq     #0xcbd50
000cbd38  ldr     r0, [pc, #0x88]
000cbd3a  ldr     r1, [pc, #0x8c]
000cbd3c  ldr     r4, [pc, #0x8c]
000cbd3e  add     r0, pc ; -> 0x000fdb5c  
000cbd40  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cbd42  ldr     r6, [r0]
000cbd44  ldr     r0, [sp, #8]
000cbd46  ldr     r5, [r1]
000cbd48  add     r4, pc ; -> 0x001817b4  
000cbd4a  blx     #0xddd64 ; -> sqlite3_errmsg
000cbd4e  b       #0xcbd66
000cbd50  ldr     r0, [pc, #0x7c]
000cbd52  ldr     r1, [pc, #0x80]
000cbd54  ldr     r4, [pc, #0x80]
000cbd56  add     r0, pc ; -> 0x000fdb5c  
000cbd58  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cbd5a  ldr     r6, [r0]
000cbd5c  ldr     r0, [sp, #8]
000cbd5e  ldr     r5, [r1]
000cbd60  add     r4, pc ; -> 0x001817c4  
000cbd62  blx     #0xddd28 ; -> sqlite3_changes
000cbd66  mov     r3, r0
000cbd68  mov     r1, r5
000cbd6a  mov     r2, r4
000cbd6c  mov     r0, r6
000cbd6e  blx     #0xddbfc ; -> objc_msgSend
000cbd72  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbd76  ldr     r0, [sp, #4]
000cbd78  blx     #0xddd70 ; -> sqlite3_finalize
000cbd7c  b       #0xcbda4
000cbd7e  ldr     r0, [pc, #0x5c]
000cbd80  ldr     r1, [pc, #0x5c]
000cbd82  ldr     r4, [pc, #0x60]
000cbd84  add     r0, pc ; -> 0x000fdb5c  
000cbd86  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cbd88  ldr     r6, [r0]
000cbd8a  ldr     r0, [sp, #8]
000cbd8c  ldr     r5, [r1]
000cbd8e  blx     #0xddd64 ; -> sqlite3_errmsg
000cbd92  add     r4, pc ; -> 0x00181784  
000cbd94  mov     r1, r5
000cbd96  mov     r2, r4
000cbd98  mov     r3, r0
000cbd9a  mov     r0, r6
000cbd9c  blx     #0xddbfc ; -> objc_msgSend
000cbda0  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbda4  ldr     r0, [sp, #8]
000cbda6  blx     #0xddd40 ; -> sqlite3_close
000cbdaa  sub.w   sp, r7, #0xc
000cbdae  pop     {r4, r5, r6, r7, pc}
000cbdb0  lsls    r6, r7, #0x13
000cbdb2  movs    r4, r5
000cbdb4  subs    r6, r1, r2
000cbdb6  movs    r3, r0
000cbdb8  lsls    r2, r4, #0x13
000cbdba  movs    r4, r5
000cbdbc  lsrs    r0, r4, #0x14
000cbdbe  movs    r3, r0
000cbdc0  sbcs.w  r0, r4, r1
000cbdc4  subs    r2, r3, #0
000cbdc6  movs    r3, r0
000cbdc8  lsrs    r4, r3, #0x15
000cbdca  movs    r3, r0
000cbdcc  ldrh    r0, [r5, r1]
000cbdce  movs    r3, r1
000cbdd0  subs    r2, r0, #0
000cbdd2  movs    r3, r0
000cbdd4  lsrs    r4, r0, #0x15
000cbdd6  movs    r3, r0
000cbdd8  ldrh    r0, [r4, r1]
000cbdda  movs    r3, r1
000cbddc  adds    r4, r2, #7
000cbdde  movs    r3, r0
000cbde0  lsrs    r6, r2, #0x14
000cbde2  movs    r3, r0
000cbde4  ldr     r6, [r5, r7]
000cbde6  movs    r3, r1
