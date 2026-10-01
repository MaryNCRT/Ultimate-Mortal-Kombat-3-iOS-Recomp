========================================================================
addEventToArray  0x000b6828  952 bytes   EAMTX_Main.mm
========================================================================

000b6828  push    {r4, r5, r6, r7, lr}
000b682a  add     r7, sp, #0xc
000b682c  push.w  {r8, sl, fp}
000b6830  sub     sp, #0x40
000b6832  str     r1, [sp, #0x10]
000b6834  ldr     r1, [pc, #0x328]
000b6836  str     r0, [sp, #0x14]
000b6838  ldr     r0, [pc, #0x328]
000b683a  add     r1, pc ; -> 0x000fd6e0  
000b683c  ldr.w   r8, [pc, #0x328]
000b6840  ldr     r5, [r1]
000b6842  ldr     r1, [pc, #0x328]
000b6844  add     r0, pc ; -> 0x000fdb5c  
000b6846  ldr     r4, [pc, #0x328]
000b6848  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b684a  ldr     r0, [r0]
000b684c  ldr     r1, [r1]
000b684e  add     r8, pc ; -> 0x0017e5c4  
000b6850  add     r4, pc ; -> 0x0038c120  eventsOrder
000b6852  ldr     r3, [sp, #0x14]
000b6854  mov     r2, r8
000b6856  ldr     r6, [r4]
000b6858  str     r1, [sp, #0x1c]
000b685a  str     r0, [sp, #0x18]
000b685c  str.w   r8, [sp, #0x20]
000b6860  blx     #0xddbfc ; -> objc_msgSend
000b6864  mov     r1, r5
000b6866  mov     r2, r0
000b6868  mov     r0, r6
000b686a  blx     #0xddbfc ; -> objc_msgSend
000b686e  mvn     r3, #0x80000000
000b6872  cmp     r0, r3
000b6874  bne     #0xb68d2
000b6876  ldr     r1, [pc, #0x2fc]
000b6878  ldr     r5, [r4]
000b687a  ldr     r3, [sp, #0x14]
000b687c  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000b687e  mov     r2, r8
000b6880  ldr     r4, [r1]
000b6882  ldr     r0, [sp, #0x18]
000b6884  ldr     r1, [sp, #0x1c]
000b6886  blx     #0xddbfc ; -> objc_msgSend
000b688a  mov     r1, r4
000b688c  mov     r2, r0
000b688e  mov     r0, r5
000b6890  blx     #0xddbfc ; -> objc_msgSend
000b6894  ldr     r0, [pc, #0x2e0]
000b6896  ldr     r1, [pc, #0x2e4]
000b6898  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b689a  add     r1, pc ; -> 0x000fd66c  
000b689c  ldr     r0, [r0]
000b689e  ldr     r1, [r1]
000b68a0  blx     #0xddbfc ; -> objc_msgSend
000b68a4  ldr     r1, [pc, #0x2d8]
000b68a6  mov     r2, r8
000b68a8  movs    r3, #0
000b68aa  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b68ac  ldr     r5, [r1]
000b68ae  ldr     r1, [sp, #0x1c]
000b68b0  mov     r6, r0
000b68b2  ldr     r0, [sp, #0x18]
000b68b4  blx     #0xddbfc ; -> objc_msgSend
000b68b8  ldr     r1, [sp, #0x1c]
000b68ba  mov     r2, r8
000b68bc  ldr     r3, [sp, #0x14]
000b68be  mov     r4, r0
000b68c0  ldr     r0, [sp, #0x18]
000b68c2  blx     #0xddbfc ; -> objc_msgSend
000b68c6  mov     r1, r5
000b68c8  mov     r2, r4
000b68ca  mov     r3, r0
000b68cc  mov     r0, r6
000b68ce  blx     #0xddbfc ; -> objc_msgSend
000b68d2  ldr     r1, [pc, #0x2b0]
000b68d4  ldr     r0, [pc, #0x2b0]
000b68d6  add     r1, pc ; -> 0x000fd65c  
000b68d8  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b68da  ldr     r1, [r1]
000b68dc  ldr     r0, [r0]
000b68de  str     r1, [sp, #0x24]
000b68e0  blx     #0xddbfc ; -> objc_msgSend
000b68e4  ldr     r1, [pc, #0x2a4]
000b68e6  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b68e8  ldr     r5, [r1]
000b68ea  mov     r1, r5
000b68ec  blx     #0xddbfc ; -> objc_msgSend
000b68f0  ldr     r1, [pc, #0x29c]
000b68f2  add     r1, pc ; -> 0x000fd660  
000b68f4  ldr     r1, [r1]
000b68f6  mov     r4, r0
000b68f8  ldr     r0, [pc, #0x298]
000b68fa  add     r0, pc ; -> 0x0038c0e4  mtxController
000b68fc  ldr     r0, [r0]
000b68fe  blx     #0xddbfc ; -> objc_msgSend
000b6902  vmov    s10, r4
000b6906  vcvt.f64.u32 d7, s10
000b690a  vmov    d6, r0, r1
000b690e  vcmpe.f64 d7, d6
000b6912  vmrs    apsr_nzcv, fpscr
000b6916  blt.w   #0xb6aac
000b691a  ldr     r0, [pc, #0x27c]
000b691c  mov     r1, r5
000b691e  add     r0, pc ; -> 0x0038c120  eventsOrder
000b6920  ldr     r0, [r0]
000b6922  blx     #0xddbfc ; -> objc_msgSend
000b6926  ldr.w   r1, [pc, #0x274]
000b692a  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b692c  ldr     r1, [r1]
000b692e  str     r1, [sp, #0x28]
000b6930  ldr     r1, [pc, #0x26c]
000b6932  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b6934  ldr.w   fp, [r1]
000b6938  ldr     r1, [pc, #0x268]
000b693a  add     r1, pc ; -> 0x000fd66c  
000b693c  ldr     r1, [r1]
000b693e  str     r1, [sp, #0x3c]
000b6940  ldr     r1, [pc, #0x264]
000b6942  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000b6944  ldr     r1, [r1]
000b6946  subs    r6, r0, #1
000b6948  str     r1, [sp, #0x2c]
000b694a  b       #0xb6aa4
000b694c  ldr.w   r8, [pc, #0x25c]
000b6950  mov     r2, r6
000b6952  ldr     r1, [sp, #0x28]
000b6954  add     r8, pc ; -> 0x0038c120  eventsOrder
000b6956  ldr.w   sl, [pc, #0x258]
000b695a  ldr.w   r0, [r8]
000b695e  blx     #0xddbfc ; -> objc_msgSend
000b6962  mov     r1, fp
000b6964  blx     #0xddbfc ; -> objc_msgSend
000b6968  add     sl, pc ; -> 0x0038c0e8  mtxUserInfo
000b696a  ldr     r1, [sp, #0x3c]
000b696c  mov     r5, r0
000b696e  ldr.w   r0, [sl]
000b6972  blx     #0xddbfc ; -> objc_msgSend
000b6976  mov     r3, r5
000b6978  ldr     r1, [sp, #0x1c]
000b697a  ldr     r2, [sp, #0x20]
000b697c  mov     r4, r0
000b697e  ldr     r0, [sp, #0x18]
000b6980  blx     #0xddbfc ; -> objc_msgSend
000b6984  ldr     r1, [sp, #0x2c]
000b6986  mov     r2, r0
000b6988  mov     r0, r4
000b698a  blx     #0xddbfc ; -> objc_msgSend
000b698e  mov     r1, fp
000b6990  blx     #0xddbfc ; -> objc_msgSend
000b6994  cmp     r0, #0
000b6996  mov     r4, r0
000b6998  ble     #0xb6a96
000b699a  ldr     r1, [sp, #0x24]
000b699c  ldr.w   r0, [sl]
000b69a0  blx     #0xddbfc ; -> objc_msgSend
000b69a4  ldr     r1, [pc, #0x20c]
000b69a6  ldr     r3, [pc, #0x210]
000b69a8  ldr     r2, [pc, #0x210]
000b69aa  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000b69ac  add     r3, pc ; -> 0x0038c110  sessionId
000b69ae  ldr     r1, [r1]
000b69b0  add     r2, pc ; -> 0x00180054  
000b69b2  str     r4, [sp]
000b69b4  str     r2, [sp, #0xc]
000b69b6  str     r3, [sp, #8]
000b69b8  ldr     r3, [r3]
000b69ba  str     r1, [sp, #0x34]
000b69bc  ldr     r1, [sp, #0x1c]
000b69be  str     r3, [sp, #4]
000b69c0  mov     r3, r5
000b69c2  str     r0, [sp, #0x30]
000b69c4  ldr     r0, [sp, #0x18]
000b69c6  blx     #0xddbfc ; -> objc_msgSend
000b69ca  ldr     r1, [sp, #0x34]
000b69cc  mov     r2, r0
000b69ce  ldr     r0, [sp, #0x30]
000b69d0  blx     #0xddbfc ; -> objc_msgSend
000b69d4  ldr     r1, [sp, #0x3c]
000b69d6  ldr.w   r0, [sl]
000b69da  blx     #0xddbfc ; -> objc_msgSend
000b69de  ldr     r1, [pc, #0x1e0]
000b69e0  subs    r3, r4, #1
000b69e2  ldr     r2, [sp, #0x20]
000b69e4  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b69e6  ldr     r1, [r1]
000b69e8  str     r1, [sp, #0x38]
000b69ea  ldr     r1, [sp, #0x1c]
000b69ec  mov     r5, r0
000b69ee  ldr     r0, [sp, #0x18]
000b69f0  blx     #0xddbfc ; -> objc_msgSend
000b69f4  mov     r2, r6
000b69f6  ldr     r1, [sp, #0x28]
000b69f8  mov     r4, r0
000b69fa  ldr.w   r0, [r8]
000b69fe  blx     #0xddbfc ; -> objc_msgSend
000b6a02  mov     r2, r4
000b6a04  ldr     r1, [sp, #0x38]
000b6a06  mov     r3, r0
000b6a08  mov     r0, r5
000b6a0a  blx     #0xddbfc ; -> objc_msgSend
000b6a0e  bl      #0xb6514 ; -> Z13logPurgeEventv
000b6a12  ldr     r1, [sp, #0x3c]
000b6a14  ldr.w   r0, [sl]
000b6a18  blx     #0xddbfc ; -> objc_msgSend
000b6a1c  ldr     r3, [sp, #0x14]
000b6a1e  ldr     r1, [sp, #0x1c]
000b6a20  ldr     r2, [sp, #0x20]
000b6a22  mov     r4, r0
000b6a24  ldr     r0, [sp, #0x18]
000b6a26  blx     #0xddbfc ; -> objc_msgSend
000b6a2a  ldr     r1, [sp, #0x2c]
000b6a2c  mov     r2, r0
000b6a2e  mov     r0, r4
000b6a30  blx     #0xddbfc ; -> objc_msgSend
000b6a34  mov     r1, fp
000b6a36  blx     #0xddbfc ; -> objc_msgSend
000b6a3a  ldr     r1, [sp, #0x3c]
000b6a3c  adds    r6, r0, #1
000b6a3e  ldr.w   r0, [sl]
000b6a42  blx     #0xddbfc ; -> objc_msgSend
000b6a46  ldr     r1, [sp, #0x1c]
000b6a48  ldr     r2, [sp, #0x20]
000b6a4a  mov     r3, r6
000b6a4c  mov     r5, r0
000b6a4e  ldr     r0, [sp, #0x18]
000b6a50  blx     #0xddbfc ; -> objc_msgSend
000b6a54  ldr     r1, [sp, #0x1c]
000b6a56  ldr     r2, [sp, #0x20]
000b6a58  ldr     r3, [sp, #0x14]
000b6a5a  mov     r4, r0
000b6a5c  ldr     r0, [sp, #0x18]
000b6a5e  blx     #0xddbfc ; -> objc_msgSend
000b6a62  mov     r2, r4
000b6a64  ldr     r1, [sp, #0x38]
000b6a66  mov     r3, r0
000b6a68  mov     r0, r5
000b6a6a  blx     #0xddbfc ; -> objc_msgSend
000b6a6e  ldr     r1, [sp, #0x24]
000b6a70  ldr.w   r0, [sl]
000b6a74  blx     #0xddbfc ; -> objc_msgSend
000b6a78  ldr     r2, [sp, #8]
000b6a7a  str     r6, [sp]
000b6a7c  ldr     r1, [sp, #0x1c]
000b6a7e  ldr     r3, [r2]
000b6a80  ldr     r2, [sp, #0xc]
000b6a82  str     r3, [sp, #4]
000b6a84  ldr     r3, [sp, #0x14]
000b6a86  mov     r4, r0
000b6a88  ldr     r0, [sp, #0x18]
000b6a8a  blx     #0xddbfc ; -> objc_msgSend
000b6a8e  ldr     r1, [sp, #0x38]
000b6a90  mov     r3, r0
000b6a92  mov     r0, r4
000b6a94  b       #0xb6b50
000b6a96  ldr     r3, [sp, #0x14]
000b6a98  cmp     r3, r5
000b6a9a  bne     #0xb6aa2
000b6a9c  bl      #0xb6514 ; -> Z13logPurgeEventv
000b6aa0  b       #0xb6b56
000b6aa2  subs    r6, #1
000b6aa4  cmp     r6, #0
000b6aa6  bge.w   #0xb694c
000b6aaa  b       #0xb6b56
000b6aac  ldr     r1, [pc, #0x114]
000b6aae  ldr.w   r6, [pc, #0x118]
000b6ab2  add     r1, pc ; -> 0x000fd66c  
000b6ab4  add     r6, pc ; -> 0x0038c0e8  mtxUserInfo
000b6ab6  ldr.w   sl, [r1]
000b6aba  ldr     r0, [r6]
000b6abc  mov     r1, sl
000b6abe  blx     #0xddbfc ; -> objc_msgSend
000b6ac2  ldr     r1, [pc, #0x108]
000b6ac4  ldr     r3, [sp, #0x14]
000b6ac6  mov     r2, r8
000b6ac8  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000b6aca  ldr     r4, [r1]
000b6acc  ldr     r1, [sp, #0x1c]
000b6ace  mov     r5, r0
000b6ad0  ldr     r0, [sp, #0x18]
000b6ad2  blx     #0xddbfc ; -> objc_msgSend
000b6ad6  mov     r1, r4
000b6ad8  mov     r2, r0
000b6ada  mov     r0, r5
000b6adc  blx     #0xddbfc ; -> objc_msgSend
000b6ae0  ldr     r1, [pc, #0xec]
000b6ae2  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000b6ae4  ldr     r1, [r1]
000b6ae6  blx     #0xddbfc ; -> objc_msgSend
000b6aea  mov     r1, sl
000b6aec  add.w   fp, r0, #1
000b6af0  ldr     r0, [r6]
000b6af2  blx     #0xddbfc ; -> objc_msgSend
000b6af6  ldr     r1, [pc, #0xdc]
000b6af8  mov     r2, r8
000b6afa  mov     r3, fp
000b6afc  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b6afe  ldr.w   sl, [r1]
000b6b02  ldr     r1, [sp, #0x1c]
000b6b04  mov     r5, r0
000b6b06  ldr     r0, [sp, #0x18]
000b6b08  blx     #0xddbfc ; -> objc_msgSend
000b6b0c  ldr     r1, [sp, #0x1c]
000b6b0e  mov     r2, r8
000b6b10  ldr     r3, [sp, #0x14]
000b6b12  mov     r4, r0
000b6b14  ldr     r0, [sp, #0x18]
000b6b16  blx     #0xddbfc ; -> objc_msgSend
000b6b1a  mov     r2, r4
000b6b1c  mov     r1, sl
000b6b1e  mov     r3, r0
000b6b20  mov     r0, r5
000b6b22  blx     #0xddbfc ; -> objc_msgSend
000b6b26  ldr     r1, [sp, #0x24]
000b6b28  ldr     r0, [r6]
000b6b2a  blx     #0xddbfc ; -> objc_msgSend
000b6b2e  ldr     r3, [pc, #0xa8]
000b6b30  str.w   fp, [sp]
000b6b34  ldr     r2, [pc, #0xa4]
000b6b36  add     r3, pc ; -> 0x0038c110  sessionId
000b6b38  ldr     r1, [sp, #0x1c]
000b6b3a  ldr     r3, [r3]
000b6b3c  add     r2, pc ; -> 0x00180054  
000b6b3e  str     r3, [sp, #4]
000b6b40  ldr     r3, [sp, #0x14]
000b6b42  mov     r4, r0
000b6b44  ldr     r0, [sp, #0x18]
000b6b46  blx     #0xddbfc ; -> objc_msgSend
000b6b4a  mov     r1, sl
000b6b4c  mov     r3, r0
000b6b4e  mov     r0, r4
000b6b50  ldr     r2, [sp, #0x10]
000b6b52  blx     #0xddbfc ; -> objc_msgSend
000b6b56  sub.w   sp, r7, #0x18
000b6b5a  pop.w   {r8, sl, fp}
000b6b5e  pop     {r4, r5, r6, r7, pc}
000b6b60  ldr     r2, [r4, #0x68]
000b6b62  movs    r4, r0
000b6b64  strb    r4, [r2, #0xc]
000b6b66  movs    r4, r0
000b6b68  ldrb    r2, [r6, #0x15]
000b6b6a  movs    r4, r1
000b6b6c  str     r4, [r2, #0x24]
000b6b6e  movs    r4, r0
000b6b70  ldr     r4, [r1, r3]
000b6b72  movs    r5, r5
000b6b74  str     r4, [r0, #0x20]
000b6b76  movs    r4, r0
000b6b78  ldr     r4, [r1, r1]
000b6b7a  movs    r5, r5
000b6b7c  ldr     r6, [r1, #0x5c]
000b6b7e  movs    r4, r0
000b6b80  str     r2, [r5, #0x20]
000b6b82  movs    r4, r0
000b6b84  ldr     r2, [r0, #0x58]
000b6b86  movs    r4, r0
000b6b88  ldr     r4, [r1, r0]
000b6b8a  movs    r5, r5
000b6b8c  str     r6, [r2, #0x18]
000b6b8e  movs    r4, r0
000b6b90  ldr     r2, [r5, #0x54]
000b6b92  movs    r4, r0
000b6b94  ldrsb   r6, [r4, r7]
000b6b96  movs    r5, r5
000b6b98  ldrsb   r6, [r7, r7]
000b6b9a  movs    r5, r5
000b6b9c  str     r6, [r1, #0x14]
000b6b9e  movs    r4, r0
000b6ba0  str     r2, [r6, #0x18]
000b6ba2  movs    r4, r0
000b6ba4  ldr     r6, [r5, #0x50]
000b6ba6  movs    r4, r0
000b6ba8  str     r6, [r1, #0x18]
000b6baa  movs    r4, r0
000b6bac  ldrsb   r0, [r1, r7]
000b6bae  movs    r5, r5
000b6bb0  ldrsb   r4, [r7, r5]
000b6bb2  movs    r5, r5
000b6bb4  str     r6, [r1, #0x54]
000b6bb6  movs    r4, r0
000b6bb8  ldrsb   r0, [r4, r5]
000b6bba  movs    r5, r5
000b6bbc  str     r6, [sp, #0x280]
000b6bbe  movs    r4, r1
000b6bc0  str     r0, [r6, #0xc]
000b6bc2  movs    r4, r0
000b6bc4  ldr     r6, [r6, #0x38]
000b6bc6  movs    r4, r0
000b6bc8  ldrsb   r0, [r6, r0]
000b6bca  movs    r5, r5
000b6bcc  str     r0, [r1]
000b6bce  movs    r4, r0
000b6bd0  str     r2, [r0]
000b6bd2  movs    r4, r0
000b6bd4  ldrsh   r0, [r3, r7]
000b6bd6  movs    r4, r0
000b6bd8  strb    r6, [r2, r7]
000b6bda  movs    r5, r5
000b6bdc  str     r5, [sp, #0x50]
000b6bde  movs    r4, r1
