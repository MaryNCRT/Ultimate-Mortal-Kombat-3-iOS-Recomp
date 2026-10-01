========================================================================
-[FacebookAgent fbDidNotLogin  0x000dbe0c  212 bytes   FacebookAgent.mm
========================================================================

000dbe0c  push    {r4, r5, r6, r7, lr}
000dbe0e  add     r7, sp, #0xc
000dbe10  ldr     r3, [pc, #0xa0]
000dbe12  mov     r4, r0
000dbe14  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbe16  ldr     r3, [r3]
000dbe18  ldr     r3, [r0, r3]
000dbe1a  cmp     r3, #5
000dbe1c  bne     #0xdbe4a
000dbe1e  ldr     r1, [pc, #0x98]
000dbe20  ldr     r5, [pc, #0x98]
000dbe22  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dbe24  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbe26  ldr     r6, [r1]
000dbe28  ldr     r1, [pc, #0x94]
000dbe2a  ldr     r3, [r5]
000dbe2c  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbe2e  mov     r2, r6
000dbe30  ldr     r0, [r0, r3]
000dbe32  ldr     r1, [r1]
000dbe34  blx     #0xddbfc ; -> objc_msgSend
000dbe38  tst.w   r0, #0xff
000dbe3c  beq     #0xdbea8
000dbe3e  ldr     r3, [r5]
000dbe40  movs    r2, #0
000dbe42  mov     r1, r6
000dbe44  ldr     r0, [r4, r3]
000dbe46  movs    r3, #1
000dbe48  b       #0xdbe78
000dbe4a  cmp     r3, #4
000dbe4c  bne     #0xdbe7e
000dbe4e  ldr     r1, [pc, #0x74]
000dbe50  ldr     r5, [pc, #0x74]
000dbe52  add     r1, pc ; -> 0x000fd9a4  '\x10\x0b\x0f'
000dbe54  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbe56  ldr     r6, [r1]
000dbe58  ldr     r1, [pc, #0x70]
000dbe5a  ldr     r3, [r5]
000dbe5c  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbe5e  mov     r2, r6
000dbe60  ldr     r0, [r0, r3]
000dbe62  ldr     r1, [r1]
000dbe64  blx     #0xddbfc ; -> objc_msgSend
000dbe68  tst.w   r0, #0xff
000dbe6c  beq     #0xdbea8
000dbe6e  ldr     r3, [r5]
000dbe70  movs    r2, #0
000dbe72  mov     r1, r6
000dbe74  ldr     r0, [r4, r3]
000dbe76  mov     r3, r2
000dbe78  blx     #0xddbfc ; -> objc_msgSend
000dbe7c  b       #0xdbea8
000dbe7e  ldr     r1, [pc, #0x50]
000dbe80  ldr     r5, [pc, #0x50]
000dbe82  add     r1, pc ; -> 0x000fd9a0  
000dbe84  add     r5, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dbe86  ldr     r6, [r1]
000dbe88  ldr     r1, [pc, #0x4c]
000dbe8a  ldr     r3, [r5]
000dbe8c  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dbe8e  mov     r2, r6
000dbe90  ldr     r0, [r0, r3]
000dbe92  ldr     r1, [r1]
000dbe94  blx     #0xddbfc ; -> objc_msgSend
000dbe98  tst.w   r0, #0xff
000dbe9c  beq     #0xdbea8
000dbe9e  ldr     r3, [r5]
000dbea0  mov     r1, r6
000dbea2  ldr     r0, [r4, r3]
000dbea4  blx     #0xddbfc ; -> objc_msgSend
000dbea8  ldr     r3, [pc, #0x30]
000dbeaa  movs    r2, #0
000dbeac  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dbeae  ldr     r3, [r3]
000dbeb0  str     r2, [r4, r3]
000dbeb2  pop     {r4, r5, r6, r7, pc}
000dbeb4  lsrs    r0, r6, #0xa
000dbeb6  movs    r2, r0
000dbeb8  subs    r6, r7, r5
000dbeba  movs    r2, r0
000dbebc  lsrs    r0, r1, #0xa
000dbebe  movs    r2, r0
000dbec0  lsrs    r0, r4, #0x19
000dbec2  movs    r2, r0
000dbec4  subs    r6, r1, r5
000dbec6  movs    r2, r0
000dbec8  lsrs    r0, r3, #9
000dbeca  movs    r2, r0
000dbecc  lsrs    r0, r6, #0x18
000dbece  movs    r2, r0
000dbed0  subs    r2, r3, r4
000dbed2  movs    r2, r0
000dbed4  lsrs    r0, r5, #8
000dbed6  movs    r2, r0
000dbed8  lsrs    r0, r0, #0x18
000dbeda  movs    r2, r0
000dbedc  lsrs    r0, r3, #8
000dbede  movs    r2, r0
