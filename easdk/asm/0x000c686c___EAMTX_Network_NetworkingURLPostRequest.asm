========================================================================
-[EAMTX_Network NetworkingURLPostRequest  0x000c686c  784 bytes   EAMTX_Network.mm
========================================================================

000c686c  push    {r4, r5, r6, r7, lr}
000c686e  add     r7, sp, #0xc
000c6870  push.w  {r8, sl, fp}
000c6874  sub     sp, #0x8c
000c6876  ldr     r1, [pc, #0x264]
000c6878  str     r0, [sp, #0x10]
000c687a  mov     r6, r2
000c687c  add     r1, pc ; -> 0x000fcd20  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a8
000c687e  mov     r0, r2
000c6880  ldr     r1, [r1]
000c6882  movs    r2, #4
000c6884  str     r3, [sp, #0xc]
000c6886  blx     #0xddbfc ; -> objc_msgSend
000c688a  ldr     r1, [pc, #0x254]
000c688c  add     r1, pc ; -> 0x000fce34  
000c688e  ldr     r4, [r1]
000c6890  ldr     r1, [pc, #0x250]
000c6892  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000c6894  ldr     r1, [r1]
000c6896  mov     r2, r0
000c6898  ldr     r0, [pc, #0x24c]
000c689a  add     r0, pc ; -> 0x000fdbe4  
000c689c  ldr     r5, [r0]
000c689e  ldr     r0, [pc, #0x24c]
000c68a0  add     r0, pc ; -> 0x000fdb64  
000c68a2  ldr     r0, [r0]
000c68a4  blx     #0xddbfc ; -> objc_msgSend
000c68a8  ldr     r1, [pc, #0x244]
000c68aa  movs    r3, #0
000c68ac  mov     r2, r0
000c68ae  movs    r0, #0
000c68b0  stm.w   sp, {r0, r1}
000c68b4  mov     r1, r4
000c68b6  mov     r0, r5
000c68b8  blx     #0xddbfc ; -> objc_msgSend
000c68bc  ldr     r1, [pc, #0x234]
000c68be  ldr     r2, [pc, #0x238]
000c68c0  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
000c68c2  add     r2, pc ; -> 0x0017e7a4  
000c68c4  ldr     r1, [r1]
000c68c6  str     r0, [sp, #0x14]
000c68c8  blx     #0xddbfc ; -> objc_msgSend
000c68cc  ldr     r0, [pc, #0x22c]
000c68ce  add     r0, pc ; -> 0x00181b64  
000c68d0  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c68d4  ldr     r1, [pc, #0x228]
000c68d6  ldr     r0, [pc, #0x22c]
000c68d8  ldr     r3, [pc, #0x22c]
000c68da  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c68dc  add     r0, pc ; -> 0x000fdb5c  
000c68de  ldr     r1, [r1]
000c68e0  add     r3, pc ; -> 0x000f7d8c  OBJC_IVAR_$_EAMTX_Network.requestId
000c68e2  ldr.w   fp, [r0]
000c68e6  ldr     r3, [r3]
000c68e8  str     r1, [sp, #0x18]
000c68ea  ldr     r1, [sp, #0x10]
000c68ec  ldr     r2, [pc, #0x21c]
000c68ee  mov     r0, fp
000c68f0  ldr     r3, [r1, r3]
000c68f2  add     r2, pc ; -> 0x00181064  
000c68f4  ldr     r1, [sp, #0x18]
000c68f6  blx     #0xddbfc ; -> objc_msgSend
000c68fa  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c68fe  ldr     r2, [pc, #0x210]
000c6900  ldr     r1, [sp, #0x18]
000c6902  mov     r3, r6
000c6904  add     r2, pc ; -> 0x00181b74  
000c6906  mov     r0, fp
000c6908  blx     #0xddbfc ; -> objc_msgSend
000c690c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6910  ldr     r0, [pc, #0x200]
000c6912  add     r0, pc ; -> 0x00181b84  
000c6914  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6918  ldr     r0, [pc, #0x1fc]
000c691a  add     r0, pc ; -> 0x00181b94  
000c691c  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6920  ldr     r2, [sp, #0xac]
000c6922  cmp     r2, #0
000c6924  beq     #0xc69fa
000c6926  ldr     r1, [pc, #0x1f4]
000c6928  mov     r0, r2
000c692a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000c692c  ldr     r1, [r1]
000c692e  blx     #0xddbfc ; -> objc_msgSend
000c6932  cmp     r0, #0
000c6934  beq     #0xc69fa
000c6936  ldr     r1, [pc, #0x1e8]
000c6938  ldr     r0, [sp, #0xac]
000c693a  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000c693c  ldr     r1, [r1]
000c693e  blx     #0xddbfc ; -> objc_msgSend
000c6942  ldr     r1, [pc, #0x1e0]
000c6944  movs    r3, #0
000c6946  add     r2, sp, #0x6c
000c6948  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000c694a  str     r3, [sp, #0x6c]
000c694c  ldr     r1, [r1]
000c694e  str     r3, [sp, #0x70]
000c6950  str     r3, [sp, #0x74]
000c6952  str     r3, [sp, #0x78]
000c6954  str     r3, [sp, #0x7c]
000c6956  str     r3, [sp, #0x80]
000c6958  str     r3, [sp, #0x84]
000c695a  str     r3, [sp, #0x88]
000c695c  adds    r3, #0x10
000c695e  str     r3, [sp]
000c6960  add     r3, sp, #0x2c
000c6962  str     r1, [sp, #0x1c]
000c6964  str     r0, [sp, #0x24]
000c6966  blx     #0xddbfc ; -> objc_msgSend
000c696a  cmp     r0, #0
000c696c  beq     #0xc69fa
000c696e  ldr     r3, [sp, #0x74]
000c6970  ldr     r2, [pc, #0x1b4]
000c6972  mov     sl, r0
000c6974  ldr     r1, [r3]
000c6976  str     r2, [sp, #8]
000c6978  str     r1, [sp, #0x28]
000c697a  ldr     r1, [pc, #0x1b0]
000c697c  add     r1, pc ; -> 0x000fcbdc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x264
000c697e  ldr     r1, [r1]
000c6980  str     r1, [sp, #0x20]
000c6982  ldr     r1, [pc, #0x1ac]
000c6984  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000c6986  ldr.w   r8, [r1]
000c698a  b       #0xc698e
000c698c  ldr     r3, [sp, #0x74]
000c698e  movs    r6, #0
000c6990  b       #0xc6994
000c6992  ldr     r3, [sp, #0x74]
000c6994  ldr     r3, [r3]
000c6996  ldr     r0, [sp, #0x28]
000c6998  cmp     r3, r0
000c699a  beq     #0xc69a2
000c699c  ldr     r0, [sp, #0x24]
000c699e  blx     #0xddbe4 ; -> objc_enumerationMutation
000c69a2  ldr     r2, [sp, #0x70]
000c69a4  mov     r1, r8
000c69a6  ldr     r0, [sp, #0xac]
000c69a8  ldr.w   r4, [r2, r6, lsl #2]
000c69ac  adds    r6, #1
000c69ae  mov     r2, r4
000c69b0  blx     #0xddbfc ; -> objc_msgSend
000c69b4  mov     r3, r4
000c69b6  ldr     r1, [sp, #0x20]
000c69b8  mov     r2, r0
000c69ba  ldr     r0, [sp, #0x14]
000c69bc  blx     #0xddbfc ; -> objc_msgSend
000c69c0  mov     r1, r8
000c69c2  mov     r2, r4
000c69c4  ldr     r0, [sp, #0xac]
000c69c6  ldr     r5, [sp, #8]
000c69c8  blx     #0xddbfc ; -> objc_msgSend
000c69cc  ldr     r1, [sp, #0x18]
000c69ce  add     r5, pc
000c69d0  mov     r3, r4
000c69d2  mov     r2, r5
000c69d4  str     r0, [sp]
000c69d6  mov     r0, fp
000c69d8  blx     #0xddbfc ; -> objc_msgSend
000c69dc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c69e0  cmp     sl, r6
000c69e2  bhi     #0xc6992
000c69e4  movs    r3, #0x10
000c69e6  ldr     r0, [sp, #0x24]
000c69e8  str     r3, [sp]
000c69ea  ldr     r1, [sp, #0x1c]
000c69ec  add     r2, sp, #0x6c
000c69ee  add     r3, sp, #0x2c
000c69f0  blx     #0xddbfc ; -> objc_msgSend
000c69f4  mov     sl, r0
000c69f6  cmp     r0, #0
000c69f8  bne     #0xc698c
000c69fa  ldr     r1, [pc, #0x138]
000c69fc  ldr     r2, [sp, #0xc]
000c69fe  ldr     r0, [sp, #0x14]
000c6a00  add     r1, pc ; -> 0x000fcbd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x25c
000c6a02  ldr     r4, [pc, #0x134]
000c6a04  ldr     r1, [r1]
000c6a06  blx     #0xddbfc ; -> objc_msgSend
000c6a0a  ldr     r1, [pc, #0x130]
000c6a0c  mov     r0, fp
000c6a0e  add     r4, pc ; -> 0x00181bb4  
000c6a10  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c6a12  ldr     r6, [r1]
000c6a14  mov     r1, r6
000c6a16  blx     #0xddbfc ; -> objc_msgSend
000c6a1a  ldr     r1, [pc, #0x124]
000c6a1c  ldr     r2, [sp, #0xc]
000c6a1e  movs    r3, #4
000c6a20  add     r1, pc ; -> 0x000fcfb4  '_U\x0e'
000c6a22  ldr     r1, [r1]
000c6a24  blx     #0xddbfc ; -> objc_msgSend
000c6a28  ldr     r1, [pc, #0x118]
000c6a2a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c6a2c  ldr     r1, [r1]
000c6a2e  blx     #0xddbfc ; -> objc_msgSend
000c6a32  mov     r2, r4
000c6a34  ldr     r1, [sp, #0x18]
000c6a36  mov     r3, r0
000c6a38  mov     r0, fp
000c6a3a  blx     #0xddbfc ; -> objc_msgSend
000c6a3e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6a42  ldr     r0, [pc, #0x104]
000c6a44  add     r0, pc ; -> 0x00181bc4  
000c6a46  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c6a4a  ldr     r0, [pc, #0x100]
000c6a4c  ldr     r1, [pc, #0x100]
000c6a4e  add     r0, pc ; -> 0x000fdbb4  
000c6a50  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000c6a52  ldr     r0, [r0]
000c6a54  ldr     r1, [r1]
000c6a56  blx     #0xddbfc ; -> objc_msgSend
000c6a5a  ldr     r1, [pc, #0xf8]
000c6a5c  add     r1, pc ; -> 0x000fd7c8  'J\x05\x0f'
000c6a5e  ldr     r1, [r1]
000c6a60  mov     r2, r0
000c6a62  ldr     r0, [pc, #0xf4]
000c6a64  add     r0, pc ; -> 0x000f3270  mtxController
000c6a66  ldr     r4, [r0]
000c6a68  ldr     r0, [r4]
000c6a6a  blx     #0xddbfc ; -> objc_msgSend
000c6a6e  ldr     r1, [pc, #0xec]
000c6a70  ldr     r0, [r4]
000c6a72  movs    r2, #0
000c6a74  add     r1, pc ; -> 0x000fd7c4  '_\x05\x0f'
000c6a76  ldr     r4, [pc, #0xe8]
000c6a78  ldr     r1, [r1]
000c6a7a  blx     #0xddbfc ; -> objc_msgSend
000c6a7e  ldr     r0, [pc, #0xe4]
000c6a80  add     r4, pc ; -> 0x000f7da4  OBJC_IVAR_$_EAMTX_Network.theConnection
000c6a82  mov     r1, r6
000c6a84  add     r0, pc ; -> 0x000fdc08  
000c6a86  ldr     r5, [r4]
000c6a88  ldr     r0, [r0]
000c6a8a  blx     #0xddbfc ; -> objc_msgSend
000c6a8e  ldr     r1, [pc, #0xd8]
000c6a90  ldr     r3, [sp, #0x10]
000c6a92  ldr     r2, [sp, #0x14]
000c6a94  add     r1, pc ; -> 0x000fd7c0  'Z\t\x0f'
000c6a96  movs    r6, #1
000c6a98  ldr     r1, [r1]
000c6a9a  str     r6, [sp]
000c6a9c  blx     #0xddbfc ; -> objc_msgSend
000c6aa0  ldr     r1, [sp, #0x10]
000c6aa2  str     r0, [r1, r5]
000c6aa4  ldr     r3, [r4]
000c6aa6  ldr     r0, [r1, r3]
000c6aa8  cbz     r0, #0xc6ad0
000c6aaa  ldr     r0, [pc, #0xc0]
000c6aac  ldr     r1, [pc, #0xc0]
000c6aae  ldr     r3, [pc, #0xc4]
000c6ab0  add     r0, pc ; -> 0x000fdbbc  
000c6ab2  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000c6ab4  add     r3, pc ; -> 0x000f7d9c  OBJC_IVAR_$_EAMTX_Network.goReceivedData
000c6ab6  ldr     r1, [r1]
000c6ab8  ldr     r0, [r0]
000c6aba  ldr     r4, [r3]
000c6abc  blx     #0xddbfc ; -> objc_msgSend
000c6ac0  ldr     r1, [pc, #0xb4]
000c6ac2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000c6ac4  ldr     r1, [r1]
000c6ac6  blx     #0xddbfc ; -> objc_msgSend
000c6aca  ldr     r2, [sp, #0x10]
000c6acc  str     r0, [r2, r4]
000c6ace  mov     r0, r6
000c6ad0  sub.w   sp, r7, #0x18
000c6ad4  pop.w   {r8, sl, fp}
000c6ad8  pop     {r4, r5, r6, r7, pc}
000c6ada  nop     
000c6adc  str     r0, [r4, #0x48]
000c6ade  movs    r3, r0
000c6ae0  str     r4, [r4, #0x58]
000c6ae2  movs    r3, r0
000c6ae4  str     r2, [r3, #0x30]
000c6ae6  movs    r3, r0
000c6ae8  strb    r6, [r0, #0xd]
000c6aea  movs    r3, r0
000c6aec  strb    r0, [r0, #0xb]
000c6aee  movs    r3, r0
000c6af0  movs    r0, r0
000c6af2  eors    r4, r0
000c6af4  str     r4, [r3, #0x30]
000c6af6  movs    r3, r0
000c6af8  ldrb    r6, [r3, #0x1b]
000c6afa  movs    r3, r1
000c6afc  uxth    r2, r2
000c6afe  movs    r3, r1
000c6b00  str     r2, [r0, #0x1c]
000c6b02  movs    r3, r0
000c6b04  strb    r4, [r7, #9]
000c6b06  movs    r3, r0
000c6b08  asrs    r0, r5, #0x12
000c6b0a  movs    r3, r0
000c6b0c  adr     r7, #0x1b8
000c6b0e  movs    r3, r1
000c6b10  sxtb    r4, r5
000c6b12  movs    r3, r1
000c6b14  sxtb    r6, r5
000c6b16  movs    r3, r1
000c6b18  sxtb    r6, r6
000c6b1a  movs    r3, r1
000c6b1c  str     r2, [r2, #0x14]
000c6b1e  movs    r3, r0
000c6b20  str     r2, [r6, #0x50]
000c6b22  movs    r3, r0
000c6b24  str     r4, [r1, #4]
000c6b26  movs    r3, r0
000c6b28  cbz     r2, #0xc6b60
000c6b2a  movs    r3, r1
000c6b2c  str     r4, [r3, #0x24]
000c6b2e  movs    r3, r0
000c6b30  str     r4, [r1, #0x14]
000c6b32  movs    r3, r0
000c6b34  str     r0, [r2, #0x1c]
000c6b36  movs    r3, r0
000c6b38  cbz     r2, #0xc6b64
000c6b3a  movs    r3, r1
000c6b3c  ldrsh   r0, [r6, r5]
000c6b3e  movs    r3, r0
000c6b40  str     r0, [r2, #0x58]
000c6b42  movs    r3, r0
000c6b44  str     r2, [r5]
000c6b46  movs    r3, r0
000c6b48  cbz     r4, #0xc6b6a
000c6b4a  movs    r3, r1
000c6b4c  strb    r2, [r4, #5]
000c6b4e  movs    r3, r0
000c6b50  str     r4, [r6, #0x14]
000c6b52  movs    r3, r0
000c6b54  ldr     r0, [r5, #0x54]
000c6b56  movs    r3, r0
000c6b58  ldm     r0!, {r3}
000c6b5a  movs    r2, r0
000c6b5c  ldr     r4, [r1, #0x54]
000c6b5e  movs    r3, r0
000c6b60  asrs    r0, r4, #0xc
000c6b62  movs    r3, r0
000c6b64  strb    r0, [r0, #6]
000c6b66  movs    r3, r0
000c6b68  ldr     r0, [r5, #0x50]
000c6b6a  movs    r3, r0
000c6b6c  strb    r0, [r1, #4]
000c6b6e  movs    r3, r0
000c6b70  str     r6, [r3, #0x24]
000c6b72  movs    r3, r0
000c6b74  asrs    r4, r4, #0xb
000c6b76  movs    r3, r0
000c6b78  str     r2, [r1, #0x20]
000c6b7a  movs    r3, r0
