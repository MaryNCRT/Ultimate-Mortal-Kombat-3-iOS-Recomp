========================================================================
PrepareAndQueueRequest  0x000c2754  13536 bytes   EAMTX_Main.mm
========================================================================

000c2754  push    {r4, r5, r6, r7, lr}
000c2756  add     r7, sp, #0xc
000c2758  push.w  {r8, sl, fp}
000c275c  vpush   {d8}
000c2760  sub     sp, #0x1f8
000c2762  ldr.w   r1, [pc, #0xbd4]
000c2766  str     r0, [sp, #0x24]
000c2768  ldr.w   r0, [pc, #0xbd0]
000c276c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c276e  ldr.w   r5, [pc, #0xbd0]
000c2772  add     r0, pc ; -> 0x000fdbf4  
000c2774  ldr     r1, [r1]
000c2776  ldr     r0, [r0]
000c2778  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c277a  str     r1, [sp, #0x2c]
000c277c  str     r0, [sp, #0x28]
000c277e  blx     #0xddbfc ; -> objc_msgSend
000c2782  ldr.w   r1, [pc, #0xbc0]
000c2786  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c2788  ldr     r1, [r1]
000c278a  str     r1, [sp, #0x30]
000c278c  blx     #0xddbfc ; -> objc_msgSend
000c2790  ldr.w   r1, [pc, #0xbb4]
000c2794  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000c2796  ldr     r6, [r1]
000c2798  mov     r1, r6
000c279a  blx     #0xddbfc ; -> objc_msgSend
000c279e  ldr.w   r1, [pc, #0xbac]
000c27a2  ldr.w   r2, [pc, #0xbac]
000c27a6  add     r1, pc ; -> 0x000fd560  
000c27a8  add     r2, pc ; -> 0x0017ea14  
000c27aa  ldr     r1, [r1]
000c27ac  str     r2, [sp, #0x118]
000c27ae  str     r0, [sp, #0x34]
000c27b0  ldr     r0, [r5]
000c27b2  blx     #0xddbfc ; -> objc_msgSend
000c27b6  ldr.w   r1, [pc, #0xb9c]
000c27ba  ldr.w   r2, [pc, #0xb9c]
000c27be  add     r1, pc ; -> 0x000fcd1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3a4
000c27c0  add     r2, pc ; -> 0x0017fe54  
000c27c2  ldr     r1, [r1]
000c27c4  blx     #0xddbfc ; -> objc_msgSend
000c27c8  mov     r8, r0
000c27ca  ldr     r0, [r5]
000c27cc  cmp     r0, #0
000c27ce  beq     #0xc283e
000c27d0  ldr.w   r1, [pc, #0xb88]
000c27d4  add     r1, pc ; -> 0x000fd58c  
000c27d6  ldr     r4, [r1]
000c27d8  mov     r1, r4
000c27da  blx     #0xddbfc ; -> objc_msgSend
000c27de  cbz     r0, #0xc27f6
000c27e0  mov     r1, r4
000c27e2  ldr     r0, [r5]
000c27e4  blx     #0xddbfc ; -> objc_msgSend
000c27e8  ldr.w   r1, [pc, #0xb74]
000c27ec  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000c27ee  ldr     r1, [r1]
000c27f0  blx     #0xddbfc ; -> objc_msgSend
000c27f4  cbnz    r0, #0xc283e
000c27f6  ldr.w   r0, [pc, #0xb6c]
000c27fa  ldr.w   r1, [pc, #0xb6c]
000c27fe  add     r0, pc ; -> 0x000fdb60  
000c2800  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000c2802  ldr     r0, [r0]
000c2804  ldr     r1, [r1]
000c2806  blx     #0xddbfc ; -> objc_msgSend
000c280a  ldr.w   r1, [pc, #0xb60]
000c280e  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000c2810  ldr     r1, [r1]
000c2812  blx     #0xddbfc ; -> objc_msgSend
000c2816  ldr.w   r1, [pc, #0xb58]
000c281a  ldr.w   r2, [pc, #0xb58]
000c281e  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c2820  add     r2, pc ; -> 0x0017e354  kGraphBaseURL+0x224
000c2822  ldr     r1, [r1]
000c2824  blx     #0xddbfc ; -> objc_msgSend
000c2828  ldr.w   r1, [pc, #0xb4c]
000c282c  add     r1, pc ; -> 0x000fd574  
000c282e  ldr     r1, [r1]
000c2830  mov     r2, r0
000c2832  ldr.w   r0, [pc, #0xb48]
000c2836  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c2838  ldr     r0, [r0]
000c283a  blx     #0xddbfc ; -> objc_msgSend
000c283e  ldr.w   r1, [pc, #0xb40]
000c2842  ldr.w   r0, [pc, #0xb40]
000c2846  add     r1, pc ; -> 0x000fd55c  
000c2848  add     r0, pc ; -> 0x0038c0e4  mtxController
000c284a  ldr     r1, [r1]
000c284c  ldr     r0, [r0]
000c284e  str     r1, [sp, #0x38]
000c2850  blx     #0xddbfc ; -> objc_msgSend
000c2854  subs    r0, #1
000c2856  cmp     r0, #0x35
000c2858  bhi.w   #0xc5930
000c285c  adr     r3, #4
000c285e  add.w   r3, r3, r0, lsl #2
000c2862  mov     pc, r3
000c2864  b.w     #0xc2940
000c2868  b.w     #0xc5930
000c286c  b.w     #0xc2a86
000c2870  b.w     #0xc2b14
000c2874  b.w     #0xc5930
000c2878  b.w     #0xc29f4
000c287c  b.w     #0xc5930
000c2880  b.w     #0xc2996
000c2884  b.w     #0xc2d80
000c2888  b.w     #0xc2b8a
000c288c  b.w     #0xc2e2c
000c2890  b.w     #0xc2e4a
000c2894  b.w     #0xc2f44
000c2898  b.w     #0xc2ff2
000c289c  b.w     #0xc30ac
000c28a0  b.w     #0xc3766
000c28a4  b.w     #0xc31e4
000c28a8  b.w     #0xc36b4
000c28ac  b.w     #0xc38b6
000c28b0  b.w     #0xc37d2
000c28b4  b.w     #0xc383c
000c28b8  b.w     #0xc391e
000c28bc  b.w     #0xc328c
000c28c0  b.w     #0xc3a8c
000c28c4  b.w     #0xc3b2e
000c28c8  b.w     #0xc312c
000c28cc  b.w     #0xc3bb8
000c28d0  b.w     #0xc2b96
000c28d4  b.w     #0xc2c32
000c28d8  b.w     #0xc2cdc
000c28dc  b.w     #0xc5930
000c28e0  b.w     #0xc3c42
000c28e4  b.w     #0xc3cec
000c28e8  b.w     #0xc3e76
000c28ec  b.w     #0xc3fa2
000c28f0  b.w     #0xc414a
000c28f4  b.w     #0xc4224
000c28f8  b.w     #0xc4308
000c28fc  b.w     #0xc4434
000c2900  b.w     #0xc5930
000c2904  b.w     #0xc456e
000c2908  b.w     #0xc49f8
000c290c  b.w     #0xc4b3e
000c2910  b.w     #0xc4c7c
000c2914  b.w     #0xc4de8
000c2918  b.w     #0xc4d3c
000c291c  b.w     #0xc4f32
000c2920  b.w     #0xc4f92
000c2924  b.w     #0xc5930
000c2928  b.w     #0xc50f0
000c292c  b.w     #0xc5188
000c2930  b.w     #0xc51fa
000c2934  b.w     #0xc58c0
000c2938  b.w     #0xc52a8
000c293c  b.w     #0xc5930
000c2940  ldr.w   r2, [pc, #0xa44]
000c2944  add     r2, pc ; -> 0x0017e7a4  
000c2946  str     r2, [sp, #0x118]
000c2948  bl      #0xb607c ; -> Z13GetEventsDatav
000c294c  ldr.w   r1, [pc, #0xa3c]
000c2950  movs    r2, #4
000c2952  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
000c2954  ldr     r1, [r1]
000c2956  blx     #0xddbfc ; -> objc_msgSend
000c295a  ldr.w   r1, [pc, #0xa34]
000c295e  ldr.w   r3, [pc, #0xa34]
000c2962  ldr.w   r2, [pc, #0xa34]
000c2966  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2968  add     r3, pc ; -> 0x0038c108  trackingAddr
000c296a  add     r2, pc ; -> 0x00181084  
000c296c  ldr     r1, [r1]
000c296e  ldr     r3, [r3]
000c2970  str     r0, [sp, #0x114]
000c2972  ldr.w   r0, [pc, #0xa28]
000c2976  add     r0, pc ; -> 0x000fdb5c  
000c2978  ldr     r0, [r0]
000c297a  blx     #0xddbfc ; -> objc_msgSend
000c297e  ldr.w   r2, [pc, #0xa20]
000c2982  ldr.w   r3, [pc, #0xa20]
000c2986  ldr.w   r1, [pc, #0xa20]
000c298a  add     r2, pc ; -> 0x00181094  
000c298c  add     r3, pc ; -> 0x0017e7c4  
000c298e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c2990  str     r0, [sp, #0x110]
000c2992  b.w     #0xc51f0
000c2996  ldr.w   r1, [pc, #0xa14]
000c299a  ldr.w   r0, [pc, #0xa14]
000c299e  ldr.w   r5, [pc, #0xa14]
000c29a2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c29a4  add     r0, pc ; -> 0x000fdb5c  
000c29a6  ldr.w   sl, [r1]
000c29aa  ldr.w   r1, [pc, #0xa0c]
000c29ae  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c29b0  ldr.w   fp, [r0]
000c29b4  add     r1, pc ; -> 0x000fd5d8  
000c29b6  ldr     r0, [r5]
000c29b8  ldr     r1, [r1]
000c29ba  blx     #0xddbfc ; -> objc_msgSend
000c29be  ldr.w   r4, [pc, #0x9fc]
000c29c2  ldr.w   r2, [pc, #0x9fc]
000c29c6  mov     r1, sl
000c29c8  add     r4, pc ; -> 0x001810a4  
000c29ca  add     r2, pc ; -> 0x001810b4  
000c29cc  str     r2, [sp]
000c29ce  mov     r2, r4
000c29d0  ldr.w   r4, [pc, #0x9f0]
000c29d4  add     r4, pc ; -> 0x001810c4  
000c29d6  mov     r3, r0
000c29d8  mov     r0, fp
000c29da  blx     #0xddbfc ; -> objc_msgSend
000c29de  ldr.w   r3, [pc, #0x9e8]
000c29e2  ldr.w   r1, [pc, #0x9e8]
000c29e6  add     r3, pc ; -> 0x0038c108  trackingAddr
000c29e8  add     r1, pc ; -> 0x000fd6a4  
000c29ea  ldr     r6, [r3]
000c29ec  mov     r8, r0
000c29ee  ldr     r0, [r5]
000c29f0  b.w     #0xc3966
000c29f4  ldr.w   r0, [pc, #0x9e0]
000c29f8  ldr.w   r1, [pc, #0x9e0]
000c29fc  ldr.w   r2, [pc, #0x9e0]
000c2a00  add     r0, pc ; -> 0x000fdb5c  
000c2a02  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2a04  ldr.w   sl, [r0]
000c2a08  ldr     r6, [r1]
000c2a0a  ldr.w   r3, [pc, #0x9d8]
000c2a0e  add     r2, pc ; -> 0x001810d4  
000c2a10  mov     r0, sl
000c2a12  mov     r1, r6
000c2a14  add     r3, pc ; -> 0x001810e4  
000c2a16  blx     #0xddbfc ; -> objc_msgSend
000c2a1a  ldr.w   r3, [pc, #0x9cc]
000c2a1e  ldr.w   r4, [pc, #0x9cc]
000c2a22  add     r3, pc ; -> 0x0038c104  serverAddr
000c2a24  add     r4, pc ; -> 0x001810f4  
000c2a26  ldr.w   fp, [r3]
000c2a2a  mov     r8, r0
000c2a2c  bl      #0xbd3a8 ; -> Z18GetHardwareVersionv
000c2a30  ldr.w   r1, [pc, #0x9bc]
000c2a34  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000c2a36  ldr     r1, [r1]
000c2a38  mov     r5, r0
000c2a3a  ldr.w   r0, [pc, #0x9b8]
000c2a3e  add     r0, pc ; -> 0x000fdb60  
000c2a40  ldr     r0, [r0]
000c2a42  blx     #0xddbfc ; -> objc_msgSend
000c2a46  ldr.w   r1, [pc, #0x9b0]
000c2a4a  add     r1, pc ; -> 0x000fcaf4  'K\x1a\x0e'
000c2a4c  ldr     r1, [r1]
000c2a4e  blx     #0xddbfc ; -> objc_msgSend
000c2a52  ldr.w   r1, [pc, #0x9a8]
000c2a56  ldr.w   r2, [pc, #0x9a8]
000c2a5a  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c2a5c  add     r2, pc ; -> 0x00181104  
000c2a5e  ldr     r1, [r1]
000c2a60  blx     #0xddbfc ; -> objc_msgSend
000c2a64  ldr.w   r3, [pc, #0x99c]
000c2a68  ldr.w   r2, [pc, #0x99c]
000c2a6c  str.w   r8, [sp]
000c2a70  add     r3, pc ; -> 0x0017ff74  
000c2a72  add     r2, pc ; -> 0x0017ff54  
000c2a74  str     r5, [sp, #4]
000c2a76  str     r2, [sp, #0xc]
000c2a78  str     r3, [sp, #0x10]
000c2a7a  mov     r1, r6
000c2a7c  mov     r2, r4
000c2a7e  str     r0, [sp, #8]
000c2a80  mov     r0, sl
000c2a82  b.w     #0xc3b28
000c2a86  ldr.w   r0, [pc, #0x984]
000c2a8a  ldr.w   r1, [pc, #0x984]
000c2a8e  ldr.w   r4, [pc, #0x984]
000c2a92  add     r0, pc ; -> 0x000fdb5c  
000c2a94  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2a96  ldr.w   sl, [r0]
000c2a9a  ldr.w   r8, [r1]
000c2a9e  ldr.w   r0, [pc, #0x978]
000c2aa2  ldr.w   r1, [pc, #0x978]
000c2aa6  add     r4, pc ; -> 0x001810a4  
000c2aa8  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c2aaa  add     r1, pc ; -> 0x000fd5d8  
000c2aac  ldr     r0, [r0]
000c2aae  ldr     r1, [r1]
000c2ab0  blx     #0xddbfc ; -> objc_msgSend
000c2ab4  ldr.w   r2, [pc, #0x968]
000c2ab8  mov     r1, r8
000c2aba  add     r2, pc ; -> 0x001810b4  
000c2abc  str     r2, [sp]
000c2abe  mov     r2, r4
000c2ac0  ldr.w   r4, [pc, #0x960]
000c2ac4  add     r4, pc ; -> 0x00181114  
000c2ac6  mov     r3, r0
000c2ac8  mov     r0, sl
000c2aca  blx     #0xddbfc ; -> objc_msgSend
000c2ace  ldr.w   r1, [pc, #0x958]
000c2ad2  ldr.w   r3, [pc, #0x958]
000c2ad6  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c2ad8  add     r3, pc ; -> 0x0038c104  serverAddr
000c2ada  ldr     r1, [r1]
000c2adc  ldr     r5, [r3]
000c2ade  mov     r6, r0
000c2ae0  ldr.w   r0, [pc, #0x94c]
000c2ae4  add     r0, pc ; -> 0x000fdb50  
000c2ae6  ldr     r0, [r0]
000c2ae8  blx     #0xddbfc ; -> objc_msgSend
000c2aec  ldr.w   r1, [pc, #0x944]
000c2af0  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000c2af2  ldr     r1, [r1]
000c2af4  blx     #0xddbfc ; -> objc_msgSend
000c2af8  mov     r1, r8
000c2afa  mov     r2, r4
000c2afc  mov     r3, r5
000c2afe  str     r6, [sp]
000c2b00  str     r0, [sp, #4]
000c2b02  mov     r0, sl
000c2b04  blx     #0xddbfc ; -> objc_msgSend
000c2b08  str     r0, [sp, #0x110]
000c2b0a  movs    r2, #0
000c2b0c  str     r2, [sp, #0x120]
000c2b0e  str     r2, [sp, #0x11c]
000c2b10  b.w     #0xc595e
000c2b14  ldr.w   r0, [pc, #0x920]
000c2b18  ldr.w   r1, [pc, #0x920]
000c2b1c  ldr.w   r4, [pc, #0x920]
000c2b20  add     r0, pc ; -> 0x000fdb5c  
000c2b22  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2b24  ldr.w   sl, [r0]
000c2b28  ldr.w   r8, [r1]
000c2b2c  ldr.w   r0, [pc, #0x914]
000c2b30  ldr.w   r1, [pc, #0x914]
000c2b34  add     r4, pc ; -> 0x001810a4  
000c2b36  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c2b38  add     r1, pc ; -> 0x000fd5d8  
000c2b3a  ldr     r0, [r0]
000c2b3c  ldr     r1, [r1]
000c2b3e  blx     #0xddbfc ; -> objc_msgSend
000c2b42  ldr.w   r2, [pc, #0x908]
000c2b46  mov     r1, r8
000c2b48  add     r2, pc ; -> 0x001810b4  
000c2b4a  str     r2, [sp]
000c2b4c  mov     r2, r4
000c2b4e  ldr.w   r4, [pc, #0x900]
000c2b52  add     r4, pc ; -> 0x00181124  
000c2b54  mov     r3, r0
000c2b56  mov     r0, sl
000c2b58  blx     #0xddbfc ; -> objc_msgSend
000c2b5c  ldr.w   r1, [pc, #0x8f4]
000c2b60  ldr.w   r3, [pc, #0x8f4]
000c2b64  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c2b66  add     r3, pc ; -> 0x0038c104  serverAddr
000c2b68  ldr     r1, [r1]
000c2b6a  ldr     r5, [r3]
000c2b6c  mov     r6, r0
000c2b6e  ldr.w   r0, [pc, #0x8ec]
000c2b72  add     r0, pc ; -> 0x000fdb50  
000c2b74  ldr     r0, [r0]
000c2b76  blx     #0xddbfc ; -> objc_msgSend
000c2b7a  ldr.w   r1, [pc, #0x8e4]
000c2b7e  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000c2b80  ldr     r1, [r1]
000c2b82  blx     #0xddbfc ; -> objc_msgSend
000c2b86  b.w     #0xc5916
000c2b8a  ldr.w   r2, [pc, #0x8d8]
000c2b8e  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000c2b90  str     r2, [sp, #0x110]
000c2b92  b.w     #0xc5928
000c2b96  ldr.w   r1, [pc, #0x8d0]
000c2b9a  ldr.w   r0, [pc, #0x8d0]
000c2b9e  ldr.w   r5, [pc, #0x8d0]
000c2ba2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2ba4  add     r0, pc ; -> 0x000fdb5c  
000c2ba6  ldr     r1, [r1]
000c2ba8  ldr     r0, [r0]
000c2baa  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2bac  ldr.w   r4, [pc, #0x8c4]
000c2bb0  str     r1, [sp, #0x124]
000c2bb2  ldr.w   r1, [pc, #0x8c4]
000c2bb6  str     r0, [sp, #0x3c]
000c2bb8  ldr     r0, [r5]
000c2bba  add     r1, pc ; -> 0x000fd5d8  
000c2bbc  add     r4, pc ; -> 0x001810a4  
000c2bbe  ldr     r1, [r1]
000c2bc0  blx     #0xddbfc ; -> objc_msgSend
000c2bc4  ldr.w   r2, [pc, #0x8b4]
000c2bc8  ldr     r1, [sp, #0x124]
000c2bca  ldr.w   r8, [pc, #0x8b4]
000c2bce  add     r2, pc ; -> 0x00181134  
000c2bd0  str     r2, [sp]
000c2bd2  mov     r2, r4
000c2bd4  add     r8, pc ; -> 0x00181144  
000c2bd6  mov     r3, r0
000c2bd8  ldr     r0, [sp, #0x3c]
000c2bda  blx     #0xddbfc ; -> objc_msgSend
000c2bde  ldr.w   r1, [pc, #0x8a4]
000c2be2  ldr.w   r3, [pc, #0x8a4]
000c2be6  add     r1, pc ; -> 0x000fd6b0  
000c2be8  add     r3, pc ; -> 0x0038c104  serverAddr
000c2bea  ldr     r1, [r1]
000c2bec  ldr.w   fp, [r3]
000c2bf0  mov     sl, r0
000c2bf2  ldr     r0, [r5]
000c2bf4  blx     #0xddbfc ; -> objc_msgSend
000c2bf8  ldr.w   r1, [pc, #0x890]
000c2bfc  add     r1, pc ; -> 0x000fd6a4  
000c2bfe  ldr     r1, [r1]
000c2c00  mov     r6, r0
000c2c02  ldr     r0, [r5]
000c2c04  blx     #0xddbfc ; -> objc_msgSend
000c2c08  ldr.w   r1, [pc, #0x884]
000c2c0c  add     r1, pc ; -> 0x000fd558  
000c2c0e  ldr     r1, [r1]
000c2c10  mov     r4, r0
000c2c12  ldr     r0, [r5]
000c2c14  blx     #0xddbfc ; -> objc_msgSend
000c2c18  ldr.w   r3, [pc, #0x878]
000c2c1c  str.w   sl, [sp]
000c2c20  str     r6, [sp, #4]
000c2c22  add     r3, pc ; -> 0x0038c124  m_iBannerType
000c2c24  str     r4, [sp, #8]
000c2c26  ldr     r1, [sp, #0x124]
000c2c28  str     r0, [sp, #0xc]
000c2c2a  ldr     r3, [r3]
000c2c2c  ldr     r0, [sp, #0x3c]
000c2c2e  str     r3, [sp, #0x10]
000c2c30  b       #0xc2e22
000c2c32  ldr.w   r1, [pc, #0x864]
000c2c36  ldr.w   r0, [pc, #0x864]
000c2c3a  ldr.w   r5, [pc, #0x864]
000c2c3e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2c40  add     r0, pc ; -> 0x000fdb5c  
000c2c42  ldr     r1, [r1]
000c2c44  ldr     r0, [r0]
000c2c46  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2c48  ldr.w   r4, [pc, #0x858]
000c2c4c  str     r1, [sp, #0x128]
000c2c4e  ldr.w   r1, [pc, #0x858]
000c2c52  str     r0, [sp, #0x40]
000c2c54  ldr     r0, [r5]
000c2c56  add     r1, pc ; -> 0x000fd5d8  
000c2c58  add     r4, pc ; -> 0x001810a4  
000c2c5a  ldr     r1, [r1]
000c2c5c  blx     #0xddbfc ; -> objc_msgSend
000c2c60  ldr.w   r2, [pc, #0x848]
000c2c64  ldr     r1, [sp, #0x128]
000c2c66  ldr.w   r8, [pc, #0x848]
000c2c6a  add     r2, pc ; -> 0x00181134  
000c2c6c  str     r2, [sp]
000c2c6e  mov     r2, r4
000c2c70  add     r8, pc ; -> 0x00181154  
000c2c72  mov     r3, r0
000c2c74  ldr     r0, [sp, #0x40]
000c2c76  blx     #0xddbfc ; -> objc_msgSend
000c2c7a  ldr.w   r1, [pc, #0x838]
000c2c7e  ldr.w   r3, [pc, #0x838]
000c2c82  add     r1, pc ; -> 0x000fd6b0  
000c2c84  add     r3, pc ; -> 0x0038c104  serverAddr
000c2c86  ldr     r1, [r1]
000c2c88  ldr.w   fp, [r3]
000c2c8c  mov     sl, r0
000c2c8e  ldr     r0, [r5]
000c2c90  blx     #0xddbfc ; -> objc_msgSend
000c2c94  ldr.w   r1, [pc, #0x824]
000c2c98  add     r1, pc ; -> 0x000fd6a4  
000c2c9a  ldr     r1, [r1]
000c2c9c  mov     r6, r0
000c2c9e  ldr     r0, [r5]
000c2ca0  blx     #0xddbfc ; -> objc_msgSend
000c2ca4  ldr.w   r1, [pc, #0x818]
000c2ca8  add     r1, pc ; -> 0x000fd558  
000c2caa  ldr     r1, [r1]
000c2cac  mov     r4, r0
000c2cae  ldr     r0, [r5]
000c2cb0  blx     #0xddbfc ; -> objc_msgSend
000c2cb4  ldr.w   r3, [pc, #0x80c]
000c2cb8  str.w   sl, [sp]
000c2cbc  str     r6, [sp, #4]
000c2cbe  add     r3, pc ; -> 0x0038c12c  m_iTickerType
000c2cc0  str     r4, [sp, #8]
000c2cc2  ldr     r1, [sp, #0x128]
000c2cc4  mov     r2, r8
000c2cc6  str     r0, [sp, #0xc]
000c2cc8  ldr     r3, [r3]
000c2cca  ldr     r0, [sp, #0x40]
000c2ccc  str     r3, [sp, #0x10]
000c2cce  ldr.w   r3, [pc, #0x7f8]
000c2cd2  add     r3, pc ; -> 0x0038c130  m_iMaxTickers
000c2cd4  ldr     r3, [r3]
000c2cd6  str     r3, [sp, #0x14]
000c2cd8  mov     r3, fp
000c2cda  b       #0xc30a4
000c2cdc  ldr.w   r1, [pc, #0x7ec]
000c2ce0  ldr.w   r0, [pc, #0x7ec]
000c2ce4  ldr.w   r5, [pc, #0x7ec]
000c2ce8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2cea  add     r0, pc ; -> 0x000fdb5c  
000c2cec  ldr     r1, [r1]
000c2cee  ldr     r0, [r0]
000c2cf0  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2cf2  ldr.w   r4, [pc, #0x7e4]
000c2cf6  str     r1, [sp, #0x12c]
000c2cf8  ldr.w   r1, [pc, #0x7e0]
000c2cfc  str     r0, [sp, #0x44]
000c2cfe  ldr     r0, [r5]
000c2d00  add     r1, pc ; -> 0x000fd5d8  
000c2d02  add     r4, pc ; -> 0x001810a4  
000c2d04  ldr     r1, [r1]
000c2d06  blx     #0xddbfc ; -> objc_msgSend
000c2d0a  ldr.w   r2, [pc, #0x7d4]
000c2d0e  ldr     r1, [sp, #0x12c]
000c2d10  ldr.w   sl, [pc, #0x7d0]
000c2d14  add     r2, pc ; -> 0x00181134  
000c2d16  str     r2, [sp]
000c2d18  mov     r2, r4
000c2d1a  add     sl, pc ; -> 0x00181164  
000c2d1c  mov     r3, r0
000c2d1e  ldr     r0, [sp, #0x44]
000c2d20  blx     #0xddbfc ; -> objc_msgSend
000c2d24  ldr.w   r3, [pc, #0x7c0]
000c2d28  ldr.w   r1, [pc, #0x7c0]
000c2d2c  add     r3, pc ; -> 0x0038c104  serverAddr
000c2d2e  add     r1, pc ; -> 0x000fd6b0  
000c2d30  ldr     r3, [r3]
000c2d32  ldr     r1, [r1]
000c2d34  str     r3, [sp, #0x190]
000c2d36  mov     fp, r0
000c2d38  ldr     r0, [r5]
000c2d3a  blx     #0xddbfc ; -> objc_msgSend
000c2d3e  ldr.w   r1, [pc, #0x7b0]
000c2d42  add     r1, pc ; -> 0x000fd6a4  
000c2d44  ldr     r1, [r1]
000c2d46  mov     r6, r0
000c2d48  ldr     r0, [r5]
000c2d4a  blx     #0xddbfc ; -> objc_msgSend
000c2d4e  ldr.w   r1, [pc, #0x7a4]
000c2d52  add     r1, pc ; -> 0x000fd558  
000c2d54  ldr     r1, [r1]
000c2d56  mov     r4, r0
000c2d58  ldr     r0, [r5]
000c2d5a  blx     #0xddbfc ; -> objc_msgSend
000c2d5e  ldr.w   r3, [pc, #0x798]
000c2d62  str.w   fp, [sp]
000c2d66  str     r6, [sp, #4]
000c2d68  add     r3, pc ; -> 0x0038c134  m_iMessageType
000c2d6a  str     r4, [sp, #8]
000c2d6c  ldr     r1, [sp, #0x12c]
000c2d6e  mov     r2, sl
000c2d70  str     r0, [sp, #0xc]
000c2d72  ldr     r3, [r3]
000c2d74  ldr     r0, [sp, #0x44]
000c2d76  str.w   r8, [sp, #0x14]
000c2d7a  str     r3, [sp, #0x10]
000c2d7c  ldr     r3, [sp, #0x190]
000c2d7e  b       #0xc31de
000c2d80  ldr.w   r1, [pc, #0x778]
000c2d84  ldr.w   r0, [pc, #0x778]
000c2d88  ldr.w   r5, [pc, #0x778]
000c2d8c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2d8e  add     r0, pc ; -> 0x000fdb5c  
000c2d90  ldr     r1, [r1]
000c2d92  ldr     r0, [r0]
000c2d94  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2d96  ldr.w   r4, [pc, #0x770]
000c2d9a  str     r1, [sp, #0x130]
000c2d9c  ldr.w   r1, [pc, #0x76c]
000c2da0  str     r0, [sp, #0x48]
000c2da2  ldr     r0, [r5]
000c2da4  add     r1, pc ; -> 0x000fd5d8  
000c2da6  add     r4, pc ; -> 0x001810a4  
000c2da8  ldr     r1, [r1]
000c2daa  blx     #0xddbfc ; -> objc_msgSend
000c2dae  ldr.w   r2, [pc, #0x760]
000c2db2  ldr     r1, [sp, #0x130]
000c2db4  ldr.w   r8, [pc, #0x75c]
000c2db8  add     r2, pc ; -> 0x00181134  
000c2dba  str     r2, [sp]
000c2dbc  mov     r2, r4
000c2dbe  add     r8, pc ; -> 0x00181174  
000c2dc0  mov     r3, r0
000c2dc2  ldr     r0, [sp, #0x48]
000c2dc4  blx     #0xddbfc ; -> objc_msgSend
000c2dc8  ldr.w   r1, [pc, #0x74c]
000c2dcc  ldr.w   r3, [pc, #0x74c]
000c2dd0  add     r1, pc ; -> 0x000fd6b0  
000c2dd2  add     r3, pc ; -> 0x0038c104  serverAddr
000c2dd4  ldr     r1, [r1]
000c2dd6  ldr.w   fp, [r3]
000c2dda  str     r0, [sp, #0x4c]
000c2ddc  ldr     r0, [r5]
000c2dde  blx     #0xddbfc ; -> objc_msgSend
000c2de2  mov     sl, r0
000c2de4  ldr.w   r0, [pc, #0x738]
000c2de8  add     r0, pc ; -> 0x0038c14c  tempDevToken
000c2dea  ldr     r0, [r0]
000c2dec  bl      #0xb63dc ; -> Z12removeSpacesP8NSString
000c2df0  ldr.w   r1, [pc, #0x730]
000c2df4  add     r1, pc ; -> 0x000fd558  
000c2df6  ldr     r1, [r1]
000c2df8  mov     r6, r0
000c2dfa  ldr     r0, [r5]
000c2dfc  blx     #0xddbfc ; -> objc_msgSend
000c2e00  ldr.w   r1, [pc, #0x724]
000c2e04  add     r1, pc ; -> 0x000fd6a4  
000c2e06  ldr     r1, [r1]
000c2e08  mov     r4, r0
000c2e0a  ldr     r0, [r5]
000c2e0c  blx     #0xddbfc ; -> objc_msgSend
000c2e10  ldr     r3, [sp, #0x4c]
000c2e12  ldr     r1, [sp, #0x130]
000c2e14  str.w   sl, [sp, #4]
000c2e18  str     r6, [sp, #8]
000c2e1a  str     r3, [sp]
000c2e1c  str     r4, [sp, #0xc]
000c2e1e  str     r0, [sp, #0x10]
000c2e20  ldr     r0, [sp, #0x48]
000c2e22  mov     r2, r8
000c2e24  mov     r3, fp
000c2e26  blx     #0xddbfc ; -> objc_msgSend
000c2e2a  b       #0xc2b08
000c2e2c  ldr.w   r0, [pc, #0x6fc]
000c2e30  ldr.w   r1, [pc, #0x6fc]
000c2e34  ldr.w   r2, [pc, #0x6fc]
000c2e38  add     r0, pc ; -> 0x0038c1c4  requestParams
000c2e3a  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000c2e3c  add     r2, pc ; -> 0x001809e4  
000c2e3e  ldr     r1, [r1]
000c2e40  ldr     r0, [r0]
000c2e42  blx     #0xddbfc ; -> objc_msgSend
000c2e46  b.w     #0xc5926
000c2e4a  ldr.w   r1, [pc, #0x6ec]
000c2e4e  ldr.w   r0, [pc, #0x6ec]
000c2e52  ldr.w   r5, [pc, #0x6ec]
000c2e56  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2e58  add     r0, pc ; -> 0x000fdb5c  
000c2e5a  ldr     r1, [r1]
000c2e5c  ldr     r0, [r0]
000c2e5e  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2e60  ldr.w   r4, [pc, #0x6e0]
000c2e64  str     r1, [sp, #0x134]
000c2e66  ldr.w   r1, [pc, #0x6e0]
000c2e6a  str     r0, [sp, #0x50]
000c2e6c  ldr     r0, [r5]
000c2e6e  add     r1, pc ; -> 0x000fd5d8  
000c2e70  add     r4, pc ; -> 0x001810a4  
000c2e72  ldr     r1, [r1]
000c2e74  blx     #0xddbfc ; -> objc_msgSend
000c2e78  ldr.w   r2, [pc, #0x6d0]
000c2e7c  ldr     r1, [sp, #0x134]
000c2e7e  add     r2, pc ; -> 0x001810b4  
000c2e80  str     r2, [sp]
000c2e82  mov     r2, r4
000c2e84  mov     r3, r0
000c2e86  ldr     r0, [sp, #0x50]
000c2e88  blx     #0xddbfc ; -> objc_msgSend
000c2e8c  ldr.w   r3, [pc, #0x6c0]
000c2e90  ldr.w   r1, [pc, #0x6c0]
000c2e94  add     r3, pc ; -> 0x0038c104  serverAddr
000c2e96  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c2e98  ldr     r3, [r3]
000c2e9a  ldr     r1, [r1]
000c2e9c  str     r3, [sp, #0x194]
000c2e9e  str     r0, [sp, #0x54]
000c2ea0  ldr.w   r0, [pc, #0x6b4]
000c2ea4  add     r0, pc ; -> 0x000fdb50  
000c2ea6  ldr     r0, [r0]
000c2ea8  blx     #0xddbfc ; -> objc_msgSend
000c2eac  ldr.w   r1, [pc, #0x6ac]
000c2eb0  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000c2eb2  ldr     r1, [r1]
000c2eb4  blx     #0xddbfc ; -> objc_msgSend
000c2eb8  ldr.w   r1, [pc, #0x6a4]
000c2ebc  add     r1, pc ; -> 0x000fd554  
000c2ebe  ldr     r1, [r1]
000c2ec0  mov     fp, r0
000c2ec2  ldr     r0, [r5]
000c2ec4  blx     #0xddbfc ; -> objc_msgSend
000c2ec8  ldr.w   r1, [pc, #0x698]
000c2ecc  add     r1, pc ; -> 0x000fd550  
000c2ece  ldr     r1, [r1]
000c2ed0  mov     sl, r0
000c2ed2  ldr     r0, [r5]
000c2ed4  blx     #0xddbfc ; -> objc_msgSend
000c2ed8  ldr.w   r1, [pc, #0x68c]
000c2edc  add     r1, pc ; -> 0x000fd54c  
000c2ede  ldr     r1, [r1]
000c2ee0  mov     r8, r0
000c2ee2  ldr     r0, [r5]
000c2ee4  blx     #0xddbfc ; -> objc_msgSend
000c2ee8  ldr.w   r1, [pc, #0x680]
000c2eec  add     r1, pc ; -> 0x000fd548  
000c2eee  ldr     r1, [r1]
000c2ef0  mov     r6, r0
000c2ef2  ldr     r0, [r5]
000c2ef4  blx     #0xddbfc ; -> objc_msgSend
000c2ef8  cbz     r0, #0xc2f02
000c2efa  ldr.w   r4, [pc, #0x674]
000c2efe  add     r4, pc ; -> 0x0017ed94  
000c2f00  b       #0xc2f08
000c2f02  ldr.w   r4, [pc, #0x670]
000c2f06  add     r4, pc ; -> 0x001809c4  
000c2f08  ldr.w   r0, [pc, #0x66c]
000c2f0c  ldr.w   r1, [pc, #0x66c]
000c2f10  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000c2f12  add     r1, pc ; -> 0x000fd544  
000c2f14  ldr     r0, [r0]
000c2f16  ldr     r1, [r1]
000c2f18  blx     #0xddbfc ; -> objc_msgSend
000c2f1c  ldr     r3, [sp, #0x54]
000c2f1e  ldr.w   r2, [pc, #0x660]
000c2f22  ldr     r1, [sp, #0x134]
000c2f24  str.w   fp, [sp, #4]
000c2f28  str     r3, [sp]
000c2f2a  add     r2, pc ; -> 0x00181184  
000c2f2c  ldr     r3, [sp, #0x194]
000c2f2e  str.w   sl, [sp, #8]
000c2f32  str.w   r8, [sp, #0xc]
000c2f36  str     r6, [sp, #0x10]
000c2f38  str     r4, [sp, #0x14]
000c2f3a  str     r0, [sp, #0x18]
000c2f3c  ldr     r0, [sp, #0x50]
000c2f3e  blx     #0xddbfc ; -> objc_msgSend
000c2f42  b       #0xc2b08
000c2f44  ldr.w   r1, [pc, #0x63c]
000c2f48  ldr.w   r0, [pc, #0x63c]
000c2f4c  ldr.w   r5, [pc, #0x63c]
000c2f50  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c2f52  add     r0, pc ; -> 0x000fdb5c  
000c2f54  ldr     r1, [r1]
000c2f56  ldr     r0, [r0]
000c2f58  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c2f5a  ldr.w   r4, [pc, #0x634]
000c2f5e  str     r1, [sp, #0x138]
000c2f60  ldr.w   r1, [pc, #0x630]
000c2f64  str     r0, [sp, #0x58]
000c2f66  ldr     r0, [r5]
000c2f68  add     r1, pc ; -> 0x000fd5d8  
000c2f6a  add     r4, pc ; -> 0x001810a4  
000c2f6c  ldr     r1, [r1]
000c2f6e  blx     #0xddbfc ; -> objc_msgSend
000c2f72  ldr.w   r2, [pc, #0x624]
000c2f76  ldr     r1, [sp, #0x138]
000c2f78  ldr.w   r8, [pc, #0x620]
000c2f7c  add     r2, pc ; -> 0x001810b4  
000c2f7e  str     r2, [sp]
000c2f80  mov     r2, r4
000c2f82  add     r8, pc ; -> 0x00181194  
000c2f84  mov     r3, r0
000c2f86  ldr     r0, [sp, #0x58]
000c2f88  blx     #0xddbfc ; -> objc_msgSend
000c2f8c  ldr.w   r1, [pc, #0x610]
000c2f90  ldr.w   r3, [pc, #0x610]
000c2f94  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000c2f96  add     r3, pc ; -> 0x0038c104  serverAddr
000c2f98  ldr     r1, [r1]
000c2f9a  ldr.w   fp, [r3]
000c2f9e  mov     sl, r0
000c2fa0  ldr.w   r0, [pc, #0x604]
000c2fa4  add     r0, pc ; -> 0x000fdb50  
000c2fa6  ldr     r0, [r0]
000c2fa8  blx     #0xddbfc ; -> objc_msgSend
000c2fac  ldr.w   r1, [pc, #0x5fc]
000c2fb0  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000c2fb2  ldr     r1, [r1]
000c2fb4  blx     #0xddbfc ; -> objc_msgSend
000c2fb8  ldr.w   r1, [pc, #0x5f4]
000c2fbc  add     r1, pc ; -> 0x000fd554  
000c2fbe  ldr     r1, [r1]
000c2fc0  mov     r6, r0
000c2fc2  ldr     r0, [r5]
000c2fc4  blx     #0xddbfc ; -> objc_msgSend
000c2fc8  ldr.w   r1, [pc, #0x5e8]
000c2fcc  add     r1, pc ; -> 0x000fd550  
000c2fce  ldr     r1, [r1]
000c2fd0  mov     r4, r0
000c2fd2  ldr     r0, [r5]
000c2fd4  blx     #0xddbfc ; -> objc_msgSend
000c2fd8  ldr     r1, [sp, #0x138]
000c2fda  mov     r2, r8
000c2fdc  mov     r3, fp
000c2fde  str.w   sl, [sp]
000c2fe2  str     r6, [sp, #4]
000c2fe4  str     r4, [sp, #8]
000c2fe6  str     r0, [sp, #0xc]
000c2fe8  ldr     r0, [sp, #0x58]
000c2fea  blx     #0xddbfc ; -> objc_msgSend
000c2fee  b.w     #0xc5926
000c2ff2  ldr.w   r1, [pc, #0x5c4]
000c2ff6  ldr.w   r0, [pc, #0x5c4]
000c2ffa  ldr.w   r4, [pc, #0x5c4]
000c2ffe  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c3000  add     r0, pc ; -> 0x000fdb5c  
000c3002  ldr     r1, [r1]
000c3004  ldr     r0, [r0]
000c3006  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000c3008  ldr.w   r5, [pc, #0x5b8]
000c300c  str     r1, [sp, #0x13c]
000c300e  ldr.w   r1, [pc, #0x5b8]
000c3012  str     r0, [sp, #0x5c]
000c3014  ldr     r0, [r4]
000c3016  add     r1, pc ; -> 0x000fd5d8  
000c3018  add     r5, pc ; -> 0x001810a4  
000c301a  ldr     r1, [r1]
000c301c  blx     #0xddbfc ; -> objc_msgSend
000c3020  ldr.w   r2, [pc, #0x5a8]
000c3024  ldr     r1, [sp, #0x13c]
000c3026  ldr.w   sl, [pc, #0x5a8]
000c302a  add     r2, pc ; -> 0x001810b4  
000c302c  str     r2, [sp]
000c302e  mov     r2, r5
000c3030  add     sl, pc ; -> 0x001811a4  
000c3032  ldr.w   r5, [pc, #0x5a0]
000c3036  add     r5, pc ; -> 0x0017e764  
000c3038  mov     r3, r0
000c303a  ldr     r0, [sp, #0x5c]
000c303c  blx     #0xddbfc ; -> objc_msgSend
000c3040  ldr.w   r3, [pc, #0x594]
000c3044  ldr.w   r1, [pc, #0x594]
000c3048  add     r3, pc ; -> 0x0038c104  serverAddr
000c304a  add     r1, pc ; -> 0x000fd6a4  
000c304c  ldr     r3, [r3]
000c304e  ldr     r1, [r1]
000c3050  str     r3, [sp, #0x198]
000c3052  str     r0, [sp, #0x60]
000c3054  ldr     r0, [r4]
000c3056  blx     #0xddbfc ; -> objc_msgSend
000c305a  ldr.w   r1, [pc, #0x584]
000c305e  add     r1, pc ; -> 0x000fd558  
000c3060  ldr     r1, [r1]
000c3062  mov     fp, r0
000c3064  ldr     r0, [r4]
000c3066  blx     #0xddbfc ; -> objc_msgSend
000c306a  ldr.w   r1, [pc, #0x578]
000c306e  add     r1, pc ; -> 0x000fd58c  
000c3070  ldr     r1, [r1]
000c3072  mov     r8, r0
000c3074  ldr     r0, [r4]
000c3076  blx     #0xddbfc ; -> objc_msgSend
000c307a  ldr.w   r1, [pc, #0x56c]
000c307e  add     r1, pc ; -> 0x000fd6b0  
000c3080  ldr     r1, [r1]
000c3082  mov     r6, r0
000c3084  ldr     r0, [r4]
000c3086  blx     #0xddbfc ; -> objc_msgSend
000c308a  ldr     r2, [sp, #0x60]
000c308c  ldr     r1, [sp, #0x13c]
000c308e  ldr     r3, [sp, #0x198]
000c3090  str.w   fp, [sp, #4]
000c3094  str     r2, [sp]
000c3096  mov     r2, sl
000c3098  str.w   r8, [sp, #8]
000c309c  str     r5, [sp, #0xc]
000c309e  str     r6, [sp, #0x10]
000c30a0  str     r0, [sp, #0x14]
000c30a2  ldr     r0, [sp, #0x5c]
000c30a4  blx     #0xddbfc ; -> objc_msgSend
000c30a8  b.w     #0xc5926
000c30ac  ldr.w   r1, [pc, #0x53c]
000c30b0  ldr.w   r0, [pc, #0x53c]
000c30b4  ldr.w   r5, [pc, #0x53c]
000c30b8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c30ba  add     r0, pc ; -> 0x000fdb5c  
000c30bc  ldr.w   fp, [r1]
000c30c0  ldr.w   r1, [pc, #0x534]
000c30c4  ldr     r0, [r0]
000c30c6  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c30c8  add     r1, pc ; -> 0x000fd5d8  
000c30ca  ldr.w   r4, [pc, #0x530]
000c30ce  str     r0, [sp, #0x64]
000c30d0  ldr     r1, [r1]
000c30d2  ldr     r0, [r5]
000c30d4  blx     #0xddbfc ; -> objc_msgSend
000c30d8  ldr.w   r2, [pc, #0x524]
000c30dc  add     r4, pc ; -> 0x001810a4  
000c30de  mov     r1, fp
000c30e0  add     r2, pc ; -> 0x001810b4  
000c30e2  str     r2, [sp]
000c30e4  mov     r2, r4
000c30e6  ldr.w   r6, [pc, #0x51c]
000c30ea  add     r6, pc ; -> 0x001811b4  
000c30ec  mov     r3, r0
000c30ee  ldr     r0, [sp, #0x64]
000c30f0  blx     #0xddbfc ; -> objc_msgSend
000c30f4  ldr.w   r1, [pc, #0x510]
000c30f8  ldr.w   r3, [pc, #0x510]
000c30fc  add     r1, pc ; -> 0x000fd6a4  
000c30fe  add     r3, pc ; -> 0x0038c104  serverAddr
000c3100  ldr     r1, [r1]
000c3102  ldr.w   sl, [r3]
000c3106  mov     r8, r0
000c3108  ldr     r0, [r5]
000c310a  blx     #0xddbfc ; -> objc_msgSend
000c310e  ldr.w   r1, [pc, #0x500]
000c3112  add     r1, pc ; -> 0x000fd6b0  
000c3114  ldr     r1, [r1]
000c3116  mov     r4, r0
000c3118  ldr     r0, [r5]
000c311a  blx     #0xddbfc ; -> objc_msgSend
000c311e  str.w   r8, [sp]
000c3122  str     r4, [sp, #4]
000c3124  str     r0, [sp, #8]
000c3126  ldr     r0, [sp, #0x64]
000c3128  b.w     #0xc3baa
000c312c  ldr.w   r1, [pc, #0x4e4]
000c3130  ldr.w   r0, [pc, #0x4e4]
000c3134  ldr.w   r4, [pc, #0x4e4]
000c3138  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c313a  add     r0, pc ; -> 0x000fdb5c  
000c313c  ldr     r1, [r1]
000c313e  ldr     r0, [r0]
000c3140  add     r4, pc ; -> 0x0038c0e8  mtxUserInfo
000c3142  ldr.w   r5, [pc, #0x4dc]
000c3146  str     r1, [sp, #0x140]
000c3148  ldr.w   r1, [pc, #0x4d8]
000c314c  str     r0, [sp, #0x68]
000c314e  ldr     r0, [r4]
000c3150  add     r1, pc ; -> 0x000fd5d8  
000c3152  add     r5, pc ; -> 0x001810a4  
000c3154  ldr     r1, [r1]
000c3156  blx     #0xddbfc ; -> objc_msgSend
000c315a  ldr.w   r2, [pc, #0x4cc]
000c315e  ldr     r1, [sp, #0x140]
000c3160  ldr.w   sl, [pc, #0x4c8]
000c3164  add     r2, pc ; -> 0x001810b4  
000c3166  str     r2, [sp]
000c3168  mov     r2, r5
000c316a  add     sl, pc ; -> 0x001811c4  
000c316c  ldr.w   r5, [pc, #0x4c0]
000c3170  add     r5, pc ; -> 0x0017e764  
000c3172  mov     r3, r0
000c3174  ldr     r0, [sp, #0x68]
000c3176  blx     #0xddbfc ; -> objc_msgSend
000c317a  ldr.w   r3, [pc, #0x4b8]
000c317e  ldr.w   r1, [pc, #0x4b8]
000c3182  add     r3, pc ; -> 0x0038c104  serverAddr
000c3184  add     r1, pc ; -> 0x000fd6a4  
000c3186  ldr     r3, [r3]
000c3188  ldr     r1, [r1]
000c318a  str     r3, [sp, #0x19c]
000c318c  str     r0, [sp, #0x6c]
000c318e  ldr     r0, [r4]
000c3190  blx     #0xddbfc ; -> objc_msgSend
000c3194  ldr.w   r1, [pc, #0x4a4]
000c3198  add     r1, pc ; -> 0x000fd558  
000c319a  ldr     r1, [r1]
000c319c  mov     fp, r0
000c319e  ldr     r0, [r4]
000c31a0  blx     #0xddbfc ; -> objc_msgSend
000c31a4  ldr.w   r1, [pc, #0x498]
000c31a8  add     r1, pc ; -> 0x000fd58c  
000c31aa  ldr     r1, [r1]
000c31ac  mov     r8, r0
000c31ae  ldr     r0, [r4]
000c31b0  blx     #0xddbfc ; -> objc_msgSend
000c31b4  ldr.w   r1, [pc, #0x48c]
000c31b8  add     r1, pc ; -> 0x000fd6b0  
000c31ba  ldr     r1, [r1]
000c31bc  mov     r6, r0
000c31be  ldr     r0, [r4]
000c31c0  blx     #0xddbfc ; -> objc_msgSend
000c31c4  ldr     r3, [sp, #0x6c]
000c31c6  ldr     r1, [sp, #0x140]
000c31c8  mov     r2, sl
000c31ca  str.w   fp, [sp, #4]
000c31ce  str     r3, [sp]
000c31d0  ldr     r3, [sp, #0x19c]
000c31d2  str.w   r8, [sp, #8]
000c31d6  str     r5, [sp, #0xc]
000c31d8  str     r6, [sp, #0x10]
000c31da  str     r0, [sp, #0x14]
000c31dc  ldr     r0, [sp, #0x68]
000c31de  blx     #0xddbfc ; -> objc_msgSend
000c31e2  b       #0xc2b08
000c31e4  ldr.w   r1, [pc, #0x460]
000c31e8  ldr.w   r0, [pc, #0x460]
000c31ec  ldr.w   r5, [pc, #0x460]
000c31f0  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c31f2  add     r0, pc ; -> 0x000fdb5c  
000c31f4  ldr     r1, [r1]
000c31f6  ldr     r0, [r0]
000c31f8  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c31fa  ldr.w   r4, [pc, #0x458]
000c31fe  str     r1, [sp, #0x144]
000c3200  ldr.w   r1, [pc, #0x454]
000c3204  str     r0, [sp, #0x70]
000c3206  ldr     r0, [r5]
000c3208  add     r1, pc ; -> 0x000fd5d8  
000c320a  add     r4, pc ; -> 0x001810a4  
000c320c  ldr     r1, [r1]
000c320e  blx     #0xddbfc ; -> objc_msgSend
000c3212  ldr.w   r2, [pc, #0x448]
000c3216  ldr     r1, [sp, #0x144]
000c3218  ldr.w   r8, [pc, #0x444]
000c321c  add     r2, pc ; -> 0x001810e4  
000c321e  str     r2, [sp]
000c3220  mov     r2, r4
000c3222  add     r8, pc ; -> 0x001811d4  
000c3224  mov     r3, r0
000c3226  ldr     r0, [sp, #0x70]
000c3228  blx     #0xddbfc ; -> objc_msgSend
000c322c  ldr.w   r3, [pc, #0x434]
000c3230  ldr.w   r1, [pc, #0x434]
000c3234  add     r3, pc ; -> 0x0038c104  serverAddr
000c3236  add     r1, pc ; -> 0x000fd6b0  
000c3238  ldr     r3, [r3]
000c323a  ldr     r1, [r1]
000c323c  str     r3, [sp, #0x1a0]
000c323e  mov     fp, r0
000c3240  ldr     r0, [r5]
000c3242  blx     #0xddbfc ; -> objc_msgSend
000c3246  ldr.w   r1, [pc, #0x424]
000c324a  add     r1, pc ; -> 0x000fd558  
000c324c  ldr     r1, [r1]
000c324e  mov     sl, r0
000c3250  ldr     r0, [r5]
000c3252  blx     #0xddbfc ; -> objc_msgSend
000c3256  ldr.w   r1, [pc, #0x418]
000c325a  ldr.w   r3, [pc, #0x418]
000c325e  add     r1, pc ; -> 0x000fd58c  
000c3260  add     r3, pc ; -> 0x0038c168  iItemSellId
000c3262  ldr     r1, [r1]
000c3264  ldr     r4, [r3]
000c3266  mov     r6, r0
000c3268  ldr     r0, [r5]
000c326a  blx     #0xddbfc ; -> objc_msgSend
000c326e  ldr     r1, [sp, #0x144]
000c3270  ldr     r3, [sp, #0x1a0]
000c3272  mov     r2, r8
000c3274  str.w   fp, [sp]
000c3278  str.w   sl, [sp, #4]
000c327c  str     r6, [sp, #8]
000c327e  str     r4, [sp, #0xc]
000c3280  str     r0, [sp, #0x10]
000c3282  ldr     r0, [sp, #0x70]
000c3284  blx     #0xddbfc ; -> objc_msgSend
000c3288  b.w     #0xc5926
000c328c  ldr     r1, [pc, #0x3e8]
000c328e  ldr     r0, [pc, #0x3ec]
000c3290  ldr     r5, [pc, #0x3ec]
000c3292  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c3294  add     r0, pc ; -> 0x000fdb5c  
000c3296  ldr     r1, [r1]
000c3298  ldr     r0, [r0]
000c329a  add     r5, pc ; -> 0x0038c0e8  mtxUserInfo
000c329c  ldr     r4, [pc, #0x3e4]
000c329e  str     r1, [sp, #0x148]
000c32a0  ldr     r1, [pc, #0x3e4]
000c32a2  str     r0, [sp, #0x74]
000c32a4  ldr     r0, [r5]
000c32a6  add     r1, pc ; -> 0x000fd5d8  
000c32a8  add     r4, pc ; -> 0x001810a4  
000c32aa  ldr     r1, [r1]
000c32ac  blx     #0xddbfc ; -> objc_msgSend
000c32b0  ldr     r2, [pc, #0x3d8]
000c32b2  ldr     r1, [sp, #0x148]
000c32b4  ldr.w   fp, [pc, #0x3d8]
000c32b8  add     r2, pc ; -> 0x001810b4  
000c32ba  str     r2, [sp]
000c32bc  mov     r2, r4
000c32be  add     fp, pc ; -> 0x001811e4  
000c32c0  mov     r3, r0
000c32c2  ldr     r0, [sp, #0x74]
000c32c4  blx     #0xddbfc ; -> objc_msgSend
000c32c8  ldr     r3, [pc, #0x3c8]
000c32ca  ldr     r1, [pc, #0x3cc]
000c32cc  add     r3, pc ; -> 0x0038c104  serverAddr
000c32ce  add     r1, pc ; -> 0x000fd6b0  
000c32d0  ldr     r3, [r3]
000c32d2  ldr     r1, [r1]
000c32d4  str     r3, [sp, #0x1a4]
000c32d6  str     r0, [sp, #0x78]
000c32d8  ldr     r0, [r5]
000c32da  blx     #0xddbfc ; -> objc_msgSend
000c32de  ldr     r3, [pc, #0x3bc]
000c32e0  ldr     r1, [pc, #0x3bc]
000c32e2  vldr    d7, [pc, #0xec]
000c32e6  add     r3, pc ; -> 0x0038c168  iItemSellId
000c32e8  add     r1, pc ; -> 0x000fd6a4  
000c32ea  ldr.w   r8, [r3]
000c32ee  ldr     r3, [pc, #0x3b4]
000c32f0  ldr     r1, [r1]
000c32f2  add     r3, pc ; -> 0x0038c16c  transId
000c32f4  ldr     r6, [r3]
000c32f6  ldr     r3, [pc, #0x3b0]
000c32f8  add     r3, pc ; -> 0x0038c170  receipt
000c32fa  ldr     r4, [r3]
000c32fc  ldr     r3, [pc, #0x3ac]
000c32fe  add     r3, pc ; -> 0x0038c178  iItemPrice
000c3300  vldr    d6, [r3]
000c3304  vmul.f64 d8, d6, d7
000c3308  mov     sl, r0
000c330a  ldr     r0, [r5]
000c330c  blx     #0xddbfc ; -> objc_msgSend
000c3310  ldr     r3, [pc, #0x39c]
000c3312  ldr     r2, [sp, #0x78]
000c3314  str.w   sl, [sp, #4]
000c3318  add     r3, pc ; -> 0x0038c174  currency
000c331a  str.w   r8, [sp, #8]
000c331e  str     r2, [sp]
000c3320  str     r6, [sp, #0xc]
000c3322  str     r4, [sp, #0x10]
000c3324  vstr    d8, [sp, #0x14]
000c3328  ldr     r1, [sp, #0x148]
000c332a  mov     r2, fp
000c332c  str     r0, [sp, #0x1c]
000c332e  ldr     r3, [r3]
000c3330  ldr     r0, [sp, #0x74]
000c3332  str     r3, [sp, #0x20]
000c3334  ldr     r3, [sp, #0x1a4]
000c3336  b       #0xc375e
000c3338  adr     r2, #0x50
000c333a  movs    r3, r0
000c333c  push    {r1, r2, r3, r4, r5, r6}
000c333e  movs    r3, r0
000c3340  ldr     r1, [sp, #0x1b0]
000c3342  movs    r4, r5
000c3344  adr     r1, #0x3d8
000c3346  movs    r3, r0
000c3348  adr     r2, #0x300
000c334a  movs    r3, r0
000c334c  add     r5, sp, #0x2d8
000c334e  movs    r3, r0
000c3350  stm     r2!, {r3, r5, r6}
000c3352  movs    r3, r1
000c3354  adr     r5, #0x168
000c3356  movs    r3, r0
000c3358  bvs     #0xc327c
000c335a  movs    r3, r1
000c335c  add     r5, sp, #0x2d0
000c335e  movs    r3, r0
000c3360  adr     r2, #0x220
000c3362  movs    r3, r0
000c3364  cbz     r6, #0xc33be
000c3366  movs    r3, r0
000c3368  adr     r2, #0x60
000c336a  movs    r3, r0
000c336c  adr     r2, #0x388
000c336e  movs    r3, r0
000c3370  adr     r2, #0x338
000c3372  movs    r3, r0
000c3374  cbnz    r0, #0xc33c4
000c3376  movs    r3, r1
000c3378  add     r5, sp, #0x110
000c337a  movs    r3, r0
000c337c  ldr     r0, [sp, #0x2b8]
000c337e  movs    r4, r5
000c3380  add     r5, sp, #0x48
000c3382  movs    r3, r0
000c3384  ldr     r0, [sp, #0x260]
000c3386  movs    r4, r5
000c3388  bkpt    #0x5c
000c338a  movs    r3, r1
000c338c  adr     r3, #0x2e8
000c338e  movs    r3, r0
000c3390  adr     r1, #0xd8
000c3392  movs    r3, r0
000c3394  str     r7, [sp, #0x270]
000c3396  movs    r4, r5
000c3398  b       #0xc31c8
000c339a  movs    r3, r1
000c339c  cbz     r2, #0xc33d8
000c339e  movs    r3, r0
000c33a0  b       #0xc31b0
000c33a2  movs    r3, r1
000c33a4  bkpt    #0x34
000c33a6  movs    r3, r1
000c33a8  adr     r1, #0x118
000c33aa  movs    r3, r0
000c33ac  adr     r0, #0x3e8
000c33ae  movs    r3, r0
000c33b0  cbz     r4, #0xc33e0
000c33b2  movs    r3, r0
000c33b4  str     r7, [sp, #0xd8]
000c33b6  movs    r4, r5
000c33b8  add     r4, sp, #0x80
000c33ba  movs    r3, r0
000c33bc  b       #0xc3170
000c33be  movs    r3, r1
000c33c0  b       #0xc3190
000c33c2  movs    r3, r1
000c33c4  b       #0xc31a0
000c33c6  movs    r3, r1
000c33c8  str     r7, [sp, #0x78]
000c33ca  movs    r4, r5
000c33cc  add     r4, sp, #0x2e0
000c33ce  movs    r3, r0
000c33d0  movs    r0, r0
000c33d2  movs    r0, r0
000c33d4  movs    r0, r0
000c33d6  eors    r1, r3
000c33d8  cbz     r0, #0xc33f2
000c33da  movs    r3, r0
000c33dc  adr     r0, #0x268
000c33de  movs    r3, r0
000c33e0  b       #0xc3168
000c33e2  movs    r3, r1
000c33e4  b       #0xc3180
000c33e6  movs    r3, r1
000c33e8  str     r6, [sp, #0x378]
000c33ea  movs    r4, r5
000c33ec  b       #0xc3188
000c33ee  movs    r3, r1
000c33f0  ldr     r7, [sp, #0x390]
000c33f2  movs    r3, r0
000c33f4  cbz     r6, #0xc33fe
000c33f6  movs    r3, r0
000c33f8  adr     r0, #0x298
000c33fa  movs    r3, r0
000c33fc  adr     r0, #0x248
000c33fe  movs    r3, r0
000c3400  b       #0xc314c
000c3402  movs    r3, r1
000c3404  bpl     #0xc3408
000c3406  movs    r3, r1
000c3408  bmi     #0xc33c8
000c340a  movs    r3, r1
000c340c  sub     sp, #0x118
000c340e  movs    r3, r0
000c3410  adr     r0, #0x20
000c3412  movs    r3, r0
000c3414  b       #0xc300c
000c3416  movs    r3, r1
000c3418  str     r6, [sp, #0xf0]
000c341a  movs    r4, r5
000c341c  add     r3, sp, #0xa8
000c341e  movs    r3, r0
000c3420  b       #0xc3010
000c3422  movs    r3, r1
000c3424  b       #0xc30c0
000c3426  movs    r3, r1
000c3428  ldr     r7, [sp, #0x58]
000c342a  movs    r3, r0
000c342c  str     r6, [sp, #0xa0]
000c342e  movs    r4, r5
000c3430  add     sp, #0x1a0
000c3432  movs    r3, r0
000c3434  adr     r4, #0x2d0
000c3436  movs    r3, r0
000c3438  add     sp, #0xe0
000c343a  movs    r3, r0
000c343c  ldr     r7, [sp, #0x1e8]
000c343e  movs    r3, r0
000c3440  b       #0xc2f1c
000c3442  movs    r3, r1
000c3444  str     r5, [sp, #0x2b8]
000c3446  movs    r4, r5
000c3448  add     r2, sp, #0x270
000c344a  movs    r3, r0
000c344c  b       #0xc2f20
000c344e  movs    r3, r1
000c3450  b       #0xc2ff0
000c3452  movs    r3, r1
000c3454  ldr     r6, [sp, #0x220]
000c3456  movs    r3, r0
000c3458  str     r5, [sp, #0x268]
000c345a  movs    r4, r5
000c345c  add     r7, sp, #0x368
000c345e  movs    r3, r0
000c3460  adr     r4, #0x98
000c3462  movs    r3, r0
