========================================================================
-[EAMTX_Controller stringURLDecode  0x000cc5ec  1000 bytes   EAMTX_Controller.mm
========================================================================

000cc5ec  push    {r4, r5, r6, r7, lr}
000cc5ee  add     r7, sp, #0xc
000cc5f0  push.w  {r8, sl, fp}
000cc5f4  sub     sp, #0x78
000cc5f6  ldr     r1, [pc, #0x340]
000cc5f8  mov     r0, r2
000cc5fa  movs    r2, #4
000cc5fc  add     r1, pc ; -> 0x000fd774  
000cc5fe  ldr.w   fp, [pc, #0x33c]
000cc602  ldr     r1, [r1]
000cc604  blx     #0xddbfc ; -> objc_msgSend
000cc608  ldr     r1, [pc, #0x334]
000cc60a  ldr.w   r8, [pc, #0x338]
000cc60e  add     fp, pc ; -> 0x00181804  
000cc610  add     r1, pc ; -> 0x000fcb24  '\x1c=\x0e'
000cc612  add     r8, pc ; -> 0x00180b34  
000cc614  ldr     r1, [r1]
000cc616  movs    r5, #0
000cc618  mov     r2, r0
000cc61a  ldr     r0, [pc, #0x32c]
000cc61c  add     r0, pc ; -> 0x000fdbf8  
000cc61e  ldr     r0, [r0]
000cc620  blx     #0xddbfc ; -> objc_msgSend
000cc624  ldr     r1, [pc, #0x324]
000cc626  add     r1, pc ; -> 0x000fd778  '\x1c\x06\x0f'
000cc628  ldr     r1, [r1]
000cc62a  str     r1, [sp, #0xc]
000cc62c  ldr     r1, [pc, #0x320]
000cc62e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000cc630  ldr.w   sl, [r1]
000cc634  mov     r1, sl
000cc636  mov     r4, r0
000cc638  blx     #0xddbfc ; -> objc_msgSend
000cc63c  mov     r3, r8
000cc63e  movs    r2, #1
000cc640  ldr     r1, [sp, #0xc]
000cc642  str     r2, [sp]
000cc644  mov     r2, fp
000cc646  ldr.w   r8, [pc, #0x30c]
000cc64a  ldr.w   fp, [pc, #0x30c]
000cc64e  add     r8, pc ; -> 0x0017e8a4  
000cc650  add     fp, pc ; -> 0x00181814  
000cc652  mov     r6, r0
000cc654  mov     r0, r4
000cc656  str     r5, [sp, #4]
000cc658  str     r6, [sp, #8]
000cc65a  blx     #0xddbfc ; -> objc_msgSend
000cc65e  mov     r1, sl
000cc660  mov     r0, r4
000cc662  blx     #0xddbfc ; -> objc_msgSend
000cc666  mov     r2, fp
000cc668  movs    r3, #1
000cc66a  ldr     r1, [sp, #0xc]
000cc66c  str     r3, [sp]
000cc66e  mov     r3, r8
000cc670  ldr.w   fp, [pc, #0x2e8]
000cc674  ldr.w   r8, [pc, #0x2e8]
000cc678  add     fp, pc ; -> 0x00181834  
000cc67a  add     r8, pc ; -> 0x00181824  
000cc67c  mov     r6, r0
000cc67e  mov     r0, r4
000cc680  str     r5, [sp, #4]
000cc682  str     r6, [sp, #8]
000cc684  blx     #0xddbfc ; -> objc_msgSend
000cc688  mov     r1, sl
000cc68a  mov     r0, r4
000cc68c  blx     #0xddbfc ; -> objc_msgSend
000cc690  mov     r3, r8
000cc692  movs    r2, #1
000cc694  ldr     r1, [sp, #0xc]
000cc696  str     r2, [sp]
000cc698  mov     r2, fp
000cc69a  mov     r6, r0
000cc69c  mov     r0, r4
000cc69e  str     r5, [sp, #4]
000cc6a0  str     r6, [sp, #8]
000cc6a2  blx     #0xddbfc ; -> objc_msgSend
000cc6a6  mov     r1, sl
000cc6a8  mov     r0, r4
000cc6aa  blx     #0xddbfc ; -> objc_msgSend
000cc6ae  ldr     r6, [pc, #0x2b4]
000cc6b0  movs    r3, #0
000cc6b2  ldr     r5, [pc, #0x2b4]
000cc6b4  str     r3, [sp, #0x10]
000cc6b6  movs    r2, #1
000cc6b8  str     r2, [sp]
000cc6ba  add     r6, pc ; -> 0x00181844  
000cc6bc  add     r5, pc ; -> 0x0017fe54  
000cc6be  ldr     r1, [sp, #0xc]
000cc6c0  str     r0, [sp, #0x14]
000cc6c2  add     r2, sp, #0x10
000cc6c4  ldm     r2, {r2, r3}
000cc6c6  mov     r0, r4
000cc6c8  str     r2, [sp, #4]
000cc6ca  str     r3, [sp, #8]
000cc6cc  mov     r2, r6
000cc6ce  mov     r3, r5
000cc6d0  blx     #0xddbfc ; -> objc_msgSend
000cc6d4  mov     r1, sl
000cc6d6  mov     r0, r4
000cc6d8  blx     #0xddbfc ; -> objc_msgSend
000cc6dc  ldr     r6, [pc, #0x28c]
000cc6de  movs    r3, #0
000cc6e0  ldr     r5, [pc, #0x28c]
000cc6e2  str     r3, [sp, #0x18]
000cc6e4  movs    r2, #1
000cc6e6  str     r2, [sp]
000cc6e8  add     r6, pc ; -> 0x00181854  
000cc6ea  add     r5, pc ; -> 0x0017e794  
000cc6ec  ldr     r1, [sp, #0xc]
000cc6ee  str     r0, [sp, #0x1c]
000cc6f0  add     r2, sp, #0x18
000cc6f2  ldm     r2, {r2, r3}
000cc6f4  mov     r0, r4
000cc6f6  str     r2, [sp, #4]
000cc6f8  str     r3, [sp, #8]
000cc6fa  mov     r2, r6
000cc6fc  mov     r3, r5
000cc6fe  blx     #0xddbfc ; -> objc_msgSend
000cc702  mov     r1, sl
000cc704  mov     r0, r4
000cc706  blx     #0xddbfc ; -> objc_msgSend
000cc70a  ldr     r6, [pc, #0x268]
000cc70c  movs    r3, #0
000cc70e  ldr     r5, [pc, #0x268]
000cc710  str     r3, [sp, #0x20]
000cc712  movs    r2, #1
000cc714  str     r2, [sp]
000cc716  add     r6, pc ; -> 0x00181864  
000cc718  add     r5, pc ; -> 0x001809d4  
000cc71a  ldr     r1, [sp, #0xc]
000cc71c  str     r0, [sp, #0x24]
000cc71e  add     r2, sp, #0x20
000cc720  ldm     r2, {r2, r3}
000cc722  mov     r0, r4
000cc724  str     r2, [sp, #4]
000cc726  str     r3, [sp, #8]
000cc728  mov     r2, r6
000cc72a  mov     r3, r5
000cc72c  blx     #0xddbfc ; -> objc_msgSend
000cc730  mov     r1, sl
000cc732  mov     r0, r4
000cc734  blx     #0xddbfc ; -> objc_msgSend
000cc738  ldr     r6, [pc, #0x240]
000cc73a  movs    r3, #0
000cc73c  ldr     r5, [pc, #0x240]
000cc73e  str     r3, [sp, #0x28]
000cc740  movs    r2, #1
000cc742  str     r2, [sp]
000cc744  add     r6, pc ; -> 0x00181874  
000cc746  add     r5, pc ; -> 0x0017f444  
000cc748  ldr     r1, [sp, #0xc]
000cc74a  str     r0, [sp, #0x2c]
000cc74c  add     r2, sp, #0x28
000cc74e  ldm     r2, {r2, r3}
000cc750  mov     r0, r4
000cc752  str     r2, [sp, #4]
000cc754  str     r3, [sp, #8]
000cc756  mov     r2, r6
000cc758  mov     r3, r5
000cc75a  blx     #0xddbfc ; -> objc_msgSend
000cc75e  mov     r1, sl
000cc760  mov     r0, r4
000cc762  blx     #0xddbfc ; -> objc_msgSend
000cc766  ldr     r6, [pc, #0x21c]
000cc768  movs    r3, #0
000cc76a  ldr     r5, [pc, #0x21c]
000cc76c  str     r3, [sp, #0x30]
000cc76e  movs    r2, #1
000cc770  str     r2, [sp]
000cc772  add     r6, pc ; -> 0x00181884  
000cc774  add     r5, pc ; -> 0x0017ec04  
000cc776  ldr     r1, [sp, #0xc]
000cc778  str     r0, [sp, #0x34]
000cc77a  add     r2, sp, #0x30
000cc77c  ldm     r2, {r2, r3}
000cc77e  mov     r0, r4
000cc780  str     r2, [sp, #4]
000cc782  str     r3, [sp, #8]
000cc784  mov     r2, r6
000cc786  mov     r3, r5
000cc788  blx     #0xddbfc ; -> objc_msgSend
000cc78c  mov     r1, sl
000cc78e  mov     r0, r4
000cc790  blx     #0xddbfc ; -> objc_msgSend
000cc794  ldr     r6, [pc, #0x1f4]
000cc796  movs    r3, #0
000cc798  ldr     r5, [pc, #0x1f4]
000cc79a  str     r3, [sp, #0x38]
000cc79c  movs    r2, #1
000cc79e  str     r2, [sp]
000cc7a0  add     r6, pc ; -> 0x00181894  
000cc7a2  add     r5, pc ; -> 0x0017ec14  
000cc7a4  ldr     r1, [sp, #0xc]
000cc7a6  str     r0, [sp, #0x3c]
000cc7a8  add     r2, sp, #0x38
000cc7aa  ldm     r2, {r2, r3}
000cc7ac  mov     r0, r4
000cc7ae  str     r2, [sp, #4]
000cc7b0  str     r3, [sp, #8]
000cc7b2  mov     r2, r6
000cc7b4  mov     r3, r5
000cc7b6  blx     #0xddbfc ; -> objc_msgSend
000cc7ba  mov     r1, sl
000cc7bc  mov     r0, r4
000cc7be  blx     #0xddbfc ; -> objc_msgSend
000cc7c2  ldr     r6, [pc, #0x1d0]
000cc7c4  movs    r3, #0
000cc7c6  ldr     r5, [pc, #0x1d0]
000cc7c8  str     r3, [sp, #0x40]
000cc7ca  movs    r2, #1
000cc7cc  str     r2, [sp]
000cc7ce  add     r6, pc ; -> 0x001818b4  
000cc7d0  add     r5, pc ; -> 0x001818a4  
000cc7d2  ldr     r1, [sp, #0xc]
000cc7d4  str     r0, [sp, #0x44]
000cc7d6  add     r2, sp, #0x40
000cc7d8  ldm     r2, {r2, r3}
000cc7da  mov     r0, r4
000cc7dc  str     r2, [sp, #4]
000cc7de  str     r3, [sp, #8]
000cc7e0  mov     r2, r6
000cc7e2  mov     r3, r5
000cc7e4  blx     #0xddbfc ; -> objc_msgSend
000cc7e8  mov     r1, sl
000cc7ea  mov     r0, r4
000cc7ec  blx     #0xddbfc ; -> objc_msgSend
000cc7f0  ldr     r6, [pc, #0x1a8]
000cc7f2  movs    r3, #0
000cc7f4  ldr     r5, [pc, #0x1a8]
000cc7f6  str     r3, [sp, #0x48]
000cc7f8  movs    r2, #1
000cc7fa  str     r2, [sp]
000cc7fc  add     r6, pc ; -> 0x001818c4  
000cc7fe  add     r5, pc ; -> 0x0017ffa4  
000cc800  ldr     r1, [sp, #0xc]
000cc802  str     r0, [sp, #0x4c]
000cc804  add     r2, sp, #0x48
000cc806  ldm     r2, {r2, r3}
000cc808  mov     r0, r4
000cc80a  str     r2, [sp, #4]
000cc80c  str     r3, [sp, #8]
000cc80e  mov     r2, r6
000cc810  mov     r3, r5
000cc812  blx     #0xddbfc ; -> objc_msgSend
000cc816  mov     r1, sl
000cc818  mov     r0, r4
000cc81a  blx     #0xddbfc ; -> objc_msgSend
000cc81e  ldr     r6, [pc, #0x184]
000cc820  movs    r3, #0
000cc822  ldr     r5, [pc, #0x184]
000cc824  str     r3, [sp, #0x50]
000cc826  movs    r2, #1
000cc828  str     r2, [sp]
000cc82a  add     r6, pc ; -> 0x001818e4  
000cc82c  add     r5, pc ; -> 0x001818d4  
000cc82e  ldr     r1, [sp, #0xc]
000cc830  str     r0, [sp, #0x54]
000cc832  add     r2, sp, #0x50
000cc834  ldm     r2, {r2, r3}
000cc836  mov     r0, r4
000cc838  str     r2, [sp, #4]
000cc83a  str     r3, [sp, #8]
000cc83c  mov     r2, r6
000cc83e  mov     r3, r5
000cc840  blx     #0xddbfc ; -> objc_msgSend
000cc844  mov     r1, sl
000cc846  mov     r0, r4
000cc848  blx     #0xddbfc ; -> objc_msgSend
000cc84c  ldr     r6, [pc, #0x15c]
000cc84e  movs    r3, #0
000cc850  ldr     r5, [pc, #0x15c]
000cc852  str     r3, [sp, #0x58]
000cc854  movs    r2, #1
000cc856  str     r2, [sp]
000cc858  add     r6, pc ; -> 0x00181904  
000cc85a  add     r5, pc ; -> 0x001818f4  
000cc85c  ldr     r1, [sp, #0xc]
000cc85e  str     r0, [sp, #0x5c]
000cc860  add     r2, sp, #0x58
000cc862  ldm     r2, {r2, r3}
000cc864  mov     r0, r4
000cc866  str     r2, [sp, #4]
000cc868  str     r3, [sp, #8]
000cc86a  mov     r2, r6
000cc86c  mov     r3, r5
000cc86e  blx     #0xddbfc ; -> objc_msgSend
000cc872  mov     r1, sl
000cc874  mov     r0, r4
000cc876  blx     #0xddbfc ; -> objc_msgSend
000cc87a  ldr     r6, [pc, #0x138]
000cc87c  movs    r3, #0
000cc87e  ldr     r5, [pc, #0x138]
000cc880  str     r3, [sp, #0x60]
000cc882  movs    r2, #1
000cc884  str     r2, [sp]
000cc886  add     r6, pc ; -> 0x00181914  
000cc888  add     r5, pc ; -> 0x0017ffb4  
000cc88a  ldr     r1, [sp, #0xc]
000cc88c  str     r0, [sp, #0x64]
000cc88e  add     r2, sp, #0x60
000cc890  ldm     r2, {r2, r3}
000cc892  mov     r0, r4
000cc894  str     r2, [sp, #4]
000cc896  str     r3, [sp, #8]
000cc898  mov     r2, r6
000cc89a  mov     r3, r5
000cc89c  blx     #0xddbfc ; -> objc_msgSend
000cc8a0  mov     r1, sl
000cc8a2  mov     r0, r4
000cc8a4  blx     #0xddbfc ; -> objc_msgSend
000cc8a8  ldr     r6, [pc, #0x110]
000cc8aa  movs    r3, #0
000cc8ac  ldr     r5, [pc, #0x110]
000cc8ae  str     r3, [sp, #0x68]
000cc8b0  movs    r2, #1
000cc8b2  str     r2, [sp]
000cc8b4  add     r6, pc ; -> 0x00181924  
000cc8b6  add     r5, pc ; -> 0x0017ffc4  
000cc8b8  ldr     r1, [sp, #0xc]
000cc8ba  str     r0, [sp, #0x6c]
000cc8bc  add     r2, sp, #0x68
000cc8be  ldm     r2, {r2, r3}
000cc8c0  mov     r0, r4
000cc8c2  str     r2, [sp, #4]
000cc8c4  str     r3, [sp, #8]
000cc8c6  mov     r2, r6
000cc8c8  mov     r3, r5
000cc8ca  blx     #0xddbfc ; -> objc_msgSend
000cc8ce  mov     r1, sl
000cc8d0  mov     r0, r4
000cc8d2  blx     #0xddbfc ; -> objc_msgSend
000cc8d6  ldr     r6, [pc, #0xec]
000cc8d8  movs    r3, #0
000cc8da  ldr     r5, [pc, #0xec]
000cc8dc  str     r3, [sp, #0x70]
000cc8de  movs    r2, #1
000cc8e0  str     r2, [sp]
000cc8e2  add     r6, pc ; -> 0x00181944  
000cc8e4  add     r5, pc ; -> 0x00181934  
000cc8e6  ldr     r1, [sp, #0xc]
000cc8e8  str     r0, [sp, #0x74]
000cc8ea  add     r2, sp, #0x70
000cc8ec  ldm     r2, {r2, r3}
000cc8ee  mov     r0, r4
000cc8f0  str     r2, [sp, #4]
000cc8f2  str     r3, [sp, #8]
000cc8f4  mov     r2, r6
000cc8f6  mov     r3, r5
000cc8f8  blx     #0xddbfc ; -> objc_msgSend
000cc8fc  mov     r1, sl
000cc8fe  mov     r0, r4
000cc900  blx     #0xddbfc ; -> objc_msgSend
000cc904  ldr     r6, [pc, #0xc4]
000cc906  ldr     r5, [pc, #0xc8]
000cc908  movs    r3, #1
000cc90a  add     r6, pc ; -> 0x00181964  
000cc90c  add     r5, pc ; -> 0x00181954  
000cc90e  str     r3, [sp]
000cc910  ldr     r1, [sp, #0xc]
000cc912  mov     r2, r6
000cc914  mov     r3, r5
000cc916  mov.w   sl, #0
000cc91a  mov     fp, r0
000cc91c  mov     r0, r4
000cc91e  str.w   sl, [sp, #4]
000cc922  str.w   fp, [sp, #8]
000cc926  blx     #0xddbfc ; -> objc_msgSend
000cc92a  mov     r0, r4
000cc92c  sub.w   sp, r7, #0x18
000cc930  pop.w   {r8, sl, fp}
000cc934  pop     {r4, r5, r6, r7, pc}
000cc936  nop     
000cc938  asrs    r4, r6, #5
000cc93a  movs    r3, r0
000cc93c  str     r2, [r6, r7]
000cc93e  movs    r3, r1
000cc940  lsls    r0, r2, #0x14
000cc942  movs    r3, r0
000cc944  cmp     r6, r3
000cc946  movs    r3, r1
000cc948  asrs    r0, r3, #0x17
000cc94a  movs    r3, r0
000cc94c  asrs    r6, r1, #5
000cc94e  movs    r3, r0
000cc950  lsls    r6, r0, #0x11
000cc952  movs    r3, r0
000cc954  movs    r2, #0x52
000cc956  movs    r3, r1
000cc958  str     r0, [r0, r7]
000cc95a  movs    r3, r1
000cc95c  str     r0, [r7, r6]
000cc95e  movs    r3, r1
000cc960  str     r6, [r4, r6]
000cc962  movs    r3, r1
000cc964  str     r6, [r0, r6]
000cc966  movs    r3, r1
000cc968  adds    r7, #0x94
000cc96a  movs    r3, r1
000cc96c  str     r0, [r5, r5]
000cc96e  movs    r3, r1
000cc970  movs    r0, #0xa6
000cc972  movs    r3, r1
000cc974  str     r2, [r1, r5]
000cc976  movs    r3, r1
000cc978  cmp     r0, r7
000cc97a  movs    r3, r1
000cc97c  str     r4, [r5, r4]
000cc97e  movs    r3, r1
000cc980  cmp     r4, #0xfa
000cc982  movs    r3, r1
000cc984  str     r6, [r1, r4]
000cc986  movs    r3, r1
000cc988  movs    r4, #0x8c
000cc98a  movs    r3, r1
000cc98c  str     r0, [r6, r3]
000cc98e  movs    r3, r1
000cc990  movs    r4, #0x6e
000cc992  movs    r3, r1
000cc994  str     r2, [r4, r3]
000cc996  movs    r3, r1
000cc998  str     r0, [r2, r3]
000cc99a  movs    r3, r1
000cc99c  str     r4, [r0, r3]
000cc99e  movs    r3, r1
000cc9a0  adds    r7, #0xa2
000cc9a2  movs    r3, r1
000cc9a4  str     r6, [r6, r2]
000cc9a6  movs    r3, r1
000cc9a8  str     r4, [r4, r2]
000cc9aa  movs    r3, r1
000cc9ac  str     r0, [r5, r2]
000cc9ae  movs    r3, r1
000cc9b0  str     r6, [r2, r2]
000cc9b2  movs    r3, r1
000cc9b4  str     r2, [r1, r2]
000cc9b6  movs    r3, r1
000cc9b8  adds    r7, #0x28
000cc9ba  movs    r3, r1
000cc9bc  str     r4, [r5, r1]
000cc9be  movs    r3, r1
000cc9c0  adds    r7, #0xa
000cc9c2  movs    r3, r1
000cc9c4  str     r6, [r3, r1]
000cc9c6  movs    r3, r1
000cc9c8  str     r4, [r1, r1]
000cc9ca  movs    r3, r1
000cc9cc  str     r6, [r2, r1]
000cc9ce  movs    r3, r1
000cc9d0  str     r4, [r0, r1]
000cc9d2  movs    r3, r1
