========================================================================
EASOC_MayhemGetLeaderBoard  0x000813ac  2360 bytes   EASDK_Handler.mm
========================================================================

000813ac  push    {r4, r5, r6, r7, lr}
000813ae  add     r7, sp, #0xc
000813b0  push.w  {r8, sl, fp}
000813b4  vpush   {d8, d9, d10, d11, d12, d13, d14, d15}
000813b8  sub     sp, #0x168
000813ba  str     r3, [sp, #0x28]
000813bc  ldr.w   r3, [pc, #0x7fc]
000813c0  str     r0, [sp, #0x34]
000813c2  add     r0, sp, #0x9c
000813c4  add     r3, pc ; -> 0x000f301c  0x0
000813c6  str     r1, [sp, #0x30]
000813c8  ldr     r3, [r3]
000813ca  str     r2, [sp, #0x2c]
000813cc  str     r7, [sp, #0xbc]
000813ce  str.w   sp, [sp, #0xc4]
000813d2  str     r3, [sp, #0xb4]
000813d4  ldr.w   r3, [pc, #0x7e8]
000813d8  add     r3, pc ; -> 0x000ee15e  GCC_except_table12
000813da  str     r3, [sp, #0xb8]
000813dc  ldr.w   r3, [pc, #0x7e4]
000813e0  add     r3, pc ; -> 0x00081a96  
000813e2  orr     r3, r3, #1
000813e6  str     r3, [sp, #0xc0]
000813e8  blx     #0xdd4ac ; -> Unwind_SjLj_Register
000813ec  ldr.w   r3, [pc, #0x7d8]
000813f0  add     r3, pc ; -> 0x000f3364  collateLeaderboards
000813f2  ldr     r3, [r3]
000813f4  str     r3, [sp, #0x24]
000813f6  ldr     r3, [r3]
000813f8  cmp     r3, #0
000813fa  bne.w   #0x81674
000813fe  ldr     r0, [sp, #0x2c]
00081400  cmp     r0, #5
00081402  beq.w   #0x81588
00081406  ldr.w   r3, [pc, #0x7c4]
0008140a  add     r3, pc ; -> 0x00379b34  m_leaderboards
0008140c  ldr     r0, [r3]
0008140e  ldr     r0, [r0]
00081410  cmp     r0, #0
00081412  beq.w   #0x819b6
00081416  mov.w   r4, #-1
0008141a  str     r4, [sp, #0xa0]
0008141c  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
00081420  cmp     r0, #0
00081422  beq.w   #0x817de
00081426  ldr.w   r1, [pc, #0x7a8]
0008142a  add     r1, pc ; -> 0x001758ac  drawLeaderBoardCnt
0008142c  ldr     r3, [r1]
0008142e  adds    r2, r3, #1
00081430  str     r2, [r1]
00081432  asrs    r2, r3, #0x1f
00081434  movw    r1, #0x7ff
00081438  lsrs    r2, r2, #0x15
0008143a  adds    r3, r3, r2
0008143c  ands    r3, r1
0008143e  subs    r3, r3, r2
00081440  cmp     r3, #0xa
00081442  beq.w   #0x818f2
00081446  ldr.w   r3, [pc, #0x78c]
0008144a  add     r3, pc ; -> 0x00379b34  m_leaderboards
0008144c  ldr     r0, [r3]
0008144e  ldr     r0, [r0]
00081450  cmp     r0, #0
00081452  beq.w   #0x819ea
00081456  ldr.w   r2, [r0, #0x80]
0008145a  ldr     r3, [r0, #0x7c]
0008145c  rsb     r3, r3, r2
00081460  asrs    r3, r3, #3
00081462  str     r3, [sp, #0x44]
00081464  mov.w   r3, #-1
00081468  str     r3, [sp, #0xa0]
0008146a  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
0008146e  cmp     r0, #2
00081470  beq.w   #0x81902
00081474  ldr     r4, [sp, #0x44]
00081476  cmp     r4, #0
00081478  ble.w   #0x8165a
0008147c  ldr     r0, [sp, #0x34]
0008147e  ldr     r1, [sp, #0x30]
00081480  movs    r2, #0
00081482  str     r2, [sp, #0x54]
00081484  mul     r3, r0, r1
00081488  adds    r3, #1
0008148a  str     r3, [sp, #0x94]
0008148c  b       #0x8149c
0008148e  ldr     r0, [sp, #0x54]
00081490  ldr     r1, [sp, #0x44]
00081492  adds    r0, #1
00081494  cmp     r0, r1
00081496  str     r0, [sp, #0x54]
00081498  beq.w   #0x8165a
0008149c  ldr     r3, [sp, #0x30]
0008149e  ldr     r4, [sp, #0x54]
000814a0  cmp     r3, r4
000814a2  ble     #0x8148e
000814a4  ldr.w   r3, [pc, #0x730]
000814a8  add     r3, pc ; -> 0x00379b34  m_leaderboards
000814aa  ldr     r3, [r3]
000814ac  ldr     r3, [r3]
000814ae  cmp     r3, #0
000814b0  beq.w   #0x8199c
000814b4  ldr     r1, [r3, #0x70]
000814b6  ldr     r0, [sp, #0x54]
000814b8  mov.w   r3, #-1
000814bc  ldr.w   r1, [r1, r0, lsl #2]
000814c0  add     r0, sp, #0x144
000814c2  ldr     r1, [r1]
000814c4  str     r3, [sp, #0xa0]
000814c6  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
000814ca  ldr.w   r3, [pc, #0x710]
000814ce  add     r3, pc ; -> 0x00379b34  m_leaderboards
000814d0  ldr     r3, [r3]
000814d2  ldr     r3, [r3]
000814d4  cmp     r3, #0
000814d6  beq.w   #0x81984
000814da  ldr     r3, [r3, #0x70]
000814dc  ldr     r1, [sp, #0x54]
000814de  add     r0, sp, #0x134
000814e0  ldr.w   r3, [r3, r1, lsl #2]
000814e4  ldr     r1, [r3, #4]
000814e6  movs    r3, #2
000814e8  str     r3, [sp, #0xa0]
000814ea  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
000814ee  movs    r3, #1
000814f0  add     r0, sp, #0x144
000814f2  str     r3, [sp, #0xa0]
000814f4  bl      #0x8ac88 ; -> ZNK6Mayhem4User11GetMayhemIDEv
000814f8  ldr     r3, [r0]
000814fa  ldr.w   r1, [pc, #0x6e4]
000814fe  ldr     r2, [r3, #-0xc]
00081502  ldr.w   r3, [pc, #0x6e0]
00081506  add     r1, pc ; -> 0x00379b40  m_mayhemID
00081508  add     r3, pc ; -> 0x00379b40  m_mayhemID
0008150a  str     r2, [sp, #0x150]
0008150c  ldr     r3, [r3]
0008150e  ldr     r1, [r1]
00081510  ldr     r3, [r3, #-0xc]
00081514  str     r2, [sp, #0x84]
00081516  cmp     r3, r2
00081518  ite     lo
0008151a  addlo   r2, sp, #0x14c
0008151c  addhs   r2, sp, #0x150
0008151e  str     r3, [sp, #0x80]
00081520  str     r3, [sp, #0x14c]
00081522  ldr     r2, [r2]
00081524  ldr     r0, [r0]
00081526  blx     #0xddb90 ; -> memcmp
0008152a  cmp     r0, #0
0008152c  bne.w   #0x8163c
00081530  ldr     r2, [sp, #0x80]
00081532  ldr     r3, [sp, #0x84]
00081534  cmp     r2, r3
00081536  blo.w   #0x8163c
0008153a  ite     hi
0008153c  movhi   r4, #0
0008153e  movls   r4, #1
00081540  str     r4, [sp, #0x58]
00081542  movs    r3, #1
00081544  add     r0, sp, #0x144
00081546  str     r3, [sp, #0xa0]
00081548  bl      #0x8ac98 ; -> ZNK6Mayhem4User14GetDisplayNameEv
0008154c  ldr     r0, [r0]
0008154e  str     r0, [sp, #0x88]
00081550  add     r0, sp, #0x134
00081552  bl      #0x8ad5c ; -> ZNK6Mayhem4Stat8GetValueEv
00081556  str     r0, [sp, #0x40]
00081558  add     r0, sp, #0x134
0008155a  bl      #0x8ad64 ; -> ZNK6Mayhem4Stat7GetRankEv
0008155e  ldr     r1, [sp, #0x40]
00081560  str     r0, [sp, #4]
00081562  ldr     r2, [sp, #0x88]
00081564  ldr     r0, [sp, #0x54]
00081566  str     r1, [sp]
00081568  ldr     r3, [sp, #0x58]
0008156a  ldr     r1, [sp, #0x94]
0008156c  ldr     r4, [sp, #0x28]
0008156e  blx     r4
00081570  movs    r3, #2
00081572  add     r0, sp, #0x134
00081574  str     r3, [sp, #0xa0]
00081576  bl      #0x8b39c ; -> ZN6Mayhem4StatD1Ev
0008157a  add     r0, sp, #0x144
0008157c  mov.w   r3, #-1
00081580  str     r3, [sp, #0xa0]
00081582  bl      #0x8b3d0 ; -> ZN6Mayhem4UserD1Ev
00081586  b       #0x8148e
00081588  ldr     r1, [sp, #0x34]
0008158a  ldr     r2, [sp, #0x30]
0008158c  ldr.w   r3, [pc, #0x658]
00081590  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
00081592  mul     r1, r1, r2
00081596  ldr     r3, [r3]
00081598  cmp     r3, #0
0008159a  str     r3, [sp, #0x44]
0008159c  str     r1, [sp, #0x50]
0008159e  ble     #0x8165a
000815a0  ldr.w   r3, [pc, #0x648]
000815a4  movs    r2, #0
000815a6  str     r2, [sp, #0x48]
000815a8  add     r3, pc ; -> 0x003714e4  leaderboardMonthly
000815aa  adds    r3, #4
000815ac  str     r3, [sp, #0x90]
000815ae  ldr.w   r3, [pc, #0x640]
000815b2  str     r2, [sp, #0x4c]
000815b4  add     r3, pc ; -> 0x00175888  leaderboardMonthlyNum
000815b6  str     r3, [sp, #0xc]
000815b8  b       #0x815d0
000815ba  ldr     r2, [sp, #0xc]
000815bc  ldr     r1, [sp, #0x48]
000815be  ldr     r3, [sp, #0x90]
000815c0  ldr     r2, [r2]
000815c2  adds    r1, #1
000815c4  adds    r3, #0x48
000815c6  cmp     r2, r1
000815c8  str     r1, [sp, #0x48]
000815ca  str     r2, [sp, #0x44]
000815cc  str     r3, [sp, #0x90]
000815ce  ble     #0x8165a
000815d0  ldr     r4, [sp, #0x50]
000815d2  ldr     r0, [sp, #0x48]
000815d4  cmp     r4, r0
000815d6  bgt     #0x815ba
000815d8  ldr     r1, [sp, #0x30]
000815da  add.w   r3, r4, r1
000815de  cmp     r3, r0
000815e0  ble     #0x815ba
000815e2  lsls    r3, r0, #6
000815e4  lsls    r2, r0, #3
000815e6  adds    r2, r2, r3
000815e8  ldr.w   r1, [pc, #0x608]
000815ec  str     r2, [sp, #0x18]
000815ee  add.w   r0, r2, #0x28
000815f2  ldr.w   r2, [pc, #0x604]
000815f6  add     r1, pc ; -> 0x00379b40  m_mayhemID
000815f8  add     r2, pc ; -> 0x003714e4  leaderboardMonthly
000815fa  adds    r0, r0, r2
000815fc  str     r2, [sp, #0x14]
000815fe  ldr     r1, [r1]
00081600  blx     #0xddddc ; -> strcmp
00081604  adds    r1, r4, #1
00081606  ldr     r4, [sp, #0x18]
00081608  add.w   r2, r4, #8
0008160c  ldr     r4, [sp, #0x90]
0008160e  ldr.w   ip, [r4]
00081612  rsbs.w  r3, r0, #1
00081616  it      lo
00081618  movlo   r3, #0
0008161a  ldr     r0, [sp, #0x14]
0008161c  adds    r2, r2, r0
0008161e  ldr     r0, [r4, #-0x4]
00081622  str.w   ip, [sp]
00081626  ldr     r4, [sp, #0x28]
00081628  str     r0, [sp, #4]
0008162a  mov.w   r0, #-1
0008162e  str     r0, [sp, #0xa0]
00081630  ldr     r0, [sp, #0x4c]
00081632  blx     r4
00081634  ldr     r0, [sp, #0x4c]
00081636  adds    r0, #1
00081638  str     r0, [sp, #0x4c]
0008163a  b       #0x815ba
0008163c  mov.w   lr, #0
00081640  str.w   lr, [sp, #0x58]
00081644  b       #0x81542
00081646  cmp     r4, #0
00081648  bgt.w   #0x817d6
0008164c  add     r1, sp, #0x160
0008164e  adds    r1, #3
00081650  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00081654  mov.w   r0, #-1
00081658  str     r0, [sp, #0x44]
0008165a  add     r0, sp, #0x9c
0008165c  blx     #0xdd4c4 ; -> Unwind_SjLj_Unregister
00081660  ldr     r0, [sp, #0x44]
00081662  sub.w   sp, r7, #0x58
00081666  vpop    {d8, d9, d10, d11, d12, d13, d14, d15}
0008166a  sub.w   sp, r7, #0x18
0008166e  pop.w   {r8, sl, fp}
00081672  pop     {r4, r5, r6, r7, pc}
00081674  ldr.w   r3, [pc, #0x584]
00081678  ldr.w   r2, [pc, #0x584]
0008167c  add     r3, pc ; -> 0x000f336c  currentLeaderboard
0008167e  add     r2, pc ; -> 0x00379b34  m_leaderboards
00081680  ldr     r3, [r3]
00081682  str     r3, [sp, #0x20]
00081684  ldr     r3, [r3]
00081686  ldr     r0, [r2]
00081688  ldr.w   r0, [r0, r3, lsl #2]
0008168c  cmp     r0, #0
0008168e  beq.w   #0x819d0
00081692  mov.w   r1, #-1
00081696  str     r1, [sp, #0xa0]
00081698  bl      #0x8b410 ; -> ZN6Mayhem7Request9GetResultEv
0008169c  cmp     r0, #0
0008169e  beq.w   #0x817d6
000816a2  ldr     r3, [sp, #0x20]
000816a4  ldr     r1, [r3]
000816a6  adds    r1, #1
000816a8  cmp     r1, #4
000816aa  str     r1, [r3]
000816ac  bgt.w   #0x817e2
000816b0  ldr.w   r0, [pc, #0x550]
000816b4  mov.w   r4, #-1
000816b8  str     r4, [sp, #0xa0]
000816ba  add     r0, pc ; -> 0x0017e6f4  
000816bc  blx     #0xdd3e0 ; -> NSLog
000816c0  ldr     r0, [sp, #0x20]
000816c2  ldr.w   r2, [pc, #0x544]
000816c6  movs    r1, #0x64
000816c8  ldr     r3, [r0]
000816ca  add     r2, pc ; -> 0x00175874  '&period=week:%d'
000816cc  add     r0, sp, #0xd0
000816ce  blx     #0xddcf8 ; -> snprintf
000816d2  ldr     r1, [sp, #0x20]
000816d4  ldr.w   r2, [pc, #0x534]
000816d8  add     r0, sp, #0x15c
000816da  ldr     r3, [r1]
000816dc  add     r2, pc ; -> 0x00379b34  m_leaderboards
000816de  lsls    r1, r3, #2
000816e0  ldr     r3, [r2]
000816e2  add     r2, sp, #0x164
000816e4  adds    r2, #3
000816e6  adds    r1, r1, r3
000816e8  ldr.w   r3, [pc, #0x524]
000816ec  str     r1, [sp, #0x70]
000816ee  ldr.w   r1, [pc, #0x524]
000816f2  add     r3, pc ; -> 0x00379b4c  m_mayhemToken
000816f4  ldr     r3, [r3]
000816f6  add     r1, pc ; -> 0x00379b50  statCodeBuffer
000816f8  str     r3, [sp, #0x38]
000816fa  movs    r3, #7
000816fc  str     r3, [sp, #0xa0]
000816fe  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00081702  movs    r3, #6
00081704  add     r0, sp, #0x158
00081706  str     r3, [sp, #0xa0]
00081708  add     r1, sp, #0xd0
0008170a  add.w   r2, sp, #0x166
0008170e  blx     #0xdd530 ; -> ZNSsC1EPKcRKSaIcE
00081712  movs    r3, #5
00081714  movs    r0, #0xa0
00081716  str     r3, [sp, #0xa0]
00081718  blx     #0xdd5c0 ; -> Znwm
0008171c  ldr.w   r2, [pc, #0x4f8]
00081720  str     r0, [sp, #0x6c]
00081722  str     r0, [sp, #0x3c]
00081724  add     r2, pc ; -> 0x001758a0  lpage
00081726  ldr.w   r3, [pc, #0x4f4]
0008172a  ldr     r0, [r2]
0008172c  ldr.w   r2, [pc, #0x4f0]
00081730  add     r3, pc ; -> 0x001758a8  lmax
00081732  add     r2, pc ; -> 0x001758a4  lpagesize
00081734  ldr     r3, [r3]
00081736  ldr     r1, [r2]
00081738  add     r2, sp, #0x158
0008173a  str     r0, [sp, #4]
0008173c  str     r2, [sp]
0008173e  str     r1, [sp, #8]
00081740  movs    r2, #4
00081742  ldr     r0, [sp, #0x6c]
00081744  str     r2, [sp, #0xa0]
00081746  ldr     r1, [sp, #0x38]
00081748  add     r2, sp, #0x15c
0008174a  bl      #0x9803c ; -> ZN6Mayhem21GetLeaderboardRequestC1EPNS_5TokenERKSsiS4_ii
0008174e  ldr     r3, [sp, #0x6c]
00081750  ldr     r4, [sp, #0x3c]
00081752  add     r2, sp, #0x154
00081754  str     r2, [sp, #0x68]
00081756  str     r3, [sp, #0x154]
00081758  cbz     r4, #0x81766
0008175a  mov     r0, r3
0008175c  ldr     r3, [r3]
0008175e  ldr     r2, [r3, #0xc]
00081760  movs    r3, #5
00081762  str     r3, [sp, #0xa0]
00081764  blx     r2
00081766  ldr     r1, [sp, #0x154]
00081768  str     r1, [sp, #0x8c]
0008176a  cbz     r1, #0x81778
0008176c  ldr     r3, [r1]
0008176e  mov     r0, r1
00081770  ldr     r2, [r3, #0xc]
00081772  movs    r3, #3
00081774  str     r3, [sp, #0xa0]
00081776  blx     r2
00081778  ldr     r2, [sp, #0x70]
0008177a  ldr     r4, [sp, #0x8c]
0008177c  ldr     r3, [sp, #0x70]
0008177e  ldr     r2, [r2]
00081780  str     r2, [sp, #0x98]
00081782  str     r4, [r3]
00081784  cbz     r2, #0x81798
00081786  ldr     r3, [r2]
00081788  ldr     r0, [sp, #0x98]
0008178a  ldr     r2, [r3, #8]
0008178c  movs    r3, #3
0008178e  str     r3, [sp, #0xa0]
00081790  blx     r2
00081792  cmp     r0, #0
00081794  bne.w   #0x818b8
00081798  ldr     r1, [sp, #0x68]
0008179a  ldr     r1, [r1]
0008179c  str     r1, [sp, #0x78]
0008179e  cbz     r1, #0x817b4
000817a0  ldr     r1, [sp, #0x78]
000817a2  ldr     r3, [r1]
000817a4  mov     r0, r1
000817a6  ldr     r2, [r3, #8]
000817a8  movs    r3, #5
000817aa  str     r3, [sp, #0xa0]
000817ac  blx     r2
000817ae  cmp     r0, #0
000817b0  bne.w   #0x81978
000817b4  ldr.w   r3, [pc, #0x46c]
000817b8  ldr     r2, [sp, #0x158]
000817ba  add     r3, pc ; -> 0x000f3370  0x0
000817bc  sub.w   r0, r2, #0xc
000817c0  ldr     r3, [r3]
000817c2  cmp     r0, r3
000817c4  str     r3, [sp, #0x7c]
000817c6  bne.w   #0x81a68
000817ca  ldr     r3, [sp, #0x15c]
000817cc  ldr     r1, [sp, #0x7c]
000817ce  sub.w   r0, r3, #0xc
000817d2  cmp     r1, r0
000817d4  bne     #0x818c2
000817d6  mov.w   r2, #-1
000817da  str     r2, [sp, #0x44]
000817dc  b       #0x8165a
000817de  str     r4, [sp, #0x44]
000817e0  b       #0x8165a
000817e2  ldr.w   r0, [pc, #0x444]
000817e6  mov.w   r1, #-1
000817ea  str     r1, [sp, #0xa0]
000817ec  add     r0, pc ; -> 0x0017e704  
000817ee  blx     #0xdd3e0 ; -> NSLog
000817f2  ldr     r2, [sp, #0x24]
000817f4  movs    r3, #0
000817f6  str     r3, [r2]
000817f8  ldr.w   r3, [pc, #0x430]
000817fc  add     r3, pc ; -> 0x00379b34  m_leaderboards
000817fe  ldr     r0, [r3]
00081800  ldr     r0, [r0]
00081802  cmp     r0, #0
00081804  beq.w   #0x81a54
00081808  mov.w   r4, #-1
0008180c  str     r4, [sp, #0xa0]
0008180e  bl      #0x8b480 ; -> ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv
00081812  ldr.w   r3, [pc, #0x41c]
00081816  add     r3, pc ; -> 0x00379b34  m_leaderboards
00081818  ldr     r0, [r3]
0008181a  ldr     r0, [r0, #4]
0008181c  cmp     r0, #0
0008181e  beq.w   #0x81a40
00081822  mov.w   r1, #-1
00081826  str     r1, [sp, #0xa0]
00081828  bl      #0x8b480 ; -> ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv
0008182c  ldr.w   r3, [pc, #0x404]
00081830  add     r3, pc ; -> 0x00379b34  m_leaderboards
00081832  ldr     r0, [r3]
00081834  ldr     r0, [r0, #8]
00081836  cmp     r0, #0
00081838  beq.w   #0x81a2c
0008183c  mov.w   r2, #-1
00081840  str     r2, [sp, #0xa0]
00081842  bl      #0x8b480 ; -> ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv
00081846  ldr     r3, [pc, #0x3f0]
00081848  add     r3, pc ; -> 0x00379b34  m_leaderboards
0008184a  ldr     r0, [r3]
0008184c  ldr     r0, [r0, #0xc]
0008184e  cmp     r0, #0
00081850  beq.w   #0x81a18
00081854  mov.w   r3, #-1
00081858  str     r3, [sp, #0xa0]
0008185a  bl      #0x8b480 ; -> ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv
0008185e  ldr     r3, [pc, #0x3dc]
00081860  add     r3, pc ; -> 0x00379b34  m_leaderboards
00081862  ldr     r0, [r3]
00081864  ldr     r0, [r0, #0x10]
00081866  cmp     r0, #0
00081868  beq.w   #0x81a04
0008186c  mov.w   r4, #-1
00081870  str     r4, [sp, #0xa0]
00081872  bl      #0x8b480 ; -> ZN6Mayhem21GetLeaderboardRequest15DumpLeaderboardEv
00081876  ldr.w   r0, [pc, #0x3c8]
0008187a  add     r0, pc ; -> 0x0017e714  
0008187c  blx     #0xdd3e0 ; -> NSLog
00081880  movs    r0, #0
00081882  bl      #0x7f88c ; -> Z18convertLeaderboardi
00081886  movs    r0, #1
00081888  bl      #0x7f88c ; -> Z18convertLeaderboardi
0008188c  movs    r0, #2
0008188e  bl      #0x7f88c ; -> Z18convertLeaderboardi
00081892  movs    r0, #3
00081894  bl      #0x7f88c ; -> Z18convertLeaderboardi
00081898  movs    r0, #4
0008189a  bl      #0x7f88c ; -> Z18convertLeaderboardi
0008189e  ldr.w   r0, [pc, #0x3a4]
000818a2  add     r0, pc ; -> 0x0017e724  
000818a4  blx     #0xdd3e0 ; -> NSLog
000818a8  bl      #0x7f718 ; -> Z28bubbleSortLeaderboardMonthlyv
000818ac  ldr.w   r0, [pc, #0x398]
000818b0  add     r0, pc ; -> 0x0017e734  
000818b2  blx     #0xdd3e0 ; -> NSLog
000818b6  b       #0x813fe
000818b8  ldr     r0, [sp, #0x98]
000818ba  ldr     r3, [r0]
000818bc  ldr     r3, [r3, #4]
000818be  blx     r3
000818c0  b       #0x81798
000818c2  subs    r2, r3, #4
000818c4  ldr     r3, [r3, #-0x4]
000818c8  b       #0x818d2
000818ca  cmp     r4, ip
000818cc  mov     r3, r4
000818ce  beq.w   #0x81646
000818d2  subs    r1, r3, #1
000818d4  dmb     ish
000818d8  mov     ip, r3
000818da  ldrex   r4, [r2]
000818de  cmp     r4, r3
000818e0  bne     #0x818ca
000818e2  strex   lr, r1, [r2]
000818e6  cmp.w   lr, #0
000818ea  bne     #0x818da
000818ec  dmb     ish
000818f0  b       #0x818ca
000818f2  ldr     r0, [pc, #0x358]
000818f4  sub.w   r1, r1, #0x800
000818f8  str     r1, [sp, #0xa0]
000818fa  add     r0, pc ; -> 0x0017e744  
000818fc  blx     #0xdd3e0 ; -> NSLog
00081900  b       #0x81446
00081902  ldr     r0, [pc, #0x34c]
00081904  add.w   lr, sp, #0x134
00081908  str.w   lr, [sp, #0x10]
0008190c  add     r0, pc ; -> 0x000de1b8  ZZ26EASOC_MayhemGetLeaderBoardE5C.263
0008190e  mov     r4, lr
00081910  ldm     r0, {r0, r1, r2, r3}
00081912  stm.w   lr, {r0, r1, r2, r3}
00081916  mov.w   r0, #-1
0008191a  str     r0, [sp, #0xa0]
0008191c  movw    r0, #0x3b5
00081920  bl      #0xa72a8 ; -> GameText
00081924  ldr     r3, [pc, #0x32c]
00081926  add     r3, pc ; -> 0x000f347c  limeScreenWidth
00081928  ldr     r3, [r3]
0008192a  ldr     r3, [r3]
0008192c  add.w   r3, r3, r3, lsr #31
00081930  asrs    r2, r3, #1
00081932  ldr     r3, [pc, #0x324]
00081934  vmov    s10, r2
00081938  vcvt.f32.s32 s12, s10
0008193c  add     r3, pc ; -> 0x000f34cc  limeScreenHeight
0008193e  ldr     r3, [r3]
00081940  ldr     r3, [r3]
00081942  add.w   r3, r3, r3, lsr #31
00081946  asrs    r3, r3, #1
00081948  subs    r3, #6
0008194a  vmov    s10, r3
0008194e  ldr     r3, [pc, #0x30c]
00081950  vcvt.f32.s32 s14, s10
00081954  mov     r1, r0
00081956  add     r3, pc ; -> 0x000f3578  FE_WidthScale
00081958  ldr     r0, [pc, #0x304]
0008195a  ldr     r3, [r3]
0008195c  add     r0, pc ; -> 0x000f360c  GameFont
0008195e  ldr     r2, [r3]
00081960  ldr     r0, [r0]
00081962  movs    r3, #1
00081964  str     r3, [sp]
00081966  str     r2, [sp, #4]
00081968  vmov    r3, s14
0008196c  vmov    r2, s12
00081970  str     r4, [sp, #8]
00081972  bl      #0x7e5b8 ; -> limeDrawFONT
00081976  b       #0x8165a
00081978  ldr     r2, [sp, #0x78]
0008197a  ldr     r3, [r2]
0008197c  mov     r0, r2
0008197e  ldr     r3, [r3, #4]
00081980  blx     r3
00081982  b       #0x817b4
00081984  ldr     r0, [pc, #0x2dc]
00081986  ldr     r1, [pc, #0x2e0]
00081988  ldr     r3, [pc, #0x2e0]
0008198a  movs    r2, #2
0008198c  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
0008198e  str     r2, [sp, #0xa0]
00081990  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081992  add     r3, pc ; -> 0x00175710  'm_obj'
00081994  movw    r2, #0x109
00081998  blx     #0xdd5cc ; -> assert_rtn
0008199c  ldr     r0, [pc, #0x2d0]
0008199e  ldr     r1, [pc, #0x2d4]
000819a0  ldr     r3, [pc, #0x2d4]
000819a2  mov.w   r2, #-1
000819a6  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
000819a8  str     r2, [sp, #0xa0]
000819aa  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000819ac  add     r3, pc ; -> 0x00175710  'm_obj'
000819ae  add.w   r2, r2, #0x10a
000819b2  blx     #0xdd5cc ; -> assert_rtn
000819b6  ldr     r0, [pc, #0x2c4]
000819b8  ldr     r1, [pc, #0x2c4]
000819ba  ldr     r3, [pc, #0x2c8]
000819bc  mov.w   r2, #-1
000819c0  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
000819c2  str     r2, [sp, #0xa0]
000819c4  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000819c6  add     r3, pc ; -> 0x00175710  'm_obj'
000819c8  add.w   r2, r2, #0x10a
000819cc  blx     #0xdd5cc ; -> assert_rtn
000819d0  ldr     r0, [pc, #0x2b4]
000819d2  ldr     r1, [pc, #0x2b8]
000819d4  ldr     r3, [pc, #0x2b8]
000819d6  mov.w   r2, #-1
000819da  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
000819dc  str     r2, [sp, #0xa0]
000819de  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000819e0  add     r3, pc ; -> 0x00175710  'm_obj'
000819e2  add.w   r2, r2, #0x10a
000819e6  blx     #0xdd5cc ; -> assert_rtn
000819ea  ldr     r0, [pc, #0x2a8]
000819ec  ldr     r1, [pc, #0x2a8]
000819ee  ldr     r3, [pc, #0x2ac]
000819f0  mov.w   r2, #-1
000819f4  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
000819f6  str     r2, [sp, #0xa0]
000819f8  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
000819fa  add     r3, pc ; -> 0x00175710  'm_obj'
000819fc  add.w   r2, r2, #0x10a
00081a00  blx     #0xdd5cc ; -> assert_rtn
00081a04  ldr     r0, [pc, #0x298]
00081a06  ldr     r1, [pc, #0x29c]
00081a08  ldr     r3, [pc, #0x29c]
00081a0a  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
00081a0c  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081a0e  add     r3, pc ; -> 0x00175710  'm_obj'
00081a10  movw    r2, #0x109
00081a14  blx     #0xdd5cc ; -> assert_rtn
00081a18  ldr     r0, [pc, #0x290]
00081a1a  ldr     r1, [pc, #0x294]
00081a1c  ldr     r3, [pc, #0x294]
00081a1e  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
00081a20  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081a22  add     r3, pc ; -> 0x00175710  'm_obj'
00081a24  movw    r2, #0x109
00081a28  blx     #0xdd5cc ; -> assert_rtn
00081a2c  ldr     r0, [pc, #0x288]
00081a2e  ldr     r1, [pc, #0x28c]
00081a30  ldr     r3, [pc, #0x28c]
00081a32  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
00081a34  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081a36  add     r3, pc ; -> 0x00175710  'm_obj'
00081a38  movw    r2, #0x109
00081a3c  blx     #0xdd5cc ; -> assert_rtn
00081a40  ldr     r0, [pc, #0x280]
00081a42  ldr     r1, [pc, #0x284]
00081a44  ldr     r3, [pc, #0x284]
00081a46  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
00081a48  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081a4a  add     r3, pc ; -> 0x00175710  'm_obj'
00081a4c  movw    r2, #0x109
00081a50  blx     #0xdd5cc ; -> assert_rtn
00081a54  ldr     r0, [pc, #0x278]
00081a56  ldr     r1, [pc, #0x27c]
00081a58  ldr     r3, [pc, #0x27c]
00081a5a  add     r0, pc ; -> 0x000e23c8  ZZN4midp27SafeReferenceCountedPointerIN6Mayhem21GetLeaderboardRequestEEptEvE8__func__
00081a5c  add     r1, pc ; -> 0x0017569c  '/BuildServerX/reactive/mortalkombat_iphone/xcode/umk3_iphone_en/../../src/EA_SDK/microedition/ReferenceCounted.h'
00081a5e  add     r3, pc ; -> 0x00175710  'm_obj'
00081a60  movw    r2, #0x109
00081a64  blx     #0xdd5cc ; -> assert_rtn
00081a68  ldr     r3, [r2, #-0x4]
00081a6c  subs    r1, r2, #4
00081a6e  b       #0x81a76
00081a70  cmp     r4, ip
00081a72  mov     r3, r4
00081a74  beq     #0x81ad8
00081a76  subs    r2, r3, #1
00081a78  dmb     ish
00081a7c  mov     ip, r3
00081a7e  ldrex   r4, [r1]
00081a82  cmp     r4, r3
00081a84  bne     #0x81a70
00081a86  strex   lr, r2, [r1]
00081a8a  cmp.w   lr, #0
00081a8e  bne     #0x81a7e
00081a90  dmb     ish
00081a94  b       #0x81a70
00081a96  ldr     r3, [sp, #0xa0]
00081a98  ldr.w   lr, [sp, #0xa4]
00081a9c  cmp     r3, #1
00081a9e  str.w   lr, [sp, #0x1c]
00081aa2  beq     #0x81ac2
00081aa4  cmp     r3, #2
00081aa6  beq     #0x81ae6
00081aa8  cmp     r3, #3
00081aaa  beq     #0x81ba4
00081aac  cmp     r3, #4
00081aae  beq     #0x81b0e
00081ab0  cmp     r3, #5
00081ab2  beq     #0x81b26
00081ab4  cmp     r3, #6
00081ab6  beq     #0x81acc
00081ab8  add     r0, sp, #0x134
00081aba  movs    r3, #0
00081abc  str     r3, [sp, #0xa0]
00081abe  bl      #0x8b39c ; -> ZN6Mayhem4StatD1Ev
00081ac2  add     r0, sp, #0x144
00081ac4  movs    r3, #0
00081ac6  str     r3, [sp, #0xa0]
00081ac8  bl      #0x8b3d0 ; -> ZN6Mayhem4UserD1Ev
00081acc  ldr     r0, [sp, #0x1c]
00081ace  mov.w   r3, #-1
00081ad2  str     r3, [sp, #0xa0]
00081ad4  blx     #0xdd4b8 ; -> Unwind_SjLj_Resume
00081ad8  cmp     r4, #0
00081ada  bgt.w   #0x817ca
00081ade  add     r1, sp, #0x164
00081ae0  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00081ae4  b       #0x817ca
00081ae6  ldr     r2, [sp, #0x1c]
00081ae8  ldr     r3, [sp, #0x68]
00081aea  str     r2, [sp, #0x5c]
00081aec  ldr     r3, [r3]
00081aee  str     r3, [sp, #0x74]
00081af0  cbz     r3, #0x81b0a
00081af2  ldr     r3, [r3]
00081af4  ldr     r0, [sp, #0x74]
00081af6  ldr     r2, [r3, #8]
00081af8  movs    r3, #0
00081afa  str     r3, [sp, #0xa0]
00081afc  blx     r2
00081afe  cbz     r0, #0x81b0a
00081b00  ldr     r4, [sp, #0x74]
00081b02  ldr     r3, [r4]
00081b04  mov     r0, r4
00081b06  ldr     r3, [r3, #4]
00081b08  blx     r3
00081b0a  ldr     r0, [sp, #0x5c]
00081b0c  str     r0, [sp, #0x1c]
00081b0e  ldr     r3, [sp, #0x1c]
00081b10  ldr     r1, [sp, #0x158]
00081b12  str     r3, [sp, #0x60]
00081b14  ldr     r3, [pc, #0x1c4]
00081b16  sub.w   r0, r1, #0xc
00081b1a  add     r3, pc ; -> 0x000f3370  0x0
00081b1c  ldr     r3, [r3]
00081b1e  cmp     r0, r3
00081b20  bne     #0x81b6a
00081b22  ldr     r0, [sp, #0x60]
00081b24  str     r0, [sp, #0x1c]
00081b26  ldr     r1, [sp, #0x1c]
00081b28  ldr     r3, [pc, #0x1b4]
00081b2a  add     r3, pc ; -> 0x000f3370  0x0
00081b2c  str     r1, [sp, #0x64]
00081b2e  ldr     r1, [sp, #0x15c]
00081b30  ldr     r3, [r3]
00081b32  sub.w   r0, r1, #0xc
00081b36  cmp     r0, r3
00081b38  bne     #0x81b40
00081b3a  ldr     r0, [sp, #0x64]
00081b3c  str     r0, [sp, #0x1c]
00081b3e  b       #0x81acc
00081b40  ldr     r3, [r1, #-0x4]
00081b44  subs    r2, r1, #4
00081b46  subs    r1, r3, #1
00081b48  dmb     ish
00081b4c  mov     ip, r3
00081b4e  ldrex   r4, [r2]
00081b52  cmp     r4, r3
00081b54  beq     #0x81b94
00081b56  cmp     r4, ip
00081b58  mov     r3, r4
00081b5a  bne     #0x81b46
00081b5c  cmp     r4, #0
00081b5e  bgt     #0x81b3a
00081b60  add.w   r1, sp, #0x162
00081b64  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00081b68  b       #0x81b3a
00081b6a  ldr     r3, [r1, #-0x4]
00081b6e  subs    r2, r1, #4
00081b70  subs    r1, r3, #1
00081b72  dmb     ish
00081b76  mov     ip, r3
00081b78  ldrex   r4, [r2]
00081b7c  cmp     r4, r3
00081b7e  beq     #0x81bac
00081b80  cmp     r4, ip
00081b82  mov     r3, r4
00081b84  bne     #0x81b70
00081b86  cmp     r4, #0
00081b88  bgt     #0x81b22
00081b8a  add     r1, sp, #0x164
00081b8c  adds    r1, #1
00081b8e  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
00081b92  b       #0x81b22
00081b94  strex   lr, r1, [r2]
00081b98  cmp.w   lr, #0
00081b9c  bne     #0x81b4e
00081b9e  dmb     ish
00081ba2  b       #0x81b56
00081ba4  ldr     r0, [sp, #0x6c]
00081ba6  blx     #0xdd5a8 ; -> ZdlPv
00081baa  b       #0x81b0e
00081bac  strex   lr, r1, [r2]
00081bb0  cmp.w   lr, #0
00081bb4  bne     #0x81b78
00081bb6  dmb     ish
00081bba  b       #0x81b80
00081bbc  adds    r4, r2, #1
00081bbe  movs    r7, r0
00081bc0  ldm     r5!, {r1, r7}
00081bc2  movs    r6, r0
00081bc4  lsls    r2, r6, #0x1a
00081bc6  movs    r0, r0
00081bc8  subs    r0, r6, #5
00081bca  movs    r7, r0
00081bcc  strh    r6, [r4, #0x38]
00081bce  movs    r7, r5
00081bd0  add     r6, pc
00081bd2  movs    r7, r1
00081bd4  strh    r6, [r4, #0x36]
00081bd6  movs    r7, r5
00081bd8  strh    r0, [r1, #0x34]
00081bda  movs    r7, r5
00081bdc  strh    r2, [r4, #0x32]
00081bde  movs    r7, r5
00081be0  strh    r6, [r6, #0x30]
00081be2  movs    r7, r5
00081be4  strh    r4, [r6, #0x30]
00081be6  movs    r7, r5
00081be8  cmn     r4, r6
00081bea  movs    r7, r1
