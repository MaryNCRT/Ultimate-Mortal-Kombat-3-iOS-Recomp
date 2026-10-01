========================================================================
-[EAMTX_Controller GetCount]  0x000cb944  192 bytes   EAMTX_Controller.mm
========================================================================

000cb944  push    {r4, r5, r6, r7, lr}
000cb946  add     r7, sp, #0xc
000cb948  sub     sp, #0xc
000cb94a  ldr     r2, [pc, #0x98]
000cb94c  add     r2, pc ; -> 0x0038c1e4  bDBCreated
000cb94e  ldrb    r3, [r2]
000cb950  cbnz    r3, #0xcb960
000cb952  ldr     r1, [pc, #0x94]
000cb954  adds    r3, #1
000cb956  strb    r3, [r2]
000cb958  add     r1, pc ; -> 0x000fd780  
000cb95a  ldr     r1, [r1]
000cb95c  blx     #0xddbfc ; -> objc_msgSend
000cb960  ldr     r0, [pc, #0x88]
000cb962  ldr     r1, [pc, #0x8c]
000cb964  add     r0, pc ; -> 0x0038c1e0  dbPath
000cb966  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cb968  ldr     r0, [r0]
000cb96a  ldr     r1, [r1]
000cb96c  blx     #0xddbfc ; -> objc_msgSend
000cb970  add     r1, sp, #8
000cb972  blx     #0xddd88 ; -> sqlite3_open
000cb976  cbnz    r0, #0xcb9ae
000cb978  ldr     r1, [pc, #0x78]
000cb97a  str     r0, [sp]
000cb97c  mov.w   r2, #-1
000cb980  add     r1, pc ; -> 0x000ea7dc  'select count(*) from trackingdb'
000cb982  ldr     r0, [sp, #8]
000cb984  add     r3, sp, #4
000cb986  blx     #0xddda0 ; -> sqlite3_prepare_v2
000cb98a  mov     r4, r0
000cb98c  cbnz    r0, #0xcb9a4
000cb98e  ldr     r0, [sp, #4]
000cb990  blx     #0xdddb8 ; -> sqlite3_step
000cb994  cmp     r0, #0x64
000cb996  bne     #0xcb9a4
000cb998  mov     r1, r4
000cb99a  ldr     r0, [sp, #4]
000cb99c  blx     #0xddd4c ; -> sqlite3_column_int
000cb9a0  mov     r4, r0
000cb9a2  b       #0xcb9a6
000cb9a4  movs    r4, #0
000cb9a6  ldr     r0, [sp, #4]
000cb9a8  blx     #0xddd70 ; -> sqlite3_finalize
000cb9ac  b       #0xcb9d6
000cb9ae  ldr     r0, [pc, #0x48]
000cb9b0  ldr     r1, [pc, #0x48]
000cb9b2  ldr     r4, [pc, #0x4c]
000cb9b4  add     r0, pc ; -> 0x000fdb5c  
000cb9b6  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cb9b8  ldr     r6, [r0]
000cb9ba  ldr     r0, [sp, #8]
000cb9bc  ldr     r5, [r1]
000cb9be  blx     #0xddd64 ; -> sqlite3_errmsg
000cb9c2  add     r4, pc ; -> 0x00181784  
000cb9c4  mov     r1, r5
000cb9c6  mov     r2, r4
000cb9c8  movs    r4, #0
000cb9ca  mov     r3, r0
000cb9cc  mov     r0, r6
000cb9ce  blx     #0xddbfc ; -> objc_msgSend
000cb9d2  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cb9d6  ldr     r0, [sp, #8]
000cb9d8  blx     #0xddd40 ; -> sqlite3_close
000cb9dc  mov     r0, r4
000cb9de  sub.w   sp, r7, #0xc
000cb9e2  pop     {r4, r5, r6, r7, pc}
000cb9e4  lsrs    r4, r2, #2
000cb9e6  movs    r4, r5
000cb9e8  subs    r4, r4, #0
000cb9ea  movs    r3, r0
000cb9ec  lsrs    r0, r7, #1
000cb9ee  movs    r4, r5
000cb9f0  asrs    r6, r6, #2
000cb9f2  movs    r3, r0
000cb9f4  cdp     p0, #5, c0, c8, c1, #0
000cb9f8  movs    r1, #0xa4
000cb9fa  movs    r3, r0
000cb9fc  asrs    r6, r4, #3
000cb9fe  movs    r3, r0
000cba00  ldrb    r6, [r7, r6]
000cba02  movs    r3, r1
