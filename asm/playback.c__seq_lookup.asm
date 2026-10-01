========================================================================
seq_lookup  0x000adb80  7608 bytes   playback.c
========================================================================

000adb80  push    {r4, r5, r6, r7, lr}
000adb82  add     r7, sp, #0xc
000adb84  mov     r4, r0
000adb86  ldr.w   r0, [pc, #0xe30]
000adb8a  mov     r5, r1
000adb8c  mov     r6, r2
000adb8e  mov     r3, r6
000adb90  add     r0, pc ; -> 0x0017c904  'seq_lookup( %d, %d, %d );\n'
000adb92  mov     r1, r4
000adb94  mov     r2, r5
000adb96  blx     #0xddc38 ; -> printf
000adb9a  cmp     r4, #0x16
000adb9c  bhi     #0xadbd2
000adb9e  tbh     [pc, r4, lsl #1]
000adba2  movs    r2, r3
000adba4  lsls    r3, r4, #0xf
000adba6  lsls    r7, r7, #0xd
000adba8  lsls    r3, r2, #9
000adbaa  lsls    r1, r4, #8
000adbac  lsls    r7, r6, #0xa
000adbae  lsls    r5, r0, #0xa
000adbb0  lsls    r3, r2, #7
000adbb2  lsls    r1, r4, #6
000adbb4  lsls    r7, r0, #0x11
000adbb6  lsls    r1, r6, #0xe
000adbb8  lsls    r5, r2, #0x10
000adbba  lsls    r1, r5, #0xb
000adbbc  lsls    r5, r1, #0xd
000adbbe  lsls    r3, r3, #0xc
000adbc0  lsls    r7, r5, #5
000adbc2  lsls    r5, r7, #4
000adbc4  lsls    r3, r1, #4
000adbc6  lsls    r1, r3, #3
000adbc8  lsls    r5, r0, #8
000adbca  lsls    r1, r5, #2
000adbcc  lsls    r2, r7, #1
000adbce  lsls    r3, r1, #1
000adbd0  movs    r0, r3
000adbd2  movs    r0, #0
000adbd4  pop     {r4, r5, r6, r7, pc}
000adbd6  cmp     r5, #0x13
000adbd8  bhi     #0xadbd2
000adbda  addw    r3, pc, #8
000adbde  add.w   r3, r3, r5, lsl #2
000adbe2  mov     pc, r3
000adbe4  b.w     #0xaf092
000adbe8  b.w     #0xaf080
000adbec  b.w     #0xaf06e
000adbf0  b.w     #0xaf05c
000adbf4  b.w     #0xadbd2
000adbf8  b.w     #0xaf1fa
000adbfc  b.w     #0xadbd2
000adc00  b.w     #0xadbd2
000adc04  b.w     #0xadbd2
000adc08  b.w     #0xadbd2
000adc0c  b.w     #0xadbd2
000adc10  b.w     #0xadbd2
000adc14  b.w     #0xadbd2
000adc18  b.w     #0xaf1e8
000adc1c  b.w     #0xaf1d6
000adc20  b.w     #0xaf1c4
000adc24  b.w     #0xaf1b2
000adc28  b.w     #0xaf1a0
000adc2c  b.w     #0xaf18e
000adc30  b.w     #0xaf17c
000adc34  b.w     #0xadbd2
000adc38  cmp     r5, #0x12
000adc3a  bhi     #0xadbd2
000adc3c  addw    r3, pc, #6
000adc40  add.w   r3, r3, r5, lsl #2
000adc44  mov     pc, r3
000adc46  b.w     #0xae512
000adc4a  b.w     #0xadbd2
000adc4e  b.w     #0xae500
000adc52  b.w     #0xadbd2
000adc56  b.w     #0xadbd2
000adc5a  b.w     #0xadbd2
000adc5e  b.w     #0xadbd2
000adc62  b.w     #0xadbd2
000adc66  b.w     #0xadbd2
000adc6a  b.w     #0xadbd2
000adc6e  b.w     #0xadbd2
000adc72  b.w     #0xadbd2
000adc76  b.w     #0xadbd2
000adc7a  b.w     #0xae4ee
000adc7e  b.w     #0xae4dc
000adc82  b.w     #0xae4ca
000adc86  b.w     #0xadbd2
000adc8a  b.w     #0xadbd2
000adc8e  b.w     #0xae4b8
000adc92  b.w     #0xadbd2
000adc96  cmp     r5, #0x12
000adc98  bhi     #0xadbd2
000adc9a  addw    r3, pc, #8
000adc9e  add.w   r3, r3, r5, lsl #2
000adca2  mov     pc, r3
000adca4  b.w     #0xae5b4
000adca8  b.w     #0xadbd2
000adcac  b.w     #0xae5a2
000adcb0  b.w     #0xae590
000adcb4  b.w     #0xadbd2
000adcb8  b.w     #0xadbd2
000adcbc  b.w     #0xadbd2
000adcc0  b.w     #0xadbd2
000adcc4  b.w     #0xadbd2
000adcc8  b.w     #0xadbd2
000adccc  b.w     #0xadbd2
000adcd0  b.w     #0xadbd2
000adcd4  b.w     #0xadbd2
000adcd8  b.w     #0xae57e
000adcdc  b.w     #0xae5d8
000adce0  b.w     #0xae5c6
000adce4  b.w     #0xadbd2
000adce8  b.w     #0xadbd2
000adcec  b.w     #0xae56c
000adcf0  b.w     #0xadbd2
000adcf4  cmp     r5, #0x12
000adcf6  bhi.w   #0xadbd2
000adcfa  addw    r3, pc, #8
000adcfe  add.w   r3, r3, r5, lsl #2
000add02  mov     pc, r3
000add04  b.w     #0xae668
000add08  b.w     #0xadbd2
000add0c  b.w     #0xae656
000add10  b.w     #0xae644
000add14  b.w     #0xadbd2
000add18  b.w     #0xadbd2
000add1c  b.w     #0xadbd2
000add20  b.w     #0xadbd2
000add24  b.w     #0xadbd2
000add28  b.w     #0xadbd2
000add2c  b.w     #0xadbd2
000add30  b.w     #0xadbd2
000add34  b.w     #0xadbd2
000add38  b.w     #0xae632
000add3c  b.w     #0xae620
000add40  b.w     #0xae60e
000add44  b.w     #0xae5fc
000add48  b.w     #0xadbd2
000add4c  b.w     #0xae5ea
000add50  b.w     #0xadbd2
000add54  cmp     r5, #0x13
000add56  bhi.w   #0xadbd2
000add5a  addw    r3, pc, #8
000add5e  add.w   r3, r3, r5, lsl #2
000add62  mov     pc, r3
000add64  b.w     #0xae68c
000add68  b.w     #0xadbd2
000add6c  b.w     #0xae67a
000add70  b.w     #0xadbd2
000add74  b.w     #0xadbd2
000add78  b.w     #0xadbd2
000add7c  b.w     #0xadbd2
000add80  b.w     #0xadbd2
000add84  b.w     #0xadbd2
000add88  b.w     #0xadbd2
000add8c  b.w     #0xadbd2
000add90  b.w     #0xadbd2
000add94  b.w     #0xadbd2
000add98  b.w     #0xae6d4
000add9c  b.w     #0xae6c2
000adda0  b.w     #0xae6b0
000adda4  b.w     #0xae69e
000adda8  b.w     #0xae6f8
000addac  b.w     #0xae6e6
000addb0  b.w     #0xae70a
000addb4  b.w     #0xadbd2
000addb8  cmp     r5, #0x13
000addba  bhi.w   #0xadbd2
000addbe  addw    r3, pc, #8
000addc2  add.w   r3, r3, r5, lsl #2
000addc6  mov     pc, r3
000addc8  b.w     #0xae7e2
000addcc  b.w     #0xae7d0
000addd0  b.w     #0xadbd2
000addd4  b.w     #0xae7be
000addd8  b.w     #0xadbd2
000adddc  b.w     #0xadbd2
000adde0  b.w     #0xadbd2
000adde4  b.w     #0xadbd2
000adde8  b.w     #0xadbd2
000addec  b.w     #0xadbd2
000addf0  b.w     #0xadbd2
000addf4  b.w     #0xadbd2
000addf8  b.w     #0xadbd2
000addfc  b.w     #0xae7ac
000ade00  b.w     #0xae79a
000ade04  b.w     #0xae788
000ade08  b.w     #0xae776
000ade0c  b.w     #0xae764
000ade10  b.w     #0xae806
000ade14  b.w     #0xae7f4
000ade18  b.w     #0xadbd2
000ade1c  cmp     r5, #0x13
000ade1e  bhi.w   #0xadbd2
000ade22  addw    r3, pc, #8
000ade26  add.w   r3, r3, r5, lsl #2
000ade2a  mov     pc, r3
000ade2c  b.w     #0xaf44c
000ade30  b.w     #0xaf43a
000ade34  b.w     #0xaf428
000ade38  b.w     #0xaf416
000ade3c  b.w     #0xadbd2
000ade40  b.w     #0xaf404
000ade44  b.w     #0xadbd2
000ade48  b.w     #0xadbd2
000ade4c  b.w     #0xaf3f2
000ade50  b.w     #0xadbd2
000ade54  b.w     #0xadbd2
000ade58  b.w     #0xadbd2
000ade5c  b.w     #0xadbd2
000ade60  b.w     #0xaf3e0
000ade64  b.w     #0xaf3ce
000ade68  b.w     #0xaf3bc
000ade6c  b.w     #0xaf3aa
000ade70  b.w     #0xaf398
000ade74  b.w     #0xaf386
000ade78  b.w     #0xaf374
000ade7c  b.w     #0xadbd2
000ade80  cmp     r5, #0x13
000ade82  bhi.w   #0xadbd2
000ade86  addw    r3, pc, #8
000ade8a  add.w   r3, r3, r5, lsl #2
000ade8e  mov     pc, r3
000ade90  b.w     #0xaec6c
000ade94  b.w     #0xaec5a
000ade98  b.w     #0xaec48
000ade9c  b.w     #0xadbd2
000adea0  b.w     #0xadbd2
000adea4  b.w     #0xadbd2
000adea8  b.w     #0xadbd2
000adeac  b.w     #0xadbd2
000adeb0  b.w     #0xadbd2
000adeb4  b.w     #0xadbd2
000adeb8  b.w     #0xadbd2
000adebc  b.w     #0xadbd2
000adec0  b.w     #0xadbd2
000adec4  b.w     #0xaec36
000adec8  b.w     #0xaec24
000adecc  b.w     #0xaec12
000aded0  b.w     #0xaec00
000aded4  b.w     #0xaebee
000aded8  b.w     #0xae8de
000adedc  b.w     #0xae8cc
000adee0  b.w     #0xadbd2
000adee4  cmp     r5, #0x13
000adee6  bhi.w   #0xadbd2
000adeea  addw    r3, pc, #8
000adeee  add.w   r3, r3, r5, lsl #2
000adef2  mov     pc, r3
000adef4  b.w     #0xaf29c
000adef8  b.w     #0xaf28a
000adefc  b.w     #0xaf278
000adf00  b.w     #0xaf266
000adf04  b.w     #0xaf254
000adf08  b.w     #0xadbd2
000adf0c  b.w     #0xadbd2
000adf10  b.w     #0xadbd2
000adf14  b.w     #0xadbd2
000adf18  b.w     #0xaf242
000adf1c  b.w     #0xadbd2
000adf20  b.w     #0xadbd2
000adf24  b.w     #0xadbd2
000adf28  b.w     #0xaf230
000adf2c  b.w     #0xaf21e
000adf30  b.w     #0xaf494
000adf34  b.w     #0xaf482
000adf38  b.w     #0xaf470
000adf3c  b.w     #0xaf45e
000adf40  b.w     #0xaf362
000adf44  b.w     #0xadbd2
000adf48  cmp     r5, #0x13
000adf4a  bhi.w   #0xadbd2
000adf4e  addw    r3, pc, #8
000adf52  add.w   r3, r3, r5, lsl #2
000adf56  mov     pc, r3
000adf58  b.w     #0xae96e
000adf5c  b.w     #0xadbd2
000adf60  b.w     #0xae95c
000adf64  b.w     #0xae94a
000adf68  b.w     #0xadbd2
000adf6c  b.w     #0xadbd2
000adf70  b.w     #0xadbd2
000adf74  b.w     #0xadbd2
000adf78  b.w     #0xadbd2
000adf7c  b.w     #0xadbd2
000adf80  b.w     #0xadbd2
000adf84  b.w     #0xadbd2
000adf88  b.w     #0xadbd2
000adf8c  b.w     #0xae938
000adf90  b.w     #0xae926
000adf94  b.w     #0xae914
000adf98  b.w     #0xae902
000adf9c  b.w     #0xae8f0
000adfa0  b.w     #0xae72e
000adfa4  b.w     #0xae71c
000adfa8  b.w     #0xadbd2
000adfac  cmp     r5, #8
000adfae  bhi.w   #0xadbd2
000adfb2  addw    r3, pc, #8
000adfb6  add.w   r3, r3, r5, lsl #2
000adfba  mov     pc, r3
000adfbc  b.w     #0xae55a
000adfc0  b.w     #0xae548
000adfc4  b.w     #0xae536
000adfc8  b.w     #0xae524
000adfcc  b.w     #0xadbd2
000adfd0  b.w     #0xae4a6
000adfd4  b.w     #0xadbd2
000adfd8  b.w     #0xadbd2
000adfdc  b.w     #0xae494
000adfe0  b.w     #0xadbd2
000adfe4  cmp     r5, #0x13
000adfe6  bhi.w   #0xadbd2
000adfea  addw    r3, pc, #8
000adfee  add.w   r3, r3, r5, lsl #2
000adff2  mov     pc, r3
000adff4  b.w     #0xaf2c0
000adff8  b.w     #0xaf2ae
000adffc  b.w     #0xaf640
000ae000  b.w     #0xaf62e
000ae004  b.w     #0xadbd2
000ae008  b.w     #0xaf61c
000ae00c  b.w     #0xadbd2
000ae010  b.w     #0xadbd2
000ae014  b.w     #0xaf60a
000ae018  b.w     #0xadbd2
000ae01c  b.w     #0xadbd2
000ae020  b.w     #0xadbd2
000ae024  b.w     #0xadbd2
000ae028  b.w     #0xaf32c
000ae02c  b.w     #0xaf31a
000ae030  b.w     #0xaf308
000ae034  b.w     #0xaf2f6
000ae038  b.w     #0xaf2e4
000ae03c  b.w     #0xaf2d2
000ae040  b.w     #0xaf33e
000ae044  b.w     #0xadbd2
000ae048  cmp     r5, #0x13
000ae04a  bhi.w   #0xadbd2
000ae04e  addw    r3, pc, #8
000ae052  add.w   r3, r3, r5, lsl #2
000ae056  mov     pc, r3
000ae058  b.w     #0xaedb0
000ae05c  b.w     #0xaed9e
000ae060  b.w     #0xaed8c
000ae064  b.w     #0xaed7a
000ae068  b.w     #0xadbd2
000ae06c  b.w     #0xadbd2
000ae070  b.w     #0xadbd2
000ae074  b.w     #0xadbd2
000ae078  b.w     #0xadbd2
000ae07c  b.w     #0xadbd2
000ae080  b.w     #0xadbd2
000ae084  b.w     #0xadbd2
000ae088  b.w     #0xadbd2
000ae08c  b.w     #0xaed68
000ae090  b.w     #0xaed56
000ae094  b.w     #0xaed44
000ae098  b.w     #0xaed32
000ae09c  b.w     #0xaef84
000ae0a0  b.w     #0xaef72
000ae0a4  b.w     #0xaee9a
000ae0a8  b.w     #0xadbd2
000ae0ac  cmp     r5, #0x13
000ae0ae  bhi.w   #0xadbd2
000ae0b2  addw    r3, pc, #8
000ae0b6  add.w   r3, r3, r5, lsl #2
000ae0ba  mov     pc, r3
000ae0bc  b.w     #0xaef60
000ae0c0  b.w     #0xaef4e
000ae0c4  b.w     #0xaef3c
000ae0c8  b.w     #0xaef2a
000ae0cc  b.w     #0xadbd2
000ae0d0  b.w     #0xadbd2
000ae0d4  b.w     #0xadbd2
000ae0d8  b.w     #0xadbd2
000ae0dc  b.w     #0xadbd2
000ae0e0  b.w     #0xadbd2
000ae0e4  b.w     #0xadbd2
000ae0e8  b.w     #0xadbd2
000ae0ec  b.w     #0xadbd2
000ae0f0  b.w     #0xaef18
000ae0f4  b.w     #0xaef06
000ae0f8  b.w     #0xaeef4
000ae0fc  b.w     #0xaeee2
000ae100  b.w     #0xaeed0
000ae104  b.w     #0xaeebe
000ae108  b.w     #0xaeeac
000ae10c  b.w     #0xadbd2
000ae110  cmp     r5, #0x13
000ae112  bhi.w   #0xadbd2
000ae116  addw    r3, pc, #8
000ae11a  add.w   r3, r3, r5, lsl #2
000ae11e  mov     pc, r3
000ae120  b.w     #0xaf568
000ae124  b.w     #0xaf556
000ae128  b.w     #0xaf544
000ae12c  b.w     #0xaf532
000ae130  b.w     #0xaf520
000ae134  b.w     #0xadbd2
000ae138  b.w     #0xadbd2
000ae13c  b.w     #0xadbd2
000ae140  b.w     #0xaf50e
000ae144  b.w     #0xadbd2
000ae148  b.w     #0xadbd2
000ae14c  b.w     #0xadbd2
000ae150  b.w     #0xadbd2
000ae154  b.w     #0xaf4fc
000ae158  b.w     #0xaf4ec
000ae15c  b.w     #0xaf688
000ae160  b.w     #0xaf676
000ae164  b.w     #0xaf664
000ae168  b.w     #0xaf652
000ae16c  b.w     #0xaf20c
000ae170  b.w     #0xadbd2
000ae174  cmp     r5, #0x13
000ae176  bhi.w   #0xadbd2
000ae17a  addw    r3, pc, #8
000ae17e  add.w   r3, r3, r5, lsl #2
000ae182  mov     pc, r3
000ae184  b.w     #0xaf122
000ae188  b.w     #0xaf110
000ae18c  b.w     #0xaf0fe
000ae190  b.w     #0xaf0ec
000ae194  b.w     #0xadbd2
000ae198  b.w     #0xaf0da
000ae19c  b.w     #0xadbd2
000ae1a0  b.w     #0xadbd2
000ae1a4  b.w     #0xadbd2
000ae1a8  b.w     #0xadbd2
000ae1ac  b.w     #0xadbd2
000ae1b0  b.w     #0xadbd2
000ae1b4  b.w     #0xadbd2
000ae1b8  b.w     #0xaf0c8
000ae1bc  b.w     #0xaf0b6
000ae1c0  b.w     #0xaf0a4
000ae1c4  b.w     #0xaf16a
000ae1c8  b.w     #0xaf158
000ae1cc  b.w     #0xaf146
000ae1d0  b.w     #0xaf134
000ae1d4  b.w     #0xadbd2
000ae1d8  cmp     r5, #0x13
000ae1da  bhi.w   #0xadbd2
000ae1de  addw    r3, pc, #8
000ae1e2  add.w   r3, r3, r5, lsl #2
000ae1e6  mov     pc, r3
000ae1e8  b.w     #0xae8ba
000ae1ec  b.w     #0xadbd2
000ae1f0  b.w     #0xae8a8
000ae1f4  b.w     #0xae896
000ae1f8  b.w     #0xadbd2
000ae1fc  b.w     #0xadbd2
000ae200  b.w     #0xadbd2
000ae204  b.w     #0xadbd2
000ae208  b.w     #0xadbd2
000ae20c  b.w     #0xadbd2
000ae210  b.w     #0xadbd2
000ae214  b.w     #0xadbd2
000ae218  b.w     #0xadbd2
000ae21c  b.w     #0xae884
000ae220  b.w     #0xae872
000ae224  b.w     #0xae860
000ae228  b.w     #0xae84e
000ae22c  b.w     #0xae83c
000ae230  b.w     #0xae82a
000ae234  b.w     #0xae818
000ae238  b.w     #0xadbd2
000ae23c  cmp     r5, #0x13
000ae23e  bhi.w   #0xadbd2
000ae242  addw    r3, pc, #8
000ae246  add.w   r3, r3, r5, lsl #2
000ae24a  mov     pc, r3
000ae24c  b.w     #0xaecfc
000ae250  b.w     #0xaecea
000ae254  b.w     #0xaecd8
000ae258  b.w     #0xaecc6
000ae25c  b.w     #0xadbd2
000ae260  b.w     #0xadbd2
000ae264  b.w     #0xadbd2
000ae268  b.w     #0xadbd2
000ae26c  b.w     #0xadbd2
000ae270  b.w     #0xadbd2
000ae274  b.w     #0xadbd2
000ae278  b.w     #0xadbd2
000ae27c  b.w     #0xadbd2
000ae280  b.w     #0xaecb4
000ae284  b.w     #0xaeca2
000ae288  b.w     #0xaec90
000ae28c  b.w     #0xaec7e
000ae290  b.w     #0xaed20
000ae294  b.w     #0xaed0e
000ae298  b.w     #0xaedc2
000ae29c  b.w     #0xadbd2
000ae2a0  cmp     r5, #0x13
000ae2a2  bhi.w   #0xadbd2
000ae2a6  addw    r3, pc, #8
000ae2aa  add.w   r3, r3, r5, lsl #2
000ae2ae  mov     pc, r3
000ae2b0  b.w     #0xaf5f8
000ae2b4  b.w     #0xaf5e6
000ae2b8  b.w     #0xaf5d4
000ae2bc  b.w     #0xaf5c2
000ae2c0  b.w     #0xaf5b0
000ae2c4  b.w     #0xadbd2
000ae2c8  b.w     #0xadbd2
000ae2cc  b.w     #0xadbd2
000ae2d0  b.w     #0xaf59e
000ae2d4  b.w     #0xadbd2
000ae2d8  b.w     #0xadbd2
000ae2dc  b.w     #0xadbd2
000ae2e0  b.w     #0xadbd2
000ae2e4  b.w     #0xaf58c
000ae2e8  b.w     #0xaf57a
000ae2ec  b.w     #0xaf4dc
000ae2f0  b.w     #0xaf4ca
000ae2f4  b.w     #0xaf4b8
000ae2f8  b.w     #0xaf4a6
000ae2fc  b.w     #0xaf350
000ae300  b.w     #0xadbd2
000ae304  cmp     r5, #0x13
000ae306  bhi.w   #0xadbd2
000ae30a  addw    r3, pc, #8
000ae30e  add.w   r3, r3, r5, lsl #2
000ae312  mov     pc, r3
000ae314  b.w     #0xaeb4c
000ae318  b.w     #0xaeb3a
000ae31c  b.w     #0xadbd2
000ae320  b.w     #0xaeb28
000ae324  b.w     #0xadbd2
000ae328  b.w     #0xadbd2
000ae32c  b.w     #0xadbd2
000ae330  b.w     #0xadbd2
000ae334  b.w     #0xadbd2
000ae338  b.w     #0xadbd2
000ae33c  b.w     #0xadbd2
000ae340  b.w     #0xadbd2
000ae344  b.w     #0xadbd2
000ae348  b.w     #0xaeb16
000ae34c  b.w     #0xaeb04
000ae350  b.w     #0xaeaf2
000ae354  b.w     #0xaeae0
000ae358  b.w     #0xae9a4
000ae35c  b.w     #0xae752
000ae360  b.w     #0xae740
000ae364  b.w     #0xadbd2
000ae368  cmp     r5, #0x13
000ae36a  bhi.w   #0xadbd2
000ae36e  addw    r3, pc, #8
000ae372  add.w   r3, r3, r5, lsl #2
000ae376  mov     pc, r3
000ae378  b.w     #0xaf04a
000ae37c  b.w     #0xaf038
000ae380  b.w     #0xaf026
000ae384  b.w     #0xaf014
000ae388  b.w     #0xadbd2
000ae38c  b.w     #0xadbd2
000ae390  b.w     #0xadbd2
000ae394  b.w     #0xadbd2
000ae398  b.w     #0xadbd2
000ae39c  b.w     #0xadbd2
000ae3a0  b.w     #0xadbd2
000ae3a4  b.w     #0xadbd2
000ae3a8  b.w     #0xadbd2
000ae3ac  b.w     #0xaf002
000ae3b0  b.w     #0xaeff0
000ae3b4  b.w     #0xaefde
000ae3b8  b.w     #0xaefcc
000ae3bc  b.w     #0xaefba
000ae3c0  b.w     #0xaefa8
000ae3c4  b.w     #0xaef96
000ae3c8  b.w     #0xadbd2
000ae3cc  cmp     r5, #0x13
000ae3ce  bhi.w   #0xadbd2
000ae3d2  addw    r3, pc, #8
000ae3d6  add.w   r3, r3, r5, lsl #2
000ae3da  mov     pc, r3
000ae3dc  b.w     #0xaebdc
000ae3e0  b.w     #0xadbd2
000ae3e4  b.w     #0xaebca
000ae3e8  b.w     #0xaebb8
000ae3ec  b.w     #0xadbd2
000ae3f0  b.w     #0xadbd2
000ae3f4  b.w     #0xadbd2
000ae3f8  b.w     #0xadbd2
000ae3fc  b.w     #0xadbd2
000ae400  b.w     #0xadbd2
000ae404  b.w     #0xadbd2
000ae408  b.w     #0xadbd2
000ae40c  b.w     #0xadbd2
000ae410  b.w     #0xaeba6
000ae414  b.w     #0xaeb94
000ae418  b.w     #0xaeb82
000ae41c  b.w     #0xaeb70
000ae420  b.w     #0xaeb5e
000ae424  b.w     #0xae992
000ae428  b.w     #0xae980
000ae42c  b.w     #0xadbd2
000ae430  cmp     r5, #0x13
000ae432  bhi.w   #0xadbd2
000ae436  addw    r3, pc, #8
000ae43a  add.w   r3, r3, r5, lsl #2
000ae43e  mov     pc, r3
000ae440  b.w     #0xaee88
000ae444  b.w     #0xaee76
000ae448  b.w     #0xaee64
000ae44c  b.w     #0xaee52
000ae450  b.w     #0xadbd2
000ae454  b.w     #0xadbd2
000ae458  b.w     #0xadbd2
000ae45c  b.w     #0xadbd2
000ae460  b.w     #0xadbd2
000ae464  b.w     #0xadbd2
000ae468  b.w     #0xadbd2
000ae46c  b.w     #0xadbd2
000ae470  b.w     #0xadbd2
000ae474  b.w     #0xaee40
000ae478  b.w     #0xaee2e
000ae47c  b.w     #0xaee1c
000ae480  b.w     #0xaee0a
000ae484  b.w     #0xaedf8
000ae488  b.w     #0xaede6
000ae48c  b.w     #0xaedd4
000ae490  b.w     #0xadbd2
000ae494  ldr.w   r0, [pc, #0x524]
000ae498  lsls    r3, r6, #2
000ae49a  lsls    r2, r6, #4
000ae49c  add     r2, r3
000ae49e  add     r0, pc ; -> 0x000de49c  seq_reptile_invisibility
000ae4a0  add     r0, r2
000ae4a2  b.w     #0xadbd4
000ae4a6  ldr.w   r0, [pc, #0x518]
000ae4aa  lsls    r3, r6, #2
000ae4ac  lsls    r2, r6, #4
000ae4ae  add     r2, r3
000ae4b0  add     r0, pc ; -> 0x000de474  seq_reptile_reverseelbow
000ae4b2  add     r0, r2
000ae4b4  b.w     #0xadbd4
000ae4b8  ldr.w   r0, [pc, #0x508]
000ae4bc  lsls    r3, r6, #2
000ae4be  lsls    r2, r6, #4
000ae4c0  add     r2, r3
000ae4c2  add     r0, pc ; -> 0x000e03b4  seq_humsmoke_babality
000ae4c4  add     r0, r2
000ae4c6  b.w     #0xadbd4
000ae4ca  ldr.w   r0, [pc, #0x4fc]
000ae4ce  lsls    r3, r6, #2
000ae4d0  lsls    r2, r6, #4
000ae4d2  add     r2, r3
000ae4d4  add     r0, pc ; -> 0x000e038c  seq_humsmoke_fatality1
000ae4d6  add     r0, r2
000ae4d8  b.w     #0xadbd4
000ae4dc  ldr.w   r0, [pc, #0x4ec]
000ae4e0  lsls    r3, r6, #2
000ae4e2  lsls    r2, r6, #4
000ae4e4  add     r2, r3
000ae4e6  add     r0, pc ; -> 0x000de244  seq_mercy
000ae4e8  add     r0, r2
000ae4ea  b.w     #0xadbd4
000ae4ee  ldr.w   r0, [pc, #0x4e0]
000ae4f2  lsls    r3, r6, #2
000ae4f4  lsls    r2, r6, #4
000ae4f6  add     r2, r3
000ae4f8  add     r0, pc ; -> 0x000e03dc  seq_humsmoke_stage
000ae4fa  add     r0, r2
000ae4fc  b.w     #0xadbd4
000ae500  ldr.w   r0, [pc, #0x4d0]
000ae504  lsls    r3, r6, #2
000ae506  lsls    r2, r6, #4
000ae508  add     r2, r3
000ae50a  add     r0, pc ; -> 0x000e0364  seq_humsmoke_teleportpunch
000ae50c  add     r0, r2
000ae50e  b.w     #0xadbd4
000ae512  ldr.w   r0, [pc, #0x4c4]
000ae516  lsls    r3, r6, #2
000ae518  lsls    r2, r6, #4
000ae51a  add     r2, r3
000ae51c  add     r0, pc ; -> 0x000e033c  seq_humsmoke_spear
000ae51e  add     r0, r2
000ae520  b.w     #0xadbd4
000ae524  ldr.w   r0, [pc, #0x4b4]
000ae528  lsls    r3, r6, #2
000ae52a  lsls    r2, r6, #4
000ae52c  add     r2, r3
000ae52e  add     r0, pc ; -> 0x000de44c  seq_reptile_slide
000ae530  add     r0, r2
000ae532  b.w     #0xadbd4
000ae536  ldr.w   r0, [pc, #0x4a8]
000ae53a  lsls    r3, r6, #2
000ae53c  lsls    r2, r6, #4
000ae53e  add     r2, r3
000ae540  add     r0, pc ; -> 0x000de424  seq_reptile_fastforceball
000ae542  add     r0, r2
000ae544  b.w     #0xadbd4
000ae548  ldr.w   r0, [pc, #0x498]
000ae54c  lsls    r3, r6, #2
000ae54e  lsls    r2, r6, #4
000ae550  add     r2, r3
000ae552  add     r0, pc ; -> 0x000de3fc  seq_reptile_slowforceball
000ae554  add     r0, r2
000ae556  b.w     #0xadbd4
000ae55a  ldr.w   r0, [pc, #0x48c]
000ae55e  lsls    r3, r6, #2
000ae560  lsls    r2, r6, #4
000ae562  add     r2, r3
000ae564  add     r0, pc ; -> 0x000de3d4  seq_reptile_acidspit
000ae566  add     r0, r2
000ae568  b.w     #0xadbd4
000ae56c  ldr.w   r0, [pc, #0x47c]
000ae570  lsls    r3, r6, #2
000ae572  lsls    r2, r6, #4
000ae574  add     r2, r3
000ae576  add     r0, pc ; -> 0x000e02ec  seq_clasubzero_babality
000ae578  add     r0, r2
000ae57a  b.w     #0xadbd4
000ae57e  ldr.w   r0, [pc, #0x470]
000ae582  lsls    r3, r6, #2
000ae584  lsls    r2, r6, #4
000ae586  add     r2, r3
000ae588  add     r0, pc ; -> 0x000e0314  seq_clasubzero_stage
000ae58a  add     r0, r2
000ae58c  b.w     #0xadbd4
000ae590  ldr.w   r0, [pc, #0x460]
000ae594  lsls    r3, r6, #2
000ae596  lsls    r2, r6, #4
000ae598  add     r2, r3
000ae59a  add     r0, pc ; -> 0x000e029c  seq_clasubzero_slide
000ae59c  add     r0, r2
000ae59e  b.w     #0xadbd4
000ae5a2  ldr.w   r0, [pc, #0x454]
000ae5a6  lsls    r3, r6, #2
000ae5a8  lsls    r2, r6, #4
000ae5aa  add     r2, r3
000ae5ac  add     r0, pc ; -> 0x000e0274  seq_clasubzero_groundfreeze
000ae5ae  add     r0, r2
000ae5b0  b.w     #0xadbd4
000ae5b4  ldr.w   r0, [pc, #0x444]
000ae5b8  lsls    r3, r6, #2
000ae5ba  lsls    r2, r6, #4
000ae5bc  add     r2, r3
000ae5be  add     r0, pc ; -> 0x000e024c  seq_clasubzero_freeze
000ae5c0  add     r0, r2
000ae5c2  b.w     #0xadbd4
000ae5c6  ldr.w   r0, [pc, #0x438]
000ae5ca  lsls    r3, r6, #2
000ae5cc  lsls    r2, r6, #4
000ae5ce  add     r2, r3
000ae5d0  add     r0, pc ; -> 0x000e02c4  seq_clasubzero_fatality1
000ae5d2  add     r0, r2
000ae5d4  b.w     #0xadbd4
000ae5d8  ldr.w   r0, [pc, #0x428]
000ae5dc  lsls    r3, r6, #2
000ae5de  lsls    r2, r6, #4
000ae5e0  add     r2, r3
000ae5e2  add     r0, pc ; -> 0x000de244  seq_mercy
000ae5e4  add     r0, r2
000ae5e6  b.w     #0xadbd4
000ae5ea  ldr.w   r0, [pc, #0x41c]
000ae5ee  lsls    r3, r6, #2
000ae5f0  lsls    r2, r6, #4
000ae5f2  add     r2, r3
000ae5f4  add     r0, pc ; -> 0x000e01fc  seq_ermac_babality
000ae5f6  add     r0, r2
000ae5f8  b.w     #0xadbd4
000ae5fc  ldr.w   r0, [pc, #0x40c]
000ae600  lsls    r3, r6, #2
000ae602  lsls    r2, r6, #4
000ae604  add     r2, r3
000ae606  add     r0, pc ; -> 0x000e01ac  seq_ermac_fatality2
000ae608  add     r0, r2
000ae60a  b.w     #0xadbd4
000ae60e  ldr.w   r0, [pc, #0x400]
000ae612  lsls    r3, r6, #2
000ae614  lsls    r2, r6, #4
000ae616  add     r2, r3
000ae618  add     r0, pc ; -> 0x000e01d4  seq_ermac_fatality1
000ae61a  add     r0, r2
000ae61c  b.w     #0xadbd4
000ae620  ldr.w   r0, [pc, #0x3f0]
000ae624  lsls    r3, r6, #2
000ae626  lsls    r2, r6, #4
000ae628  add     r2, r3
000ae62a  add     r0, pc ; -> 0x000de244  seq_mercy
000ae62c  add     r0, r2
000ae62e  b.w     #0xadbd4
000ae632  ldr.w   r0, [pc, #0x3e4]
000ae636  lsls    r3, r6, #2
000ae638  lsls    r2, r6, #4
000ae63a  add     r2, r3
000ae63c  add     r0, pc ; -> 0x000e0224  seq_ermac_stage
000ae63e  add     r0, r2
000ae640  b.w     #0xadbd4
000ae644  ldr.w   r0, [pc, #0x3d4]
000ae648  lsls    r3, r6, #2
000ae64a  lsls    r2, r6, #4
000ae64c  add     r2, r3
000ae64e  add     r0, pc ; -> 0x000e0184  seq_ermac_telekineticslam
000ae650  add     r0, r2
000ae652  b.w     #0xadbd4
000ae656  ldr.w   r0, [pc, #0x3c8]
000ae65a  lsls    r3, r6, #2
000ae65c  lsls    r2, r6, #4
000ae65e  add     r2, r3
000ae660  add     r0, pc ; -> 0x000e015c  seq_ermac_teleportpunch
000ae662  add     r0, r2
000ae664  b.w     #0xadbd4
000ae668  ldr.w   r0, [pc, #0x3b8]
000ae66c  lsls    r3, r6, #2
000ae66e  lsls    r2, r6, #4
000ae670  add     r2, r3
000ae672  add     r0, pc ; -> 0x000e0134  seq_ermac_fireball
000ae674  add     r0, r2
000ae676  b.w     #0xadbd4
000ae67a  ldr.w   r0, [pc, #0x3ac]
000ae67e  lsls    r3, r6, #2
000ae680  lsls    r2, r6, #4
000ae682  add     r2, r3
000ae684  add     r0, pc ; -> 0x000deba4  seq_scorpion_teleportpunch
000ae686  add     r0, r2
000ae688  b.w     #0xadbd4
000ae68c  ldr.w   r0, [pc, #0x39c]
000ae690  lsls    r3, r6, #2
000ae692  lsls    r2, r6, #4
000ae694  add     r2, r3
000ae696  add     r0, pc ; -> 0x000deb7c  seq_scorpion_spear
000ae698  add     r0, r2
000ae69a  b.w     #0xadbd4
000ae69e  ldr.w   r0, [pc, #0x390]
000ae6a2  lsls    r3, r6, #2
000ae6a4  lsls    r2, r6, #4
000ae6a6  add     r2, r3
000ae6a8  add     r0, pc ; -> 0x000debf4  seq_scorpion_fatality2
000ae6aa  add     r0, r2
000ae6ac  b.w     #0xadbd4
000ae6b0  ldr.w   r0, [pc, #0x380]
000ae6b4  lsls    r3, r6, #2
000ae6b6  lsls    r2, r6, #4
000ae6b8  add     r2, r3
000ae6ba  add     r0, pc ; -> 0x000debcc  seq_scorpion_fatality1
000ae6bc  add     r0, r2
000ae6be  b.w     #0xadbd4
000ae6c2  ldr.w   r0, [pc, #0x374]
000ae6c6  lsls    r3, r6, #2
000ae6c8  lsls    r2, r6, #4
000ae6ca  add     r2, r3
000ae6cc  add     r0, pc ; -> 0x000de244  seq_mercy
000ae6ce  add     r0, r2
000ae6d0  b.w     #0xadbd4
000ae6d4  ldr.w   r0, [pc, #0x364]
000ae6d8  lsls    r3, r6, #2
000ae6da  lsls    r2, r6, #4
000ae6dc  add     r2, r3
000ae6de  add     r0, pc ; -> 0x000dec94  seq_scorpion_stage
000ae6e0  add     r0, r2
000ae6e2  b.w     #0xadbd4
000ae6e6  ldr.w   r0, [pc, #0x358]
000ae6ea  lsls    r3, r6, #2
000ae6ec  lsls    r2, r6, #4
000ae6ee  add     r2, r3
000ae6f0  add     r0, pc ; -> 0x000dec44  seq_scorpion_babality
000ae6f2  add     r0, r2
000ae6f4  b.w     #0xadbd4
000ae6f8  ldr.w   r0, [pc, #0x348]
000ae6fc  lsls    r3, r6, #2
000ae6fe  lsls    r2, r6, #4
000ae700  add     r2, r3
000ae702  add     r0, pc ; -> 0x000dec1c  seq_scorpion_animality
000ae704  add     r0, r2
000ae706  b.w     #0xadbd4
000ae70a  ldr.w   r0, [pc, #0x33c]
000ae70e  lsls    r3, r6, #2
000ae710  lsls    r2, r6, #4
000ae712  add     r2, r3
000ae714  add     r0, pc ; -> 0x000dec6c  seq_scorpion_friendship
000ae716  add     r0, r2
000ae718  b.w     #0xadbd4
000ae71c  ldr.w   r0, [pc, #0x32c]
000ae720  lsls    r3, r6, #2
000ae722  lsls    r2, r6, #4
000ae724  add     r2, r3
000ae726  add     r0, pc ; -> 0x000df16c  seq_sektor_friendship
000ae728  add     r0, r2
000ae72a  b.w     #0xadbd4
000ae72e  ldr.w   r0, [pc, #0x320]
000ae732  lsls    r3, r6, #2
000ae734  lsls    r2, r6, #4
000ae736  add     r2, r3
000ae738  add     r0, pc ; -> 0x000df144  seq_sektor_babality
000ae73a  add     r0, r2
000ae73c  b.w     #0xadbd4
000ae740  ldr.w   r0, [pc, #0x310]
000ae744  lsls    r3, r6, #2
000ae746  lsls    r2, r6, #4
000ae748  add     r2, r3
000ae74a  add     r0, pc ; -> 0x000df964  seq_kabal_friendship
000ae74c  add     r0, r2
000ae74e  b.w     #0xadbd4
000ae752  ldr.w   r0, [pc, #0x304]
000ae756  lsls    r3, r6, #2
000ae758  lsls    r2, r6, #4
000ae75a  add     r2, r3
000ae75c  add     r0, pc ; -> 0x000df93c  seq_kabal_babality
000ae75e  add     r0, r2
000ae760  b.w     #0xadbd4
000ae764  ldr.w   r0, [pc, #0x2f4]
000ae768  lsls    r3, r6, #2
000ae76a  lsls    r2, r6, #4
000ae76c  add     r2, r3
000ae76e  add     r0, pc ; -> 0x000e0094  seq_mileena_animality
000ae770  add     r0, r2
000ae772  b.w     #0xadbd4
000ae776  ldr.w   r0, [pc, #0x2e8]
000ae77a  lsls    r3, r6, #2
000ae77c  lsls    r2, r6, #4
000ae77e  add     r2, r3
000ae780  add     r0, pc ; -> 0x000e0044  seq_mileena_fatality2
000ae782  add     r0, r2
000ae784  b.w     #0xadbd4
000ae788  ldr.w   r0, [pc, #0x2d8]
000ae78c  lsls    r3, r6, #2
000ae78e  lsls    r2, r6, #4
000ae790  add     r2, r3
000ae792  add     r0, pc ; -> 0x000e006c  seq_mileena_fatality1
000ae794  add     r0, r2
000ae796  b.w     #0xadbd4
000ae79a  ldr.w   r0, [pc, #0x2cc]
000ae79e  lsls    r3, r6, #2
000ae7a0  lsls    r2, r6, #4
000ae7a2  add     r2, r3
000ae7a4  add     r0, pc ; -> 0x000de244  seq_mercy
000ae7a6  add     r0, r2
000ae7a8  b.w     #0xadbd4
000ae7ac  ldr.w   r0, [pc, #0x2bc]
000ae7b0  lsls    r3, r6, #2
000ae7b2  lsls    r2, r6, #4
000ae7b4  add     r2, r3
000ae7b6  add     r0, pc ; -> 0x000e010c  seq_mileena_stage
000ae7b8  add     r0, r2
000ae7ba  b.w     #0xadbd4
000ae7be  ldr.w   r0, [pc, #0x2b0]
000ae7c2  lsls    r3, r6, #2
000ae7c4  lsls    r2, r6, #4
000ae7c6  add     r2, r3
000ae7c8  add     r0, pc ; -> 0x000dfff4  seq_mileena_teleportkick
000ae7ca  add     r0, r2
000ae7cc  b.w     #0xadbd4
000ae7d0  ldr.w   r0, [pc, #0x2a0]
000ae7d4  lsls    r3, r6, #2
000ae7d6  lsls    r2, r6, #4
000ae7d8  add     r2, r3
000ae7da  add     r0, pc ; -> 0x000e001c  seq_mileena_groundroll
000ae7dc  add     r0, r2
000ae7de  b.w     #0xadbd4
000ae7e2  ldr.w   r0, [pc, #0x294]
000ae7e6  lsls    r3, r6, #2
000ae7e8  lsls    r2, r6, #4
000ae7ea  add     r2, r3
000ae7ec  add     r0, pc ; -> 0x000dffcc  seq_mileena_saitoss
000ae7ee  add     r0, r2
000ae7f0  b.w     #0xadbd4
000ae7f4  ldr.w   r0, [pc, #0x284]
000ae7f8  lsls    r3, r6, #2
000ae7fa  lsls    r2, r6, #4
000ae7fc  add     r2, r3
000ae7fe  add     r0, pc ; -> 0x000e00e4  seq_mileena_friendship
000ae800  add     r0, r2
000ae802  b.w     #0xadbd4
000ae806  ldr.w   r0, [pc, #0x278]
000ae80a  lsls    r3, r6, #2
000ae80c  lsls    r2, r6, #4
000ae80e  add     r2, r3
000ae810  add     r0, pc ; -> 0x000e00bc  seq_mileena_babality
000ae812  add     r0, r2
000ae814  b.w     #0xadbd4
000ae818  ldr.w   r0, [pc, #0x268]
000ae81c  lsls    r3, r6, #2
000ae81e  lsls    r2, r6, #4
000ae820  add     r2, r3
000ae822  add     r0, pc ; -> 0x000dff7c  seq_smoke_friendship
000ae824  add     r0, r2
000ae826  b.w     #0xadbd4
000ae82a  ldr.w   r0, [pc, #0x25c]
000ae82e  lsls    r3, r6, #2
000ae830  lsls    r2, r6, #4
000ae832  add     r2, r3
000ae834  add     r0, pc ; -> 0x000dff54  seq_smoke_babality
000ae836  add     r0, r2
000ae838  b.w     #0xadbd4
000ae83c  ldr.w   r0, [pc, #0x24c]
000ae840  lsls    r3, r6, #2
000ae842  lsls    r2, r6, #4
000ae844  add     r2, r3
000ae846  add     r0, pc ; -> 0x000dff2c  seq_smoke_animality
000ae848  add     r0, r2
000ae84a  b.w     #0xadbd4
000ae84e  ldr.w   r0, [pc, #0x240]
000ae852  lsls    r3, r6, #2
000ae854  lsls    r2, r6, #4
000ae856  add     r2, r3
000ae858  add     r0, pc ; -> 0x000dff04  seq_smoke_fatality2
000ae85a  add     r0, r2
000ae85c  b.w     #0xadbd4
000ae860  ldr.w   r0, [pc, #0x230]
000ae864  lsls    r3, r6, #2
000ae866  lsls    r2, r6, #4
000ae868  add     r2, r3
000ae86a  add     r0, pc ; -> 0x000dfedc  seq_smoke_fatality1
000ae86c  add     r0, r2
000ae86e  b.w     #0xadbd4
000ae872  ldr.w   r0, [pc, #0x224]
000ae876  lsls    r3, r6, #2
000ae878  lsls    r2, r6, #4
000ae87a  add     r2, r3
000ae87c  add     r0, pc ; -> 0x000de244  seq_mercy
000ae87e  add     r0, r2
000ae880  b.w     #0xadbd4
000ae884  ldr.w   r0, [pc, #0x214]
000ae888  lsls    r3, r6, #2
000ae88a  lsls    r2, r6, #4
000ae88c  add     r2, r3
000ae88e  add     r0, pc ; -> 0x000dffa4  seq_smoke_stage
000ae890  add     r0, r2
000ae892  b.w     #0xadbd4
000ae896  ldr.w   r0, [pc, #0x208]
000ae89a  lsls    r3, r6, #2
000ae89c  lsls    r2, r6, #4
000ae89e  add     r2, r3
000ae8a0  add     r0, pc ; -> 0x000dfeb4  seq_smoke_invisibility
000ae8a2  add     r0, r2
000ae8a4  b.w     #0xadbd4
000ae8a8  ldr.w   r0, [pc, #0x1f8]
000ae8ac  lsls    r3, r6, #2
000ae8ae  lsls    r2, r6, #4
000ae8b0  add     r2, r3
000ae8b2  add     r0, pc ; -> 0x000dfe8c  seq_smoke_teleportuppercut
000ae8b4  add     r0, r2
000ae8b6  b.w     #0xadbd4
000ae8ba  ldr.w   r0, [pc, #0x1ec]
000ae8be  lsls    r3, r6, #2
000ae8c0  lsls    r2, r6, #4
000ae8c2  add     r2, r3
000ae8c4  add     r0, pc ; -> 0x000dfe64  seq_smoke_spear
000ae8c6  add     r0, r2
000ae8c8  b.w     #0xadbd4
000ae8cc  ldr.w   r0, [pc, #0x1dc]
000ae8d0  lsls    r3, r6, #2
000ae8d2  lsls    r2, r6, #4
000ae8d4  add     r2, r3
000ae8d6  add     r0, pc ; -> 0x000de384  seq_kitana_friendship
000ae8d8  add     r0, r2
000ae8da  b.w     #0xadbd4
000ae8de  ldr.w   r0, [pc, #0x1d0]
000ae8e2  lsls    r3, r6, #2
000ae8e4  lsls    r2, r6, #4
000ae8e6  add     r2, r3
000ae8e8  add     r0, pc ; -> 0x000de35c  seq_kitana_babality
000ae8ea  add     r0, r2
000ae8ec  b.w     #0xadbd4
000ae8f0  ldr.w   r0, [pc, #0x1c0]
000ae8f4  lsls    r3, r6, #2
000ae8f6  lsls    r2, r6, #4
000ae8f8  add     r2, r3
000ae8fa  add     r0, pc ; -> 0x000df11c  seq_sektor_animality
000ae8fc  add     r0, r2
000ae8fe  b.w     #0xadbd4
000ae902  ldr.w   r0, [pc, #0x1b4]
000ae906  lsls    r3, r6, #2
000ae908  lsls    r2, r6, #4
000ae90a  add     r2, r3
000ae90c  add     r0, pc ; -> 0x000df0f4  seq_sektor_fatality2
000ae90e  add     r0, r2
000ae910  b.w     #0xadbd4
000ae914  ldr.w   r0, [pc, #0x1a4]
000ae918  lsls    r3, r6, #2
000ae91a  lsls    r2, r6, #4
000ae91c  add     r2, r3
000ae91e  add     r0, pc ; -> 0x000df0cc  seq_sektor_fatality1
000ae920  add     r0, r2
000ae922  b.w     #0xadbd4
000ae926  ldr.w   r0, [pc, #0x198]
000ae92a  lsls    r3, r6, #2
000ae92c  lsls    r2, r6, #4
000ae92e  add     r2, r3
000ae930  add     r0, pc ; -> 0x000de244  seq_mercy
000ae932  add     r0, r2
000ae934  b.w     #0xadbd4
000ae938  ldr.w   r0, [pc, #0x188]
000ae93c  lsls    r3, r6, #2
000ae93e  lsls    r2, r6, #4
000ae940  add     r2, r3
000ae942  add     r0, pc ; -> 0x000df194  seq_sektor_stage
000ae944  add     r0, r2
000ae946  b.w     #0xadbd4
000ae94a  ldr.w   r0, [pc, #0x17c]
000ae94e  lsls    r3, r6, #2
000ae950  lsls    r2, r6, #4
000ae952  add     r2, r3
000ae954  add     r0, pc ; -> 0x000df0a4  seq_sektor_teleportuppercut
000ae956  add     r0, r2
000ae958  b.w     #0xadbd4
000ae95c  ldr.w   r0, [pc, #0x16c]
000ae960  lsls    r3, r6, #2
000ae962  lsls    r2, r6, #4
000ae964  add     r2, r3
000ae966  add     r0, pc ; -> 0x000df07c  seq_sektor_seekingmissle
000ae968  add     r0, r2
000ae96a  b.w     #0xadbd4
000ae96e  ldr.w   r0, [pc, #0x160]
000ae972  lsls    r3, r6, #2
000ae974  lsls    r2, r6, #4
000ae976  add     r2, r3
000ae978  add     r0, pc ; -> 0x000df054  seq_sektor_missile
000ae97a  add     r0, r2
000ae97c  b.w     #0xadbd4
000ae980  ldr.w   r0, [pc, #0x150]
000ae984  lsls    r3, r6, #2
000ae986  lsls    r2, r6, #4
000ae988  add     r2, r3
000ae98a  add     r0, pc ; -> 0x000dfacc  seq_sheeva_friendship
000ae98c  add     r0, r2
000ae98e  b.w     #0xadbd4
000ae992  ldr.w   r0, [pc, #0x144]
000ae996  lsls    r3, r6, #2
000ae998  lsls    r2, r6, #4
000ae99a  add     r2, r3
000ae99c  add     r0, pc ; -> 0x000dfaa4  seq_sheeva_babality
000ae99e  add     r0, r2
000ae9a0  b.w     #0xadbd4
000ae9a4  ldr.w   r0, [pc, #0x134]
000ae9a8  lsls    r3, r6, #2
000ae9aa  lsls    r2, r6, #4
000ae9ac  add     r2, r3
000ae9ae  add     r0, pc ; -> 0x000df914  seq_kabal_animality
000ae9b0  add     r0, r2
000ae9b2  b.w     #0xadbd4
000ae9b6  nop     
000ae9b8  ldcl    p0, c0, [r0, #-0x30]!
