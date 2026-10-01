========================================================================
+[NSData(MBBase64) dataWithBase64EncodedString  0x000a0034  87784 bytes   Base64Encode.mm
========================================================================

000a0034  push    {r4, r5, r6, r7, lr}
000a0036  add     r7, sp, #0xc
000a0038  push.w  {r8, sl, fp}
000a003c  sub     sp, #8
000a003e  mov     r5, r2
000a0040  cmp     r2, #0
000a0042  beq.w   #0xa01a8
000a0046  ldr     r1, [pc, #0x1b0]
000a0048  mov     r0, r5
000a004a  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000a004c  ldr.w   r8, [r1]
000a0050  mov     r1, r8
000a0052  blx     #0xddbfc ; -> objc_msgSend
000a0056  cbz     r0, #0xa0084
000a0058  ldr.w   r4, [pc, #0x1a0]
000a005c  add     r4, pc ; -> 0x006bc12c  ZZ48+[NSData(MBBase64) dataWithBase64EncodedString:]E13decodingTable
000a005e  ldr     r6, [r4]
000a0060  cmp     r6, #0
000a0062  beq.w   #0xa016e
000a0066  ldr     r1, [pc, #0x198]
000a0068  mov     r0, r5
000a006a  movs    r2, #1
000a006c  add     r1, pc ; -> 0x000fcf68  
000a006e  ldr     r1, [r1]
000a0070  blx     #0xddbfc ; -> objc_msgSend
000a0074  str     r0, [sp]
000a0076  cbnz    r0, #0xa0098
000a0078  movs    r0, #0
000a007a  sub.w   sp, r7, #0x18
000a007e  pop.w   {r8, sl, fp}
000a0082  pop     {r4, r5, r6, r7, pc}
000a0084  ldr.w   r0, [pc, #0x17c]
000a0088  ldr     r1, [pc, #0x17c]
000a008a  add     r0, pc ; -> 0x000fdb6c  
000a008c  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000a008e  ldr     r0, [r0]
000a0090  ldr     r1, [r1]
000a0092  blx     #0xddbfc ; -> objc_msgSend
000a0096  b       #0xa007a
000a0098  mov     r1, r8
000a009a  mov     r0, r5
000a009c  blx     #0xddbfc ; -> objc_msgSend
000a00a0  adds    r0, #3
000a00a2  lsrs    r3, r0, #2
000a00a4  lsls    r0, r3, #1
000a00a6  adds    r0, r0, r3
000a00a8  blx     #0xddb84 ; -> malloc
000a00ac  mov     fp, r0
000a00ae  cmp     r0, #0
000a00b0  beq     #0xa0078
000a00b2  mov.w   sl, #0
000a00b6  mov     r8, sl
000a00b8  ldr     r1, [sp]
000a00ba  movs    r6, #0
000a00bc  add.w   r5, r8, r1
000a00c0  ldrb    r0, [r5]
000a00c2  cmp     r0, #0
000a00c4  beq     #0xa0166
000a00c6  sxtb    r0, r0
000a00c8  bics    r3, r0, #0x7f
000a00cc  bne     #0xa0156
000a00ce  ldr     r3, [pc, #0x13c]
000a00d0  lsls    r0, r0, #2
000a00d2  add     r3, pc ; -> 0x000f344c  0x0
000a00d4  ldr     r3, [r3]
000a00d6  adds    r0, r0, r3
000a00d8  ldr     r0, [r0, #0x34]
000a00da  lsrs    r0, r0, #0xe
000a00dc  and     r4, r0, #1
000a00e0  cbnz    r4, #0xa0104
000a00e2  ldrsb.w r2, [r5]
000a00e6  cmp     r2, #0x3d
000a00e8  beq     #0xa0104
000a00ea  ldr     r3, [pc, #0x124]
000a00ec  add     r3, pc ; -> 0x006bc12c  ZZ48+[NSData(MBBase64) dataWithBase64EncodedString:]E13decodingTable
000a00ee  ldr     r3, [r3]
000a00f0  ldrb    r2, [r2, r3]
000a00f2  cmp     r2, #0x7f
000a00f4  beq     #0xa01c6
000a00f6  add     r1, sp, #8
000a00f8  sxtah   r3, r1, r6
000a00fc  strb    r2, [r3, #-0x4]
000a0100  adds    r3, r6, #1
000a0102  uxth    r6, r3
000a0104  sxth    r3, r6
000a0106  adds    r5, #1
000a0108  cmp     r3, #3
000a010a  add.w   r8, r8, #1
000a010e  ble     #0xa00c0
000a0110  cmp     r3, #1
000a0112  beq     #0xa01ee
000a0114  ldrsb.w r0, [sp, #5]
000a0118  ldrsb.w r1, [sp, #4]
000a011c  asrs    r2, r0, #4
000a011e  cmp     r3, #2
000a0120  orr.w   r2, r2, r1, lsl #2
000a0124  strb.w  r2, [sl, fp]
000a0128  add.w   sl, sl, #1
000a012c  ble     #0xa00b8
000a012e  ldrsb.w r1, [sp, #6]
000a0132  asrs    r2, r1, #2
000a0134  cmp     r3, #3
000a0136  orr.w   r2, r2, r0, lsl #4
000a013a  strb.w  r2, [sl, fp]
000a013e  add.w   sl, sl, #1
000a0142  beq     #0xa00b8
000a0144  ldrb.w  r3, [sp, #7]
000a0148  orr.w   r3, r3, r1, lsl #6
000a014c  strb.w  r3, [sl, fp]
000a0150  add.w   sl, sl, #1
000a0154  b       #0xa00b8
000a0156  mov.w   r1, #0x4000
000a015a  blx     #0xdd614 ; -> maskrune
000a015e  subs    r4, r0, #0
000a0160  it      ne
000a0162  movne   r4, #1
000a0164  b       #0xa00e0
000a0166  cmp     r6, #0
000a0168  beq     #0xa01d0
000a016a  sxth    r3, r6
000a016c  b       #0xa0110
000a016e  mov.w   r0, #0x100
000a0172  blx     #0xddb84 ; -> malloc
000a0176  str     r0, [r4]
000a0178  cmp     r0, #0
000a017a  beq.w   #0xa0078
000a017e  movs    r1, #0x7f
000a0180  mov.w   r2, #0x100
000a0184  blx     #0xddbb4 ; -> memset
000a0188  ldr     r3, [pc, #0x88]
000a018a  ldr     r1, [r4]
000a018c  ldr     r0, [pc, #0x88]
000a018e  add     r3, pc ; -> 0x000e5e04  ZL13encodingTable
000a0190  movs    r2, #1
000a0192  ldrsb.w r3, [r3]
000a0196  strb    r6, [r3, r1]
000a0198  mov     r3, r0
000a019a  add     r3, pc
000a019c  ldrsb   r3, [r2, r3]
000a019e  strb    r2, [r3, r1]
000a01a0  adds    r2, #1
000a01a2  cmp     r2, #0x40
000a01a4  bne     #0xa0198
000a01a6  b       #0xa0066
000a01a8  ldr     r2, [pc, #0x70]
000a01aa  ldr     r0, [pc, #0x74]
000a01ac  ldr     r1, [pc, #0x74]
000a01ae  add     r2, pc ; -> 0x000f3450  0x0
000a01b0  ldr     r3, [pc, #0x74]
000a01b2  ldr     r2, [r2]
000a01b4  add     r0, pc ; -> 0x000fdb78  
000a01b6  add     r1, pc ; -> 0x000fcaa4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x12c
000a01b8  ldr     r0, [r0]
000a01ba  add     r3, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000a01bc  ldr     r1, [r1]
000a01be  ldr     r2, [r2]
000a01c0  blx     #0xddbfc ; -> objc_msgSend
000a01c4  b       #0xa0046
000a01c6  mov     r0, fp
000a01c8  blx     #0xdd7ac ; -> free
000a01cc  mov     r0, r4
000a01ce  b       #0xa007a
000a01d0  mov     r1, sl
000a01d2  mov     r0, fp
000a01d4  blx     #0xddcc8 ; -> realloc
000a01d8  ldr     r0, [pc, #0x50]
000a01da  ldr     r1, [pc, #0x54]
000a01dc  mov     r2, fp
000a01de  add     r0, pc ; -> 0x000fdb6c  
000a01e0  add     r1, pc ; -> 0x000fd03c  
000a01e2  mov     r3, sl
000a01e4  ldr     r1, [r1]
000a01e6  ldr     r0, [r0]
000a01e8  blx     #0xddbfc ; -> objc_msgSend
000a01ec  b       #0xa007a
000a01ee  mov     r0, fp
000a01f0  blx     #0xdd7ac ; -> free
000a01f4  movs    r0, #0
000a01f6  b       #0xa007a
000a01f8  ldm     r2!, {r1, r3, r5}
000a01fa  movs    r5, r0
000a01fc  stm     r0!, {r2, r3, r6, r7}
000a01fe  lsls    r1, r4, #1
000a0200  ldm     r6, {r3, r4, r5, r6, r7}
000a0202  movs    r5, r0
000a0204  bge     #0xa01c4
000a0206  movs    r5, r0
000a0208  ldm     r4!, {r2, r7}
000a020a  movs    r5, r0
000a020c  adds    r3, #0x76
000a020e  movs    r5, r0
000a0210  stm     r0!, {r2, r3, r4, r5}
000a0212  lsls    r1, r4, #1
000a0214  ldrb    r2, [r6, r1]
000a0216  movs    r4, r0
000a0218  ldrb    r6, [r4, r1]
000a021a  movs    r4, r0
000a021c  adds    r2, #0x9e
000a021e  movs    r5, r0
000a0220  bls     #0xa01a4
000a0222  movs    r5, r0
000a0224  ldm     r0!, {r1, r3, r5, r6, r7}
000a0226  movs    r5, r0
000a0228  b       #0xa0498
000a022a  movs    r5, r1
000a022c  bls     #0xa0144
000a022e  movs    r5, r0
000a0230  ldm     r6, {r3, r4, r6}
000a0232  movs    r5, r0
000a0234  cmp     r0, #4
000a0236  beq     #0xa0244
000a0238  cmp     r0, #5
000a023a  beq     #0xa024c
000a023c  cbz     r1, #0xa0254
000a023e  ldr     r0, [pc, #0x28]
000a0240  add     r0, pc ; -> 0x00176690  'CUSTOM_LAYOUT_6_BUTTONS'
000a0242  bx      lr
000a0244  cbz     r1, #0xa025a
000a0246  ldr     r0, [pc, #0x24]
000a0248  add     r0, pc ; -> 0x00176630  'CUSTOM_LAYOUT_4_BUTTONS'
000a024a  b       #0xa0242
000a024c  cbz     r1, #0xa0260
000a024e  ldr     r0, [pc, #0x20]
000a0250  add     r0, pc ; -> 0x00176660  'CUSTOM_LAYOUT_5_BUTTONS'
000a0252  b       #0xa0242
000a0254  ldr     r0, [pc, #0x1c]
000a0256  add     r0, pc ; -> 0x001766a8  'PRESET_LAYOUT_6_BUTTONS'
000a0258  b       #0xa0242
000a025a  ldr     r0, [pc, #0x1c]
000a025c  add     r0, pc ; -> 0x00176648  'PRESET_LAYOUT_4_BUTTONS'
000a025e  b       #0xa0242
000a0260  ldr     r0, [pc, #0x18]
000a0262  add     r0, pc ; -> 0x00176678  'PRESET_LAYOUT_5_BUTTONS'
000a0264  b       #0xa0242
000a0266  nop     
000a0268  str     r4, [r1, #0x44]
000a026a  movs    r5, r1
000a026c  str     r4, [r4, #0x3c]
000a026e  movs    r5, r1
000a0270  str     r4, [r1, #0x40]
000a0272  movs    r5, r1
000a0274  str     r6, [r1, #0x44]
000a0276  movs    r5, r1
000a0278  str     r0, [r5, #0x3c]
000a027a  movs    r5, r1
000a027c  str     r2, [r2, #0x40]
000a027e  movs    r5, r1
000a0280  ldr     r3, [pc, #0x20]
000a0282  ldr     r0, [pc, #0x24]
000a0284  movs    r2, #0
000a0286  add     r3, pc ; -> 0x00379c60  achievementTracker
000a0288  str     r2, [r3]
000a028a  movs    r3, #4
000a028c  mov     r2, r0
000a028e  add     r2, pc
000a0290  movs    r1, #0
000a0292  str     r1, [r3, r2]
000a0294  adds    r3, #4
000a0296  cmp     r3, #0x50
000a0298  bne     #0xa028c
000a029a  str     r1, [r2, #0x50]
000a029c  str     r1, [r2, #0x54]
000a029e  str     r1, [r2, #0x58]
000a02a0  str     r1, [r2, #0x5c]
000a02a2  bx      lr
000a02a4  ldr     r1, [sp, #0x358]
000a02a6  movs    r5, r5
000a02a8  ldr     r1, [sp, #0x338]
000a02aa  movs    r5, r5
000a02ac  ldr     r1, [pc, #0x18]
000a02ae  movs    r0, #0
000a02b0  mov     r2, r0
000a02b2  mov     r3, r1
000a02b4  add     r3, pc
000a02b6  ldr     r3, [r2, r3]
000a02b8  cmp     r3, #1
000a02ba  it      eq
000a02bc  addeq   r0, #1
000a02be  adds    r2, #4
000a02c0  cmp     r2, #0x50
000a02c2  bne     #0xa02b2
000a02c4  bx      lr
000a02c6  nop     
000a02c8  ldr     r1, [sp, #0x2a0]
000a02ca  movs    r5, r5
000a02cc  ldr     r3, [pc, #0x34]
000a02ce  add     r3, pc ; -> 0x000f349c  H
000a02d0  ldr     r2, [r3]
000a02d2  mov.w   r3, #0
000a02d6  strh    r3, [r2, #0x18]
000a02d8  strh    r3, [r2, #0x1c]
000a02da  strh    r3, [r2, #0x1a]
000a02dc  ldr     r3, [pc, #0x28]
000a02de  add     r3, pc ; -> 0x000f3454  theKode
000a02e0  ldr     r3, [r3]
000a02e2  ldr     r3, [r3]
000a02e4  cmp     r3, #2
000a02e6  itt     eq
000a02e8  moveq   r3, #1
000a02ea  strheq  r3, [r2, #0x18]
000a02ec  beq     #0xa0300
000a02ee  cmp     r3, #0x12
000a02f0  itt     eq
000a02f2  moveq   r3, #1
000a02f4  strheq  r3, [r2, #0x1a]
000a02f6  beq     #0xa0300
000a02f8  cbnz    r3, #0xa0300
000a02fa  mov.w   r3, #1
000a02fe  strh    r3, [r2, #0x1c]
000a0300  bx      lr
000a0302  nop     
000a0304  adds    r1, #0xca
000a0306  movs    r5, r0
000a0308  adds    r1, #0x72
000a030a  movs    r5, r0
000a030c  push    {r7, lr}
000a030e  add     r7, sp, #0
000a0310  ldr     r3, [pc, #0xf0]
000a0312  add     r3, pc ; -> 0x000f3454  theKode
000a0314  ldr     r3, [r3]
000a0316  ldr     r3, [r3]
000a0318  subs    r3, #3
000a031a  cmp     r3, #9
000a031c  bhi     #0xa032e
000a031e  tbb     [pc, r3]
000a0322  asrs    r5, r1, #0x14
000a0324  movs    r5, #0x1d
000a0326  adds    r5, #0x2d
000a0328  cmp     r5, r7
000a032a  strb    r5, [r1, r5]
000a032c  movs    r6, r0
000a032e  ldr     r3, [pc, #0xd8]
000a0330  add     r3, pc ; -> 0x000f369c  GameMode
000a0332  ldr     r3, [r3]
000a0334  ldr     r3, [r3]
000a0336  cmp     r3, #1
000a0338  beq     #0xa03dc
000a033a  pop     {r7, pc}
000a033c  ldr     r3, [pc, #0xcc]
000a033e  movs    r0, #1
000a0340  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0342  ldr     r3, [r3]
000a0344  str     r0, [r3]
000a0346  bl      #0xb07d4 ; -> sendLevelPacket
000a034a  b       #0xa033a
000a034c  ldr     r3, [pc, #0xc0]
000a034e  movs    r0, #0xa
000a0350  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0352  ldr     r3, [r3]
000a0354  str     r0, [r3]
000a0356  bl      #0xb07d4 ; -> sendLevelPacket
000a035a  b       #0xa033a
000a035c  ldr     r3, [pc, #0xb4]
000a035e  movs    r0, #0
000a0360  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0362  ldr     r3, [r3]
000a0364  str     r0, [r3]
000a0366  bl      #0xb07d4 ; -> sendLevelPacket
000a036a  b       #0xa033a
000a036c  ldr     r3, [pc, #0xa8]
000a036e  movs    r0, #4
000a0370  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0372  ldr     r3, [r3]
000a0374  str     r0, [r3]
000a0376  bl      #0xb07d4 ; -> sendLevelPacket
000a037a  b       #0xa033a
000a037c  ldr     r3, [pc, #0x9c]
000a037e  movs    r0, #8
000a0380  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0382  ldr     r3, [r3]
000a0384  str     r0, [r3]
000a0386  bl      #0xb07d4 ; -> sendLevelPacket
000a038a  b       #0xa033a
000a038c  ldr     r3, [pc, #0x90]
000a038e  movs    r0, #9
000a0390  add     r3, pc ; -> 0x000f3580  LevelSelect
000a0392  ldr     r3, [r3]
000a0394  str     r0, [r3]
000a0396  bl      #0xb07d4 ; -> sendLevelPacket
000a039a  b       #0xa033a
000a039c  ldr     r3, [pc, #0x84]
000a039e  movs    r0, #2
000a03a0  add     r3, pc ; -> 0x000f3580  LevelSelect
000a03a2  ldr     r3, [r3]
000a03a4  str     r0, [r3]
000a03a6  bl      #0xb07d4 ; -> sendLevelPacket
000a03aa  b       #0xa033a
000a03ac  ldr     r3, [pc, #0x78]
000a03ae  movs    r0, #3
000a03b0  add     r3, pc ; -> 0x000f3580  LevelSelect
000a03b2  ldr     r3, [r3]
000a03b4  str     r0, [r3]
000a03b6  bl      #0xb07d4 ; -> sendLevelPacket
000a03ba  b       #0xa033a
000a03bc  ldr     r3, [pc, #0x6c]
000a03be  movs    r0, #5
000a03c0  add     r3, pc ; -> 0x000f3580  LevelSelect
000a03c2  ldr     r3, [r3]
000a03c4  str     r0, [r3]
000a03c6  bl      #0xb07d4 ; -> sendLevelPacket
000a03ca  b       #0xa033a
000a03cc  ldr     r3, [pc, #0x60]
000a03ce  movs    r0, #0xb
000a03d0  add     r3, pc ; -> 0x000f3580  LevelSelect
000a03d2  ldr     r3, [r3]
000a03d4  str     r0, [r3]
000a03d6  bl      #0xb07d4 ; -> sendLevelPacket
000a03da  b       #0xa033a
000a03dc  bl      #0xaf9b8 ; -> isParent
000a03e0  cmp     r0, #0
000a03e2  beq     #0xa033a
000a03e4  ldr     r0, [pc, #0x4c]
000a03e6  ldr     r3, [pc, #0x50]
000a03e8  add     r0, pc ; -> 0x000f3678  requestedLevel
000a03ea  add     r3, pc ; -> 0x000f3580  LevelSelect
000a03ec  ldr     r0, [r0]
000a03ee  ldr     r3, [r3]
000a03f0  ldr     r0, [r0]
000a03f2  str     r0, [r3]
000a03f4  bl      #0xb07d4 ; -> sendLevelPacket
000a03f8  ldr     r0, [pc, #0x40]
000a03fa  add     r0, pc ; -> 0x0017e054  'MP:KODE NOT ENTERED'
000a03fc  blx     #0xddcb0 ; -> puts
000a0400  b       #0xa033a
000a0402  nop     
000a0404  adds    r1, #0x3e
000a0406  movs    r5, r0
000a0408  adds    r3, #0x68
000a040a  movs    r5, r0
000a040c  adds    r2, #0x3c
000a040e  movs    r5, r0
000a0410  adds    r2, #0x2c
000a0412  movs    r5, r0
000a0414  adds    r2, #0x1c
000a0416  movs    r5, r0
000a0418  adds    r2, #0xc
000a041a  movs    r5, r0
000a041c  adds    r1, #0xfc
000a041e  movs    r5, r0
000a0420  adds    r1, #0xec
000a0422  movs    r5, r0
000a0424  adds    r1, #0xdc
000a0426  movs    r5, r0
000a0428  adds    r1, #0xcc
000a042a  movs    r5, r0
000a042c  adds    r1, #0xbc
000a042e  movs    r5, r0
000a0430  adds    r1, #0xac
000a0432  movs    r5, r0
000a0434  adds    r2, #0x8c
000a0436  movs    r5, r0
000a0438  adds    r1, #0x92
000a043a  movs    r5, r0
000a043c  bgt     #0xa04ec
000a043e  movs    r5, r1
000a0440  push    {r4, r7, lr}
000a0442  add     r7, sp, #4
000a0444  mov     r4, r1
000a0446  cmp     r0, #3
000a0448  bhi     #0xa0454
000a044a  tbb     [pc, r0]
000a044e  asrs    r3, r3, #0x18
000a0450  lsrs    r1, r2, #0x10
000a0452  movs    r3, r0
000a0454  ldr     r0, [pc, #0x38]
000a0456  add     r0, pc ; -> 0x0017e068  'DEFAULT @getStageName!!!'
000a0458  blx     #0xddcb0 ; -> puts
000a045c  ldr     r0, [pc, #0x34]
000a045e  add     r0, pc ; -> 0x001769f0  DestinationNovice
000a0460  ldr.w   r0, [r0, r4, lsl #2]
000a0464  pop     {r4, r7, pc}
000a0466  ldr     r0, [pc, #0x30]
000a0468  add     r0, pc ; -> 0x00176bd8  DestinationGrandMaster
000a046a  ldr.w   r0, [r0, r1, lsl #2]
000a046e  b       #0xa0464
000a0470  ldr     r0, [pc, #0x28]
000a0472  add     r0, pc ; -> 0x00176b20  DestinationMaster
000a0474  ldr.w   r0, [r0, r1, lsl #2]
000a0478  b       #0xa0464
000a047a  ldr     r0, [pc, #0x24]
000a047c  add     r0, pc ; -> 0x00176a80  DestinationWarrior
000a047e  ldr.w   r0, [r0, r1, lsl #2]
000a0482  b       #0xa0464
000a0484  ldr     r0, [pc, #0x1c]
000a0486  add     r0, pc ; -> 0x001769f0  DestinationNovice
000a0488  ldr.w   r0, [r0, r1, lsl #2]
000a048c  b       #0xa0464
000a048e  nop     
000a0490  bgt     #0xa04b0
000a0492  movs    r5, r1
000a0494  str     r6, [r1, #0x58]
000a0496  movs    r5, r1
000a0498  str     r4, [r5, #0x74]
000a049a  movs    r5, r1
000a049c  str     r2, [r5, #0x68]
000a049e  movs    r5, r1
000a04a0  str     r0, [r0, #0x60]
000a04a2  movs    r5, r1
000a04a4  str     r6, [r4, #0x54]
000a04a6  movs    r5, r1
000a04a8  push    {r4, r5, r7, lr}
000a04aa  add     r7, sp, #8
000a04ac  ldr     r4, [pc, #0x6c]
000a04ae  ldr     r0, [pc, #0x70]
000a04b0  add     r4, pc ; -> 0x00176c04  kodes
000a04b2  add     r0, pc ; -> 0x0017e084  'CHECKING KODE'
000a04b4  blx     #0xddcb0 ; -> puts
000a04b8  ldr     r3, [r4]
000a04ba  cmp.w   r3, #-1
000a04be  beq     #0xa0518
000a04c0  ldr     r2, [pc, #0x60]
000a04c2  add     r2, pc ; -> 0x000f3458  KodeSelector
000a04c4  ldr     r5, [r2]
000a04c6  b       #0xa04d2
000a04c8  ldr     r3, [r4, #0x20]!
000a04cc  cmp.w   r3, #-1
000a04d0  beq     #0xa0518
000a04d2  ldr     r2, [r5]
000a04d4  cmp     r3, r2
000a04d6  bne     #0xa04c8
000a04d8  ldr     r2, [r4, #4]
000a04da  ldr     r3, [r5, #4]
000a04dc  cmp     r2, r3
000a04de  bne     #0xa04c8
000a04e0  ldr     r2, [r4, #8]
000a04e2  ldr     r3, [r5, #8]
000a04e4  cmp     r2, r3
000a04e6  bne     #0xa04c8
000a04e8  ldr     r2, [r4, #0xc]
000a04ea  ldr     r3, [r5, #0x1c]
000a04ec  cmp     r2, r3
000a04ee  bne     #0xa04c8
000a04f0  ldr     r2, [r4, #0x10]
000a04f2  ldr     r3, [r5, #0x20]
000a04f4  cmp     r2, r3
000a04f6  bne     #0xa04c8
000a04f8  ldr     r2, [r4, #0x14]
000a04fa  ldr     r3, [r5, #0x24]
000a04fc  cmp     r2, r3
000a04fe  bne     #0xa04c8
000a0500  ldr.w   r3, [pc, #0x24]
000a0504  ldr     r1, [r4, #0x1c]
000a0506  ldr.w   r0, [pc, #0x24]
000a050a  add     r3, pc ; -> 0x000f3454  theKode
000a050c  ldr     r3, [r3]
000a050e  add     r0, pc ; -> 0x001766c0  'KODE OK:%d\n'
000a0510  str     r1, [r3]
000a0512  blx     #0xddc38 ; -> printf
000a0516  b       #0xa04c8
000a0518  pop     {r4, r5, r7, pc}
000a051a  nop     
000a051c  str     r0, [r2, #0x74]
000a051e  movs    r5, r1
000a0520  blt     #0xa04c0
000a0522  movs    r5, r1
000a0524  cmp     r7, #0x92
000a0526  movs    r5, r0
000a0528  cmp     r7, #0x46
000a052a  movs    r5, r0
000a052c  str     r6, [r5, #0x18]
000a052e  movs    r5, r1
000a0530  push    {r4, r5, r6, r7, lr}
000a0532  add     r7, sp, #0xc
000a0534  push.w  {r8, sl, fp}
000a0538  vpush   {d8, d9, d10, d11}
000a053c  sub     sp, #0x58
000a053e  mov     ip, r0
000a0540  ldr     r0, [pc, #0x2d8]
000a0542  add     r1, sp, #0x30
000a0544  str     r1, [sp, #0x2c]
000a0546  add     r0, pc ; -> 0x000de214  ZZ11drawKodeTipE4C.25
000a0548  ldr     r4, [sp, #0x2c]
000a054a  ldm     r0, {r0, r1, r2, r3}
000a054c  lsl.w   ip, ip, #5
000a0550  vldr    s16, [pc, #0x2a0]
000a0554  movs    r5, #1
000a0556  stm.w   r4, {r0, r1, r2, r3}
000a055a  ldr     r0, [pc, #0x2c4]
000a055c  add     r1, sp, #0x4c
000a055e  str     r1, [sp, #0x20]
000a0560  add     r0, pc ; -> 0x000de208  ZZ11drawKodeTipE4C.26
000a0562  ldr     r3, [sp, #0x20]
000a0564  ldm     r0, {r0, r1, r2}
000a0566  add     r4, sp, #0x40
000a0568  stm.w   r3, {r0, r1, r2}
000a056c  ldr     r0, [pc, #0x2b4]
000a056e  str     r4, [sp, #0x24]
000a0570  add     r0, pc ; -> 0x000de1fc  ZZ11drawKodeTipE4C.27
000a0572  ldm     r0, {r0, r1, r2}
000a0574  stm.w   r4, {r0, r1, r2}
000a0578  ldr     r2, [pc, #0x2ac]
000a057a  str.w   ip, [sp, #0x28]
000a057e  movw    r0, #0x363
000a0582  add     r2, pc ; -> 0x00176c04  kodes
000a0584  add.w   r3, ip, r2
000a0588  ldr.w   r2, [ip, r2]
000a058c  str     r2, [sp, #0x4c]
000a058e  ldr     r2, [r3, #4]
000a0590  str     r2, [sp, #0x50]
000a0592  ldr     r2, [r3, #8]
000a0594  str     r2, [sp, #0x54]
000a0596  ldr     r2, [r3, #0xc]
000a0598  str     r2, [sp, #0x40]
000a059a  ldr     r2, [r3, #0x10]
000a059c  str     r2, [sp, #0x44]
000a059e  ldr     r3, [r3, #0x14]
000a05a0  str     r3, [sp, #0x48]
000a05a2  bl      #0xa72a8 ; -> GameText
000a05a6  ldr     r3, [pc, #0x284]
000a05a8  vldr    s14, [pc, #0x24c]
000a05ac  add     r3, pc ; -> 0x000f3578  FE_WidthScale
000a05ae  ldr.w   fp, [r3]
000a05b2  ldr     r3, [pc, #0x27c]
000a05b4  vldr    s8, [fp]
000a05b8  vmul.f32 d5, d4, d8
000a05bc  add     r3, pc ; -> 0x000f34a4  FE_HeightScale
000a05be  vmov    r2, s10
000a05c2  ldr     r6, [r3]
000a05c4  ldr     r3, [pc, #0x26c]
000a05c6  vldr    s12, [r6]
000a05ca  vmul.f32 d7, d6, d7
000a05ce  add     r3, pc ; -> 0x000f35c0  fontcol
000a05d0  vstr    s8, [sp, #4]
000a05d4  ldr     r4, [r3]
000a05d6  vmov    r3, s14
000a05da  str     r5, [sp]
000a05dc  str     r4, [sp, #8]
000a05de  mov     r1, r0
000a05e0  ldr     r0, [pc, #0x254]
000a05e2  add     r0, pc ; -> 0x000f360c  GameFont
000a05e4  ldr.w   r8, [r0]
000a05e8  mov     r0, r8
000a05ea  bl      #0x7e5b8 ; -> limeDrawFONT
000a05ee  mov.w   r0, #0x364
000a05f2  bl      #0xa72a8 ; -> GameText
000a05f6  vldr    s10, [fp]
000a05fa  vldr    s12, [r6]
000a05fe  vmul.f32 d4, d5, d8
000a0602  vldr    s14, [pc, #0x1f8]
000a0606  vmov    r2, s8
000a060a  vmul.f32 d7, d6, d7
000a060e  vmov    r3, s14
000a0612  str     r5, [sp]
000a0614  vstr    s10, [sp, #4]
000a0618  str     r4, [sp, #8]
000a061a  subs    r5, #1
000a061c  movs    r4, #0x86
000a061e  mov     r1, r0
000a0620  mov     r0, r8
000a0622  bl      #0x7e5b8 ; -> limeDrawFONT
000a0626  ldr     r0, [pc, #0x214]
000a0628  movs    r1, #0
000a062a  add     r0, pc ; -> 0x001766cc  'KOMBAT_KODES_TPAGE.PNG'
000a062c  mov     r2, r1
000a062e  bl      #0x670a0 ; -> limeLoadTexture
000a0632  ldr     r3, [pc, #0x20c]
000a0634  add     r3, pc ; -> 0x000f345c  KodesTexture
000a0636  ldr.w   ip, [r3]
000a063a  str.w   r0, [ip]
000a063e  str     r6, [sp, #0x1c]
000a0640  str.w   ip, [sp, #0x18]
000a0644  ldr     r3, [sp, #0x1c]
000a0646  vldr    s10, [r3]
000a064a  ldr     r3, [sp, #0x20]
000a064c  ldr.w   sl, [pc, #0x1f4]
000a0650  vmov    s8, r4
000a0654  vcvt.f32.s32 s14, s8
000a0658  ldr     r1, [r5, r3]
000a065a  ldr     r3, [sp, #0x18]
000a065c  vldr    s12, [fp]
000a0660  vldr    s16, [pc, #0x19c]
000a0664  vldr    s22, [pc, #0x19c]
000a0668  ldr     r0, [r3]
000a066a  smull   r3, r2, sl, r1
000a066e  vldr    d10, [pc, #0x198]
000a0672  asrs    r3, r1, #0x1f
000a0674  vmul.f32 d3, d7, d6
000a0678  vmul.f32 d4, d5, d11
000a067c  vmul.f32 d7, d5, d8
000a0680  vstr    s14, [sp]
000a0684  rsb     r2, r3, r2, asr #1
000a0688  vldr    d9, [pc, #0x184]
000a068c  lsls    r3, r2, #2
000a068e  adds    r3, r3, r2
000a0690  rsb     r3, r3, r1
000a0694  vmul.f32 d6, d6, d8
000a0698  lsls    r1, r3, #4
000a069a  lsls    r3, r3, #6
000a069c  subs    r3, r3, r1
000a069e  vmov    s10, r3
000a06a2  vcvt.f64.s32 d7, s10
000a06a6  lsls    r1, r2, #4
000a06a8  lsls    r3, r2, #6
000a06aa  subs    r3, r3, r1
000a06ac  vmov    s10, r3
000a06b0  ldr     r1, [sp, #0x2c]
000a06b2  vmov    r2, s8
000a06b6  vmul.f64 d7, d7, d10
000a06ba  vmov    r3, s12
000a06be  str     r1, [sp, #0x14]
000a06c0  vmov    r1, s6
000a06c4  mov.w   r8, #0x3e400000
000a06c8  mov.w   r6, #0x3ec00000
000a06cc  str.w   r8, [sp, #0xc]
000a06d0  str     r6, [sp, #0x10]
000a06d2  vcvt.f32.f64 s14, d7
000a06d6  vstr    s14, [sp, #4]
000a06da  vcvt.f64.s32 d7, s10
000a06de  vmul.f64 d7, d7, d9
000a06e2  vcvt.f32.f64 s14, d7
000a06e6  vstr    s14, [sp, #8]
000a06ea  bl      #0x65e7c ; -> limeDrawSprite
000a06ee  ldr     r3, [sp, #0x1c]
000a06f0  vldr    s10, [r3]
000a06f4  ldr     r3, [sp, #0x24]
000a06f6  vldr    s12, [fp]
000a06fa  vmul.f32 d3, d5, d11
000a06fe  ldr     r1, [r5, r3]
000a0700  ldr     r3, [sp, #0x18]
000a0702  adds    r5, #4
000a0704  ldr     r0, [r3]
000a0706  add.w   r3, r4, #0x74
000a070a  vmov    s8, r3
000a070e  smull   r3, r2, sl, r1
000a0712  asrs    r3, r1, #0x1f
000a0714  vcvt.f32.s32 s14, s8
000a0718  adds    r4, #0x20
000a071a  str.w   r8, [sp, #0xc]
000a071e  str     r6, [sp, #0x10]
000a0720  rsb     r2, r3, r2, asr #1
000a0724  lsls    r3, r2, #2
000a0726  adds    r3, r3, r2
000a0728  rsb     r3, r3, r1
000a072c  vmul.f32 d4, d7, d6
000a0730  lsls    r1, r3, #4
000a0732  lsls    r3, r3, #6
000a0734  subs    r3, r3, r1
000a0736  vmul.f32 d7, d5, d8
000a073a  vmov    s10, r3
000a073e  vstr    s14, [sp]
000a0742  vcvt.f64.s32 d7, s10
000a0746  lsls    r1, r2, #4
000a0748  lsls    r3, r2, #6
000a074a  subs    r3, r3, r1
000a074c  vmov    s10, r3
000a0750  ldr     r1, [sp, #0x2c]
000a0752  vmul.f32 d6, d6, d8
000a0756  vmul.f64 d7, d7, d10
000a075a  vmov    r2, s6
000a075e  str     r1, [sp, #0x14]
000a0760  vmov    r3, s12
000a0764  vmov    r1, s8
000a0768  vcvt.f32.f64 s14, d7
000a076c  vstr    s14, [sp, #4]
000a0770  vcvt.f64.s32 d7, s10
000a0774  vmul.f64 d7, d7, d9
000a0778  vcvt.f32.f64 s14, d7
000a077c  vstr    s14, [sp, #8]
000a0780  bl      #0x65e7c ; -> limeDrawSprite
000a0784  cmp     r4, #0xe6
000a0786  bne.w   #0xa0644
000a078a  ldr     r0, [pc, #0xbc]
000a078c  ldr     r3, [sp, #0x28]
000a078e  add     r0, pc ; -> 0x00176c04  kodes
000a0790  add     r0, r3
000a0792  ldr     r0, [r0, #0x18]
000a0794  bl      #0xa72a8 ; -> GameText
000a0798  vldr    s10, [fp]
000a079c  ldr     r4, [sp, #0x1c]
000a079e  movs    r3, #1
000a07a0  vldr    s12, [r4]
000a07a4  str     r3, [sp]
000a07a6  ldr.w   r3, [pc, #0xa4]
000a07aa  vldr    s14, [pc, #0x48]
000a07ae  vmul.f32 d4, d5, d7
000a07b2  add     r3, pc ; -> 0x000f35c0  fontcol
000a07b4  vmov    r2, s8
000a07b8  ldr     r3, [r3]
000a07ba  vldr    s14, [pc, #0x5c]
000a07be  vmul.f32 d7, d6, d7
000a07c2  vstr    s10, [sp, #4]
000a07c6  str     r3, [sp, #8]
000a07c8  vmov    r3, s14
000a07cc  mov     r1, r0
000a07ce  ldr     r0, [pc, #0x80]
000a07d0  add     r0, pc ; -> 0x000f360c  GameFont
000a07d2  ldr     r0, [r0]
000a07d4  bl      #0x7e5b8 ; -> limeDrawFONT
000a07d8  ldr     r1, [sp, #0x18]
000a07da  ldr     r0, [r1]
000a07dc  bl      #0x673cc ; -> limeDeleteTexture
000a07e0  sub.w   sp, r7, #0x38
000a07e4  vpop    {d8, d9, d10, d11}
000a07e8  sub.w   sp, r7, #0x18
000a07ec  pop.w   {r8, sl, fp}
000a07f0  pop     {r4, r5, r6, r7, pc}
000a07f2  nop     
000a07f4  movs    r0, r0
000a07f6  muls    r0, r6, r0
000a07f8  movs    r0, r0
000a07fa  cmn     r0, r5
000a07fc  movs    r0, r0
000a07fe  orrs    r4, r0
000a0800  movs    r0, r0
000a0802  tst     r0, r0
000a0804  movs    r0, r0
000a0806  orrs    r0, r4
000a0808  movs    r0, r0
000a080a  movs    r0, r0
000a080c  movs    r0, r0
000a080e  subs    r7, #0x70
000a0810  movs    r0, r0
000a0812  movs    r0, r0
000a0814  movs    r0, r0
000a0816  subs    r7, #0x80
000a0818  movs    r0, r0
000a081a  muls    r2, r1, r2
000a081c  bgt     #0xa07b4
000a081e  movs    r3, r0
000a0820  bgt     #0xa076c
000a0822  movs    r3, r0
000a0824  bgt     #0xa0738
000a0826  movs    r3, r0
000a0828  str     r6, [r7, #0x64]
000a082a  movs    r5, r1
000a082c  cmp     r7, #0xc8
000a082e  movs    r5, r0
000a0830  cmp     r6, #0xe4
000a0832  movs    r5, r0
000a0834  cmp     r7, #0xee
000a0836  movs    r5, r0
000a0838  adds    r0, #0x26
000a083a  movs    r5, r0
000a083c  str     r6, [r3, #8]
000a083e  movs    r5, r1
000a0840  cmp     r6, #0x24
000a0842  movs    r5, r0
000a0844  str     r7, [r4, #0x64]
000a0846  str     r6, [r4, #0x64]
000a0848  str     r2, [r6, #0x44]
000a084a  movs    r5, r1
000a084c  cmp     r6, #0xa
000a084e  movs    r5, r0
000a0850  cmp     r6, #0x38
000a0852  movs    r5, r0
000a0854  push    {r4, r5, r7, lr}
000a0856  add     r7, sp, #8
000a0858  ldr     r3, [pc, #0x68]
000a085a  mov     r4, r0
000a085c  add     r3, pc ; -> 0x000f354c  Settings
000a085e  ldr     r3, [r3]
000a0860  ldr     r3, [r3, #0x1c]
000a0862  cbnz    r3, #0xa0886
000a0864  cmp     r0, #0x13
000a0866  bhi     #0xa0894
000a0868  ldr     r3, [pc, #0x5c]
000a086a  add     r3, pc ; -> 0x00379c60  achievementTracker
000a086c  ldr.w   r0, [r3, r0, lsl #2]
000a0870  cbnz    r0, #0xa0894
000a0872  movs    r2, #2
000a0874  str.w   r2, [r3, r4, lsl #2]
000a0878  ldr     r2, [pc, #0x50]
000a087a  lsls    r3, r4, #4
000a087c  add     r2, pc ; -> 0x0017684c  achievementsDescr
000a087e  adds    r3, r3, r2
000a0880  movs    r2, #0
000a0882  str     r2, [r3, #0xc]
000a0884  b       #0xa0896
000a0886  cmp     r0, #0x13
000a0888  bhi     #0xa0894
000a088a  ldr     r5, [pc, #0x44]
000a088c  add     r5, pc ; -> 0x00379c60  achievementTracker
000a088e  ldr.w   r3, [r5, r0, lsl #2]
000a0892  cbz     r3, #0xa0898
000a0894  movs    r0, #0
000a0896  pop     {r4, r5, r7, pc}
000a0898  bl      #0xa02ac ; -> areAchievementsViewing
000a089c  cbz     r0, #0xa08b8
000a089e  movs    r3, #4
000a08a0  str.w   r3, [r5, r4, lsl #2]
000a08a4  ldr     r3, [pc, #0x2c]
000a08a6  lsls    r0, r4, #4
000a08a8  add     r3, pc ; -> 0x0017684c  achievementsDescr
000a08aa  adds    r0, r0, r3
000a08ac  movs    r3, #0
000a08ae  str     r3, [r0, #0xc]
000a08b0  bl      #0x15b30 ; -> Write_AchievementsData
000a08b4  movs    r0, #1
000a08b6  b       #0xa0896
000a08b8  ldr     r3, [pc, #0x1c]
000a08ba  movs    r2, #1
000a08bc  add     r3, pc ; -> 0x00379c60  achievementTracker
000a08be  str.w   r2, [r3, r4, lsl #2]
000a08c2  b       #0xa08a4
000a08c4  cmp     r4, #0xec
000a08c6  movs    r5, r0
000a08c8  str     r3, [sp, #0x3c8]
000a08ca  movs    r5, r5
000a08cc  ldrsh   r4, [r1, r7]
000a08ce  movs    r5, r1
000a08d0  str     r3, [sp, #0x340]
000a08d2  movs    r5, r5
000a08d4  ldrsh   r0, [r4, r6]
000a08d6  movs    r5, r1
000a08d8  str     r3, [sp, #0x280]
000a08da  movs    r5, r5
000a08dc  push    {r7, lr}
000a08de  add     r7, sp, #0
000a08e0  ldr     r2, [pc, #0x14]
000a08e2  add     r2, pc ; -> 0x00379c60  achievementTracker
000a08e4  ldr     r3, [r2, #0x5c]
000a08e6  adds    r3, #1
000a08e8  cmp     r3, #0x63
000a08ea  str     r3, [r2, #0x5c]
000a08ec  ble     #0xa08f4
000a08ee  movs    r0, #0x12
000a08f0  bl      #0xa0854 ; -> achievementsUnlock
000a08f4  pop     {r7, pc}
000a08f6  nop     
000a08f8  str     r3, [sp, #0x1e8]
000a08fa  movs    r5, r5
000a08fc  push    {r7, lr}
000a08fe  add     r7, sp, #0
000a0900  ldr     r2, [pc, #0x20]
000a0902  add     r2, pc ; -> 0x00379c60  achievementTracker
000a0904  ldr     r3, [r2, #0x50]
000a0906  adds    r3, #1
000a0908  cmp     r3, #0xa
000a090a  str     r3, [r2, #0x50]
000a090c  beq     #0xa091c
000a090e  cmp     r3, #0x64
000a0910  beq     #0xa0914
000a0912  pop     {r7, pc}
000a0914  movs    r0, #8
000a0916  bl      #0xa0854 ; -> achievementsUnlock
000a091a  b       #0xa0912
000a091c  movs    r0, #7
000a091e  bl      #0xa0854 ; -> achievementsUnlock
000a0922  b       #0xa0912
000a0924  str     r3, [sp, #0x168]
000a0926  movs    r5, r5
000a0928  push    {r4, r5, r6, r7, lr}
000a092a  add     r7, sp, #0xc
000a092c  push.w  {r8, sl, fp}
000a0930  vpush   {d8, d9}
000a0934  sub     sp, #0x44
000a0936  ldr     r0, [pc, #0x264]
000a0938  add     r3, sp, #0x34
000a093a  str     r3, [sp, #0x18]
000a093c  add     r0, pc ; -> 0x000de234  ZZ16achievementsDrawE4C.13
000a093e  ldr     r4, [sp, #0x18]
000a0940  ldm     r0, {r0, r1, r2, r3}
000a0942  ldr     r6, [pc, #0x25c]
000a0944  add     r6, pc ; -> 0x0017684c  achievementsDescr
000a0946  stm.w   r4, {r0, r1, r2, r3}
000a094a  ldr     r0, [pc, #0x258]
000a094c  add     r3, sp, #0x24
000a094e  str     r3, [sp, #0x10]
000a0950  add     r0, pc ; -> 0x000de224  ZZ16achievementsDrawE4C.14
000a0952  ldr     r4, [sp, #0x10]
000a0954  ldm     r0, {r0, r1, r2, r3}
000a0956  stm.w   r4, {r0, r1, r2, r3}
000a095a  ldr     r4, [pc, #0x24c]
000a095c  movs    r3, #0
000a095e  str     r3, [sp, #0x20]
000a0960  mov     r5, r3
000a0962  str     r4, [sp, #0x14]
000a0964  b       #0xa0976
000a0966  cmp     r3, #2
000a0968  beq.w   #0xa0ace
000a096c  adds    r5, #4
000a096e  adds    r6, #0x10
000a0970  cmp     r5, #0x50
000a0972  beq.w   #0xa0ade
000a0976  ldr     r4, [sp, #0x14]
000a0978  add     r4, pc
000a097a  ldr     r3, [r5, r4]
000a097c  cmp     r3, #4
000a097e  beq.w   #0xa0b0a
000a0982  cmp     r3, #1
000a0984  bne     #0xa0966
000a0986  ldr     r3, [pc, #0x224]
000a0988  mov.w   r8, #0
000a098c  movs    r4, #0
000a098e  add     r3, pc ; -> 0x000f34a4  FE_HeightScale
000a0990  ldr.w   sl, [r3]
000a0994  ldr.w   r3, [pc, #0x218]
000a0998  vldr    s18, [sl]
000a099c  add     r3, pc ; -> 0x000f34cc  limeScreenHeight
000a099e  ldr     r3, [r3]
000a09a0  ldr     r3, [r3]
000a09a2  vmov    s14, r3
000a09a6  vcvt.f64.s32 d8, s14
000a09aa  vldr    s14, [r6, #0xc]
000a09ae  vcvt.f64.f32 d7, s14
000a09b2  vmov    r0, r1, d7
000a09b6  blx     #0xddcd4 ; -> sin
000a09ba  vldr    d6, [pc, #0x1b4]
000a09be  ldr     r3, [pc, #0x1f4]
000a09c0  add     r3, pc ; -> 0x000f347c  limeScreenWidth
000a09c2  ldr     r3, [r3]
000a09c4  ldr     r2, [r3]
000a09c6  mov.w   r3, #0x3f000000
000a09ca  str     r3, [sp, #0xc]
000a09cc  str.w   r8, [sp]
000a09d0  str.w   r8, [sp, #4]
000a09d4  str.w   r8, [sp, #8]
000a09d8  vmov    d7, r0, r1
000a09dc  vmul.f64 d6, d7, d6
000a09e0  mov     r0, r8
000a09e2  vcvt.f64.f32 d7, s18
000a09e6  vmla.f64 d8, d6, d7
000a09ea  vcvt.s32.f64 s14, d8
000a09ee  vcvt.f32.s32 s16, s14
000a09f2  vmov    s14, r2
000a09f6  vcvt.f32.s32 s12, s14
000a09fa  vmov    r1, s16
000a09fe  vldr    s14, [pc, #0x178]
000a0a02  vmul.f32 d7, d9, d7
000a0a06  vmov    r3, s14
000a0a0a  vmov    r2, s12
000a0a0e  bl      #0x666ac ; -> limeFillRect
000a0a12  movs    r0, #0x65
000a0a14  bl      #0xa72a8 ; -> GameText
000a0a18  vmov.f32 s14, #4.000000e+00
000a0a1c  ldr     r3, [pc, #0x198]
000a0a1e  add     r3, pc ; -> 0x000f3578  FE_WidthScale
000a0a20  ldr.w   fp, [r3]
000a0a24  ldr     r3, [sp, #0x10]
000a0a26  vldr    s8, [fp]
000a0a2a  vmov.f32 s18, #2.000000e+01
000a0a2e  vmul.f32 d5, d4, d9
000a0a32  vmov    r2, s10
000a0a36  mov     r1, r0
000a0a38  ldr     r0, [pc, #0x180]
000a0a3a  add     r0, pc ; -> 0x000f360c  GameFont
000a0a3c  ldr     r0, [r0]
000a0a3e  str     r0, [sp, #0x1c]
000a0a40  vldr    s12, [sl]
000a0a44  vmul.f32 d7, d6, d7
000a0a48  vadd.f32 d6, d8, d7
000a0a4c  str     r3, [sp, #8]
000a0a4e  vmov    r3, s12
000a0a52  str     r4, [sp]
000a0a54  vldr    s14, [pc, #0x124]
000a0a58  vmul.f32 d7, d4, d7
000a0a5c  vstr    s14, [sp, #4]
000a0a60  bl      #0x7e5b8 ; -> limeDrawFONT
000a0a64  ldr     r0, [r6]
000a0a66  bl      #0xa72a8 ; -> GameText
000a0a6a  vmov.f32 s12, #1.400000e+01
000a0a6e  vldr    s10, [fp]
000a0a72  vldr    s14, [sl]
000a0a76  str     r4, [sp]
000a0a78  ldr     r4, [sp, #0x18]
000a0a7a  vmul.f32 d4, d5, d9
000a0a7e  vmov    r2, s8
000a0a82  str     r4, [sp, #8]
000a0a84  vmul.f32 d7, d7, d6
000a0a88  vadd.f32 d6, d8, d7
000a0a8c  vmov    r3, s12
000a0a90  vldr    s14, [pc, #0xec]
000a0a94  vmul.f32 d7, d5, d7
000a0a98  vstr    s14, [sp, #4]
000a0a9c  mov     r1, r0
000a0a9e  ldr     r0, [sp, #0x1c]
000a0aa0  bl      #0x7e5b8 ; -> limeDrawFONT
000a0aa4  ldr     r3, [pc, #0x118]
000a0aa6  add     r3, pc ; -> 0x000f3588  GamePaused
000a0aa8  ldr     r3, [r3]
000a0aaa  ldr     r3, [r3]
000a0aac  cmp     r3, #0
000a0aae  beq     #0xa0b14
000a0ab0  vldr    s12, [r6, #0xc]
000a0ab4  vldr    s14, [pc, #0xcc]
000a0ab8  vcmpe.f32 s12, s14
000a0abc  vmrs    apsr_nzcv, fpscr
000a0ac0  bge     #0xa0af6
000a0ac2  ldr     r3, [pc, #0x100]
000a0ac4  add     r3, pc ; -> 0x00379c60  achievementTracker
000a0ac6  ldr     r3, [r5, r3]
000a0ac8  cmp     r3, #2
000a0aca  bne.w   #0xa096c
000a0ace  ldr     r3, [sp, #0x20]
000a0ad0  adds    r3, #1
000a0ad2  str     r3, [sp, #0x20]
000a0ad4  adds    r5, #4
000a0ad6  adds    r6, #0x10
000a0ad8  cmp     r5, #0x50
000a0ada  bne.w   #0xa0976
000a0ade  ldr     r4, [sp, #0x20]
000a0ae0  cmp     r4, #0x13
000a0ae2  beq     #0xa0b5c
000a0ae4  sub.w   sp, r7, #0x28
000a0ae8  vpop    {d8, d9}
000a0aec  sub.w   sp, r7, #0x18
000a0af0  pop.w   {r8, sl, fp}
000a0af4  pop     {r4, r5, r6, r7, pc}
000a0af6  ldr     r3, [pc, #0xd0]
000a0af8  movs    r2, #2
000a0afa  add     r3, pc ; -> 0x00379c60  achievementTracker
000a0afc  str     r2, [r5, r3]
000a0afe  str.w   r8, [r6, #0xc]
000a0b02  ldr     r3, [sp, #0x20]
000a0b04  adds    r3, #1
000a0b06  str     r3, [sp, #0x20]
000a0b08  b       #0xa0ad4
000a0b0a  bl      #0xa02ac ; -> areAchievementsViewing
000a0b0e  cbz     r0, #0xa0b4a
000a0b10  ldr     r3, [r5, r4]
000a0b12  b       #0xa0982
000a0b14  vldr    s12, [r6, #0xc]
000a0b18  vcvt.f64.f32 d8, s12
000a0b1c  vmov    r0, r1, d8
000a0b20  blx     #0xdd770 ; -> cos
000a0b24  vldr    d6, [pc, #0x60]
000a0b28  vmov    d7, r0, r1
000a0b2c  vmul.f64 d7, d7, d6
000a0b30  vldr    d6, [pc, #0x5c]
000a0b34  vabs.f64 d7, d7
000a0b38  vadd.f64 d7, d7, d6
000a0b3c  vadd.f64 d7, d8, d7
000a0b40  vcvt.f32.f64 s12, d7
000a0b44  vstr    s12, [r6, #0xc]
000a0b48  b       #0xa0ab4
000a0b4a  ldr     r3, [pc, #0x80]
000a0b4c  movs    r2, #1
000a0b4e  vldr    s12, [pc, #0x48]
000a0b52  add     r3, pc ; -> 0x00379c60  achievementTracker
000a0b54  str     r2, [r5, r3]
000a0b56  vstr    s12, [r6, #0xc]
000a0b5a  b       #0xa0986
000a0b5c  ldr     r3, [pc, #0x70]
000a0b5e  add     r3, pc ; -> 0x00379c60  achievementTracker
000a0b60  ldr     r3, [r3, #0x44]
000a0b62  cmp     r3, #0
000a0b64  bne     #0xa0ae4
000a0b66  movs    r0, #0x11
000a0b68  bl      #0xa0854 ; -> achievementsUnlock
000a0b6c  b       #0xa0ae4
000a0b6e  nop     
000a0b70  movs    r0, r0
000a0b72  movs    r0, r0
000a0b74  movs    r0, r0
000a0b76  stm     r0!, {r6}
000a0b78  movs    r0, r0
000a0b7a  tst     r0, r0
000a0b7c  str     r6, [r4, #0x64]
000a0b7e  subs    r7, #0x26
000a0b80  str     r6, [r4, #0x64]
000a0b82  subs    r7, #0x66
000a0b84  lsrs    r3, r3, #0x1f
000a0b86  eors    r1, r1
000a0b88  movs    r0, r0
000a0b8a  adr     r0, #0
000a0b8c  ldr     r1, [sp, #0x264]
000a0b8e  subs    r7, #0xa9
000a0b90  asrs    r3, r7, #0x11
000a0b92  blxns   r5
000a0b94  ldrb    r1, [r4, #0xb]
000a0b96  subs    r7, #0x84
000a0b98  movs    r0, r0
000a0b9a  movs    r0, r0
000a0b9c  bhi     #0xa0b88
000a0b9e  movs    r3, r0
000a0ba0  ldrsh   r4, [r0, r4]
000a0ba2  movs    r5, r1
000a0ba4  bhi     #0xa0b48
000a0ba6  movs    r3, r0
000a0ba8  str     r2, [sp, #0x390]
000a0baa  movs    r5, r5
000a0bac  cmp     r3, #0x12
000a0bae  movs    r5, r0
000a0bb0  cmp     r3, #0x2c
000a0bb2  movs    r5, r0
000a0bb4  cmp     r2, #0xb8
000a0bb6  movs    r5, r0
000a0bb8  cmp     r3, #0x56
000a0bba  movs    r5, r0
000a0bbc  cmp     r3, #0xce
000a0bbe  movs    r5, r0
000a0bc0  cmp     r2, #0xde
000a0bc2  movs    r5, r0
000a0bc4  str     r1, [sp, #0x260]
000a0bc6  movs    r5, r5
000a0bc8  str     r1, [sp, #0x188]
000a0bca  movs    r5, r5
000a0bcc  str     r1, [sp, #0x28]
000a0bce  movs    r5, r5
000a0bd0  str     r0, [sp, #0x3f8]
000a0bd2  movs    r5, r5
000a0bd4  ldr.w   r3, [r0, #0xa4]
000a0bd8  ldr.w   r2, [r0, #0x108]
000a0bdc  adds    r3, #1
000a0bde  ldr.w   r3, [r0, r3, lsl #3]
000a0be2  cbnz    r3, #0xa0c08
000a0be4  ldr     r1, [r2, #8]
000a0be6  mov.w   r3, #0x11c0
000a0bea  str     r3, [r1, #0x2c]
000a0bec  movs    r3, #0x3c
000a0bee  str     r3, [r2, #0x48]
000a0bf0  ldr.w   r3, [r0, #0xa4]
000a0bf4  movw    r2, #0x216
000a0bf8  adds    r3, #1
000a0bfa  str.w   r2, [r0, r3, lsl #3]
000a0bfe  movs    r3, #2
000a0c00  str.w   r3, [r0, #0xfc]
000a0c04  mov     r0, r3
000a0c06  bx      lr
000a0c08  movw    r1, #0x216
000a0c0c  cmp     r3, r1
000a0c0e  it      ne
000a0c10  mvnne   r0, #2
000a0c14  bne     #0xa0c06
000a0c16  ldr     r3, [r2, #0x48]
000a0c18  subs    r3, #1
000a0c1a  str     r3, [r2, #0x48]
000a0c1c  cmp     r3, #0
000a0c1e  bne     #0xa0bf0
000a0c20  ldr     r2, [pc, #0x1c]
000a0c22  add     r2, pc ; -> 0x000f3724  t_wait_forever
000a0c24  ldr     r1, [r2]
000a0c26  ldr.w   r2, [r0, #0xa4]
000a0c2a  lsls    r2, r2, #3
000a0c2c  adds    r2, r2, r0
000a0c2e  str     r1, [r2, #4]
000a0c30  ldr.w   r2, [r0, #0xa4]
000a0c34  adds    r2, #1
000a0c36  str.w   r3, [r0, r2, lsl #3]
000a0c3a  mov     r0, r3
000a0c3c  b       #0xa0c06
000a0c3e  nop     
000a0c40  cmp     r2, #0xfe
000a0c42  movs    r5, r0
000a0c44  ldr.w   r3, [r0, #0xa4]
000a0c48  ldr.w   r2, [r0, #0x108]
000a0c4c  adds    r3, #1
000a0c4e  ldr.w   r1, [r0, r3, lsl #3]
000a0c52  cbz     r1, #0xa0c5a
000a0c54  mvn     r0, #2
000a0c58  bx      lr
000a0c5a  ldr     r3, [r2, #0x48]
000a0c5c  str     r3, [r2, #0x40]
000a0c5e  movs    r3, #3
000a0c60  str     r3, [r2, #0x1c]
000a0c62  ldr     r3, [pc, #0x1c]
000a0c64  add     r3, pc ; -> 0x000f37cc  t_mframew
000a0c66  ldr     r2, [r3]
000a0c68  ldr.w   r3, [r0, #0xa4]
000a0c6c  lsls    r3, r3, #3
000a0c6e  adds    r3, r3, r0
000a0c70  str     r2, [r3, #4]
000a0c72  ldr.w   r3, [r0, #0xa4]
000a0c76  adds    r3, #1
000a0c78  str.w   r1, [r0, r3, lsl #3]
000a0c7c  mov     r0, r1
000a0c7e  b       #0xa0c58
000a0c80  cmp     r3, #0x64
000a0c82  movs    r5, r0
000a0c84  ldr.w   ip, [r0, #0xa4]
000a0c88  add.w   r3, ip, #1
000a0c8c  ldr.w   r2, [r0, r3, lsl #3]
000a0c90  cbz     r2, #0xa0c98
000a0c92  mvn     r0, #2
000a0c96  bx      lr
000a0c98  ldr     r1, [pc, #0x18]
000a0c9a  lsl.w   r3, ip, #3
000a0c9e  adds    r3, r3, r0
000a0ca0  add     r1, pc ; -> 0x000a2add  t_r_bat_bite
000a0ca2  str     r1, [r3, #4]
000a0ca4  ldr.w   r3, [r0, #0xa4]
000a0ca8  adds    r3, #1
000a0caa  str.w   r2, [r0, r3, lsl #3]
000a0cae  mov     r0, r2
000a0cb0  b       #0xa0c96
000a0cb2  nop     
000a0cb4  subs    r1, r7, #0
000a0cb6  movs    r0, r0
000a0cb8  ldr.w   r1, [r0, #0xa4]
000a0cbc  adds    r3, r1, #1
000a0cbe  ldr.w   r2, [r0, r3, lsl #3]
000a0cc2  cbz     r2, #0xa0cca
000a0cc4  mvn     r0, #2
000a0cc8  bx      lr
000a0cca  ldr     r3, [pc, #0x1c]
000a0ccc  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a0cce  ldr.w   ip, [r3]
000a0cd2  lsls    r3, r1, #3
000a0cd4  adds    r3, r3, r0
000a0cd6  str.w   ip, [r3, #4]
000a0cda  ldr.w   r3, [r0, #0xa4]
000a0cde  adds    r3, #1
000a0ce0  str.w   r2, [r0, r3, lsl #3]
000a0ce4  mov     r0, r2
000a0ce6  b       #0xa0cc8
000a0ce8  cmp     r2, #0x54
000a0cea  movs    r5, r0
000a0cec  ldr.w   r3, [r0, #0xa4]
000a0cf0  ldr.w   r2, [r0, #0x108]
000a0cf4  adds    r3, #1
000a0cf6  ldr.w   r1, [r0, r3, lsl #3]
000a0cfa  cbz     r1, #0xa0d02
000a0cfc  mvn     r0, #2
000a0d00  bx      lr
000a0d02  movs    r3, #6
000a0d04  str     r3, [r2, #0x1c]
000a0d06  subs    r3, #3
000a0d08  str     r3, [r2, #0x20]
000a0d0a  adds    r3, #0xd
000a0d0c  str     r3, [r2, #0x24]
000a0d0e  ldr     r3, [pc, #0x1c]
000a0d10  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
000a0d12  ldr     r2, [r3]
000a0d14  ldr.w   r3, [r0, #0xa4]
000a0d18  lsls    r3, r3, #3
000a0d1a  adds    r3, r3, r0
000a0d1c  str     r2, [r3, #4]
000a0d1e  ldr.w   r3, [r0, #0xa4]
000a0d22  adds    r3, #1
000a0d24  str.w   r1, [r0, r3, lsl #3]
000a0d28  mov     r0, r1
000a0d2a  b       #0xa0d00
000a0d2c  cmp     r1, #0xe4
000a0d2e  movs    r5, r0
000a0d30  ldr.w   r1, [r0, #0xa4]
000a0d34  adds    r3, r1, #1
000a0d36  ldr.w   r2, [r0, r3, lsl #3]
000a0d3a  cbnz    r2, #0xa0d66
000a0d3c  movw    r1, #0x713
000a0d40  str.w   r1, [r0, r3, lsl #3]
000a0d44  ldr.w   r3, [r0, #0xa4]
000a0d48  ldr     r1, [pc, #0x44]
000a0d4a  adds    r3, #1
000a0d4c  str.w   r3, [r0, #0xa4]
000a0d50  lsls    r3, r3, #3
000a0d52  adds    r3, r3, r0
000a0d54  add     r1, pc ; -> 0x000a0ced  t_spider_shake_jsrp
000a0d56  str     r1, [r3, #4]
000a0d58  ldr.w   r3, [r0, #0xa4]
000a0d5c  adds    r3, #1
000a0d5e  str.w   r2, [r0, r3, lsl #3]
000a0d62  mov     r0, r2
000a0d64  bx      lr
000a0d66  movw    r3, #0x713
000a0d6a  cmp     r2, r3
000a0d6c  it      ne
000a0d6e  mvnne   r0, #2
000a0d72  bne     #0xa0d64
000a0d74  ldr     r3, [pc, #0x1c]
000a0d76  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a0d78  ldr     r2, [r3]
000a0d7a  lsls    r3, r1, #3
000a0d7c  adds    r3, r3, r0
000a0d7e  str     r2, [r3, #4]
000a0d80  ldr.w   r3, [r0, #0xa4]
000a0d84  movs    r2, #0
000a0d86  adds    r3, #1
000a0d88  str.w   r2, [r0, r3, lsl #3]
000a0d8c  mov     r0, r2
000a0d8e  b       #0xa0d64
