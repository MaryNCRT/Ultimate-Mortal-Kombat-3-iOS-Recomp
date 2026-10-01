========================================================================
-[EAMTX_Controller RemoveDisabledEvents]  0x000cbde8  632 bytes   EAMTX_Controller.mm
========================================================================

000cbde8  push    {r4, r5, r6, r7, lr}
000cbdea  add     r7, sp, #0xc
000cbdec  push.w  {r8, sl, fp}
000cbdf0  sub     sp, #0x78
000cbdf2  ldr     r3, [pc, #0x20c]
000cbdf4  add     r3, pc ; -> 0x0038c1e4  bDBCreated
000cbdf6  ldrb    r3, [r3]
000cbdf8  cmp     r3, #0
000cbdfa  beq.w   #0xcbff4
000cbdfe  ldr     r0, [pc, #0x204]
000cbe00  ldr.w   r1, [pc, #0x204]
000cbe04  add     r0, pc ; -> 0x000fdcbc  
000cbe06  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cbe08  ldr     r0, [r0]
000cbe0a  ldr     r1, [r1]
000cbe0c  blx     #0xddbfc ; -> objc_msgSend
000cbe10  ldr     r1, [pc, #0x1f8]
000cbe12  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000cbe14  ldr     r1, [r1]
000cbe16  blx     #0xddbfc ; -> objc_msgSend
000cbe1a  ldr     r1, [pc, #0x1f4]
000cbe1c  add     r1, pc ; -> 0x000fca20  '\x18V\x0e'
000cbe1e  ldr     r1, [r1]
000cbe20  mov     r8, r0
000cbe22  ldr     r0, [pc, #0x1f0]
000cbe24  add     r0, pc ; -> 0x0038c1e0  dbPath
000cbe26  ldr     r0, [r0]
000cbe28  blx     #0xddbfc ; -> objc_msgSend
000cbe2c  add     r1, sp, #0x74
000cbe2e  blx     #0xddd88 ; -> sqlite3_open
000cbe32  cmp     r0, #0
000cbe34  bne.w   #0xcbfbc
000cbe38  ldr     r1, [pc, #0x1dc]
000cbe3a  str     r0, [sp, #0x70]
000cbe3c  str     r0, [sp]
000cbe3e  add     r1, pc ; -> 0x000ea818  'select * from trackingdb order by priority asc, session asc, step asc, rowid asc limit ?'
000cbe40  ldr     r0, [sp, #0x74]
000cbe42  mov.w   r2, #-1
000cbe46  add     r3, sp, #0x70
000cbe48  blx     #0xddda0 ; -> sqlite3_prepare_v2
000cbe4c  cmp     r0, #0
000cbe4e  bne     #0xcbeb0
000cbe50  movs    r1, #1
000cbe52  ldr     r0, [sp, #0x70]
000cbe54  mov.w   r2, #0x3e8
000cbe58  blx     #0xddd10 ; -> sqlite3_bind_int
000cbe5c  ldr.w   r1, [pc, #0x1bc]
000cbe60  ldr     r0, [pc, #0x1bc]
000cbe62  add     r1, pc ; -> 0x000fd6d8  
000cbe64  add     r0, pc ; -> 0x000fdb48  
000cbe66  ldr     r6, [r1]
000cbe68  ldr     r1, [pc, #0x1b8]
000cbe6a  ldr.w   sl, [r0]
000cbe6e  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000cbe70  ldr     r5, [r1]
000cbe72  ldr     r1, [pc, #0x1b4]
000cbe74  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000cbe76  ldr.w   fp, [r1]
000cbe7a  b       #0xcbea6
000cbe7c  movs    r1, #1
000cbe7e  ldr     r0, [sp, #0x70]
000cbe80  blx     #0xddd4c ; -> sqlite3_column_int
000cbe84  mov     r1, r6
000cbe86  mov     r2, r0
000cbe88  mov     r0, sl
000cbe8a  blx     #0xddbfc ; -> objc_msgSend
000cbe8e  mov     r1, r5
000cbe90  mov     r4, r0
000cbe92  blx     #0xddbfc ; -> objc_msgSend
000cbe96  bl      #0xb6eb4 ; -> Z10AllowEventi
000cbe9a  cbnz    r0, #0xcbea6
000cbe9c  mov     r0, r8
000cbe9e  mov     r1, fp
000cbea0  mov     r2, r4
000cbea2  blx     #0xddbfc ; -> objc_msgSend
000cbea6  ldr     r0, [sp, #0x70]
000cbea8  blx     #0xdddb8 ; -> sqlite3_step
000cbeac  cmp     r0, #0x64
000cbeae  beq     #0xcbe7c
000cbeb0  ldr     r0, [sp, #0x70]
000cbeb2  blx     #0xddd70 ; -> sqlite3_finalize
000cbeb6  ldr     r1, [pc, #0x174]
000cbeb8  mov     r0, r8
000cbeba  movs    r4, #0
000cbebc  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000cbebe  str     r4, [sp, #0x70]
000cbec0  ldr     r5, [r1]
000cbec2  mov     r1, r5
000cbec4  blx     #0xddbfc ; -> objc_msgSend
000cbec8  cmp     r0, #0
000cbeca  beq.w   #0xcbfe2
000cbece  ldr     r0, [pc, #0x160]
000cbed0  ldr.w   r1, [pc, #0x160]
000cbed4  ldr     r6, [pc, #0x160]
000cbed6  add     r0, pc ; -> 0x000fdb5c  
000cbed8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cbeda  ldr.w   fp, [r0]
000cbede  ldr.w   sl, [r1]
000cbee2  mov     r0, r8
000cbee4  mov     r1, r5
000cbee6  blx     #0xddbfc ; -> objc_msgSend
000cbeea  add     r6, pc ; -> 0x001817d4  
000cbeec  mov     r1, sl
000cbeee  mov     r2, r6
000cbef0  mov     r3, r0
000cbef2  mov     r0, fp
000cbef4  blx     #0xddbfc ; -> objc_msgSend
000cbef8  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbefc  ldr     r1, [pc, #0x13c]
000cbefe  movs    r3, #0x10
000cbf00  mov     r0, r8
000cbf02  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000cbf04  str     r3, [sp]
000cbf06  ldr     r1, [r1]
000cbf08  add     r2, sp, #0x50
000cbf0a  add     r3, sp, r3
000cbf0c  str     r4, [sp, #0x50]
000cbf0e  str     r4, [sp, #0x54]
000cbf10  str     r4, [sp, #0x58]
000cbf12  str     r4, [sp, #0x5c]
000cbf14  str     r4, [sp, #0x60]
000cbf16  str     r4, [sp, #0x64]
000cbf18  str     r4, [sp, #0x68]
000cbf1a  str     r4, [sp, #0x6c]
000cbf1c  str     r1, [sp, #8]
000cbf1e  blx     #0xddbfc ; -> objc_msgSend
000cbf22  cmp     r0, #0
000cbf24  beq     #0xcbfe2
000cbf26  ldr     r3, [sp, #0x58]
000cbf28  ldr     r1, [pc, #0x114]
000cbf2a  mov     sl, r0
000cbf2c  ldr     r2, [r3]
000cbf2e  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000cbf30  ldr.w   fp, [r1]
000cbf34  str     r2, [sp, #0xc]
000cbf36  ldr     r2, [pc, #0x10c]
000cbf38  str     r2, [sp, #4]
000cbf3a  b       #0xcbf3e
000cbf3c  ldr     r3, [sp, #0x58]
000cbf3e  movs    r6, #0
000cbf40  b       #0xcbf44
000cbf42  ldr     r3, [sp, #0x58]
000cbf44  ldr     r3, [r3]
000cbf46  ldr     r2, [sp, #0xc]
000cbf48  cmp     r3, r2
000cbf4a  beq     #0xcbf52
000cbf4c  mov     r0, r8
000cbf4e  blx     #0xddbe4 ; -> objc_enumerationMutation
000cbf52  ldr     r0, [sp, #0x54]
000cbf54  ldr     r1, [sp, #4]
000cbf56  movs    r3, #0
000cbf58  mov.w   r2, #-1
000cbf5c  ldr.w   r5, [r0, r6, lsl #2]
000cbf60  add     r1, pc
000cbf62  str     r3, [sp]
000cbf64  ldr     r0, [sp, #0x74]
000cbf66  add     r3, sp, #0x70
000cbf68  blx     #0xddda0 ; -> sqlite3_prepare_v2
000cbf6c  cbnz    r0, #0xcbf92
000cbf6e  mov     r1, fp
000cbf70  mov     r0, r5
000cbf72  ldr     r4, [sp, #0x70]
000cbf74  blx     #0xddbfc ; -> objc_msgSend
000cbf78  movs    r1, #1
000cbf7a  mov     r2, r0
000cbf7c  mov     r0, r4
000cbf7e  blx     #0xddd10 ; -> sqlite3_bind_int
000cbf82  ldr     r0, [sp, #0x70]
000cbf84  blx     #0xdddb8 ; -> sqlite3_step
000cbf88  cmp     r0, #0x65
000cbf8a  beq     #0xcbf98
000cbf8c  ldr     r0, [pc, #0xb8]
000cbf8e  add     r0, pc ; -> 0x001817e4  
000cbf90  b       #0xcbfde
000cbf92  ldr     r0, [pc, #0xb8]
000cbf94  add     r0, pc ; -> 0x001817f4  
000cbf96  b       #0xcbfde
000cbf98  ldr     r0, [sp, #0x70]
000cbf9a  adds    r6, #1
000cbf9c  blx     #0xddd70 ; -> sqlite3_finalize
000cbfa0  cmp     sl, r6
000cbfa2  bhi     #0xcbf42
000cbfa4  movs    r3, #0x10
000cbfa6  mov     r0, r8
000cbfa8  str     r3, [sp]
000cbfaa  ldr     r1, [sp, #8]
000cbfac  add     r2, sp, #0x50
000cbfae  add     r3, sp, r3
000cbfb0  blx     #0xddbfc ; -> objc_msgSend
000cbfb4  mov     sl, r0
000cbfb6  cmp     r0, #0
000cbfb8  bne     #0xcbf3c
000cbfba  b       #0xcbfe2
000cbfbc  ldr     r0, [pc, #0x90]
000cbfbe  ldr     r1, [pc, #0x94]
000cbfc0  ldr     r4, [pc, #0x94]
000cbfc2  add     r0, pc ; -> 0x000fdb5c  
000cbfc4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cbfc6  ldr     r6, [r0]
000cbfc8  ldr     r0, [sp, #0x74]
000cbfca  ldr     r5, [r1]
000cbfcc  blx     #0xddd64 ; -> sqlite3_errmsg
000cbfd0  add     r4, pc ; -> 0x00181784  
000cbfd2  mov     r1, r5
000cbfd4  mov     r2, r4
000cbfd6  mov     r3, r0
000cbfd8  mov     r0, r6
000cbfda  blx     #0xddbfc ; -> objc_msgSend
000cbfde  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000cbfe2  ldr     r0, [sp, #0x74]
000cbfe4  blx     #0xddd40 ; -> sqlite3_close
000cbfe8  ldr     r1, [pc, #0x70]
000cbfea  mov     r0, r8
000cbfec  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cbfee  ldr     r1, [r1]
000cbff0  blx     #0xddbfc ; -> objc_msgSend
000cbff4  sub.w   sp, r7, #0x18
000cbff8  pop.w   {r8, sl, fp}
000cbffc  pop     {r4, r5, r6, r7, pc}
000cbffe  nop     
000cc000  lsls    r4, r5, #0xf
000cc002  movs    r4, r5
000cc004  subs    r4, r6, #2
000cc006  movs    r3, r0
000cc008  lsrs    r2, r7, #0xd
000cc00a  movs    r3, r0
000cc00c  lsrs    r2, r5, #0xd
000cc00e  movs    r3, r0
000cc010  lsrs    r0, r0, #0x10
000cc012  movs    r3, r0
000cc014  lsls    r0, r7, #0xe
000cc016  movs    r4, r5
000cc018  ldrd    r0, r0, [r6, #4]
000cc01c  adds    r2, r6, r1
000cc01e  movs    r3, r0
000cc020  adds    r0, r4, #3
000cc022  movs    r3, r0
000cc024  lsrs    r6, r6, #0x11
000cc026  movs    r3, r0
000cc028  lsrs    r4, r1, #0x10
000cc02a  movs    r3, r0
000cc02c  lsrs    r0, r0, #0xf
000cc02e  movs    r3, r0
000cc030  adds    r2, r0, #2
000cc032  movs    r3, r0
000cc034  lsrs    r4, r0, #0xf
000cc036  movs    r3, r0
000cc038  ldr     r6, [r4, r3]
000cc03a  movs    r3, r1
000cc03c  lsrs    r2, r2, #0xa
000cc03e  movs    r3, r0
000cc040  lsrs    r6, r6, #0xe
000cc042  movs    r3, r0
000cc044  and.w   r0, r8, r1
000cc048  ldr     r2, [r2, r1]
000cc04a  movs    r3, r1
000cc04c  ldr     r4, [r3, r1]
000cc04e  movs    r3, r1
000cc050  subs    r6, r2, r6
000cc052  movs    r3, r0
000cc054  lsrs    r0, r3, #0xb
000cc056  movs    r3, r0
000cc058  ldrsb   r0, [r6, r6]
000cc05a  movs    r3, r1
000cc05c  lsrs    r4, r1, #6
000cc05e  movs    r3, r0
