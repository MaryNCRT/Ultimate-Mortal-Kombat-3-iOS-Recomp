========================================================================
t_r_ermac_fatal_slam  0x000497d8  652 bytes   mkreact.c
========================================================================

000497d8  push    {r4, r5, r6, r7, lr}
000497da  add     r7, sp, #0xc
000497dc  ldr.w   r3, [r0, #0xa4]
000497e0  movw    r2, #0x1f7
000497e4  mov     r5, r0
000497e6  adds    r3, #1
000497e8  ldr.w   r6, [r0, #0x108]
000497ec  ldr.w   r4, [r0, r3, lsl #3]
000497f0  cmp     r4, r2
000497f2  beq.w   #0x49982
000497f6  ble     #0x49822
000497f8  movw    r2, #0x1ff
000497fc  cmp     r4, r2
000497fe  beq.w   #0x499be
00049802  bgt     #0x49878
00049804  movw    r1, #0x1fb
00049808  cmp     r4, r1
0004980a  beq.w   #0x49950
0004980e  cmp.w   r4, #0x1fc
00049812  beq.w   #0x49932
00049816  cmp.w   r4, #0x1fa
0004981a  beq     #0x498f2
0004981c  mvn     r0, #2
00049820  pop     {r4, r5, r6, r7, pc}
00049822  movw    r1, #0x1f1
00049826  cmp     r4, r1
00049828  beq.w   #0x4996a
0004982c  bgt     #0x498ac
0004982e  cmp.w   r4, #0x1ee
00049832  beq.w   #0x499ea
00049836  cmp.w   r4, #0x1f0
0004983a  beq.w   #0x499d6
0004983e  cmp     r4, #0
00049840  bne     #0x4981c
00049842  mov     r0, r6
00049844  bl      #0x57b6c ; -> center_around_me
00049848  ldr.w   r3, [r5, #0xa4]
0004984c  mov.w   r2, #0x1ee
00049850  mov     r0, r4
00049852  adds    r3, #1
00049854  str.w   r2, [r5, r3, lsl #3]
00049858  ldr.w   r3, [r5, #0xa4]
0004985c  ldr     r2, [pc, #0x1cc]
0004985e  adds    r3, #1
00049860  str.w   r3, [r5, #0xa4]
00049864  lsls    r3, r3, #3
00049866  adds    r3, r3, r5
00049868  add     r2, pc ; -> 0x00047af5  t_slammed_shake_up
0004986a  str     r2, [r3, #4]
0004986c  ldr.w   r3, [r5, #0xa4]
00049870  adds    r3, #1
00049872  str.w   r4, [r5, r3, lsl #3]
00049876  b       #0x49820
00049878  movw    r2, #0x201
0004987c  cmp     r4, r2
0004987e  beq     #0x49906
00049880  bge.w   #0x49a0c
00049884  str.w   r2, [r0, r3, lsl #3]
00049888  ldr.w   r2, [pc, #0x1a4]
0004988c  ldr.w   r3, [r0, #0xa4]
00049890  add     r2, pc ; -> 0x00049a65  t_death_slam_pause
00049892  adds    r3, #1
00049894  str.w   r3, [r0, #0xa4]
00049898  lsls    r3, r3, #3
0004989a  adds    r3, r3, r5
0004989c  movs    r0, #0
0004989e  str     r2, [r3, #4]
000498a0  ldr.w   r3, [r5, #0xa4]
000498a4  adds    r3, #1
000498a6  str.w   r0, [r5, r3, lsl #3]
000498aa  b       #0x49820
000498ac  movw    r1, #0x1f5
000498b0  cmp     r4, r1
000498b2  beq     #0x499a4
000498b4  bgt     #0x498dc
000498b6  cmp.w   r4, #0x1f2
000498ba  bne     #0x4981c
000498bc  movs    r3, #8
000498be  str     r3, [r6, #0x44]
000498c0  ldr.w   r3, [r0, #0xa4]
000498c4  ldr.w   r2, [pc, #0x16c]
000498c8  adds    r3, #1
000498ca  add     r2, pc ; -> 0x00044575  t_slammed_zoom_up
000498cc  str.w   r1, [r0, r3, lsl #3]
000498d0  ldr.w   r3, [r0, #0xa4]
000498d4  adds    r3, #1
000498d6  str.w   r3, [r0, #0xa4]
000498da  b       #0x49898
000498dc  str.w   r2, [r0, r3, lsl #3]
000498e0  ldr.w   r2, [pc, #0x154]
000498e4  ldr.w   r3, [r0, #0xa4]
000498e8  add     r2, pc ; -> 0x00049a65  t_death_slam_pause
000498ea  adds    r3, #1
000498ec  str.w   r3, [r0, #0xa4]
000498f0  b       #0x49898
000498f2  str.w   r1, [r0, r3, lsl #3]
000498f6  ldr     r2, [pc, #0x144]
000498f8  ldr.w   r3, [r0, #0xa4]
000498fc  add     r2, pc ; -> 0x000470dd  t_slammed_slam_down
000498fe  adds    r3, #1
00049900  str.w   r3, [r0, #0xa4]
00049904  b       #0x49898
00049906  mov     r0, r6
00049908  bl      #0x54f70 ; -> set_inviso
0004990c  mov     r0, r6
0004990e  movs    r3, #0x18
00049910  str     r3, [r6, #0x1c]
00049912  bl      #0x58d70 ; -> create_fx
00049916  mov     r0, r6
00049918  bl      #0x54ed0 ; -> set_nocol
0004991c  ldr.w   r3, [r5, #0xa4]
00049920  movs    r0, #3
00049922  movw    r2, #0x207
00049926  adds    r3, #1
00049928  str.w   r2, [r5, r3, lsl #3]
0004992c  str.w   r0, [r5, #0xfc]
00049930  b       #0x49820
00049932  movs    r3, #8
00049934  str     r3, [r6, #0x44]
00049936  ldr.w   r3, [r0, #0xa4]
0004993a  adds    r3, #1
0004993c  str.w   r2, [r0, r3, lsl #3]
00049940  ldr     r2, [pc, #0xfc]
00049942  ldr.w   r3, [r0, #0xa4]
00049946  add     r2, pc ; -> 0x00044575  t_slammed_zoom_up
00049948  adds    r3, #1
0004994a  str.w   r3, [r0, #0xa4]
0004994e  b       #0x49898
00049950  mov.w   r2, #0x1fc
00049954  str.w   r2, [r0, r3, lsl #3]
00049958  ldr.w   r2, [pc, #0xe8]
0004995c  ldr.w   r3, [r0, #0xa4]
00049960  add     r2, pc ; -> 0x00049a65  t_death_slam_pause
00049962  adds    r3, #1
00049964  str.w   r3, [r0, #0xa4]
00049968  b       #0x49898
0004996a  mov.w   r2, #0x1f2
0004996e  str.w   r2, [r0, r3, lsl #3]
00049972  ldr     r2, [pc, #0xd4]
00049974  ldr.w   r3, [r0, #0xa4]
00049978  add     r2, pc ; -> 0x00049a65  t_death_slam_pause
0004997a  adds    r3, #1
0004997c  str.w   r3, [r0, #0xa4]
00049980  b       #0x49898
00049982  movs    r3, #8
00049984  str     r3, [r6, #0x44]
00049986  ldr.w   r3, [r0, #0xa4]
0004998a  mov.w   r2, #0x1fa
0004998e  adds    r3, #1
00049990  str.w   r2, [r0, r3, lsl #3]
00049994  ldr     r2, [pc, #0xb4]
00049996  ldr.w   r3, [r0, #0xa4]
0004999a  add     r2, pc ; -> 0x00044575  t_slammed_zoom_up
0004999c  adds    r3, #1
0004999e  str.w   r3, [r0, #0xa4]
000499a2  b       #0x49898
000499a4  mov.w   r2, #0x1f6
000499a8  str.w   r2, [r0, r3, lsl #3]
000499ac  ldr.w   r2, [pc, #0xa0]
000499b0  ldr.w   r3, [r0, #0xa4]
000499b4  add     r2, pc ; -> 0x000470dd  t_slammed_slam_down
000499b6  adds    r3, #1
000499b8  str.w   r3, [r0, #0xa4]
000499bc  b       #0x49898
000499be  mov.w   r2, #0x200
000499c2  str.w   r2, [r0, r3, lsl #3]
000499c6  ldr     r2, [pc, #0x8c]
000499c8  ldr.w   r3, [r0, #0xa4]
000499cc  add     r2, pc ; -> 0x000470dd  t_slammed_slam_down
000499ce  adds    r3, #1
000499d0  str.w   r3, [r0, #0xa4]
000499d4  b       #0x49898
000499d6  str.w   r1, [r0, r3, lsl #3]
000499da  ldr     r2, [pc, #0x7c]
000499dc  ldr.w   r3, [r0, #0xa4]
000499e0  add     r2, pc ; -> 0x000470dd  t_slammed_slam_down
000499e2  adds    r3, #1
000499e4  str.w   r3, [r0, #0xa4]
000499e8  b       #0x49898
000499ea  movs    r3, #8
000499ec  str     r3, [r6, #0x44]
000499ee  ldr.w   r3, [r0, #0xa4]
000499f2  mov.w   r2, #0x1f0
000499f6  adds    r3, #1
000499f8  str.w   r2, [r0, r3, lsl #3]
000499fc  ldr     r2, [pc, #0x5c]
000499fe  ldr.w   r3, [r0, #0xa4]
00049a02  add     r2, pc ; -> 0x00044575  t_slammed_zoom_up
00049a04  adds    r3, #1
00049a06  str.w   r3, [r0, #0xa4]
00049a0a  b       #0x49898
00049a0c  movw    r3, #0x207
00049a10  cmp     r4, r3
00049a12  bne.w   #0x4981c
00049a16  mov     r0, r6
00049a18  bl      #0x5533c ; -> ground_player
00049a1c  ldr.w   r3, [pc, #0x40]
00049a20  add     r3, pc ; -> 0x000f3724  t_wait_forever
00049a22  ldr     r2, [r3]
00049a24  ldr.w   r3, [r5, #0xa4]
00049a28  b       #0x49898
00049a2a  nop     
00049a2c  b       #0x49f42
