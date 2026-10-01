========================================================================
GetEventsData  0x000b607c  864 bytes   EAMTX_Main.mm
========================================================================

000b607c  push    {r4, r5, r6, r7, lr}
000b607e  add     r7, sp, #0xc
000b6080  push.w  {r8, sl, fp}
000b6084  sub     sp, #0x10
000b6086  ldr     r1, [pc, #0x290]
000b6088  ldr.w   r8, [pc, #0x290]
000b608c  ldr     r3, [pc, #0x290]
000b608e  add     r1, pc ; -> 0x000fd670  
000b6090  add     r8, pc ; -> 0x0038c0e8  mtxUserInfo
000b6092  ldr     r5, [r1]
000b6094  ldr     r1, [pc, #0x28c]
000b6096  add     r3, pc ; -> 0x0038c0e4  mtxController
000b6098  str     r3, [sp]
000b609a  add     r1, pc ; -> 0x000fd65c  
000b609c  ldr.w   r0, [r8]
000b60a0  ldr     r4, [r1]
000b60a2  ldr     r6, [r3]
000b60a4  ldr.w   fp, [pc, #0x280]
000b60a8  mov     r1, r4
000b60aa  blx     #0xddbfc ; -> objc_msgSend
000b60ae  ldr     r1, [pc, #0x27c]
000b60b0  add     fp, pc ; -> 0x0017e5c4  
000b60b2  add     r1, pc ; -> 0x000fd674  
000b60b4  ldr     r1, [r1]
000b60b6  blx     #0xddbfc ; -> objc_msgSend
000b60ba  mov     r1, r5
000b60bc  mov     r2, r0
000b60be  mov     r0, r6
000b60c0  blx     #0xddbfc ; -> objc_msgSend
000b60c4  mov     r1, r4
000b60c6  ldr.w   r0, [r8]
000b60ca  blx     #0xddbfc ; -> objc_msgSend
000b60ce  ldr     r1, [pc, #0x260]
000b60d0  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000b60d2  ldr     r1, [r1]
000b60d4  str     r1, [sp, #4]
000b60d6  blx     #0xddbfc ; -> objc_msgSend
000b60da  ldr     r1, [pc, #0x258]
000b60dc  ldr.w   r0, [r8]
000b60e0  add     r1, pc ; -> 0x000fd66c  
000b60e2  ldr     r1, [r1]
000b60e4  blx     #0xddbfc ; -> objc_msgSend
000b60e8  ldr     r1, [sp, #4]
000b60ea  blx     #0xddbfc ; -> objc_msgSend
000b60ee  ldr     r1, [pc, #0x248]
000b60f0  ldr     r0, [pc, #0x248]
000b60f2  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b60f4  add     r0, pc ; -> 0x000fdbf4  
000b60f6  ldr     r1, [r1]
000b60f8  ldr     r0, [r0]
000b60fa  str     r1, [sp, #8]
000b60fc  blx     #0xddbfc ; -> objc_msgSend
000b6100  ldr     r1, [pc, #0x23c]
000b6102  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6104  ldr     r1, [r1]
000b6106  str     r1, [sp, #0xc]
000b6108  blx     #0xddbfc ; -> objc_msgSend
000b610c  ldr     r1, [pc, #0x234]
000b610e  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b6110  ldr     r5, [r1]
000b6112  ldr     r1, [pc, #0x234]
000b6114  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6116  ldr     r4, [r1]
000b6118  ldr     r1, [pc, #0x230]
000b611a  add     r1, pc ; -> 0x000fd6b0  
000b611c  ldr     r1, [r1]
000b611e  mov     r6, r0
000b6120  ldr     r0, [pc, #0x22c]
000b6122  add     r0, pc ; -> 0x000fdb5c  
000b6124  ldr.w   sl, [r0]
000b6128  ldr.w   r0, [r8]
000b612c  blx     #0xddbfc ; -> objc_msgSend
000b6130  mov     r1, r4
000b6132  mov     r2, fp
000b6134  mov     r3, r0
000b6136  mov     r0, sl
000b6138  blx     #0xddbfc ; -> objc_msgSend
000b613c  ldr     r3, [pc, #0x214]
000b613e  mov     r1, r5
000b6140  add     r3, pc ; -> 0x0017e974  
000b6142  mov     r2, r0
000b6144  mov     r0, r6
000b6146  blx     #0xddbfc ; -> objc_msgSend
000b614a  ldr     r1, [pc, #0x20c]
000b614c  ldr.w   r0, [r8]
000b6150  add     r1, pc ; -> 0x000fd6a4  
000b6152  ldr     r1, [r1]
000b6154  blx     #0xddbfc ; -> objc_msgSend
000b6158  mov     r1, r4
000b615a  mov     r2, fp
000b615c  mov     r3, r0
000b615e  mov     r0, sl
000b6160  blx     #0xddbfc ; -> objc_msgSend
000b6164  ldr     r3, [pc, #0x1f4]
000b6166  mov     r1, r5
000b6168  add     r3, pc ; -> 0x0017fed4  
000b616a  mov     r2, r0
000b616c  mov     r0, r6
000b616e  blx     #0xddbfc ; -> objc_msgSend
000b6172  ldr     r0, [pc, #0x1ec]
000b6174  ldr     r1, [pc, #0x1ec]
000b6176  add     r0, pc ; -> 0x000fdbb4  
000b6178  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000b617a  ldr     r0, [r0]
000b617c  ldr     r1, [r1]
000b617e  blx     #0xddbfc ; -> objc_msgSend
000b6182  bl      #0xb5f84 ; -> Z24GetUTCDateINStringFormatP6NSDate
000b6186  ldr     r3, [pc, #0x1e0]
000b6188  mov     r1, r5
000b618a  add     r3, pc ; -> 0x0017fee4  
000b618c  mov     r2, r0
000b618e  mov     r0, r6
000b6190  blx     #0xddbfc ; -> objc_msgSend
000b6194  ldr     r0, [pc, #0x1d4]
000b6196  ldr     r1, [pc, #0x1d8]
000b6198  add     r0, pc ; -> 0x000fdc84  
000b619a  add     r1, pc ; -> 0x000fd598  
000b619c  ldr     r0, [r0]
000b619e  ldr     r1, [r1]
000b61a0  blx     #0xddbfc ; -> objc_msgSend
000b61a4  ldr     r1, [pc, #0x1cc]
000b61a6  add     r1, pc ; -> 0x000fd594  
000b61a8  ldr     r1, [r1]
000b61aa  blx     #0xddbfc ; -> objc_msgSend
000b61ae  ldr     r3, [pc, #0x1c8]
000b61b0  mov     r1, r5
000b61b2  add     r3, pc ; -> 0x0017fef4  
000b61b4  mov     r2, r0
000b61b6  mov     r0, r6
000b61b8  blx     #0xddbfc ; -> objc_msgSend
000b61bc  ldr     r2, [pc, #0x1bc]
000b61be  ldr     r3, [pc, #0x1c0]
000b61c0  mov     r0, r6
000b61c2  add     r2, pc ; -> 0x0038c0f8  connectionType
000b61c4  add     r3, pc ; -> 0x0017ff04  
000b61c6  ldr     r2, [r2]
000b61c8  mov     r1, r5
000b61ca  blx     #0xddbfc ; -> objc_msgSend
000b61ce  ldr     r1, [pc, #0x1b4]
000b61d0  ldr.w   r0, [r8]
000b61d4  add     r1, pc ; -> 0x000fd58c  
000b61d6  ldr     r1, [r1]
000b61d8  blx     #0xddbfc ; -> objc_msgSend
000b61dc  ldr     r3, [pc, #0x1a8]
000b61de  mov     r1, r5
000b61e0  add     r3, pc ; -> 0x0017ff14  
000b61e2  mov     r2, r0
000b61e4  mov     r0, r6
000b61e6  blx     #0xddbfc ; -> objc_msgSend
000b61ea  ldr     r1, [pc, #0x1a0]
000b61ec  ldr.w   r0, [r8]
000b61f0  ldr.w   r8, [pc, #0x19c]
000b61f4  add     r1, pc ; -> 0x000fd5d8  
000b61f6  ldr     r1, [r1]
000b61f8  blx     #0xddbfc ; -> objc_msgSend
000b61fc  mov     r1, r4
000b61fe  mov     r2, fp
000b6200  add     r8, pc ; -> 0x0038c118  eventsToPost
000b6202  mov     r3, r0
000b6204  mov     r0, sl
000b6206  blx     #0xddbfc ; -> objc_msgSend
000b620a  ldr     r3, [pc, #0x188]
000b620c  mov     r1, r5
000b620e  add     r3, pc ; -> 0x0017ff24  
000b6210  mov     r2, r0
000b6212  mov     r0, r6
000b6214  blx     #0xddbfc ; -> objc_msgSend
000b6218  ldr     r0, [pc, #0x17c]
000b621a  ldr     r1, [pc, #0x180]
000b621c  add     r0, pc ; -> 0x000fdb50  
000b621e  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000b6220  ldr     r0, [r0]
000b6222  ldr     r1, [r1]
000b6224  blx     #0xddbfc ; -> objc_msgSend
000b6228  ldr     r1, [pc, #0x174]
000b622a  add     r1, pc ; -> 0x000fc9ec  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x74
000b622c  ldr     r1, [r1]
000b622e  blx     #0xddbfc ; -> objc_msgSend
000b6232  ldr     r3, [pc, #0x170]
000b6234  mov     r1, r5
000b6236  add     r3, pc ; -> 0x0017ff34  
000b6238  mov     r2, r0
000b623a  mov     r0, r6
000b623c  blx     #0xddbfc ; -> objc_msgSend
000b6240  ldr     r3, [pc, #0x164]
000b6242  mov     r1, r4
000b6244  mov     r2, fp
000b6246  add     r3, pc ; -> 0x0038c158  pCount
000b6248  mov     r0, sl
000b624a  ldr     r3, [r3]
000b624c  blx     #0xddbfc ; -> objc_msgSend
000b6250  ldr     r3, [pc, #0x158]
000b6252  mov     r1, r5
000b6254  add     r3, pc ; -> 0x0017ff44  
000b6256  mov     r2, r0
000b6258  mov     r0, r6
000b625a  blx     #0xddbfc ; -> objc_msgSend
000b625e  ldr     r2, [pc, #0x150]
000b6260  ldr     r3, [pc, #0x150]
000b6262  mov     r0, r6
000b6264  add     r2, pc ; -> 0x0017ff54  
000b6266  add     r3, pc ; -> 0x0017ff64  
000b6268  mov     r1, r5
000b626a  blx     #0xddbfc ; -> objc_msgSend
000b626e  ldr     r2, [pc, #0x148]
000b6270  ldr     r3, [pc, #0x148]
000b6272  mov     r0, r6
000b6274  add     r2, pc ; -> 0x0017ff74  
000b6276  add     r3, pc ; -> 0x0017ff84  
000b6278  mov     r1, r5
000b627a  blx     #0xddbfc ; -> objc_msgSend
000b627e  ldr     r1, [pc, #0x140]
000b6280  ldr     r3, [sp]
000b6282  ldr.w   r2, [r8]
000b6286  add     r1, pc ; -> 0x000fd590  
000b6288  ldr     r0, [r3]
000b628a  ldr     r1, [r1]
000b628c  blx     #0xddbfc ; -> objc_msgSend
000b6290  mov     r4, r0
000b6292  cbz     r0, #0xb62ca
000b6294  ldr     r1, [pc, #0x12c]
000b6296  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b6298  ldr.w   sl, [r1]
000b629c  mov     r1, sl
000b629e  blx     #0xddbfc ; -> objc_msgSend
000b62a2  cbz     r0, #0xb62ca
000b62a4  ldr     r3, [pc, #0x120]
000b62a6  mov     r0, r6
000b62a8  mov     r1, r5
000b62aa  add     r3, pc ; -> 0x0017ff94  
000b62ac  mov     r2, r4
000b62ae  blx     #0xddbfc ; -> objc_msgSend
000b62b2  mov     r1, sl
000b62b4  mov     r0, r4
000b62b6  blx     #0xddbfc ; -> objc_msgSend
000b62ba  ldr     r1, [pc, #0x110]
000b62bc  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b62be  ldr     r1, [r1]
000b62c0  str.w   r0, [r8]
000b62c4  mov     r0, r4
000b62c6  blx     #0xddbfc ; -> objc_msgSend
000b62ca  ldr     r0, [pc, #0x104]
000b62cc  ldr     r1, [sp, #8]
000b62ce  add     r0, pc ; -> 0x000fdc70  
000b62d0  ldr     r0, [r0]
000b62d2  blx     #0xddbfc ; -> objc_msgSend
000b62d6  ldr     r1, [sp, #0xc]
000b62d8  blx     #0xddbfc ; -> objc_msgSend
000b62dc  ldr     r1, [pc, #0xf4]
000b62de  mov     r2, r6
000b62e0  add     r1, pc ; -> 0x000fd5dc  
000b62e2  ldr     r1, [r1]
000b62e4  mov     r5, r0
000b62e6  blx     #0xddbfc ; -> objc_msgSend
000b62ea  ldr     r1, [pc, #0xec]
000b62ec  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000b62ee  ldr     r4, [r1]
000b62f0  mov     r1, r4
000b62f2  mov     r8, r0
000b62f4  mov     r0, r5
000b62f6  blx     #0xddbfc ; -> objc_msgSend
000b62fa  mov     r0, r6
000b62fc  ldr     r1, [sp, #4]
000b62fe  blx     #0xddbfc ; -> objc_msgSend
000b6302  mov     r0, r6
000b6304  mov     r1, r4
000b6306  blx     #0xddbfc ; -> objc_msgSend
000b630a  mov     r0, r8
000b630c  sub.w   sp, r7, #0x18
000b6310  pop.w   {r8, sl, fp}
000b6314  pop     {r4, r5, r6, r7, pc}
000b6316  nop     
000b6318  strb    r6, [r3, #0x17]
000b631a  movs    r4, r0
000b631c  str     r4, [r2, #4]
000b631e  movs    r5, r5
000b6320  str     r2, [r1, #4]
000b6322  movs    r5, r5
000b6324  strb    r6, [r7, #0x16]
000b6326  movs    r4, r0
000b6328  strh    r0, [r2, #0x28]
000b632a  movs    r4, r1
000b632c  strb    r6, [r7, #0x16]
000b632e  movs    r4, r0
000b6330  ldr     r0, [r7, #0x18]
000b6332  movs    r4, r0
000b6334  strb    r0, [r1, #0x16]
000b6336  movs    r4, r0
000b6338  ldr     r6, [r1, #8]
000b633a  movs    r4, r0
000b633c  ldrb    r4, [r7, #0xb]
000b633e  movs    r4, r0
000b6340  ldr     r2, [r7, #4]
000b6342  movs    r4, r0
000b6344  ldr     r6, [r0, #0x1c]
000b6346  movs    r4, r0
000b6348  ldr     r0, [r1, #0x18]
000b634a  movs    r4, r0
000b634c  strb    r2, [r2, #0x16]
000b634e  movs    r4, r0
000b6350  ldrb    r6, [r6, #8]
000b6352  movs    r4, r0
000b6354  ldrh    r0, [r6]
000b6356  movs    r4, r1
000b6358  strb    r0, [r2, #0x15]
000b635a  movs    r4, r0
000b635c  ldr     r5, [sp, #0x1a0]
000b635e  movs    r4, r1
000b6360  ldrb    r2, [r7, #8]
000b6362  movs    r4, r0
000b6364  ldr     r4, [r1, #0x24]
000b6366  movs    r4, r0
000b6368  ldr     r5, [sp, #0x158]
000b636a  movs    r4, r1
000b636c  ldrb    r0, [r5, #0xb]
000b636e  movs    r4, r0
000b6370  strb    r2, [r7, #0xf]
000b6372  movs    r4, r0
000b6374  strb    r2, [r5, #0xf]
000b6376  movs    r4, r0
000b6378  ldr     r5, [sp, #0xf8]
000b637a  movs    r4, r1
000b637c  ldrsh   r2, [r6, r4]
000b637e  movs    r5, r5
000b6380  ldr     r5, [sp, #0xf0]
000b6382  movs    r4, r1
000b6384  strb    r4, [r6, #0xe]
000b6386  movs    r4, r0
000b6388  ldr     r5, [sp, #0xc0]
000b638a  movs    r4, r1
000b638c  strb    r0, [r4, #0xf]
000b638e  movs    r4, r0
000b6390  ldrsh   r4, [r2, r4]
000b6392  movs    r5, r5
000b6394  ldr     r5, [sp, #0x48]
000b6396  movs    r4, r1
000b6398  ldrb    r0, [r6, #4]
000b639a  movs    r4, r0
000b639c  str     r6, [r1, #0x7c]
000b639e  movs    r4, r0
000b63a0  str     r6, [r7, #0x78]
000b63a2  movs    r4, r0
000b63a4  ldr     r4, [sp, #0x3e8]
000b63a6  movs    r4, r1
000b63a8  ldrsh   r6, [r1, r4]
000b63aa  movs    r5, r5
000b63ac  ldr     r4, [sp, #0x3b0]
000b63ae  movs    r4, r1
000b63b0  ldr     r4, [sp, #0x3b0]
000b63b2  movs    r4, r1
000b63b4  ldr     r4, [sp, #0x3e8]
000b63b6  movs    r4, r1
000b63b8  ldr     r4, [sp, #0x3f0]
000b63ba  movs    r4, r1
000b63bc  ldr     r5, [sp, #0x28]
000b63be  movs    r4, r1
000b63c0  strb    r6, [r0, #0xc]
000b63c2  movs    r4, r0
000b63c4  str     r6, [r4, #0x7c]
000b63c6  movs    r4, r0
000b63c8  ldr     r4, [sp, #0x398]
000b63ca  movs    r4, r1
000b63cc  str     r4, [r7, #0x68]
000b63ce  movs    r4, r0
000b63d0  ldrb    r6, [r3, #6]
000b63d2  movs    r4, r0
000b63d4  strb    r0, [r7, #0xb]
000b63d6  movs    r4, r0
000b63d8  str     r4, [r1, #0x68]
000b63da  movs    r4, r0
