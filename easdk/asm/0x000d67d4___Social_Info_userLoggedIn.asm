========================================================================
-[Social_Info userLoggedIn  0x000d67d4  580 bytes   Social_Info.mm
========================================================================

000d67d4  push    {r4, r5, r6, r7, lr}
000d67d6  add     r7, sp, #0xc
000d67d8  push.w  {r8, sl, fp}
000d67dc  sub     sp, #8
000d67de  ldr     r1, [pc, #0x1ac]
000d67e0  mov     r5, r2
000d67e2  ldr     r2, [pc, #0x1ac]
000d67e4  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d67e6  mov     r4, r0
000d67e8  add     r2, pc ; -> 0x0017e974  
000d67ea  ldr     r1, [r1]
000d67ec  mov     r0, r5
000d67ee  mov     fp, r3
000d67f0  blx     #0xddbfc ; -> objc_msgSend
000d67f4  ldr     r1, [pc, #0x19c]
000d67f6  ldr     r2, [pc, #0x1a0]
000d67f8  mov     r3, fp
000d67fa  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d67fc  add     r2, pc ; -> 0x00181c34  
000d67fe  ldr     r6, [r1]
000d6800  mov     r1, r6
000d6802  mov     sl, r0
000d6804  ldr     r0, [pc, #0x194]
000d6806  str.w   sl, [sp]
000d680a  add     r0, pc ; -> 0x000fdb5c  
000d680c  ldr.w   r8, [r0]
000d6810  mov     r0, r8
000d6812  blx     #0xddbfc ; -> objc_msgSend
000d6816  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d681a  ldr     r3, [pc, #0x184]
000d681c  add     r3, pc ; -> 0x000fb778  OBJC_IVAR_$_Social_Info.renewToken
000d681e  ldr     r3, [r3]
000d6820  ldrsb   r3, [r4, r3]
000d6822  cmp     r3, #0
000d6824  beq     #0xd687c
000d6826  ldr     r1, [pc, #0x17c]
000d6828  ldr     r2, [pc, #0x17c]
000d682a  mov     r3, sl
000d682c  add     r1, pc ; -> 0x000fd7e0  'U\n\x0f'
000d682e  add     r2, pc ; -> 0x0017ede4  
000d6830  ldr     r5, [r1]
000d6832  mov     r0, r8
000d6834  mov     r1, r6
000d6836  blx     #0xddbfc ; -> objc_msgSend
000d683a  mov     r1, r5
000d683c  mov     r2, r0
000d683e  mov     r0, r4
000d6840  blx     #0xddbfc ; -> objc_msgSend
000d6844  ldr     r1, [pc, #0x164]
000d6846  ldr     r2, [pc, #0x168]
000d6848  mov     r3, fp
000d684a  add     r1, pc ; -> 0x000fd7dc  '_\n\x0f'
000d684c  add     r2, pc ; -> 0x0017ef54  
000d684e  ldr     r5, [r1]
000d6850  mov     r0, r8
000d6852  mov     r1, r6
000d6854  blx     #0xddbfc ; -> objc_msgSend
000d6858  mov     r1, r5
000d685a  mov     r2, r0
000d685c  mov     r0, r4
000d685e  blx     #0xddbfc ; -> objc_msgSend
000d6862  ldr     r0, [pc, #0x150]
000d6864  ldr     r3, [pc, #0x150]
000d6866  ldr     r1, [pc, #0x154]
000d6868  add     r0, pc ; -> 0x000f3270  mtxController
000d686a  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d686c  ldr     r0, [r0]
000d686e  ldr     r3, [r3]
000d6870  add     r1, pc ; -> 0x000fd6d4  
000d6872  movs    r2, #0x23
000d6874  ldr     r0, [r0]
000d6876  ldr     r1, [r1]
000d6878  ldr     r3, [r4, r3]
000d687a  b       #0xd697e
000d687c  ldr     r1, [pc, #0x140]
000d687e  ldr     r0, [pc, #0x144]
000d6880  add     r1, pc ; -> 0x000fd7d8  '>\n\x0f'
000d6882  add     r0, pc ; -> 0x000fdca8  
000d6884  ldr     r1, [r1]
000d6886  ldr     r0, [r0]
000d6888  str     r1, [sp, #4]
000d688a  ldr     r1, [pc, #0x13c]
000d688c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d688e  ldr     r1, [r1]
000d6890  blx     #0xddbfc ; -> objc_msgSend
000d6894  ldr     r1, [pc, #0x134]
000d6896  mov     r2, r5
000d6898  add     r1, pc ; -> 0x000fd294  
000d689a  ldr     r1, [r1]
000d689c  blx     #0xddbfc ; -> objc_msgSend
000d68a0  ldr     r1, [pc, #0x12c]
000d68a2  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d68a4  ldr     r1, [r1]
000d68a6  blx     #0xddbfc ; -> objc_msgSend
000d68aa  ldr     r1, [sp, #4]
000d68ac  mov     r2, r0
000d68ae  mov     r0, r4
000d68b0  blx     #0xddbfc ; -> objc_msgSend
000d68b4  ldr     r1, [pc, #0x11c]
000d68b6  mov     r0, r4
000d68b8  mov     r2, sl
000d68ba  add     r1, pc ; -> 0x000fd7e0  'U\n\x0f'
000d68bc  ldr     r1, [r1]
000d68be  blx     #0xddbfc ; -> objc_msgSend
000d68c2  ldr     r1, [pc, #0x114]
000d68c4  ldr     r2, [pc, #0x114]
000d68c6  mov     r3, fp
000d68c8  add     r1, pc ; -> 0x000fd7dc  '_\n\x0f'
000d68ca  add     r2, pc ; -> 0x0017ef54  
000d68cc  ldr     r5, [r1]
000d68ce  mov     r0, r8
000d68d0  mov     r1, r6
000d68d2  blx     #0xddbfc ; -> objc_msgSend
000d68d6  mov     r1, r5
000d68d8  mov     r2, r0
000d68da  mov     r0, r4
000d68dc  blx     #0xddbfc ; -> objc_msgSend
000d68e0  ldr     r3, [pc, #0xfc]
000d68e2  ldr     r1, [pc, #0x100]
000d68e4  mov     r2, sl
000d68e6  add     r3, pc ; -> 0x000fae70  OBJC_IVAR_$_Social_Info.mUser
000d68e8  add     r1, pc ; -> 0x000fd2c4  
000d68ea  ldr     r3, [r3]
000d68ec  ldr     r1, [r1]
000d68ee  ldr     r0, [r4, r3]
000d68f0  blx     #0xddbfc ; -> objc_msgSend
000d68f4  ldr     r1, [pc, #0xf0]
000d68f6  mov     r0, r4
000d68f8  add     r1, pc ; -> 0x000fd7d4  ' \x0c\x0f'
000d68fa  ldr     r1, [r1]
000d68fc  blx     #0xddbfc ; -> objc_msgSend
000d6900  mov     r5, r0
000d6902  cbz     r0, #0xd6926
000d6904  ldr     r1, [pc, #0xe4]
000d6906  mov     r0, r4
000d6908  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000d690a  ldr     r6, [r1]
000d690c  ldr     r1, [pc, #0xe0]
000d690e  add     r1, pc ; -> 0x000fd540  
000d6910  ldr     r1, [r1]
000d6912  blx     #0xddbfc ; -> objc_msgSend
000d6916  mov     r1, r6
000d6918  mov     r2, r0
000d691a  mov     r0, r5
000d691c  blx     #0xddbfc ; -> objc_msgSend
000d6920  tst.w   r0, #0xff
000d6924  bne     #0xd6966
000d6926  ldr     r0, [pc, #0xcc]
000d6928  add     r0, pc ; -> 0x00181c44  
000d692a  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d692e  ldr     r0, [pc, #0xc8]
000d6930  ldr     r3, [pc, #0xc8]
000d6932  ldr     r1, [pc, #0xcc]
000d6934  add     r0, pc ; -> 0x000f3270  mtxController
000d6936  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6938  ldr     r0, [r0]
000d693a  ldr     r3, [r3]
000d693c  add     r1, pc ; -> 0x000fd6d4  
000d693e  movs    r2, #0x34
000d6940  ldr     r0, [r0]
000d6942  ldr     r1, [r1]
000d6944  ldr     r3, [r4, r3]
000d6946  blx     #0xddbfc ; -> objc_msgSend
000d694a  ldr     r1, [pc, #0xb8]
000d694c  mov     r0, r4
000d694e  add     r1, pc ; -> 0x000fd7d0  '.\x0c\x0f'
000d6950  ldr     r5, [r1]
000d6952  ldr     r1, [pc, #0xb4]
000d6954  add     r1, pc ; -> 0x000fd540  
000d6956  ldr     r1, [r1]
000d6958  blx     #0xddbfc ; -> objc_msgSend
000d695c  mov     r1, r5
000d695e  mov     r2, r0
000d6960  mov     r0, r4
000d6962  blx     #0xddbfc ; -> objc_msgSend
000d6966  ldr     r0, [pc, #0xa4]
000d6968  ldr     r3, [pc, #0xa4]
000d696a  ldr     r1, [pc, #0xa8]
000d696c  add     r0, pc ; -> 0x000f3270  mtxController
000d696e  add     r3, pc ; -> 0x000fb774  OBJC_IVAR_$_Social_Info.requestId
000d6970  ldr     r0, [r0]
000d6972  ldr     r3, [r3]
000d6974  add     r1, pc ; -> 0x000fd6d4  
000d6976  movs    r2, #0x20
000d6978  ldr     r0, [r0]
000d697a  ldr     r1, [r1]
000d697c  ldr     r3, [r4, r3]
000d697e  blx     #0xddbfc ; -> objc_msgSend
000d6982  sub.w   sp, r7, #0x18
000d6986  pop.w   {r8, sl, fp}
000d698a  pop     {r4, r5, r6, r7, pc}
000d698c  str     r0, [r1, #0x30]
000d698e  movs    r2, r0
000d6990  strh    r0, [r1, #0xc]
000d6992  movs    r2, r1
000d6994  str     r2, [r4, #0x28]
000d6996  movs    r2, r0
000d6998  push    {r2, r4, r5}
000d699a  movs    r2, r1
000d699c  strb    r6, [r1, #0xd]
000d699e  movs    r2, r0
000d69a0  ldr     r7, [pc, #0x160]
000d69a2  movs    r2, r0
000d69a4  ldr     r0, [r6, #0x78]
000d69a6  movs    r2, r0
000d69a8  strh    r2, [r6, #0x2c]
000d69aa  movs    r2, r1
000d69ac  ldr     r6, [r1, #0x78]
000d69ae  movs    r2, r0
000d69b0  strh    r4, [r0, #0x38]
000d69b2  movs    r2, r1
000d69b4  ldm     r2, {r2}
000d69b6  movs    r1, r0
000d69b8  ldr     r7, [pc, #0x18]
000d69ba  movs    r2, r0
000d69bc  ldr     r0, [r4, #0x64]
000d69be  movs    r2, r0
000d69c0  ldr     r4, [r2, #0x74]
000d69c2  movs    r2, r0
000d69c4  strb    r2, [r4, #0x10]
000d69c6  movs    r2, r0
000d69c8  str     r4, [r6, #0xc]
000d69ca  movs    r2, r0
000d69cc  ldr     r0, [r7, #0x1c]
000d69ce  movs    r2, r0
000d69d0  str     r2, [r6, #0x18]
000d69d2  movs    r2, r0
000d69d4  ldr     r2, [r4, #0x70]
000d69d6  movs    r2, r0
000d69d8  ldr     r0, [r2, #0x70]
000d69da  movs    r2, r0
000d69dc  strh    r6, [r0, #0x34]
000d69de  movs    r2, r1
000d69e0  cmp     lr, r0
000d69e2  movs    r2, r0
000d69e4  ldr     r0, [r3, #0x1c]
000d69e6  movs    r2, r0
000d69e8  ldr     r0, [r3, #0x6c]
000d69ea  movs    r2, r0
000d69ec  str     r0, [r3, #0x34]
000d69ee  movs    r2, r0
000d69f0  ldr     r6, [r5, #0x40]
000d69f2  movs    r2, r0
000d69f4  cbz     r0, #0xd6a3e
000d69f6  movs    r2, r1
000d69f8  ldm     r1!, {r3, r4, r5}
000d69fa  movs    r1, r0
000d69fc  ldr     r6, [pc, #0xe8]
000d69fe  movs    r2, r0
000d6a00  ldr     r4, [r2, #0x58]
000d6a02  movs    r2, r0
000d6a04  ldr     r6, [r7, #0x64]
000d6a06  movs    r2, r0
000d6a08  ldr     r0, [r5, #0x3c]
000d6a0a  movs    r2, r0
