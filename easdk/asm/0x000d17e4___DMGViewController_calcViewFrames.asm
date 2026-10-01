========================================================================
-[DMGViewController calcViewFrames  0x000d17e4  1000 bytes   DMGViewController.mm
========================================================================

000d17e4  push    {r4, r5, r6, r7, lr}
000d17e6  add     r7, sp, #0xc
000d17e8  push.w  {r8, sl, fp}
000d17ec  sub     sp, #0x4c
000d17ee  ldr     r1, [pc, #0x2f8]
000d17f0  mov     r4, r0
000d17f2  ldr     r0, [pc, #0x2f8]
000d17f4  add     r1, pc ; -> 0x000fc9e4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x6c
000d17f6  mov     r5, r2
000d17f8  add     r0, pc ; -> 0x000fdb54  
000d17fa  ldr     r1, [r1]
000d17fc  ldr     r0, [r0]
000d17fe  blx     #0xddbfc ; -> objc_msgSend
000d1802  ldr     r2, [pc, #0x2ec]
000d1804  add     r2, pc ; -> 0x000fcd70  'L2\x0e'
000d1806  ldr     r2, [r2]
000d1808  mov     r1, r0
000d180a  add     r0, sp, #0x3c
000d180c  blx     #0xddc14 ; -> objc_msgSend_stret
000d1810  ldr     r3, [pc, #0x2e0]
000d1812  subs    r2, r5, #3
000d1814  ldr.w   r8, [sp, #0x48]
000d1818  add     r3, pc ; -> 0x000fa2b8  OBJC_IVAR_$_DMGViewController.landscapeMode
000d181a  ldr     r6, [sp, #0x44]
000d181c  ldr     r1, [r3]
000d181e  cmp     r2, #1
000d1820  ite     hi
000d1822  movhi   r2, #0
000d1824  movls   r2, #1
000d1826  strb    r2, [r4, r1]
000d1828  ldr     r3, [r3]
000d182a  ldrsb   r3, [r4, r3]
000d182c  cmp     r3, #0
000d182e  beq.w   #0xd1abe
000d1832  ldr     r3, [pc, #0x2c4]
000d1834  ldr.w   r1, [pc, #0x2c4]
000d1838  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d183a  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d183c  ldr     r3, [r3]
000d183e  ldr     r1, [r1]
000d1840  ldr     r0, [r4, r3]
000d1842  blx     #0xddbfc ; -> objc_msgSend
000d1846  cmp     r0, #1
000d1848  bne.w   #0xd1abe
000d184c  ldr     r3, [pc, #0x2b0]
000d184e  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d1850  ldr     r3, [r3]
000d1852  str     r6, [r3]
000d1854  ldr.w   r3, [pc, #0x2ac]
000d1858  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d185a  ldr     r3, [r3]
000d185c  ldr     r1, [pc, #0x2a8]
000d185e  str.w   r8, [r3]
000d1862  ldr     r3, [pc, #0x2a8]
000d1864  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d1866  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1868  ldr     r5, [r1]
000d186a  ldr     r3, [r3]
000d186c  mov     r1, r5
000d186e  ldr     r0, [r4, r3]
000d1870  blx     #0xddbfc ; -> objc_msgSend
000d1874  cmp     r0, #1
000d1876  bne     #0xd18ac
000d1878  ldr     r3, [pc, #0x294]
000d187a  movs    r2, #0
000d187c  add     r3, pc ; -> 0x000f3300  DMG_WEBVIEW_XPOS
000d187e  ldr     r3, [r3]
000d1880  str     r2, [r3]
000d1882  ldr     r3, [pc, #0x290]
000d1884  add     r3, pc ; -> 0x000f32f4  DMG_WEBVIEW_YPOS
000d1886  ldr     r3, [r3]
000d1888  str     r2, [r3]
000d188a  ldr     r3, [pc, #0x28c]
000d188c  add     r3, pc ; -> 0x000f32f8  DMG_WEBVIEW_WIDTH
000d188e  ldr     r2, [r3]
000d1890  ldr     r3, [pc, #0x288]
000d1892  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d1894  ldr     r3, [r3]
000d1896  ldr     r3, [r3]
000d1898  str     r3, [r2]
000d189a  ldr     r3, [pc, #0x284]
000d189c  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d189e  ldr     r2, [r3]
000d18a0  ldr     r3, [pc, #0x280]
000d18a2  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d18a4  ldr     r3, [r3]
000d18a6  ldr     r3, [r3]
000d18a8  str     r3, [r2]
000d18aa  b       #0xd18fc
000d18ac  ldr     r3, [pc, #0x278]
000d18ae  vldr    s14, [pc, #0x230]
000d18b2  add     r3, pc ; -> 0x000f3300  DMG_WEBVIEW_XPOS
000d18b4  ldr     r2, [r3]
000d18b6  movs    r3, #0
000d18b8  str     r3, [r2]
000d18ba  ldr     r3, [pc, #0x270]
000d18bc  add     r3, pc ; -> 0x000f32f4  DMG_WEBVIEW_YPOS
000d18be  ldr     r2, [r3]
000d18c0  ldr     r3, [pc, #0x26c]
000d18c2  str     r3, [r2]
000d18c4  ldr     r3, [pc, #0x26c]
000d18c6  add     r3, pc ; -> 0x000f32f8  DMG_WEBVIEW_WIDTH
000d18c8  ldr     r2, [r3]
000d18ca  ldr     r3, [pc, #0x26c]
000d18cc  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d18ce  ldr     r3, [r3]
000d18d0  ldr     r3, [r3]
000d18d2  str     r3, [r2]
000d18d4  ldr     r3, [pc, #0x264]
000d18d6  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d18d8  ldr     r2, [r3]
000d18da  ldr     r3, [pc, #0x264]
000d18dc  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d18de  ldr     r3, [r3]
000d18e0  vldr    s12, [r3]
000d18e4  vsub.f32 d7, d6, d7
000d18e8  vldr    s12, [pc, #0x1f8]
000d18ec  vsub.f32 d7, d7, d6
000d18f0  vmov.f32 s12, #2.000000e+00
000d18f4  vsub.f32 d7, d7, d6
000d18f8  vstr    s14, [r2]
000d18fc  ldr     r3, [pc, #0x244]
000d18fe  ldr     r2, [pc, #0x248]
000d1900  add     r3, pc ; -> 0x000fa2a8  OBJC_IVAR_$_DMGViewController.connectionType
000d1902  add     r2, pc ; -> 0x00180a34  
000d1904  ldr     r3, [r3]
000d1906  ldr     r3, [r4, r3]
000d1908  cmp     r3, r2
000d190a  bne     #0xd1934
000d190c  ldr     r3, [pc, #0x23c]
000d190e  mov     r1, r5
000d1910  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1912  ldr     r3, [r3]
000d1914  ldr     r0, [r4, r3]
000d1916  blx     #0xddbfc ; -> objc_msgSend
000d191a  cmp     r0, #1
000d191c  beq     #0xd1934
000d191e  ldr     r3, [pc, #0x230]
000d1920  vldr    s14, [pc, #0x1c0]
000d1924  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d1926  ldr     r3, [r3]
000d1928  vldr    s12, [r3]
000d192c  vadd.f32 d7, d6, d7
000d1930  vstr    s14, [r3]
000d1934  ldr     r5, [pc, #0x21c]
000d1936  add     r5, pc ; -> 0x000fa2c0  OBJC_IVAR_$_DMGViewController.navBar
000d1938  ldr     r0, [r5]
000d193a  ldr     r0, [r4, r0]
000d193c  cmp     r0, #0
000d193e  beq     #0xd199e
000d1940  ldr     r1, [pc, #0x214]
000d1942  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d1944  ldr     r1, [r1]
000d1946  blx     #0xddbfc ; -> objc_msgSend
000d194a  ldr     r1, [pc, #0x210]
000d194c  ldr     r3, [r5]
000d194e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1950  ldr     r0, [r4, r3]
000d1952  ldr     r1, [r1]
000d1954  blx     #0xddbfc ; -> objc_msgSend
000d1958  ldr     r0, [pc, #0x204]
000d195a  ldr     r1, [pc, #0x208]
000d195c  ldr     r2, [r5]
000d195e  add     r0, pc ; -> 0x000fdd0c  
000d1960  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d1962  ldr     r0, [r0]
000d1964  ldr     r1, [r1]
000d1966  movs    r3, #0
000d1968  str     r3, [r4, r2]
000d196a  ldr     r6, [r5]
000d196c  blx     #0xddbfc ; -> objc_msgSend
000d1970  ldr     r3, [pc, #0x1f4]
000d1972  ldr     r1, [pc, #0x1f8]
000d1974  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1976  add     r1, pc ; -> 0x000fda98  
000d1978  ldr     r3, [r3]
000d197a  ldr     r1, [r1]
000d197c  ldr     r2, [r4, r3]
000d197e  blx     #0xddbfc ; -> objc_msgSend
000d1982  ldr     r1, [pc, #0x1ec]
000d1984  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d1986  ldr     r1, [r1]
000d1988  str     r0, [r4, r6]
000d198a  mov     r0, r4
000d198c  blx     #0xddbfc ; -> objc_msgSend
000d1990  ldr     r1, [pc, #0x1e0]
000d1992  ldr     r3, [r5]
000d1994  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d1996  ldr     r2, [r4, r3]
000d1998  ldr     r1, [r1]
000d199a  blx     #0xddbfc ; -> objc_msgSend
000d199e  ldr     r5, [pc, #0x1d8]
000d19a0  add     r5, pc ; -> 0x000fa2bc  OBJC_IVAR_$_DMGViewController.catBar
000d19a2  ldr     r0, [r5]
000d19a4  ldr     r0, [r4, r0]
000d19a6  cmp     r0, #0
000d19a8  beq     #0xd1a60
000d19aa  ldr     r1, [pc, #0x1d0]
000d19ac  movs    r6, #0
000d19ae  mov     sl, r6
000d19b0  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d19b2  mov     fp, r6
000d19b4  ldr     r1, [r1]
000d19b6  blx     #0xddbfc ; -> objc_msgSend
000d19ba  ldr     r1, [pc, #0x1c4]
000d19bc  ldr     r3, [r5]
000d19be  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d19c0  ldr     r0, [r4, r3]
000d19c2  ldr     r1, [r1]
000d19c4  blx     #0xddbfc ; -> objc_msgSend
000d19c8  ldr     r0, [pc, #0x1b8]
000d19ca  ldr     r1, [pc, #0x1bc]
000d19cc  ldr     r2, [r5]
000d19ce  add     r0, pc ; -> 0x000fdd10  
000d19d0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d19d2  ldr     r0, [r0]
000d19d4  ldr     r1, [r1]
000d19d6  movs    r3, #0
000d19d8  str     r3, [r4, r2]
000d19da  ldr.w   r8, [r5]
000d19de  blx     #0xddbfc ; -> objc_msgSend
000d19e2  ldr     r3, [pc, #0x1a8]
000d19e4  ldr     r1, [pc, #0x1a8]
000d19e6  vldr    s12, [pc, #0xfc]
000d19ea  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d19ec  vstr    s12, [sp, #0x38]
000d19f0  ldr     r3, [r3]
000d19f2  vldr    s14, [r3]
000d19f6  ldr     r3, [pc, #0x19c]
000d19f8  vsub.f32 d7, d7, d6
000d19fc  str     r6, [sp, #0x2c]
000d19fe  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d1a00  vstr    s14, [sp, #0x30]
000d1a04  ldr     r3, [r3]
000d1a06  add     r1, pc ; -> 0x000fda94  
000d1a08  add     r2, sp, #0x2c
000d1a0a  ldr.w   ip, [r1]
000d1a0e  ldr     r3, [r3]
000d1a10  str     r3, [sp, #0x34]
000d1a12  ldr     r3, [pc, #0x184]
000d1a14  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d1a16  ldr     r3, [r3]
000d1a18  ldr     r3, [r4, r3]
000d1a1a  mov     lr, r0
000d1a1c  add     r0, sp, #0x34
000d1a1e  str     r3, [sp, #8]
000d1a20  ldm     r0, {r0, r1}
000d1a22  stm.w   sp, {r0, r1}
000d1a26  mov     r1, ip
000d1a28  ldm     r2, {r2, r3}
000d1a2a  mov     r0, lr
000d1a2c  blx     #0xddbfc ; -> objc_msgSend
000d1a30  ldr     r1, [pc, #0x168]
000d1a32  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d1a34  ldr     r1, [r1]
000d1a36  str.w   r0, [r4, r8]
000d1a3a  mov     r0, r4
000d1a3c  blx     #0xddbfc ; -> objc_msgSend
000d1a40  ldr     r1, [pc, #0x15c]
000d1a42  ldr     r3, [r5]
000d1a44  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d1a46  ldr     r2, [r4, r3]
000d1a48  ldr     r1, [r1]
000d1a4a  blx     #0xddbfc ; -> objc_msgSend
000d1a4e  ldr     r1, [pc, #0x154]
000d1a50  ldr     r3, [r5]
000d1a52  mov     r2, r6
000d1a54  add     r1, pc ; -> 0x000fda90  
000d1a56  ldr     r0, [r4, r3]
000d1a58  ldr     r1, [r1]
000d1a5a  mov     r3, r6
000d1a5c  blx     #0xddbfc ; -> objc_msgSend
000d1a60  ldr     r3, [pc, #0x144]
000d1a62  add     r3, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d1a64  ldr     r0, [r3]
000d1a66  ldr     r4, [r4, r0]
000d1a68  cmp     r4, #0
000d1a6a  beq     #0xd1ad6
000d1a6c  ldr     r3, [pc, #0x13c]
000d1a6e  add.w   ip, sp, #0xc
000d1a72  add     r3, pc ; -> 0x000f3300  DMG_WEBVIEW_XPOS
000d1a74  ldr     r3, [r3]
000d1a76  ldr     r0, [r3]
000d1a78  ldr     r3, [pc, #0x134]
000d1a7a  add     r3, pc ; -> 0x000f32f4  DMG_WEBVIEW_YPOS
000d1a7c  str     r0, [sp, #0x1c]
000d1a7e  ldr     r3, [r3]
000d1a80  add     r0, sp, #0x1c
000d1a82  ldr     r1, [r3]
000d1a84  ldr     r3, [pc, #0x12c]
000d1a86  add     r3, pc ; -> 0x000f32f8  DMG_WEBVIEW_WIDTH
000d1a88  str     r1, [sp, #0x20]
000d1a8a  ldr     r3, [r3]
000d1a8c  ldr     r1, [pc, #0x128]
000d1a8e  ldr     r2, [r3]
000d1a90  ldr     r3, [pc, #0x128]
000d1a92  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000d1a94  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d1a96  ldr.w   lr, [r1]
000d1a9a  ldr     r3, [r3]
000d1a9c  str     r2, [sp, #0x24]
000d1a9e  ldr     r3, [r3]
000d1aa0  str     r3, [sp, #0x28]
000d1aa2  ldm     r0, {r0, r1, r2, r3}
000d1aa4  stm.w   ip, {r0, r1, r2, r3}
000d1aa8  add     r0, sp, #0x14
000d1aaa  ldm     r0, {r0, r1}
000d1aac  stm.w   sp, {r0, r1}
000d1ab0  mov     r0, r4
000d1ab2  ldm.w   ip, {r2, r3}
000d1ab6  mov     r1, lr
000d1ab8  blx     #0xddbfc ; -> objc_msgSend
000d1abc  b       #0xd1ad6
000d1abe  ldr     r3, [pc, #0x100]
000d1ac0  movs    r2, #0
000d1ac2  add     r3, pc ; -> 0x000fa2b8  OBJC_IVAR_$_DMGViewController.landscapeMode
000d1ac4  ldr     r3, [r3]
000d1ac6  strb    r2, [r4, r3]
000d1ac8  ldr     r3, [pc, #0xf8]
000d1aca  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000d1acc  ldr     r3, [r3]
000d1ace  str     r6, [r3]
000d1ad0  ldr     r3, [pc, #0xf4]
000d1ad2  add     r3, pc ; -> 0x000f3354  DMG_MAIN_SCREEN_HEIGHT
000d1ad4  b       #0xd185a
000d1ad6  sub.w   sp, r7, #0x18
000d1ada  pop.w   {r8, sl, fp}
000d1ade  pop     {r4, r5, r6, r7, pc}
000d1ae0  movs    r0, r0
000d1ae2  tst     r0, r6
000d1ae4  movs    r0, r0
000d1ae6  rsbs    r0, r1, #0
000d1ae8  cbz     r4, #0xd1b26
000d1aea  movs    r2, r0
000d1aec  stm     r3!, {r3, r4, r6}
000d1aee  movs    r2, r0
000d1af0  push    {r3, r5, r6, lr}
000d1af2  movs    r2, r0
000d1af4  ldrh    r4, [r3, #0x14]
000d1af6  movs    r2, r0
000d1af8  ldrh    r0, [r5, #0x12]
000d1afa  movs    r2, r0
000d1afc  stm     r2!, {r1, r2, r3, r6}
000d1afe  movs    r2, r0
000d1b00  subs    r2, r0, r4
000d1b02  movs    r2, r0
000d1b04  subs    r4, r7, r3
000d1b06  movs    r2, r0
000d1b08  stm     r2!, {r2, r5}
000d1b0a  movs    r2, r0
000d1b0c  ldrh    r2, [r7, #0x10]
000d1b0e  movs    r2, r0
000d1b10  subs    r0, r0, r2
000d1b12  movs    r2, r0
000d1b14  subs    r4, r5, r1
000d1b16  movs    r2, r0
000d1b18  subs    r0, r5, r1
000d1b1a  movs    r2, r0
000d1b1c  subs    r2, r0, r3
000d1b1e  movs    r2, r0
000d1b20  subs    r4, r3, r1
000d1b22  movs    r2, r0
000d1b24  subs    r6, r5, r2
000d1b26  movs    r2, r0
000d1b28  subs    r2, r1, r1
000d1b2a  movs    r2, r0
000d1b2c  subs    r4, r6, r0
000d1b2e  movs    r2, r0
000d1b30  movs    r0, r0
000d1b32  tst     r4, r6
000d1b34  subs    r6, r5, r0
000d1b36  movs    r2, r0
000d1b38  subs    r0, r1, r2
000d1b3a  movs    r2, r0
000d1b3c  subs    r2, r4, r0
000d1b3e  movs    r2, r0
000d1b40  subs    r4, r6, r1
000d1b42  movs    r2, r0
000d1b44  ldrh    r4, [r4, #0xc]
000d1b46  movs    r2, r0
