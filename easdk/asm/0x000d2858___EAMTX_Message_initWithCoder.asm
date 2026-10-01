========================================================================
-[EAMTX_Message initWithCoder  0x000d2858  300 bytes   EAMTX_Message.mm
========================================================================

000d2858  push    {r4, r5, r6, r7, lr}
000d285a  add     r7, sp, #0xc
000d285c  sub     sp, #8
000d285e  ldr     r3, [pc, #0xe0]
000d2860  ldr     r1, [pc, #0xe0]
000d2862  str     r0, [sp]
000d2864  add     r3, pc ; -> 0x000fddcc  
000d2866  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d2868  ldr     r3, [r3]
000d286a  ldr     r1, [r1]
000d286c  mov     r0, sp
000d286e  mov     r6, r2
000d2870  str     r3, [sp, #4]
000d2872  blx     #0xddc08 ; -> objc_msgSendSuper2
000d2876  mov     r4, r0
000d2878  cmp     r0, #0
000d287a  beq     #0xd2938
000d287c  ldr     r1, [pc, #0xc8]
000d287e  ldr     r2, [pc, #0xcc]
000d2880  mov     r0, r6
000d2882  add     r1, pc ; -> 0x000fd214  
000d2884  add     r2, pc ; -> 0x00181dc4  
000d2886  ldr     r5, [r1]
000d2888  mov     r1, r5
000d288a  blx     #0xddbfc ; -> objc_msgSend
000d288e  ldr     r1, [pc, #0xc0]
000d2890  add     r1, pc ; -> 0x000fd478  
000d2892  ldr     r1, [r1]
000d2894  mov     r2, r0
000d2896  mov     r0, r4
000d2898  blx     #0xddbfc ; -> objc_msgSend
000d289c  ldr     r2, [pc, #0xb4]
000d289e  mov     r1, r5
000d28a0  mov     r0, r6
000d28a2  add     r2, pc ; -> 0x0017fe24  
000d28a4  blx     #0xddbfc ; -> objc_msgSend
000d28a8  ldr     r1, [pc, #0xac]
000d28aa  add     r1, pc ; -> 0x000fcc48  "S'\x0e"
000d28ac  ldr     r1, [r1]
000d28ae  mov     r2, r0
000d28b0  mov     r0, r4
000d28b2  blx     #0xddbfc ; -> objc_msgSend
000d28b6  ldr     r2, [pc, #0xa4]
000d28b8  mov     r1, r5
000d28ba  mov     r0, r6
000d28bc  add     r2, pc ; -> 0x0017fe44  
000d28be  blx     #0xddbfc ; -> objc_msgSend
000d28c2  ldr     r1, [pc, #0x9c]
000d28c4  add     r1, pc ; -> 0x000fd474  
000d28c6  ldr     r1, [r1]
000d28c8  mov     r2, r0
000d28ca  mov     r0, r4
000d28cc  blx     #0xddbfc ; -> objc_msgSend
000d28d0  ldr     r2, [pc, #0x90]
000d28d2  mov     r1, r5
000d28d4  mov     r0, r6
000d28d6  add     r2, pc ; -> 0x0017fe34  
000d28d8  blx     #0xddbfc ; -> objc_msgSend
000d28dc  ldr     r1, [pc, #0x88]
000d28de  add     r1, pc ; -> 0x000fd470  
000d28e0  ldr     r1, [r1]
000d28e2  mov     r2, r0
000d28e4  mov     r0, r4
000d28e6  blx     #0xddbfc ; -> objc_msgSend
000d28ea  ldr     r2, [pc, #0x80]
000d28ec  mov     r1, r5
000d28ee  mov     r0, r6
000d28f0  add     r2, pc ; -> 0x00181dd4  
000d28f2  blx     #0xddbfc ; -> objc_msgSend
000d28f6  ldr     r1, [pc, #0x78]
000d28f8  add     r1, pc ; -> 0x000fd468  
000d28fa  ldr     r1, [r1]
000d28fc  mov     r2, r0
000d28fe  mov     r0, r4
000d2900  blx     #0xddbfc ; -> objc_msgSend
000d2904  ldr     r2, [pc, #0x6c]
000d2906  mov     r1, r5
000d2908  mov     r0, r6
000d290a  add     r2, pc ; -> 0x00181de4  
000d290c  blx     #0xddbfc ; -> objc_msgSend
000d2910  ldr     r1, [pc, #0x64]
000d2912  add     r1, pc ; -> 0x000fd46c  
000d2914  ldr     r1, [r1]
000d2916  mov     r2, r0
000d2918  mov     r0, r4
000d291a  blx     #0xddbfc ; -> objc_msgSend
000d291e  ldr     r2, [pc, #0x5c]
000d2920  mov     r1, r5
000d2922  mov     r0, r6
000d2924  add     r2, pc ; -> 0x00181df4  
000d2926  blx     #0xddbfc ; -> objc_msgSend
000d292a  ldr     r1, [pc, #0x54]
000d292c  add     r1, pc ; -> 0x000fd814  'a\r\x0f'
000d292e  ldr     r1, [r1]
000d2930  mov     r2, r0
000d2932  mov     r0, r4
000d2934  blx     #0xddbfc ; -> objc_msgSend
000d2938  mov     r0, r4
000d293a  sub.w   sp, r7, #0xc
000d293e  pop     {r4, r5, r6, r7, pc}
000d2940  push    {r2, r5, r6, lr}
000d2942  movs    r2, r0
000d2944  adr     r1, #0x58
000d2946  movs    r2, r0
000d2948  add     r1, sp, #0x238
000d294a  movs    r2, r0
