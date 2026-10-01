========================================================================
-[SBJsonWriter appendDictionary  0x000d513c  768 bytes   SBJsonWriter.mm
========================================================================

000d513c  push    {r4, r5, r6, r7, lr}
000d513e  add     r7, sp, #0xc
000d5140  push.w  {r8, sl, fp}
000d5144  sub     sp, #0xa0
000d5146  mov     sl, r3
000d5148  ldr     r3, [pc, #0x274]
000d514a  str     r2, [sp, #4]
000d514c  mov     r6, r0
000d514e  add     r3, pc ; -> 0x000f32d8  OBJC_IVAR_$_SBJsonBase.maxDepth
000d5150  ldr     r1, [r3]
000d5152  ldr     r3, [r1]
000d5154  ldr     r3, [r0, r3]
000d5156  cmp     r3, #0
000d5158  beq.w   #0xd5384
000d515c  ldr     r3, [pc, #0x264]
000d515e  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d5160  ldr     r3, [r3]
000d5162  ldr     r3, [r3]
000d5164  ldr     r2, [r0, r3]
000d5166  adds    r2, #1
000d5168  str     r2, [r0, r3]
000d516a  ldr     r3, [r1]
000d516c  ldr     r3, [r0, r3]
000d516e  cmp     r2, r3
000d5170  bls.w   #0xd5384
000d5174  ldr.w   r1, [pc, #0x250]
000d5178  ldr.w   r3, [pc, #0x250]
000d517c  movs    r2, #7
000d517e  add     r1, pc ; -> 0x000fd91c  
000d5180  add     r3, pc ; -> 0x00182244  
000d5182  ldr     r1, [r1]
000d5184  blx     #0xddbfc ; -> objc_msgSend
000d5188  movs    r0, #0
000d518a  b       #0xd53b6
000d518c  ldr     r1, [pc, #0x240]
000d518e  add     r1, pc ; -> 0x00182254  
000d5190  str     r1, [sp, #8]
000d5192  ldr     r1, [pc, #0x240]
000d5194  ldr     r0, [sp, #4]
000d5196  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000d5198  ldr     r1, [r1]
000d519a  blx     #0xddbfc ; -> objc_msgSend
000d519e  ldr     r1, [pc, #0x238]
000d51a0  add     r1, pc ; -> 0x000fd74c  
000d51a2  ldr     r1, [r1]
000d51a4  str     r0, [sp, #0x34]
000d51a6  mov     r0, r6
000d51a8  blx     #0xddbfc ; -> objc_msgSend
000d51ac  tst.w   r0, #0xff
000d51b0  beq     #0xd51c6
000d51b2  ldr     r1, [pc, #0x228]
000d51b4  ldr     r2, [pc, #0x228]
000d51b6  ldr     r0, [sp, #0x34]
000d51b8  add     r1, pc ; -> 0x000fce88  'o=\x0e'
000d51ba  add     r2, pc ; -> 0x000fd16c  
000d51bc  ldr     r1, [r1]
000d51be  ldr     r2, [r2]
000d51c0  blx     #0xddbfc ; -> objc_msgSend
000d51c4  str     r0, [sp, #0x34]
000d51c6  ldr     r1, [pc, #0x21c]
000d51c8  movs    r3, #0x10
000d51ca  add     r2, sp, #0x80
000d51cc  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d51ce  str     r3, [sp]
000d51d0  ldr     r1, [r1]
000d51d2  ldr     r0, [sp, #0x34]
000d51d4  add     r3, sp, #0x40
000d51d6  movs    r4, #0
000d51d8  str     r1, [sp, #0x10]
000d51da  str     r4, [sp, #0x80]
000d51dc  str     r4, [sp, #0x84]
000d51de  str     r4, [sp, #0x88]
000d51e0  str     r4, [sp, #0x8c]
000d51e2  str     r4, [sp, #0x90]
000d51e4  str     r4, [sp, #0x94]
000d51e6  str     r4, [sp, #0x98]
000d51e8  str     r4, [sp, #0x9c]
000d51ea  blx     #0xddbfc ; -> objc_msgSend
000d51ee  mov     r2, r0
000d51f0  cmp     r0, #0
000d51f2  beq.w   #0xd5334
000d51f6  ldr     r3, [sp, #0x88]
000d51f8  ldr     r0, [pc, #0x1ec]
000d51fa  ldr     r1, [r3]
000d51fc  add     r0, pc ; -> 0x000fdb5c  
000d51fe  str     r2, [sp, #0x38]
000d5200  ldr     r0, [r0]
000d5202  str     r1, [sp, #0x3c]
000d5204  ldr.w   r1, [pc, #0x1e4]
000d5208  str     r4, [sp, #0x30]
000d520a  str     r0, [sp, #0x1c]
000d520c  add     r1, pc ; -> 0x000fd904  
000d520e  ldr     r1, [r1]
000d5210  str     r1, [sp, #0x14]
000d5212  ldr     r1, [pc, #0x1dc]
000d5214  add     r1, pc ; -> 0x000fce80  '0\t\x0e'
000d5216  ldr     r1, [r1]
000d5218  str     r1, [sp, #0x18]
000d521a  ldr     r1, [pc, #0x1d8]
000d521c  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d521e  ldr     r1, [r1]
000d5220  str     r1, [sp, #0x20]
000d5222  ldr     r1, [pc, #0x1d4]
000d5224  add     r1, pc ; -> 0x000fd90c  'M\x17\x0f'
000d5226  ldr     r1, [r1]
000d5228  str     r1, [sp, #0x24]
000d522a  ldr     r1, [pc, #0x1d0]
000d522c  add     r1, pc ; -> 0x000fd924  
000d522e  ldr     r1, [r1]
000d5230  str     r1, [sp, #0x28]
000d5232  ldr     r1, [pc, #0x1cc]
000d5234  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d5236  ldr     r1, [r1]
000d5238  str     r1, [sp, #0x2c]
000d523a  b       #0xd523e
000d523c  ldr     r3, [sp, #0x88]
000d523e  mov.w   r8, #0
000d5242  b       #0xd5246
000d5244  ldr     r3, [sp, #0x88]
000d5246  ldr     r3, [r3]
000d5248  ldr     r2, [sp, #0x3c]
000d524a  cmp     r3, r2
000d524c  beq     #0xd5254
000d524e  ldr     r0, [sp, #0x34]
000d5250  blx     #0xddbe4 ; -> objc_enumerationMutation
000d5254  ldr     r0, [sp, #0x84]
000d5256  ldr     r3, [sp, #0x30]
000d5258  ldr.w   r5, [r0, r8, lsl #2]
000d525c  cbnz    r3, #0xd5264
000d525e  movs    r1, #1
000d5260  str     r1, [sp, #0x30]
000d5262  b       #0xd5270
000d5264  ldr     r2, [pc, #0x19c]
000d5266  mov     r0, sl
000d5268  mov     r1, fp
000d526a  add     r2, pc ; -> 0x0017fe54  
000d526c  blx     #0xddbfc ; -> objc_msgSend
000d5270  mov     r0, r6
000d5272  ldr     r1, [sp, #0xc]
000d5274  blx     #0xddbfc ; -> objc_msgSend
000d5278  tst.w   r0, #0xff
000d527c  beq     #0xd5290
000d527e  ldr     r1, [sp, #0x14]
000d5280  mov     r0, r6
000d5282  blx     #0xddbfc ; -> objc_msgSend
000d5286  mov     r1, fp
000d5288  mov     r2, r0
000d528a  mov     r0, sl
000d528c  blx     #0xddbfc ; -> objc_msgSend
000d5290  ldr     r1, [sp, #0x20]
000d5292  ldr     r0, [sp, #0x1c]
000d5294  blx     #0xddbfc ; -> objc_msgSend
000d5298  ldr     r1, [sp, #0x18]
000d529a  mov     r2, r0
000d529c  mov     r0, r5
000d529e  blx     #0xddbfc ; -> objc_msgSend
000d52a2  uxtb    r4, r0
000d52a4  cbnz    r4, #0xd52b4
000d52a6  ldr     r1, [pc, #0x160]
000d52a8  ldr     r3, [pc, #0x160]
000d52aa  mov     r0, r6
000d52ac  add     r1, pc ; -> 0x000fd91c  
000d52ae  add     r3, pc ; -> 0x00182264  
000d52b0  ldr     r1, [r1]
000d52b2  b       #0xd530a
000d52b4  mov     r0, r6
000d52b6  ldr     r1, [sp, #0x24]
000d52b8  mov     r2, r5
000d52ba  mov     r3, sl
000d52bc  blx     #0xddbfc ; -> objc_msgSend
000d52c0  uxtb    r0, r0
000d52c2  cmp     r0, #0
000d52c4  beq     #0xd53b6
000d52c6  mov     r0, sl
000d52c8  mov     r1, fp
000d52ca  ldr     r2, [sp, #8]
000d52cc  blx     #0xddbfc ; -> objc_msgSend
000d52d0  ldr     r1, [sp, #0x2c]
000d52d2  mov     r2, r5
000d52d4  ldr     r0, [sp, #4]
000d52d6  blx     #0xddbfc ; -> objc_msgSend
000d52da  ldr     r1, [sp, #0x28]
000d52dc  mov     r3, sl
000d52de  mov     r2, r0
000d52e0  mov     r0, r6
000d52e2  blx     #0xddbfc ; -> objc_msgSend
000d52e6  uxtb    r4, r0
000d52e8  cbnz    r4, #0xd5314
000d52ea  ldr     r1, [pc, #0x124]
000d52ec  ldr     r2, [pc, #0x124]
000d52ee  mov     r3, r5
000d52f0  add     r1, pc ; -> 0x000fd91c  
000d52f2  add     r2, pc ; -> 0x00182274  
000d52f4  ldr.w   r8, [r1]
000d52f8  ldr     r1, [pc, #0x11c]
000d52fa  ldr     r0, [sp, #0x1c]
000d52fc  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d52fe  ldr     r1, [r1]
000d5300  blx     #0xddbfc ; -> objc_msgSend
000d5304  mov     r1, r8
000d5306  mov     r3, r0
000d5308  mov     r0, r6
000d530a  movs    r2, #1
000d530c  blx     #0xddbfc ; -> objc_msgSend
000d5310  mov     r0, r4
000d5312  b       #0xd53b6
000d5314  ldr     r2, [sp, #0x38]
000d5316  add.w   r8, r8, #1
000d531a  cmp     r2, r8
000d531c  bhi     #0xd5244
000d531e  movs    r3, #0x10
000d5320  ldr     r0, [sp, #0x34]
000d5322  str     r3, [sp]
000d5324  ldr     r1, [sp, #0x10]
000d5326  add     r2, sp, #0x80
000d5328  add     r3, sp, #0x40
000d532a  blx     #0xddbfc ; -> objc_msgSend
000d532e  str     r0, [sp, #0x38]
000d5330  cmp     r0, #0
000d5332  bne     #0xd523c
000d5334  ldr     r3, [pc, #0xe4]
000d5336  mov     r0, r6
000d5338  ldr     r1, [sp, #0xc]
000d533a  add     r3, pc ; -> 0x000f32dc  OBJC_IVAR_$_SBJsonBase.depth
000d533c  ldr     r3, [r3]
000d533e  ldr     r2, [r3]
000d5340  ldr     r3, [r6, r2]
000d5342  subs    r3, #1
000d5344  str     r3, [r6, r2]
000d5346  blx     #0xddbfc ; -> objc_msgSend
000d534a  tst.w   r0, #0xff
000d534e  beq     #0xd5374
000d5350  ldr     r1, [pc, #0xcc]
000d5352  ldr     r0, [sp, #4]
000d5354  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d5356  ldr     r1, [r1]
000d5358  blx     #0xddbfc ; -> objc_msgSend
000d535c  cbz     r0, #0xd5374
000d535e  ldr     r1, [pc, #0xc4]
000d5360  mov     r0, r6
000d5362  add     r1, pc ; -> 0x000fd904  
000d5364  ldr     r1, [r1]
000d5366  blx     #0xddbfc ; -> objc_msgSend
000d536a  mov     r1, fp
000d536c  mov     r2, r0
000d536e  mov     r0, sl
000d5370  blx     #0xddbfc ; -> objc_msgSend
000d5374  ldr     r2, [pc, #0xb0]
000d5376  mov     r0, sl
000d5378  mov     r1, fp
000d537a  add     r2, pc ; -> 0x00182284  
000d537c  blx     #0xddbfc ; -> objc_msgSend
000d5380  movs    r0, #1
000d5382  b       #0xd53b6
000d5384  ldr     r1, [pc, #0xa4]
000d5386  ldr     r2, [pc, #0xa8]
000d5388  mov     r0, sl
000d538a  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d538c  add     r2, pc ; -> 0x00182294  
000d538e  ldr.w   fp, [r1]
000d5392  mov     r1, fp
000d5394  blx     #0xddbfc ; -> objc_msgSend
000d5398  ldr     r1, [pc, #0x98]
000d539a  mov     r0, r6
000d539c  add     r1, pc ; -> 0x000fd754  
000d539e  ldr     r1, [r1]
000d53a0  str     r1, [sp, #0xc]
000d53a2  blx     #0xddbfc ; -> objc_msgSend
000d53a6  tst.w   r0, #0xff
000d53aa  bne.w   #0xd518c
000d53ae  ldr     r3, [pc, #0x88]
000d53b0  add     r3, pc ; -> 0x001809d4  
000d53b2  str     r3, [sp, #8]
000d53b4  b       #0xd5192
000d53b6  sub.w   sp, r7, #0x18
000d53ba  pop.w   {r8, sl, fp}
000d53be  pop     {r4, r5, r6, r7, pc}
000d53c0  b       #0xd56d0
000d53c2  movs    r1, r0
000d53c4  b       #0xd56bc
000d53c6  movs    r1, r0
000d53c8  strh    r2, [r3, #0x3c]
000d53ca  movs    r2, r0
000d53cc  beq     #0xd5350
000d53ce  movs    r2, r1
000d53d0  beq     #0xd5358
000d53d2  movs    r2, r1
000d53d4  ldrb    r6, [r2, #0x13]
000d53d6  movs    r2, r0
000d53d8  strh    r0, [r5, #0x2c]
000d53da  movs    r2, r0
000d53dc  ldrb    r4, [r1, #0x13]
000d53de  movs    r2, r0
000d53e0  ldrb    r6, [r5, #0x1e]
000d53e2  movs    r2, r0
000d53e4  strb    r0, [r1, #0x1f]
000d53e6  movs    r2, r0
000d53e8  ldrh    r4, [r3, #0xa]
000d53ea  movs    r2, r0
000d53ec  strh    r4, [r6, #0x36]
000d53ee  movs    r2, r0
000d53f0  ldrb    r0, [r5, #0x11]
000d53f2  movs    r2, r0
000d53f4  strb    r4, [r5, #0x1f]
000d53f6  movs    r2, r0
000d53f8  strh    r4, [r4, #0x36]
000d53fa  movs    r2, r0
000d53fc  strh    r4, [r6, #0x36]
000d53fe  movs    r2, r0
000d5400  ldrb    r4, [r3, #2]
000d5402  movs    r2, r0
000d5404  add     r3, sp, #0x398
000d5406  movs    r2, r1
000d5408  strh    r4, [r5, #0x32]
000d540a  movs    r2, r0
000d540c  ldm     r7, {r1, r4, r5, r7}
000d540e  movs    r2, r1
000d5410  strh    r0, [r5, #0x30]
000d5412  movs    r2, r0
000d5414  ldm     r7!, {r1, r2, r3, r4, r5, r6}
000d5416  movs    r2, r1
000d5418  strb    r0, [r4, #0x1e]
000d541a  movs    r2, r0
000d541c  svc     #0x9e
000d541e  movs    r1, r0
000d5420  strb    r0, [r5, #0x1c]
000d5422  movs    r2, r0
000d5424  strh    r6, [r3, #0x2c]
000d5426  movs    r2, r0
000d5428  ldm     r7!, {r1, r2}
000d542a  movs    r2, r1
000d542c  ldrb    r6, [r5, #0xb]
000d542e  movs    r2, r0
000d5430  ldm     r7!, {r2}
000d5432  movs    r2, r1
000d5434  strh    r4, [r6, #0x1c]
000d5436  movs    r2, r0
