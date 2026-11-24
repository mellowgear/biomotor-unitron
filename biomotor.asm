; static trace 1101 insns; +7164 from 4672 emulator-executed addresses; 0 executed addresses not on an instruction boundary
; 'B.M.Unitron1'  id=0053 v0 color  entry=205FA3
; 8265 instructions traced, 23196 of 1048576 bytes

sub_200040:
  200040  0a b8 aa aa              LDW     (Z80_RESET),0xAAAA
  200044  00                       NOP
  200045  1d 5e 03 20              CALL    sub_20035E
  200049  0a b8 55 55              LDW     (Z80_RESET),0x5555
  20004D  00                       NOP
  20004E  30 d0 07                 LD      WA,0x7D0
  200051  1e db 02                 CALR    sub_20032F
  200054  0e                       RET

sub_200055:
  200055  c9 a1                    SUB     A,A
  200057  f2 aa 62 00 41           LD      (0x62AA),A
  20005C  f2 ab 62 00 41           LD      (0x62AB),A
  200061  f2 ac 62 00 41           LD      (0x62AC),A
  200066  c0 bc 21                 LD      A,(Z80_COMM)
  200069  f2 ad 62 00 41           LD      (0x62AD),A
  20006E  0e                       RET

dyn_20006F:
  20006F  28                       PUSH    WA
  200070  3c                       PUSH    XIX
  200071  1e 54 02                 CALR    dyn_2002C8
  200074  6f 6f                    JR      NC,loc_2000E5
  200076  1e 38 02                 CALR    sub_2002B1
  200079  6f 04                    JR      NC,loc_20007F
  20007B  6e 64                    JR      NZ,0x2000E1
  20007D  68 2d                    JR      0x2000AC

loc_20007F:
  20007F  c9 cf 86                 CP      A,0x86
  200082  6f 1e                    JR      NC,loc_2000A2
  200084  c9 88                    LD      W,A
  200086  c8 cc 07                 AND     W,7
  200089  c9 cf 83                 CP      A,0x83
  20008C  6f 09                    JR      NC,loc_200097
  20008E  c8 61                    INC     1,W
  200090  c2 ac 62 00 e8           OR      (0x62AC),W
  200095  68 4a                    JR      0x2000E1

loc_200097:
  200097  c8 69                    DEC     1,W
  200099  c8 07                    NEG     W
  20009B  c2 ac 62 00 c8           AND     (0x62AC),W
  2000A0  68 3f                    JR      0x2000E1

loc_2000A2:
  2000A2  c9 cf ff                 CP      A,0xFF
  2000A5  6e 05                    JR      NZ,0x2000AC
  2000A7  14                       PUSH    A
  2000A8  1e aa ff                 CALR    sub_200055
  2000AB  15                       POP     A
  2000AC  c2 ab 62 00 20           LD      W,(0x62AB)
  2000B1  c8 61                    INC     1,W
  2000B3  c8 cc 0f                 AND     W,0xF
  2000B6  c2 aa 62 00 f8           CP      (0x62AA),W
  2000BB  6e 0b                    JR      NZ,0x2000C8
  2000BD  02                       PUSH    SR
  2000BE  14                       PUSH    A
  2000BF  06 07                    DI
  2000C1  f2 89 02 20 e6           CALL    Z,sub_200289
  2000C6  15                       POP     A
  2000C7  03                       POP     SR
  2000C8  44 9a 62 00 00           LD      XIX,0x629A
  2000CD  c2 ab 62 00 20           LD      W,(0x62AB)
  2000D2  f3 03 f0 e1 41           LD      (XIX+W),A
  2000D7  c8 61                    INC     1,W
  2000D9  c8 cc 0f                 AND     W,0xF
  2000DC  f2 ab 62 00 40           LD      (0x62AB),W
  2000E1  11                       SCF
  2000E2  5c                       POP     XIX
  2000E3  48                       POP     WA
  2000E4  0e                       RET

loc_2000E5:
  2000E5  10                       RCF
  2000E6  68 fa                    JR      0x2000E2

sub_2000E8:
  2000E8  28                       PUSH    WA
  2000E9  3c                       PUSH    XIX

loc_2000EA:
  2000EA  c2 ab 62 00 20           LD      W,(0x62AB)
  2000EF  c2 aa 62 00 f8           CP      (0x62AA),W
  2000F4  66 24                    JR      Z,loc_20011A
  2000F6  c0 bc 21                 LD      A,(Z80_COMM)
  2000F9  c2 ad 62 00 f9           CP      (0x62AD),A
  2000FE  6e 1e                    JR      NZ,loc_20011E
  200100  1e 86 01                 CALR    sub_200289
  200103  6f 19                    JR      NC,loc_20011E
  200105  1e a9 01                 CALR    sub_2002B1
  200108  6f 02                    JR      NC,loc_20010C
  20010A  6e de                    JR      NZ,loc_2000EA

loc_20010C:
  20010C  f0 bc 41                 LD      (Z80_COMM),A
  20010F  c9 cd ff                 XOR     A,0xFF
  200112  f2 ad 62 00 41           LD      (0x62AD),A
  200117  08 ba 01                 LDB     (Z80_NMI),1

loc_20011A:
  20011A  5c                       POP     XIX
  20011B  48                       POP     WA
  20011C  11                       SCF
  20011D  0e                       RET

loc_20011E:
  20011E  5c                       POP     XIX
  20011F  48                       POP     WA
  200120  10                       RCF
  200121  0e                       RET

sub_200122:
  200122  39                       PUSH    XBC
  200123  3a                       PUSH    XDE
  200124  3b                       PUSH    XHL
  200125  3c                       PUSH    XIX
  200126  3d                       PUSH    XIY
  200127  38                       PUSH    XWA
  200128  1d 55 00 20              CALL    sub_200055
  20012C  58                       POP     XWA
  20012D  43 86 0e 20 00           LD      XHL,0x200E86
  200132  e8 80                    ADD     XWA,XWA
  200134  e8 80                    ADD     XWA,XWA
  200136  e8 83                    ADD     XHL,XWA
  200138  a3 23                    LD      XHL,(XHL)
  20013A  eb cf 00 00 00 00        CP      XHL,0
  200140  76 43 01                 JRL     Z,loc_200286
  200143  08 bc ff                 LDB     (Z80_COMM),0xFF
  200146  08 ba 01                 LDB     (Z80_NMI),1
  200149  f2 ad 62 00 00 00        LDB     (0x62AD),0
  20014F  cc d4                    XOR     D,D

loc_200151:
  200151  c0 bc 25                 LD      E,(Z80_COMM)
  200154  cd cf 00                 CP      E,0
  200157  66 23                    JR      Z,loc_20017C
  200159  cc 61                    INC     1,D
  20015B  cc cf 64                 CP      D,0x64
  20015E  67 f1                    JR      C,loc_200151
  200160  0a b8 aa aa              LDW     (Z80_RESET),0xAAAA
  200164  00                       NOP
  200165  3a                       PUSH    XDE
  200166  3b                       PUSH    XHL
  200167  39                       PUSH    XBC
  200168  3c                       PUSH    XIX
  200169  1d 5e 03 20              CALL    sub_20035E
  20016D  5c                       POP     XIX
  20016E  59                       POP     XBC
  20016F  5b                       POP     XHL
  200170  5a                       POP     XDE
  200171  38                       PUSH    XWA
  200172  1d 55 00 20              CALL    sub_200055
  200176  58                       POP     XWA
  200177  0a b8 55 55              LDW     (Z80_RESET),0x5555
  20017B  00                       NOP

loc_20017C:
  20017C  c9 d1                    XOR     A,A
  20017E  f2 ee 62 00 41           LD      (0x62EE),A
  200183  f2 2f 63 00 41           LD      (0x632F),A
  200188  ea d2                    XOR     XDE,XDE
  20018A  44 ae 62 00 00           LD      XIX,0x62AE
  20018F  45 ef 62 00 00           LD      XIY,0x62EF
  200194  23 10                    LD      C,0x10

loc_200196:
  200196  f5 f2 62                 LD      (XIX+),XDE
  200199  f5 f6 62                 LD      (XIY+),XDE
  20019C  cb 1c f7                 DJNZ    C,loc_200196
  20019F  9b 02 22                 LD      DE,(XHL+2)
  2001A2  ea 12                    EXTZ    XDE
  2001A4  ea c8 00 70 00 00        ADD     XDE,0x7000
  2001AA  f2 3c 63 00 62           LD      (0x633C),XDE
  2001AF  e2 34 63 00 22           LD      XDE,(0x6334)
  2001B4  1e 72 01                 CALR    sub_200329
  2001B7  d9 ae                    LD      BC,6
  2001B9  1e 66 01                 CALR    sub_200322
  2001BC  e2 38 63 00 22           LD      XDE,(0x6338)
  2001C1  1e 65 01                 CALR    sub_200329
  2001C4  c5 ec 21                 LD      A,(XHL+)
  2001C7  c9 e1                    OR      A,A
  2001C9  f2 86 02 20 d6           JP      Z,loc_200286

loc_2001CE:
  2001CE  32 09 00                 LD      DE,9
  2001D1  c5 ec 45                 MUL     DE,(XHL+)
  2001D4  3b                       PUSH    XHL
  2001D5  43 67 0e 20 00           LD      XHL,0x200E67
  2001DA  f3 07 ec e8 33           LDA     XHL,XHL+DE
  2001DF  31 09 00                 LD      BC,9
  2001E2  1e 3d 01                 CALR    sub_200322
  2001E5  5b                       POP     XHL
  2001E6  c9 1c e5                 DJNZ    A,loc_2001CE
  2001E9  e2 3c 63 00 22           LD      XDE,(0x633C)
  2001EE  1e 38 01                 CALR    sub_200329
  2001F1  44 ae 62 00 00           LD      XIX,0x62AE
  2001F6  45 ee 62 00 00           LD      XIY,0x62EE

loc_2001FB:
  2001FB  85 25                    LD      E,(XIY)
  2001FD  cd cf 20                 CP      E,0x20
  200200  f2 86 02 20 df           JP      NC,loc_200286
  200205  e5 ee 22                 LD      XDE,(XHL+)
  200208  ea e2                    OR      XDE,XDE
  20020A  66 74                    JR      Z,loc_200280
  20020C  c5 ec 21                 LD      A,(XHL+)
  20020F  f2 40 63 00 63           LD      (0x6340),XHL
  200214  ea 8b                    LD      XHL,XDE
  200216  d5 ed 22                 LD      DE,(XHL+)
  200219  da cf 7f 00              CP      DE,0x7F
  20021D  67 12                    JR      C,loc_200231
  20021F  c2 2f 63 00 3f 00        CPB     (0x632F),0
  200225  6e 0a                    JR      NZ,loc_200231
  200227  44 ef 62 00 00           LD      XIX,0x62EF
  20022C  45 2f 63 00 00           LD      XIY,0x632F

loc_200231:
  200231  f5 f1 52                 LD      (XIX+),DE
  200234  85 61                    INCB    1,(XIY)
  200236  c5 ec 25                 LD      E,(XHL+)
  200239  da 12                    EXTZ    DE
  20023B  93 21                    LD      BC,(XHL)
  20023D  d9 cc ff 3f              AND     BC,0x3FFF
  200241  da a1                    SUB     BC,DE
  200243  d8 a1                    SUB     BC,WA
  200245  f2 44 63 00 52           LD      (0x6344),DE
  20024A  d2 44 63 00 31           EX      (0x6344),BC
  20024F  1e d0 00                 CALR    sub_200322
  200252  f3 07 ec e0 33           LDA     XHL,XHL+WA
  200257  e2 40 63 00 22           LD      XDE,(0x6340)
  20025C  f2 40 63 00 63           LD      (0x6340),XHL
  200261  ea 8b                    LD      XHL,XDE
  200263  d8 89                    LD      BC,WA
  200265  1e ba 00                 CALR    sub_200322
  200268  3b                       PUSH    XHL
  200269  e2 40 63 00 23           LD      XHL,(0x6340)
  20026E  d2 44 63 00 21           LD      BC,(0x6344)
  200273  1e ac 00                 CALR    sub_200322
  200276  f2 3c 63 00 62           LD      (0x633C),XDE
  20027B  5b                       POP     XHL
  20027C  1b fb 01 20              JP      loc_2001FB

loc_200280:
  200280  5d                       POP     XIY
  200281  5c                       POP     XIX
  200282  5b                       POP     XHL
  200283  5a                       POP     XDE
  200284  59                       POP     XBC
  200285  0e                       RET

loc_200286:
  200286  11                       SCF
  200287  68 f7                    JR      loc_200280

sub_200289:
  200289  c2 aa 62 00 20           LD      W,(0x62AA)
  20028E  c2 ab 62 00 f8           CP      (0x62AB),W
  200293  10                       RCF
  200294  b0 f6                    RET     Z
  200296  44 9a 62 00 00           LD      XIX,0x629A
  20029B  c2 aa 62 00 20           LD      W,(0x62AA)
  2002A0  c3 03 f0 e1 21           LD      A,(XIX+W)
  2002A5  c8 61                    INC     1,W
  2002A7  c8 cc 0f                 AND     W,0xF
  2002AA  f2 aa 62 00 40           LD      (0x62AA),W
  2002AF  11                       SCF
  2002B0  0e                       RET

sub_2002B1:
  2002B1  c9 33 07                 BIT     7,A
  2002B4  66 02                    JR      Z,loc_2002B8
  2002B6  10                       RCF
  2002B7  0e                       RET

loc_2002B8:
  2002B8  20 01                    LD      W,1
  2002BA  c9 33 00                 BIT     0,A
  2002BD  6e 02                    JR      NZ,loc_2002C1
  2002BF  20 02                    LD      W,2

loc_2002C1:
  2002C1  c2 ac 62 00 c0           AND     W,(0x62AC)
  2002C6  11                       SCF
  2002C7  0e                       RET

dyn_2002C8:
  2002C8  c8 33 07                 BIT     7,W
  2002CB  11                       SCF
  2002CC  b0 fe                    RET     NZ
  2002CE  d8 cf 7f 00              CP      WA,0x7F
  2002D2  6e 04                    JR      NZ,dyn_2002D8
  2002D4  21 01                    LD      A,1
  2002D6  11                       SCF
  2002D7  0e                       RET

dyn_2002D8:
  2002D8  d8 cf 20 00              CP      WA,0x20
  2002DC  6f 07                    JR      NC,dyn_2002E5
  2002DE  c9 81                    ADD     A,A
  2002E0  c9 ce c0                 OR      A,0xC0
  2002E3  11                       SCF
  2002E4  0e                       RET

dyn_2002E5:
  2002E5  2a                       PUSH    DE
  2002E6  29                       PUSH    BC
  2002E7  25 03                    LD      E,3
  2002E9  44 ae 62 00 00           LD      XIX,0x62AE
  2002EE  d8 cf 80 00              CP      WA,0x80
  2002F2  67 11                    JR      C,0x200305
  2002F4  cd cc fe                 AND     E,0xFE
  2002F7  44 ef 62 00 00           LD      XIX,0x62EF
  2002FC  d8 cf 80 02              CP      WA,0x280
  200300  67 03                    JR      C,0x200305
  200302  cd cc fd                 AND     E,0xFD
  200305  31 20 00                 LD      BC,0x20
  200308  d8 cc ff 01              AND     WA,0x1FF
  20030C  94 15                    CPIRW   WA,(XIX+)
  20030E  6e 0e                    JR      NZ,loc_20031E
  200310  21 1f                    LD      A,0x1F
  200312  cb a1                    SUB     A,C
  200314  c9 81                    ADD     A,A
  200316  c9 81                    ADD     A,A
  200318  cd e1                    OR      A,E
  20031A  49                       POP     BC
  20031B  4a                       POP     DE
  20031C  11                       SCF
  20031D  0e                       RET

loc_20031E:
  20031E  49                       POP     BC
  20031F  4a                       POP     DE
  200320  10                       RCF
  200321  0e                       RET

sub_200322:
  200322  e2 30 63 00 22           LD      XDE,(0x6330)
  200327  83 11                    LDIR    (XDE+),(XHL+)

sub_200329:
  200329  f2 30 63 00 62           LD      (0x6330),XDE
  20032E  0e                       RET

sub_20032F:
  20032F  38                       PUSH    XWA
  200330  c0 20 3c f7              ANDB    (TRUN),0xF7
  200334  c0 28 3c 33              ANDB    (T23MOD),0x33
  200338  c0 28 3e 04              ORB     (T23MOD),4
  20033C  c0 25 3c 0f              ANDB    (0x25),0xF
  200340  c0 25 3e b0              ORB     (0x25),0xB0
  200344  d8 08 e8 03              MUL     XWA,0x3E8
  200348  d8 0a 00 50              DIV     XWA,0x5000
  20034C  d7 e2 cf 00 28           CP      QWA,0x2800
  200351  67 02                    JR      C,loc_200355
  200353  c9 61                    INC     1,A

loc_200355:
  200355  f0 27 41                 LD      (TREG3),A
  200358  c0 20 3e 88              ORB     (TRUN),0x88
  20035C  58                       POP     XWA
  20035D  0e                       RET

sub_20035E:
  20035E  42 00 70 00 00           LD      XDE,0x7000
  200363  1e c3 ff                 CALR    sub_200329
  200366  43 b2 03 20 00           LD      XHL,0x2003B2
  20036B  eb 8a                    LD      XDE,XHL
  20036D  d3 e9 8f 00 21           LD      BC,(XDE+0x8F)
  200372  d9 8a                    LD      DE,BC
  200374  ea 12                    EXTZ    XDE
  200376  f3 e9 00 70 32           LDA     XDE,XDE+0x7000
  20037B  f2 34 63 00 62           LD      (0x6334),XDE
  200380  1e 9f ff                 CALR    sub_200322
  200383  ea c8 06 00 00 00        ADD     XDE,6
  200389  1e 9d ff                 CALR    sub_200329
  20038C  43 82 0e 20 00           LD      XHL,0x200E82
  200391  d5 ed 21                 LD      BC,(XHL+)
  200394  d9 e1                    OR      BC,BC
  200396  66 03                    JR      Z,loc_20039B
  200398  1e 87 ff                 CALR    sub_200322

loc_20039B:
  20039B  f2 38 63 00 62           LD      (0x6338),XDE
  2003A0  0e                       RET

  ; ---- 0x5c02 bytes not traced ----

start:
  205FA3  1d 0c da 21              CALL    sub_21DA0C
  205FA7  1b ab 5f 20              JP      loc_205FAB

loc_205FAB:
  205FAB  06 07                    DI
  205FAD  17 01                    LDF     1
  205FAF  47 00 6c 00 00           LD      XSP,0x6C00
  205FB4  c7 31 a9                 LD      RW3,1
  205FB7  d7 34 a8                 LD      RBC3,0
  205FBA  1d f5 d9 21              CALL    sub_21D9F5
  205FBE  e8 a8                    LD      XWA,0
  205FC0  43 00 40 00 00           LD      XHL,0x4000

loc_205FC5:
  205FC5  f5 ee 60                 LD      (XHL+),XWA
  205FC8  db cf 00 6c              CP      HL,0x6C00
  205FCC  67 f7                    JR      C,loc_205FC5
  205FCE  c0 20 3e 80              ORB     (TRUN),0x80
  205FD2  c7 31 aa                 LD      RW3,2
  205FD5  e7 3c 03 0c 50 00 00     LD      XHL3,0x500C
  205FDC  1d f5 d9 21              CALL    sub_21D9F5
  205FE0  c7 31 03 10              LD      RW3,0x10
  205FE4  1d f5 d9 21              CALL    sub_21D9F5
  205FE8  1d 40 00 20              CALL    sub_200040
  205FEC  1d 55 00 20              CALL    sub_200055
  205FF0  e8 a8                    LD      XWA,0
  205FF2  1d 22 01 20              CALL    sub_200122
  205FF6  f1 0a 50 00 00           LDB     (0x500A),0
  205FFB  43 73 60 20 00           LD      XHL,0x206073
  206000  f1 cc 6f 63              LD      (VEC_VBLANK),XHL
  206004  d1 0c 50 20              LD      WA,(0x500C)
  206008  d1 0e 50 21              LD      BC,(0x500E)
  20600C  d1 10 50 22              LD      DE,(0x5010)
  206010  da 61                    INC     1,DE
  206012  1e a9 00                 CALR    sub_2060BE
  206015  1d 79 63 20              CALL    sub_206379
  206019  1d 50 62 20              CALL    sub_206250
  20601D  1d ea 6f 20              CALL    sub_206FEA
  206021  1d 12 6e 20              CALL    sub_206E12
  206025  f1 80 52 00 03           LDB     (0x5280),3
  20602A  1d cd 72 20              CALL    sub_2072CD
  20602E  43 c5 d5 21 00           LD      XHL,0x21D5C5
  206033  1d f5 62 20              CALL    sub_2062F5
  206037  06 00                    EI      0

loc_206039:
  206039  f1 0a 50 00 ff           LDB     (0x500A),0xFF

loc_20603E:
  20603E  c1 0a 50 3f 00           CPB     (0x500A),0
  206043  6e f9                    JR      NZ,loc_20603E
  206045  1d 9b 65 20              CALL    sub_20659B
  206049  1d 14 70 20              CALL    sub_207014
  20604D  1d 61 73 20              CALL    sub_207361
  206051  1d 25 6e 20              CALL    sub_206E25
  206055  1d 86 62 20              CALL    sub_206286
  206059  1d e8 00 20              CALL    sub_2000E8
  20605D  c1 e1 5c 3f 00           CPB     (0x5CE1),0
  206062  66 d5                    JR      Z,loc_206039
  206064  f1 02 80 02 00 ff        LDW     (GE_WBA_H),0xFF00
  20606A  f1 04 80 02 00 00        LDW     (GE_WSI_H),0
  206070  78 38 ff                 JRL     loc_205FAB

irq_vblank:
  206073  38                       PUSH    XWA
  206074  39                       PUSH    XBC
  206075  3a                       PUSH    XDE
  206076  3b                       PUSH    XHL
  206077  e7 30 04                 PUSH    XWA3
  20607A  e7 34 04                 PUSH    XBC3
  20607D  e7 38 04                 PUSH    XDE3
  206080  e7 3c 04                 PUSH    XHL3
  206083  c7 31 03 16              LD      RW3,0x16
  206087  1d f5 d9 21              CALL    sub_21D9F5
  20608B  1d c6 64 20              CALL    sub_2064C6
  20608F  1d b9 d9 21              CALL    sub_21D9B9
  206093  e1 06 50 20              LD      XWA,(0x5006)
  206097  e8 61                    INC     1,XWA
  206099  f1 06 50 60              LD      (0x5006),XWA
  20609D  f1 0a 50 00 00           LDB     (0x500A),0
  2060A2  08 6f 4e                 LDB     (WDCR),0x4E
  2060A5  c7 31 03 15              LD      RW3,0x15
  2060A9  1d f5 d9 21              CALL    sub_21D9F5
  2060AD  e7 3c 05                 POP     XHL3
  2060B0  e7 38 05                 POP     XDE3
  2060B3  e7 34 05                 POP     XBC3
  2060B6  e7 30 05                 POP     XWA3
  2060B9  5b                       POP     XHL
  2060BA  5a                       POP     XDE
  2060BB  59                       POP     XBC
  2060BC  58                       POP     XWA
  2060BD  07                       RETI

sub_2060BE:
  2060BE  f1 00 50 50              LD      (0x5000),WA
  2060C2  f1 02 50 51              LD      (0x5002),BC
  2060C6  f1 04 50 52              LD      (0x5004),DE
  2060CA  0e                       RET

dyn_2060CB:
  2060CB  39                       PUSH    XBC
  2060CC  d1 00 50 21              LD      BC,(0x5000)
  2060D0  d9 08 ab 00              MUL     XBC,0xAB
  2060D4  d9 0a 3d 76              DIV     XBC,0x763D
  2060D8  d7 e6 88                 LD      WA,QBC
  2060DB  f1 00 50 50              LD      (0x5000),WA
  2060DF  d1 02 50 21              LD      BC,(0x5002)
  2060E3  d9 08 ac 00              MUL     XBC,0xAC
  2060E7  d9 0a 63 76              DIV     XBC,0x7663
  2060EB  d7 e6 88                 LD      WA,QBC
  2060EE  f1 02 50 50              LD      (0x5002),WA
  2060F2  d1 04 50 21              LD      BC,(0x5004)
  2060F6  d9 08 aa 00              MUL     XBC,0xAA
  2060FA  d9 0a 73 76              DIV     XBC,0x7673
  2060FE  d7 e6 88                 LD      WA,QBC
  206101  f1 04 50 50              LD      (0x5004),WA
  206105  d1 00 50 21              LD      BC,(0x5000)
  206109  e9 ee 00                 SLL     16,XBC
  20610C  d9 0a 3d 76              DIV     XBC,0x763D
  206110  d9 88                    LD      WA,BC
  206112  d1 02 50 21              LD      BC,(0x5002)
  206116  e9 ee 00                 SLL     16,XBC
  206119  d9 0a 63 76              DIV     XBC,0x7663
  20611D  d9 80                    ADD     WA,BC
  20611F  d1 04 50 21              LD      BC,(0x5004)
  206123  e9 ee 00                 SLL     16,XBC
  206126  d9 0a 73 76              DIV     XBC,0x7673
  20612A  d9 80                    ADD     WA,BC
  20612C  59                       POP     XBC
  20612D  0e                       RET

dyn_20612E:
  20612E  26 00                    LD      H,0
  206130  eb 12                    EXTZ    XHL
  206132  cf 89                    LD      A,L
  206134  db ef 04                 SRL     4,HL
  206137  db ee 01                 SLL     1,HL
  20613A  d9 a9                    LD      BC,1
  20613C  d9 f8                    RLC     A,BC
  20613E  d3 ed 60 50 e9           OR      (XHL+0x5060),BC
  206143  0e                       RET

sub_206144:
  206144  26 00                    LD      H,0
  206146  eb 12                    EXTZ    XHL
  206148  cf 89                    LD      A,L
  20614A  db ef 04                 SRL     4,HL
  20614D  db ee 01                 SLL     1,HL
  206150  31 fe ff                 LD      BC,0xFFFE
  206153  d9 f8                    RLC     A,BC
  206155  d3 ed 60 50 c9           AND     (XHL+0x5060),BC
  20615A  0e                       RET

dyn_20615B:
  20615B  14                       PUSH    A
  20615C  29                       PUSH    BC
  20615D  26 00                    LD      H,0
  20615F  eb 12                    EXTZ    XHL
  206161  cf 89                    LD      A,L
  206163  db ef 04                 SRL     4,HL
  206166  db ee 01                 SLL     1,HL
  206169  d9 a9                    LD      BC,1
  20616B  d9 f8                    RLC     A,BC
  20616D  d3 ed 60 50 23           LD      HL,(XHL+0x5060)
  206172  d9 c3                    AND     HL,BC
  206174  db 7e                    SCC     NZ,HL
  206176  49                       POP     BC
  206177  15                       POP     A
  206178  0e                       RET

  ; ---- 0x1c bytes not traced ----

dyn_206195:
  206195  c8 61                    INC     1,W
  206197  43 7f 50 00 00           LD      XHL,0x507F
  20619C  c3 07 ec e0 23           LD      C,(XHL+WA)
  2061A1  cb cc 0f                 AND     C,0xF
  2061A4  cb cf 09                 CP      C,9
  2061A7  12                       CCF
  2061A8  b0 f7                    RET     C
  2061AA  cb 61                    INC     1,C
  2061AC  cb ce 80                 OR      C,0x80
  2061AF  f3 07 ec e0 43           LD      (XHL+WA),C
  2061B4  10                       RCF
  2061B5  0e                       RET

  ; ---- 0x2 bytes not traced ----

sub_2061B8:
  2061B8  43 7f 50 00 00           LD      XHL,0x507F
  2061BD  c3 07 ec e0 23           LD      C,(XHL+WA)
  2061C2  cb cc 0f                 AND     C,0xF
  2061C5  11                       SCF
  2061C6  b0 f6                    RET     Z
  2061C8  cb 69                    DEC     1,C
  2061CA  cb ce 80                 OR      C,0x80
  2061CD  f3 07 ec e0 43           LD      (XHL+WA),C
  2061D2  10                       RCF
  2061D3  0e                       RET

dyn_2061D4:
  2061D4  c8 61                    INC     1,W
  2061D6  43 7f 50 00 00           LD      XHL,0x507F
  2061DB  f3 07 ec e0 33           LDA     XHL,XHL+WA
  2061E0  83 21                    LD      A,(XHL)
  2061E2  c9 88                    LD      W,A
  2061E4  c9 cc 0f                 AND     A,0xF
  2061E7  c8 ee 01                 SLL     1,W
  2061EA  12                       CCF
  2061EB  0e                       RET

sub_2061EC:
  2061EC  3a                       PUSH    XDE
  2061ED  29                       PUSH    BC
  2061EE  23 08                    LD      C,8

loc_2061F0:
  2061F0  ea ef 04                 SRL     4,XDE
  2061F3  e8 12                    EXTZ    XWA
  2061F5  d8 0a 0a 00              DIV     XWA,0xA
  2061F9  c7 e2 ee 04              SLL     4,QA
  2061FD  c7 eb 8a                 LD      B,QD
  206200  c7 e2 e2                 OR      B,QA
  206203  c7 eb 9a                 LD      QD,B
  206206  cb 1c e7                 DJNZ    C,loc_2061F0
  206209  ea 88                    LD      XWA,XDE
  20620B  49                       POP     BC
  20620C  5a                       POP     XDE
  20620D  0e                       RET

sub_20620E:
  20620E  39                       PUSH    XBC
  20620F  cb 81                    ADD     A,C
  206211  c9 10                    DAA     A
  206213  ca 90                    ADC     W,B
  206215  c8 10                    DAA     W
  206217  c7 e2 8b                 LD      C,QA
  20621A  c7 e6 93                 ADC     C,QC
  20621D  cb 10                    DAA     C
  20621F  c7 e2 9b                 LD      QA,C
  206222  c7 e3 8b                 LD      C,QW
  206225  c7 e7 93                 ADC     C,QB
  206228  cb 10                    DAA     C
  20622A  c7 e3 9b                 LD      QW,C
  20622D  59                       POP     XBC
  20622E  0e                       RET

sub_20622F:
  20622F  39                       PUSH    XBC
  206230  cb a1                    SUB     A,C
  206232  c9 10                    DAA     A
  206234  ca b0                    SBC     W,B
  206236  c8 10                    DAA     W
  206238  c7 e2 8b                 LD      C,QA
  20623B  c7 e6 b3                 SBC     C,QC
  20623E  cb 10                    DAA     C
  206240  c7 e2 9b                 LD      QA,C
  206243  c7 e3 8b                 LD      C,QW
  206246  c7 e7 b3                 SBC     C,QB
  206249  cb 10                    DAA     C
  20624B  c7 e3 9b                 LD      QW,C
  20624E  59                       POP     XBC
  20624F  0e                       RET

sub_206250:
  206250  e8 a8                    LD      XWA,0
  206252  43 82 52 00 00           LD      XHL,0x5282
  206257  31 20 00                 LD      BC,0x20

loc_20625A:
  20625A  bb 00 50                 LD      (XHL+0),WA
  20625D  bb 06 50                 LD      (XHL+6),WA
  206260  bb 0c 50                 LD      (XHL+0xC),WA
  206263  bb 08 60                 LD      (XHL+8),XWA
  206266  db c8 2e 00              ADD     HL,0x2E
  20626A  d9 1c ed                 DJNZ    BC,loc_20625A
  20626D  f1 44 58 02 46 58        LDW     (0x5844),0x5846
  206273  f1 42 58 02 46 58        LDW     (0x5842),0x5846
  206279  f1 48 58 02 42 58        LDW     (0x5848),0x5842
  20627F  f1 46 58 02 42 58        LDW     (0x5846),0x5842
  206285  0e                       RET

sub_206286:
  206286  ee a8                    LD      XIZ,0
  206288  d1 44 58 26              LD      IZ,(0x5844)

loc_20628C:
  20628C  de cf 46 58              CP      IZ,0x5846
  206290  66 62                    JR      Z,loc_2062F4
  206292  be 07 cf                 BIT     7,(XIZ+7)
  206295  6e 31                    JR      NZ,loc_2062C8
  206297  be 07 b6                 RES     6,(XIZ+7)
  20629A  ae 08 23                 LD      XHL,(XIZ+8)
  20629D  ed a8                    LD      XIY,0
  20629F  9e 04 25                 LD      IY,(XIZ+4)
  2062A2  2d                       PUSH    IY
  2062A3  2e                       PUSH    IZ
  2062A4  b3 e8                    CALL    (XHL)
  2062A6  ee a8                    LD      XIZ,0
  2062A8  4e                       POP     IZ
  2062A9  ed a8                    LD      XIY,0
  2062AB  4d                       POP     IY
  2062AC  dd e5                    OR      IY,IY
  2062AE  66 13                    JR      Z,loc_2062C3
  2062B0  bd 07 cf                 BIT     7,(XIY+7)
  2062B3  66 05                    JR      Z,loc_2062BA
  2062B5  be 04 02 00 00           LDW     (XIZ+4),0

loc_2062BA:
  2062BA  bd 07 ce                 BIT     6,(XIY+7)
  2062BD  66 04                    JR      Z,loc_2062C3
  2062BF  8e 07 3e c0              ORB     (XIZ+7),0xC0

loc_2062C3:
  2062C3  9e 02 26                 LD      IZ,(XIZ+2)
  2062C6  68 c4                    JR      loc_20628C

loc_2062C8:
  2062C8  ea a8                    LD      XDE,0
  2062CA  9e 04 22                 LD      DE,(XIZ+4)
  2062CD  da e2                    OR      DE,DE
  2062CF  66 03                    JR      Z,loc_2062D4
  2062D1  9a 0c 69                 DECW    1,(XDE+0xC)

loc_2062D4:
  2062D4  9e 00 22                 LD      DE,(XIZ+0)
  2062D7  eb a8                    LD      XHL,0
  2062D9  9e 02 23                 LD      HL,(XIZ+2)
  2062DC  ba 02 53                 LD      (XDE+2),HL
  2062DF  bb 00 52                 LD      (XHL+0),DE
  2062E2  be 00 02 00 00           LDW     (XIZ+0),0
  2062E7  be 06 02 00 00           LDW     (XIZ+6),0
  2062EC  db 8e                    LD      IZ,HL
  2062EE  c1 4a 58 69              DECB    1,(0x584A)
  2062F2  68 98                    JR      loc_20628C

loc_2062F4:
  2062F4  0e                       RET

sub_2062F5:
  2062F5  c1 4a 58 61              INCB    1,(0x584A)
  2062F9  eb 8a                    LD      XDE,XHL
  2062FB  1d 50 63 20              CALL    sub_206350
  2062FF  b0 f7                    RET     C
  206301  e8 a8                    LD      XWA,0
  206303  d1 46 58 20              LD      WA,(0x5846)
  206307  b8 02 53                 LD      (XWA+2),HL
  20630A  f1 46 58 53              LD      (0x5846),HL
  20630E  bb 00 50                 LD      (XHL+0),WA
  206311  bb 02 02 46 58           LDW     (XHL+2),0x5846
  206316  bb 08 62                 LD      (XHL+8),XDE
  206319  bb 04 02 00 00           LDW     (XHL+4),0
  20631E  bb 0c 02 00 00           LDW     (XHL+0xC),0
  206323  0e                       RET

dyn_206324:
  206324  c1 4a 58 61              INCB    1,(0x584A)
  206328  eb 8a                    LD      XDE,XHL
  20632A  1d 50 63 20              CALL    sub_206350
  20632E  b0 f7                    RET     C
  206330  e8 a8                    LD      XWA,0
  206332  9e 02 20                 LD      WA,(XIZ+2)
  206335  b8 00 53                 LD      (XWA+0),HL
  206338  be 02 53                 LD      (XIZ+2),HL
  20633B  bb 00 56                 LD      (XHL+0),IZ
  20633E  bb 02 50                 LD      (XHL+2),WA
  206341  bb 08 62                 LD      (XHL+8),XDE
  206344  bb 04 56                 LD      (XHL+4),IZ
  206347  bb 0c 02 00 00           LDW     (XHL+0xC),0
  20634C  9e 0c 61                 INCW    1,(XIZ+0xC)
  20634F  0e                       RET

sub_206350:
  206350  43 82 52 00 00           LD      XHL,0x5282

loc_206355:
  206355  8b 00 3f 00              CPB     (XHL+0),0
  206359  b0 f6                    RET     Z
  20635B  db c8 2e 00              ADD     HL,0x2E
  20635F  db cf 42 58              CP      HL,0x5842
  206363  67 f0                    JR      C,loc_206355
  206365  eb a8                    LD      XHL,0
  206367  11                       SCF
  206368  0e                       RET

dyn_206369:
  206369  be 07 bf                 SET     7,(XIZ+7)
  20636C  0e                       RET

dyn_20636D:
  20636D  be 07 be                 SET     6,(XIZ+7)
  206370  0e                       RET

  ; ---- 0x8 bytes not traced ----

sub_206379:
  206379  f1 c6 5b 00 00           LDB     (0x5BC6),0
  20637E  c1 91 6f 3f 10           CPB     (SYS_OS_VERSION),0x10
  206383  67 11                    JR      C,loc_206396
  206385  f1 c6 5b 00 10           LDB     (0x5BC6),0x10
  20638A  c7 31 03 0e              LD      RW3,0xE
  20638E  c7 30 03 10              LD      RA3,0x10
  206392  1d f5 d9 21              CALL    sub_21D9F5

loc_206396:
  206396  f1 30 80 00 80           LDB     (GE_PLANE_PRIO),0x80
  20639B  f1 18 81 00 80           LDB     (GE_BGC),0x80
  2063A0  f1 12 80 00 07           LDB     (GE_2D_CTL),7
  2063A5  c0 20 3c 8e              ANDB    (TRUN),0x8E
  2063A9  08 24 00                 LDB     (T01MOD),0
  2063AC  08 22 01                 LDB     (TREG0),1
  2063AF  c0 20 3e 01              ORB     (TRUN),1
  2063B3  c7 31 ac                 LD      RW3,4
  2063B6  c7 35 a8                 LD      RB3,0
  2063B9  c7 34 aa                 LD      RC3,2
  2063BC  1d f5 d9 21              CALL    sub_21D9F5
  2063C0  1d e1 67 20              CALL    sub_2067E1
  2063C4  1d 47 68 20              CALL    sub_206847
  2063C8  1d ee 63 20              CALL    sub_2063EE
  2063CC  f1 5b 58 00 81           LDB     (0x585B),0x81
  2063D1  43 00 82 00 00           LD      XHL,0x8200
  2063D6  31 00 01                 LD      BC,0x100

loc_2063D9:
  2063D9  f5 ed 02 00 00           LDW     (XHL+),0
  2063DE  d9 1c f8                 DJNZ    BC,loc_2063D9
  2063E1  f1 02 80 02 00 00        LDW     (GE_WBA_H),0
  2063E7  f1 04 80 02 a0 98        LDW     (GE_WSI_H),0x98A0
  2063ED  0e                       RET

sub_2063EE:
  2063EE  21 00                    LD      A,0
  2063F0  f1 76 5a 41              LD      (0x5A76),A
  2063F4  f1 4b 58 41              LD      (0x584B),A
  2063F8  f1 4d 58 41              LD      (0x584D),A
  2063FC  f1 4f 58 41              LD      (0x584F),A
  206400  f1 51 58 41              LD      (0x5851),A
  206404  f1 53 58 41              LD      (0x5853),A
  206408  f1 55 58 41              LD      (0x5855),A
  20640C  f1 57 58 41              LD      (0x5857),A
  206410  f1 59 58 41              LD      (0x5859),A
  206414  f1 7b 5a 41              LD      (0x5A7B),A
  206418  f1 7d 5a 41              LD      (0x5A7D),A
  20641C  f1 7f 5a 41              LD      (0x5A7F),A
  206420  f1 80 5a 41              LD      (0x5A80),A
  206424  f1 81 5a 41              LD      (0x5A81),A
  206428  e8 a8                    LD      XWA,0
  20642A  43 86 5a 00 00           LD      XHL,0x5A86
  20642F  f1 82 5a 53              LD      (0x5A82),HL
  206433  42 86 5b 00 00           LD      XDE,0x5B86
  206438  f1 84 5a 52              LD      (0x5A84),DE
  20643C  23 40                    LD      C,0x40

loc_20643E:
  20643E  f5 ee 60                 LD      (XHL+),XWA
  206441  f5 e8 41                 LD      (XDE+),A
  206444  cb 1c f7                 DJNZ    C,loc_20643E
  206447  f1 5b 58 00 00           LDB     (0x585B),0
  20644C  f1 5c 58 00 ff           LDB     (0x585C),0xFF
  206451  f1 56 5a 02 ff 0f        LDW     (0x5A56),0xFFF
  206457  f1 58 5a 02 dd 0d        LDW     (0x5A58),0xDDD
  20645D  f1 5a 5a 02 bb 0b        LDW     (0x5A5A),0xBBB
  206463  f1 5c 5a 02 99 09        LDW     (0x5A5C),0x999
  206469  f1 5e 5a 02 66 06        LDW     (0x5A5E),0x666
  20646F  f1 60 5a 02 44 04        LDW     (0x5A60),0x444
  206475  f1 62 5a 02 22 02        LDW     (0x5A62),0x222
  20647B  f1 64 5a 02 00 00        LDW     (0x5A64),0
  206481  f1 66 5a 02 ff 0f        LDW     (0x5A66),0xFFF
  206487  f1 68 5a 02 dd 0d        LDW     (0x5A68),0xDDD
  20648D  f1 6a 5a 02 bb 0b        LDW     (0x5A6A),0xBBB
  206493  f1 6c 5a 02 99 09        LDW     (0x5A6C),0x999
  206499  f1 6e 5a 02 66 06        LDW     (0x5A6E),0x666
  20649F  f1 70 5a 02 44 04        LDW     (0x5A70),0x444
  2064A5  f1 72 5a 02 22 02        LDW     (0x5A72),0x222
  2064AB  f1 74 5a 02 00 00        LDW     (0x5A74),0
  2064B1  43 00 81 00 00           LD      XHL,0x8100
  2064B6  42 5d 58 00 00           LD      XDE,0x585D
  2064BB  31 19 00                 LD      BC,0x19
  2064BE  83 11                    LDIR    (XDE+),(XHL+)
  2064C0  f1 75 58 00 80           LDB     (0x5875),0x80
  2064C5  0e                       RET

sub_2064C6:
  2064C6  c1 7f 5a 20              LD      W,(0x5A7F)
  2064CA  c1 76 5a 21              LD      A,(0x5A76)
  2064CE  c9 e1                    OR      A,A
  2064D0  66 69                    JR      Z,loc_20653B
  2064D2  c9 cf 98                 CP      A,0x98
  2064D5  6f 64                    JR      NC,loc_20653B
  2064D7  c1 4f 58 23              LD      C,(0x584F)
  2064DB  c1 51 58 25              LD      E,(0x5851)
  2064DF  c8 33 03                 BIT     3,W
  2064E2  66 08                    JR      Z,loc_2064EC
  2064E4  c1 80 5a 83              ADD     C,(0x5A80)
  2064E8  c1 81 5a 85              ADD     E,(0x5A81)

loc_2064EC:
  2064EC  f1 77 5a 43              LD      (0x5A77),C
  2064F0  f1 78 5a 45              LD      (0x5A78),E
  2064F4  c1 57 58 23              LD      C,(0x5857)
  2064F8  c1 59 58 25              LD      E,(0x5859)
  2064FC  c8 33 04                 BIT     4,W
  2064FF  66 08                    JR      Z,loc_206509
  206501  c1 80 5a 83              ADD     C,(0x5A80)
  206505  c1 81 5a 85              ADD     E,(0x5A81)

loc_206509:
  206509  f1 79 5a 43              LD      (0x5A79),C
  20650D  f1 7a 5a 45              LD      (0x5A7A),E
  206511  20 00                    LD      W,0
  206513  d8 2e 20                 LDC     DMAC0,WA
  206516  21 14                    LD      A,0x14
  206518  c9 2e 22                 LDC     DMAM0,A
  20651B  08 7c 10                 LDB     (DMA0V),0x10
  20651E  40 77 5a 00 00           LD      XWA,0x5A77
  206523  e8 2e 04                 LDC     DMAS1,XWA
  206526  40 32 80 00 00           LD      XWA,0x8032
  20652B  e8 2e 14                 LDC     DMAD1,XWA
  20652E  d8 a9                    LD      WA,1
  206530  d8 2e 24                 LDC     DMAC1,WA
  206533  21 0a                    LD      A,0xA
  206535  c9 2e 26                 LDC     DMAM1,A
  206538  08 7d 10                 LDB     (DMA1V),0x10

loc_20653B:
  20653B  c1 7f 5a 20              LD      W,(0x5A7F)
  20653F  c1 4b 58 23              LD      C,(0x584B)
  206543  c1 4d 58 25              LD      E,(0x584D)
  206547  c8 33 01                 BIT     1,W
  20654A  66 08                    JR      Z,loc_206554
  20654C  c1 80 5a 83              ADD     C,(0x5A80)
  206550  c1 81 5a 85              ADD     E,(0x5A81)

loc_206554:
  206554  f1 32 80 43              LD      (GE_S1SO_H),C
  206558  f1 33 80 45              LD      (GE_S1SO_V),E
  20655C  c1 53 58 23              LD      C,(0x5853)
  206560  c1 55 58 25              LD      E,(0x5855)
  206564  c8 33 02                 BIT     2,W
  206567  66 08                    JR      Z,loc_206571
  206569  c1 80 5a 83              ADD     C,(0x5A80)
  20656D  c1 81 5a 85              ADD     E,(0x5A81)

loc_206571:
  206571  f1 34 80 43              LD      (GE_S2SO_H),C
  206575  f1 35 80 45              LD      (GE_S2SO_V),E
  206579  c1 7b 5a 23              LD      C,(0x5A7B)
  20657D  c1 7d 5a 25              LD      E,(0x5A7D)
  206581  c8 33 00                 BIT     0,W
  206584  66 08                    JR      Z,loc_20658E
  206586  c1 80 5a 83              ADD     C,(0x5A80)
  20658A  c1 81 5a 85              ADD     E,(0x5A81)

loc_20658E:
  20658E  cb 07                    NEG     C
  206590  cd 07                    NEG     E
  206592  f1 20 80 43              LD      (GE_PO_H),C
  206596  f1 21 80 45              LD      (GE_PO_V),E
  20659A  0e                       RET

sub_20659B:
  20659B  3c                       PUSH    XIX
  20659C  3d                       PUSH    XIY
  20659D  43 86 5a 00 00           LD      XHL,0x5A86
  2065A2  42 00 89 00 00           LD      XDE,0x8900
  2065A7  d1 82 5a 21              LD      BC,(0x5A82)
  2065AB  db a1                    SUB     BC,HL
  2065AD  66 0c                    JR      Z,loc_2065BB
  2065AF  d9 ef 02                 SRL     2,BC

loc_2065B2:
  2065B2  e5 ee 20                 LD      XWA,(XHL+)
  2065B5  f4 ea 60                 LD      (-XDE),XWA
  2065B8  d9 1c f7                 DJNZ    BC,loc_2065B2

loc_2065BB:
  2065BB  31 86 5b                 LD      BC,0x5B86
  2065BE  d1 82 5a a1              SUB     BC,(0x5A82)
  2065C2  66 0b                    JR      Z,loc_2065CF
  2065C4  d9 ef 02                 SRL     2,BC
  2065C7  e8 a8                    LD      XWA,0

loc_2065C9:
  2065C9  f4 ea 60                 LD      (-XDE),XWA
  2065CC  d9 1c fa                 DJNZ    BC,loc_2065C9

loc_2065CF:
  2065CF  c1 c6 5b 3f 10           CPB     (0x5BC6),0x10
  2065D4  67 2e                    JR      C,loc_206604
  2065D6  43 86 5b 00 00           LD      XHL,0x5B86
  2065DB  42 40 8c 00 00           LD      XDE,0x8C40
  2065E0  d1 84 5a 21              LD      BC,(0x5A84)
  2065E4  db a1                    SUB     BC,HL
  2065E6  66 09                    JR      Z,loc_2065F1

loc_2065E8:
  2065E8  c5 ec 21                 LD      A,(XHL+)
  2065EB  f4 e8 41                 LD      (-XDE),A
  2065EE  d9 1c f7                 DJNZ    BC,loc_2065E8

loc_2065F1:
  2065F1  c1 5b 58 21              LD      A,(0x585B)
  2065F5  c1 5c 58 f1              CP      A,(0x585C)
  2065F9  f1 5c 58 41              LD      (0x585C),A
  2065FD  f2 26 66 20 ee           CALL    NZ,sub_206626
  206602  68 13                    JR      loc_206617

loc_206604:
  206604  c1 5b 58 21              LD      A,(0x585B)
  206608  c1 5c 58 f1              CP      A,(0x585C)
  20660C  f1 5c 58 41              LD      (0x585C),A
  206610  f2 de 66 20 ee           CALL    NZ,sub_2066DE
  206615  68 00                    JR      loc_206617

loc_206617:
  206617  f1 82 5a 02 86 5a        LDW     (0x5A82),0x5A86
  20661D  f1 84 5a 02 86 5b        LDW     (0x5A84),0x5B86
  206623  5d                       POP     XIY
  206624  5c                       POP     XIX
  206625  0e                       RET

sub_206626:
  206626  c1 c6 5b 3f 10           CPB     (0x5BC6),0x10
  20662B  b0 f7                    RET     C
  20662D  3c                       PUSH    XIX
  20662E  3d                       PUSH    XIY
  20662F  45 76 58 00 00           LD      XIY,0x5876
  206634  44 00 82 00 00           LD      XIX,0x8200
  206639  d7 ee 03 00 01           LD      QHL,0x100
  20663E  db a8                    LD      HL,0
  206640  c1 5b 58 21              LD      A,(0x585B)
  206644  c9 e1                    OR      A,A
  206646  76 81 00                 JRL     Z,loc_2066CA
  206649  c9 cf 7f                 CP      A,0x7F
  20664C  11                       SCF
  20664D  76 82 00                 JRL     Z,loc_2066D2
  206650  c9 cf 81                 CP      A,0x81
  206653  10                       RCF
  206654  66 7c                    JR      Z,loc_2066D2
  206656  c9 8f                    LD      L,A
  206658  cf ee 01                 SLL     1,L
  20665B  6f 32                    JR      NC,loc_20668F

loc_20665D:
  20665D  d5 f5 20                 LD      WA,(XIY+)
  206660  d8 89                    LD      BC,WA
  206662  d9 cc 0f 00              AND     BC,0xF
  206666  db 41                    MUL     XBC,HL
  206668  ca cc 0f                 AND     B,0xF
  20666B  ca 8d                    LD      E,B
  20666D  d8 89                    LD      BC,WA
  20666F  d9 cc f0 00              AND     BC,0xF0
  206673  db 41                    MUL     XBC,HL
  206675  ca cc f0                 AND     B,0xF0
  206678  ca e5                    OR      E,B
  20667A  d8 89                    LD      BC,WA
  20667C  d9 cc 00 0f              AND     BC,0xF00
  206680  db 41                    MUL     XBC,HL
  206682  c7 e6 8c                 LD      D,QC
  206685  f5 f1 52                 LD      (XIX+),DE
  206688  d7 ee 1c d1              DJNZ    QHL,loc_20665D
  20668C  5d                       POP     XIY
  20668D  5c                       POP     XIX
  20668E  0e                       RET

loc_20668F:
  20668F  d5 f5 20                 LD      WA,(XIY+)
  206692  d8 89                    LD      BC,WA
  206694  d9 cc 0f 00              AND     BC,0xF
  206698  cb cd 0f                 XOR     C,0xF
  20669B  db 41                    MUL     XBC,HL
  20669D  ca cc 0f                 AND     B,0xF
  2066A0  ca 81                    ADD     A,B
  2066A2  d8 89                    LD      BC,WA
  2066A4  d9 cc f0 00              AND     BC,0xF0
  2066A8  cb cd f0                 XOR     C,0xF0
  2066AB  db 41                    MUL     XBC,HL
  2066AD  ca cc f0                 AND     B,0xF0
  2066B0  ca 81                    ADD     A,B
  2066B2  d8 89                    LD      BC,WA
  2066B4  d9 cc 00 0f              AND     BC,0xF00
  2066B8  ca cd 0f                 XOR     B,0xF
  2066BB  db 41                    MUL     XBC,HL
  2066BD  c7 e6 80                 ADD     W,QC
  2066C0  f5 f1 50                 LD      (XIX+),WA
  2066C3  d7 ee 1c c8              DJNZ    QHL,loc_20668F
  2066C7  5d                       POP     XIY
  2066C8  5c                       POP     XIX
  2066C9  0e                       RET

loc_2066CA:
  2066CA  d7 ee 89                 LD      BC,QHL
  2066CD  95 11                    LDIRW   (XIX+),(XIY+)
  2066CF  5d                       POP     XIY
  2066D0  5c                       POP     XIX
  2066D1  0e                       RET

loc_2066D2:
  2066D2  d8 b0                    SBC     WA,WA

loc_2066D4:
  2066D4  f5 f1 50                 LD      (XIX+),WA
  2066D7  d7 ee 1c f9              DJNZ    QHL,loc_2066D4
  2066DB  5d                       POP     XIY
  2066DC  5c                       POP     XIX
  2066DD  0e                       RET

sub_2066DE:
  2066DE  c1 c6 5b 3f 10           CPB     (0x5BC6),0x10
  2066E3  b0 ff                    RET     NC
  2066E5  3c                       PUSH    XIX
  2066E6  3d                       PUSH    XIY
  2066E7  45 5d 58 00 00           LD      XIY,0x585D
  2066EC  44 00 81 00 00           LD      XIX,0x8100
  2066F1  d7 ee 03 19 00           LD      QHL,0x19
  2066F6  db a8                    LD      HL,0
  2066F8  c1 5b 58 21              LD      A,(0x585B)
  2066FC  c9 e1                    OR      A,A
  2066FE  66 4e                    JR      Z,loc_20674E
  206700  c9 cf 7f                 CP      A,0x7F
  206703  10                       RCF
  206704  66 50                    JR      Z,loc_206756
  206706  c9 cf 81                 CP      A,0x81
  206709  11                       SCF
  20670A  66 4a                    JR      Z,loc_206756
  20670C  c9 8f                    LD      L,A
  20670E  cf ee 01                 SLL     1,L
  206711  cf 06                    CPL     L
  206713  67 19                    JR      C,loc_20672E

loc_206715:
  206715  c5 f4 21                 LD      A,(XIY+)
  206718  d8 cc 07 00              AND     WA,7
  20671C  db 40                    MUL     XWA,HL
  20671E  c8 cc 07                 AND     W,7
  206721  c8 ce 80                 OR      W,0x80
  206724  f5 f0 40                 LD      (XIX+),W
  206727  d7 ee 1c ea              DJNZ    QHL,loc_206715
  20672B  5d                       POP     XIY
  20672C  5c                       POP     XIX
  20672D  0e                       RET

loc_20672E:
  20672E  c5 f4 21                 LD      A,(XIY+)
  206731  d8 cc 07 00              AND     WA,7
  206735  c9 8b                    LD      C,A
  206737  c9 cd 07                 XOR     A,7
  20673A  db 40                    MUL     XWA,HL
  20673C  cb 80                    ADD     W,C
  20673E  c8 cc 07                 AND     W,7
  206741  c8 ce 80                 OR      W,0x80
  206744  f5 f0 40                 LD      (XIX+),W
  206747  d7 ee 1c e3              DJNZ    QHL,loc_20672E
  20674B  5d                       POP     XIY
  20674C  5c                       POP     XIX
  20674D  0e                       RET

loc_20674E:
  20674E  d7 ee 89                 LD      BC,QHL
  206751  85 11                    LDIR    (XIX+),(XIY+)
  206753  5d                       POP     XIY
  206754  5c                       POP     XIX
  206755  0e                       RET

loc_206756:
  206756  c8 b0                    SBC     W,W
  206758  c8 cc 07                 AND     W,7
  20675B  c8 ce 80                 OR      W,0x80

loc_20675E:
  20675E  f5 f0 40                 LD      (XIX+),W
  206761  d7 ee 1c f9              DJNZ    QHL,loc_20675E
  206765  5d                       POP     XIY
  206766  5c                       POP     XIX
  206767  0e                       RET

dyn_206768:
  206768  cd cf 20                 CP      E,0x20
  20676B  43 00 90 00 00           LD      XHL,0x9000
  206770  67 16                    JR      C,dyn_206788
  206772  cd ca 20                 SUB     E,0x20
  206775  33 00 98                 LD      HL,0x9800
  206778  68 0e                    JR      dyn_206788

  ; ---- 0xe bytes not traced ----

dyn_206788:
  206788  c7 e7 9a                 LD      QB,B
  20678B  c7 eb 9c                 LD      QD,D
  20678E  d9 13                    EXTS    BC
  206790  da 13                    EXTS    DE
  206792  d7 e2 98                 LD      QWA,WA
  206795  d7 e2 04                 PUSH    QWA
  206798  2a                       PUSH    DE
  206799  29                       PUSH    BC
  20679A  d9 a8                    LD      BC,0
  20679C  da a8                    LD      DE,0
  20679E  da 88                    LD      WA,DE
  2067A0  9f 02 80                 ADD     WA,(XSP+2)
  2067A3  65 29                    JR      MI,0x2067CE
  2067A5  d8 cf 20 00              CP      WA,0x20
  2067A9  6f 33                    JR      NC,0x2067DE
  2067AB  c9 cc 1f                 AND     A,0x1F
  2067AE  c7 e2 99                 LD      QA,A
  2067B1  d9 88                    LD      WA,BC
  2067B3  97 80                    ADD     WA,(XSP)
  2067B5  65 17                    JR      MI,0x2067CE
  2067B7  d8 cf 20 00              CP      WA,0x20
  2067BB  6f 11                    JR      NC,0x2067CE
  2067BD  c7 e3 a8                 LD      QW,0
  2067C0  d8 ee 0b                 SLL     11,WA
  2067C3  e8 ee 06                 SLL     6,XWA
  2067C6  9f 04 20                 LD      WA,(XSP+4)
  2067C9  f3 07 ec e2 50           LD      (XHL+QWA),WA
  2067CE  cb 61                    INC     1,C
  2067D0  c7 e7 f3                 CP      C,QB
  2067D3  67 c9                    JR      C,0x20679E
  2067D5  23 00                    LD      C,0
  2067D7  cd 61                    INC     1,E
  2067D9  c7 eb f5                 CP      E,QD
  2067DC  67 c0                    JR      C,0x20679E
  2067DE  ef 66                    INC     6,XSP
  2067E0  0e                       RET

sub_2067E1:
  2067E1  e8 a8                    LD      XWA,0
  2067E3  43 00 a0 00 00           LD      XHL,0xA000
  2067E8  f5 ee 60                 LD      (XHL+),XWA
  2067EB  f5 ee 60                 LD      (XHL+),XWA
  2067EE  f5 ee 60                 LD      (XHL+),XWA
  2067F1  f5 ee 60                 LD      (XHL+),XWA
  2067F4  43 00 90 00 00           LD      XHL,0x9000
  2067F9  31 00 04                 LD      BC,0x400

loc_2067FC:
  2067FC  f5 ee 60                 LD      (XHL+),XWA
  2067FF  d9 1c fa                 DJNZ    BC,loc_2067FC
  206802  0e                       RET

dyn_206803:
  206803  e8 a8                    LD      XWA,0
  206805  43 00 a0 00 00           LD      XHL,0xA000
  20680A  f5 ee 60                 LD      (XHL+),XWA
  20680D  f5 ee 60                 LD      (XHL+),XWA
  206810  f5 ee 60                 LD      (XHL+),XWA
  206813  f5 ee 60                 LD      (XHL+),XWA
  206816  43 00 90 00 00           LD      XHL,0x9000
  20681B  31 00 02                 LD      BC,0x200
  20681E  f5 ee 60                 LD      (XHL+),XWA
  206821  d9 1c fa                 DJNZ    BC,0x20681E
  206824  0e                       RET

dyn_206825:
  206825  e8 a8                    LD      XWA,0
  206827  43 00 a0 00 00           LD      XHL,0xA000
  20682C  f5 ee 60                 LD      (XHL+),XWA
  20682F  f5 ee 60                 LD      (XHL+),XWA
  206832  f5 ee 60                 LD      (XHL+),XWA
  206835  f5 ee 60                 LD      (XHL+),XWA
  206838  43 00 98 00 00           LD      XHL,0x9800
  20683D  31 00 02                 LD      BC,0x200
  206840  f5 ee 60                 LD      (XHL+),XWA
  206843  d9 1c fa                 DJNZ    BC,0x206840
  206846  0e                       RET

sub_206847:
  206847  e8 a8                    LD      XWA,0
  206849  43 00 88 00 00           LD      XHL,0x8800
  20684E  23 40                    LD      C,0x40

loc_206850:
  206850  f5 ee 60                 LD      (XHL+),XWA
  206853  cb 1c fa                 DJNZ    C,loc_206850
  206856  f1 82 5a 02 86 5a        LDW     (0x5A82),0x5A86
  20685C  f1 84 5a 02 86 5b        LDW     (0x5A84),0x5B86
  206862  0e                       RET

dyn_206863:
  206863  1d 77 68 20              CALL    dyn_206877
  206867  1d b3 68 20              CALL    dyn_2068B3
  20686B  1b ef 68 20              JP      dyn_2068EF

  ; ---- 0x8 bytes not traced ----

dyn_206877:
  206877  30 ff 0f                 LD      WA,0xFFF
  20687A  42 f6 58 00 00           LD      XDE,0x58F6
  20687F  23 3c                    LD      C,0x3C
  206881  f5 e9 50                 LD      (XDE+),WA
  206884  cb 1c fa                 DJNZ    C,0x206881
  206887  43 10 f0 21 00           LD      XHL,0x21F010
  20688C  d9 ac                    LD      BC,4
  20688E  93 11                    LDIRW   (XDE+),(XHL+)
  206890  21 00                    LD      A,0
  206892  42 65 58 00 00           LD      XDE,0x5865
  206897  23 04                    LD      C,4
  206899  f5 e8 41                 LD      (XDE+),A
  20689C  cb 1c fa                 DJNZ    C,0x206899
  20689F  43 18 f0 21 00           LD      XHL,0x21F018
  2068A4  d9 ac                    LD      BC,4
  2068A6  83 11                    LDIR    (XDE+),(XHL+)
  2068A8  c1 5b 58 21              LD      A,(0x585B)
  2068AC  c9 06                    CPL     A
  2068AE  f1 5c 58 41              LD      (0x585C),A
  2068B2  0e                       RET

dyn_2068B3:
  2068B3  30 ff 0f                 LD      WA,0xFFF
  2068B6  42 76 59 00 00           LD      XDE,0x5976
  2068BB  23 3c                    LD      C,0x3C
  2068BD  f5 e9 50                 LD      (XDE+),WA
  2068C0  cb 1c fa                 DJNZ    C,0x2068BD
  2068C3  43 10 f0 21 00           LD      XHL,0x21F010
  2068C8  d9 ac                    LD      BC,4
  2068CA  93 11                    LDIRW   (XDE+),(XHL+)
  2068CC  21 00                    LD      A,0
  2068CE  42 6d 58 00 00           LD      XDE,0x586D
  2068D3  23 04                    LD      C,4
  2068D5  f5 e8 41                 LD      (XDE+),A
  2068D8  cb 1c fa                 DJNZ    C,0x2068D5
  2068DB  43 18 f0 21 00           LD      XHL,0x21F018
  2068E0  d9 ac                    LD      BC,4
  2068E2  83 11                    LDIR    (XDE+),(XHL+)
  2068E4  c1 5b 58 21              LD      A,(0x585B)
  2068E8  c9 06                    CPL     A
  2068EA  f1 5c 58 41              LD      (0x585C),A
  2068EE  0e                       RET

dyn_2068EF:
  2068EF  30 ff 0f                 LD      WA,0xFFF
  2068F2  42 76 58 00 00           LD      XDE,0x5876
  2068F7  23 3c                    LD      C,0x3C
  2068F9  f5 e9 50                 LD      (XDE+),WA
  2068FC  cb 1c fa                 DJNZ    C,0x2068F9
  2068FF  43 10 f0 21 00           LD      XHL,0x21F010
  206904  d9 ac                    LD      BC,4
  206906  93 11                    LDIRW   (XDE+),(XHL+)
  206908  21 00                    LD      A,0
  20690A  42 5d 58 00 00           LD      XDE,0x585D
  20690F  23 04                    LD      C,4
  206911  f5 e8 41                 LD      (XDE+),A
  206914  cb 1c fa                 DJNZ    C,0x206911
  206917  43 18 f0 21 00           LD      XHL,0x21F018
  20691C  d9 ac                    LD      BC,4
  20691E  83 11                    LDIR    (XDE+),(XHL+)
  206920  c1 5b 58 21              LD      A,(0x585B)
  206924  c9 06                    CPL     A
  206926  f1 5c 58 41              LD      (0x585C),A
  20692A  0e                       RET

sub_20692B:
  20692B  d5 ed 21                 LD      BC,(XHL+)
  20692E  d9 ee 03                 SLL     3,BC
  206931  d8 8a                    LD      DE,WA
  206933  da ee 04                 SLL     4,DE
  206936  ea 12                    EXTZ    XDE
  206938  ea c8 00 a0 00 00        ADD     XDE,0xA000
  20693E  93 11                    LDIRW   (XDE+),(XHL+)
  206940  0e                       RET

  ; ---- 0x52 bytes not traced ----

dyn_206993:
  206993  ea a8                    LD      XDE,0
  206995  c7 e2 cc 03              AND     QA,3
  206999  66 1a                    JR      Z,0x2069B5
  20699B  c7 e2 8d                 LD      E,QA
  20699E  cd ee 02                 SLL     2,E
  2069A1  c7 e2 e5                 OR      E,QA
  2069A4  cd ee 02                 SLL     2,E
  2069A7  c7 e2 e5                 OR      E,QA
  2069AA  cd ee 02                 SLL     2,E
  2069AD  c7 e2 e5                 OR      E,QA
  2069B0  cd 8c                    LD      D,E
  2069B2  d7 ea 9a                 LD      QDE,DE
  2069B5  d9 ee 02                 SLL     2,BC
  2069B8  d8 ee 04                 SLL     4,WA
  2069BB  d8 c8 00 a0              ADD     WA,0xA000
  2069BF  e8 12                    EXTZ    XWA
  2069C1  f5 e2 62                 LD      (XWA+),XDE
  2069C4  d9 1c fa                 DJNZ    BC,0x2069C1
  2069C7  0e                       RET

dyn_2069C8:
  2069C8  da cf 98 00              CP      DE,0x98
  2069CC  b0 f9                    RET     GE
  2069CE  d9 cf a0 00              CP      BC,0xA0
  2069D2  b0 f9                    RET     GE
  2069D4  d8 69                    DEC     1,WA
  2069D6  c8 ce 18                 OR      W,0x18
  2069D9  28                       PUSH    WA
  2069DA  2a                       PUSH    DE
  2069DB  29                       PUSH    BC
  2069DC  c5 ec 21                 LD      A,(XHL+)
  2069DF  c7 e6 99                 LD      QC,A
  2069E2  20 00                    LD      W,0
  2069E4  d8 ee 03                 SLL     3,WA
  2069E7  d9 80                    ADD     WA,BC
  2069E9  75 8c 00                 JRL     MI,0x206A78
  2069EC  c5 ec 21                 LD      A,(XHL+)
  2069EF  c7 e7 99                 LD      QB,A
  2069F2  20 00                    LD      W,0
  2069F4  d8 ee 03                 SLL     3,WA
  2069F7  da 80                    ADD     WA,DE
  2069F9  65 7d                    JR      MI,0x206A78
  2069FB  d9 a8                    LD      BC,0
  2069FD  ea a8                    LD      XDE,0
  2069FF  d1 82 5a 3f 86 5b        CPW     (0x5A82),0x5B86
  206A05  6f 71                    JR      NC,0x206A78
  206A07  93 20                    LD      WA,(XHL)
  206A09  d8 cc ff 01              AND     WA,0x1FF
  206A0D  66 57                    JR      Z,0x206A66
  206A0F  ca 89                    LD      A,B
  206A11  20 00                    LD      W,0
  206A13  d8 ee 03                 SLL     3,WA
  206A16  9f 02 80                 ADD     WA,(XSP+2)
  206A19  d8 cf f8 ff              CP      WA,0xFFF8
  206A1D  62 47                    JR      LE,0x206A66
  206A1F  d8 cf a0 00              CP      WA,0xA0
  206A23  69 53                    JR      GE,0x206A78
  206A25  c7 e3 99                 LD      QW,A
  206A28  cb 89                    LD      A,C
  206A2A  20 00                    LD      W,0
  206A2C  d8 ee 03                 SLL     3,WA
  206A2F  97 80                    ADD     WA,(XSP)
  206A31  d8 cf f8 ff              CP      WA,0xFFF8
  206A35  62 2f                    JR      LE,0x206A66
  206A37  d8 cf a8 00              CP      WA,0xA8
  206A3B  69 29                    JR      GE,0x206A66
  206A3D  c7 e2 99                 LD      QA,A
  206A40  93 20                    LD      WA,(XHL)
  206A42  c8 cc e1                 AND     W,0xE1
  206A45  9f 04 80                 ADD     WA,(XSP+4)
  206A48  d1 82 5a 22              LD      DE,(0x5A82)
  206A4C  f5 ea 60                 LD      (XDE+),XWA
  206A4F  f1 82 5a 52              LD      (0x5A82),DE
  206A53  93 20                    LD      WA,(XHL)
  206A55  c8 ef 01                 SRL     1,W
  206A58  c8 cc 0f                 AND     W,0xF
  206A5B  d1 84 5a 22              LD      DE,(0x5A84)
  206A5F  f5 e8 40                 LD      (XDE+),W
  206A62  f1 84 5a 52              LD      (0x5A84),DE
  206A66  eb 62                    INC     2,XHL
  206A68  cb 61                    INC     1,C
  206A6A  c7 e6 f3                 CP      C,QC
  206A6D  67 90                    JR      C,0x2069FF
  206A6F  23 00                    LD      C,0
  206A71  ca 61                    INC     1,B
  206A73  c7 e7 f2                 CP      B,QB
  206A76  67 87                    JR      C,0x2069FF
  206A78  ef 66                    INC     6,XSP
  206A7A  0e                       RET

  ; ---- 0xbc bytes not traced ----

dyn_206B37:
  206B37  d8 69                    DEC     1,WA
  206B39  28                       PUSH    WA
  206B3A  2a                       PUSH    DE
  206B3B  29                       PUSH    BC
  206B3C  da cf 20 00              CP      DE,0x20
  206B40  42 00 90 00 00           LD      XDE,0x9000
  206B45  67 22                    JR      C,dyn_206B69
  206B47  9f 02 3a 20 00           SUBW    (XSP+2),0x20
  206B4C  32 00 98                 LD      DE,0x9800
  206B4F  68 18                    JR      dyn_206B69

dyn_206B51:
  206B51  d8 69                    DEC     1,WA
  206B53  28                       PUSH    WA
  206B54  2a                       PUSH    DE
  206B55  29                       PUSH    BC
  206B56  42 00 90 00 00           LD      XDE,0x9000
  206B5B  68 0c                    JR      dyn_206B69

dyn_206B5D:
  206B5D  d8 69                    DEC     1,WA
  206B5F  28                       PUSH    WA
  206B60  2a                       PUSH    DE
  206B61  29                       PUSH    BC
  206B62  42 00 98 00 00           LD      XDE,0x9800
  206B67  68 00                    JR      dyn_206B69

dyn_206B69:
  206B69  9f 02 3f 20 00           CPW     (XSP+2),0x20
  206B6E  79 8b 00                 JRL     GE,0x206BFC
  206B71  97 3f 20 00              CPW     (XSP),0x20
  206B75  79 84 00                 JRL     GE,0x206BFC
  206B78  c5 ec 21                 LD      A,(XHL+)
  206B7B  c7 e6 99                 LD      QC,A
  206B7E  20 00                    LD      W,0
  206B80  97 80                    ADD     WA,(XSP)
  206B82  65 78                    JR      MI,0x206BFC
  206B84  bf 05 cf                 BIT     7,(XSP+5)
  206B87  66 02                    JR      Z,0x206B8B
  206B89  b7 50                    LD      (XSP),WA
  206B8B  c5 ec 21                 LD      A,(XHL+)
  206B8E  c7 e7 99                 LD      QB,A
  206B91  20 00                    LD      W,0
  206B93  9f 02 80                 ADD     WA,(XSP+2)
  206B96  65 64                    JR      MI,0x206BFC
  206B98  bf 05 ce                 BIT     6,(XSP+5)
  206B9B  66 02                    JR      Z,0x206B9F
  206B9D  b7 50                    LD      (XSP),WA
  206B9F  d9 a8                    LD      BC,0
  206BA1  ca 89                    LD      A,B
  206BA3  20 00                    LD      W,0
  206BA5  bf 05 ce                 BIT     6,(XSP+5)
  206BA8  66 02                    JR      Z,0x206BAC
  206BAA  d8 07                    NEG     WA
  206BAC  9f 02 80                 ADD     WA,(XSP+2)
  206BAF  65 39                    JR      MI,0x206BEA
  206BB1  d8 cf 20 00              CP      WA,0x20
  206BB5  6f 45                    JR      NC,0x206BFC
  206BB7  c7 e2 99                 LD      QA,A
  206BBA  cb 89                    LD      A,C
  206BBC  20 00                    LD      W,0
  206BBE  bf 05 cf                 BIT     7,(XSP+5)
  206BC1  66 02                    JR      Z,0x206BC5
  206BC3  d8 07                    NEG     WA
  206BC5  97 80                    ADD     WA,(XSP)
  206BC7  65 21                    JR      MI,0x206BEA
  206BC9  d8 cf 20 00              CP      WA,0x20
  206BCD  6f 1b                    JR      NC,0x206BEA
  206BCF  c7 e3 a8                 LD      QW,0
  206BD2  d8 ee 0b                 SLL     11,WA
  206BD5  e8 ee 06                 SLL     6,XWA
  206BD8  93 20                    LD      WA,(XHL)
  206BDA  d8 cc ff 01              AND     WA,0x1FF
  206BDE  93 20                    LD      WA,(XHL)
  206BE0  66 03                    JR      Z,0x206BE5
  206BE2  9f 04 80                 ADD     WA,(XSP+4)
  206BE5  f3 07 e8 e2 50           LD      (XDE+QWA),WA
  206BEA  eb 62                    INC     2,XHL
  206BEC  cb 61                    INC     1,C
  206BEE  c7 e6 f3                 CP      C,QC
  206BF1  67 ae                    JR      C,0x206BA1
  206BF3  23 00                    LD      C,0
  206BF5  ca 61                    INC     1,B
  206BF7  c7 e7 f2                 CP      B,QB
  206BFA  67 a5                    JR      C,0x206BA1
  206BFC  ef 66                    INC     6,XSP
  206BFE  0e                       RET

dyn_206BFF:
  206BFF  28                       PUSH    WA
  206C00  2a                       PUSH    DE
  206C01  29                       PUSH    BC
  206C02  d9 a8                    LD      BC,0
  206C04  da a8                    LD      DE,0
  206C06  eb a8                    LD      XHL,0
  206C08  d1 82 5a 3f 86 5b        CPW     (0x5A82),0x5B86
  206C0E  6f 68                    JR      NC,0x206C78
  206C10  da 88                    LD      WA,DE
  206C12  d8 ee 03                 SLL     3,WA
  206C15  9f 02 80                 ADD     WA,(XSP+2)
  206C18  d8 cf f8 ff              CP      WA,0xFFF8
  206C1C  62 47                    JR      LE,0x206C65
  206C1E  d8 cf a0 00              CP      WA,0xA0
  206C22  69 54                    JR      GE,0x206C78
  206C24  c7 e3 99                 LD      QW,A
  206C27  d9 88                    LD      WA,BC
  206C29  d8 ee 03                 SLL     3,WA
  206C2C  97 80                    ADD     WA,(XSP)
  206C2E  d8 cf f8 ff              CP      WA,0xFFF8
  206C32  62 31                    JR      LE,0x206C65
  206C34  d8 cf a8 00              CP      WA,0xA8
  206C38  69 2b                    JR      GE,0x206C65
  206C3A  c7 e2 99                 LD      QA,A
  206C3D  9f 04 20                 LD      WA,(XSP+4)
  206C40  c8 cc e1                 AND     W,0xE1
  206C43  c8 ce 18                 OR      W,0x18
  206C46  d1 82 5a 23              LD      HL,(0x5A82)
  206C4A  f5 ee 60                 LD      (XHL+),XWA
  206C4D  f1 82 5a 53              LD      (0x5A82),HL
  206C51  9f 04 20                 LD      WA,(XSP+4)
  206C54  c8 cc 1e                 AND     W,0x1E
  206C57  c8 ef 01                 SRL     1,W
  206C5A  d1 84 5a 23              LD      HL,(0x5A84)
  206C5E  f5 ec 40                 LD      (XHL+),W
  206C61  f1 84 5a 53              LD      (0x5A84),HL
  206C65  9f 04 61                 INCW    1,(XSP+4)
  206C68  cb 61                    INC     1,C
  206C6A  c7 e7 f3                 CP      C,QB
  206C6D  67 99                    JR      C,0x206C08
  206C6F  23 00                    LD      C,0
  206C71  cd 61                    INC     1,E
  206C73  c7 eb f5                 CP      E,QD
  206C76  67 90                    JR      C,0x206C08
  206C78  ef 66                    INC     6,XSP
  206C7A  0e                       RET

  ; ---- 0x123 bytes not traced ----

sub_206D9E:
  206D9E  c9 cf 30                 CP      A,0x30
  206DA1  b0 ff                    RET     NC
  206DA3  c9 88                    LD      W,A
  206DA5  cb 80                    ADD     W,C
  206DA7  c8 cf 40                 CP      W,0x40
  206DAA  62 04                    JR      LE,loc_206DB0
  206DAC  23 40                    LD      C,0x40
  206DAE  c9 a3                    SUB     C,A

loc_206DB0:
  206DB0  ea a8                    LD      XDE,0
  206DB2  c9 8d                    LD      E,A
  206DB4  da ee 03                 SLL     3,DE
  206DB7  da c8 76 58              ADD     DE,0x5876
  206DBB  22 00                    LD      B,0
  206DBD  d9 ee 02                 SLL     2,BC
  206DC0  93 11                    LDIRW   (XDE+),(XHL+)
  206DC2  c1 5b 58 21              LD      A,(0x585B)
  206DC6  c9 06                    CPL     A
  206DC8  f1 5c 58 41              LD      (0x585C),A
  206DCC  0e                       RET

sub_206DCD:
  206DCD  c9 de                    CP      A,6
  206DCF  b0 ff                    RET     NC
  206DD1  c9 88                    LD      W,A
  206DD3  cb 80                    ADD     W,C
  206DD5  c8 de                    CP      W,6
  206DD7  62 04                    JR      LE,loc_206DDD
  206DD9  23 06                    LD      C,6
  206DDB  c9 a3                    SUB     C,A

loc_206DDD:
  206DDD  ea a8                    LD      XDE,0
  206DDF  c9 8d                    LD      E,A
  206DE1  da ee 02                 SLL     2,DE
  206DE4  da c8 5d 58              ADD     DE,0x585D
  206DE8  22 00                    LD      B,0
  206DEA  d9 ee 02                 SLL     2,BC
  206DED  83 11                    LDIR    (XDE+),(XHL+)
  206DEF  c1 5b 58 21              LD      A,(0x585B)
  206DF3  c9 06                    CPL     A
  206DF5  f1 5c 58 41              LD      (0x585C),A
  206DF9  0e                       RET

  ; ---- 0x18 bytes not traced ----

sub_206E12:
  206E12  d8 a8                    LD      WA,0
  206E14  f1 c7 5b 50              LD      (0x5BC7),WA
  206E18  f1 c9 5b 50              LD      (0x5BC9),WA
  206E1C  f1 cb 5b 50              LD      (0x5BCB),WA
  206E20  f1 cd 5b 50              LD      (0x5BCD),WA
  206E24  0e                       RET

sub_206E25:
  206E25  d1 cd 5b 20              LD      WA,(0x5BCD)
  206E29  d8 e0                    OR      WA,WA
  206E2B  6d 02                    JR      PL,loc_206E2F
  206E2D  d8 07                    NEG     WA

loc_206E2F:
  206E2F  d8 cf 10 00              CP      WA,0x10
  206E33  f2 c1 6f 20 df           JP      NC,loc_206FC1
  206E38  d1 cb 5b 20              LD      WA,(0x5BCB)
  206E3C  d8 e0                    OR      WA,WA
  206E3E  6d 02                    JR      PL,loc_206E42
  206E40  d8 07                    NEG     WA

loc_206E42:
  206E42  d8 cf 10 00              CP      WA,0x10
  206E46  f2 c1 6f 20 df           JP      NC,loc_206FC1
  206E4B  d1 cd 5b 22              LD      DE,(0x5BCD)
  206E4F  da e2                    OR      DE,DE
  206E51  66 2d                    JR      Z,loc_206E80
  206E53  d1 c9 5b 20              LD      WA,(0x5BC9)
  206E57  d8 82                    ADD     DE,WA
  206E59  f1 c9 5b 52              LD      (0x5BC9),DE
  206E5D  f1 4d 58 45              LD      (0x584D),E
  206E61  da ed 04                 SRA     4,DE
  206E64  d8 ed 04                 SRA     4,WA
  206E67  d8 f2                    CP      DE,WA
  206E69  66 15                    JR      Z,loc_206E80
  206E6B  67 04                    JR      C,loc_206E71
  206E6D  da c8 0c 00              ADD     DE,0xC

loc_206E71:
  206E71  d1 c7 5b 21              LD      BC,(0x5BC7)
  206E75  d9 ed 04                 SRA     4,BC
  206E78  d9 6a                    DEC     2,BC
  206E7A  da 6a                    DEC     2,DE
  206E7C  1d 8d 6f 20              CALL    sub_206F8D

loc_206E80:
  206E80  d1 cb 5b 21              LD      BC,(0x5BCB)
  206E84  d9 e1                    OR      BC,BC
  206E86  66 2d                    JR      Z,loc_206EB5
  206E88  d1 c7 5b 20              LD      WA,(0x5BC7)
  206E8C  d8 81                    ADD     BC,WA
  206E8E  f1 c7 5b 51              LD      (0x5BC7),BC
  206E92  f1 4b 58 43              LD      (0x584B),C
  206E96  d9 ed 04                 SRA     4,BC
  206E99  d8 ed 04                 SRA     4,WA
  206E9C  d8 f1                    CP      BC,WA
  206E9E  66 15                    JR      Z,loc_206EB5
  206EA0  67 04                    JR      C,loc_206EA6
  206EA2  d9 c8 0d 00              ADD     BC,0xD

loc_206EA6:
  206EA6  d1 c9 5b 22              LD      DE,(0x5BC9)
  206EAA  da ed 04                 SRA     4,DE
  206EAD  d9 6a                    DEC     2,BC
  206EAF  da 6a                    DEC     2,DE
  206EB1  1d 9e 6f 20              CALL    sub_206F9E

loc_206EB5:
  206EB5  0e                       RET

sub_206EB6:
  206EB6  e1 d1 5b 20              LD      XWA,(0x5BD1)
  206EBA  e9 13                    EXTS    XBC
  206EBC  90 59                    DIVS    XBC,(XWA)
  206EBE  d7 e6 89                 LD      BC,QBC
  206EC1  d9 e1                    OR      BC,BC
  206EC3  6d 02                    JR      PL,loc_206EC7
  206EC5  90 81                    ADD     BC,(XWA)

loc_206EC7:
  206EC7  ea 13                    EXTS    XDE
  206EC9  98 02 5a                 DIVS    XDE,(XWA+2)
  206ECC  d7 ea 8a                 LD      DE,QDE
  206ECF  da e2                    OR      DE,DE
  206ED1  6d 03                    JR      PL,loc_206ED6
  206ED3  98 02 82                 ADD     DE,(XWA+2)

loc_206ED6:
  206ED6  90 23                    LD      HL,(XWA)
  206ED8  da 43                    MUL     XHL,DE
  206EDA  d9 83                    ADD     HL,BC
  206EDC  db ee 01                 SLL     1,HL
  206EDF  eb 64                    INC     4,XHL
  206EE1  e8 83                    ADD     XHL,XWA
  206EE3  93 23                    LD      HL,(XHL)
  206EE5  0e                       RET

sub_206EE6:
  206EE6  ea a8                    LD      XDE,0
  206EE8  db 8a                    LD      DE,HL
  206EEA  da ee 03                 SLL     3,DE
  206EED  e1 d5 5b 82              ADD     XDE,(0x5BD5)
  206EF1  db cc 00 e0              AND     HL,0xE000
  206EF5  ce 33 06                 BIT     6,H
  206EF8  66 07                    JR      Z,loc_206F01
  206EFA  aa 04 21                 LD      XBC,(XDE+4)
  206EFD  a2 22                    LD      XDE,(XDE)
  206EFF  68 05                    JR      loc_206F06

loc_206F01:
  206F01  a2 21                    LD      XBC,(XDE)
  206F03  aa 04 22                 LD      XDE,(XDE+4)

loc_206F06:
  206F06  ce 33 07                 BIT     7,H
  206F09  66 06                    JR      Z,loc_206F11
  206F0B  d7 e6 b9                 EX      BC,QBC
  206F0E  d7 ea ba                 EX      DE,QDE

loc_206F11:
  206F11  d7 ee 9b                 LD      QHL,HL
  206F14  eb d1                    XOR     XBC,XHL
  206F16  eb d2                    XOR     XDE,XHL
  206F18  d1 cf 5b 23              LD      HL,(0x5BCF)
  206F1C  db 69                    DEC     1,HL
  206F1E  d9 88                    LD      WA,BC
  206F20  d8 cc ff 01              AND     WA,0x1FF
  206F24  66 02                    JR      Z,loc_206F28
  206F26  db 81                    ADD     BC,HL

loc_206F28:
  206F28  d7 e6 88                 LD      WA,QBC
  206F2B  d8 cc ff 01              AND     WA,0x1FF
  206F2F  66 08                    JR      Z,loc_206F39
  206F31  d7 e6 88                 LD      WA,QBC
  206F34  db 80                    ADD     WA,HL
  206F36  d7 e6 98                 LD      QBC,WA

loc_206F39:
  206F39  da 88                    LD      WA,DE
  206F3B  d8 cc ff 01              AND     WA,0x1FF
  206F3F  66 02                    JR      Z,loc_206F43
  206F41  db 82                    ADD     DE,HL

loc_206F43:
  206F43  d7 ea 88                 LD      WA,QDE
  206F46  d8 cc ff 01              AND     WA,0x1FF
  206F4A  66 08                    JR      Z,loc_206F54
  206F4C  d7 ea 88                 LD      WA,QDE
  206F4F  db 80                    ADD     WA,HL
  206F51  d7 ea 98                 LD      QDE,WA

loc_206F54:
  206F54  0e                       RET

  ; ---- 0x14 bytes not traced ----

sub_206F69:
  206F69  e8 a8                    LD      XWA,0
  206F6B  cb 89                    LD      A,C
  206F6D  cd 88                    LD      W,E
  206F6F  d8 cc 0f 0f              AND     WA,0xF0F
  206F73  c9 ee 03                 SLL     3,A
  206F76  d8 ef 01                 SRL     1,WA
  206F79  d8 c8 00 90              ADD     WA,0x9000
  206F7D  38                       PUSH    XWA
  206F7E  1d b6 6e 20              CALL    sub_206EB6
  206F82  1d e6 6e 20              CALL    sub_206EE6
  206F86  58                       POP     XWA
  206F87  b0 61                    LD      (XWA),XBC
  206F89  b8 40 62                 LD      (XWA+0x40),XDE
  206F8C  0e                       RET

sub_206F8D:
  206F8D  21 0e                    LD      A,0xE

loc_206F8F:
  206F8F  14                       PUSH    A
  206F90  29                       PUSH    BC
  206F91  2a                       PUSH    DE
  206F92  1e d4 ff                 CALR    sub_206F69
  206F95  4a                       POP     DE
  206F96  49                       POP     BC
  206F97  15                       POP     A
  206F98  d9 61                    INC     1,BC
  206F9A  c9 1c f2                 DJNZ    A,loc_206F8F
  206F9D  0e                       RET

sub_206F9E:
  206F9E  21 0d                    LD      A,0xD

loc_206FA0:
  206FA0  14                       PUSH    A
  206FA1  29                       PUSH    BC
  206FA2  2a                       PUSH    DE
  206FA3  1e c3 ff                 CALR    sub_206F69
  206FA6  4a                       POP     DE
  206FA7  49                       POP     BC
  206FA8  15                       POP     A
  206FA9  da 61                    INC     1,DE
  206FAB  c9 1c f2                 DJNZ    A,loc_206FA0
  206FAE  0e                       RET

sub_206FAF:
  206FAF  21 0d                    LD      A,0xD

loc_206FB1:
  206FB1  14                       PUSH    A
  206FB2  29                       PUSH    BC
  206FB3  2a                       PUSH    DE
  206FB4  1d 8d 6f 20              CALL    sub_206F8D
  206FB8  4a                       POP     DE
  206FB9  49                       POP     BC
  206FBA  15                       POP     A
  206FBB  da 61                    INC     1,DE
  206FBD  c9 1c f1                 DJNZ    A,loc_206FB1
  206FC0  0e                       RET

loc_206FC1:
  206FC1  d8 a8                    LD      WA,0
  206FC3  f1 cb 5b 50              LD      (0x5BCB),WA
  206FC7  f1 cd 5b 50              LD      (0x5BCD),WA
  206FCB  d1 c7 5b 21              LD      BC,(0x5BC7)
  206FCF  f1 4b 58 43              LD      (0x584B),C
  206FD3  d9 ed 04                 SRA     4,BC
  206FD6  d1 c9 5b 22              LD      DE,(0x5BC9)
  206FDA  f1 4d 58 45              LD      (0x584D),E
  206FDE  da ed 04                 SRA     4,DE
  206FE1  d9 6a                    DEC     2,BC
  206FE3  da 6a                    DEC     2,DE
  206FE5  1d af 6f 20              CALL    sub_206FAF
  206FE9  0e                       RET

sub_206FEA:
  206FEA  e8 a8                    LD      XWA,0
  206FEC  f1 dd 5b 41              LD      (0x5BDD),A
  206FF0  f1 de 5c 41              LD      (0x5CDE),A
  206FF4  f1 df 5c 41              LD      (0x5CDF),A
  206FF8  f1 e0 5c 41              LD      (0x5CE0),A
  206FFC  f1 e1 5c 41              LD      (0x5CE1),A
  207000  43 de 5b 00 00           LD      XHL,0x5BDE
  207005  23 40                    LD      C,0x40

loc_207007:
  207007  f5 ee 60                 LD      (XHL+),XWA
  20700A  cb 1c fa                 DJNZ    C,loc_207007
  20700D  c1 82 6f 19 dd 5c        LDB     (0x5CDD),(SYS_JOYPAD)
  207013  0e                       RET

sub_207014:
  207014  43 de 5b 00 00           LD      XHL,0x5BDE
  207019  c1 dd 5b 25              LD      E,(0x5BDD)
  20701D  24 00                    LD      D,0
  20701F  f3 07 ec e8 14 82 6f     LDB     (XHL+DE),(SYS_JOYPAD)
  207026  c1 82 6f 19 de 5c        LDB     (0x5CDE),(SYS_JOYPAD)
  20702C  cd 69                    DEC     1,E
  20702E  c3 07 ec e8 21           LD      A,(XHL+DE)
  207033  cd 61                    INC     1,E
  207035  c3 07 ec e8 d1           XOR     A,(XHL+DE)
  20703A  c9 88                    LD      W,A
  20703C  c3 07 ec e8 c1           AND     A,(XHL+DE)
  207041  f1 df 5c 41              LD      (0x5CDF),A
  207045  c3 07 ec e8 21           LD      A,(XHL+DE)
  20704A  c9 06                    CPL     A
  20704C  c9 c0                    AND     W,A
  20704E  f1 e0 5c 40              LD      (0x5CE0),W
  207052  20 3c                    LD      W,0x3C
  207054  c8 a5                    SUB     E,W
  207056  21 ff                    LD      A,0xFF

loc_207058:
  207058  c3 07 ec e8 c1           AND     A,(XHL+DE)
  20705D  cd 61                    INC     1,E
  20705F  c8 1c f6                 DJNZ    W,loc_207058
  207062  c9 cc 70                 AND     A,0x70
  207065  c9 cf 70                 CP      A,0x70
  207068  c9 76                    SCC     Z,A
  20706A  c1 e1 5c e9              OR      (0x5CE1),A
  20706E  c1 dd 5b 61              INCB    1,(0x5BDD)
  207072  0e                       RET

dyn_207073:
  207073  cf e7                    OR      L,L
  207075  66 16                    JR      Z,dyn_20708D
  207077  db 12                    EXTZ    HL
  207079  db 69                    DEC     1,HL
  20707B  d2 a7 8d 2c f3           CP      HL,(0x2C8DA7)
  207080  6f 0b                    JR      NC,dyn_20708D
  207082  db 08 10 00              MUL     XHL,0x10
  207086  eb c8 a9 8d 2c 00        ADD     XHL,0x2C8DA9
  20708C  0e                       RET

dyn_20708D:
  20708D  43 00 f0 21 00           LD      XHL,0x21F000
  207092  0e                       RET

dyn_207093:
  207093  1d 73 70 20              CALL    dyn_207073
  207097  ea a8                    LD      XDE,0
  207099  d8 8a                    LD      DE,WA
  20709B  ea ee 04                 SLL     4,XDE
  20709E  ea c8 00 a0 00 00        ADD     XDE,0xA000
  2070A4  22 08                    LD      B,8
  2070A6  d5 ed 20                 LD      WA,(XHL+)
  2070A9  23 08                    LD      C,8
  2070AB  e8 ee 01                 SLL     1,XWA
  2070AE  c7 e2 33 00              BIT     0,QA
  2070B2  13                       ZCF
  2070B3  d7 e2 ea 01              RL      1,QWA
  2070B7  d8 ee 01                 SLL     1,WA
  2070BA  cb 1c ee                 DJNZ    C,0x2070AB
  2070BD  d7 e2 88                 LD      WA,QWA
  2070C0  f5 e9 50                 LD      (XDE+),WA
  2070C3  ca 1c e0                 DJNZ    B,0x2070A6
  2070C6  0e                       RET

  ; ---- 0x15f bytes not traced ----

dyn_207226:
  207226  d5 ed 21                 LD      BC,(XHL+)
  207229  29                       PUSH    BC
  20722A  d9 ee 04                 SLL     4,BC
  20722D  1e 02 00                 CALR    dyn_207232
  207230  49                       POP     BC
  207231  0e                       RET

dyn_207232:
  207232  3c                       PUSH    XIX
  207233  3d                       PUSH    XIY
  207234  3e                       PUSH    XIZ
  207235  eb 8e                    LD      XIZ,XHL
  207237  eb a8                    LD      XHL,0
  207239  d8 8b                    LD      HL,WA
  20723B  db ee 04                 SLL     4,HL
  20723E  db c8 00 a0              ADD     HL,0xA000
  207242  42 00 40 00 00           LD      XDE,0x4000
  207247  e8 a8                    LD      XWA,0
  207249  f5 ea 60                 LD      (XDE+),XWA
  20724C  da cf ee 43              CP      DE,0x43EE
  207250  67 f7                    JR      C,0x207249
  207252  d9 8d                    LD      IY,BC
  207254  dc a8                    LD      IX,0
  207256  d7 f2 03 ee 03           LD      QIX,0x3EE
  20725B  dc ef 01                 SRL     1,IX
  20725E  c7 f1 33 00              BIT     0,IXH
  207262  6e 0a                    JR      NZ,0x20726E
  207264  c5 f8 21                 LD      A,(XIZ+)
  207267  c7 f0 99                 LD      IXL,A
  20726A  c7 f1 03 ff              LD      IXH,0xFF
  20726E  c7 f0 33 00              BIT     0,IXL
  207272  66 1f                    JR      Z,dyn_207293
  207274  c5 f8 21                 LD      A,(XIZ+)
  207277  42 00 40 00 00           LD      XDE,0x4000
  20727C  f3 07 e8 f2 41           LD      (XDE+QIX),A
  207281  f5 ec 41                 LD      (XHL+),A
  207284  d7 f2 38 ff 03           MINC1   0x400,QIX
  207289  dd 69                    DEC     1,IY
  20728B  dd e5                    OR      IY,IY
  20728D  6e cc                    JR      NZ,0x20725B
  20728F  5e                       POP     XIZ
  207290  5d                       POP     XIY
  207291  5c                       POP     XIX
  207292  0e                       RET

dyn_207293:
  207293  d5 f9 20                 LD      WA,(XIZ+)
  207296  d7 f6 98                 LD      QIY,WA
  207299  c7 f7 ef 04              SRL     4,QIYH
  20729D  c8 cc 0f                 AND     W,0xF
  2072A0  c8 63                    INC     3,W
  2072A2  c7 e3 98                 LD      QW,W
  2072A5  42 00 40 00 00           LD      XDE,0x4000
  2072AA  c3 07 e8 f6 21           LD      A,(XDE+QIY)
  2072AF  d7 f6 38 ff 03           MINC1   0x400,QIY
  2072B4  f3 07 e8 f2 41           LD      (XDE+QIX),A
  2072B9  f5 ec 41                 LD      (XHL+),A
  2072BC  d7 f2 38 ff 03           MINC1   0x400,QIX
  2072C1  dd 69                    DEC     1,IY
  2072C3  dd e5                    OR      IY,IY
  2072C5  66 c8                    JR      Z,0x20728F
  2072C7  c7 e3 1c da              DJNZ    QW,0x2072A5
  2072CB  68 8e                    JR      0x20725B

sub_2072CD:
  2072CD  d8 a9                    LD      WA,1
  2072CF  43 69 85 2c 00           LD      XHL,0x2C8569
  2072D4  1d 2b 69 20              CALL    sub_20692B
  2072D8  21 01                    LD      A,1
  2072DA  23 01                    LD      C,1
  2072DC  43 18 f0 21 00           LD      XHL,0x21F018
  2072E1  1d cd 6d 20              CALL    sub_206DCD
  2072E5  21 03                    LD      A,3
  2072E7  23 01                    LD      C,1
  2072E9  43 18 f0 21 00           LD      XHL,0x21F018
  2072EE  1d cd 6d 20              CALL    sub_206DCD
  2072F2  21 05                    LD      A,5
  2072F4  23 01                    LD      C,1
  2072F6  43 18 f0 21 00           LD      XHL,0x21F018
  2072FB  1d cd 6d 20              CALL    sub_206DCD
  2072FF  21 0f                    LD      A,0xF
  207301  23 01                    LD      C,1
  207303  43 10 f0 21 00           LD      XHL,0x21F010
  207308  1d 9e 6d 20              CALL    sub_206D9E
  20730C  21 1f                    LD      A,0x1F
  20730E  23 01                    LD      C,1
  207310  43 10 f0 21 00           LD      XHL,0x21F010
  207315  1d 9e 6d 20              CALL    sub_206D9E
  207319  21 2f                    LD      A,0x2F
  20731B  23 01                    LD      C,1
  20731D  43 10 f0 21 00           LD      XHL,0x21F010
  207322  1d 9e 6d 20              CALL    sub_206D9E
  207326  21 08                    LD      A,8
  207328  43 e3 5c 00 00           LD      XHL,0x5CE3
  20732D  ea a8                    LD      XDE,0

loc_20732F:
  20732F  bb 00 02 00 02           LDW     (XHL+0),0x200
  207334  bb 02 00 20              LDB     (XHL+2),0x20
  207338  bb 03 00 20              LDB     (XHL+3),0x20
  20733C  bb 04 45                 LD      (XHL+4),E
  20733F  bb 05 45                 LD      (XHL+5),E
  207342  bb 06 45                 LD      (XHL+6),E
  207345  bb 07 45                 LD      (XHL+7),E
  207348  bb 08 62                 LD      (XHL+8),XDE
  20734B  bb 0c 62                 LD      (XHL+0xC),XDE
  20734E  bb 10 14 80 52           LDB     (XHL+0x10),(0x5280)
  207353  bb 11 45                 LD      (XHL+0x11),E
  207356  bb 12 45                 LD      (XHL+0x12),E
  207359  db c8 13 00              ADD     HL,0x13
  20735D  c9 1c cf                 DJNZ    A,loc_20732F
  207360  0e                       RET

sub_207361:
  207361  21 00                    LD      A,0

loc_207363:
  207363  14                       PUSH    A
  207364  1d 8a 74 20              CALL    sub_20748A
  207368  a8 08 21                 LD      XBC,(XWA+8)
  20736B  e9 e1                    OR      XBC,XBC
  20736D  66 12                    JR      Z,loc_207381
  20736F  eb a8                    LD      XHL,0
  207371  88 12 27                 LD      L,(XWA+0x12)
  207374  cf ee 02                 SLL     2,L
  207377  eb c8 a7 73 20 00        ADD     XHL,0x2073A7
  20737D  a3 23                    LD      XHL,(XHL)
  20737F  b3 e8                    CALL    (XHL)

loc_207381:
  207381  15                       POP     A
  207382  c9 61                    INC     1,A
  207384  c9 cf 08                 CP      A,8
  207387  67 da                    JR      C,loc_207363
  207389  c1 06 50 21              LD      A,(0x5006)
  20738D  c9 ef 03                 SRL     3,A
  207390  c9 cc 01                 AND     A,1
  207393  43 b9 83 2c 00           LD      XHL,0x2C83B9
  207398  66 05                    JR      Z,loc_20739F
  20739A  43 cb 83 2c 00           LD      XHL,0x2C83CB

loc_20739F:
  20739F  30 0b 00                 LD      WA,0xB
  2073A2  1d 2b 69 20              CALL    sub_20692B
  2073A6  0e                       RET

  ; ---- 0xc bytes not traced ----

dyn_2073B3:
  2073B3  a8 08 21                 LD      XBC,(XWA+8)
  2073B6  e9 e1                    OR      XBC,XBC
  2073B8  b0 f6                    RET     Z
  2073BA  c5 e4 27                 LD      L,(XBC+)
  2073BD  b8 08 61                 LD      (XWA+8),XBC
  2073C0  cf cf f0                 CP      L,0xF0
  2073C3  6f 12                    JR      NC,dyn_2073D7
  2073C5  1d 99 76 20              CALL    dyn_207699
  2073C9  88 10 27                 LD      L,(XWA+0x10)
  2073CC  b8 11 47                 LD      (XWA+0x11),L
  2073CF  cf e7                    OR      L,L
  2073D1  66 e0                    JR      Z,dyn_2073B3
  2073D3  88 12 61                 INCB    1,(XWA+0x12)
  2073D6  0e                       RET

dyn_2073D7:
  2073D7  cf 06                    CPL     L
  2073D9  db 12                    EXTZ    HL
  2073DB  eb 12                    EXTZ    XHL
  2073DD  eb ee 02                 SLL     2,XHL
  2073E0  eb c8 f4 73 20 00        ADD     XHL,0x2073F4
  2073E6  a3 23                    LD      XHL,(XHL)
  2073E8  b3 e8                    CALL    (XHL)
  2073EA  88 12 27                 LD      L,(XWA+0x12)
  2073ED  cf cc 7f                 AND     L,0x7F
  2073F0  b0 fe                    RET     NZ
  2073F2  68 bf                    JR      dyn_2073B3

  ; ---- 0x18 bytes not traced ----

dyn_20740C:
  20740C  a8 0c 23                 LD      XHL,(XWA+0xC)
  20740F  b8 08 63                 LD      (XWA+8),XHL
  207412  eb a8                    LD      XHL,0
  207414  b8 0c 63                 LD      (XWA+0xC),XHL
  207417  0e                       RET

  ; ---- 0x1e bytes not traced ----

dyn_207436:
  207436  88 12 62                 INCB    2,(XWA+0x12)
  207439  0e                       RET

dyn_20743A:
  20743A  88 11 69                 DECB    1,(XWA+0x11)
  20743D  b0 fe                    RET     NZ
  20743F  88 12 69                 DECB    1,(XWA+0x12)
  207442  0e                       RET

dyn_207443:
  207443  88 02 23                 LD      C,(XWA+2)
  207446  88 04 83                 ADD     C,(XWA+4)
  207449  cb 6a                    DEC     2,C
  20744B  88 03 25                 LD      E,(XWA+3)
  20744E  88 05 85                 ADD     E,(XWA+5)
  207451  cd 69                    DEC     1,E
  207453  22 01                    LD      B,1
  207455  24 01                    LD      D,1
  207457  38                       PUSH    XWA
  207458  30 0b 3e                 LD      WA,0x3E0B
  20745B  1d 68 67 20              CALL    dyn_206768
  20745F  58                       POP     XWA
  207460  c1 df 5c 27              LD      L,(0x5CDF)
  207464  cf cc 30                 AND     L,0x30
  207467  b0 f6                    RET     Z
  207469  88 12 6a                 DECB    2,(XWA+0x12)
  20746C  88 02 23                 LD      C,(XWA+2)
  20746F  88 04 83                 ADD     C,(XWA+4)
  207472  cb 6a                    DEC     2,C
  207474  88 03 25                 LD      E,(XWA+3)
  207477  88 05 85                 ADD     E,(XWA+5)
  20747A  cd 69                    DEC     1,E
  20747C  22 01                    LD      B,1
  20747E  24 01                    LD      D,1
  207480  38                       PUSH    XWA
  207481  30 09 3e                 LD      WA,0x3E09
  207484  1d 68 67 20              CALL    dyn_206768
  207488  58                       POP     XWA
  207489  0e                       RET

sub_20748A:
  20748A  c9 08 13                 MUL     WA,0x13
  20748D  d8 c8 e3 5c              ADD     WA,0x5CE3
  207491  e8 12                    EXTZ    XWA
  207493  0e                       RET

dyn_207494:
  207494  1d 8a 74 20              CALL    sub_20748A
  207498  b8 00 53                 LD      (XWA+0),HL
  20749B  b8 04 43                 LD      (XWA+4),C
  20749E  b8 05 45                 LD      (XWA+5),E
  2074A1  b8 12 00 00              LDB     (XWA+0x12),0
  2074A5  1d d0 75 20              CALL    0x2075D0
  2074A9  0e                       RET

dyn_2074AA:
  2074AA  1d 8a 74 20              CALL    sub_20748A
  2074AE  b8 00 53                 LD      (XWA+0),HL
  2074B1  b8 04 43                 LD      (XWA+4),C
  2074B4  b8 05 45                 LD      (XWA+5),E
  2074B7  b8 12 00 80              LDB     (XWA+0x12),0x80
  2074BB  1d d0 75 20              CALL    0x2075D0
  2074BF  0e                       RET

dyn_2074C0:
  2074C0  1d 8a 74 20              CALL    sub_20748A
  2074C4  b8 12 cf                 BIT     7,(XWA+0x12)
  2074C7  7e 8f 00                 JRL     NZ,dyn_207559
  2074CA  b8 02 43                 LD      (XWA+2),C
  2074CD  b8 03 45                 LD      (XWA+3),E
  2074D0  eb a8                    LD      XHL,0
  2074D2  cd 8e                    LD      H,E
  2074D4  db ef 02                 SRL     2,HL
  2074D7  22 00                    LD      B,0
  2074D9  d9 ee 01                 SLL     1,BC
  2074DC  d9 83                    ADD     HL,BC
  2074DE  db c8 00 90              ADD     HL,0x9000
  2074E2  88 05 24                 LD      D,(XWA+5)
  2074E5  cc 69                    DEC     1,D
  2074E7  25 00                    LD      E,0
  2074E9  da ef 02                 SRL     2,DE
  2074EC  b3 02 01 3e              LDW     (XHL),0x3E01
  2074F0  f3 07 ec e8 02 03 3e     LDW     (XHL+DE),0x3E03
  2074F7  88 04 22                 LD      B,(XWA+4)
  2074FA  ca 6a                    DEC     2,B
  2074FC  23 02                    LD      C,2
  2074FE  da 62                    INC     2,DE
  207500  f3 03 ec e4 02 07 3e     LDW     (XHL+C),0x3E07
  207507  f3 07 ec e8 02 09 3e     LDW     (XHL+DE),0x3E09
  20750E  cb 62                    INC     2,C
  207510  da 62                    INC     2,DE
  207512  ca 1c eb                 DJNZ    B,0x207500
  207515  f3 03 ec e4 02 02 3e     LDW     (XHL+C),0x3E02
  20751C  f3 07 ec e8 02 06 3e     LDW     (XHL+DE),0x3E06
  207523  88 05 25                 LD      E,(XWA+5)
  207526  cd 6a                    DEC     2,E
  207528  c7 eb 9d                 LD      QD,E
  20752B  98 00 22                 LD      DE,(XWA+0)
  20752E  da ce 00 3e              OR      DE,0x3E00
  207532  db c8 40 00              ADD     HL,0x40
  207536  b3 02 08 3e              LDW     (XHL),0x3E08
  20753A  88 04 22                 LD      B,(XWA+4)
  20753D  ca 6a                    DEC     2,B
  20753F  23 02                    LD      C,2
  207541  f3 03 ec e4 52           LD      (XHL+C),DE
  207546  da 61                    INC     1,DE
  207548  cb 62                    INC     2,C
  20754A  ca 1c f4                 DJNZ    B,0x207541
  20754D  f3 03 ec e4 02 0a 3e     LDW     (XHL+C),0x3E0A
  207554  c7 eb 1c da              DJNZ    QD,0x207532
  207558  0e                       RET

dyn_207559:
  207559  b8 02 43                 LD      (XWA+2),C
  20755C  b8 03 45                 LD      (XWA+3),E
  20755F  eb a8                    LD      XHL,0
  207561  cd 8e                    LD      H,E
  207563  db ef 02                 SRL     2,HL
  207566  22 00                    LD      B,0
  207568  d9 ee 01                 SLL     1,BC
  20756B  d9 83                    ADD     HL,BC
  20756D  db c8 00 90              ADD     HL,0x9000
  207571  88 05 25                 LD      E,(XWA+5)
  207574  c7 eb 9d                 LD      QD,E
  207577  98 00 22                 LD      DE,(XWA+0)
  20757A  da ce 00 3e              OR      DE,0x3E00
  20757E  88 04 22                 LD      B,(XWA+4)
  207581  23 00                    LD      C,0
  207583  f3 03 ec e4 52           LD      (XHL+C),DE
  207588  da 61                    INC     1,DE
  20758A  cb 62                    INC     2,C
  20758C  ca 1c f4                 DJNZ    B,0x207583
  20758F  db c8 40 00              ADD     HL,0x40
  207593  c7 eb 1c e7              DJNZ    QD,0x20757E
  207597  0e                       RET

dyn_207598:
  207598  1d 8a 74 20              CALL    sub_20748A
  20759C  eb a8                    LD      XHL,0
  20759E  b8 08 63                 LD      (XWA+8),XHL
  2075A1  b8 0c 63                 LD      (XWA+0xC),XHL
  2075A4  88 02 23                 LD      C,(XWA+2)
  2075A7  88 03 25                 LD      E,(XWA+3)
  2075AA  88 04 22                 LD      B,(XWA+4)
  2075AD  88 05 24                 LD      D,(XWA+5)
  2075B0  38                       PUSH    XWA
  2075B1  d8 a8                    LD      WA,0
  2075B3  1d 68 67 20              CALL    dyn_206768
  2075B7  58                       POP     XWA
  2075B8  ea a8                    LD      XDE,0
  2075BA  b8 08 62                 LD      (XWA+8),XDE
  2075BD  b8 0c 62                 LD      (XWA+0xC),XDE
  2075C0  b8 10 14 80 52           LDB     (XWA+0x10),(0x5280)
  2075C5  b8 11 45                 LD      (XWA+0x11),E
  2075C8  b8 12 45                 LD      (XWA+0x12),E
  2075CB  0e                       RET

dyn_2075CC:
  2075CC  1d 8a 74 20              CALL    sub_20748A
  2075D0  b8 12 cf                 BIT     7,(XWA+0x12)
  2075D3  6e 21                    JR      NZ,dyn_2075F6
  2075D5  b8 06 00 00              LDB     (XWA+6),0
  2075D9  b8 07 00 00              LDB     (XWA+7),0
  2075DD  88 04 23                 LD      C,(XWA+4)
  2075E0  88 05 22                 LD      B,(XWA+5)
  2075E3  cb 6a                    DEC     2,C
  2075E5  ca 6a                    DEC     2,B
  2075E7  ca 43                    MUL     BC,B
  2075E9  38                       PUSH    XWA
  2075EA  98 00 20                 LD      WA,(XWA+0)
  2075ED  c7 e2 a9                 LD      QA,1
  2075F0  1d 93 69 20              CALL    dyn_206993
  2075F4  58                       POP     XWA
  2075F5  0e                       RET

dyn_2075F6:
  2075F6  b8 06 00 00              LDB     (XWA+6),0
  2075FA  b8 07 00 00              LDB     (XWA+7),0
  2075FE  88 04 23                 LD      C,(XWA+4)
  207601  88 05 43                 MUL     BC,(XWA+5)
  207604  38                       PUSH    XWA
  207605  98 00 20                 LD      WA,(XWA+0)
  207608  c7 e2 a9                 LD      QA,1
  20760B  1d 93 69 20              CALL    dyn_206993
  20760F  58                       POP     XWA
  207610  0e                       RET

dyn_207611:
  207611  1d 8a 74 20              CALL    sub_20748A
  207615  eb a8                    LD      XHL,0
  207617  b8 08 63                 LD      (XWA+8),XHL
  20761A  b8 0c 63                 LD      (XWA+0xC),XHL
  20761D  b8 12 47                 LD      (XWA+0x12),L
  207620  b8 10 14 80 52           LDB     (XWA+0x10),(0x5280)
  207625  b8 11 47                 LD      (XWA+0x11),L
  207628  0e                       RET

  ; ---- 0x4 bytes not traced ----

dyn_20762D:
  20762D  b8 12 cf                 BIT     7,(XWA+0x12)
  207630  6e 12                    JR      NZ,dyn_207644
  207632  88 06 61                 INCB    1,(XWA+6)
  207635  88 04 22                 LD      B,(XWA+4)
  207638  ca 6a                    DEC     2,B
  20763A  88 06 fa                 CP      (XWA+6),B
  20763D  b0 f7                    RET     C
  20763F  1d 57 76 20              CALL    dyn_207657
  207643  0e                       RET

dyn_207644:
  207644  88 06 61                 INCB    1,(XWA+6)
  207647  88 04 22                 LD      B,(XWA+4)
  20764A  88 06 fa                 CP      (XWA+6),B
  20764D  b0 f7                    RET     C
  20764F  1e 22 00                 CALR    dyn_207674
  207652  0e                       RET

  ; ---- 0x4 bytes not traced ----

dyn_207657:
  207657  b8 12 cf                 BIT     7,(XWA+0x12)
  20765A  6e 18                    JR      NZ,dyn_207674
  20765C  b8 06 00 00              LDB     (XWA+6),0
  207660  88 07 61                 INCB    1,(XWA+7)
  207663  88 05 22                 LD      B,(XWA+5)
  207666  ca 6a                    DEC     2,B
  207668  88 07 fa                 CP      (XWA+7),B
  20766B  b0 f7                    RET     C
  20766D  ca 69                    DEC     1,B
  20766F  b8 07 42                 LD      (XWA+7),B
  207672  10                       RCF
  207673  0e                       RET

dyn_207674:
  207674  b8 06 00 00              LDB     (XWA+6),0
  207678  88 07 61                 INCB    1,(XWA+7)
  20767B  88 05 22                 LD      B,(XWA+5)
  20767E  88 07 fa                 CP      (XWA+7),B
  207681  b0 f7                    RET     C
  207683  ca 69                    DEC     1,B
  207685  b8 07 42                 LD      (XWA+7),B
  207688  10                       RCF
  207689  0e                       RET

sub_20768A:
  20768A  1d 8a 74 20              CALL    sub_20748A
  20768E  b8 06 43                 LD      (XWA+6),C
  207691  b8 07 45                 LD      (XWA+7),E
  207694  0e                       RET

  ; ---- 0x4 bytes not traced ----

dyn_207699:
  207699  cf cf f0                 CP      L,0xF0
  20769C  6f 13                    JR      NC,dyn_2076B1
  20769E  1d 20 77 20              CALL    dyn_207720
  2076A2  1d 73 70 20              CALL    dyn_207073
  2076A6  31 08 00                 LD      BC,8
  2076A9  93 11                    LDIRW   (XDE+),(XHL+)
  2076AB  1d 2d 76 20              CALL    dyn_20762D
  2076AF  10                       RCF
  2076B0  0e                       RET

dyn_2076B1:
  2076B1  cf 06                    CPL     L
  2076B3  db 12                    EXTZ    HL
  2076B5  eb 12                    EXTZ    XHL
  2076B7  eb ee 02                 SLL     2,XHL
  2076BA  eb c8 c6 76 20 00        ADD     XHL,0x2076C6
  2076C0  a3 23                    LD      XHL,(XHL)
  2076C2  b3 e8                    CALL    (XHL)
  2076C4  11                       SCF
  2076C5  0e                       RET

  ; ---- 0x2d bytes not traced ----

dyn_2076F3:
  2076F3  1d 8a 74 20              CALL    sub_20748A
  2076F7  eb 89                    LD      XBC,XHL
  2076F9  eb a8                    LD      XHL,0
  2076FB  c5 e4 27                 LD      L,(XBC+)
  2076FE  cf cf ff                 CP      L,0xFF
  207701  b0 f6                    RET     Z
  207703  39                       PUSH    XBC
  207704  1d 99 76 20              CALL    dyn_207699
  207708  59                       POP     XBC
  207709  68 ee                    JR      0x2076F9

  ; ---- 0x15 bytes not traced ----

dyn_207720:
  207720  b8 12 cf                 BIT     7,(XWA+0x12)
  207723  6e 1b                    JR      NZ,dyn_207740
  207725  ea a8                    LD      XDE,0
  207727  88 04 25                 LD      E,(XWA+4)
  20772A  cd 6a                    DEC     2,E
  20772C  88 07 45                 MUL     DE,(XWA+7)
  20772F  88 06 85                 ADD     E,(XWA+6)
  207732  cc c9 00                 ADC     D,0
  207735  98 00 82                 ADD     DE,(XWA+0)
  207738  da ee 04                 SLL     4,DE
  20773B  da c8 00 a0              ADD     DE,0xA000
  20773F  0e                       RET

dyn_207740:
  207740  ea a8                    LD      XDE,0
  207742  88 04 25                 LD      E,(XWA+4)
  207745  88 07 45                 MUL     DE,(XWA+7)
  207748  88 06 85                 ADD     E,(XWA+6)
  20774B  cc c9 00                 ADC     D,0
  20774E  98 00 82                 ADD     DE,(XWA+0)
  207751  da ee 04                 SLL     4,DE
  207754  da c8 00 a0              ADD     DE,0xA000
  207758  0e                       RET

dyn_207759:
  207759  28                       PUSH    WA
  20775A  1d 40 00 20              CALL    sub_200040
  20775E  1d 55 00 20              CALL    sub_200055
  207762  48                       POP     WA
  207763  e8 12                    EXTZ    XWA
  207765  1d 22 01 20              CALL    sub_200122
  207769  0e                       RET

dyn_20776A:
  20776A  1d 6f 00 20              CALL    dyn_20006F
  20776E  0e                       RET

  ; ---- 0x4f bytes not traced ----

dyn_2077BE:
  2077BE  d2 20 00 20 3f fe ff     CPW     (0x200020),0xFFFE
  2077C5  43 00 00 20 00           LD      XHL,0x200000
  2077CA  b0 fe                    RET     NZ
  2077CC  c7 ee 03 80              LD      QL,0x80
  2077D0  0e                       RET

  ; ---- 0x341 bytes not traced ----

dyn_207B12:
  207B12  c1 22 50 22              LD      B,(0x5022)
  207B16  ca cf 32                 CP      B,0x32
  207B19  67 08                    JR      C,dyn_207B23
  207B1B  f1 23 50 02 00 00        LDW     (0x5023),0
  207B21  10                       RCF
  207B22  0e                       RET

dyn_207B23:
  207B23  d1 23 50 3f 00 00        CPW     (0x5023),0
  207B29  62 02                    JR      LE,dyn_207B2D
  207B2B  10                       RCF
  207B2C  0e                       RET

dyn_207B2D:
  207B2D  eb a8                    LD      XHL,0
  207B2F  c1 21 50 27              LD      L,(0x5021)
  207B33  cf 69                    DEC     1,L
  207B35  eb ef 01                 SRL     1,XHL
  207B38  eb ee 02                 SLL     2,XHL
  207B3B  eb c8 f5 4f 22 00        ADD     XHL,0x224FF5
  207B41  a3 23                    LD      XHL,(XHL)
  207B43  c1 22 50 21              LD      A,(0x5022)
  207B47  20 00                    LD      W,0
  207B49  d8 ee 01                 SLL     1,WA
  207B4C  d3 07 ec e0 20           LD      WA,(XHL+WA)
  207B51  d1 23 50 88              ADD     (0x5023),WA
  207B55  f1 21 50 c8              BIT     0,(0x5021)
  207B59  43 fd 51 22 00           LD      XHL,0x2251FD
  207B5E  6e 05                    JR      NZ,0x207B65
  207B60  43 c9 52 22 00           LD      XHL,0x2252C9
  207B65  c1 22 50 21              LD      A,(0x5022)
  207B69  20 00                    LD      W,0
  207B6B  d8 ee 02                 SLL     2,WA
  207B6E  f3 07 ec e0 33           LDA     XHL,XHL+WA
  207B73  20 00                    LD      W,0
  207B75  c5 ec 21                 LD      A,(XHL+)
  207B78  d1 27 50 88              ADD     (0x5027),WA
  207B7C  c5 ec 21                 LD      A,(XHL+)
  207B7F  d1 29 50 88              ADD     (0x5029),WA
  207B83  c5 ec 21                 LD      A,(XHL+)
  207B86  d1 2b 50 88              ADD     (0x502B),WA
  207B8A  c5 ec 21                 LD      A,(XHL+)
  207B8D  d1 2d 50 88              ADD     (0x502D),WA
  207B91  c1 21 50 21              LD      A,(0x5021)
  207B95  c9 69                    DEC     1,A
  207B97  20 00                    LD      W,0
  207B99  d8 ee 02                 SLL     2,WA
  207B9C  43 95 53 22 00           LD      XHL,0x225395
  207BA1  f3 07 ec e0 33           LDA     XHL,XHL+WA
  207BA6  c5 ec 21                 LD      A,(XHL+)
  207BA9  c9 e1                    OR      A,A
  207BAB  66 0e                    JR      Z,0x207BBB
  207BAD  c9 61                    INC     1,A
  207BAF  20 00                    LD      W,0
  207BB1  1d 4d 81 20              CALL    dyn_20814D
  207BB5  d8 69                    DEC     1,WA
  207BB7  d1 27 50 88              ADD     (0x5027),WA
  207BBB  c5 ec 21                 LD      A,(XHL+)
  207BBE  c9 e1                    OR      A,A
  207BC0  66 0e                    JR      Z,0x207BD0
  207BC2  c9 61                    INC     1,A
  207BC4  20 00                    LD      W,0
  207BC6  1d 4d 81 20              CALL    dyn_20814D
  207BCA  d8 69                    DEC     1,WA
  207BCC  d1 29 50 88              ADD     (0x5029),WA
  207BD0  c5 ec 21                 LD      A,(XHL+)
  207BD3  c9 e1                    OR      A,A
  207BD5  66 0e                    JR      Z,0x207BE5
  207BD7  c9 61                    INC     1,A
  207BD9  20 00                    LD      W,0
  207BDB  1d 4d 81 20              CALL    dyn_20814D
  207BDF  d8 69                    DEC     1,WA
  207BE1  d1 2b 50 88              ADD     (0x502B),WA
  207BE5  c5 ec 21                 LD      A,(XHL+)
  207BE8  c9 e1                    OR      A,A
  207BEA  66 0e                    JR      Z,0x207BFA
  207BEC  c9 61                    INC     1,A
  207BEE  20 00                    LD      W,0
  207BF0  1d 4d 81 20              CALL    dyn_20814D
  207BF4  d8 69                    DEC     1,WA
  207BF6  d1 2d 50 88              ADD     (0x502D),WA
  207BFA  c1 22 50 61              INCB    1,(0x5022)
  207BFE  11                       SCF
  207BFF  0e                       RET

  ; ---- 0x54d bytes not traced ----

dyn_20814D:
  20814D  29                       PUSH    BC
  20814E  28                       PUSH    WA
  20814F  1d cb 60 20              CALL    dyn_2060CB
  208153  e8 12                    EXTZ    XWA
  208155  49                       POP     BC
  208156  d9 50                    DIV     XWA,BC
  208158  49                       POP     BC
  208159  d7 e2 88                 LD      WA,QWA
  20815C  d8 61                    INC     1,WA
  20815E  0e                       RET

  ; ---- 0x113 bytes not traced ----

sub_208272:
  208272  26 00                    LD      H,0
  208274  db 69                    DEC     1,HL
  208276  db 08 07 00              MUL     XHL,7
  20827A  eb c8 15 0e 27 00        ADD     XHL,0x270E15
  208280  0e                       RET

  ; ---- 0x79 bytes not traced ----

sub_2082FA:
  2082FA  26 00                    LD      H,0
  2082FC  db 69                    DEC     1,HL
  2082FE  db 08 07 00              MUL     XHL,7
  208302  eb c8 8c 18 27 00        ADD     XHL,0x27188C
  208308  0e                       RET

  ; ---- 0x59 bytes not traced ----

dyn_208362:
  208362  db 69                    DEC     1,HL
  208364  db 08 18 00              MUL     XHL,0x18
  208368  eb c8 78 31 27 00        ADD     XHL,0x273178
  20836E  0e                       RET

dyn_20836F:
  20836F  26 00                    LD      H,0
  208371  db 69                    DEC     1,HL
  208373  d2 82 18 27 83           ADD     HL,(0x271882)
  208378  1b 62 83 20              JP      dyn_208362

dyn_20837C:
  20837C  26 00                    LD      H,0
  20837E  db 69                    DEC     1,HL
  208380  d2 84 18 27 83           ADD     HL,(0x271884)
  208385  1b 62 83 20              JP      dyn_208362

dyn_208389:
  208389  26 00                    LD      H,0
  20838B  db 69                    DEC     1,HL
  20838D  d2 86 18 27 83           ADD     HL,(0x271886)
  208392  1b 62 83 20              JP      dyn_208362

dyn_208396:
  208396  26 00                    LD      H,0
  208398  db 69                    DEC     1,HL
  20839A  d2 88 18 27 83           ADD     HL,(0x271888)
  20839F  1b 62 83 20              JP      dyn_208362

dyn_2083A3:
  2083A3  26 00                    LD      H,0
  2083A5  db 69                    DEC     1,HL
  2083A7  d2 8a 18 27 83           ADD     HL,(0x27188A)
  2083AC  1b 62 83 20              JP      dyn_208362

  ; ---- 0x2db bytes not traced ----

dyn_20868B:
  20868B  d1 27 50 19 4e 50        LDW     (0x504E),(0x5027)
  208691  d1 29 50 19 50 50        LDW     (0x5050),(0x5029)
  208697  d1 2b 50 19 52 50        LDW     (0x5052),(0x502B)
  20869D  d1 2d 50 19 54 50        LDW     (0x5054),(0x502D)
  2086A3  c1 47 50 27              LD      L,(0x5047)
  2086A7  cf e7                    OR      L,L
  2086A9  66 43                    JR      Z,0x2086EE
  2086AB  1d 6f 83 20              CALL    dyn_20836F
  2086AF  9b 00 19 5c 50           LDW     (0x505C),(XHL+0)
  2086B4  9b 02 19 5e 50           LDW     (0x505E),(XHL+2)
  2086B9  9b 0e 19 5a 50           LDW     (0x505A),(XHL+0xE)
  2086BE  9b 04 20                 LD      WA,(XHL+4)
  2086C1  d1 4e 50 88              ADD     (0x504E),WA
  2086C5  9b 06 20                 LD      WA,(XHL+6)
  2086C8  d1 50 50 88              ADD     (0x5050),WA
  2086CC  9b 08 20                 LD      WA,(XHL+8)
  2086CF  d1 52 50 88              ADD     (0x5052),WA
  2086D3  9b 0a 20                 LD      WA,(XHL+0xA)
  2086D6  d1 54 50 88              ADD     (0x5054),WA
  2086DA  c1 47 50 21              LD      A,(0x5047)
  2086DE  20 00                    LD      W,0
  2086E0  d8 69                    DEC     1,WA
  2086E2  d2 82 18 27 80           ADD     WA,(0x271882)
  2086E7  1d d4 61 20              CALL    dyn_2061D4
  2086EB  83 3e 80                 ORB     (XHL),0x80
  2086EE  c1 46 50 27              LD      L,(0x5046)
  2086F2  cf e7                    OR      L,L
  2086F4  66 42                    JR      Z,0x208738
  2086F6  1d 7c 83 20              CALL    dyn_20837C
  2086FA  9b 00 20                 LD      WA,(XHL+0)
  2086FD  d1 5c 50 88              ADD     (0x505C),WA
  208701  9b 02 20                 LD      WA,(XHL+2)
  208704  d1 5e 50 88              ADD     (0x505E),WA
  208708  9b 04 20                 LD      WA,(XHL+4)
  20870B  d1 4e 50 88              ADD     (0x504E),WA
  20870F  9b 06 20                 LD      WA,(XHL+6)
  208712  d1 50 50 88              ADD     (0x5050),WA
  208716  9b 08 20                 LD      WA,(XHL+8)
  208719  d1 52 50 88              ADD     (0x5052),WA
  20871D  9b 0a 20                 LD      WA,(XHL+0xA)
  208720  d1 54 50 88              ADD     (0x5054),WA
  208724  c1 46 50 21              LD      A,(0x5046)
  208728  20 00                    LD      W,0
  20872A  d8 69                    DEC     1,WA
  20872C  d2 84 18 27 80           ADD     WA,(0x271884)
  208731  1d d4 61 20              CALL    dyn_2061D4
  208735  83 3e 80                 ORB     (XHL),0x80
  208738  c1 48 50 27              LD      L,(0x5048)
  20873C  cf e7                    OR      L,L
  20873E  66 42                    JR      Z,0x208782
  208740  1d a3 83 20              CALL    dyn_2083A3
  208744  9b 00 20                 LD      WA,(XHL+0)
  208747  d1 5c 50 88              ADD     (0x505C),WA
  20874B  9b 02 20                 LD      WA,(XHL+2)
  20874E  d1 5e 50 88              ADD     (0x505E),WA
  208752  9b 04 20                 LD      WA,(XHL+4)
  208755  d1 4e 50 88              ADD     (0x504E),WA
  208759  9b 06 20                 LD      WA,(XHL+6)
  20875C  d1 50 50 88              ADD     (0x5050),WA
  208760  9b 08 20                 LD      WA,(XHL+8)
  208763  d1 52 50 88              ADD     (0x5052),WA
  208767  9b 0a 20                 LD      WA,(XHL+0xA)
  20876A  d1 54 50 88              ADD     (0x5054),WA
  20876E  c1 48 50 21              LD      A,(0x5048)
  208772  20 00                    LD      W,0
  208774  d8 69                    DEC     1,WA
  208776  d2 8a 18 27 80           ADD     WA,(0x27188A)
  20877B  1d d4 61 20              CALL    dyn_2061D4
  20877F  83 3e 80                 ORB     (XHL),0x80
  208782  c1 49 50 27              LD      L,(0x5049)
  208786  cf e7                    OR      L,L
  208788  66 42                    JR      Z,0x2087CC
  20878A  1d a3 83 20              CALL    dyn_2083A3
  20878E  9b 00 20                 LD      WA,(XHL+0)
  208791  d1 5c 50 88              ADD     (0x505C),WA
  208795  9b 02 20                 LD      WA,(XHL+2)
  208798  d1 5e 50 88              ADD     (0x505E),WA
  20879C  9b 04 20                 LD      WA,(XHL+4)
  20879F  d1 4e 50 88              ADD     (0x504E),WA
  2087A3  9b 06 20                 LD      WA,(XHL+6)
  2087A6  d1 50 50 88              ADD     (0x5050),WA
  2087AA  9b 08 20                 LD      WA,(XHL+8)
  2087AD  d1 52 50 88              ADD     (0x5052),WA
  2087B1  9b 0a 20                 LD      WA,(XHL+0xA)
  2087B4  d1 54 50 88              ADD     (0x5054),WA
  2087B8  c1 49 50 21              LD      A,(0x5049)
  2087BC  20 00                    LD      W,0
  2087BE  d8 69                    DEC     1,WA
  2087C0  d2 8a 18 27 80           ADD     WA,(0x27188A)
  2087C5  1d d4 61 20              CALL    dyn_2061D4
  2087C9  83 3e 80                 ORB     (XHL),0x80
  2087CC  c1 4a 50 27              LD      L,(0x504A)
  2087D0  cf e7                    OR      L,L
  2087D2  66 42                    JR      Z,0x208816
  2087D4  1d 89 83 20              CALL    dyn_208389
  2087D8  9b 00 20                 LD      WA,(XHL+0)
  2087DB  d1 5c 50 88              ADD     (0x505C),WA
  2087DF  9b 02 20                 LD      WA,(XHL+2)
  2087E2  d1 5e 50 88              ADD     (0x505E),WA
  2087E6  9b 04 20                 LD      WA,(XHL+4)
  2087E9  d1 4e 50 88              ADD     (0x504E),WA
  2087ED  9b 06 20                 LD      WA,(XHL+6)
  2087F0  d1 50 50 88              ADD     (0x5050),WA
  2087F4  9b 08 20                 LD      WA,(XHL+8)
  2087F7  d1 52 50 88              ADD     (0x5052),WA
  2087FB  9b 0a 20                 LD      WA,(XHL+0xA)
  2087FE  d1 54 50 88              ADD     (0x5054),WA
  208802  c1 4a 50 21              LD      A,(0x504A)
  208806  20 00                    LD      W,0
  208808  d8 69                    DEC     1,WA
  20880A  d2 86 18 27 80           ADD     WA,(0x271886)
  20880F  1d d4 61 20              CALL    dyn_2061D4
  208813  83 3e 80                 ORB     (XHL),0x80
  208816  c1 4b 50 27              LD      L,(0x504B)
  20881A  cf e7                    OR      L,L
  20881C  66 42                    JR      Z,0x208860
  20881E  1d 96 83 20              CALL    dyn_208396
  208822  9b 00 20                 LD      WA,(XHL+0)
  208825  d1 5c 50 88              ADD     (0x505C),WA
  208829  9b 02 20                 LD      WA,(XHL+2)
  20882C  d1 5e 50 88              ADD     (0x505E),WA
  208830  9b 04 20                 LD      WA,(XHL+4)
  208833  d1 4e 50 88              ADD     (0x504E),WA
  208837  9b 06 20                 LD      WA,(XHL+6)
  20883A  d1 50 50 88              ADD     (0x5050),WA
  20883E  9b 08 20                 LD      WA,(XHL+8)
  208841  d1 52 50 88              ADD     (0x5052),WA
  208845  9b 0a 20                 LD      WA,(XHL+0xA)
  208848  d1 54 50 88              ADD     (0x5054),WA
  20884C  c1 4b 50 21              LD      A,(0x504B)
  208850  20 00                    LD      W,0
  208852  d8 69                    DEC     1,WA
  208854  d2 88 18 27 80           ADD     WA,(0x271888)
  208859  1d d4 61 20              CALL    dyn_2061D4
  20885D  83 3e 80                 ORB     (XHL),0x80
  208860  d8 a8                    LD      WA,0
  208862  c1 4c 50 27              LD      L,(0x504C)
  208866  1e 10 00                 CALR    dyn_208879
  208869  c1 4d 50 27              LD      L,(0x504D)
  20886D  1e 09 00                 CALR    dyn_208879
  208870  d8 e0                    OR      WA,WA
  208872  b0 f4                    RET     OV
  208874  f1 5a 50 50              LD      (0x505A),WA
  208878  0e                       RET

dyn_208879:
  208879  cf e7                    OR      L,L
  20887B  b0 f6                    RET     Z
  20887D  db 12                    EXTZ    HL
  20887F  db ee 02                 SLL     2,HL
  208882  eb 12                    EXTZ    XHL
  208884  eb c8 8e 88 20 00        ADD     XHL,0x20888E
  20888A  a3 23                    LD      XHL,(XHL)
  20888C  b3 d8                    JP      (XHL)

  ; ---- 0x256 bytes not traced ----

sub_208AE4:
  208AE4  e8 12                    EXTZ    XWA
  208AE6  1d ec 61 20              CALL    sub_2061EC
  208AEA  e1 41 50 21              LD      XBC,(0x5041)
  208AEE  1d 0e 62 20              CALL    sub_20620E
  208AF2  f1 41 50 60              LD      (0x5041),XWA
  208AF6  41 99 99 99 00           LD      XBC,0x999999
  208AFB  1d 2f 62 20              CALL    sub_20622F
  208AFF  12                       CCF
  208B00  b0 ff                    RET     NC
  208B02  40 99 99 99 00           LD      XWA,0x999999
  208B07  f1 41 50 60              LD      (0x5041),XWA
  208B0B  0e                       RET

  ; ---- 0x4428 bytes not traced ----

dyn_20CF34:
  20CF34  1d cd 72 20              CALL    sub_2072CD
  20CF38  1d e1 67 20              CALL    sub_2067E1
  20CF3C  f1 f2 5d 00 00           LDB     (0x5DF2),0
  20CF41  30 b5 00                 LD      WA,0xB5
  20CF44  33 2a 00                 LD      HL,0x2A
  20CF47  31 0a 00                 LD      BC,0xA
  20CF4A  da a8                    LD      DE,0
  20CF4C  1d ba 03 21              CALL    dyn_2103BA
  20CF50  30 61 01                 LD      WA,0x161
  20CF53  33 2b 00                 LD      HL,0x2B
  20CF56  d9 a8                    LD      BC,0
  20CF58  da a8                    LD      DE,0
  20CF5A  1d ba 03 21              CALL    dyn_2103BA
  20CF5E  30 14 00                 LD      WA,0x14
  20CF61  1d 59 77 20              CALL    dyn_207759
  20CF65  30 35 00                 LD      WA,0x35
  20CF68  1d 6a 77 20              CALL    dyn_20776A
  20CF6C  f1 30 80 00 00           LDB     (GE_PLANE_PRIO),0
  20CF71  be 08 02 7c cf           LDW     (XIZ+8),0xCF7C
  20CF76  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20CF7B  0e                       RET

dyn_20CF7C:
  20CF7C  1d 25 68 20              CALL    dyn_206825
  20CF80  1d 47 68 20              CALL    sub_206847
  20CF84  21 00                    LD      A,0
  20CF86  23 0c                    LD      C,0xC
  20CF88  25 03                    LD      E,3
  20CF8A  33 0c 00                 LD      HL,0xC
  20CF8D  1d 94 74 20              CALL    dyn_207494
  20CF91  21 00                    LD      A,0
  20CF93  1d 8a 74 20              CALL    sub_20748A
  20CF97  43 c2 d0 20 00           LD      XHL,0x20D0C2
  20CF9C  1d f7 76 20              CALL    0x2076F7
  20CFA0  23 04                    LD      C,4
  20CFA2  25 22                    LD      E,0x22
  20CFA4  1d c4 74 20              CALL    0x2074C4
  20CFA8  21 01                    LD      A,1
  20CFAA  23 0c                    LD      C,0xC
  20CFAC  25 07                    LD      E,7
  20CFAE  33 16 00                 LD      HL,0x16
  20CFB1  1d 94 74 20              CALL    dyn_207494
  20CFB5  21 01                    LD      A,1
  20CFB7  1d 8a 74 20              CALL    sub_20748A
  20CFBB  43 cd d0 20 00           LD      XHL,0x20D0CD
  20CFC0  1d f7 76 20              CALL    0x2076F7
  20CFC4  23 04                    LD      C,4
  20CFC6  25 26                    LD      E,0x26
  20CFC8  1d c4 74 20              CALL    0x2074C4
  20CFCC  43 df d6 20 00           LD      XHL,0x20D6DF
  20CFD1  1d 24 63 20              CALL    dyn_206324
  20CFD5  40 d5 cf 20 00           LD      XWA,0x20CFD5
  20CFDA  be 08 60                 LD      (XIZ+8),XWA
  20CFDD  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20CFE1  b0 fe                    RET     NZ
  20CFE3  be 08 02 ed cf           LDW     (XIZ+8),0xCFED
  20CFE8  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20CFED  c1 f2 5d 25              LD      E,(0x5DF2)
  20CFF1  24 00                    LD      D,0
  20CFF3  da ee 04                 SLL     4,DE
  20CFF6  da c8 34 00              ADD     DE,0x34
  20CFFA  31 28 00                 LD      BC,0x28
  20CFFD  30 04 3e                 LD      WA,0x3E04
  20D000  c7 e7 a9                 LD      QB,1
  20D003  c7 eb aa                 LD      QD,2
  20D006  1d ff 6b 20              CALL    dyn_206BFF
  20D00A  c1 df 5c 21              LD      A,(0x5CDF)
  20D00E  c9 33 00                 BIT     0,A
  20D011  6e 10                    JR      NZ,loc_20D023
  20D013  c9 33 01                 BIT     1,A
  20D016  6e 1e                    JR      NZ,loc_20D036
  20D018  c9 33 04                 BIT     4,A
  20D01B  6e 31                    JR      NZ,dyn_20D04E
  20D01D  c9 33 05                 BIT     5,A
  20D020  6e 6f                    JR      NZ,loc_20D091
  20D022  0e                       RET

loc_20D023:
  20D023  30 80 00                 LD      WA,0x80
  20D026  1d 6a 77 20              CALL    dyn_20776A
  20D02A  c1 f2 5d 69              DECB    1,(0x5DF2)
  20D02E  b0 fd                    RET     PL
  20D030  f1 f2 5d 00 02           LDB     (0x5DF2),2
  20D035  0e                       RET

loc_20D036:
  20D036  30 80 00                 LD      WA,0x80
  20D039  1d 6a 77 20              CALL    dyn_20776A
  20D03D  c1 f2 5d 61              INCB    1,(0x5DF2)
  20D041  c1 f2 5d 3f 03           CPB     (0x5DF2),3
  20D046  b0 f7                    RET     C
  20D048  f1 f2 5d 00 00           LDB     (0x5DF2),0
  20D04D  0e                       RET

dyn_20D04E:
  20D04E  30 81 00                 LD      WA,0x81
  20D051  1d 6a 77 20              CALL    dyn_20776A
  20D055  43 1e d7 20 00           LD      XHL,0x20D71E
  20D05A  1d 24 63 20              CALL    dyn_206324
  20D05E  40 5e d0 20 00           LD      XWA,0x20D05E
  20D063  be 08 60                 LD      (XIZ+8),XWA
  20D066  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D06A  b0 fe                    RET     NZ
  20D06C  1d 25 68 20              CALL    dyn_206825
  20D070  eb a8                    LD      XHL,0
  20D072  c1 f2 5d 27              LD      L,(0x5DF2)
  20D076  db ee 02                 SLL     2,HL
  20D079  eb c8 85 d0 20 00        ADD     XHL,0x20D085
  20D07F  a3 23                    LD      XHL,(XHL)
  20D081  be 08 63                 LD      (XIZ+8),XHL
  20D084  0e                       RET

  ; ---- 0xc bytes not traced ----

loc_20D091:
  20D091  30 82 00                 LD      WA,0x82
  20D094  1d 6a 77 20              CALL    dyn_20776A
  20D098  43 1e d7 20 00           LD      XHL,0x20D71E
  20D09D  1d 24 63 20              CALL    dyn_206324
  20D0A1  40 a1 d0 20 00           LD      XWA,0x20D0A1
  20D0A6  be 08 60                 LD      (XIZ+8),XWA
  20D0A9  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D0AD  b0 fe                    RET     NZ
  20D0AF  1d 25 68 20              CALL    dyn_206825
  20D0B3  f1 f2 5d 00 00           LDB     (0x5DF2),0
  20D0B8  f1 30 80 00 80           LDB     (GE_PLANE_PRIO),0x80
  20D0BD  1d 69 63 20              CALL    dyn_206369
  20D0C1  0e                       RET

  ; ---- 0x26 bytes not traced ----

dyn_20D0E8:
  20D0E8  c1 f2 5d 61              INCB    1,(0x5DF2)
  20D0EC  f1 30 80 00 80           LDB     (GE_PLANE_PRIO),0x80
  20D0F1  1d 69 63 20              CALL    dyn_206369
  20D0F5  0e                       RET

  ; ---- 0x5e9 bytes not traced ----

dyn_20D6DF:
  20D6DF  1e b7 00                 CALR    dyn_20D799
  20D6E2  f1 30 80 00 00           LDB     (GE_PLANE_PRIO),0
  20D6E7  43 5d d7 20 00           LD      XHL,0x20D75D
  20D6EC  1d 24 63 20              CALL    dyn_206324
  20D6F0  40 f0 d6 20 00           LD      XWA,0x20D6F0
  20D6F5  be 08 60                 LD      (XIZ+8),XWA
  20D6F8  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D6FC  b0 fe                    RET     NZ
  20D6FE  f1 30 80 00 80           LDB     (GE_PLANE_PRIO),0x80
  20D703  43 7b d7 20 00           LD      XHL,0x20D77B
  20D708  1d 24 63 20              CALL    dyn_206324
  20D70C  40 0c d7 20 00           LD      XWA,0x20D70C
  20D711  be 08 60                 LD      (XIZ+8),XWA
  20D714  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D718  b0 fe                    RET     NZ
  20D71A  1b 69 63 20              JP      dyn_206369

dyn_20D71E:
  20D71E  1e 78 00                 CALR    dyn_20D799
  20D721  f1 30 80 00 80           LDB     (GE_PLANE_PRIO),0x80
  20D726  43 5d d7 20 00           LD      XHL,0x20D75D
  20D72B  1d 24 63 20              CALL    dyn_206324
  20D72F  40 2f d7 20 00           LD      XWA,0x20D72F
  20D734  be 08 60                 LD      (XIZ+8),XWA
  20D737  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D73B  b0 fe                    RET     NZ
  20D73D  f1 30 80 00 00           LDB     (GE_PLANE_PRIO),0
  20D742  43 7b d7 20 00           LD      XHL,0x20D77B
  20D747  1d 24 63 20              CALL    dyn_206324
  20D74B  40 4b d7 20 00           LD      XWA,0x20D74B
  20D750  be 08 60                 LD      (XIZ+8),XWA
  20D753  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20D757  b0 fe                    RET     NZ
  20D759  1b 69 63 20              JP      dyn_206369

dyn_20D75D:
  20D75D  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20D762  be 08 02 6c d7           LDW     (XIZ+8),0xD76C
  20D767  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20D76C  9e 0e 61                 INCW    1,(XIZ+0xE)
  20D76F  9e 0e 3f 0b 00           CPW     (XIZ+0xE),0xB
  20D774  f2 69 63 20 df           JP      NC,dyn_206369
  20D779  68 40                    JR      dyn_20D7BB

dyn_20D77B:
  20D77B  be 0e 02 0b 00           LDW     (XIZ+0xE),0xB
  20D780  be 08 02 8a d7           LDW     (XIZ+8),0xD78A
  20D785  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20D78A  9e 0e 69                 DECW    1,(XIZ+0xE)
  20D78D  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20D792  f2 69 63 20 d5           JP      MI,dyn_206369
  20D797  68 22                    JR      dyn_20D7BB

dyn_20D799:
  20D799  c1 c6 5b 3f 00           CPB     (0x5BC6),0
  20D79E  42 c4 76 28 00           LD      XDE,0x2876C4
  20D7A3  43 d4 7e 28 00           LD      XHL,0x287ED4
  20D7A8  66 0a                    JR      Z,0x20D7B4
  20D7AA  42 8f c8 29 00           LD      XDE,0x29C88F
  20D7AF  43 9a d3 29 00           LD      XHL,0x29D39A
  20D7B4  be 12 62                 LD      (XIZ+0x12),XDE
  20D7B7  be 16 63                 LD      (XIZ+0x16),XHL
  20D7BA  0e                       RET

dyn_20D7BB:
  20D7BB  30 61 01                 LD      WA,0x161
  20D7BE  ad 12 23                 LD      XHL,(XIY+0x12)
  20D7C1  9e 0e 21                 LD      BC,(XIZ+0xE)
  20D7C4  d9 07                    NEG     BC
  20D7C6  da a8                    LD      DE,0
  20D7C8  1d 37 6b 20              CALL    dyn_206B37
  20D7CC  30 b5 00                 LD      WA,0xB5
  20D7CF  ad 16 23                 LD      XHL,(XIY+0x16)
  20D7D2  9e 0e 21                 LD      BC,(XIZ+0xE)
  20D7D5  d9 c8 0a 00              ADD     BC,0xA
  20D7D9  da a8                    LD      DE,0
  20D7DB  1d 37 6b 20              CALL    dyn_206B37
  20D7DF  23 0a                    LD      C,0xA
  20D7E1  8e 0e a3                 SUB     C,(XIZ+0xE)
  20D7E4  cb cf 0a                 CP      C,0xA
  20D7E7  b0 f6                    RET     Z
  20D7E9  25 00                    LD      E,0
  20D7EB  8e 0e 22                 LD      B,(XIZ+0xE)
  20D7EE  ca ee 01                 SLL     1,B
  20D7F1  24 13                    LD      D,0x13
  20D7F3  d8 a8                    LD      WA,0
  20D7F5  1d 68 67 20              CALL    dyn_206768
  20D7F9  0e                       RET

  ; ---- 0x54 bytes not traced ----

dyn_20D84E:
  20D84E  3b                       PUSH    XHL
  20D84F  3a                       PUSH    XDE
  20D850  39                       PUSH    XBC
  20D851  38                       PUSH    XWA
  20D852  21 01                    LD      A,1
  20D854  be 0e 41                 LD      (XIZ+0xE),A
  20D857  40 71 da 20 00           LD      XWA,0x20DA71
  20D85C  be 08 60                 LD      (XIZ+8),XWA
  20D85F  d8 a9                    LD      WA,1
  20D861  1d 59 77 20              CALL    dyn_207759
  20D865  30 21 00                 LD      WA,0x21
  20D868  1d 6a 77 20              CALL    dyn_20776A
  20D86C  58                       POP     XWA
  20D86D  59                       POP     XBC
  20D86E  5a                       POP     XDE
  20D86F  5b                       POP     XHL
  20D870  0e                       RET

dyn_20D871:
  20D871  3b                       PUSH    XHL
  20D872  3a                       PUSH    XDE
  20D873  39                       PUSH    XBC
  20D874  38                       PUSH    XWA
  20D875  1d e1 67 20              CALL    sub_2067E1
  20D879  1d 47 68 20              CALL    sub_206847
  20D87D  1d cf 67 21              CALL    dyn_2167CF
  20D881  21 02                    LD      A,2
  20D883  43 1a 5c 22 00           LD      XHL,0x225C1A
  20D888  1d f3 76 20              CALL    dyn_2076F3
  20D88C  21 02                    LD      A,2
  20D88E  43 21 5c 22 00           LD      XHL,0x225C21
  20D893  1d f3 76 20              CALL    dyn_2076F3
  20D897  21 02                    LD      A,2
  20D899  43 28 5c 22 00           LD      XHL,0x225C28
  20D89E  1d f3 76 20              CALL    dyn_2076F3
  20D8A2  21 02                    LD      A,2
  20D8A4  43 2f 5c 22 00           LD      XHL,0x225C2F
  20D8A9  1d f3 76 20              CALL    dyn_2076F3
  20D8AD  21 02                    LD      A,2
  20D8AF  43 36 5c 22 00           LD      XHL,0x225C36
  20D8B4  1d f3 76 20              CALL    dyn_2076F3
  20D8B8  43 13 5c 22 00           LD      XHL,0x225C13
  20D8BD  21 03                    LD      A,3
  20D8BF  1d f3 76 20              CALL    dyn_2076F3
  20D8C3  1d e4 67 21              CALL    dyn_2167E4
  20D8C7  21 01                    LD      A,1
  20D8C9  1d cc 75 20              CALL    dyn_2075CC
  20D8CD  43 e2 5b 22 00           LD      XHL,0x225BE2
  20D8D2  21 01                    LD      A,1
  20D8D4  1d 8a 74 20              CALL    sub_20748A
  20D8D8  b8 08 63                 LD      (XWA+8),XHL
  20D8DB  33 28 00                 LD      HL,0x28
  20D8DE  1d 45 68 21              CALL    dyn_216845
  20D8E2  d9 a8                    LD      BC,0
  20D8E4  da a8                    LD      DE,0
  20D8E6  1d ba 03 21              CALL    dyn_2103BA
  20D8EA  1d de 6e 21              CALL    dyn_216EDE
  20D8EE  1d b1 6f 21              CALL    dyn_216FB1
  20D8F2  1d 6b 6f 21              CALL    dyn_216F6B
  20D8F6  58                       POP     XWA
  20D8F7  59                       POP     XBC
  20D8F8  5a                       POP     XDE
  20D8F9  5b                       POP     XHL
  20D8FA  0e                       RET

dyn_20D8FB:
  20D8FB  3b                       PUSH    XHL
  20D8FC  3a                       PUSH    XDE
  20D8FD  39                       PUSH    XBC
  20D8FE  38                       PUSH    XWA
  20D8FF  c1 df 5c 21              LD      A,(0x5CDF)
  20D903  c9 33 04                 BIT     4,A
  20D906  66 0c                    JR      Z,dyn_20D914
  20D908  30 81 00                 LD      WA,0x81
  20D90B  1d 6a 77 20              CALL    dyn_20776A
  20D90F  1e 94 00                 CALR    dyn_20D9A6
  20D912  68 6f                    JR      dyn_20D983

dyn_20D914:
  20D914  c9 33 05                 BIT     5,A
  20D917  66 1d                    JR      Z,dyn_20D936
  20D919  21 01                    LD      A,1
  20D91B  1d cc 75 20              CALL    dyn_2075CC
  20D91F  43 e2 5b 22 00           LD      XHL,0x225BE2
  20D924  21 01                    LD      A,1
  20D926  1d 8a 74 20              CALL    sub_20748A
  20D92A  b8 08 63                 LD      (XWA+8),XHL
  20D92D  30 82 00                 LD      WA,0x82
  20D930  1d 6a 77 20              CALL    dyn_20776A
  20D934  68 4d                    JR      dyn_20D983

dyn_20D936:
  20D936  c9 cc 0f                 AND     A,0xF
  20D939  66 48                    JR      Z,dyn_20D983
  20D93B  c9 d9                    CP      A,1
  20D93D  6e 1f                    JR      NZ,loc_20D95E
  20D93F  30 80 00                 LD      WA,0x80
  20D942  1d 6a 77 20              CALL    dyn_20776A
  20D946  c1 f4 5d 21              LD      A,(0x5DF4)
  20D94A  c9 d8                    CP      A,0
  20D94C  66 08                    JR      Z,loc_20D956
  20D94E  c9 69                    DEC     1,A
  20D950  f1 f4 5d 41              LD      (0x5DF4),A
  20D954  68 2b                    JR      loc_20D981

loc_20D956:
  20D956  21 04                    LD      A,4
  20D958  f1 f4 5d 41              LD      (0x5DF4),A
  20D95C  68 23                    JR      loc_20D981

loc_20D95E:
  20D95E  c9 da                    CP      A,2
  20D960  6e 1f                    JR      NZ,loc_20D981
  20D962  30 80 00                 LD      WA,0x80
  20D965  1d 6a 77 20              CALL    dyn_20776A
  20D969  c1 f4 5d 21              LD      A,(0x5DF4)
  20D96D  c9 dc                    CP      A,4
  20D96F  66 08                    JR      Z,loc_20D979
  20D971  c9 61                    INC     1,A
  20D973  f1 f4 5d 41              LD      (0x5DF4),A
  20D977  68 08                    JR      loc_20D981

loc_20D979:
  20D979  21 00                    LD      A,0
  20D97B  f1 f4 5d 41              LD      (0x5DF4),A
  20D97F  68 00                    JR      loc_20D981

loc_20D981:
  20D981  68 00                    JR      dyn_20D983

dyn_20D983:
  20D983  31 60 00                 LD      BC,0x60
  20D986  e8 a8                    LD      XWA,0
  20D988  c1 f4 5d 21              LD      A,(0x5DF4)
  20D98C  c9 08 08                 MUL     WA,8
  20D98F  d8 c8 04 00              ADD     WA,4
  20D993  d8 8a                    LD      DE,WA
  20D995  1d bd 1d 21              CALL    dyn_211DBD
  20D999  8e 2d 21                 LD      A,(XIZ+0x2D)
  20D99C  c9 61                    INC     1,A
  20D99E  be 2d 41                 LD      (XIZ+0x2D),A
  20D9A1  58                       POP     XWA
  20D9A2  59                       POP     XBC
  20D9A3  5a                       POP     XDE
  20D9A4  5b                       POP     XHL
  20D9A5  0e                       RET

dyn_20D9A6:
  20D9A6  3b                       PUSH    XHL
  20D9A7  3a                       PUSH    XDE
  20D9A8  39                       PUSH    XBC
  20D9A9  38                       PUSH    XWA
  20D9AA  eb a8                    LD      XHL,0
  20D9AC  21 01                    LD      A,1
  20D9AE  1d 8a 74 20              CALL    sub_20748A
  20D9B2  b8 08 63                 LD      (XWA+8),XHL
  20D9B5  21 01                    LD      A,1
  20D9B7  1d cc 75 20              CALL    dyn_2075CC
  20D9BB  c1 f4 5d 21              LD      A,(0x5DF4)
  20D9BF  c9 da                    CP      A,2
  20D9C1  66 35                    JR      Z,dyn_20D9F8
  20D9C3  c9 db                    CP      A,3
  20D9C5  66 31                    JR      Z,dyn_20D9F8
  20D9C7  c9 d8                    CP      A,0
  20D9C9  66 2d                    JR      Z,dyn_20D9F8
  20D9CB  c9 d9                    CP      A,1
  20D9CD  66 29                    JR      Z,dyn_20D9F8
  20D9CF  db a8                    LD      HL,0
  20D9D1  1d 5b 61 20              CALL    dyn_20615B
  20D9D5  6e 0b                    JR      NZ,loc_20D9E2
  20D9D7  33 08 00                 LD      HL,8
  20D9DA  1d 5b 61 20              CALL    dyn_20615B
  20D9DE  6e 02                    JR      NZ,loc_20D9E2
  20D9E0  68 16                    JR      dyn_20D9F8

loc_20D9E2:
  20D9E2  21 01                    LD      A,1
  20D9E4  1d cc 75 20              CALL    dyn_2075CC
  20D9E8  43 f4 5b 22 00           LD      XHL,0x225BF4
  20D9ED  21 01                    LD      A,1
  20D9EF  1d 8a 74 20              CALL    sub_20748A
  20D9F3  b8 08 63                 LD      (XWA+8),XHL
  20D9F6  68 07                    JR      dyn_20D9FF

dyn_20D9F8:
  20D9F8  21 04                    LD      A,4
  20D9FA  be 0e 41                 LD      (XIZ+0xE),A
  20D9FD  68 00                    JR      dyn_20D9FF

dyn_20D9FF:
  20D9FF  58                       POP     XWA
  20DA00  59                       POP     XBC
  20DA01  5a                       POP     XDE
  20DA02  5b                       POP     XHL
  20DA03  0e                       RET

  ; ---- 0x58 bytes not traced ----

sub_20DA5C:
  20DA5C  3b                       PUSH    XHL
  20DA5D  3a                       PUSH    XDE
  20DA5E  39                       PUSH    XBC
  20DA5F  38                       PUSH    XWA
  20DA60  9e 0c 20                 LD      WA,(XIZ+0xC)
  20DA63  d8 d8                    CP      WA,0
  20DA65  6e 05                    JR      NZ,loc_20DA6C
  20DA67  21 01                    LD      A,1
  20DA69  be 0e 41                 LD      (XIZ+0xE),A

loc_20DA6C:
  20DA6C  58                       POP     XWA
  20DA6D  59                       POP     XBC
  20DA6E  5a                       POP     XDE
  20DA6F  5b                       POP     XHL
  20DA70  0e                       RET

dyn_20DA71:
  20DA71  3b                       PUSH    XHL
  20DA72  3a                       PUSH    XDE
  20DA73  39                       PUSH    XBC
  20DA74  38                       PUSH    XWA
  20DA75  8e 0e 21                 LD      A,(XIZ+0xE)
  20DA78  c9 d9                    CP      A,1
  20DA7A  6e 0a                    JR      NZ,dyn_20DA86
  20DA7C  1e f2 fd                 CALR    dyn_20D871
  20DA7F  21 02                    LD      A,2
  20DA81  be 0e 41                 LD      (XIZ+0xE),A
  20DA84  68 2e                    JR      dyn_20DAB4

dyn_20DA86:
  20DA86  c9 da                    CP      A,2
  20DA88  6e 07                    JR      NZ,dyn_20DA91
  20DA8A  21 03                    LD      A,3
  20DA8C  be 0e 41                 LD      (XIZ+0xE),A
  20DA8F  68 23                    JR      dyn_20DAB4

dyn_20DA91:
  20DA91  c9 db                    CP      A,3
  20DA93  6e 05                    JR      NZ,dyn_20DA9A
  20DA95  1e 63 fe                 CALR    dyn_20D8FB
  20DA98  68 1a                    JR      dyn_20DAB4

dyn_20DA9A:
  20DA9A  c9 dc                    CP      A,4
  20DA9C  6e 06                    JR      NZ,loc_20DAA4
  20DA9E  1d 69 63 20              CALL    dyn_206369
  20DAA2  68 10                    JR      dyn_20DAB4

loc_20DAA4:
  20DAA4  c9 dd                    CP      A,5
  20DAA6  6e 05                    JR      NZ,loc_20DAAD
  20DAA8  1e b1 ff                 CALR    sub_20DA5C
  20DAAB  68 07                    JR      dyn_20DAB4

loc_20DAAD:
  20DAAD  68 05                    JR      dyn_20DAB4

  ; ---- 0x5 bytes not traced ----

dyn_20DAB4:
  20DAB4  58                       POP     XWA
  20DAB5  59                       POP     XBC
  20DAB6  5a                       POP     XDE
  20DAB7  5b                       POP     XHL
  20DAB8  0e                       RET

dyn_20DAB9:
  20DAB9  1d cc da 20              CALL    dyn_20DACC
  20DABD  eb c8 00 a0 0f 00        ADD     XHL,0xFA000
  20DAC3  3b                       PUSH    XHL
  20DAC4  1d be 77 20              CALL    dyn_2077BE
  20DAC8  e5 fe 83                 ADD     XHL,(XSP+)
  20DACB  0e                       RET

dyn_20DACC:
  20DACC  eb a8                    LD      XHL,0
  20DACE  c9 e1                    OR      A,A
  20DAD0  b0 f6                    RET     Z
  20DAD2  c9 69                    DEC     1,A
  20DAD4  c9 8f                    LD      L,A
  20DAD6  db 08 90 02              MUL     XHL,0x290
  20DADA  eb c8 30 00 00 00        ADD     XHL,0x30
  20DAE0  0e                       RET

  ; ---- 0x76 bytes not traced ----

dyn_20DB57:
  20DB57  1d b9 da 20              CALL    dyn_20DAB9
  20DB5B  42 20 00 20 00           LD      XDE,0x200020
  20DB60  c5 e8 21                 LD      A,(XDE+)
  20DB63  c5 ec f1                 CP      A,(XHL+)
  20DB66  b0 fe                    RET     NZ
  20DB68  ea cf 30 00 20 00        CP      XDE,0x200030
  20DB6E  b0 f6                    RET     Z
  20DB70  68 ee                    JR      0x20DB60

  ; ---- 0xf3 bytes not traced ----

dyn_20DC65:
  20DC65  21 00                    LD      A,0
  20DC67  1d b9 da 20              CALL    dyn_20DAB9
  20DC6B  eb c8 10 00 00 00        ADD     XHL,0x10
  20DC71  42 80 52 00 00           LD      XDE,0x5280
  20DC76  31 02 00                 LD      BC,2
  20DC79  83 11                    LDIR    (XDE+),(XHL+)
  20DC7B  0e                       RET

  ; ---- 0x558 bytes not traced ----

dyn_20E1D4:
  20E1D4  9e 04 3f 00 00           CPW     (XIZ+4),0
  20E1D9  f2 69 63 20 d6           JP      Z,dyn_206369
  20E1DE  9e 0e 69                 DECW    1,(XIZ+0xE)
  20E1E1  f2 69 63 20 d6           JP      Z,dyn_206369
  20E1E6  0e                       RET

dyn_20E1E7:
  20E1E7  3a                       PUSH    XDE
  20E1E8  3b                       PUSH    XHL
  20E1E9  d9 12                    EXTZ    BC
  20E1EB  d9 ee 02                 SLL     2,BC
  20E1EE  d8 12                    EXTZ    WA
  20E1F0  e8 12                    EXTZ    XWA
  20E1F2  e8 ee 03                 SLL     3,XWA
  20E1F5  42 00 82 00 00           LD      XDE,0x8200
  20E1FA  e8 82                    ADD     XDE,XWA
  20E1FC  93 11                    LDIRW   (XDE+),(XHL+)
  20E1FE  c1 5b 58 21              LD      A,(0x585B)
  20E202  f1 5c 58 41              LD      (0x585C),A
  20E206  5b                       POP     XHL
  20E207  5a                       POP     XDE
  20E208  0e                       RET

dyn_20E209:
  20E209  3a                       PUSH    XDE
  20E20A  3b                       PUSH    XHL
  20E20B  d9 12                    EXTZ    BC
  20E20D  d9 ee 02                 SLL     2,BC
  20E210  d8 12                    EXTZ    WA
  20E212  e8 12                    EXTZ    XWA
  20E214  e8 ee 02                 SLL     2,XWA
  20E217  42 00 81 00 00           LD      XDE,0x8100
  20E21C  e8 82                    ADD     XDE,XWA
  20E21E  83 11                    LDIR    (XDE+),(XHL+)
  20E220  c1 5b 58 21              LD      A,(0x585B)
  20E224  f1 5c 58 41              LD      (0x585C),A
  20E228  5b                       POP     XHL
  20E229  5a                       POP     XDE
  20E22A  0e                       RET

dyn_20E22B:
  20E22B  be 16 02 00 00           LDW     (XIZ+0x16),0
  20E230  8e 14 21                 LD      A,(XIZ+0x14)
  20E233  8e 12 a1                 SUB     A,(XIZ+0x12)
  20E236  d8 13                    EXTS    WA
  20E238  be 1a 50                 LD      (XIZ+0x1A),WA
  20E23B  be 08 02 45 e2           LDW     (XIZ+8),0xE245
  20E240  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E245  9e 1a 20                 LD      WA,(XIZ+0x1A)
  20E248  8e 16 49                 MULS    WA,(XIZ+0x16)
  20E24B  8e 0e 59                 DIVS    WA,(XIZ+0xE)
  20E24E  8e 12 81                 ADD     A,(XIZ+0x12)
  20E251  f1 5b 58 41              LD      (0x585B),A
  20E255  9e 16 61                 INCW    1,(XIZ+0x16)
  20E258  9e 16 20                 LD      WA,(XIZ+0x16)
  20E25B  9e 0e f0                 CP      WA,(XIZ+0xE)
  20E25E  f2 69 63 20 da           JP      GT,dyn_206369
  20E263  0e                       RET

dyn_20E264:
  20E264  43 96 e4 20 00           LD      XHL,0x20E496
  20E269  1d 24 63 20              CALL    dyn_206324
  20E26D  be 08 02 78 e2           LDW     (XIZ+8),0xE278
  20E272  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E277  0e                       RET

dyn_20E278:
  20E278  c1 df 5c 21              LD      A,(0x5CDF)
  20E27C  c9 cc 10                 AND     A,0x10
  20E27F  6e 0b                    JR      NZ,dyn_20E28C
  20E281  9e 0c 3f 00 00           CPW     (XIZ+0xC),0
  20E286  f2 69 63 20 d6           JP      Z,dyn_206369
  20E28B  0e                       RET

dyn_20E28C:
  20E28C  1d 6d 63 20              CALL    dyn_20636D
  20E290  9e 0c 3f 00 00           CPW     (XIZ+0xC),0
  20E295  f2 69 63 20 d6           JP      Z,dyn_206369
  20E29A  0e                       RET

dyn_20E29B:
  20E29B  be 0e 02 58 02           LDW     (XIZ+0xE),0x258
  20E2A0  bd 0e 02 00 00           LDW     (XIY+0xE),0
  20E2A5  be 08 02 b0 e2           LDW     (XIZ+8),0xE2B0
  20E2AA  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E2AF  0e                       RET

dyn_20E2B0:
  20E2B0  43 ea e2 20 00           LD      XHL,0x20E2EA
  20E2B5  1d 24 63 20              CALL    dyn_206324
  20E2B9  43 6f e3 20 00           LD      XHL,0x20E36F
  20E2BE  1d 24 63 20              CALL    dyn_206324
  20E2C2  be 08 02 cd e2           LDW     (XIZ+8),0xE2CD
  20E2C7  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E2CC  0e                       RET

dyn_20E2CD:
  20E2CD  c1 df 5c 21              LD      A,(0x5CDF)
  20E2D1  c9 cc 10                 AND     A,0x10
  20E2D4  6e 06                    JR      NZ,dyn_20E2DC
  20E2D6  9e 0e 69                 DECW    1,(XIZ+0xE)
  20E2D9  66 06                    JR      Z,0x20E2E1
  20E2DB  0e                       RET

dyn_20E2DC:
  20E2DC  bd 0e 02 01 00           LDW     (XIY+0xE),1
  20E2E1  1d 6d 63 20              CALL    dyn_20636D
  20E2E5  1d 69 63 20              CALL    dyn_206369
  20E2E9  0e                       RET

dyn_20E2EA:
  20E2EA  be 0e 02 b4 00           LDW     (XIZ+0xE),0xB4
  20E2EF  be 08 02 f9 e2           LDW     (XIZ+8),0xE2F9
  20E2F4  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E2F9  9e 0e 69                 DECW    1,(XIZ+0xE)
  20E2FC  b0 fe                    RET     NZ
  20E2FE  be 10 02 02 00           LDW     (XIZ+0x10),2
  20E303  be 08 02 0d e3           LDW     (XIZ+8),0xE30D
  20E308  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E30D  43 3d 51 2e 00           LD      XHL,0x2E513D
  20E312  c1 c6 5b 21              LD      A,(0x5BC6)
  20E316  c9 cc 10                 AND     A,0x10
  20E319  6e 05                    JR      NZ,loc_20E320
  20E31B  43 3d 57 2e 00           LD      XHL,0x2E573D

loc_20E320:
  20E320  30 e7 00                 LD      WA,0xE7
  20E323  d9 a8                    LD      BC,0
  20E325  da aa                    LD      DE,2
  20E327  1d 5d 6b 20              CALL    dyn_206B5D
  20E32B  be 08 02 36 e3           LDW     (XIZ+8),0xE336
  20E330  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E335  0e                       RET

  ; ---- 0x39 bytes not traced ----

dyn_20E36F:
  20E36F  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20E374  be 08 02 7e e3           LDW     (XIZ+8),0xE37E
  20E379  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E37E  9e 0e 3f 48 03           CPW     (XIZ+0xE),0x348
  20E383  f2 69 63 20 d6           JP      Z,dyn_206369
  20E388  43 92 42 2e 00           LD      XHL,0x2E4292
  20E38D  9e 0e 61                 INCW    1,(XIZ+0xE)
  20E390  9e 0e 20                 LD      WA,(XIZ+0xE)
  20E393  d8 ef 05                 SRL     5,WA
  20E396  d8 cc 01 00              AND     WA,1
  20E39A  66 05                    JR      Z,0x20E3A1
  20E39C  43 b0 42 2e 00           LD      XHL,0x2E42B0
  20E3A1  30 0c 00                 LD      WA,0xC
  20E3A4  31 18 00                 LD      BC,0x18
  20E3A7  32 58 00                 LD      DE,0x58
  20E3AA  1d c8 69 20              CALL    dyn_2069C8
  20E3AE  0e                       RET

dyn_20E3AF:
  20E3AF  f1 e2 5c 00 00           LDB     (0x5CE2),0
  20E3B4  f1 4b 58 00 00           LDB     (0x584B),0
  20E3B9  f1 4d 58 00 00           LDB     (0x584D),0
  20E3BE  f1 53 58 00 00           LDB     (0x5853),0
  20E3C3  f1 55 58 00 00           LDB     (0x5855),0
  20E3C8  f1 5b 58 00 00           LDB     (0x585B),0
  20E3CD  1e 79 08                 CALR    dyn_20EC49
  20E3D0  1e 85 08                 CALR    dyn_20EC58
  20E3D3  43 64 e2 20 00           LD      XHL,0x20E264
  20E3D8  1d 24 63 20              CALL    dyn_206324
  20E3DC  40 dc e3 20 00           LD      XWA,0x20E3DC
  20E3E1  be 08 60                 LD      (XIZ+8),XWA
  20E3E4  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E3E8  b0 fe                    RET     NZ
  20E3EA  43 89 e7 20 00           LD      XHL,0x20E789
  20E3EF  1d 24 63 20              CALL    dyn_206324
  20E3F3  40 f3 e3 20 00           LD      XWA,0x20E3F3
  20E3F8  be 08 60                 LD      (XIZ+8),XWA
  20E3FB  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E3FF  b0 fe                    RET     NZ
  20E401  43 3d 51 2e 00           LD      XHL,0x2E513D
  20E406  c1 c6 5b 21              LD      A,(0x5BC6)
  20E40A  c9 cc 10                 AND     A,0x10
  20E40D  6e 05                    JR      NZ,0x20E414
  20E40F  43 3d 57 2e 00           LD      XHL,0x2E573D
  20E414  30 e7 00                 LD      WA,0xE7
  20E417  d9 a8                    LD      BC,0
  20E419  da aa                    LD      DE,2
  20E41B  1d 5d 6b 20              CALL    dyn_206B5D
  20E41F  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E424  1d 24 63 20              CALL    dyn_206324
  20E428  bb 0e 02 05 00           LDW     (XHL+0xE),5
  20E42D  40 2d e4 20 00           LD      XWA,0x20E42D
  20E432  be 08 60                 LD      (XIZ+8),XWA
  20E435  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E439  b0 fe                    RET     NZ
  20E43B  43 e3 4e 2e 00           LD      XHL,0x2E4EE3
  20E440  c1 c6 5b 21              LD      A,(0x5BC6)
  20E444  c9 cc 10                 AND     A,0x10
  20E447  6e 05                    JR      NZ,0x20E44E
  20E449  43 e3 54 2e 00           LD      XHL,0x2E54E3
  20E44E  30 e7 00                 LD      WA,0xE7
  20E451  d9 a8                    LD      BC,0
  20E453  da aa                    LD      DE,2
  20E455  1d 5d 6b 20              CALL    dyn_206B5D
  20E459  43 9b e2 20 00           LD      XHL,0x20E29B
  20E45E  1d 24 63 20              CALL    dyn_206324
  20E462  40 62 e4 20 00           LD      XWA,0x20E462
  20E467  be 08 60                 LD      (XIZ+8),XWA
  20E46A  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E46E  b0 fe                    RET     NZ
  20E470  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20E475  76 37 ff                 JRL     Z,dyn_20E3AF
  20E478  f1 e2 5c 00 01           LDB     (0x5CE2),1
  20E47D  f1 4b 58 00 00           LDB     (0x584B),0
  20E482  f1 4d 58 00 00           LDB     (0x584D),0
  20E487  f1 53 58 00 00           LDB     (0x5853),0
  20E48C  f1 55 58 00 00           LDB     (0x5855),0
  20E491  1d 69 63 20              CALL    dyn_206369
  20E495  0e                       RET

dyn_20E496:
  20E496  40 11 00 00 00           LD      XWA,0x11
  20E49B  1d 59 77 20              CALL    dyn_207759
  20E49F  43 6c e9 20 00           LD      XHL,0x20E96C
  20E4A4  1d 24 63 20              CALL    dyn_206324
  20E4A8  40 a8 e4 20 00           LD      XWA,0x20E4A8
  20E4AD  be 08 60                 LD      (XIZ+8),XWA
  20E4B0  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E4B4  b0 fe                    RET     NZ
  20E4B6  1e 90 07                 CALR    dyn_20EC49
  20E4B9  1e 9c 07                 CALR    dyn_20EC58
  20E4BC  f1 4b 58 00 00           LDB     (0x584B),0
  20E4C1  f1 4d 58 00 00           LDB     (0x584D),0
  20E4C6  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E4CB  1d 24 63 20              CALL    dyn_206324
  20E4CF  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20E4D4  40 d4 e4 20 00           LD      XWA,0x20E4D4
  20E4D9  be 08 60                 LD      (XIZ+8),XWA
  20E4DC  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E4E0  b0 fe                    RET     NZ
  20E4E2  f1 5b 58 00 00           LDB     (0x585B),0
  20E4E7  30 31 00                 LD      WA,0x31
  20E4EA  1d 6a 77 20              CALL    dyn_20776A
  20E4EE  43 e4 e6 20 00           LD      XHL,0x20E6E4
  20E4F3  1d 24 63 20              CALL    dyn_206324
  20E4F7  40 f7 e4 20 00           LD      XWA,0x20E4F7
  20E4FC  be 08 60                 LD      (XIZ+8),XWA
  20E4FF  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E503  b0 fe                    RET     NZ
  20E505  1e 0f 06                 CALR    sub_20EB17
  20E508  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E50D  1d 24 63 20              CALL    dyn_206324
  20E511  bb 0e 02 2c 01           LDW     (XHL+0xE),0x12C
  20E516  40 16 e5 20 00           LD      XWA,0x20E516
  20E51B  be 08 60                 LD      (XIZ+8),XWA
  20E51E  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E522  b0 fe                    RET     NZ
  20E524  43 87 eb 20 00           LD      XHL,0x20EB87
  20E529  1d 24 63 20              CALL    dyn_206324
  20E52D  40 2d e5 20 00           LD      XWA,0x20E52D
  20E532  be 08 60                 LD      (XIZ+8),XWA
  20E535  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E539  b0 fe                    RET     NZ
  20E53B  30 af 00                 LD      WA,0xAF
  20E53E  1d 6a 77 20              CALL    dyn_20776A
  20E542  43 a6 ea 20 00           LD      XHL,0x20EAA6
  20E547  1d 24 63 20              CALL    dyn_206324
  20E54B  40 4b e5 20 00           LD      XWA,0x20E54B
  20E550  be 08 60                 LD      (XIZ+8),XWA
  20E553  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E557  b0 fe                    RET     NZ
  20E559  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E55E  1d 24 63 20              CALL    dyn_206324
  20E562  bb 0e 02 5a 00           LDW     (XHL+0xE),0x5A
  20E567  40 67 e5 20 00           LD      XWA,0x20E567
  20E56C  be 08 60                 LD      (XIZ+8),XWA
  20E56F  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E573  b0 fe                    RET     NZ
  20E575  1e ce 07                 CALR    sub_20ED46
  20E578  43 b2 ed 20 00           LD      XHL,0x20EDB2
  20E57D  1d 24 63 20              CALL    dyn_206324
  20E581  40 81 e5 20 00           LD      XWA,0x20E581
  20E586  be 08 60                 LD      (XIZ+8),XWA
  20E589  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E58D  b0 fe                    RET     NZ
  20E58F  43 f9 eb 20 00           LD      XHL,0x20EBF9
  20E594  1d 24 63 20              CALL    dyn_206324
  20E598  40 98 e5 20 00           LD      XWA,0x20E598
  20E59D  be 08 60                 LD      (XIZ+8),XWA
  20E5A0  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E5A4  b0 fe                    RET     NZ
  20E5A6  43 1a ee 20 00           LD      XHL,0x20EE1A
  20E5AB  1d 24 63 20              CALL    dyn_206324
  20E5AF  40 af e5 20 00           LD      XWA,0x20E5AF
  20E5B4  be 08 60                 LD      (XIZ+8),XWA
  20E5B7  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E5BB  b0 fe                    RET     NZ
  20E5BD  43 f9 eb 20 00           LD      XHL,0x20EBF9
  20E5C2  1d 24 63 20              CALL    dyn_206324
  20E5C6  40 c6 e5 20 00           LD      XWA,0x20E5C6
  20E5CB  be 08 60                 LD      (XIZ+8),XWA
  20E5CE  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E5D2  b0 fe                    RET     NZ
  20E5D4  43 82 ee 20 00           LD      XHL,0x20EE82
  20E5D9  1d 24 63 20              CALL    dyn_206324
  20E5DD  40 dd e5 20 00           LD      XWA,0x20E5DD
  20E5E2  be 08 60                 LD      (XIZ+8),XWA
  20E5E5  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E5E9  b0 fe                    RET     NZ
  20E5EB  43 f9 eb 20 00           LD      XHL,0x20EBF9
  20E5F0  1d 24 63 20              CALL    dyn_206324
  20E5F4  40 f4 e5 20 00           LD      XWA,0x20E5F4
  20E5F9  be 08 60                 LD      (XIZ+8),XWA
  20E5FC  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E600  b0 fe                    RET     NZ
  20E602  43 ea ee 20 00           LD      XHL,0x20EEEA
  20E607  1d 24 63 20              CALL    dyn_206324
  20E60B  40 0b e6 20 00           LD      XWA,0x20E60B
  20E610  be 08 60                 LD      (XIZ+8),XWA
  20E613  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E617  b0 fe                    RET     NZ
  20E619  43 f9 eb 20 00           LD      XHL,0x20EBF9
  20E61E  1d 24 63 20              CALL    dyn_206324
  20E622  40 22 e6 20 00           LD      XWA,0x20E622
  20E627  be 08 60                 LD      (XIZ+8),XWA
  20E62A  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E62E  b0 fe                    RET     NZ
  20E630  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E635  1d 24 63 20              CALL    dyn_206324
  20E639  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20E63E  40 3e e6 20 00           LD      XWA,0x20E63E
  20E643  be 08 60                 LD      (XIZ+8),XWA
  20E646  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E64A  b0 fe                    RET     NZ
  20E64C  43 21 ec 20 00           LD      XHL,0x20EC21
  20E651  1d 24 63 20              CALL    dyn_206324
  20E655  40 55 e6 20 00           LD      XWA,0x20E655
  20E65A  be 08 60                 LD      (XIZ+8),XWA
  20E65D  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E661  b0 fe                    RET     NZ
  20E663  43 2b e2 20 00           LD      XHL,0x20E22B
  20E668  1d 24 63 20              CALL    dyn_206324
  20E66C  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20E671  bb 12 00 00              LDB     (XHL+0x12),0
  20E675  bb 14 00 7f              LDB     (XHL+0x14),0x7F
  20E679  40 79 e6 20 00           LD      XWA,0x20E679
  20E67E  be 08 60                 LD      (XIZ+8),XWA
  20E681  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E685  b0 fe                    RET     NZ
  20E687  43 67 ec 20 00           LD      XHL,0x20EC67
  20E68C  1d 24 63 20              CALL    dyn_206324
  20E690  40 90 e6 20 00           LD      XWA,0x20E690
  20E695  be 08 60                 LD      (XIZ+8),XWA
  20E698  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E69C  b0 fe                    RET     NZ
  20E69E  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E6A3  1d 24 63 20              CALL    dyn_206324
  20E6A7  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20E6AC  43 e8 ec 20 00           LD      XHL,0x20ECE8
  20E6B1  1d 24 63 20              CALL    dyn_206324
  20E6B5  40 b5 e6 20 00           LD      XWA,0x20E6B5
  20E6BA  be 08 60                 LD      (XIZ+8),XWA
  20E6BD  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E6C1  b0 fe                    RET     NZ
  20E6C3  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E6C8  1d 24 63 20              CALL    dyn_206324
  20E6CC  bb 0e 02 1e 00           LDW     (XHL+0xE),0x1E
  20E6D1  40 d1 e6 20 00           LD      XWA,0x20E6D1
  20E6D6  be 08 60                 LD      (XIZ+8),XWA
  20E6D9  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E6DD  b0 fe                    RET     NZ
  20E6DF  1d 69 63 20              CALL    dyn_206369
  20E6E3  0e                       RET

  ; ---- 0xa5 bytes not traced ----

dyn_20E789:
  20E789  1e 73 00                 CALR    dyn_20E7FF
  20E78C  30 32 00                 LD      WA,0x32
  20E78F  1d 6a 77 20              CALL    dyn_20776A
  20E793  43 9b e8 20 00           LD      XHL,0x20E89B
  20E798  1d 24 63 20              CALL    dyn_206324
  20E79C  40 9c e7 20 00           LD      XWA,0x20E79C
  20E7A1  be 08 60                 LD      (XIZ+8),XWA
  20E7A4  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E7A8  b0 fe                    RET     NZ
  20E7AA  43 e8 e8 20 00           LD      XHL,0x20E8E8
  20E7AF  1d 24 63 20              CALL    dyn_206324
  20E7B3  40 b3 e7 20 00           LD      XWA,0x20E7B3
  20E7B8  be 08 60                 LD      (XIZ+8),XWA
  20E7BB  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E7BF  b0 fe                    RET     NZ
  20E7C1  43 30 e9 20 00           LD      XHL,0x20E930
  20E7C6  1d 24 63 20              CALL    dyn_206324
  20E7CA  40 ca e7 20 00           LD      XWA,0x20E7CA
  20E7CF  be 08 60                 LD      (XIZ+8),XWA
  20E7D2  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E7D6  b0 fe                    RET     NZ
  20E7D8  1e 7d 04                 CALR    dyn_20EC58
  20E7DB  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E7E0  1d 24 63 20              CALL    dyn_206324
  20E7E4  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20E7E9  40 e9 e7 20 00           LD      XWA,0x20E7E9
  20E7EE  be 08 60                 LD      (XIZ+8),XWA
  20E7F1  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E7F5  b0 fe                    RET     NZ
  20E7F7  1e 5e 04                 CALR    dyn_20EC58
  20E7FA  1d 69 63 20              CALL    dyn_206369
  20E7FE  0e                       RET

dyn_20E7FF:
  20E7FF  f1 5b 58 00 7f           LDB     (0x585B),0x7F
  20E804  f1 4b 58 00 00           LDB     (0x584B),0
  20E809  f1 4d 58 00 00           LDB     (0x584D),0
  20E80E  f1 53 58 00 00           LDB     (0x5853),0
  20E813  f1 55 58 00 00           LDB     (0x5855),0
  20E818  1e 2e 04                 CALR    dyn_20EC49
  20E81B  1e 3a 04                 CALR    dyn_20EC58
  20E81E  f1 5b 58 00 00           LDB     (0x585B),0
  20E823  21 00                    LD      A,0
  20E825  23 09                    LD      C,9
  20E827  43 68 3f 2e 00           LD      XHL,0x2E3F68
  20E82C  1d 9e 6d 20              CALL    sub_206D9E
  20E830  21 10                    LD      A,0x10
  20E832  23 09                    LD      C,9
  20E834  43 68 3f 2e 00           LD      XHL,0x2E3F68
  20E839  1d 9e 6d 20              CALL    sub_206D9E
  20E83D  21 20                    LD      A,0x20
  20E83F  23 0a                    LD      C,0xA
  20E841  43 3f 4d 2e 00           LD      XHL,0x2E4D3F
  20E846  1d 9e 6d 20              CALL    sub_206D9E
  20E84A  21 00                    LD      A,0
  20E84C  23 02                    LD      C,2
  20E84E  43 b0 3f 2e 00           LD      XHL,0x2E3FB0
  20E853  1d cd 6d 20              CALL    sub_206DCD
  20E857  21 02                    LD      A,2
  20E859  23 02                    LD      C,2
  20E85B  43 b0 3f 2e 00           LD      XHL,0x2E3FB0
  20E860  1d cd 6d 20              CALL    sub_206DCD
  20E864  21 04                    LD      A,4
  20E866  23 02                    LD      C,2
  20E868  43 8f 4d 2e 00           LD      XHL,0x2E4D8F
  20E86D  1d cd 6d 20              CALL    sub_206DCD
  20E871  30 0c 00                 LD      WA,0xC
  20E874  43 ce 42 2e 00           LD      XHL,0x2E42CE
  20E879  1d 26 72 20              CALL    dyn_207226
  20E87D  30 e7 00                 LD      WA,0xE7
  20E880  43 97 59 2e 00           LD      XHL,0x2E5997
  20E885  1d 26 72 20              CALL    dyn_207226
  20E889  43 40 42 2e 00           LD      XHL,0x2E4240
  20E88E  30 0c 00                 LD      WA,0xC
  20E891  d9 a8                    LD      BC,0
  20E893  32 11 00                 LD      DE,0x11
  20E896  1d 51 6b 20              CALL    dyn_206B51
  20E89A  0e                       RET

dyn_20E89B:
  20E89B  f1 5b 58 00 00           LDB     (0x585B),0
  20E8A0  be 0e 02 ec ff           LDW     (XIZ+0xE),0xFFEC
  20E8A5  be 10 02 14 00           LDW     (XIZ+0x10),0x14
  20E8AA  be 08 02 b4 e8           LDW     (XIZ+8),0xE8B4
  20E8AF  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E8B4  30 0c 00                 LD      WA,0xC
  20E8B7  43 b8 3f 2e 00           LD      XHL,0x2E3FB8
  20E8BC  9e 0e 21                 LD      BC,(XIZ+0xE)
  20E8BF  da a9                    LD      DE,1
  20E8C1  1d 51 6b 20              CALL    dyn_206B51
  20E8C5  30 0c 00                 LD      WA,0xC
  20E8C8  43 5a 40 2e 00           LD      XHL,0x2E405A
  20E8CD  9e 10 21                 LD      BC,(XIZ+0x10)
  20E8D0  32 0d 00                 LD      DE,0xD
  20E8D3  1d 51 6b 20              CALL    dyn_206B51
  20E8D7  9e 10 69                 DECW    1,(XIZ+0x10)
  20E8DA  9e 0e 61                 INCW    1,(XIZ+0xE)
  20E8DD  9e 0e 3f 01 00           CPW     (XIZ+0xE),1
  20E8E2  f2 69 63 20 d9           JP      GE,dyn_206369
  20E8E7  0e                       RET

dyn_20E8E8:
  20E8E8  be 0e 02 ec ff           LDW     (XIZ+0xE),0xFFEC
  20E8ED  be 10 02 14 00           LDW     (XIZ+0x10),0x14
  20E8F2  be 08 02 fc e8           LDW     (XIZ+8),0xE8FC
  20E8F7  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E8FC  30 0c 00                 LD      WA,0xC
  20E8FF  43 fc 40 2e 00           LD      XHL,0x2E40FC
  20E904  9e 0e 21                 LD      BC,(XIZ+0xE)
  20E907  da ad                    LD      DE,5
  20E909  1d 51 6b 20              CALL    dyn_206B51
  20E90D  30 0c 00                 LD      WA,0xC
  20E910  43 9e 41 2e 00           LD      XHL,0x2E419E
  20E915  9e 10 21                 LD      BC,(XIZ+0x10)
  20E918  32 09 00                 LD      DE,9
  20E91B  1d 51 6b 20              CALL    dyn_206B51
  20E91F  9e 10 69                 DECW    1,(XIZ+0x10)
  20E922  9e 0e 61                 INCW    1,(XIZ+0xE)
  20E925  9e 0e 3f 01 00           CPW     (XIZ+0xE),1
  20E92A  f2 69 63 20 d9           JP      GE,dyn_206369
  20E92F  0e                       RET

dyn_20E930:
  20E930  be 0e 02 14 00           LDW     (XIZ+0xE),0x14
  20E935  be 08 02 3f e9           LDW     (XIZ+8),0xE93F
  20E93A  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20E93F  43 97 4d 2e 00           LD      XHL,0x2E4D97
  20E944  c1 c6 5b 21              LD      A,(0x5BC6)
  20E948  c9 cc 10                 AND     A,0x10
  20E94B  6e 05                    JR      NZ,0x20E952
  20E94D  43 97 53 2e 00           LD      XHL,0x2E5397
  20E952  9e 0e 21                 LD      BC,(XIZ+0xE)
  20E955  30 e7 00                 LD      WA,0xE7
  20E958  da aa                    LD      DE,2
  20E95A  1d 5d 6b 20              CALL    dyn_206B5D
  20E95E  9e 0e 69                 DECW    1,(XIZ+0xE)
  20E961  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20E966  f2 69 63 20 d1           JP      LT,dyn_206369
  20E96B  0e                       RET

dyn_20E96C:
  20E96C  f1 5b 58 00 7f           LDB     (0x585B),0x7F
  20E971  1e d5 02                 CALR    dyn_20EC49
  20E974  1e e1 02                 CALR    dyn_20EC58
  20E977  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20E97C  1d 24 63 20              CALL    dyn_206324
  20E980  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20E985  40 85 e9 20 00           LD      XWA,0x20E985
  20E98A  be 08 60                 LD      (XIZ+8),XWA
  20E98D  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20E991  b0 fe                    RET     NZ
  20E993  30 0c 00                 LD      WA,0xC
  20E996  23 00                    LD      C,0
  20E998  25 00                    LD      E,0
  20E99A  22 20                    LD      B,0x20
  20E99C  24 13                    LD      D,0x13
  20E99E  1d 68 67 20              CALL    dyn_206768
  20E9A2  21 10                    LD      A,0x10
  20E9A4  23 02                    LD      C,2
  20E9A6  43 4d d5 2d 00           LD      XHL,0x2DD54D
  20E9AB  1d 9e 6d 20              CALL    sub_206D9E
  20E9AF  21 20                    LD      A,0x20
  20E9B1  23 02                    LD      C,2
  20E9B3  43 4d d5 2d 00           LD      XHL,0x2DD54D
  20E9B8  1d 9e 6d 20              CALL    sub_206D9E
  20E9BC  21 02                    LD      A,2
  20E9BE  23 02                    LD      C,2
  20E9C0  43 5d d5 2d 00           LD      XHL,0x2DD55D
  20E9C5  1d cd 6d 20              CALL    sub_206DCD
  20E9C9  21 04                    LD      A,4
  20E9CB  23 02                    LD      C,2
  20E9CD  43 5d d5 2d 00           LD      XHL,0x2DD55D
  20E9D2  1d cd 6d 20              CALL    sub_206DCD
  20E9D6  30 0c 00                 LD      WA,0xC
  20E9D9  43 b9 da 2d 00           LD      XHL,0x2DDAB9
  20E9DE  1d 26 72 20              CALL    dyn_207226
  20E9E2  30 0c 00                 LD      WA,0xC
  20E9E5  43 bf d7 2d 00           LD      XHL,0x2DD7BF
  20E9EA  d9 a8                    LD      BC,0
  20E9EC  da a8                    LD      DE,0
  20E9EE  1d 5d 6b 20              CALL    dyn_206B5D
  20E9F2  be 0e 02 e8 ff           LDW     (XIZ+0xE),0xFFE8
  20E9F7  f1 5b 58 00 7f           LDB     (0x585B),0x7F
  20E9FC  43 2b e2 20 00           LD      XHL,0x20E22B
  20EA01  1d 24 63 20              CALL    dyn_206324
  20EA05  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20EA0A  bb 12 00 7f              LDB     (XHL+0x12),0x7F
  20EA0E  bb 14 00 00              LDB     (XHL+0x14),0
  20EA12  40 12 ea 20 00           LD      XWA,0x20EA12
  20EA17  be 08 60                 LD      (XIZ+8),XWA
  20EA1A  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20EA1E  b0 fe                    RET     NZ
  20EA20  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20EA25  1d 24 63 20              CALL    dyn_206324
  20EA29  bb 0e 02 28 00           LDW     (XHL+0xE),0x28
  20EA2E  40 2e ea 20 00           LD      XWA,0x20EA2E
  20EA33  be 08 60                 LD      (XIZ+8),XWA
  20EA36  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20EA3A  b0 fe                    RET     NZ
  20EA3C  be 08 02 46 ea           LDW     (XIZ+8),0xEA46
  20EA41  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20EA46  30 0c 00                 LD      WA,0xC
  20EA49  43 65 d5 2d 00           LD      XHL,0x2DD565
  20EA4E  9e 0e 21                 LD      BC,(XIZ+0xE)
  20EA51  da ab                    LD      DE,3
  20EA53  1d 51 6b 20              CALL    dyn_206B51
  20EA57  9e 0e 61                 INCW    1,(XIZ+0xE)
  20EA5A  9e 0e 3f 14 00           CPW     (XIZ+0xE),0x14
  20EA5F  b0 fe                    RET     NZ
  20EA61  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20EA66  1d 24 63 20              CALL    dyn_206324
  20EA6A  bb 0e 02 14 00           LDW     (XHL+0xE),0x14
  20EA6F  40 6f ea 20 00           LD      XWA,0x20EA6F
  20EA74  be 08 60                 LD      (XIZ+8),XWA
  20EA77  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20EA7B  b0 fe                    RET     NZ
  20EA7D  43 2b e2 20 00           LD      XHL,0x20E22B
  20EA82  1d 24 63 20              CALL    dyn_206324
  20EA86  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20EA8B  bb 12 00 00              LDB     (XHL+0x12),0
  20EA8F  bb 14 00 7f              LDB     (XHL+0x14),0x7F
  20EA93  40 93 ea 20 00           LD      XWA,0x20EA93
  20EA98  be 08 60                 LD      (XIZ+8),XWA
  20EA9B  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20EA9F  b0 fe                    RET     NZ
  20EAA1  1d 69 63 20              CALL    dyn_206369
  20EAA5  0e                       RET

  ; ---- 0x71 bytes not traced ----

sub_20EB17:
  20EB17  21 00                    LD      A,0
  20EB19  23 03                    LD      C,3
  20EB1B  43 48 e6 2d 00           LD      XHL,0x2DE648
  20EB20  1d 9e 6d 20              CALL    sub_206D9E
  20EB24  21 10                    LD      A,0x10
  20EB26  23 03                    LD      C,3
  20EB28  43 48 e6 2d 00           LD      XHL,0x2DE648
  20EB2D  1d 9e 6d 20              CALL    sub_206D9E
  20EB31  21 20                    LD      A,0x20
  20EB33  23 03                    LD      C,3
  20EB35  43 48 e6 2d 00           LD      XHL,0x2DE648
  20EB3A  1d 9e 6d 20              CALL    sub_206D9E
  20EB3E  21 00                    LD      A,0
  20EB40  23 02                    LD      C,2
  20EB42  43 27 e0 2d 00           LD      XHL,0x2DE027
  20EB47  1d cd 6d 20              CALL    sub_206DCD
  20EB4B  21 02                    LD      A,2
  20EB4D  23 02                    LD      C,2
  20EB4F  43 27 e0 2d 00           LD      XHL,0x2DE027
  20EB54  1d cd 6d 20              CALL    sub_206DCD
  20EB58  21 04                    LD      A,4
  20EB5A  23 03                    LD      C,3
  20EB5C  43 27 e0 2d 00           LD      XHL,0x2DE027
  20EB61  1d cd 6d 20              CALL    sub_206DCD
  20EB65  30 0c 00                 LD      WA,0xC
  20EB68  43 58 eb 2d 00           LD      XHL,0x2DEB58
  20EB6D  1d 26 72 20              CALL    dyn_207226
  20EB71  30 0c 00                 LD      WA,0xC
  20EB74  43 60 e6 2d 00           LD      XHL,0x2DE660
  20EB79  d9 a8                    LD      BC,0
  20EB7B  da a8                    LD      DE,0
  20EB7D  1d 51 6b 20              CALL    dyn_206B51
  20EB81  f1 5b 58 00 00           LDB     (0x585B),0
  20EB86  0e                       RET

  ; ---- 0xc2 bytes not traced ----

dyn_20EC49:
  20EC49  d8 a8                    LD      WA,0
  20EC4B  23 00                    LD      C,0
  20EC4D  25 00                    LD      E,0
  20EC4F  22 20                    LD      B,0x20
  20EC51  24 20                    LD      D,0x20
  20EC53  1d 68 67 20              CALL    dyn_206768
  20EC57  0e                       RET

dyn_20EC58:
  20EC58  d8 a8                    LD      WA,0
  20EC5A  23 00                    LD      C,0
  20EC5C  25 20                    LD      E,0x20
  20EC5E  22 20                    LD      B,0x20
  20EC60  24 20                    LD      D,0x20
  20EC62  1d 68 67 20              CALL    dyn_206768
  20EC66  0e                       RET

  ; ---- 0xdf bytes not traced ----

sub_20ED46:
  20ED46  21 00                    LD      A,0
  20ED48  23 07                    LD      C,7
  20ED4A  43 3c f6 2d 00           LD      XHL,0x2DF63C
  20ED4F  1d 9e 6d 20              CALL    sub_206D9E
  20ED53  21 10                    LD      A,0x10
  20ED55  23 07                    LD      C,7
  20ED57  43 3c f6 2d 00           LD      XHL,0x2DF63C
  20ED5C  1d 9e 6d 20              CALL    sub_206D9E
  20ED60  21 20                    LD      A,0x20
  20ED62  23 07                    LD      C,7
  20ED64  43 3c f6 2d 00           LD      XHL,0x2DF63C
  20ED69  1d 9e 6d 20              CALL    sub_206D9E
  20ED6D  21 00                    LD      A,0
  20ED6F  23 02                    LD      C,2
  20ED71  43 27 e0 2d 00           LD      XHL,0x2DE027
  20ED76  1d cd 6d 20              CALL    sub_206DCD
  20ED7A  21 02                    LD      A,2
  20ED7C  23 02                    LD      C,2
  20ED7E  43 27 e0 2d 00           LD      XHL,0x2DE027
  20ED83  1d cd 6d 20              CALL    sub_206DCD
  20ED87  21 04                    LD      A,4
  20ED89  23 02                    LD      C,2
  20ED8B  43 27 e0 2d 00           LD      XHL,0x2DE027
  20ED90  1d cd 6d 20              CALL    sub_206DCD
  20ED94  30 2c 01                 LD      WA,0x12C
  20ED97  43 62 ff 2d 00           LD      XHL,0x2DFF62
  20ED9C  1d 26 72 20              CALL    dyn_207226
  20EDA0  30 7c 01                 LD      WA,0x17C
  20EDA3  43 0a 3c 2e 00           LD      XHL,0x2E3C0A
  20EDA8  1d 26 72 20              CALL    dyn_207226
  20EDAC  f1 5b 58 00 00           LDB     (0x585B),0
  20EDB1  0e                       RET

  ; ---- 0x221 bytes not traced ----

dyn_20EFD3:
  20EFD3  f1 5b 58 00 81           LDB     (0x585B),0x81
  20EFD8  f1 e2 5c 00 00           LDB     (0x5CE2),0
  20EFDD  1e 69 fc                 CALR    dyn_20EC49
  20EFE0  1e 75 fc                 CALR    dyn_20EC58
  20EFE3  e8 ac                    LD      XWA,4
  20EFE5  1d 59 77 20              CALL    dyn_207759
  20EFE9  be 08 02 f4 ef           LDW     (XIZ+8),0xEFF4
  20EFEE  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20EFF3  0e                       RET

dyn_20EFF4:
  20EFF4  30 24 00                 LD      WA,0x24
  20EFF7  1d 6a 77 20              CALL    dyn_20776A
  20EFFB  30 0c 00                 LD      WA,0xC
  20EFFE  33 2e 00                 LD      HL,0x2E
  20F001  d9 a8                    LD      BC,0
  20F003  da a8                    LD      DE,0
  20F005  1d ba 03 21              CALL    dyn_2103BA
  20F009  21 20                    LD      A,0x20
  20F00B  23 01                    LD      C,1
  20F00D  43 3d 5c 22 00           LD      XHL,0x225C3D
  20F012  1d 9e 6d 20              CALL    sub_206D9E
  20F016  21 04                    LD      A,4
  20F018  23 01                    LD      C,1
  20F01A  43 45 5c 22 00           LD      XHL,0x225C45
  20F01F  1d cd 6d 20              CALL    sub_206DCD
  20F023  f1 5b 58 00 00           LDB     (0x585B),0
  20F028  43 28 f6 20 00           LD      XHL,0x20F628
  20F02D  1d 24 63 20              CALL    dyn_206324
  20F031  42 49 5c 22 00           LD      XDE,0x225C49
  20F036  bb 0e 62                 LD      (XHL+0xE),XDE
  20F039  40 39 f0 20 00           LD      XWA,0x20F039
  20F03E  be 08 60                 LD      (XIZ+8),XWA
  20F041  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F045  b0 fe                    RET     NZ
  20F047  43 2b e2 20 00           LD      XHL,0x20E22B
  20F04C  1d 24 63 20              CALL    dyn_206324
  20F050  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20F055  bb 12 00 00              LDB     (XHL+0x12),0
  20F059  bb 14 00 81              LDB     (XHL+0x14),0x81
  20F05D  40 5d f0 20 00           LD      XWA,0x20F05D
  20F062  be 08 60                 LD      (XIZ+8),XWA
  20F065  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F069  b0 fe                    RET     NZ
  20F06B  1e ea fb                 CALR    dyn_20EC58
  20F06E  30 0c 00                 LD      WA,0xC
  20F071  33 3c 00                 LD      HL,0x3C
  20F074  d9 a8                    LD      BC,0
  20F076  da a8                    LD      DE,0
  20F078  1d ba 03 21              CALL    dyn_2103BA
  20F07C  43 2b e2 20 00           LD      XHL,0x20E22B
  20F081  1d 24 63 20              CALL    dyn_206324
  20F085  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20F08A  bb 12 00 81              LDB     (XHL+0x12),0x81
  20F08E  bb 14 00 00              LDB     (XHL+0x14),0
  20F092  40 92 f0 20 00           LD      XWA,0x20F092
  20F097  be 08 60                 LD      (XIZ+8),XWA
  20F09A  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F09E  b0 fe                    RET     NZ
  20F0A0  43 d4 e1 20 00           LD      XHL,0x20E1D4
  20F0A5  1d 24 63 20              CALL    dyn_206324
  20F0A9  bb 0e 02 28 00           LDW     (XHL+0xE),0x28
  20F0AE  40 ae f0 20 00           LD      XWA,0x20F0AE
  20F0B3  be 08 60                 LD      (XIZ+8),XWA
  20F0B6  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F0BA  b0 fe                    RET     NZ
  20F0BC  43 2b e2 20 00           LD      XHL,0x20E22B
  20F0C1  1d 24 63 20              CALL    dyn_206324
  20F0C5  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20F0CA  bb 12 00 00              LDB     (XHL+0x12),0
  20F0CE  bb 14 00 d8              LDB     (XHL+0x14),0xD8
  20F0D2  c1 c6 5b 21              LD      A,(0x5BC6)
  20F0D6  c9 cc 10                 AND     A,0x10
  20F0D9  6e 04                    JR      NZ,0x20F0DF
  20F0DB  bb 14 00 b0              LDB     (XHL+0x14),0xB0
  20F0DF  40 df f0 20 00           LD      XWA,0x20F0DF
  20F0E4  be 08 60                 LD      (XIZ+8),XWA
  20F0E7  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F0EB  b0 fe                    RET     NZ
  20F0ED  21 20                    LD      A,0x20
  20F0EF  23 01                    LD      C,1
  20F0F1  43 3d 5c 22 00           LD      XHL,0x225C3D
  20F0F6  1e ee f0                 CALR    dyn_20E1E7
  20F0F9  21 04                    LD      A,4
  20F0FB  23 01                    LD      C,1
  20F0FD  43 45 5c 22 00           LD      XHL,0x225C45
  20F102  1e 04 f1                 CALR    dyn_20E209
  20F105  43 28 f6 20 00           LD      XHL,0x20F628
  20F10A  1d 24 63 20              CALL    dyn_206324
  20F10E  42 62 5e 22 00           LD      XDE,0x225E62
  20F113  bb 0e 62                 LD      (XHL+0xE),XDE
  20F116  40 16 f1 20 00           LD      XWA,0x20F116
  20F11B  be 08 60                 LD      (XIZ+8),XWA
  20F11E  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F122  b0 fe                    RET     NZ
  20F124  43 2b e2 20 00           LD      XHL,0x20E22B
  20F129  1d 24 63 20              CALL    dyn_206324
  20F12D  bb 0e 02 20 00           LDW     (XHL+0xE),0x20
  20F132  bb 12 00 d8              LDB     (XHL+0x12),0xD8
  20F136  c1 c6 5b 21              LD      A,(0x5BC6)
  20F13A  c9 cc 10                 AND     A,0x10
  20F13D  6e 04                    JR      NZ,0x20F143
  20F13F  bb 12 00 b0              LDB     (XHL+0x12),0xB0
  20F143  bb 14 00 81              LDB     (XHL+0x14),0x81
  20F147  40 47 f1 20 00           LD      XWA,0x20F147
  20F14C  be 08 60                 LD      (XIZ+8),XWA
  20F14F  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F153  b0 fe                    RET     NZ
  20F155  f1 e2 5c 00 01           LDB     (0x5CE2),1
  20F15A  f1 4b 58 00 00           LDB     (0x584B),0
  20F15F  f1 4d 58 00 00           LDB     (0x584D),0
  20F164  f1 53 58 00 00           LDB     (0x5853),0
  20F169  f1 55 58 00 00           LDB     (0x5855),0
  20F16E  db a8                    LD      HL,0
  20F170  1d 2e 61 20              CALL    dyn_20612E
  20F174  1d 69 63 20              CALL    dyn_206369
  20F178  0e                       RET

  ; ---- 0x4af bytes not traced ----

dyn_20F628:
  20F628  1e 2d f6                 CALR    dyn_20EC58
  20F62B  f1 55 58 00 00           LDB     (0x5855),0
  20F630  42 13 50 00 00           LD      XDE,0x5013
  20F635  22 06                    LD      B,6
  20F637  30 6c 01                 LD      WA,0x16C
  20F63A  82 27                    LD      L,(XDE)
  20F63C  ca 04                    PUSH    B
  20F63E  3a                       PUSH    XDE
  20F63F  28                       PUSH    WA
  20F640  1d 93 70 20              CALL    dyn_207093
  20F644  48                       POP     WA
  20F645  5a                       POP     XDE
  20F646  ca 05                    POP     B
  20F648  ea 61                    INC     1,XDE
  20F64A  d8 62                    INC     2,WA
  20F64C  ca 1c eb                 DJNZ    B,0x20F63A
  20F64F  42 2f 50 00 00           LD      XDE,0x502F
  20F654  22 06                    LD      B,6
  20F656  30 73 01                 LD      WA,0x173
  20F659  82 27                    LD      L,(XDE)
  20F65B  ca 04                    PUSH    B
  20F65D  3a                       PUSH    XDE
  20F65E  28                       PUSH    WA
  20F65F  1d 93 70 20              CALL    dyn_207093
  20F663  48                       POP     WA
  20F664  5a                       POP     XDE
  20F665  ca 05                    POP     B
  20F667  ea 61                    INC     1,XDE
  20F669  d8 62                    INC     2,WA
  20F66B  ca 1c eb                 DJNZ    B,0x20F659
  20F66E  30 86 01                 LD      WA,0x186
  20F671  be 18 50                 LD      (XIZ+0x18),WA
  20F674  be 12 00 00              LDB     (XIZ+0x12),0
  20F678  be 14 02 05 00           LDW     (XIZ+0x14),5
  20F67D  9e 14 20                 LD      WA,(XIZ+0x14)
  20F680  be 16 50                 LD      (XIZ+0x16),WA
  20F683  43 e0 f6 20 00           LD      XHL,0x20F6E0
  20F688  1d 24 63 20              CALL    dyn_206324
  20F68C  be 08 02 ab f6           LDW     (XIZ+8),0xF6AB
  20F691  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20F696  42 f8 5d 00 00           LD      XDE,0x5DF8
  20F69B  31 00 01                 LD      BC,0x100
  20F69E  e9 12                    EXTZ    XBC
  20F6A0  f5 e9 02 ff ff           LDW     (XDE+),0xFFFF
  20F6A5  d9 69                    DEC     1,BC
  20F6A7  d9 d8                    CP      BC,0
  20F6A9  6e f5                    JR      NZ,0x20F6A0
  20F6AB  9e 0c 3f 00 00           CPW     (XIZ+0xC),0
  20F6B0  f2 69 63 20 d6           JP      Z,dyn_206369
  20F6B5  c1 df 5c 21              LD      A,(0x5CDF)
  20F6B9  c9 cc 20                 AND     A,0x20
  20F6BC  66 0c                    JR      Z,dyn_20F6CA
  20F6BE  1e 97 f5                 CALR    dyn_20EC58
  20F6C1  1d 6d 63 20              CALL    dyn_20636D
  20F6C5  1d 69 63 20              CALL    dyn_206369
  20F6C9  0e                       RET

dyn_20F6CA:
  20F6CA  9e 16 69                 DECW    1,(XIZ+0x16)
  20F6CD  b0 fe                    RET     NZ
  20F6CF  9e 14 20                 LD      WA,(XIZ+0x14)
  20F6D2  be 16 50                 LD      (XIZ+0x16),WA
  20F6D5  8e 12 21                 LD      A,(XIZ+0x12)
  20F6D8  f1 55 58 41              LD      (0x5855),A
  20F6DC  8e 12 61                 INCB    1,(XIZ+0x12)
  20F6DF  0e                       RET

dyn_20F6E0:
  20F6E0  9d 14 20                 LD      WA,(XIY+0x14)
  20F6E3  9d 16 f8                 CP      (XIY+0x16),WA
  20F6E6  b0 fe                    RET     NZ
  20F6E8  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20F6ED  8d 12 21                 LD      A,(XIY+0x12)
  20F6F0  c9 cc 07                 AND     A,7
  20F6F3  b0 fe                    RET     NZ
  20F6F5  e8 a8                    LD      XWA,0
  20F6F7  8d 12 21                 LD      A,(XIY+0x12)
  20F6FA  c9 ef 03                 SRL     3,A
  20F6FD  c9 c8 13                 ADD     A,0x13
  20F700  c9 cc 1f                 AND     A,0x1F
  20F703  e8 ee 06                 SLL     6,XWA
  20F706  e8 c8 00 98 00 00        ADD     XWA,0x9800
  20F70C  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20F711  ad 0e 23                 LD      XHL,(XIY+0xE)
  20F714  83 23                    LD      C,(XHL)
  20F716  cb cf fe                 CP      C,0xFE
  20F719  66 39                    JR      Z,0x20F754
  20F71B  cb cf ff                 CP      C,0xFF
  20F71E  76 87 00                 JRL     Z,loc_20F7A8
  20F721  cb cf fc                 CP      C,0xFC
  20F724  6e 0a                    JR      NZ,dyn_20F730
  20F726  32 6c 01                 LD      DE,0x16C
  20F729  41 13 50 00 00           LD      XBC,0x5013
  20F72E  68 0d                    JR      loc_20F73D

dyn_20F730:
  20F730  cb cf fb                 CP      C,0xFB
  20F733  6e 18                    JR      NZ,dyn_20F74D
  20F735  32 73 01                 LD      DE,0x173
  20F738  41 2f 50 00 00           LD      XBC,0x502F

loc_20F73D:
  20F73D  f5 e1 52                 LD      (XWA+),DE
  20F740  da 62                    INC     2,DE
  20F742  e9 61                    INC     1,XBC
  20F744  81 3f ff                 CPB     (XBC),0xFF
  20F747  6e f4                    JR      NZ,loc_20F73D
  20F749  eb 61                    INC     1,XHL
  20F74B  68 c7                    JR      0x20F714

dyn_20F74D:
  20F74D  c5 ec 23                 LD      C,(XHL+)
  20F750  cb d8                    CP      C,0
  20F752  6e 07                    JR      NZ,dyn_20F75B
  20F754  f5 e1 02 00 00           LDW     (XWA+),0
  20F759  68 3c                    JR      0x20F797

dyn_20F75B:
  20F75B  d9 13                    EXTS    BC
  20F75D  d9 8a                    LD      DE,BC
  20F75F  ea 12                    EXTZ    XDE
  20F761  ea ee 01                 SLL     1,XDE
  20F764  ea c8 f8 5d 00 00        ADD     XDE,0x5DF8
  20F76A  3a                       PUSH    XDE
  20F76B  92 22                    LD      DE,(XDE)
  20F76D  da cf ff ff              CP      DE,0xFFFF
  20F771  66 06                    JR      Z,dyn_20F779
  20F773  f5 e1 52                 LD      (XWA+),DE
  20F776  5a                       POP     XDE
  20F777  68 1e                    JR      0x20F797

dyn_20F779:
  20F779  5a                       POP     XDE
  20F77A  3b                       PUSH    XHL
  20F77B  9d 18 23                 LD      HL,(XIY+0x18)
  20F77E  b2 53                    LD      (XDE),HL
  20F780  5b                       POP     XHL
  20F781  38                       PUSH    XWA
  20F782  3b                       PUSH    XHL
  20F783  cb 8f                    LD      L,C
  20F785  9d 18 20                 LD      WA,(XIY+0x18)
  20F788  1d 93 70 20              CALL    dyn_207093
  20F78C  5b                       POP     XHL
  20F78D  58                       POP     XWA
  20F78E  9d 18 21                 LD      BC,(XIY+0x18)
  20F791  f5 e1 51                 LD      (XWA+),BC
  20F794  9d 18 61                 INCW    1,(XIY+0x18)
  20F797  9e 0e 61                 INCW    1,(XIZ+0xE)
  20F79A  9e 0e 3f 14 00           CPW     (XIZ+0xE),0x14
  20F79F  7e 72 ff                 JRL     NZ,0x20F714
  20F7A2  eb 61                    INC     1,XHL
  20F7A4  bd 0e 63                 LD      (XIY+0xE),XHL
  20F7A7  0e                       RET

loc_20F7A8:
  20F7A8  1d 69 63 20              CALL    dyn_206369
  20F7AC  0e                       RET

dyn_20F7AD:
  20F7AD  30 14 00                 LD      WA,0x14
  20F7B0  1d 59 77 20              CALL    dyn_207759
  20F7B4  30 35 00                 LD      WA,0x35
  20F7B7  1d 6a 77 20              CALL    dyn_20776A
  20F7BB  1d 49 ec 20              CALL    dyn_20EC49
  20F7BF  1d 58 ec 20              CALL    dyn_20EC58
  20F7C3  1e 85 05                 CALR    dyn_20FD4B
  20F7C6  43 36 ff 20 00           LD      XHL,0x20FF36
  20F7CB  1d 24 63 20              CALL    dyn_206324
  20F7CF  40 cf f7 20 00           LD      XWA,0x20F7CF
  20F7D4  be 08 60                 LD      (XIZ+8),XWA
  20F7D7  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F7DB  b0 fe                    RET     NZ
  20F7DD  9e 10 3f 00 00           CPW     (XIZ+0x10),0
  20F7E2  6e 0f                    JR      NZ,dyn_20F7F3
  20F7E4  f1 21 50 00 00           LDB     (0x5021),0
  20F7E9  f1 3d 50 00 00           LDB     (0x503D),0
  20F7EE  1d 69 63 20              CALL    dyn_206369
  20F7F2  0e                       RET

dyn_20F7F3:
  20F7F3  1d 49 ec 20              CALL    dyn_20EC49
  20F7F7  1d 58 ec 20              CALL    dyn_20EC58
  20F7FB  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20F800  1e 84 04                 CALR    dyn_20FC87
  20F803  43 da f8 20 00           LD      XHL,0x20F8DA
  20F808  1d 24 63 20              CALL    dyn_206324
  20F80C  40 0c f8 20 00           LD      XWA,0x20F80C
  20F811  be 08 60                 LD      (XIZ+8),XWA
  20F814  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F818  b0 fe                    RET     NZ
  20F81A  9e 10 3f 00 00           CPW     (XIZ+0x10),0
  20F81F  6e 02                    JR      NZ,dyn_20F823
  20F821  68 8a                    JR      dyn_20F7AD

dyn_20F823:
  20F823  be 0e 02 01 00           LDW     (XIZ+0xE),1
  20F828  1e 5c 04                 CALR    dyn_20FC87
  20F82B  43 da f8 20 00           LD      XHL,0x20F8DA
  20F830  1d 24 63 20              CALL    dyn_206324
  20F834  40 34 f8 20 00           LD      XWA,0x20F834
  20F839  be 08 60                 LD      (XIZ+8),XWA
  20F83C  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F840  b0 fe                    RET     NZ
  20F842  9e 10 3f 00 00           CPW     (XIZ+0x10),0
  20F847  66 aa                    JR      Z,dyn_20F7F3
  20F849  1d 49 ec 20              CALL    dyn_20EC49
  20F84D  1d 58 ec 20              CALL    dyn_20EC58
  20F851  1e f7 04                 CALR    dyn_20FD4B
  20F854  43 fa fd 20 00           LD      XHL,0x20FDFA
  20F859  1d 24 63 20              CALL    dyn_206324
  20F85D  40 5d f8 20 00           LD      XWA,0x20F85D
  20F862  be 08 60                 LD      (XIZ+8),XWA
  20F865  8e 0c 3f 00              CPB     (XIZ+0xC),0
  20F869  b0 fe                    RET     NZ
  20F86B  9e 10 3f 00 00           CPW     (XIZ+0x10),0
  20F870  66 81                    JR      Z,dyn_20F7F3
  20F872  1d 69 63 20              CALL    dyn_206369
  20F876  0e                       RET

dyn_20F877:
  20F877  21 00                    LD      A,0
  20F879  1d 8a 74 20              CALL    sub_20748A
  20F87D  23 0b                    LD      C,0xB
  20F87F  25 01                    LD      E,1
  20F881  1d 8e 76 20              CALL    0x20768E
  20F885  9d 1a 23                 LD      HL,(XIY+0x1A)
  20F888  1d 99 76 20              CALL    dyn_207699
  20F88C  9d 1c 23                 LD      HL,(XIY+0x1C)
  20F88F  1d 99 76 20              CALL    dyn_207699
  20F893  9d 1e 23                 LD      HL,(XIY+0x1E)
  20F896  1d 99 76 20              CALL    dyn_207699
  20F89A  9d 20 23                 LD      HL,(XIY+0x20)
  20F89D  1d 99 76 20              CALL    dyn_207699
  20F8A1  9d 22 23                 LD      HL,(XIY+0x22)
  20F8A4  1d 99 76 20              CALL    dyn_207699
  20F8A8  9d 24 23                 LD      HL,(XIY+0x24)
  20F8AB  1d 99 76 20              CALL    dyn_207699
  20F8AF  9e 0e 61                 INCW    1,(XIZ+0xE)
  20F8B2  8e 0e 21                 LD      A,(XIZ+0xE)
  20F8B5  c9 cc 10                 AND     A,0x10
  20F8B8  66 1f                    JR      Z,0x20F8D9
  20F8BA  21 00                    LD      A,0
  20F8BC  1d 8a 74 20              CALL    sub_20748A
  20F8C0  8d 18 23                 LD      C,(XIY+0x18)
  20F8C3  cb de                    CP      C,6
  20F8C5  69 12                    JR      GE,0x20F8D9
  20F8C7  cb c8 0b                 ADD     C,0xB
  20F8CA  25 01                    LD      E,1
  20F8CC  1d 8e 76 20              CALL    0x20768E
  20F8D0  c2 11 6c 22 27           LD      L,(0x226C11)
  20F8D5  1d 99 76 20              CALL    dyn_207699
  20F8D9  0e                       RET

dyn_20F8DA:
  20F8DA  43 77 f8 20 00           LD      XHL,0x20F877
  20F8DF  1d 24 63 20              CALL    dyn_206324
  20F8E3  30 d8 00                 LD      WA,0xD8
  20F8E6  43 88 8d 2c 00           LD      XHL,0x2C8D88
  20F8EB  1d 26 72 20              CALL    dyn_207226
  20F8EF  21 01                    LD      A,1
  20F8F1  23 01                    LD      C,1
  20F8F3  43 6c 8d 2c 00           LD      XHL,0x2C8D6C
  20F8F8  1d 9e 6d 20              CALL    sub_206D9E
  20F8FC  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20F901  be 10 02 00 00           LDW     (XIZ+0x10),0
  20F906  be 12 02 00 00           LDW     (XIZ+0x12),0
  20F90B  be 14 02 01 00           LDW     (XIZ+0x14),1
  20F910  be 16 02 01 00           LDW     (XIZ+0x16),1
  20F915  be 18 02 00 00           LDW     (XIZ+0x18),0
  20F91A  be 1a 02 00 00           LDW     (XIZ+0x1A),0
  20F91F  be 1c 02 00 00           LDW     (XIZ+0x1C),0
  20F924  be 1e 02 00 00           LDW     (XIZ+0x1E),0
  20F929  be 20 02 00 00           LDW     (XIZ+0x20),0
  20F92E  be 22 02 00 00           LDW     (XIZ+0x22),0
  20F933  be 24 02 00 00           LDW     (XIZ+0x24),0
  20F938  be 26 02 10 00           LDW     (XIZ+0x26),0x10
  20F93D  be 28 02 00 00           LDW     (XIZ+0x28),0
  20F942  be 2a 02 00 00           LDW     (XIZ+0x2A),0
  20F947  42 13 50 00 00           LD      XDE,0x5013
  20F94C  c1 21 50 21              LD      A,(0x5021)
  20F950  9d 0e 3f 00 00           CPW     (XIY+0xE),0
  20F955  66 09                    JR      Z,0x20F960
  20F957  42 2f 50 00 00           LD      XDE,0x502F
  20F95C  c1 3d 50 21              LD      A,(0x503D)
  20F960  ee 8b                    LD      XHL,XIZ
  20F962  eb c8 1a 00 00 00        ADD     XHL,0x1A
  20F968  82 3f ff                 CPB     (XDE),0xFF
  20F96B  66 0d                    JR      Z,dyn_20F97A
  20F96D  9e 18 61                 INCW    1,(XIZ+0x18)
  20F970  d8 a8                    LD      WA,0
  20F972  c5 e8 21                 LD      A,(XDE+)
  20F975  f5 ed 50                 LD      (XHL+),WA
  20F978  68 ee                    JR      0x20F968

dyn_20F97A:
  20F97A  be 08 02 85 f9           LDW     (XIZ+8),0xF985
  20F97F  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20F984  0e                       RET

dyn_20F985:
  20F985  c1 de 5c 21              LD      A,(0x5CDE)
  20F989  8e 29 f1                 CP      A,(XIZ+0x29)
  20F98C  6e 21                    JR      NZ,dyn_20F9AF
  20F98E  9e 26 69                 DECW    1,(XIZ+0x26)
  20F991  9e 26 3f 00 00           CPW     (XIZ+0x26),0
  20F996  66 06                    JR      Z,dyn_20F99E
  20F998  be 28 00 00              LDB     (XIZ+0x28),0
  20F99C  68 24                    JR      0x20F9C2

dyn_20F99E:
  20F99E  c1 de 5c 21              LD      A,(0x5CDE)
  20F9A2  be 29 41                 LD      (XIZ+0x29),A
  20F9A5  be 28 41                 LD      (XIZ+0x28),A
  20F9A8  be 26 02 07 00           LDW     (XIZ+0x26),7
  20F9AD  68 13                    JR      0x20F9C2

dyn_20F9AF:
  20F9AF  be 26 02 10 00           LDW     (XIZ+0x26),0x10
  20F9B4  c1 df 5c 21              LD      A,(0x5CDF)
  20F9B8  be 28 41                 LD      (XIZ+0x28),A
  20F9BB  c1 de 5c 21              LD      A,(0x5CDE)
  20F9BF  be 29 41                 LD      (XIZ+0x29),A
  20F9C2  9e 16 3f 01 00           CPW     (XIZ+0x16),1
  20F9C7  7e 28 01                 JRL     NZ,dyn_20FAF2
  20F9CA  8e 28 21                 LD      A,(XIZ+0x28)
  20F9CD  c9 cc 04                 AND     A,4
  20F9D0  66 07                    JR      Z,0x20F9D9
  20F9D2  30 80 00                 LD      WA,0x80
  20F9D5  1d 6a 77 20              CALL    dyn_20776A
  20F9D9  8e 28 21                 LD      A,(XIZ+0x28)
  20F9DC  c9 cc 08                 AND     A,8
  20F9DF  66 07                    JR      Z,0x20F9E8
  20F9E1  30 80 00                 LD      WA,0x80
  20F9E4  1d 6a 77 20              CALL    dyn_20776A
  20F9E8  8e 28 21                 LD      A,(XIZ+0x28)
  20F9EB  c9 cc 01                 AND     A,1
  20F9EE  66 1c                    JR      Z,dyn_20FA0C
  20F9F0  30 80 00                 LD      WA,0x80
  20F9F3  1d 6a 77 20              CALL    dyn_20776A
  20F9F7  9e 14 69                 DECW    1,(XIZ+0x14)
  20F9FA  9e 14 3f ff ff           CPW     (XIZ+0x14),0xFFFF
  20F9FF  6e 0b                    JR      NZ,dyn_20FA0C
  20FA01  be 16 02 00 00           LDW     (XIZ+0x16),0
  20FA06  be 10 02 08 00           LDW     (XIZ+0x10),8
  20FA0B  0e                       RET

dyn_20FA0C:
  20FA0C  8e 28 21                 LD      A,(XIZ+0x28)
  20FA0F  c9 cc 02                 AND     A,2
  20FA12  66 1c                    JR      Z,dyn_20FA30
  20FA14  30 80 00                 LD      WA,0x80
  20FA17  1d 6a 77 20              CALL    dyn_20776A
  20FA1B  9e 14 61                 INCW    1,(XIZ+0x14)
  20FA1E  9e 14 3f 02 00           CPW     (XIZ+0x14),2
  20FA23  6e 0b                    JR      NZ,dyn_20FA30
  20FA25  be 16 02 00 00           LDW     (XIZ+0x16),0
  20FA2A  be 10 02 00 00           LDW     (XIZ+0x10),0
  20FA2F  0e                       RET

dyn_20FA30:
  20FA30  c1 df 5c 21              LD      A,(0x5CDF)
  20FA34  c9 cc 10                 AND     A,0x10
  20FA37  76 8c 00                 JRL     Z,dyn_20FAC6
  20FA3A  9e 14 20                 LD      WA,(XIZ+0x14)
  20FA3D  d8 d8                    CP      WA,0
  20FA3F  66 04                    JR      Z,0x20FA45
  20FA41  d8 d9                    CP      WA,1
  20FA43  66 14                    JR      Z,dyn_20FA59
  20FA45  30 82 00                 LD      WA,0x82
  20FA48  1d 6a 77 20              CALL    dyn_20776A
  20FA4C  bd 10 00 00              LDB     (XIY+0x10),0
  20FA50  1d 6d 63 20              CALL    dyn_20636D
  20FA54  1d 69 63 20              CALL    dyn_206369
  20FA58  0e                       RET

dyn_20FA59:
  20FA59  9e 18 21                 LD      BC,(XIZ+0x18)
  20FA5C  d9 d8                    CP      BC,0
  20FA5E  6e 09                    JR      NZ,dyn_20FA69
  20FA60  30 83 00                 LD      WA,0x83
  20FA63  1d 6a 77 20              CALL    dyn_20776A
  20FA67  68 5d                    JR      dyn_20FAC6

dyn_20FA69:
  20FA69  9e 1a 20                 LD      WA,(XIZ+0x1A)
  20FA6C  9e 1c 80                 ADD     WA,(XIZ+0x1C)
  20FA6F  9e 1e 80                 ADD     WA,(XIZ+0x1E)
  20FA72  9e 20 80                 ADD     WA,(XIZ+0x20)
  20FA75  9e 22 80                 ADD     WA,(XIZ+0x22)
  20FA78  9e 24 80                 ADD     WA,(XIZ+0x24)
  20FA7B  d8 d8                    CP      WA,0
  20FA7D  6e 09                    JR      NZ,dyn_20FA88
  20FA7F  30 83 00                 LD      WA,0x83
  20FA82  1d 6a 77 20              CALL    dyn_20776A
  20FA86  68 3e                    JR      dyn_20FAC6

dyn_20FA88:
  20FA88  30 81 00                 LD      WA,0x81
  20FA8B  1d 6a 77 20              CALL    dyn_20776A
  20FA8F  32 13 50                 LD      DE,0x5013
  20FA92  9d 0e 3f 00 00           CPW     (XIY+0xE),0
  20FA97  66 03                    JR      Z,0x20FA9C
  20FA99  32 2f 50                 LD      DE,0x502F
  20FA9C  30 81 00                 LD      WA,0x81
  20FA9F  1d 6a 77 20              CALL    dyn_20776A
  20FAA3  ea 12                    EXTZ    XDE
  20FAA5  33 1a 00                 LD      HL,0x1A
  20FAA8  eb 12                    EXTZ    XHL
  20FAAA  ee 83                    ADD     XHL,XIZ
  20FAAC  d5 ed 20                 LD      WA,(XHL+)
  20FAAF  f5 e8 41                 LD      (XDE+),A
  20FAB2  d9 1c f7                 DJNZ    BC,0x20FAAC
  20FAB5  b2 00 ff                 LDB     (XDE),0xFF
  20FAB8  1d 6d 63 20              CALL    dyn_20636D
  20FABC  1d 69 63 20              CALL    dyn_206369
  20FAC0  bd 10 02 01 00           LDW     (XIY+0x10),1
  20FAC5  0e                       RET

dyn_20FAC6:
  20FAC6  9e 2a 61                 INCW    1,(XIZ+0x2A)
  20FAC9  9e 2a 20                 LD      WA,(XIZ+0x2A)
  20FACC  d8 cc 10 00              AND     WA,0x10
  20FAD0  66 1f                    JR      Z,0x20FAF1
  20FAD2  d9 a8                    LD      BC,0
  20FAD4  9e 14 23                 LD      HL,(XIZ+0x14)
  20FAD7  eb 12                    EXTZ    XHL
  20FAD9  eb ee 01                 SLL     1,XHL
  20FADC  eb c8 12 6c 22 00        ADD     XHL,0x226C12
  20FAE2  93 22                    LD      DE,(XHL)
  20FAE4  30 04 3e                 LD      WA,0x3E04
  20FAE7  c7 e7 a9                 LD      QB,1
  20FAEA  c7 eb aa                 LD      QD,2
  20FAED  1d ff 6b 20              CALL    dyn_206BFF
  20FAF1  0e                       RET

dyn_20FAF2:
  20FAF2  8e 28 21                 LD      A,(XIZ+0x28)
  20FAF5  c9 cc 04                 AND     A,4
  20FAF8  66 16                    JR      Z,0x20FB10
  20FAFA  30 80 00                 LD      WA,0x80
  20FAFD  1d 6a 77 20              CALL    dyn_20776A
  20FB01  9e 0e 69                 DECW    1,(XIZ+0xE)
  20FB04  9e 0e 3f ff ff           CPW     (XIZ+0xE),0xFFFF
  20FB09  6e 05                    JR      NZ,0x20FB10
  20FB0B  be 0e 02 09 00           LDW     (XIZ+0xE),9
  20FB10  8e 28 21                 LD      A,(XIZ+0x28)
  20FB13  c9 cc 08                 AND     A,8
  20FB16  66 16                    JR      Z,0x20FB2E
  20FB18  30 80 00                 LD      WA,0x80
  20FB1B  1d 6a 77 20              CALL    dyn_20776A
  20FB1F  9e 0e 61                 INCW    1,(XIZ+0xE)
  20FB22  9e 0e 3f 0a 00           CPW     (XIZ+0xE),0xA
  20FB27  6e 05                    JR      NZ,0x20FB2E
  20FB29  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20FB2E  8e 28 21                 LD      A,(XIZ+0x28)
  20FB31  c9 cc 02                 AND     A,2
  20FB34  66 1c                    JR      Z,dyn_20FB52
  20FB36  30 80 00                 LD      WA,0x80
  20FB39  1d 6a 77 20              CALL    dyn_20776A
  20FB3D  9e 10 61                 INCW    1,(XIZ+0x10)
  20FB40  9e 10 3f 09 00           CPW     (XIZ+0x10),9
  20FB45  61 0b                    JR      LT,dyn_20FB52
  20FB47  be 16 02 01 00           LDW     (XIZ+0x16),1
  20FB4C  be 14 02 01 00           LDW     (XIZ+0x14),1
  20FB51  0e                       RET

dyn_20FB52:
  20FB52  8e 28 21                 LD      A,(XIZ+0x28)
  20FB55  c9 cc 01                 AND     A,1
  20FB58  66 1c                    JR      Z,dyn_20FB76
  20FB5A  30 80 00                 LD      WA,0x80
  20FB5D  1d 6a 77 20              CALL    dyn_20776A
  20FB61  9e 10 69                 DECW    1,(XIZ+0x10)
  20FB64  9e 10 3f ff ff           CPW     (XIZ+0x10),0xFFFF
  20FB69  6a 0b                    JR      GT,dyn_20FB76
  20FB6B  be 16 02 01 00           LDW     (XIZ+0x16),1
  20FB70  be 14 02 01 00           LDW     (XIZ+0x14),1
  20FB75  0e                       RET

dyn_20FB76:
  20FB76  c1 df 5c 21              LD      A,(0x5CDF)
  20FB7A  c9 cc 10                 AND     A,0x10
  20FB7D  66 6b                    JR      Z,0x20FBEA
  20FB7F  9e 18 20                 LD      WA,(XIZ+0x18)
  20FB82  d8 de                    CP      WA,6
  20FB84  69 09                    JR      GE,loc_20FB8F
  20FB86  30 81 00                 LD      WA,0x81
  20FB89  1d 6a 77 20              CALL    dyn_20776A
  20FB8D  68 11                    JR      0x20FBA0

loc_20FB8F:
  20FB8F  be 14 02 01 00           LDW     (XIZ+0x14),1
  20FB94  be 16 02 01 00           LDW     (XIZ+0x16),1
  20FB99  30 83 00                 LD      WA,0x83
  20FB9C  1d 6a 77 20              CALL    dyn_20776A
  20FBA0  9e 10 21                 LD      BC,(XIZ+0x10)
  20FBA3  d9 08 0a 00              MUL     XBC,0xA
  20FBA7  9e 0e 22                 LD      DE,(XIZ+0xE)
  20FBAA  da 61                    INC     1,DE
  20FBAC  da 81                    ADD     BC,DE
  20FBAE  9e 12 3f 00 00           CPW     (XIZ+0x12),0
  20FBB3  66 0a                    JR      Z,dyn_20FBBF
  20FBB5  e9 c8 72 6d 22 00        ADD     XBC,0x226D72
  20FBBB  81 21                    LD      A,(XBC)
  20FBBD  68 08                    JR      0x20FBC7

dyn_20FBBF:
  20FBBF  e9 c8 72 6d 22 00        ADD     XBC,0x226D72
  20FBC5  81 21                    LD      A,(XBC)
  20FBC7  9e 18 23                 LD      HL,(XIZ+0x18)
  20FBCA  eb 12                    EXTZ    XHL
  20FBCC  db ee 01                 SLL     1,HL
  20FBCF  db c8 1a 00              ADD     HL,0x1A
  20FBD3  ee 83                    ADD     XHL,XIZ
  20FBD5  d8 12                    EXTZ    WA
  20FBD7  b3 50                    LD      (XHL),WA
  20FBD9  9e 18 61                 INCW    1,(XIZ+0x18)
  20FBDC  9e 18 3f 07 00           CPW     (XIZ+0x18),7
  20FBE1  66 02                    JR      Z,loc_20FBE5
  20FBE3  68 56                    JR      0x20FC3B

loc_20FBE5:
  20FBE5  be 18 02 06 00           LDW     (XIZ+0x18),6
  20FBEA  c1 df 5c 21              LD      A,(0x5CDF)
  20FBEE  c9 cc 20                 AND     A,0x20
  20FBF1  66 48                    JR      Z,0x20FC3B
  20FBF3  30 82 00                 LD      WA,0x82
  20FBF6  1d 6a 77 20              CALL    dyn_20776A
  20FBFA  9e 18 23                 LD      HL,(XIZ+0x18)
  20FBFD  eb 12                    EXTZ    XHL
  20FBFF  db ee 01                 SLL     1,HL
  20FC02  db c8 1a 00              ADD     HL,0x1A
  20FC06  ee 83                    ADD     XHL,XIZ
  20FC08  b3 02 00 00              LDW     (XHL),0
  20FC0C  9e 18 69                 DECW    1,(XIZ+0x18)
  20FC0F  9e 18 3f ff ff           CPW     (XIZ+0x18),0xFFFF
  20FC14  6e 0c                    JR      NZ,0x20FC22
  20FC16  30 83 00                 LD      WA,0x83
  20FC19  1d 6a 77 20              CALL    dyn_20776A
  20FC1D  be 18 02 00 00           LDW     (XIZ+0x18),0
  20FC22  30 82 00                 LD      WA,0x82
  20FC25  1d 6a 77 20              CALL    dyn_20776A
  20FC29  9e 18 23                 LD      HL,(XIZ+0x18)
  20FC2C  eb 12                    EXTZ    XHL
  20FC2E  db ee 01                 SLL     1,HL
  20FC31  db c8 1a 00              ADD     HL,0x1A
  20FC35  ee 83                    ADD     XHL,XIZ
  20FC37  b3 02 00 00              LDW     (XHL),0
  20FC3B  9e 0e 21                 LD      BC,(XIZ+0xE)
  20FC3E  9e 10 22                 LD      DE,(XIZ+0x10)
  20FC41  d9 08 08 00              MUL     XBC,8
  20FC45  da 08 08 00              MUL     XDE,8
  20FC49  d9 c8 04 00              ADD     BC,4
  20FC4D  da c8 24 00              ADD     DE,0x24
  20FC51  43 74 8d 2c 00           LD      XHL,0x2C8D74
  20FC56  9e 2a 61                 INCW    1,(XIZ+0x2A)
  20FC59  9e 2a 20                 LD      WA,(XIZ+0x2A)
  20FC5C  d8 cc 10 00              AND     WA,0x10
  20FC60  66 05                    JR      Z,0x20FC67
  20FC62  43 7e 8d 2c 00           LD      XHL,0x2C8D7E
  20FC67  30 d8 00                 LD      WA,0xD8
  20FC6A  1d c8 69 20              CALL    dyn_2069C8
  20FC6E  0e                       RET

  ; ---- 0x18 bytes not traced ----

dyn_20FC87:
  20FC87  21 00                    LD      A,0
  20FC89  23 14                    LD      C,0x14
  20FC8B  25 04                    LD      E,4
  20FC8D  33 0c 00                 LD      HL,0xC
  20FC90  1d 94 74 20              CALL    dyn_207494
  20FC94  21 00                    LD      A,0
  20FC96  1d 8a 74 20              CALL    sub_20748A
  20FC9A  23 00                    LD      C,0
  20FC9C  25 00                    LD      E,0
  20FC9E  1d c4 74 20              CALL    0x2074C4
  20FCA2  43 27 6d 22 00           LD      XHL,0x226D27
  20FCA7  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20FCAC  66 05                    JR      Z,0x20FCB3
  20FCAE  43 37 6d 22 00           LD      XHL,0x226D37
  20FCB3  1d f7 76 20              CALL    0x2076F7
  20FCB7  c1 21 50 21              LD      A,(0x5021)
  20FCBB  d8 12                    EXTZ    WA
  20FCBD  d8 8b                    LD      HL,WA
  20FCBF  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20FCC4  66 08                    JR      Z,0x20FCCE
  20FCC6  c1 3d 50 21              LD      A,(0x503D)
  20FCCA  d8 12                    EXTZ    WA
  20FCCC  d8 8b                    LD      HL,WA
  20FCCE  db c8 0a 00              ADD     HL,0xA
  20FCD2  30 da 00                 LD      WA,0xDA
  20FCD5  31 0d 00                 LD      BC,0xD
  20FCD8  da ac                    LD      DE,4
  20FCDA  1d 80 03 21              CALL    dyn_210380
  20FCDE  21 01                    LD      A,1
  20FCE0  23 0a                    LD      C,0xA
  20FCE2  25 09                    LD      E,9
  20FCE4  33 30 00                 LD      HL,0x30
  20FCE7  1d aa 74 20              CALL    dyn_2074AA
  20FCEB  21 01                    LD      A,1
  20FCED  1d 8a 74 20              CALL    sub_20748A
  20FCF1  23 01                    LD      C,1
  20FCF3  25 05                    LD      E,5
  20FCF5  1d c4 74 20              CALL    0x2074C4
  20FCF9  43 72 6d 22 00           LD      XHL,0x226D72
  20FCFE  1d f7 76 20              CALL    0x2076F7
  20FD02  21 03                    LD      A,3
  20FD04  23 06                    LD      C,6
  20FD06  25 02                    LD      E,2
  20FD08  33 ba 00                 LD      HL,0xBA
  20FD0B  1d aa 74 20              CALL    dyn_2074AA
  20FD0F  21 03                    LD      A,3
  20FD11  1d 8a 74 20              CALL    sub_20748A
  20FD15  23 01                    LD      C,1
  20FD17  25 0f                    LD      E,0xF
  20FD19  1d c4 74 20              CALL    0x2074C4
  20FD1D  43 4a 6d 22 00           LD      XHL,0x226D4A
  20FD22  1d f7 76 20              CALL    0x2076F7
  20FD26  21 02                    LD      A,2
  20FD28  23 0d                    LD      C,0xD
  20FD2A  25 05                    LD      E,5
  20FD2C  33 8a 00                 LD      HL,0x8A
  20FD2F  1d 94 74 20              CALL    dyn_207494
  20FD33  21 02                    LD      A,2
  20FD35  1d 8a 74 20              CALL    sub_20748A
  20FD39  23 07                    LD      C,7
  20FD3B  25 0e                    LD      E,0xE
  20FD3D  1d c4 74 20              CALL    0x2074C4
  20FD41  43 54 6d 22 00           LD      XHL,0x226D54
  20FD46  1d f7 76 20              CALL    0x2076F7
  20FD4A  0e                       RET

dyn_20FD4B:
  20FD4B  21 05                    LD      A,5
  20FD4D  23 09                    LD      C,9
  20FD4F  25 01                    LD      E,1
  20FD51  33 d3 00                 LD      HL,0xD3
  20FD54  1d aa 74 20              CALL    dyn_2074AA
  20FD58  21 05                    LD      A,5
  20FD5A  1d 8a 74 20              CALL    sub_20748A
  20FD5E  23 06                    LD      C,6
  20FD60  25 0d                    LD      E,0xD
  20FD62  1d c4 74 20              CALL    0x2074C4
  20FD66  21 03                    LD      A,3
  20FD68  23 07                    LD      C,7
  20FD6A  25 01                    LD      E,1
  20FD6C  33 c5 00                 LD      HL,0xC5
  20FD6F  1d aa 74 20              CALL    dyn_2074AA
  20FD73  21 03                    LD      A,3
  20FD75  1d 8a 74 20              CALL    sub_20748A
  20FD79  23 01                    LD      C,1
  20FD7B  25 00                    LD      E,0
  20FD7D  1d c4 74 20              CALL    0x2074C4
  20FD81  21 04                    LD      A,4
  20FD83  23 07                    LD      C,7
  20FD85  25 01                    LD      E,1
  20FD87  33 cc 00                 LD      HL,0xCC
  20FD8A  1d aa 74 20              CALL    dyn_2074AA
  20FD8E  21 04                    LD      A,4
  20FD90  1d 8a 74 20              CALL    sub_20748A
  20FD94  23 0b                    LD      C,0xB
  20FD96  25 00                    LD      E,0
  20FD98  1d c4 74 20              CALL    0x2074C4
  20FD9C  21 02                    LD      A,2
  20FD9E  23 14                    LD      C,0x14
  20FDA0  25 05                    LD      E,5
  20FDA2  33 84 00                 LD      HL,0x84
  20FDA5  1d 94 74 20              CALL    dyn_207494
  20FDA9  21 02                    LD      A,2
  20FDAB  1d 8a 74 20              CALL    sub_20748A
  20FDAF  23 00                    LD      C,0
  20FDB1  25 0e                    LD      E,0xE
  20FDB3  1d c4 74 20              CALL    0x2074C4
  20FDB7  21 00                    LD      A,0
  20FDB9  23 08                    LD      C,8
  20FDBB  25 0c                    LD      E,0xC
  20FDBD  33 0c 00                 LD      HL,0xC
  20FDC0  1d 94 74 20              CALL    dyn_207494
  20FDC4  21 00                    LD      A,0
  20FDC6  1d 8a 74 20              CALL    sub_20748A
  20FDCA  23 01                    LD      C,1
  20FDCC  25 01                    LD      E,1
  20FDCE  1d c4 74 20              CALL    0x2074C4
  20FDD2  21 01                    LD      A,1
  20FDD4  23 08                    LD      C,8
  20FDD6  25 0c                    LD      E,0xC
  20FDD8  33 48 00                 LD      HL,0x48
  20FDDB  1d 94 74 20              CALL    dyn_207494
  20FDDF  21 01                    LD      A,1
  20FDE1  1d 8a 74 20              CALL    sub_20748A
  20FDE5  23 0b                    LD      C,0xB
  20FDE7  25 21                    LD      E,0x21
  20FDE9  1d c4 74 20              CALL    0x2074C4
  20FDED  30 dc 00                 LD      WA,0xDC
  20FDF0  43 1b 86 2c 00           LD      XHL,0x2C861B
  20FDF5  1d 2b 69 20              CALL    sub_20692B
  20FDF9  0e                       RET

dyn_20FDFA:
  20FDFA  43 5b 6c 22 00           LD      XHL,0x226C5B
  20FDFF  21 02                    LD      A,2
  20FE01  1d 8a 74 20              CALL    sub_20748A
  20FE05  23 00                    LD      C,0
  20FE07  25 00                    LD      E,0
  20FE09  1d 8e 76 20              CALL    0x20768E
  20FE0D  1d f7 76 20              CALL    0x2076F7
  20FE11  43 13 50 00 00           LD      XHL,0x5013
  20FE16  21 03                    LD      A,3
  20FE18  1d 8a 74 20              CALL    sub_20748A
  20FE1C  23 00                    LD      C,0
  20FE1E  25 00                    LD      E,0
  20FE20  1d 8e 76 20              CALL    0x20768E
  20FE24  1d f7 76 20              CALL    0x2076F7
  20FE28  43 2f 50 00 00           LD      XHL,0x502F
  20FE2D  21 04                    LD      A,4
  20FE2F  1d 8a 74 20              CALL    sub_20748A
  20FE33  23 00                    LD      C,0
  20FE35  25 00                    LD      E,0
  20FE37  1d 8e 76 20              CALL    0x20768E
  20FE3B  1d f7 76 20              CALL    0x2076F7
  20FE3F  25 02                    LD      E,2
  20FE41  23 02                    LD      C,2
  20FE43  22 06                    LD      B,6
  20FE45  24 0a                    LD      D,0xA
  20FE47  d8 a8                    LD      WA,0
  20FE49  1d 68 67 20              CALL    dyn_206768
  20FE4D  c1 21 50 21              LD      A,(0x5021)
  20FE51  d8 12                    EXTZ    WA
  20FE53  d8 8b                    LD      HL,WA
  20FE55  db c8 0a 00              ADD     HL,0xA
  20FE59  d9 aa                    LD      BC,2
  20FE5B  da aa                    LD      DE,2
  20FE5D  30 0c 00                 LD      WA,0xC
  20FE60  1d 80 03 21              CALL    dyn_210380
  20FE64  25 0c                    LD      E,0xC
  20FE66  23 22                    LD      C,0x22
  20FE68  22 06                    LD      B,6
  20FE6A  24 0a                    LD      D,0xA
  20FE6C  d8 a8                    LD      WA,0
  20FE6E  1d 68 67 20              CALL    dyn_206768
  20FE72  c1 3d 50 21              LD      A,(0x503D)
  20FE76  d8 12                    EXTZ    WA
  20FE78  d8 8b                    LD      HL,WA
  20FE7A  db c8 0a 00              ADD     HL,0xA
  20FE7E  31 0c 00                 LD      BC,0xC
  20FE81  32 22 00                 LD      DE,0x22
  20FE84  30 48 00                 LD      WA,0x48
  20FE87  1d 80 03 21              CALL    dyn_210380
  20FE8B  be 0e 02 01 00           LDW     (XIZ+0xE),1
  20FE90  be 08 02 9a fe           LDW     (XIZ+8),0xFE9A
  20FE95  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20FE9A  c1 df 5c 21              LD      A,(0x5CDF)
  20FE9E  c9 cc 04                 AND     A,4
  20FEA1  66 13                    JR      Z,0x20FEB6
  20FEA3  9e 0e 3f 01 00           CPW     (XIZ+0xE),1
  20FEA8  66 0c                    JR      Z,0x20FEB6
  20FEAA  30 80 00                 LD      WA,0x80
  20FEAD  1d 6a 77 20              CALL    dyn_20776A
  20FEB1  be 0e 02 01 00           LDW     (XIZ+0xE),1
  20FEB6  32 84 00                 LD      DE,0x84
  20FEB9  31 20 00                 LD      BC,0x20
  20FEBC  9e 0e 3f 01 00           CPW     (XIZ+0xE),1
  20FEC1  66 03                    JR      Z,0x20FEC6
  20FEC3  31 50 00                 LD      BC,0x50
  20FEC6  9e 10 61                 INCW    1,(XIZ+0x10)
  20FEC9  9e 10 20                 LD      WA,(XIZ+0x10)
  20FECC  d8 cc 10 00              AND     WA,0x10
  20FED0  66 0d                    JR      Z,0x20FEDF
  20FED2  30 04 3e                 LD      WA,0x3E04
  20FED5  c7 e7 a9                 LD      QB,1
  20FED8  c7 eb aa                 LD      QD,2
  20FEDB  1d ff 6b 20              CALL    dyn_206BFF
  20FEDF  c1 df 5c 21              LD      A,(0x5CDF)
  20FEE3  c9 cc 08                 AND     A,8
  20FEE6  66 13                    JR      Z,0x20FEFB
  20FEE8  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20FEED  66 0c                    JR      Z,0x20FEFB
  20FEEF  30 80 00                 LD      WA,0x80
  20FEF2  1d 6a 77 20              CALL    dyn_20776A
  20FEF6  be 0e 02 00 00           LDW     (XIZ+0xE),0
  20FEFB  c1 df 5c 21              LD      A,(0x5CDF)
  20FEFF  c9 cc 20                 AND     A,0x20
  20FF02  6e 21                    JR      NZ,loc_20FF25
  20FF04  c1 df 5c 21              LD      A,(0x5CDF)
  20FF08  c9 cc 10                 AND     A,0x10
  20FF0B  b0 f6                    RET     Z
  20FF0D  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  20FF12  66 11                    JR      Z,loc_20FF25
  20FF14  bd 10 02 01 00           LDW     (XIY+0x10),1
  20FF19  30 81 00                 LD      WA,0x81
  20FF1C  1d 6a 77 20              CALL    dyn_20776A
  20FF20  1d 69 63 20              CALL    dyn_206369
  20FF24  0e                       RET

loc_20FF25:
  20FF25  30 82 00                 LD      WA,0x82
  20FF28  1d 6a 77 20              CALL    dyn_20776A
  20FF2C  bd 10 02 00 00           LDW     (XIY+0x10),0
  20FF31  1d 69 63 20              CALL    dyn_206369
  20FF35  0e                       RET

dyn_20FF36:
  20FF36  21 03                    LD      A,3
  20FF38  1d 8a 74 20              CALL    sub_20748A
  20FF3C  23 00                    LD      C,0
  20FF3E  25 00                    LD      E,0
  20FF40  1d 8e 76 20              CALL    0x20768E
  20FF44  43 2a 6c 22 00           LD      XHL,0x226C2A
  20FF49  1d f7 76 20              CALL    0x2076F7
  20FF4D  21 04                    LD      A,4
  20FF4F  1d 8a 74 20              CALL    sub_20748A
  20FF53  23 00                    LD      C,0
  20FF55  25 00                    LD      E,0
  20FF57  1d 8e 76 20              CALL    0x20768E
  20FF5B  43 32 6c 22 00           LD      XHL,0x226C32
  20FF60  1d f7 76 20              CALL    0x2076F7
  20FF64  30 ff ff                 LD      WA,0xFFFF
  20FF67  43 13 50 00 00           LD      XHL,0x5013
  20FF6C  f5 ed 50                 LD      (XHL+),WA
  20FF6F  f5 ed 50                 LD      (XHL+),WA
  20FF72  f5 ed 50                 LD      (XHL+),WA
  20FF75  f5 ed 50                 LD      (XHL+),WA
  20FF78  f5 ed 50                 LD      (XHL+),WA
  20FF7B  f5 ed 50                 LD      (XHL+),WA
  20FF7E  f5 ed 50                 LD      (XHL+),WA
  20FF81  43 2f 50 00 00           LD      XHL,0x502F
  20FF86  f5 ed 50                 LD      (XHL+),WA
  20FF89  f5 ed 50                 LD      (XHL+),WA
  20FF8C  f5 ed 50                 LD      (XHL+),WA
  20FF8F  f5 ed 50                 LD      (XHL+),WA
  20FF92  f5 ed 50                 LD      (XHL+),WA
  20FF95  f5 ed 50                 LD      (XHL+),WA
  20FF98  f5 ed 50                 LD      (XHL+),WA
  20FF9B  be 0e 02 01 00           LDW     (XIZ+0xE),1
  20FFA0  be 12 02 01 00           LDW     (XIZ+0x12),1
  20FFA5  be 14 02 84 00           LDW     (XIZ+0x14),0x84
  20FFAA  be 18 02 01 00           LDW     (XIZ+0x18),1
  20FFAF  be 1a 02 00 00           LDW     (XIZ+0x1A),0
  20FFB4  be 08 02 be ff           LDW     (XIZ+8),0xFFBE
  20FFB9  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  20FFBE  9e 1a 61                 INCW    1,(XIZ+0x1A)
  20FFC1  9e 1a 20                 LD      WA,(XIZ+0x1A)
  20FFC4  d8 cc 10 00              AND     WA,0x10
  20FFC8  66 25                    JR      Z,0x20FFEF
  20FFCA  31 48 00                 LD      BC,0x48
  20FFCD  32 30 00                 LD      DE,0x30
  20FFD0  30 dc 3e                 LD      WA,0x3EDC
  20FFD3  c7 e7 a9                 LD      QB,1
  20FFD6  c7 eb aa                 LD      QD,2
  20FFD9  1d ff 6b 20              CALL    dyn_206BFF
  20FFDD  d9 a8                    LD      BC,0
  20FFDF  32 30 00                 LD      DE,0x30
  20FFE2  30 dc be                 LD      WA,0xBEDC
  20FFE5  c7 e7 a9                 LD      QB,1
  20FFE8  c7 eb aa                 LD      QD,2
  20FFEB  1d ff 6b 20              CALL    dyn_206BFF
  20FFEF  c1 df 5c 21              LD      A,(0x5CDF)
  20FFF3  c9 cc 04                 AND     A,4
  20FFF6  66 0f                    JR      Z,0x210007
  20FFF8  30 80 00                 LD      WA,0x80
  20FFFB  1d 6a 77 20              CALL    dyn_20776A
  20FFFF  be 18 02 01 00           LDW     (XIZ+0x18),1
  210004  9e 0e 69                 DECW    1,(XIZ+0xE)
  210007  c1 df 5c 21              LD      A,(0x5CDF)
  21000B  c9 cc 08                 AND     A,8
  21000E  66 0f                    JR      Z,0x21001F
  210010  30 80 00                 LD      WA,0x80
  210013  1d 6a 77 20              CALL    dyn_20776A
  210017  be 18 02 01 00           LDW     (XIZ+0x18),1
  21001C  9e 0e 61                 INCW    1,(XIZ+0xE)
  21001F  9e 0e 3f 0b 00           CPW     (XIZ+0xE),0xB
  210024  6e 05                    JR      NZ,0x21002B
  210026  be 0e 02 01 00           LDW     (XIZ+0xE),1
  21002B  9e 0e 3f 00 00           CPW     (XIZ+0xE),0
  210030  6e 05                    JR      NZ,0x210037
  210032  be 0e 02 0a 00           LDW     (XIZ+0xE),0xA
  210037  9e 0e 20                 LD      WA,(XIZ+0xE)
  21003A  d8 cc 01 00              AND     WA,1
  21003E  6e 07                    JR      NZ,dyn_210047
  210040  9e 0e 20                 LD      WA,(XIZ+0xE)
  210043  d8 69                    DEC     1,WA
  210045  68 05                    JR      0x21004C

dyn_210047:
  210047  9e 0e 20                 LD      WA,(XIZ+0xE)
  21004A  d8 61                    INC     1,WA
  21004C  be 16 50                 LD      (XIZ+0x16),WA
  21004F  9e 18 3f 00 00           CPW     (XIZ+0x18),0
  210054  66 2b                    JR      Z,0x210081
  210056  9e 0e 23                 LD      HL,(XIZ+0xE)
  210059  db c8 0a 00              ADD     HL,0xA
  21005D  30 0c 00                 LD      WA,0xC
  210060  d9 aa                    LD      BC,2
  210062  da aa                    LD      DE,2
  210064  1d 80 03 21              CALL    dyn_210380
  210068  9e 16 23                 LD      HL,(XIZ+0x16)
  21006B  db c8 0a 00              ADD     HL,0xA
  21006F  30 48 00                 LD      WA,0x48
  210072  31 0c 00                 LD      BC,0xC
  210075  32 22 00                 LD      DE,0x22
  210078  1d 80 03 21              CALL    dyn_210380
  21007C  be 18 02 00 00           LDW     (XIZ+0x18),0
  210081  21 02                    LD      A,2
  210083  1d 8a 74 20              CALL    sub_20748A
  210087  23 00                    LD      C,0
  210089  25 00                    LD      E,0
  21008B  1d 8e 76 20              CALL    0x20768E
  21008F  43 3b 6c 22 00           LD      XHL,0x226C3B
  210094  1d f7 76 20              CALL    0x2076F7
  210098  21 05                    LD      A,5
  21009A  1d 8a 74 20              CALL    sub_20748A
  21009E  23 00                    LD      C,0
  2100A0  25 00                    LD      E,0
  2100A2  1d 8e 76 20              CALL    0x20768E
  2100A6  9e 0e 23                 LD      HL,(XIZ+0xE)
  2100A9  eb 12                    EXTZ    XHL
  2100AB  db 69                    DEC     1,HL
  2100AD  eb ef 01                 SRL     1,XHL
  2100B0  eb ee 02                 SLL     2,XHL
  2100B3  eb c8 6e 6c 22 00        ADD     XHL,0x226C6E
  2100B9  a3 23                    LD      XHL,(XHL)
  2100BB  1d f7 76 20              CALL    0x2076F7
  2100BF  c1 df 5c 21              LD      A,(0x5CDF)
  2100C3  c9 cc 20                 AND     A,0x20
  2100C6  66 10                    JR      Z,dyn_2100D8
  2100C8  30 82 00                 LD      WA,0x82
  2100CB  1d 6a 77 20              CALL    dyn_20776A
  2100CF  bd 10 00 00              LDB     (XIY+0x10),0
  2100D3  1d 69 63 20              CALL    dyn_206369
  2100D7  0e                       RET

dyn_2100D8:
  2100D8  c1 df 5c 21              LD      A,(0x5CDF)
  2100DC  c9 cc 10                 AND     A,0x10
  2100DF  b0 f6                    RET     Z
  2100E1  30 81 00                 LD      WA,0x81
  2100E4  1d 6a 77 20              CALL    dyn_20776A
  2100E8  21 02                    LD      A,2
  2100EA  1d 8a 74 20              CALL    sub_20748A
  2100EE  23 00                    LD      C,0
  2100F0  25 00                    LD      E,0
  2100F2  1d 8e 76 20              CALL    0x20768E
  2100F6  43 5b 6c 22 00           LD      XHL,0x226C5B
  2100FB  1d f7 76 20              CALL    0x2076F7
  2100FF  be 08 02 0a 01           LDW     (XIZ+8),0x10A
  210104  be 0a 02 21 00           LDW     (XIZ+0xA),0x21
  210109  0e                       RET

dyn_21010A:
  21010A  c1 df 5c 21              LD      A,(0x5CDF)
  21010E  c9 cc 04                 AND     A,4
  210111  66 15                    JR      Z,dyn_210128
  210113  9e 12 3f 01 00           CPW     (XIZ+0x12),1
  210118  66 2a                    JR      Z,0x210144
  21011A  30 80 00                 LD      WA,0x80
  21011D  1d 6a 77 20              CALL    dyn_20776A
  210121  be 12 02 01 00           LDW     (XIZ+0x12),1
  210126  68 1c                    JR      0x210144

dyn_210128:
  210128  c1 df 5c 21              LD      A,(0x5CDF)
  21012C  c9 cc 08                 AND     A,8
  21012F  66 13                    JR      Z,0x210144
  210131  9e 12 3f 00 00           CPW     (XIZ+0x12),0
  210136  66 0c                    JR      Z,0x210144
  210138  30 80 00                 LD      WA,0x80
  21013B  1d 6a 77 20              CALL    dyn_20776A
  21013F  be 12 02 00 00           LDW     (XIZ+0x12),0
  210144  31 20 00                 LD      BC,0x20
  210147  9e 14 22                 LD      DE,(XIZ+0x14)
  21014A  9e 12 20                 LD      WA,(XIZ+0x12)
  21014D  d8 cc 01 00              AND     WA,1
  210151  6e 03                    JR      NZ,0x210156
  210153  31 50 00                 LD      BC,0x50
  210156  9e 1a 61                 INCW    1,(XIZ+0x1A)
  210159  9e 1a 20                 LD      WA,(XIZ+0x1A)
  21015C  d8 cc 10 00              AND     WA,0x10
  210160  66 0d                    JR      Z,0x21016F
  210162  30 04 3e                 LD      WA,0x3E04
  210165  c7 e7 a9                 LD      QB,1
  210168  c7 eb aa                 LD      QD,2
  21016B  1d ff 6b 20              CALL    dyn_206BFF
  21016F  c1 df 5c 21              LD      A,(0x5CDF)
  210173  c9 cc 10                 AND     A,0x10
  210176  66 0b                    JR      Z,dyn_210183
  210178  9e 12 20                 LD      WA,(XIZ+0x12)
  21017B  d8 cc 01 00              AND     WA,1
  21017F  6e 14                    JR      NZ,dyn_210195
  210181  68 09                    JR      0x21018C

dyn_210183:
  210183  c1 df 5c 21              LD      A,(0x5CDF)
  210187  c9 cc 20                 AND     A,0x20
  21018A  b0 f6                    RET     Z
  21018C  30 82 00                 LD      WA,0x82
  21018F  1d 6a 77 20              CALL    dyn_20776A
  210193  68 6f                    JR      dyn_210204

dyn_210195:
  210195  30 81 00                 LD      WA,0x81
  210198  1d 6a 77 20              CALL    dyn_20776A
  21019C  bd 10 02 01 00           LDW     (XIY+0x10),1
  2101A1  9e 0e 20                 LD      WA,(XIZ+0xE)
  2101A4  f1 21 50 41              LD      (0x5021),A
  2101A8  9e 16 20                 LD      WA,(XIZ+0x16)
  2101AB  f1 3d 50 41              LD      (0x503D),A
  2101AF  c1 21 50 21              LD      A,(0x5021)
  2101B3  d8 12                    EXTZ    WA
  2101B5  e8 12                    EXTZ    XWA
  2101B7  e8 ee 02                 SLL     2,XWA
  2101BA  43 b9 6c 22 00           LD      XHL,0x226CB9
  2101BF  e8 83                    ADD     XHL,XWA
  2101C1  a3 23                    LD      XHL,(XHL)
  2101C3  eb 61                    INC     1,XHL
  2101C5  42 13 50 00 00           LD      XDE,0x5013
  2101CA  83 3f ff                 CPB     (XHL),0xFF
  2101CD  66 08                    JR      Z,dyn_2101D7
  2101CF  c5 ec 21                 LD      A,(XHL+)
  2101D2  f5 e8 41                 LD      (XDE+),A
  2101D5  68 f3                    JR      0x2101CA

dyn_2101D7:
  2101D7  c1 3d 50 21              LD      A,(0x503D)
  2101DB  d8 12                    EXTZ    WA
  2101DD  e8 12                    EXTZ    XWA
  2101DF  e8 ee 02                 SLL     2,XWA
  2101E2  43 b9 6c 22 00           LD      XHL,0x226CB9
  2101E7  e8 83                    ADD     XHL,XWA
  2101E9  a3 23                    LD      XHL,(XHL)
  2101EB  eb 61                    INC     1,XHL
  2101ED  42 2f 50 00 00           LD      XDE,0x502F
  2101F2  83 3f ff                 CPB     (XHL),0xFF
  2101F5  66 08                    JR      Z,dyn_2101FF
  2101F7  c5 ec 21                 LD      A,(XHL+)
  2101FA  f5 e8 41                 LD      (XDE+),A
  2101FD  68 f3                    JR      0x2101F2

dyn_2101FF:
  2101FF  1d 69 63 20              CALL    dyn_206369
  210203  0e                       RET

dyn_210204:
  210204  1d 47 68 20              CALL    sub_206847
  210208  be 08 02 be ff           LDW     (XIZ+8),0xFFBE
  21020D  be 0a 02 20 00           LDW     (XIZ+0xA),0x20
  210212  0e                       RET

  ; ---- 0x16d bytes not traced ----

dyn_210380:
  210380  28                       PUSH    WA
  210381  2b                       PUSH    HL
  210382  db cf 0a 00              CP      HL,0xA
  210386  62 14                    JR      LE,0x21039C
  210388  db cf 15 00              CP      HL,0x15
  21038C  69 02                    JR      GE,dyn_210390
  21038E  68 24                    JR      0x2103B4

dyn_210390:
  210390  db cf 22 00              CP      HL,0x22
  210394  62 02                    JR      LE,dyn_210398
  210396  68 1c                    JR      0x2103B4

dyn_210398:
  210398  db ca 0a 00              SUB     HL,0xA
  21039C  eb 12                    EXTZ    XHL
  21039E  eb ee 01                 SLL     1,XHL
  2103A1  eb c8 19 74 22 00        ADD     XHL,0x227419
  2103A7  83 21                    LD      A,(XHL)
  2103A9  d8 12                    EXTZ    WA
  2103AB  d8 81                    ADD     BC,WA
  2103AD  8b 01 21                 LD      A,(XHL+1)
  2103B0  d8 12                    EXTZ    WA
  2103B2  d8 82                    ADD     DE,WA
  2103B4  4b                       POP     HL
  2103B5  48                       POP     WA
  2103B6  1e 01 00                 CALR    dyn_2103BA
  2103B9  0e                       RET

dyn_2103BA:
  2103BA  28                       PUSH    WA
  2103BB  29                       PUSH    BC
  2103BC  2a                       PUSH    DE
  2103BD  db 88                    LD      WA,HL
  2103BF  d8 ee 02                 SLL     2,WA
  2103C2  43 6e 7b 2c 00           LD      XHL,0x2C7B6E
  2103C7  e3 07 ec e0 23           LD      XHL,(XHL+WA)
  2103CC  23 0a                    LD      C,0xA
  2103CE  21 10                    LD      A,0x10
  2103D0  97 3f 20 00              CPW     (XSP),0x20
  2103D4  61 02                    JR      LT,0x2103D8
  2103D6  21 20                    LD      A,0x20
  2103D8  3b                       PUSH    XHL
  2103D9  a3 23                    LD      XHL,(XHL)
  2103DB  1d 9e 6d 20              CALL    sub_206D9E
  2103DF  1d 26 66 20              CALL    sub_206626
  2103E3  5b                       POP     XHL
  2103E4  23 02                    LD      C,2
  2103E6  21 02                    LD      A,2
  2103E8  97 3f 20 00              CPW     (XSP),0x20
  2103EC  61 02                    JR      LT,0x2103F0
  2103EE  21 04                    LD      A,4
  2103F0  3b                       PUSH    XHL
  2103F1  ab 0c 23                 LD      XHL,(XHL+0xC)
  2103F4  1d cd 6d 20              CALL    sub_206DCD
  2103F8  1d de 66 20              CALL    sub_2066DE
  2103FC  5b                       POP     XHL
  2103FD  c1 c6 5b 21              LD      A,(0x5BC6)
  210401  c9 cc 10                 AND     A,0x10
  210404  6e 1d                    JR      NZ,dyn_210423
  210406  9f 04 20                 LD      WA,(XSP+4)
  210409  3b                       PUSH    XHL
  21040A  ab 10 23                 LD      XHL,(XHL+0x10)
  21040D  1d 26 72 20              CALL    dyn_207226
  210411  5b                       POP     XHL
  210412  ab 14 23                 LD      XHL,(XHL+0x14)
  210415  97 22                    LD      DE,(XSP)
  210417  9f 02 21                 LD      BC,(XSP+2)
  21041A  9f 04 20                 LD      WA,(XSP+4)
  21041D  1d 37 6b 20              CALL    dyn_206B37
  210421  68 1b                    JR      0x21043E

dyn_210423:
  210423  9f 04 20                 LD      WA,(XSP+4)
  210426  3b                       PUSH    XHL
  210427  ab 04 23                 LD      XHL,(XHL+4)
  21042A  1d 26 72 20              CALL    dyn_207226
  21042E  5b                       POP     XHL
  21042F  ab 08 23                 LD      XHL,(XHL+8)
  210432  97 22                    LD      DE,(XSP)
  210434  9f 02 21                 LD      BC,(XSP+2)
  210437  9f 04 20                 LD      WA,(XSP+4)
  21043A  1d 37 6b 20              CALL    dyn_206B37
  21043E  4a                       POP     DE
  21043F  49                       POP     BC
  210440  48                       POP     WA
  210441  0e                       RET

  ; ---- 0x197b bytes not traced ----

dyn_211DBD:
  211DBD  3b                       PUSH    XHL
  211DBE  3a                       PUSH    XDE
  211DBF  39                       PUSH    XBC
  211DC0  38                       PUSH    XWA
  211DC1  8e 2d 21                 LD      A,(XIZ+0x2D)
  211DC4  c9 ef 05                 SRL     5,A
  211DC7  67 10                    JR      C,0x211DD9
  211DC9  c7 e7 a9                 LD      QB,1
  211DCC  c7 eb aa                 LD      QD,2
  211DCF  d8 ac                    LD      WA,4
  211DD1  d8 ce 00 3e              OR      WA,0x3E00
  211DD5  1d ff 6b 20              CALL    dyn_206BFF
  211DD9  58                       POP     XWA
  211DDA  59                       POP     XBC
  211DDB  5a                       POP     XDE
  211DDC  5b                       POP     XHL
  211DDD  0e                       RET

  ; ---- 0x2e30 bytes not traced ----

dyn_214C0E:
  214C0E  1d a2 6a 21              CALL    dyn_216AA2
  214C12  c9 d8                    CP      A,0
  214C14  6e 1a                    JR      NZ,dyn_214C30
  214C16  33 4e 00                 LD      HL,0x4E
  214C19  1d 5b 61 20              CALL    dyn_20615B
  214C1D  cf d9                    CP      L,1
  214C1F  66 0f                    JR      Z,dyn_214C30
  214C21  1d 03 68 20              CALL    dyn_206803
  214C25  1d 25 68 20              CALL    dyn_206825
  214C29  21 07                    LD      A,7
  214C2B  be 15 41                 LD      (XIZ+0x15),A
  214C2E  68 32                    JR      0x214C62

dyn_214C30:
  214C30  1d a2 6a 21              CALL    dyn_216AA2
  214C34  c9 cf 0a                 CP      A,0xA
  214C37  6e 1a                    JR      NZ,dyn_214C53
  214C39  33 4e 00                 LD      HL,0x4E
  214C3C  1d 5b 61 20              CALL    dyn_20615B
  214C40  cf d9                    CP      L,1
  214C42  66 0f                    JR      Z,dyn_214C53
  214C44  1d 03 68 20              CALL    dyn_206803
  214C48  1d 25 68 20              CALL    dyn_206825
  214C4C  21 08                    LD      A,8
  214C4E  be 15 41                 LD      (XIZ+0x15),A
  214C51  68 0f                    JR      0x214C62

dyn_214C53:
  214C53  1d 03 68 20              CALL    dyn_206803
  214C57  21 00                    LD      A,0
  214C59  f1 5b 58 41              LD      (0x585B),A
  214C5D  21 05                    LD      A,5
  214C5F  be 15 41                 LD      (XIZ+0x15),A
  214C62  21 05                    LD      A,5
  214C64  be 0e 41                 LD      (XIZ+0xE),A
  214C67  21 ff                    LD      A,0xFF
  214C69  be 23 41                 LD      (XIZ+0x23),A
  214C6C  40 97 4c 21 00           LD      XWA,0x214C97
  214C71  be 08 60                 LD      (XIZ+8),XWA
  214C74  0e                       RET

  ; ---- 0x22 bytes not traced ----

dyn_214C97:
  214C97  8e 0e 21                 LD      A,(XIZ+0xE)
  214C9A  c9 cf 0c                 CP      A,0xC
  214C9D  66 71                    JR      Z,dyn_214D10
  214C9F  c9 d9                    CP      A,1
  214CA1  6e 05                    JR      NZ,0x214CA8
  214CA3  21 02                    LD      A,2
  214CA5  be 0e 41                 LD      (XIZ+0xE),A
  214CA8  c9 da                    CP      A,2
  214CAA  6e 06                    JR      NZ,dyn_214CB2
  214CAC  1d 33 4e 21              CALL    sub_214E33
  214CB0  68 70                    JR      dyn_214D22

dyn_214CB2:
  214CB2  c9 db                    CP      A,3
  214CB4  6e 06                    JR      NZ,dyn_214CBC
  214CB6  1d 5d 4e 21              CALL    sub_214E5D
  214CBA  68 66                    JR      dyn_214D22

dyn_214CBC:
  214CBC  c9 dc                    CP      A,4
  214CBE  6e 06                    JR      NZ,dyn_214CC6
  214CC0  1d 54 50 21              CALL    sub_215054
  214CC4  68 5c                    JR      dyn_214D22

dyn_214CC6:
  214CC6  c9 dd                    CP      A,5
  214CC8  6e 06                    JR      NZ,dyn_214CD0
  214CCA  1d 60 57 21              CALL    dyn_215760
  214CCE  68 52                    JR      dyn_214D22

dyn_214CD0:
  214CD0  c9 de                    CP      A,6
  214CD2  6e 06                    JR      NZ,loc_214CDA
  214CD4  1d 24 59 21              CALL    dyn_215924
  214CD8  68 48                    JR      dyn_214D22

loc_214CDA:
  214CDA  c9 df                    CP      A,7
  214CDC  6e 06                    JR      NZ,loc_214CE4
  214CDE  1d dc 5e 21              CALL    sub_215EDC
  214CE2  68 3e                    JR      dyn_214D22

loc_214CE4:
  214CE4  c9 cf 08                 CP      A,8
  214CE7  6e 06                    JR      NZ,loc_214CEF
  214CE9  1d 08 62 21              CALL    sub_216208
  214CED  68 33                    JR      dyn_214D22

loc_214CEF:
  214CEF  c9 cf 09                 CP      A,9
  214CF2  6e 06                    JR      NZ,loc_214CFA
  214CF4  1d 4f 63 21              CALL    sub_21634F
  214CF8  68 28                    JR      dyn_214D22

loc_214CFA:
  214CFA  c9 cf 0a                 CP      A,0xA
  214CFD  6e 06                    JR      NZ,loc_214D05
  214CFF  1d 19 66 21              CALL    sub_216619
  214D03  68 1d                    JR      dyn_214D22

loc_214D05:
  214D05  c9 cf 0b                 CP      A,0xB
  214D08  6e 06                    JR      NZ,dyn_214D10
  214D0A  1d 49 66 21              CALL    sub_216649
  214D0E  68 12                    JR      dyn_214D22

dyn_214D10:
  214D10  21 01                    LD      A,1
  214D12  be 0e 41                 LD      (XIZ+0xE),A
  214D15  8e 11 21                 LD      A,(XIZ+0x11)
  214D18  f1 f0 60 41              LD      (0x60F0),A
  214D1C  1d 69 63 20              CALL    dyn_206369
  214D20  68 00                    JR      dyn_214D22

dyn_214D22:
  214D22  0e                       RET

dyn_214D23:
  214D23  3b                       PUSH    XHL
  214D24  3a                       PUSH    XDE
  214D25  39                       PUSH    XBC
  214D26  38                       PUSH    XWA
  214D27  8e 15 21                 LD      A,(XIZ+0x15)
  214D2A  d8 12                    EXTZ    WA
  214D2C  e8 12                    EXTZ    XWA
  214D2E  38                       PUSH    XWA
  214D2F  1d 03 68 20              CALL    dyn_206803
  214D33  58                       POP     XWA
  214D34  38                       PUSH    XWA
  214D35  43 c7 9e 24 00           LD      XHL,0x249EC7
  214D3A  e8 83                    ADD     XHL,XWA
  214D3C  83 27                    LD      L,(XHL)
  214D3E  db 12                    EXTZ    HL
  214D40  1d 45 68 21              CALL    dyn_216845
  214D44  d9 a8                    LD      BC,0
  214D46  da a8                    LD      DE,0
  214D48  1d ba 03 21              CALL    dyn_2103BA
  214D4C  58                       POP     XWA
  214D4D  e8 ee 02                 SLL     2,XWA
  214D50  43 ab 9e 24 00           LD      XHL,0x249EAB
  214D55  e8 83                    ADD     XHL,XWA
  214D57  a3 23                    LD      XHL,(XHL)
  214D59  21 03                    LD      A,3
  214D5B  1d f3 76 20              CALL    dyn_2076F3
  214D5F  58                       POP     XWA
  214D60  59                       POP     XBC
  214D61  5a                       POP     XDE
  214D62  5b                       POP     XHL
  214D63  0e                       RET

sub_214D64:
  214D64  3b                       PUSH    XHL
  214D65  3a                       PUSH    XDE
  214D66  39                       PUSH    XBC
  214D67  38                       PUSH    XWA
  214D68  23 00                    LD      C,0
  214D6A  25 08                    LD      E,8
  214D6C  21 02                    LD      A,2
  214D6E  1d 8a 76 20              CALL    sub_20768A
  214D72  43 ce 9e 24 00           LD      XHL,0x249ECE
  214D77  21 02                    LD      A,2
  214D79  1d f3 76 20              CALL    dyn_2076F3
  214D7D  58                       POP     XWA
  214D7E  59                       POP     XBC
  214D7F  5a                       POP     XDE
  214D80  5b                       POP     XHL
  214D81  0e                       RET

sub_214D82:
  214D82  3b                       PUSH    XHL
  214D83  3a                       PUSH    XDE
  214D84  39                       PUSH    XBC
  214D85  38                       PUSH    XWA
  214D86  21 01                    LD      A,1
  214D88  1d 11 76 20              CALL    dyn_207611
  214D8C  21 01                    LD      A,1
  214D8E  1d cc 75 20              CALL    dyn_2075CC
  214D92  58                       POP     XWA
  214D93  59                       POP     XBC
  214D94  5a                       POP     XDE
  214D95  5b                       POP     XHL
  214D96  0e                       RET

dyn_214D97:
  214D97  3a                       PUSH    XDE
  214D98  39                       PUSH    XBC
  214D99  38                       PUSH    XWA
  214D9A  c9 cf ff                 CP      A,0xFF
  214D9D  66 22                    JR      Z,loc_214DC1
  214D9F  14                       PUSH    A
  214DA0  c8 89                    LD      A,W
  214DA2  c9 69                    DEC     1,A
  214DA4  d8 12                    EXTZ    WA
  214DA6  e8 12                    EXTZ    XWA
  214DA8  e8 ee 02                 SLL     2,XWA
  214DAB  43 50 a2 24 00           LD      XHL,0x24A250
  214DB0  e8 83                    ADD     XHL,XWA
  214DB2  a3 23                    LD      XHL,(XHL)
  214DB4  15                       POP     A
  214DB5  d8 12                    EXTZ    WA
  214DB7  e8 12                    EXTZ    XWA
  214DB9  d8 08 08 00              MUL     XWA,8
  214DBD  e8 83                    ADD     XHL,XWA
  214DBF  68 05                    JR      0x214DC6

loc_214DC1:
  214DC1  43 48 a2 24 00           LD      XHL,0x24A248
  214DC6  58                       POP     XWA
  214DC7  59                       POP     XBC
  214DC8  5a                       POP     XDE
  214DC9  0e                       RET

sub_214DCA:
  214DCA  3b                       PUSH    XHL
  214DCB  3a                       PUSH    XDE
  214DCC  39                       PUSH    XBC
  214DCD  38                       PUSH    XWA
  214DCE  1d 79 67 21              CALL    sub_216779
  214DD2  21 02                    LD      A,2
  214DD4  43 ea 9e 24 00           LD      XHL,0x249EEA
  214DD9  1d f3 76 20              CALL    dyn_2076F3
  214DDD  21 02                    LD      A,2
  214DDF  43 f1 9e 24 00           LD      XHL,0x249EF1
  214DE4  1d f3 76 20              CALL    dyn_2076F3
  214DE8  21 02                    LD      A,2
  214DEA  43 f8 9e 24 00           LD      XHL,0x249EF8
  214DEF  1d f3 76 20              CALL    dyn_2076F3
  214DF3  21 02                    LD      A,2
  214DF5  43 ff 9e 24 00           LD      XHL,0x249EFF
  214DFA  1d f3 76 20              CALL    dyn_2076F3
  214DFE  1e 63 ff                 CALR    sub_214D64
  214E01  1e 1f ff                 CALR    dyn_214D23
  214E04  1d e5 69 21              CALL    sub_2169E5
  214E08  21 01                    LD      A,1
  214E0A  1d cc 75 20              CALL    dyn_2075CC
  214E0E  43 d6 9e 24 00           LD      XHL,0x249ED6
  214E13  21 01                    LD      A,1
  214E15  1d 8a 74 20              CALL    sub_20748A
  214E19  b8 08 63                 LD      (XWA+8),XHL
  214E1C  21 00                    LD      A,0
  214E1E  be 2d 41                 LD      (XIZ+0x2D),A
  214E21  be 2c 41                 LD      (XIZ+0x2C),A
  214E24  21 02                    LD      A,2
  214E26  be 0f 41                 LD      (XIZ+0xF),A
  214E29  21 03                    LD      A,3
  214E2B  be 0e 41                 LD      (XIZ+0xE),A
  214E2E  58                       POP     XWA
  214E2F  59                       POP     XBC
  214E30  5a                       POP     XDE
  214E31  5b                       POP     XHL
  214E32  0e                       RET

sub_214E33:
  214E33  1d cf 67 21              CALL    dyn_2167CF
  214E37  1e 90 ff                 CALR    sub_214DCA
  214E3A  21 00                    LD      A,0
  214E3C  be 10 41                 LD      (XIZ+0x10),A
  214E3F  1d e4 67 21              CALL    dyn_2167E4
  214E43  1d de 6e 21              CALL    dyn_216EDE
  214E47  1d b1 6f 21              CALL    dyn_216FB1
  214E4B  1d 6b 6f 21              CALL    dyn_216F6B
  214E4F  e8 a9                    LD      XWA,1
  214E51  1d 59 77 20              CALL    dyn_207759
  214E55  30 21 00                 LD      WA,0x21
  214E58  1d 6a 77 20              CALL    dyn_20776A
  214E5C  0e                       RET

sub_214E5D:
  214E5D  c1 df 5c 21              LD      A,(0x5CDF)
  214E61  c9 33 04                 BIT     4,A
  214E64  66 0f                    JR      Z,loc_214E75
  214E66  28                       PUSH    WA
  214E67  30 81 00                 LD      WA,0x81
  214E6A  1d 6a 77 20              CALL    dyn_20776A
  214E6E  48                       POP     WA
  214E6F  1e 9d 00                 CALR    sub_214F0F
  214E72  78 99 00                 JRL     loc_214F0E

loc_214E75:
  214E75  c9 33 05                 BIT     5,A
  214E78  66 14                    JR      Z,loc_214E8E
  214E7A  28                       PUSH    WA
  214E7B  30 82 00                 LD      WA,0x82
  214E7E  1d 6a 77 20              CALL    dyn_20776A
  214E82  48                       POP     WA
  214E83  21 08                    LD      A,8
  214E85  be 10 41                 LD      (XIZ+0x10),A
  214E88  1e 84 00                 CALR    sub_214F0F
  214E8B  78 80 00                 JRL     loc_214F0E

loc_214E8E:
  214E8E  c9 cc 0f                 AND     A,0xF
  214E91  66 5e                    JR      Z,loc_214EF1
  214E93  c9 d9                    CP      A,1
  214E95  6e 2a                    JR      NZ,loc_214EC1
  214E97  28                       PUSH    WA
  214E98  30 80 00                 LD      WA,0x80
  214E9B  1d 6a 77 20              CALL    dyn_20776A
  214E9F  48                       POP     WA
  214EA0  8e 10 21                 LD      A,(XIZ+0x10)
  214EA3  c9 d8                    CP      A,0
  214EA5  66 0c                    JR      Z,loc_214EB3
  214EA7  c9 cf 08                 CP      A,8
  214EAA  66 0e                    JR      Z,loc_214EBA
  214EAC  c9 69                    DEC     1,A
  214EAE  be 10 41                 LD      (XIZ+0x10),A
  214EB1  68 3c                    JR      loc_214EEF

loc_214EB3:
  214EB3  21 08                    LD      A,8
  214EB5  be 10 41                 LD      (XIZ+0x10),A
  214EB8  68 35                    JR      loc_214EEF

loc_214EBA:
  214EBA  21 03                    LD      A,3
  214EBC  be 10 41                 LD      (XIZ+0x10),A
  214EBF  68 2e                    JR      loc_214EEF

loc_214EC1:
  214EC1  c9 da                    CP      A,2
  214EC3  6e 2a                    JR      NZ,loc_214EEF
  214EC5  28                       PUSH    WA
  214EC6  30 80 00                 LD      WA,0x80
  214EC9  1d 6a 77 20              CALL    dyn_20776A
  214ECD  48                       POP     WA
  214ECE  8e 10 21                 LD      A,(XIZ+0x10)
  214ED1  c9 cf 08                 CP      A,8
  214ED4  66 0b                    JR      Z,loc_214EE1
  214ED6  c9 db                    CP      A,3
  214ED8  66 0e                    JR      Z,loc_214EE8
  214EDA  c9 61                    INC     1,A
  214EDC  be 10 41                 LD      (XIZ+0x10),A
  214EDF  68 0e                    JR      loc_214EEF

loc_214EE1:
  214EE1  21 00                    LD      A,0
  214EE3  be 10 41                 LD      (XIZ+0x10),A
  214EE6  68 07                    JR      loc_214EEF

loc_214EE8:
  214EE8  21 08                    LD      A,8
  214EEA  be 10 41                 LD      (XIZ+0x10),A
  214EED  68 00                    JR      loc_214EEF

loc_214EEF:
  214EEF  68 00                    JR      loc_214EF1

loc_214EF1:
  214EF1  31 60 00                 LD      BC,0x60
  214EF4  e8 a8                    LD      XWA,0
  214EF6  8e 10 21                 LD      A,(XIZ+0x10)
  214EF9  c9 08 08                 MUL     WA,8
  214EFC  d8 c8 04 00              ADD     WA,4
  214F00  d8 8a                    LD      DE,WA
  214F02  1d bd 1d 21              CALL    dyn_211DBD
  214F06  8e 2d 21                 LD      A,(XIZ+0x2D)
  214F09  c9 61                    INC     1,A
  214F0B  be 2d 41                 LD      (XIZ+0x2D),A

loc_214F0E:
  214F0E  0e                       RET

sub_214F0F:
  214F0F  3b                       PUSH    XHL
  214F10  3a                       PUSH    XDE
  214F11  39                       PUSH    XBC
  214F12  38                       PUSH    XWA
  214F13  8e 10 21                 LD      A,(XIZ+0x10)
  214F16  c9 cf 08                 CP      A,8
  214F19  6e 0f                    JR      NZ,loc_214F2A
  214F1B  1e 64 fe                 CALR    sub_214D82
  214F1E  21 00                    LD      A,0
  214F20  be 11 41                 LD      (XIZ+0x11),A
  214F23  21 0c                    LD      A,0xC
  214F25  be 0e 41                 LD      (XIZ+0xE),A
  214F28  68 0e                    JR      loc_214F38

loc_214F2A:
  214F2A  c9 c8 01                 ADD     A,1
  214F2D  be 15 41                 LD      (XIZ+0x15),A
  214F30  1e 4f fe                 CALR    sub_214D82
  214F33  1e fb 00                 CALR    sub_215031
  214F36  68 00                    JR      loc_214F38

loc_214F38:
  214F38  58                       POP     XWA
  214F39  59                       POP     XBC
  214F3A  5a                       POP     XDE
  214F3B  5b                       POP     XHL
  214F3C  0e                       RET

sub_214F3D:
  214F3D  3b                       PUSH    XHL
  214F3E  3a                       PUSH    XDE
  214F3F  39                       PUSH    XBC
  214F40  38                       PUSH    XWA
  214F41  ee 8b                    LD      XHL,XIZ
  214F43  eb c8 1e 00 00 00        ADD     XHL,0x1E
  214F49  eb 8a                    LD      XDE,XHL
  214F4B  21 ff                    LD      A,0xFF
  214F4D  23 04                    LD      C,4

loc_214F4F:
  214F4F  b3 41                    LD      (XHL),A
  214F51  eb 61                    INC     1,XHL
  214F53  cb 1c f9                 DJNZ    C,loc_214F4F
  214F56  21 00                    LD      A,0
  214F58  be 1a 41                 LD      (XIZ+0x1A),A
  214F5B  8e 15 21                 LD      A,(XIZ+0x15)
  214F5E  c9 ca 01                 SUB     A,1
  214F61  d8 12                    EXTZ    WA
  214F63  e8 12                    EXTZ    XWA
  214F65  43 04 a3 24 00           LD      XHL,0x24A304
  214F6A  e8 83                    ADD     XHL,XWA
  214F6C  83 23                    LD      C,(XHL)
  214F6E  d9 12                    EXTZ    BC
  214F70  e8 ee 02                 SLL     2,XWA
  214F73  43 f4 a2 24 00           LD      XHL,0x24A2F4
  214F78  e8 83                    ADD     XHL,XWA
  214F7A  a3 23                    LD      XHL,(XHL)
  214F7C  1d a2 6a 21              CALL    dyn_216AA2
  214F80  d8 12                    EXTZ    WA
  214F82  e8 12                    EXTZ    XWA
  214F84  d9 40                    MUL     XWA,BC
  214F86  e8 83                    ADD     XHL,XWA
  214F88  21 00                    LD      A,0

loc_214F8A:
  214F8A  83 20                    LD      W,(XHL)
  214F8C  c8 cf ff                 CP      W,0xFF
  214F8F  66 0b                    JR      Z,loc_214F9C
  214F91  b2 40                    LD      (XDE),W
  214F93  eb 61                    INC     1,XHL
  214F95  ea 61                    INC     1,XDE
  214F97  c9 61                    INC     1,A
  214F99  cb 1c ee                 DJNZ    C,loc_214F8A

loc_214F9C:
  214F9C  be 1a 41                 LD      (XIZ+0x1A),A
  214F9F  58                       POP     XWA
  214FA0  59                       POP     XBC
  214FA1  5a                       POP     XDE
  214FA2  5b                       POP     XHL
  214FA3  0e                       RET

sub_214FA4:
  214FA4  3b                       PUSH    XHL
  214FA5  3a                       PUSH    XDE
  214FA6  39                       PUSH    XBC
  214FA7  38                       PUSH    XWA
  214FA8  1d 79 67 21              CALL    sub_216779
  214FAC  1e 8e ff                 CALR    sub_214F3D
  214FAF  8e 1a 23                 LD      C,(XIZ+0x1A)
  214FB2  cb d8                    CP      C,0
  214FB4  66 48                    JR      Z,loc_214FFE
  214FB6  ee 8b                    LD      XHL,XIZ
  214FB8  eb c8 1e 00 00 00        ADD     XHL,0x1E
  214FBE  eb 8a                    LD      XDE,XHL
  214FC0  8e 15 20                 LD      W,(XIZ+0x15)

loc_214FC3:
  214FC3  3a                       PUSH    XDE
  214FC4  cb 04                    PUSH    C
  214FC6  c8 04                    PUSH    W
  214FC8  82 21                    LD      A,(XDE)
  214FCA  1e ca fd                 CALR    dyn_214D97
  214FCD  8b 00 21                 LD      A,(XHL+0)
  214FD0  c9 ca 15                 SUB     A,0x15
  214FD3  d8 12                    EXTZ    WA
  214FD5  e8 12                    EXTZ    XWA
  214FD7  e8 ee 02                 SLL     2,XWA
  214FDA  43 66 9f 24 00           LD      XHL,0x249F66
  214FDF  e8 83                    ADD     XHL,XWA
  214FE1  a3 23                    LD      XHL,(XHL)
  214FE3  21 02                    LD      A,2
  214FE5  1d f3 76 20              CALL    dyn_2076F3
  214FE9  43 a1 9f 24 00           LD      XHL,0x249FA1
  214FEE  21 02                    LD      A,2
  214FF0  1d f3 76 20              CALL    dyn_2076F3
  214FF4  c8 05                    POP     W
  214FF6  cb 05                    POP     C
  214FF8  5a                       POP     XDE
  214FF9  ea 61                    INC     1,XDE
  214FFB  cb 1c c5                 DJNZ    C,loc_214FC3

loc_214FFE:
  214FFE  1e 63 fd                 CALR    sub_214D64
  215001  21 00                    LD      A,0
  215003  be 13 41                 LD      (XIZ+0x13),A
  215006  21 01                    LD      A,1
  215008  1d cc 75 20              CALL    dyn_2075CC
  21500C  43 06 9f 24 00           LD      XHL,0x249F06
  215011  21 01                    LD      A,1
  215013  1d 8a 74 20              CALL    sub_20748A
  215017  b8 08 63                 LD      (XWA+8),XHL
  21501A  21 00                    LD      A,0
  21501C  be 2d 41                 LD      (XIZ+0x2D),A
  21501F  be 2c 41                 LD      (XIZ+0x2C),A
  215022  21 02                    LD      A,2
  215024  be 0f 41                 LD      (XIZ+0xF),A
  215027  21 04                    LD      A,4
  215029  be 0e 41                 LD      (XIZ+0xE),A
  21502C  58                       POP     XWA
  21502D  59                       POP     XBC
  21502E  5a                       POP     XDE
  21502F  5b                       POP     XHL
  215030  0e                       RET

sub_215031:
  215031  3b                       PUSH    XHL
  215032  3a                       PUSH    XDE
  215033  39                       PUSH    XBC
  215034  38                       PUSH    XWA
  215035  1e 6c ff                 CALR    sub_214FA4
  215038  1e e8 fc                 CALR    dyn_214D23
  21503B  8e 1a 21                 LD      A,(XIZ+0x1A)
  21503E  c9 d8                    CP      A,0
  215040  6e 04                    JR      NZ,loc_215046
  215042  21 08                    LD      A,8
  215044  68 02                    JR      loc_215048

loc_215046:
  215046  21 00                    LD      A,0

loc_215048:
  215048  be 10 41                 LD      (XIZ+0x10),A
  21504B  1d b1 6f 21              CALL    dyn_216FB1
  21504F  58                       POP     XWA
  215050  59                       POP     XBC
  215051  5a                       POP     XDE
  215052  5b                       POP     XHL
  215053  0e                       RET

sub_215054:
  215054  c1 df 5c 21              LD      A,(0x5CDF)
  215058  c9 33 04                 BIT     4,A
  21505B  66 0f                    JR      Z,loc_21506C
  21505D  28                       PUSH    WA
  21505E  30 81 00                 LD      WA,0x81
  215061  1d 6a 77 20              CALL    dyn_20776A
  215065  48                       POP     WA
  215066  1e ac 00                 CALR    sub_215115
  215069  78 a8 00                 JRL     loc_215114

loc_21506C:
  21506C  c9 33 05                 BIT     5,A
  21506F  66 14                    JR      Z,loc_215085
  215071  28                       PUSH    WA
  215072  30 82 00                 LD      WA,0x82
  215075  1d 6a 77 20              CALL    dyn_20776A
  215079  48                       POP     WA
  21507A  21 08                    LD      A,8
  21507C  be 10 41                 LD      (XIZ+0x10),A
  21507F  1e 93 00                 CALR    sub_215115
  215082  78 8f 00                 JRL     loc_215114

loc_215085:
  215085  8e 1a 20                 LD      W,(XIZ+0x1A)
  215088  c8 d8                    CP      W,0
  21508A  66 69                    JR      Z,loc_2150F5
  21508C  c9 cc 0f                 AND     A,0xF
  21508F  66 66                    JR      Z,loc_2150F7
  215091  c9 d9                    CP      A,1
  215093  6e 2d                    JR      NZ,loc_2150C2
  215095  28                       PUSH    WA
  215096  30 80 00                 LD      WA,0x80
  215099  1d 6a 77 20              CALL    dyn_20776A
  21509D  48                       POP     WA
  21509E  8e 10 21                 LD      A,(XIZ+0x10)
  2150A1  c9 d8                    CP      A,0
  2150A3  66 0c                    JR      Z,loc_2150B1
  2150A5  c9 cf 08                 CP      A,8
  2150A8  66 0e                    JR      Z,loc_2150B8
  2150AA  c9 69                    DEC     1,A
  2150AC  be 10 41                 LD      (XIZ+0x10),A
  2150AF  68 44                    JR      loc_2150F5

loc_2150B1:
  2150B1  21 08                    LD      A,8
  2150B3  be 10 41                 LD      (XIZ+0x10),A
  2150B6  68 3d                    JR      loc_2150F5

loc_2150B8:
  2150B8  8e 1a 21                 LD      A,(XIZ+0x1A)
  2150BB  c9 69                    DEC     1,A
  2150BD  be 10 41                 LD      (XIZ+0x10),A
  2150C0  68 33                    JR      loc_2150F5

loc_2150C2:
  2150C2  c9 da                    CP      A,2
  2150C4  6e 2f                    JR      NZ,loc_2150F5
  2150C6  28                       PUSH    WA
  2150C7  30 80 00                 LD      WA,0x80
  2150CA  1d 6a 77 20              CALL    dyn_20776A
  2150CE  48                       POP     WA
  2150CF  8e 10 21                 LD      A,(XIZ+0x10)
  2150D2  c9 cf 08                 CP      A,8
  2150D5  66 10                    JR      Z,loc_2150E7
  2150D7  8e 1a 20                 LD      W,(XIZ+0x1A)
  2150DA  c8 69                    DEC     1,W
  2150DC  c8 f1                    CP      A,W
  2150DE  66 0e                    JR      Z,loc_2150EE
  2150E0  c9 61                    INC     1,A
  2150E2  be 10 41                 LD      (XIZ+0x10),A
  2150E5  68 0e                    JR      loc_2150F5

loc_2150E7:
  2150E7  21 00                    LD      A,0
  2150E9  be 10 41                 LD      (XIZ+0x10),A
  2150EC  68 07                    JR      loc_2150F5

loc_2150EE:
  2150EE  21 08                    LD      A,8
  2150F0  be 10 41                 LD      (XIZ+0x10),A
  2150F3  68 00                    JR      loc_2150F5

loc_2150F5:
  2150F5  68 00                    JR      loc_2150F7

loc_2150F7:
  2150F7  31 60 00                 LD      BC,0x60
  2150FA  e8 a8                    LD      XWA,0
  2150FC  8e 10 21                 LD      A,(XIZ+0x10)
  2150FF  c9 08 08                 MUL     WA,8
  215102  d8 c8 04 00              ADD     WA,4
  215106  d8 8a                    LD      DE,WA
  215108  1d bd 1d 21              CALL    dyn_211DBD
  21510C  8e 2d 21                 LD      A,(XIZ+0x2D)
  21510F  c9 61                    INC     1,A
  215111  be 2d 41                 LD      (XIZ+0x2D),A

loc_215114:
  215114  0e                       RET

sub_215115:
  215115  3b                       PUSH    XHL
  215116  3a                       PUSH    XDE
  215117  39                       PUSH    XBC
  215118  38                       PUSH    XWA
  215119  8e 10 21                 LD      A,(XIZ+0x10)
  21511C  c9 cf 08                 CP      A,8
  21511F  6e 16                    JR      NZ,loc_215137
  215121  1e 5e fc                 CALR    sub_214D82
  215124  8e 15 21                 LD      A,(XIZ+0x15)
  215127  c9 ca 01                 SUB     A,1
  21512A  be 10 41                 LD      (XIZ+0x10),A
  21512D  21 00                    LD      A,0
  21512F  be 15 41                 LD      (XIZ+0x15),A
  215132  1e 95 fc                 CALR    sub_214DCA
  215135  68 25                    JR      loc_21515C

loc_215137:
  215137  1e 48 fc                 CALR    sub_214D82
  21513A  1d 79 67 21              CALL    sub_216779
  21513E  1e 08 06                 CALR    dyn_215749
  215141  8e 10 21                 LD      A,(XIZ+0x10)
  215144  be 1b 41                 LD      (XIZ+0x1B),A
  215147  d8 12                    EXTZ    WA
  215149  e8 12                    EXTZ    XWA
  21514B  ee 8b                    LD      XHL,XIZ
  21514D  eb c8 1e 00 00 00        ADD     XHL,0x1E
  215153  e8 83                    ADD     XHL,XWA
  215155  83 21                    LD      A,(XHL)
  215157  be 12 41                 LD      (XIZ+0x12),A
  21515A  68 00                    JR      loc_21515C

loc_21515C:
  21515C  58                       POP     XWA
  21515D  59                       POP     XBC
  21515E  5a                       POP     XDE
  21515F  5b                       POP     XHL
  215160  0e                       RET

dyn_215161:
  215161  28                       PUSH    WA
  215162  8e 15 20                 LD      W,(XIZ+0x15)
  215165  8e 12 21                 LD      A,(XIZ+0x12)
  215168  1e 2c fc                 CALR    dyn_214D97
  21516B  48                       POP     WA
  21516C  0e                       RET

dyn_21516D:
  21516D  3b                       PUSH    XHL
  21516E  43 00 98 00 00           LD      XHL,0x9800
  215173  1d ee 6b 21              CALL    dyn_216BEE
  215177  5b                       POP     XHL
  215178  0e                       RET

dyn_215179:
  215179  3b                       PUSH    XHL
  21517A  3a                       PUSH    XDE
  21517B  39                       PUSH    XBC
  21517C  38                       PUSH    XWA
  21517D  1e ed ff                 CALR    dyn_21516D
  215180  db d8                    CP      HL,0
  215182  66 2f                    JR      Z,0x2151B3
  215184  db cf ff ff              CP      HL,0xFFFF
  215188  66 09                    JR      Z,dyn_215193
  21518A  d9 a8                    LD      BC,0
  21518C  da a8                    LD      DE,0
  21518E  cd c8 20                 ADD     E,0x20
  215191  68 18                    JR      dyn_2151AB

dyn_215193:
  215193  c1 21 50 21              LD      A,(0x5021)
  215197  c9 69                    DEC     1,A
  215199  c9 cd 01                 XOR     A,1
  21519C  d8 12                    EXTZ    WA
  21519E  db a9                    LD      HL,1
  2151A0  d8 83                    ADD     HL,WA
  2151A2  d9 a8                    LD      BC,0
  2151A4  da a8                    LD      DE,0
  2151A6  cd c8 20                 ADD     E,0x20
  2151A9  68 00                    JR      dyn_2151AB

dyn_2151AB:
  2151AB  1d 49 68 21              CALL    dyn_216849
  2151AF  1d 80 03 21              CALL    dyn_210380
  2151B3  58                       POP     XWA
  2151B4  59                       POP     XBC
  2151B5  5a                       POP     XDE
  2151B6  5b                       POP     XHL
  2151B7  0e                       RET

dyn_2151B8:
  2151B8  3b                       PUSH    XHL
  2151B9  3a                       PUSH    XDE
  2151BA  39                       PUSH    XBC
  2151BB  38                       PUSH    XWA
  2151BC  1e a2 ff                 CALR    dyn_215161
  2151BF  8b 00 21                 LD      A,(XHL+0)
  2151C2  8e 13 20                 LD      W,(XIZ+0x13)
  2151C5  c8 f1                    CP      A,W
  2151C7  66 0a                    JR      Z,0x2151D3
  2151C9  be 13 41                 LD      (XIZ+0x13),A
  2151CC  c9 8f                    LD      L,A
  2151CE  db 13                    EXTS    HL
  2151D0  1e a6 ff                 CALR    dyn_215179
  2151D3  58                       POP     XWA
  2151D4  59                       POP     XBC
  2151D5  5a                       POP     XDE
  2151D6  5b                       POP     XHL
  2151D7  0e                       RET

dyn_2151D8:
  2151D8  3b                       PUSH    XHL
  2151D9  3a                       PUSH    XDE
  2151DA  39                       PUSH    XBC
  2151DB  8e 15 21                 LD      A,(XIZ+0x15)
  2151DE  c9 dd                    CP      A,5
  2151E0  76 73 01                 JRL     Z,0x215356
  2151E3  c9 de                    CP      A,6
  2151E5  76 6e 01                 JRL     Z,0x215356
  2151E8  c9 df                    CP      A,7
  2151EA  76 69 01                 JRL     Z,0x215356
  2151ED  c9 cf 08                 CP      A,8
  2151F0  76 63 01                 JRL     Z,0x215356
  2151F3  c8 8c                    LD      D,W
  2151F5  c9 88                    LD      W,A
  2151F7  cc 89                    LD      A,D
  2151F9  1e 9b fb                 CALR    dyn_214D97
  2151FC  8b 00 21                 LD      A,(XHL+0)
  2151FF  c9 ca 15                 SUB     A,0x15
  215202  c9 8d                    LD      E,A
  215204  33 40 00                 LD      HL,0x40
  215207  cd 89                    LD      A,E
  215209  d8 12                    EXTZ    WA
  21520B  d8 83                    ADD     HL,WA
  21520D  1d 5b 61 20              CALL    dyn_20615B
  215211  cf d9                    CP      L,1
  215213  66 05                    JR      Z,loc_21521A
  215215  cc 88                    LD      W,D
  215217  78 3c 01                 JRL     0x215356

loc_21521A:
  21521A  cd da                    CP      E,2
  21521C  66 13                    JR      Z,loc_215231
  21521E  cd cf 08                 CP      E,8
  215221  66 5f                    JR      Z,loc_215282
  215223  cd cf 0c                 CP      E,0xC
  215226  66 79                    JR      Z,loc_2152A1
  215228  cd cf 0d                 CP      E,0xD
  21522B  76 ab 00                 JRL     Z,loc_2152D9
  21522E  78 b1 00                 JRL     loc_2152E2

loc_215231:
  215231  cc 88                    LD      W,D
  215233  c8 cf 22                 CP      W,0x22
  215236  77 1d 01                 JRL     C,0x215356
  215239  c8 cf 48                 CP      W,0x48
  21523C  7f 17 01                 JRL     NC,0x215356
  21523F  1d 19 6b 21              CALL    sub_216B19
  215243  c9 d8                    CP      A,0
  215245  76 9a 00                 JRL     Z,loc_2152E2
  215248  33 14 00                 LD      HL,0x14
  21524B  1d 5b 61 20              CALL    dyn_20615B
  21524F  cf d8                    CP      L,0
  215251  66 0b                    JR      Z,loc_21525E
  215253  1d 19 6b 21              CALL    sub_216B19
  215257  c9 dc                    CP      A,4
  215259  66 08                    JR      Z,loc_215263
  21525B  78 84 00                 JRL     loc_2152E2

loc_21525E:
  21525E  20 12                    LD      W,0x12
  215260  78 f3 00                 JRL     0x215356

loc_215263:
  215263  33 20 00                 LD      HL,0x20
  215266  1d 5b 61 20              CALL    dyn_20615B
  21526A  cf d9                    CP      L,1
  21526C  66 0a                    JR      Z,loc_215278
  21526E  21 00                    LD      A,0
  215270  be 28 41                 LD      (XIZ+0x28),A
  215273  20 13                    LD      W,0x13
  215275  78 de 00                 JRL     0x215356

loc_215278:
  215278  21 01                    LD      A,1
  21527A  be 28 41                 LD      (XIZ+0x28),A
  21527D  20 1b                    LD      W,0x1B
  21527F  78 d4 00                 JRL     0x215356

loc_215282:
  215282  8e 15 21                 LD      A,(XIZ+0x15)
  215285  c9 db                    CP      A,3
  215287  66 59                    JR      Z,loc_2152E2
  215289  cc 88                    LD      W,D
  21528B  c8 cf 22                 CP      W,0x22
  21528E  77 c5 00                 JRL     C,0x215356
  215291  1e 8a 0c                 CALR    sub_215F1E
  215294  c9 cf 14                 CP      A,0x14
  215297  66 49                    JR      Z,loc_2152E2
  215299  be 29 41                 LD      (XIZ+0x29),A
  21529C  20 04                    LD      W,4
  21529E  78 b5 00                 JRL     0x215356

loc_2152A1:
  2152A1  cc 88                    LD      W,D
  2152A3  c8 cf 1b                 CP      W,0x1B
  2152A6  7f ad 00                 JRL     NC,0x215356
  2152A9  1d bc 6a 21              CALL    sub_216ABC
  2152AD  c9 db                    CP      A,3
  2152AF  67 31                    JR      C,loc_2152E2
  2152B1  33 15 00                 LD      HL,0x15
  2152B4  1d 5b 61 20              CALL    dyn_20615B
  2152B8  cf d8                    CP      L,0
  2152BA  6e 05                    JR      NZ,loc_2152C1
  2152BC  20 1b                    LD      W,0x1B
  2152BE  78 95 00                 JRL     0x215356

loc_2152C1:
  2152C1  c8 04                    PUSH    W
  2152C3  1d cb 60 20              CALL    dyn_2060CB
  2152C7  20 00                    LD      W,0
  2152C9  c9 0a 64                 DIV     WA,0x64
  2152CC  c8 89                    LD      A,W
  2152CE  c8 05                    POP     W
  2152D0  c9 cf 3c                 CP      A,0x3C
  2152D3  6f 0d                    JR      NC,loc_2152E2
  2152D5  20 1c                    LD      W,0x1C
  2152D7  68 7d                    JR      0x215356

loc_2152D9:
  2152D9  cc 88                    LD      W,D
  2152DB  c8 cf 49                 CP      W,0x49
  2152DE  6f 76                    JR      NC,0x215356
  2152E0  68 00                    JR      loc_2152E2

loc_2152E2:
  2152E2  24 00                    LD      D,0
  2152E4  33 50 00                 LD      HL,0x50
  2152E7  cd 89                    LD      A,E
  2152E9  d8 12                    EXTZ    WA
  2152EB  d8 83                    ADD     HL,WA
  2152ED  1d 5b 61 20              CALL    dyn_20615B
  2152F1  cf d9                    CP      L,1
  2152F3  6e 02                    JR      NZ,loc_2152F7
  2152F5  cc 61                    INC     1,D

loc_2152F7:
  2152F7  33 0a 00                 LD      HL,0xA
  2152FA  1d 5b 61 20              CALL    dyn_20615B
  2152FE  cf d9                    CP      L,1
  215300  66 0d                    JR      Z,loc_21530F
  215302  33 0b 00                 LD      HL,0xB
  215305  1d 5b 61 20              CALL    dyn_20615B
  215309  cf d9                    CP      L,1
  21530B  66 02                    JR      Z,loc_21530F
  21530D  68 02                    JR      loc_215311

loc_21530F:
  21530F  cc 62                    INC     2,D

loc_215311:
  215311  cd df                    CP      E,7
  215313  66 07                    JR      Z,loc_21531C
  215315  cd cf 08                 CP      E,8
  215318  66 17                    JR      Z,loc_215331
  21531A  68 1e                    JR      loc_21533A

loc_21531C:
  21531C  8e 15 21                 LD      A,(XIZ+0x15)
  21531F  c9 da                    CP      A,2
  215321  66 06                    JR      Z,loc_215329
  215323  c9 dc                    CP      A,4
  215325  66 06                    JR      Z,loc_21532D
  215327  68 11                    JR      loc_21533A

loc_215329:
  215329  25 0e                    LD      E,0xE
  21532B  68 0d                    JR      loc_21533A

loc_21532D:
  21532D  25 0f                    LD      E,0xF
  21532F  68 09                    JR      loc_21533A

loc_215331:
  215331  8e 15 21                 LD      A,(XIZ+0x15)
  215334  c9 db                    CP      A,3
  215336  66 02                    JR      Z,loc_21533A
  215338  25 10                    LD      E,0x10

loc_21533A:
  21533A  cd 89                    LD      A,E
  21533C  d8 12                    EXTZ    WA
  21533E  e8 12                    EXTZ    XWA
  215340  e8 ee 02                 SLL     2,XWA
  215343  e8 8b                    LD      XHL,XWA
  215345  cc 89                    LD      A,D
  215347  d8 12                    EXTZ    WA
  215349  e8 12                    EXTZ    XWA
  21534B  e8 83                    ADD     XHL,XWA
  21534D  40 08 a3 24 00           LD      XWA,0x24A308
  215352  e8 83                    ADD     XHL,XWA
  215354  83 20                    LD      W,(XHL)
  215356  59                       POP     XBC
  215357  5a                       POP     XDE
  215358  5b                       POP     XHL
  215359  0e                       RET

dyn_21535A:
  21535A  3b                       PUSH    XHL
  21535B  3a                       PUSH    XDE
  21535C  39                       PUSH    XBC
  21535D  8e 15 21                 LD      A,(XIZ+0x15)
  215360  c9 dd                    CP      A,5
  215362  66 15                    JR      Z,dyn_215379
  215364  c9 de                    CP      A,6
  215366  76 49 01                 JRL     Z,loc_2154B2
  215369  c9 df                    CP      A,7
  21536B  76 81 01                 JRL     Z,dyn_2154EF
  21536E  c9 cf 08                 CP      A,8
  215371  76 7f 01                 JRL     Z,loc_2154F3
  215374  20 ff                    LD      W,0xFF
  215376  78 7e 01                 JRL     dyn_2154F7

dyn_215379:
  215379  1d a2 6a 21              CALL    dyn_216AA2
  21537D  c9 cf 0a                 CP      A,0xA
  215380  76 1c 01                 JRL     Z,loc_21549F
  215383  c9 cf 08                 CP      A,8
  215386  66 7b                    JR      Z,loc_215403
  215388  c9 d8                    CP      A,0
  21538A  66 05                    JR      Z,dyn_215391
  21538C  20 ff                    LD      W,0xFF
  21538E  78 66 01                 JRL     dyn_2154F7

dyn_215391:
  215391  33 4e 00                 LD      HL,0x4E
  215394  1d 5b 61 20              CALL    dyn_20615B
  215398  cf d8                    CP      L,0
  21539A  66 62                    JR      Z,loc_2153FE
  21539C  33 40 00                 LD      HL,0x40
  21539F  1d 5b 61 20              CALL    dyn_20615B
  2153A3  cf d8                    CP      L,0
  2153A5  66 52                    JR      Z,dyn_2153F9
  2153A7  33 41 00                 LD      HL,0x41
  2153AA  1d 5b 61 20              CALL    dyn_20615B
  2153AE  cf d8                    CP      L,0
  2153B0  66 47                    JR      Z,dyn_2153F9
  2153B2  33 43 00                 LD      HL,0x43
  2153B5  1d 5b 61 20              CALL    dyn_20615B
  2153B9  cf d8                    CP      L,0
  2153BB  66 3c                    JR      Z,dyn_2153F9
  2153BD  33 45 00                 LD      HL,0x45
  2153C0  1d 5b 61 20              CALL    dyn_20615B
  2153C4  cf d8                    CP      L,0
  2153C6  66 31                    JR      Z,dyn_2153F9
  2153C8  33 47 00                 LD      HL,0x47
  2153CB  1d 5b 61 20              CALL    dyn_20615B
  2153CF  cf d8                    CP      L,0
  2153D1  66 26                    JR      Z,dyn_2153F9
  2153D3  33 48 00                 LD      HL,0x48
  2153D6  1d 5b 61 20              CALL    dyn_20615B
  2153DA  cf d8                    CP      L,0
  2153DC  66 1b                    JR      Z,dyn_2153F9
  2153DE  33 4a 00                 LD      HL,0x4A
  2153E1  1d 5b 61 20              CALL    dyn_20615B
  2153E5  cf d8                    CP      L,0
  2153E7  66 10                    JR      Z,dyn_2153F9
  2153E9  33 4b 00                 LD      HL,0x4B
  2153EC  1d 5b 61 20              CALL    dyn_20615B
  2153F0  cf d8                    CP      L,0
  2153F2  66 05                    JR      Z,dyn_2153F9
  2153F4  20 02                    LD      W,2
  2153F6  78 fe 00                 JRL     dyn_2154F7

dyn_2153F9:
  2153F9  20 01                    LD      W,1
  2153FB  78 f9 00                 JRL     dyn_2154F7

loc_2153FE:
  2153FE  20 00                    LD      W,0
  215400  78 f4 00                 JRL     dyn_2154F7

loc_215403:
  215403  33 4e 00                 LD      HL,0x4E
  215406  1d 5b 61 20              CALL    dyn_20615B
  21540A  cf d8                    CP      L,0
  21540C  76 8c 00                 JRL     Z,loc_21549B
  21540F  33 40 00                 LD      HL,0x40
  215412  1d 5b 61 20              CALL    dyn_20615B
  215416  cf d8                    CP      L,0
  215418  66 7d                    JR      Z,loc_215497
  21541A  33 42 00                 LD      HL,0x42
  21541D  1d 5b 61 20              CALL    dyn_20615B
  215421  cf d8                    CP      L,0
  215423  66 72                    JR      Z,loc_215497
  215425  33 43 00                 LD      HL,0x43
  215428  1d 5b 61 20              CALL    dyn_20615B
  21542C  cf d8                    CP      L,0
  21542E  66 67                    JR      Z,loc_215497
  215430  33 45 00                 LD      HL,0x45
  215433  1d 5b 61 20              CALL    dyn_20615B
  215437  cf d8                    CP      L,0
  215439  66 5c                    JR      Z,loc_215497
  21543B  33 46 00                 LD      HL,0x46
  21543E  1d 5b 61 20              CALL    dyn_20615B
  215442  cf d8                    CP      L,0
  215444  66 51                    JR      Z,loc_215497
  215446  33 47 00                 LD      HL,0x47
  215449  1d 5b 61 20              CALL    dyn_20615B
  21544D  cf d8                    CP      L,0
  21544F  66 46                    JR      Z,loc_215497
  215451  33 48 00                 LD      HL,0x48
  215454  1d 5b 61 20              CALL    dyn_20615B
  215458  cf d8                    CP      L,0
  21545A  66 3b                    JR      Z,loc_215497
  21545C  33 49 00                 LD      HL,0x49
  21545F  1d 5b 61 20              CALL    dyn_20615B
  215463  cf d8                    CP      L,0
  215465  66 30                    JR      Z,loc_215497
  215467  33 4a 00                 LD      HL,0x4A
  21546A  1d 5b 61 20              CALL    dyn_20615B
  21546E  cf d8                    CP      L,0
  215470  66 25                    JR      Z,loc_215497
  215472  33 4b 00                 LD      HL,0x4B
  215475  1d 5b 61 20              CALL    dyn_20615B
  215479  cf d8                    CP      L,0
  21547B  66 1a                    JR      Z,loc_215497
  21547D  33 4c 00                 LD      HL,0x4C
  215480  1d 5b 61 20              CALL    dyn_20615B
  215484  cf d8                    CP      L,0
  215486  66 0f                    JR      Z,loc_215497
  215488  33 4d 00                 LD      HL,0x4D
  21548B  1d 5b 61 20              CALL    dyn_20615B
  21548F  cf d8                    CP      L,0
  215491  66 04                    JR      Z,loc_215497
  215493  20 05                    LD      W,5
  215495  68 60                    JR      dyn_2154F7

loc_215497:
  215497  20 04                    LD      W,4
  215499  68 5c                    JR      dyn_2154F7

loc_21549B:
  21549B  20 03                    LD      W,3
  21549D  68 58                    JR      dyn_2154F7

loc_21549F:
  21549F  33 4e 00                 LD      HL,0x4E
  2154A2  1d 5b 61 20              CALL    dyn_20615B
  2154A6  cf d8                    CP      L,0
  2154A8  66 04                    JR      Z,loc_2154AE
  2154AA  20 ff                    LD      W,0xFF
  2154AC  68 49                    JR      dyn_2154F7

loc_2154AE:
  2154AE  20 0e                    LD      W,0xE
  2154B0  68 45                    JR      dyn_2154F7

loc_2154B2:
  2154B2  33 43 00                 LD      HL,0x43
  2154B5  1d 5b 61 20              CALL    dyn_20615B
  2154B9  cf d9                    CP      L,1
  2154BB  66 19                    JR      Z,loc_2154D6
  2154BD  1d a2 6a 21              CALL    dyn_216AA2
  2154C1  c9 cf 08                 CP      A,8
  2154C4  66 0c                    JR      Z,loc_2154D2
  2154C6  c9 d8                    CP      A,0
  2154C8  66 04                    JR      Z,loc_2154CE
  2154CA  20 ff                    LD      W,0xFF
  2154CC  68 29                    JR      dyn_2154F7

loc_2154CE:
  2154CE  20 00                    LD      W,0
  2154D0  68 25                    JR      dyn_2154F7

loc_2154D2:
  2154D2  20 04                    LD      W,4
  2154D4  68 21                    JR      dyn_2154F7

loc_2154D6:
  2154D6  1d a2 6a 21              CALL    dyn_216AA2
  2154DA  c9 cf 08                 CP      A,8
  2154DD  66 0c                    JR      Z,loc_2154EB
  2154DF  c9 d8                    CP      A,0
  2154E1  66 04                    JR      Z,loc_2154E7
  2154E3  20 ff                    LD      W,0xFF
  2154E5  68 10                    JR      dyn_2154F7

loc_2154E7:
  2154E7  20 03                    LD      W,3
  2154E9  68 0c                    JR      dyn_2154F7

loc_2154EB:
  2154EB  20 07                    LD      W,7
  2154ED  68 08                    JR      dyn_2154F7

dyn_2154EF:
  2154EF  20 00                    LD      W,0
  2154F1  68 04                    JR      dyn_2154F7

loc_2154F3:
  2154F3  20 00                    LD      W,0
  2154F5  68 00                    JR      dyn_2154F7

dyn_2154F7:
  2154F7  59                       POP     XBC
  2154F8  5a                       POP     XDE
  2154F9  5b                       POP     XHL
  2154FA  0e                       RET

dyn_2154FB:
  2154FB  3b                       PUSH    XHL
  2154FC  3a                       PUSH    XDE
  2154FD  39                       PUSH    XBC
  2154FE  38                       PUSH    XWA
  2154FF  1e 5f fc                 CALR    dyn_215161
  215502  8b 02 21                 LD      A,(XHL+2)
  215505  c9 d8                    CP      A,0
  215507  76 ff 00                 JRL     Z,dyn_215609
  21550A  c9 8f                    LD      L,A
  21550C  db 12                    EXTZ    HL
  21550E  14                       PUSH    A
  21550F  1d 2e 61 20              CALL    dyn_20612E
  215513  15                       POP     A
  215514  c9 d9                    CP      A,1
  215516  66 13                    JR      Z,loc_21552B
  215518  c9 cf 09                 CP      A,9
  21551B  66 67                    JR      Z,loc_215584
  21551D  c9 cf 4d                 CP      A,0x4D
  215520  66 6f                    JR      Z,loc_215591
  215522  c9 cf 4a                 CP      A,0x4A
  215525  76 81 00                 JRL     Z,loc_2155A9
  215528  78 de 00                 JRL     dyn_215609

loc_21552B:
  21552B  db a8                    LD      HL,0
  21552D  1d 44 61 20              CALL    sub_206144
  215531  1d 1a 69 21              CALL    sub_21691A
  215535  21 01                    LD      A,1
  215537  f1 45 50 41              LD      (0x5045),A
  21553B  30 26 00                 LD      WA,0x26
  21553E  1d 97 61 20              CALL    0x206197
  215542  30 26 00                 LD      WA,0x26
  215545  1d 97 61 20              CALL    0x206197
  215549  30 26 00                 LD      WA,0x26
  21554C  1d 97 61 20              CALL    0x206197
  215550  30 34 00                 LD      WA,0x34
  215553  1d 97 61 20              CALL    0x206197
  215557  30 34 00                 LD      WA,0x34
  21555A  1d 97 61 20              CALL    0x206197
  21555E  30 34 00                 LD      WA,0x34
  215561  1d 97 61 20              CALL    0x206197
  215565  30 39 00                 LD      WA,0x39
  215568  1d 97 61 20              CALL    0x206197
  21556C  30 39 00                 LD      WA,0x39
  21556F  1d 97 61 20              CALL    0x206197
  215573  30 39 00                 LD      WA,0x39
  215576  1d 97 61 20              CALL    0x206197
  21557A  30 f4 01                 LD      WA,0x1F4
  21557D  1d e4 8a 20              CALL    sub_208AE4
  215581  78 85 00                 JRL     dyn_215609

loc_215584:
  215584  33 08 00                 LD      HL,8
  215587  1d 44 61 20              CALL    sub_206144
  21558B  1d 1a 69 21              CALL    sub_21691A
  21558F  68 78                    JR      dyn_215609

loc_215591:
  215591  1d a2 6a 21              CALL    dyn_216AA2
  215595  c9 da                    CP      A,2
  215597  67 70                    JR      C,dyn_215609
  215599  c9 cf 09                 CP      A,9
  21559C  6f 6b                    JR      NC,dyn_215609
  21559E  28                       PUSH    WA
  21559F  30 ff 00                 LD      WA,0xFF
  2155A2  1d 97 61 20              CALL    0x206197
  2155A6  48                       POP     WA
  2155A7  68 60                    JR      dyn_215609

loc_2155A9:
  2155A9  1d a2 6a 21              CALL    dyn_216AA2
  2155AD  c9 d9                    CP      A,1
  2155AF  67 58                    JR      C,dyn_215609
  2155B1  c9 cf 09                 CP      A,9
  2155B4  6f 53                    JR      NC,dyn_215609
  2155B6  c9 ca 01                 SUB     A,1
  2155B9  d8 12                    EXTZ    WA
  2155BB  e8 12                    EXTZ    XWA
  2155BD  e8 ee 02                 SLL     2,XWA
  2155C0  43 dc a1 24 00           LD      XHL,0x24A1DC
  2155C5  e8 83                    ADD     XHL,XWA
  2155C7  83 21                    LD      A,(XHL)
  2155C9  d8 12                    EXTZ    WA
  2155CB  d1 27 50 21              LD      BC,(0x5027)
  2155CF  d9 80                    ADD     WA,BC
  2155D1  f1 27 50 50              LD      (0x5027),WA
  2155D5  eb 61                    INC     1,XHL
  2155D7  83 21                    LD      A,(XHL)
  2155D9  d8 12                    EXTZ    WA
  2155DB  d1 29 50 21              LD      BC,(0x5029)
  2155DF  d9 80                    ADD     WA,BC
  2155E1  f1 29 50 50              LD      (0x5029),WA
  2155E5  eb 61                    INC     1,XHL
  2155E7  83 21                    LD      A,(XHL)
  2155E9  d8 12                    EXTZ    WA
  2155EB  d1 2b 50 21              LD      BC,(0x502B)
  2155EF  d9 80                    ADD     WA,BC
  2155F1  f1 2b 50 50              LD      (0x502B),WA
  2155F5  eb 61                    INC     1,XHL
  2155F7  83 21                    LD      A,(XHL)
  2155F9  d8 12                    EXTZ    WA
  2155FB  d1 2d 50 21              LD      BC,(0x502D)
  2155FF  d9 80                    ADD     WA,BC
  215601  f1 2d 50 50              LD      (0x502D),WA
  215605  eb 61                    INC     1,XHL
  215607  68 00                    JR      dyn_215609

dyn_215609:
  215609  1e 55 fb                 CALR    dyn_215161
  21560C  8b 03 21                 LD      A,(XHL+3)
  21560F  c9 cf ff                 CP      A,0xFF
  215612  76 1a 01                 JRL     Z,loc_21572F
  215615  c9 cf fd                 CP      A,0xFD
  215618  76 06 01                 JRL     Z,dyn_215721
  21561B  c9 cf fb                 CP      A,0xFB
  21561E  76 00 01                 JRL     Z,dyn_215721
  215621  c9 cf f9                 CP      A,0xF9
  215624  76 fa 00                 JRL     Z,dyn_215721
  215627  c9 cf f8                 CP      A,0xF8
  21562A  76 f4 00                 JRL     Z,dyn_215721
  21562D  c9 cf f5                 CP      A,0xF5
  215630  66 4f                    JR      Z,loc_215681
  215632  c9 cf f4                 CP      A,0xF4
  215635  66 4f                    JR      Z,loc_215686
  215637  c9 cf f3                 CP      A,0xF3
  21563A  66 52                    JR      Z,loc_21568E
  21563C  c9 cf f2                 CP      A,0xF2
  21563F  66 52                    JR      Z,loc_215693
  215641  c9 cf f0                 CP      A,0xF0
  215644  66 55                    JR      Z,dyn_21569B
  215646  c9 cf ef                 CP      A,0xEF
  215649  66 5d                    JR      Z,loc_2156A8
  21564B  c9 cf ee                 CP      A,0xEE
  21564E  66 65                    JR      Z,loc_2156B5
  215650  c9 cf ed                 CP      A,0xED
  215653  66 6c                    JR      Z,loc_2156C1
  215655  c9 cf ec                 CP      A,0xEC
  215658  66 6c                    JR      Z,loc_2156C6
  21565A  c9 cf eb                 CP      A,0xEB
  21565D  66 6e                    JR      Z,loc_2156CD
  21565F  c9 cf ea                 CP      A,0xEA
  215662  66 6e                    JR      Z,loc_2156D2
  215664  c9 cf e9                 CP      A,0xE9
  215667  66 70                    JR      Z,loc_2156D9
  215669  c9 cf e8                 CP      A,0xE8
  21566C  76 86 00                 JRL     Z,loc_2156F5
  21566F  c9 cf e7                 CP      A,0xE7
  215672  76 8f 00                 JRL     Z,loc_215704
  215675  c9 cf e6                 CP      A,0xE6
  215678  76 9f 00                 JRL     Z,loc_21571A
  21567B  be 12 41                 LD      (XIZ+0x12),A
  21567E  78 b8 00                 JRL     0x215739

loc_215681:
  215681  21 00                    LD      A,0
  215683  be 27 41                 LD      (XIZ+0x27),A

loc_215686:
  215686  21 07                    LD      A,7
  215688  be 0e 41                 LD      (XIZ+0xE),A
  21568B  78 ab 00                 JRL     0x215739

loc_21568E:
  21568E  21 00                    LD      A,0
  215690  be 27 41                 LD      (XIZ+0x27),A

loc_215693:
  215693  21 08                    LD      A,8
  215695  be 0e 41                 LD      (XIZ+0xE),A
  215698  78 9e 00                 JRL     0x215739

dyn_21569B:
  21569B  21 f0                    LD      A,0xF0
  21569D  be 11 41                 LD      (XIZ+0x11),A
  2156A0  21 08                    LD      A,8
  2156A2  be 0f 41                 LD      (XIZ+0xF),A
  2156A5  78 91 00                 JRL     0x215739

loc_2156A8:
  2156A8  21 ef                    LD      A,0xEF
  2156AA  be 11 41                 LD      (XIZ+0x11),A
  2156AD  21 08                    LD      A,8
  2156AF  be 0f 41                 LD      (XIZ+0xF),A
  2156B2  78 84 00                 JRL     0x215739

loc_2156B5:
  2156B5  21 ee                    LD      A,0xEE
  2156B7  be 11 41                 LD      (XIZ+0x11),A
  2156BA  21 08                    LD      A,8
  2156BC  be 0f 41                 LD      (XIZ+0xF),A
  2156BF  68 78                    JR      0x215739

loc_2156C1:
  2156C1  21 00                    LD      A,0
  2156C3  be 27 41                 LD      (XIZ+0x27),A

loc_2156C6:
  2156C6  21 09                    LD      A,9
  2156C8  be 0e 41                 LD      (XIZ+0xE),A
  2156CB  68 6c                    JR      0x215739

loc_2156CD:
  2156CD  21 01                    LD      A,1
  2156CF  be 27 41                 LD      (XIZ+0x27),A

loc_2156D2:
  2156D2  21 0a                    LD      A,0xA
  2156D4  be 0e 41                 LD      (XIZ+0xE),A
  2156D7  68 60                    JR      0x215739

loc_2156D9:
  2156D9  c8 04                    PUSH    W
  2156DB  30 ff 00                 LD      WA,0xFF
  2156DE  1d d6 61 20              CALL    0x2061D6
  2156E2  c8 05                    POP     W
  2156E4  c9 ca 02                 SUB     A,2
  2156E7  67 46                    JR      C,loc_21572F
  2156E9  c9 dd                    CP      A,5
  2156EB  6f 42                    JR      NC,loc_21572F
  2156ED  c9 c8 4e                 ADD     A,0x4E
  2156F0  be 12 41                 LD      (XIZ+0x12),A
  2156F3  68 44                    JR      0x215739

loc_2156F5:
  2156F5  1d a2 6a 21              CALL    dyn_216AA2
  2156F9  c9 ca 03                 SUB     A,3
  2156FC  c9 c8 49                 ADD     A,0x49
  2156FF  be 12 41                 LD      (XIZ+0x12),A
  215702  68 35                    JR      0x215739

loc_215704:
  215704  c8 04                    PUSH    W
  215706  30 ff 00                 LD      WA,0xFF
  215709  1d d6 61 20              CALL    0x2061D6
  21570D  c8 05                    POP     W
  21570F  c9 d8                    CP      A,0
  215711  66 1c                    JR      Z,loc_21572F
  215713  21 53                    LD      A,0x53
  215715  be 12 41                 LD      (XIZ+0x12),A
  215718  68 1f                    JR      0x215739

loc_21571A:
  21571A  21 0b                    LD      A,0xB
  21571C  be 0e 41                 LD      (XIZ+0xE),A
  21571F  68 18                    JR      0x215739

dyn_215721:
  215721  20 fd                    LD      W,0xFD
  215723  c9 a0                    SUB     W,A
  215725  be 11 40                 LD      (XIZ+0x11),W
  215728  21 04                    LD      A,4
  21572A  be 0f 41                 LD      (XIZ+0xF),A
  21572D  68 0a                    JR      0x215739

loc_21572F:
  21572F  21 04                    LD      A,4
  215731  be 0f 41                 LD      (XIZ+0xF),A
  215734  21 ff                    LD      A,0xFF
  215736  be 11 41                 LD      (XIZ+0x11),A
  215739  1e 05 00                 CALR    dyn_215741
  21573C  58                       POP     XWA
  21573D  59                       POP     XBC
  21573E  5a                       POP     XDE
  21573F  5b                       POP     XHL
  215740  0e                       RET

dyn_215741:
  215741  14                       PUSH    A
  215742  21 00                    LD      A,0
  215744  be 25 41                 LD      (XIZ+0x25),A
  215747  15                       POP     A
  215748  0e                       RET

dyn_215749:
  215749  14                       PUSH    A
  21574A  21 ff                    LD      A,0xFF
  21574C  be 12 41                 LD      (XIZ+0x12),A
  21574F  21 00                    LD      A,0
  215751  be 25 41                 LD      (XIZ+0x25),A
  215754  21 02                    LD      A,2
  215756  be 0f 41                 LD      (XIZ+0xF),A
  215759  21 06                    LD      A,6
  21575B  be 0e 41                 LD      (XIZ+0xE),A
  21575E  15                       POP     A
  21575F  0e                       RET

dyn_215760:
  215760  1e f7 fb                 CALR    dyn_21535A
  215763  c8 cf ff                 CP      W,0xFF
  215766  6e 22                    JR      NZ,dyn_21578A
  215768  8e 15 21                 LD      A,(XIZ+0x15)
  21576B  c9 dd                    CP      A,5
  21576D  66 08                    JR      Z,loc_215777
  21576F  c9 de                    CP      A,6
  215771  66 08                    JR      Z,loc_21577B
  215773  21 00                    LD      A,0
  215775  68 08                    JR      loc_21577F

loc_215777:
  215777  21 01                    LD      A,1
  215779  68 04                    JR      loc_21577F

loc_21577B:
  21577B  21 03                    LD      A,3
  21577D  68 00                    JR      loc_21577F

loc_21577F:
  21577F  be 11 41                 LD      (XIZ+0x11),A
  215782  21 0c                    LD      A,0xC
  215784  be 0e 41                 LD      (XIZ+0xE),A
  215787  78 97 00                 JRL     0x215821

dyn_21578A:
  21578A  1e bc ff                 CALR    dyn_215749
  21578D  be 12 40                 LD      (XIZ+0x12),W
  215790  1d cf 67 21              CALL    dyn_2167CF
  215794  8e 15 21                 LD      A,(XIZ+0x15)
  215797  c9 df                    CP      A,7
  215799  66 48                    JR      Z,dyn_2157E3
  21579B  c9 cf 08                 CP      A,8
  21579E  66 43                    JR      Z,dyn_2157E3
  2157A0  1e 80 f5                 CALR    dyn_214D23
  2157A3  1d e4 67 21              CALL    dyn_2167E4
  2157A7  21 00                    LD      A,0
  2157A9  be 13 41                 LD      (XIZ+0x13),A
  2157AC  1d de 6e 21              CALL    dyn_216EDE
  2157B0  1d b1 6f 21              CALL    dyn_216FB1
  2157B4  1d 6b 6f 21              CALL    dyn_216F6B
  2157B8  8e 15 21                 LD      A,(XIZ+0x15)
  2157BB  c9 dd                    CP      A,5
  2157BD  66 13                    JR      Z,dyn_2157D2
  2157BF  c9 de                    CP      A,6
  2157C1  6e 1e                    JR      NZ,dyn_2157E1
  2157C3  e8 ab                    LD      XWA,3
  2157C5  1d 59 77 20              CALL    dyn_207759
  2157C9  30 23 00                 LD      WA,0x23
  2157CC  1d 6a 77 20              CALL    dyn_20776A
  2157D0  68 0f                    JR      dyn_2157E1

dyn_2157D2:
  2157D2  e8 aa                    LD      XWA,2
  2157D4  1d 59 77 20              CALL    dyn_207759
  2157D8  30 22 00                 LD      WA,0x22
  2157DB  1d 6a 77 20              CALL    dyn_20776A
  2157DF  68 00                    JR      dyn_2157E1

dyn_2157E1:
  2157E1  68 3e                    JR      0x215821

dyn_2157E3:
  2157E3  8e 15 20                 LD      W,(XIZ+0x15)
  2157E6  8e 12 21                 LD      A,(XIZ+0x12)
  2157E9  1e ab f5                 CALR    dyn_214D97
  2157EC  8b 01 27                 LD      L,(XHL+1)
  2157EF  db 12                    EXTZ    HL
  2157F1  1d 45 68 21              CALL    dyn_216845
  2157F5  d9 a8                    LD      BC,0
  2157F7  da a8                    LD      DE,0
  2157F9  1d ba 03 21              CALL    dyn_2103BA
  2157FD  1d c9 66 21              CALL    dyn_2166C9
  215801  21 00                    LD      A,0
  215803  be 13 41                 LD      (XIZ+0x13),A
  215806  e8 ac                    LD      XWA,4
  215808  1d 59 77 20              CALL    dyn_207759
  21580C  30 24 00                 LD      WA,0x24
  21580F  1d 6a 77 20              CALL    dyn_20776A
  215813  1d 3a 6e 21              CALL    dyn_216E3A
  215817  21 07                    LD      A,7
  215819  be 0f 41                 LD      (XIZ+0xF),A
  21581C  21 00                    LD      A,0
  21581E  be 2d 41                 LD      (XIZ+0x2D),A
  215821  0e                       RET

dyn_215822:
  215822  3b                       PUSH    XHL
  215823  3a                       PUSH    XDE
  215824  39                       PUSH    XBC
  215825  38                       PUSH    XWA
  215826  8e 23 23                 LD      C,(XIZ+0x23)
  215829  cb cf ff                 CP      C,0xFF
  21582C  66 19                    JR      Z,0x215847
  21582E  8e 24 22                 LD      B,(XIZ+0x24)
  215831  ca 69                    DEC     1,B
  215833  be 24 42                 LD      (XIZ+0x24),B
  215836  7e e6 00                 JRL     NZ,0x21591F
  215839  21 01                    LD      A,1
  21583B  1d 8a 74 20              CALL    sub_20748A
  21583F  b8 10 43                 LD      (XWA+0x10),C
  215842  21 ff                    LD      A,0xFF
  215844  be 23 41                 LD      (XIZ+0x23),A
  215847  21 01                    LD      A,1
  215849  1d 8a 74 20              CALL    sub_20748A
  21584D  a8 08 23                 LD      XHL,(XWA+8)
  215850  eb cf 00 00 00 00        CP      XHL,0
  215856  66 65                    JR      Z,dyn_2158BD
  215858  88 12 23                 LD      C,(XWA+0x12)
  21585B  cb cc 7f                 AND     C,0x7F
  21585E  cb da                    CP      C,2
  215860  6e 05                    JR      NZ,0x215867
  215862  21 01                    LD      A,1
  215864  be 26 41                 LD      (XIZ+0x26),A
  215867  c1 df 5c 21              LD      A,(0x5CDF)
  21586B  c9 cf 20                 CP      A,0x20
  21586E  6e 1d                    JR      NZ,dyn_21588D
  215870  8e 15 21                 LD      A,(XIZ+0x15)
  215873  c9 df                    CP      A,7
  215875  6e 16                    JR      NZ,dyn_21588D
  215877  21 01                    LD      A,1
  215879  1d 11 76 20              CALL    dyn_207611
  21587D  1e c1 fe                 CALR    dyn_215741
  215880  21 ef                    LD      A,0xEF
  215882  be 11 41                 LD      (XIZ+0x11),A
  215885  21 08                    LD      A,8
  215887  be 0f 41                 LD      (XIZ+0xF),A
  21588A  78 92 00                 JRL     0x21591F

dyn_21588D:
  21588D  c1 df 5c 21              LD      A,(0x5CDF)
  215891  c9 cc 30                 AND     A,0x30
  215894  76 88 00                 JRL     Z,0x21591F
  215897  8e 26 21                 LD      A,(XIZ+0x26)
  21589A  c9 d8                    CP      A,0
  21589C  66 07                    JR      Z,dyn_2158A5
  21589E  21 00                    LD      A,0
  2158A0  be 26 41                 LD      (XIZ+0x26),A
  2158A3  68 7a                    JR      0x21591F

dyn_2158A5:
  2158A5  21 01                    LD      A,1
  2158A7  1d 8a 74 20              CALL    sub_20748A
  2158AB  88 10 23                 LD      C,(XWA+0x10)
  2158AE  be 23 43                 LD      (XIZ+0x23),C
  2158B1  cb 61                    INC     1,C
  2158B3  be 24 43                 LD      (XIZ+0x24),C
  2158B6  23 00                    LD      C,0
  2158B8  b8 10 43                 LD      (XWA+0x10),C
  2158BB  68 62                    JR      0x21591F

dyn_2158BD:
  2158BD  8e 25 21                 LD      A,(XIZ+0x25)
  2158C0  c9 d8                    CP      A,0
  2158C2  66 0a                    JR      Z,dyn_2158CE
  2158C4  21 01                    LD      A,1
  2158C6  be 25 41                 LD      (XIZ+0x25),A
  2158C9  1e 2f fc                 CALR    dyn_2154FB
  2158CC  68 51                    JR      0x21591F

dyn_2158CE:
  2158CE  8e 12 20                 LD      W,(XIZ+0x12)
  2158D1  c8 cf ff                 CP      W,0xFF
  2158D4  6e 06                    JR      NZ,0x2158DC
  2158D6  1e 81 fa                 CALR    dyn_21535A
  2158D9  be 12 40                 LD      (XIZ+0x12),W
  2158DC  8e 12 20                 LD      W,(XIZ+0x12)
  2158DF  1e f6 f8                 CALR    dyn_2151D8
  2158E2  be 12 40                 LD      (XIZ+0x12),W
  2158E5  1e d0 f8                 CALR    dyn_2151B8
  2158E8  1e 76 f8                 CALR    dyn_215161
  2158EB  ab 04 23                 LD      XHL,(XHL+4)
  2158EE  eb cf 58 00 00 00        CP      XHL,0x58
  2158F4  6f 16                    JR      NC,0x21590C
  2158F6  1d 0c 6b 21              CALL    dyn_216B0C
  2158FA  d8 12                    EXTZ    WA
  2158FC  e8 12                    EXTZ    XWA
  2158FE  e8 ee 02                 SLL     2,XWA
  215901  e8 83                    ADD     XHL,XWA
  215903  40 83 96 25 00           LD      XWA,0x259683
  215908  e8 83                    ADD     XHL,XWA
  21590A  a3 23                    LD      XHL,(XHL)
  21590C  21 01                    LD      A,1
  21590E  1d 8a 74 20              CALL    sub_20748A
  215912  b8 08 63                 LD      (XWA+8),XHL
  215915  21 00                    LD      A,0
  215917  be 26 41                 LD      (XIZ+0x26),A
  21591A  21 02                    LD      A,2
  21591C  be 25 41                 LD      (XIZ+0x25),A
  21591F  58                       POP     XWA
  215920  59                       POP     XBC
  215921  5a                       POP     XDE
  215922  5b                       POP     XHL
  215923  0e                       RET

dyn_215924:
  215924  8e 0f 21                 LD      A,(XIZ+0xF)
  215927  c9 d9                    CP      A,1
  215929  6e 08                    JR      NZ,dyn_215933
  21592B  21 02                    LD      A,2
  21592D  be 0f 41                 LD      (XIZ+0xF),A
  215930  78 b5 01                 JRL     0x215AE8

dyn_215933:
  215933  c9 da                    CP      A,2
  215935  6e 05                    JR      NZ,0x21593C
  215937  21 03                    LD      A,3
  215939  be 0f 41                 LD      (XIZ+0xF),A
  21593C  c9 db                    CP      A,3
  21593E  6e 06                    JR      NZ,dyn_215946
  215940  1e df fe                 CALR    dyn_215822
  215943  78 a2 01                 JRL     0x215AE8

dyn_215946:
  215946  c9 dc                    CP      A,4
  215948  6e 36                    JR      NZ,dyn_215980
  21594A  1e 20 f8                 CALR    dyn_21516D
  21594D  8e 11 21                 LD      A,(XIZ+0x11)
  215950  c9 d8                    CP      A,0
  215952  66 20                    JR      Z,dyn_215974
  215954  c9 d9                    CP      A,1
  215956  66 1c                    JR      Z,dyn_215974
  215958  c9 da                    CP      A,2
  21595A  66 18                    JR      Z,dyn_215974
  21595C  c9 db                    CP      A,3
  21595E  66 14                    JR      Z,dyn_215974
  215960  c9 dc                    CP      A,4
  215962  66 10                    JR      Z,dyn_215974
  215964  c9 dd                    CP      A,5
  215966  66 0c                    JR      Z,dyn_215974
  215968  1e 39 f6                 CALR    sub_214FA4
  21596B  8e 1b 21                 LD      A,(XIZ+0x1B)
  21596E  be 10 41                 LD      (XIZ+0x10),A
  215971  78 74 01                 JRL     0x215AE8

dyn_215974:
  215974  1d f9 67 21              CALL    dyn_2167F9
  215978  21 0c                    LD      A,0xC
  21597A  be 0e 41                 LD      (XIZ+0xE),A
  21597D  78 68 01                 JRL     0x215AE8

dyn_215980:
  215980  c9 dd                    CP      A,5
  215982  6e 08                    JR      NZ,dyn_21598C
  215984  21 06                    LD      A,6
  215986  be 0f 41                 LD      (XIZ+0xF),A
  215989  78 5c 01                 JRL     0x215AE8

dyn_21598C:
  21598C  c9 de                    CP      A,6
  21598E  6e 08                    JR      NZ,dyn_215998
  215990  21 03                    LD      A,3
  215992  be 0f 41                 LD      (XIZ+0xF),A
  215995  78 50 01                 JRL     0x215AE8

dyn_215998:
  215998  c9 df                    CP      A,7
  21599A  6e 13                    JR      NZ,dyn_2159AF
  21599C  21 02                    LD      A,2
  21599E  1d 43 6e 21              CALL    dyn_216E43
  2159A2  c9 d9                    CP      A,1
  2159A4  76 41 01                 JRL     Z,0x215AE8
  2159A7  21 03                    LD      A,3
  2159A9  be 0f 41                 LD      (XIZ+0xF),A
  2159AC  78 39 01                 JRL     0x215AE8

dyn_2159AF:
  2159AF  c9 cf 08                 CP      A,8
  2159B2  7e ec 00                 JRL     NZ,dyn_215AA1
  2159B5  21 02                    LD      A,2
  2159B7  1d 67 6e 21              CALL    dyn_216E67
  2159BB  c9 d9                    CP      A,1
  2159BD  76 28 01                 JRL     Z,0x215AE8
  2159C0  8e 11 21                 LD      A,(XIZ+0x11)
  2159C3  c9 cf f0                 CP      A,0xF0
  2159C6  66 13                    JR      Z,dyn_2159DB
  2159C8  c9 cf ef                 CP      A,0xEF
  2159CB  66 59                    JR      Z,dyn_215A26
  2159CD  c9 cf ee                 CP      A,0xEE
  2159D0  76 91 00                 JRL     Z,loc_215A64
  2159D3  21 03                    LD      A,3
  2159D5  be 0f 41                 LD      (XIZ+0xF),A
  2159D8  78 0d 01                 JRL     0x215AE8

dyn_2159DB:
  2159DB  21 01                    LD      A,1
  2159DD  be 12 41                 LD      (XIZ+0x12),A
  2159E0  1d 03 68 20              CALL    dyn_206803
  2159E4  1d eb 66 21              CALL    dyn_2166EB
  2159E8  8e 15 20                 LD      W,(XIZ+0x15)
  2159EB  8e 12 21                 LD      A,(XIZ+0x12)
  2159EE  1e a6 f3                 CALR    dyn_214D97
  2159F1  8b 01 27                 LD      L,(XHL+1)
  2159F4  db 12                    EXTZ    HL
  2159F6  1d 45 68 21              CALL    dyn_216845
  2159FA  d9 a8                    LD      BC,0
  2159FC  da a8                    LD      DE,0
  2159FE  1d ba 03 21              CALL    dyn_2103BA
  215A02  1e 5c f7                 CALR    dyn_215161
  215A05  8b 00 21                 LD      A,(XHL+0)
  215A08  be 13 41                 LD      (XIZ+0x13),A
  215A0B  c9 8f                    LD      L,A
  215A0D  db 13                    EXTS    HL
  215A0F  d9 ac                    LD      BC,4
  215A11  da a8                    LD      DE,0
  215A13  cd c8 20                 ADD     E,0x20
  215A16  1d 49 68 21              CALL    dyn_216849
  215A1A  1d 80 03 21              CALL    dyn_210380
  215A1E  21 07                    LD      A,7
  215A20  be 0f 41                 LD      (XIZ+0xF),A
  215A23  78 c2 00                 JRL     0x215AE8

dyn_215A26:
  215A26  1d 03 68 20              CALL    dyn_206803
  215A2A  1d eb 66 21              CALL    dyn_2166EB
  215A2E  1d 57 67 21              CALL    dyn_216757
  215A32  1d 9e 67 21              CALL    dyn_21679E
  215A36  21 05                    LD      A,5
  215A38  be 15 41                 LD      (XIZ+0x15),A
  215A3B  21 00                    LD      A,0
  215A3D  be 12 41                 LD      (XIZ+0x12),A
  215A40  1e e0 f2                 CALR    dyn_214D23
  215A43  1e 72 f7                 CALR    dyn_2151B8
  215A46  1d 2f 71 21              CALL    dyn_21712F
  215A4A  1d 8e 6f 21              CALL    dyn_216F8E
  215A4E  1d b1 6f 21              CALL    dyn_216FB1
  215A52  1d 31 6e 21              CALL    dyn_216E31
  215A56  e8 aa                    LD      XWA,2
  215A58  1d 59 77 20              CALL    dyn_207759
  215A5C  21 09                    LD      A,9
  215A5E  be 0f 41                 LD      (XIZ+0xF),A
  215A61  78 84 00                 JRL     0x215AE8

loc_215A64:
  215A64  1d 03 68 20              CALL    dyn_206803
  215A68  1d eb 66 21              CALL    dyn_2166EB
  215A6C  1d 57 67 21              CALL    dyn_216757
  215A70  1d 9e 67 21              CALL    dyn_21679E
  215A74  21 05                    LD      A,5
  215A76  be 15 41                 LD      (XIZ+0x15),A
  215A79  21 0e                    LD      A,0xE
  215A7B  be 12 41                 LD      (XIZ+0x12),A
  215A7E  1e a2 f2                 CALR    dyn_214D23
  215A81  1e 34 f7                 CALR    dyn_2151B8
  215A84  1d e4 70 21              CALL    sub_2170E4
  215A88  1d 8e 6f 21              CALL    dyn_216F8E
  215A8C  1d b1 6f 21              CALL    dyn_216FB1
  215A90  1d 31 6e 21              CALL    dyn_216E31
  215A94  e8 aa                    LD      XWA,2
  215A96  1d 59 77 20              CALL    dyn_207759
  215A9A  21 0a                    LD      A,0xA
  215A9C  be 0f 41                 LD      (XIZ+0xF),A
  215A9F  68 47                    JR      0x215AE8

dyn_215AA1:
  215AA1  c9 cf 09                 CP      A,9
  215AA4  6e 1c                    JR      NZ,loc_215AC2
  215AA6  1d c3 6f 21              CALL    dyn_216FC3
  215AAA  c9 d9                    CP      A,1
  215AAC  66 3a                    JR      Z,0x215AE8
  215AAE  e8 aa                    LD      XWA,2
  215AB0  1d 59 77 20              CALL    dyn_207759
  215AB4  30 22 00                 LD      WA,0x22
  215AB7  1d 6a 77 20              CALL    dyn_20776A
  215ABB  21 03                    LD      A,3
  215ABD  be 0f 41                 LD      (XIZ+0xF),A
  215AC0  68 26                    JR      0x215AE8

loc_215AC2:
  215AC2  c9 cf 0a                 CP      A,0xA
  215AC5  6e 1c                    JR      NZ,loc_215AE3
  215AC7  1d c3 6f 21              CALL    dyn_216FC3
  215ACB  c9 d9                    CP      A,1
  215ACD  66 19                    JR      Z,0x215AE8
  215ACF  e8 aa                    LD      XWA,2
  215AD1  1d 59 77 20              CALL    dyn_207759
  215AD5  30 22 00                 LD      WA,0x22
  215AD8  1d 6a 77 20              CALL    dyn_20776A
  215ADC  21 03                    LD      A,3
  215ADE  be 0f 41                 LD      (XIZ+0xF),A
  215AE1  68 05                    JR      0x215AE8

loc_215AE3:
  215AE3  21 01                    LD      A,1
  215AE5  be 0f 41                 LD      (XIZ+0xF),A
  215AE8  8e 2d 21                 LD      A,(XIZ+0x2D)
  215AEB  c9 61                    INC     1,A
  215AED  be 2d 41                 LD      (XIZ+0x2D),A
  215AF0  0e                       RET

sub_215AF1:
  215AF1  23 00                    LD      C,0
  215AF3  25 02                    LD      E,2
  215AF5  21 01                    LD      A,1
  215AF7  1d 8a 76 20              CALL    sub_20768A
  215AFB  21 01                    LD      A,1
  215AFD  43 a3 9f 24 00           LD      XHL,0x249FA3
  215B02  1d f3 76 20              CALL    dyn_2076F3
  215B06  21 00                    LD      A,0
  215B08  be 10 41                 LD      (XIZ+0x10),A
  215B0B  21 00                    LD      A,0
  215B0D  be 2d 41                 LD      (XIZ+0x2D),A
  215B10  21 01                    LD      A,1
  215B12  be 27 41                 LD      (XIZ+0x27),A
  215B15  0e                       RET

sub_215B16:
  215B16  c1 df 5c 21              LD      A,(0x5CDF)
  215B1A  c9 33 04                 BIT     4,A
  215B1D  66 0b                    JR      Z,loc_215B2A
  215B1F  28                       PUSH    WA
  215B20  30 81 00                 LD      WA,0x81
  215B23  1d 6a 77 20              CALL    dyn_20776A
  215B27  48                       POP     WA
  215B28  68 6c                    JR      loc_215B96

loc_215B2A:
  215B2A  c9 33 05                 BIT     5,A
  215B2D  66 10                    JR      Z,loc_215B3F
  215B2F  28                       PUSH    WA
  215B30  30 82 00                 LD      WA,0x82
  215B33  1d 6a 77 20              CALL    dyn_20776A
  215B37  48                       POP     WA
  215B38  21 01                    LD      A,1
  215B3A  be 10 41                 LD      (XIZ+0x10),A
  215B3D  68 57                    JR      loc_215B96

loc_215B3F:
  215B3F  c9 cc 0f                 AND     A,0xF
  215B42  66 3b                    JR      Z,loc_215B7F
  215B44  c9 dc                    CP      A,4
  215B46  6e 19                    JR      NZ,loc_215B61
  215B48  8e 10 21                 LD      A,(XIZ+0x10)
  215B4B  c9 d8                    CP      A,0
  215B4D  66 10                    JR      Z,loc_215B5F
  215B4F  28                       PUSH    WA
  215B50  30 80 00                 LD      WA,0x80
  215B53  1d 6a 77 20              CALL    dyn_20776A
  215B57  48                       POP     WA
  215B58  c9 69                    DEC     1,A
  215B5A  be 10 41                 LD      (XIZ+0x10),A
  215B5D  68 20                    JR      loc_215B7F

loc_215B5F:
  215B5F  68 1e                    JR      loc_215B7F

loc_215B61:
  215B61  c9 cf 08                 CP      A,8
  215B64  6e 19                    JR      NZ,loc_215B7F
  215B66  8e 10 21                 LD      A,(XIZ+0x10)
  215B69  c9 d9                    CP      A,1
  215B6B  66 10                    JR      Z,loc_215B7D
  215B6D  28                       PUSH    WA
  215B6E  30 80 00                 LD      WA,0x80
  215B71  1d 6a 77 20              CALL    dyn_20776A
  215B75  48                       POP     WA
  215B76  c9 61                    INC     1,A
  215B78  be 10 41                 LD      (XIZ+0x10),A
  215B7B  68 02                    JR      loc_215B7F

loc_215B7D:
  215B7D  68 00                    JR      loc_215B7F

loc_215B7F:
  215B7F  d8 a8                    LD      WA,0
  215B81  8e 10 21                 LD      A,(XIZ+0x10)
  215B84  c9 08 30                 MUL     WA,0x30
  215B87  d8 c8 20 00              ADD     WA,0x20
  215B8B  d8 89                    LD      BC,WA
  215B8D  32 84 00                 LD      DE,0x84
  215B90  1d bd 1d 21              CALL    dyn_211DBD
  215B94  68 36                    JR      loc_215BCC

loc_215B96:
  215B96  1d eb 66 21              CALL    dyn_2166EB
  215B9A  8e 10 21                 LD      A,(XIZ+0x10)
  215B9D  c9 d8                    CP      A,0
  215B9F  66 0f                    JR      Z,loc_215BB0
  215BA1  8e 28 21                 LD      A,(XIZ+0x28)
  215BA4  c9 d8                    CP      A,0
  215BA6  66 04                    JR      Z,loc_215BAC
  215BA8  21 1c                    LD      A,0x1C
  215BAA  68 13                    JR      loc_215BBF

loc_215BAC:
  215BAC  21 14                    LD      A,0x14
  215BAE  68 0f                    JR      loc_215BBF

loc_215BB0:
  215BB0  8e 28 21                 LD      A,(XIZ+0x28)
  215BB3  c9 d8                    CP      A,0
  215BB5  66 04                    JR      Z,loc_215BBB
  215BB7  21 1d                    LD      A,0x1D
  215BB9  68 04                    JR      loc_215BBF

loc_215BBB:
  215BBB  21 15                    LD      A,0x15
  215BBD  68 00                    JR      loc_215BBF

loc_215BBF:
  215BBF  be 12 41                 LD      (XIZ+0x12),A
  215BC2  21 06                    LD      A,6
  215BC4  be 0e 41                 LD      (XIZ+0xE),A
  215BC7  21 02                    LD      A,2
  215BC9  be 27 41                 LD      (XIZ+0x27),A

loc_215BCC:
  215BCC  0e                       RET

sub_215BCD:
  215BCD  3b                       PUSH    XHL
  215BCE  38                       PUSH    XWA
  215BCF  43 a1 9f 24 00           LD      XHL,0x249FA1
  215BD4  21 01                    LD      A,1
  215BD6  1d f3 76 20              CALL    dyn_2076F3
  215BDA  3b                       PUSH    XHL
  215BDB  38                       PUSH    XWA
  215BDC  c1 21 50 21              LD      A,(0x5021)
  215BE0  c9 69                    DEC     1,A
  215BE2  c9 ef 01                 SRL     1,A
  215BE5  d8 12                    EXTZ    WA
  215BE7  e8 12                    EXTZ    XWA
  215BE9  d8 08 06 00              MUL     XWA,6
  215BED  d8 ee 01                 SLL     1,WA
  215BF0  43 b8 9f 24 00           LD      XHL,0x249FB8
  215BF5  e8 83                    ADD     XHL,XWA
  215BF7  58                       POP     XWA
  215BF8  8e 10 21                 LD      A,(XIZ+0x10)
  215BFB  d8 12                    EXTZ    WA
  215BFD  e8 12                    EXTZ    XWA
  215BFF  e8 ee 01                 SLL     1,XWA
  215C02  e8 83                    ADD     XHL,XWA
  215C04  93 20                    LD      WA,(XHL)
  215C06  5b                       POP     XHL
  215C07  1d c9 6b 21              CALL    sub_216BC9
  215C0B  21 01                    LD      A,1
  215C0D  1d f3 76 20              CALL    dyn_2076F3
  215C11  58                       POP     XWA
  215C12  5b                       POP     XHL
  215C13  0e                       RET

sub_215C14:
  215C14  38                       PUSH    XWA
  215C15  c1 21 50 21              LD      A,(0x5021)
  215C19  c9 69                    DEC     1,A
  215C1B  c9 ef 01                 SRL     1,A
  215C1E  d8 12                    EXTZ    WA
  215C20  e8 12                    EXTZ    XWA
  215C22  d8 08 06 00              MUL     XWA,6
  215C26  d8 ee 01                 SLL     1,WA
  215C29  43 b8 9f 24 00           LD      XHL,0x249FB8
  215C2E  e8 83                    ADD     XHL,XWA
  215C30  58                       POP     XWA
  215C31  23 06                    LD      C,6
  215C33  25 00                    LD      E,0

loc_215C35:
  215C35  cb 04                    PUSH    C
  215C37  cd 04                    PUSH    E
  215C39  3b                       PUSH    XHL
  215C3A  23 00                    LD      C,0
  215C3C  21 02                    LD      A,2
  215C3E  1d 8a 76 20              CALL    sub_20768A
  215C42  5b                       POP     XHL
  215C43  3b                       PUSH    XHL
  215C44  93 20                    LD      WA,(XHL)
  215C46  1d a8 6b 21              CALL    sub_216BA8
  215C4A  21 02                    LD      A,2
  215C4C  1d f3 76 20              CALL    dyn_2076F3
  215C50  5b                       POP     XHL
  215C51  cd 05                    POP     E
  215C53  cb 05                    POP     C
  215C55  cd 61                    INC     1,E
  215C57  eb 62                    INC     2,XHL
  215C59  cb 1c d9                 DJNZ    C,loc_215C35
  215C5C  23 00                    LD      C,0
  215C5E  25 08                    LD      E,8
  215C60  21 02                    LD      A,2
  215C62  1d 8a 76 20              CALL    sub_20768A
  215C66  43 b0 9f 24 00           LD      XHL,0x249FB0
  215C6B  21 02                    LD      A,2
  215C6D  1d f3 76 20              CALL    dyn_2076F3
  215C71  21 00                    LD      A,0
  215C73  be 10 41                 LD      (XIZ+0x10),A
  215C76  1d eb 66 21              CALL    dyn_2166EB
  215C7A  1e 50 ff                 CALR    sub_215BCD
  215C7D  21 00                    LD      A,0
  215C7F  be 2d 41                 LD      (XIZ+0x2D),A
  215C82  21 03                    LD      A,3
  215C84  be 27 41                 LD      (XIZ+0x27),A
  215C87  0e                       RET

sub_215C88:
  215C88  c1 df 5c 21              LD      A,(0x5CDF)
  215C8C  c9 33 04                 BIT     4,A
  215C8F  66 0c                    JR      Z,loc_215C9D
  215C91  28                       PUSH    WA
  215C92  30 81 00                 LD      WA,0x81
  215C95  1d 6a 77 20              CALL    dyn_20776A
  215C99  48                       POP     WA
  215C9A  78 9f 00                 JRL     loc_215D3C

loc_215C9D:
  215C9D  c9 33 05                 BIT     5,A
  215CA0  66 11                    JR      Z,loc_215CB3
  215CA2  28                       PUSH    WA
  215CA3  30 82 00                 LD      WA,0x82
  215CA6  1d 6a 77 20              CALL    dyn_20776A
  215CAA  48                       POP     WA
  215CAB  21 08                    LD      A,8
  215CAD  be 10 41                 LD      (XIZ+0x10),A
  215CB0  78 89 00                 JRL     loc_215D3C

loc_215CB3:
  215CB3  c9 cc 0f                 AND     A,0xF
  215CB6  66 5c                    JR      Z,loc_215D14
  215CB8  c9 d9                    CP      A,1
  215CBA  6e 2a                    JR      NZ,loc_215CE6
  215CBC  28                       PUSH    WA
  215CBD  30 80 00                 LD      WA,0x80
  215CC0  1d 6a 77 20              CALL    dyn_20776A
  215CC4  48                       POP     WA
  215CC5  8e 10 21                 LD      A,(XIZ+0x10)
  215CC8  c9 d8                    CP      A,0
  215CCA  66 0c                    JR      Z,loc_215CD8
  215CCC  c9 cf 08                 CP      A,8
  215CCF  66 0e                    JR      Z,loc_215CDF
  215CD1  c9 69                    DEC     1,A
  215CD3  be 10 41                 LD      (XIZ+0x10),A
  215CD6  68 3e                    JR      loc_215D16

loc_215CD8:
  215CD8  21 08                    LD      A,8
  215CDA  be 10 41                 LD      (XIZ+0x10),A
  215CDD  68 37                    JR      loc_215D16

loc_215CDF:
  215CDF  21 05                    LD      A,5
  215CE1  be 10 41                 LD      (XIZ+0x10),A
  215CE4  68 30                    JR      loc_215D16

loc_215CE6:
  215CE6  c9 da                    CP      A,2
  215CE8  6e 2a                    JR      NZ,loc_215D14
  215CEA  28                       PUSH    WA
  215CEB  30 80 00                 LD      WA,0x80
  215CEE  1d 6a 77 20              CALL    dyn_20776A
  215CF2  48                       POP     WA
  215CF3  8e 10 21                 LD      A,(XIZ+0x10)
  215CF6  c9 cf 08                 CP      A,8
  215CF9  66 0b                    JR      Z,loc_215D06
  215CFB  c9 dd                    CP      A,5
  215CFD  66 0e                    JR      Z,loc_215D0D
  215CFF  c9 61                    INC     1,A
  215D01  be 10 41                 LD      (XIZ+0x10),A
  215D04  68 10                    JR      loc_215D16

loc_215D06:
  215D06  21 00                    LD      A,0
  215D08  be 10 41                 LD      (XIZ+0x10),A
  215D0B  68 09                    JR      loc_215D16

loc_215D0D:
  215D0D  21 08                    LD      A,8
  215D0F  be 10 41                 LD      (XIZ+0x10),A
  215D12  68 02                    JR      loc_215D16

loc_215D14:
  215D14  68 0e                    JR      loc_215D24

loc_215D16:
  215D16  1e 69 f0                 CALR    sub_214D82
  215D19  8e 10 21                 LD      A,(XIZ+0x10)
  215D1C  c9 cf 08                 CP      A,8
  215D1F  66 03                    JR      Z,loc_215D24
  215D21  1e a9 fe                 CALR    sub_215BCD

loc_215D24:
  215D24  31 60 00                 LD      BC,0x60
  215D27  d8 a8                    LD      WA,0
  215D29  8e 10 21                 LD      A,(XIZ+0x10)
  215D2C  c9 08 08                 MUL     WA,8
  215D2F  d8 c8 04 00              ADD     WA,4
  215D33  d8 8a                    LD      DE,WA
  215D35  1d bd 1d 21              CALL    dyn_211DBD
  215D39  78 9c 00                 JRL     loc_215DD8

loc_215D3C:
  215D3C  1d 79 67 21              CALL    sub_216779
  215D40  1e 3f f0                 CALR    sub_214D82
  215D43  8e 10 21                 LD      A,(XIZ+0x10)
  215D46  c9 cf 08                 CP      A,8
  215D49  66 55                    JR      Z,loc_215DA0
  215D4B  25 00                    LD      E,0
  215D4D  c9 85                    ADD     E,A
  215D4F  23 00                    LD      C,0
  215D51  21 02                    LD      A,2
  215D53  1d 8a 76 20              CALL    sub_20768A
  215D57  3b                       PUSH    XHL
  215D58  38                       PUSH    XWA
  215D59  c1 21 50 21              LD      A,(0x5021)
  215D5D  c9 69                    DEC     1,A
  215D5F  c9 ef 01                 SRL     1,A
  215D62  d8 12                    EXTZ    WA
  215D64  e8 12                    EXTZ    XWA
  215D66  d8 08 06 00              MUL     XWA,6
  215D6A  d8 ee 01                 SLL     1,WA
  215D6D  43 b8 9f 24 00           LD      XHL,0x249FB8
  215D72  e8 83                    ADD     XHL,XWA
  215D74  58                       POP     XWA
  215D75  8e 10 21                 LD      A,(XIZ+0x10)
  215D78  d8 12                    EXTZ    WA
  215D7A  e8 12                    EXTZ    XWA
  215D7C  e8 ee 01                 SLL     1,XWA
  215D7F  e8 83                    ADD     XHL,XWA
  215D81  93 20                    LD      WA,(XHL)
  215D83  5b                       POP     XHL
  215D84  be 2a 50                 LD      (XIZ+0x2A),WA
  215D87  1d a8 6b 21              CALL    sub_216BA8
  215D8B  21 02                    LD      A,2
  215D8D  1d f3 76 20              CALL    dyn_2076F3
  215D91  8e 28 21                 LD      A,(XIZ+0x28)
  215D94  c9 d8                    CP      A,0
  215D96  66 04                    JR      Z,loc_215D9C
  215D98  21 1f                    LD      A,0x1F
  215D9A  68 2f                    JR      loc_215DCB

loc_215D9C:
  215D9C  21 18                    LD      A,0x18
  215D9E  68 2b                    JR      loc_215DCB

loc_215DA0:
  215DA0  25 00                    LD      E,0
  215DA2  c9 85                    ADD     E,A
  215DA4  23 00                    LD      C,0
  215DA6  21 02                    LD      A,2
  215DA8  1d 8a 76 20              CALL    sub_20768A
  215DAC  43 b0 9f 24 00           LD      XHL,0x249FB0
  215DB1  21 02                    LD      A,2
  215DB3  1d f3 76 20              CALL    dyn_2076F3
  215DB7  d8 a8                    LD      WA,0
  215DB9  be 2a 50                 LD      (XIZ+0x2A),WA
  215DBC  8e 28 21                 LD      A,(XIZ+0x28)
  215DBF  c9 d8                    CP      A,0
  215DC1  66 04                    JR      Z,loc_215DC7
  215DC3  21 1e                    LD      A,0x1E
  215DC5  68 04                    JR      loc_215DCB

loc_215DC7:
  215DC7  21 17                    LD      A,0x17
  215DC9  68 00                    JR      loc_215DCB

loc_215DCB:
  215DCB  be 12 41                 LD      (XIZ+0x12),A
  215DCE  21 06                    LD      A,6
  215DD0  be 0e 41                 LD      (XIZ+0xE),A
  215DD3  21 04                    LD      A,4
  215DD5  be 27 41                 LD      (XIZ+0x27),A

loc_215DD8:
  215DD8  0e                       RET

sub_215DD9:
  215DD9  23 00                    LD      C,0
  215DDB  25 02                    LD      E,2
  215DDD  21 01                    LD      A,1
  215DDF  1d 8a 76 20              CALL    sub_20768A
  215DE3  21 01                    LD      A,1
  215DE5  43 a3 9f 24 00           LD      XHL,0x249FA3
  215DEA  1d f3 76 20              CALL    dyn_2076F3
  215DEE  21 00                    LD      A,0
  215DF0  be 10 41                 LD      (XIZ+0x10),A
  215DF3  21 00                    LD      A,0
  215DF5  be 2d 41                 LD      (XIZ+0x2D),A
  215DF8  21 05                    LD      A,5
  215DFA  be 27 41                 LD      (XIZ+0x27),A
  215DFD  0e                       RET

sub_215DFE:
  215DFE  c1 df 5c 21              LD      A,(0x5CDF)
  215E02  c9 33 04                 BIT     4,A
  215E05  66 0b                    JR      Z,loc_215E12
  215E07  28                       PUSH    WA
  215E08  30 81 00                 LD      WA,0x81
  215E0B  1d 6a 77 20              CALL    dyn_20776A
  215E0F  48                       POP     WA
  215E10  68 6c                    JR      loc_215E7E

loc_215E12:
  215E12  c9 33 05                 BIT     5,A
  215E15  66 10                    JR      Z,loc_215E27
  215E17  28                       PUSH    WA
  215E18  30 82 00                 LD      WA,0x82
  215E1B  1d 6a 77 20              CALL    dyn_20776A
  215E1F  48                       POP     WA
  215E20  21 01                    LD      A,1
  215E22  be 10 41                 LD      (XIZ+0x10),A
  215E25  68 57                    JR      loc_215E7E

loc_215E27:
  215E27  c9 cc 0f                 AND     A,0xF
  215E2A  66 3b                    JR      Z,loc_215E67
  215E2C  c9 dc                    CP      A,4
  215E2E  6e 19                    JR      NZ,loc_215E49
  215E30  8e 10 21                 LD      A,(XIZ+0x10)
  215E33  c9 d8                    CP      A,0
  215E35  66 10                    JR      Z,loc_215E47
  215E37  28                       PUSH    WA
  215E38  30 80 00                 LD      WA,0x80
  215E3B  1d 6a 77 20              CALL    dyn_20776A
  215E3F  48                       POP     WA
  215E40  c9 69                    DEC     1,A
  215E42  be 10 41                 LD      (XIZ+0x10),A
  215E45  68 20                    JR      loc_215E67

loc_215E47:
  215E47  68 1e                    JR      loc_215E67

loc_215E49:
  215E49  c9 cf 08                 CP      A,8
  215E4C  6e 19                    JR      NZ,loc_215E67
  215E4E  8e 10 21                 LD      A,(XIZ+0x10)
  215E51  c9 d9                    CP      A,1
  215E53  66 10                    JR      Z,loc_215E65
  215E55  28                       PUSH    WA
  215E56  30 80 00                 LD      WA,0x80
  215E59  1d 6a 77 20              CALL    dyn_20776A
  215E5D  48                       POP     WA
  215E5E  c9 61                    INC     1,A
  215E60  be 10 41                 LD      (XIZ+0x10),A
  215E63  68 02                    JR      loc_215E67

loc_215E65:
  215E65  68 00                    JR      loc_215E67

loc_215E67:
  215E67  d8 a8                    LD      WA,0
  215E69  8e 10 21                 LD      A,(XIZ+0x10)
  215E6C  c9 08 30                 MUL     WA,0x30
  215E6F  d8 c8 20 00              ADD     WA,0x20
  215E73  d8 89                    LD      BC,WA
  215E75  32 84 00                 LD      DE,0x84
  215E78  1d bd 1d 21              CALL    dyn_211DBD
  215E7C  68 5d                    JR      loc_215EDB

loc_215E7E:
  215E7E  1d eb 66 21              CALL    dyn_2166EB
  215E82  8e 10 21                 LD      A,(XIZ+0x10)
  215E85  c9 d8                    CP      A,0
  215E87  66 18                    JR      Z,loc_215EA1
  215E89  21 02                    LD      A,2
  215E8B  be 27 41                 LD      (XIZ+0x27),A
  215E8E  1d 79 67 21              CALL    sub_216779
  215E92  8e 28 21                 LD      A,(XIZ+0x28)
  215E95  c9 d8                    CP      A,0
  215E97  66 04                    JR      Z,loc_215E9D
  215E99  21 20                    LD      A,0x20
  215E9B  68 36                    JR      loc_215ED3

loc_215E9D:
  215E9D  21 19                    LD      A,0x19
  215E9F  68 32                    JR      loc_215ED3

loc_215EA1:
  215EA1  9e 2a 20                 LD      WA,(XIZ+0x2A)
  215EA4  1d 97 61 20              CALL    0x206197
  215EA8  6f 09                    JR      NC,loc_215EB3
  215EAA  21 02                    LD      A,2
  215EAC  be 27 41                 LD      (XIZ+0x27),A
  215EAF  21 48                    LD      A,0x48
  215EB1  68 20                    JR      loc_215ED3

loc_215EB3:
  215EB3  1d 38 6b 21              CALL    sub_216B38
  215EB7  1d a2 6a 21              CALL    dyn_216AA2
  215EBB  c9 cf 0a                 CP      A,0xA
  215EBE  67 04                    JR      C,loc_215EC4
  215EC0  1d 51 6b 21              CALL    sub_216B51

loc_215EC4:
  215EC4  8e 28 21                 LD      A,(XIZ+0x28)
  215EC7  c9 d8                    CP      A,0
  215EC9  66 04                    JR      Z,loc_215ECF
  215ECB  21 21                    LD      A,0x21
  215ECD  68 04                    JR      loc_215ED3

loc_215ECF:
  215ECF  21 1a                    LD      A,0x1A
  215ED1  68 00                    JR      loc_215ED3

loc_215ED3:
  215ED3  be 12 41                 LD      (XIZ+0x12),A
  215ED6  21 06                    LD      A,6
  215ED8  be 0e 41                 LD      (XIZ+0xE),A

loc_215EDB:
  215EDB  0e                       RET

sub_215EDC:
  215EDC  8e 27 21                 LD      A,(XIZ+0x27)
  215EDF  c9 d8                    CP      A,0
  215EE1  6e 05                    JR      NZ,loc_215EE8
  215EE3  1e 0b fc                 CALR    sub_215AF1
  215EE6  68 2d                    JR      loc_215F15

loc_215EE8:
  215EE8  c9 d9                    CP      A,1
  215EEA  6e 05                    JR      NZ,loc_215EF1
  215EEC  1e 27 fc                 CALR    sub_215B16
  215EEF  68 24                    JR      loc_215F15

loc_215EF1:
  215EF1  c9 da                    CP      A,2
  215EF3  6e 05                    JR      NZ,loc_215EFA
  215EF5  1e 1c fd                 CALR    sub_215C14
  215EF8  68 1b                    JR      loc_215F15

loc_215EFA:
  215EFA  c9 db                    CP      A,3
  215EFC  6e 05                    JR      NZ,loc_215F03
  215EFE  1e 87 fd                 CALR    sub_215C88
  215F01  68 12                    JR      loc_215F15

loc_215F03:
  215F03  c9 dc                    CP      A,4
  215F05  6e 05                    JR      NZ,loc_215F0C
  215F07  1e cf fe                 CALR    sub_215DD9
  215F0A  68 09                    JR      loc_215F15

loc_215F0C:
  215F0C  c9 dd                    CP      A,5
  215F0E  6e 05                    JR      NZ,loc_215F15
  215F10  1e eb fe                 CALR    sub_215DFE
  215F13  68 00                    JR      loc_215F15

loc_215F15:
  215F15  8e 2d 21                 LD      A,(XIZ+0x2D)
  215F18  c9 61                    INC     1,A
  215F1A  be 2d 41                 LD      (XIZ+0x2D),A
  215F1D  0e                       RET

sub_215F1E:
  215F1E  3b                       PUSH    XHL
  215F1F  3a                       PUSH    XDE
  215F20  39                       PUSH    XBC
  215F21  c8 04                    PUSH    W
  215F23  1d 6a 6b 21              CALL    sub_216B6A
  215F27  c9 88                    LD      W,A
  215F29  1d 89 6b 21              CALL    sub_216B89
  215F2D  c8 c1                    AND     A,W
  215F2F  c9 d9                    CP      A,1
  215F31  66 22                    JR      Z,loc_215F55
  215F33  c1 22 50 21              LD      A,(0x5022)
  215F37  c9 cf 14                 CP      A,0x14
  215F3A  67 40                    JR      C,loc_215F7C
  215F3C  1d 6a 6b 21              CALL    sub_216B6A
  215F40  c9 d8                    CP      A,0
  215F42  66 28                    JR      Z,loc_215F6C
  215F44  c1 22 50 21              LD      A,(0x5022)
  215F48  c9 cf 1e                 CP      A,0x1E
  215F4B  67 2f                    JR      C,loc_215F7C
  215F4D  1d 89 6b 21              CALL    sub_216B89
  215F51  c9 d8                    CP      A,0
  215F53  66 04                    JR      Z,loc_215F59

loc_215F55:
  215F55  21 14                    LD      A,0x14
  215F57  68 25                    JR      loc_215F7E

loc_215F59:
  215F59  c1 21 50 21              LD      A,(0x5021)
  215F5D  c9 69                    DEC     1,A
  215F5F  c9 ef 01                 SRL     1,A
  215F62  d8 12                    EXTZ    WA
  215F64  c9 08 04                 MUL     WA,4
  215F67  c9 c8 02                 ADD     A,2
  215F6A  68 12                    JR      loc_215F7E

loc_215F6C:
  215F6C  c1 21 50 21              LD      A,(0x5021)
  215F70  c9 69                    DEC     1,A
  215F72  c9 ef 01                 SRL     1,A
  215F75  d8 12                    EXTZ    WA
  215F77  c9 08 04                 MUL     WA,4
  215F7A  68 02                    JR      loc_215F7E

loc_215F7C:
  215F7C  21 ff                    LD      A,0xFF

loc_215F7E:
  215F7E  c8 05                    POP     W
  215F80  59                       POP     XBC
  215F81  5a                       POP     XDE
  215F82  5b                       POP     XHL
  215F83  0e                       RET

sub_215F84:
  215F84  21 00                    LD      A,0
  215F86  be 2d 41                 LD      (XIZ+0x2D),A
  215F89  21 01                    LD      A,1
  215F8B  be 27 41                 LD      (XIZ+0x27),A
  215F8E  0e                       RET

sub_215F8F:
  215F8F  8e 2d 21                 LD      A,(XIZ+0x2D)
  215F92  c9 cf 5a                 CP      A,0x5A
  215F95  67 1b                    JR      C,loc_215FB2
  215F97  8e 29 21                 LD      A,(XIZ+0x29)
  215F9A  c9 cf ff                 CP      A,0xFF
  215F9D  66 04                    JR      Z,loc_215FA3
  215F9F  21 07                    LD      A,7
  215FA1  68 02                    JR      loc_215FA5

loc_215FA3:
  215FA3  21 06                    LD      A,6

loc_215FA5:
  215FA5  be 12 41                 LD      (XIZ+0x12),A
  215FA8  21 06                    LD      A,6
  215FAA  be 0e 41                 LD      (XIZ+0xE),A
  215FAD  21 02                    LD      A,2
  215FAF  be 27 41                 LD      (XIZ+0x27),A

loc_215FB2:
  215FB2  0e                       RET

sub_215FB3:
  215FB3  38                       PUSH    XWA
  215FB4  d8 12                    EXTZ    WA
  215FB6  e8 12                    EXTZ    XWA
  215FB8  d8 08 07 00              MUL     XWA,7
  215FBC  43 f4 9f 24 00           LD      XHL,0x249FF4
  215FC1  e8 83                    ADD     XHL,XWA
  215FC3  58                       POP     XWA
  215FC4  0e                       RET

sub_215FC5:
  215FC5  38                       PUSH    XWA
  215FC6  c9 c8 08                 ADD     A,8
  215FC9  8e 15 20                 LD      W,(XIZ+0x15)
  215FCC  1e c8 ed                 CALR    dyn_214D97
  215FCF  ab 04 23                 LD      XHL,(XHL+4)
  215FD2  58                       POP     XWA
  215FD3  0e                       RET

sub_215FD4:
  215FD4  3b                       PUSH    XHL
  215FD5  38                       PUSH    XWA
  215FD6  8e 29 21                 LD      A,(XIZ+0x29)
  215FD9  8e 10 20                 LD      W,(XIZ+0x10)
  215FDC  c8 81                    ADD     A,W
  215FDE  1e e4 ff                 CALR    sub_215FC5
  215FE1  21 01                    LD      A,1
  215FE3  1d f3 76 20              CALL    dyn_2076F3
  215FE7  58                       POP     XWA
  215FE8  5b                       POP     XHL
  215FE9  0e                       RET

sub_215FEA:
  215FEA  8e 29 21                 LD      A,(XIZ+0x29)
  215FED  23 02                    LD      C,2
  215FEF  25 00                    LD      E,0

loc_215FF1:
  215FF1  cb 04                    PUSH    C
  215FF3  cd 04                    PUSH    E
  215FF5  14                       PUSH    A
  215FF6  23 00                    LD      C,0
  215FF8  21 02                    LD      A,2
  215FFA  1d 8a 76 20              CALL    sub_20768A
  215FFE  15                       POP     A
  215FFF  14                       PUSH    A
  216000  1e b0 ff                 CALR    sub_215FB3
  216003  21 02                    LD      A,2
  216005  1d f3 76 20              CALL    dyn_2076F3
  216009  15                       POP     A
  21600A  cd 05                    POP     E
  21600C  cb 05                    POP     C
  21600E  cd 61                    INC     1,E
  216010  c9 61                    INC     1,A
  216012  cb 1c dc                 DJNZ    C,loc_215FF1
  216015  21 00                    LD      A,0
  216017  be 10 41                 LD      (XIZ+0x10),A
  21601A  1d eb 66 21              CALL    dyn_2166EB
  21601E  1e b3 ff                 CALR    sub_215FD4
  216021  21 00                    LD      A,0
  216023  be 2d 41                 LD      (XIZ+0x2D),A
  216026  21 03                    LD      A,3
  216028  be 27 41                 LD      (XIZ+0x27),A
  21602B  0e                       RET

sub_21602C:
  21602C  c1 df 5c 21              LD      A,(0x5CDF)
  216030  c9 33 04                 BIT     4,A
  216033  66 0b                    JR      Z,loc_216040
  216035  28                       PUSH    WA
  216036  30 81 00                 LD      WA,0x81
  216039  1d 6a 77 20              CALL    dyn_20776A
  21603D  48                       POP     WA
  21603E  68 70                    JR      loc_2160B0

loc_216040:
  216040  c9 cc 0f                 AND     A,0xF
  216043  66 44                    JR      Z,loc_216089
  216045  c9 d9                    CP      A,1
  216047  6e 1e                    JR      NZ,loc_216067
  216049  28                       PUSH    WA
  21604A  30 80 00                 LD      WA,0x80
  21604D  1d 6a 77 20              CALL    dyn_20776A
  216051  48                       POP     WA
  216052  8e 10 21                 LD      A,(XIZ+0x10)
  216055  c9 d8                    CP      A,0
  216057  66 07                    JR      Z,loc_216060
  216059  c9 69                    DEC     1,A
  21605B  be 10 41                 LD      (XIZ+0x10),A
  21605E  68 2b                    JR      loc_21608B

loc_216060:
  216060  21 01                    LD      A,1
  216062  be 10 41                 LD      (XIZ+0x10),A
  216065  68 24                    JR      loc_21608B

loc_216067:
  216067  c9 da                    CP      A,2
  216069  6e 1e                    JR      NZ,loc_216089
  21606B  28                       PUSH    WA
  21606C  30 80 00                 LD      WA,0x80
  21606F  1d 6a 77 20              CALL    dyn_20776A
  216073  48                       POP     WA
  216074  8e 10 21                 LD      A,(XIZ+0x10)
  216077  c9 d9                    CP      A,1
  216079  66 07                    JR      Z,loc_216082
  21607B  c9 61                    INC     1,A
  21607D  be 10 41                 LD      (XIZ+0x10),A
  216080  68 09                    JR      loc_21608B

loc_216082:
  216082  21 00                    LD      A,0
  216084  be 10 41                 LD      (XIZ+0x10),A
  216087  68 02                    JR      loc_21608B

loc_216089:
  216089  68 0e                    JR      loc_216099

loc_21608B:
  21608B  1e f4 ec                 CALR    sub_214D82
  21608E  8e 10 21                 LD      A,(XIZ+0x10)
  216091  c9 cf 08                 CP      A,8
  216094  66 03                    JR      Z,loc_216099
  216096  1e 3b ff                 CALR    sub_215FD4

loc_216099:
  216099  31 60 00                 LD      BC,0x60
  21609C  d8 a8                    LD      WA,0
  21609E  8e 10 21                 LD      A,(XIZ+0x10)
  2160A1  c9 08 08                 MUL     WA,8
  2160A4  d8 c8 04 00              ADD     WA,4
  2160A8  d8 8a                    LD      DE,WA
  2160AA  1d bd 1d 21              CALL    dyn_211DBD
  2160AE  68 60                    JR      loc_216110

loc_2160B0:
  2160B0  1d 79 67 21              CALL    sub_216779
  2160B4  1e cb ec                 CALR    sub_214D82
  2160B7  8e 10 21                 LD      A,(XIZ+0x10)
  2160BA  c9 cf 08                 CP      A,8
  2160BD  66 24                    JR      Z,loc_2160E3
  2160BF  be 2a 41                 LD      (XIZ+0x2A),A
  2160C2  25 00                    LD      E,0
  2160C4  c9 85                    ADD     E,A
  2160C6  23 00                    LD      C,0
  2160C8  21 02                    LD      A,2
  2160CA  1d 8a 76 20              CALL    sub_20768A
  2160CE  8e 29 21                 LD      A,(XIZ+0x29)
  2160D1  8e 2a 20                 LD      W,(XIZ+0x2A)
  2160D4  c8 81                    ADD     A,W
  2160D6  1e da fe                 CALR    sub_215FB3
  2160D9  21 02                    LD      A,2
  2160DB  1d f3 76 20              CALL    dyn_2076F3
  2160DF  21 1c                    LD      A,0x1C
  2160E1  68 20                    JR      loc_216103

loc_2160E3:
  2160E3  25 00                    LD      E,0
  2160E5  c9 85                    ADD     E,A
  2160E7  23 00                    LD      C,0
  2160E9  21 02                    LD      A,2
  2160EB  1d 8a 76 20              CALL    sub_20768A
  2160EF  43 b0 9f 24 00           LD      XHL,0x249FB0
  2160F4  21 02                    LD      A,2
  2160F6  1d f3 76 20              CALL    dyn_2076F3
  2160FA  d8 a8                    LD      WA,0
  2160FC  be 2a 50                 LD      (XIZ+0x2A),WA
  2160FF  21 20                    LD      A,0x20
  216101  68 00                    JR      loc_216103

loc_216103:
  216103  be 12 41                 LD      (XIZ+0x12),A
  216106  21 06                    LD      A,6
  216108  be 0e 41                 LD      (XIZ+0xE),A
  21610B  21 04                    LD      A,4
  21610D  be 27 41                 LD      (XIZ+0x27),A

loc_216110:
  216110  0e                       RET

sub_216111:
  216111  23 00                    LD      C,0
  216113  25 02                    LD      E,2
  216115  21 01                    LD      A,1
  216117  1d 8a 76 20              CALL    sub_20768A
  21611B  21 01                    LD      A,1
  21611D  43 a3 9f 24 00           LD      XHL,0x249FA3
  216122  1d f3 76 20              CALL    dyn_2076F3
  216126  21 00                    LD      A,0
  216128  be 10 41                 LD      (XIZ+0x10),A
  21612B  21 00                    LD      A,0
  21612D  be 2d 41                 LD      (XIZ+0x2D),A
  216130  21 05                    LD      A,5
  216132  be 27 41                 LD      (XIZ+0x27),A
  216135  0e                       RET

sub_216136:
  216136  c1 df 5c 21              LD      A,(0x5CDF)
  21613A  c9 33 04                 BIT     4,A
  21613D  66 0b                    JR      Z,loc_21614A
  21613F  28                       PUSH    WA
  216140  30 81 00                 LD      WA,0x81
  216143  1d 6a 77 20              CALL    dyn_20776A
  216147  48                       POP     WA
  216148  68 6c                    JR      loc_2161B6

loc_21614A:
  21614A  c9 33 05                 BIT     5,A
  21614D  66 10                    JR      Z,loc_21615F
  21614F  28                       PUSH    WA
  216150  30 82 00                 LD      WA,0x82
  216153  1d 6a 77 20              CALL    dyn_20776A
  216157  48                       POP     WA
  216158  21 01                    LD      A,1
  21615A  be 10 41                 LD      (XIZ+0x10),A
  21615D  68 57                    JR      loc_2161B6

loc_21615F:
  21615F  c9 cc 0f                 AND     A,0xF
  216162  66 3b                    JR      Z,loc_21619F
  216164  c9 dc                    CP      A,4
  216166  6e 19                    JR      NZ,loc_216181
  216168  8e 10 21                 LD      A,(XIZ+0x10)
  21616B  c9 d8                    CP      A,0
  21616D  66 10                    JR      Z,loc_21617F
  21616F  28                       PUSH    WA
  216170  30 80 00                 LD      WA,0x80
  216173  1d 6a 77 20              CALL    dyn_20776A
  216177  48                       POP     WA
  216178  c9 69                    DEC     1,A
  21617A  be 10 41                 LD      (XIZ+0x10),A
  21617D  68 20                    JR      loc_21619F

loc_21617F:
  21617F  68 1e                    JR      loc_21619F

loc_216181:
  216181  c9 cf 08                 CP      A,8
  216184  6e 19                    JR      NZ,loc_21619F
  216186  8e 10 21                 LD      A,(XIZ+0x10)
  216189  c9 d9                    CP      A,1
  21618B  66 10                    JR      Z,loc_21619D
  21618D  28                       PUSH    WA
  21618E  30 80 00                 LD      WA,0x80
  216191  1d 6a 77 20              CALL    dyn_20776A
  216195  48                       POP     WA
  216196  c9 61                    INC     1,A
  216198  be 10 41                 LD      (XIZ+0x10),A
  21619B  68 02                    JR      loc_21619F

loc_21619D:
  21619D  68 00                    JR      loc_21619F

loc_21619F:
  21619F  d8 a8                    LD      WA,0
  2161A1  8e 10 21                 LD      A,(XIZ+0x10)
  2161A4  c9 08 30                 MUL     WA,0x30
  2161A7  d8 c8 20 00              ADD     WA,0x20
  2161AB  d8 89                    LD      BC,WA
  2161AD  32 84 00                 LD      DE,0x84
  2161B0  1d bd 1d 21              CALL    dyn_211DBD
  2161B4  68 51                    JR      loc_216207

loc_2161B6:
  2161B6  1d eb 66 21              CALL    dyn_2166EB
  2161BA  8e 10 21                 LD      A,(XIZ+0x10)
  2161BD  c9 d8                    CP      A,0
  2161BF  66 0d                    JR      Z,loc_2161CE
  2161C1  21 02                    LD      A,2
  2161C3  be 27 41                 LD      (XIZ+0x27),A
  2161C6  1d 79 67 21              CALL    sub_216779
  2161CA  21 1d                    LD      A,0x1D
  2161CC  68 31                    JR      loc_2161FF

loc_2161CE:
  2161CE  8e 29 21                 LD      A,(XIZ+0x29)
  2161D1  8e 2a 20                 LD      W,(XIZ+0x2A)
  2161D4  c9 80                    ADD     W,A
  2161D6  c8 61                    INC     1,W
  2161D8  1d 6a 6b 21              CALL    sub_216B6A
  2161DC  c9 d9                    CP      A,1
  2161DE  66 08                    JR      Z,loc_2161E8
  2161E0  f1 25 50 40              LD      (0x5025),W
  2161E4  21 30                    LD      A,0x30
  2161E6  68 06                    JR      loc_2161EE

loc_2161E8:
  2161E8  f1 26 50 40              LD      (0x5026),W
  2161EC  21 32                    LD      A,0x32

loc_2161EE:
  2161EE  8e 2a 20                 LD      W,(XIZ+0x2A)
  2161F1  c8 81                    ADD     A,W
  2161F3  c9 8f                    LD      L,A
  2161F5  db 12                    EXTZ    HL
  2161F7  1d 2e 61 20              CALL    dyn_20612E
  2161FB  21 1e                    LD      A,0x1E
  2161FD  68 00                    JR      loc_2161FF

loc_2161FF:
  2161FF  be 12 41                 LD      (XIZ+0x12),A
  216202  21 06                    LD      A,6
  216204  be 0e 41                 LD      (XIZ+0xE),A

loc_216207:
  216207  0e                       RET

sub_216208:
  216208  8e 27 21                 LD      A,(XIZ+0x27)
  21620B  c9 d8                    CP      A,0
  21620D  6e 05                    JR      NZ,loc_216214
  21620F  1e 72 fd                 CALR    sub_215F84
  216212  68 2d                    JR      loc_216241

loc_216214:
  216214  c9 d9                    CP      A,1
  216216  6e 05                    JR      NZ,loc_21621D
  216218  1e 74 fd                 CALR    sub_215F8F
  21621B  68 24                    JR      loc_216241

loc_21621D:
  21621D  c9 da                    CP      A,2
  21621F  6e 05                    JR      NZ,loc_216226
  216221  1e c6 fd                 CALR    sub_215FEA
  216224  68 1b                    JR      loc_216241

loc_216226:
  216226  c9 db                    CP      A,3
  216228  6e 05                    JR      NZ,loc_21622F
  21622A  1e ff fd                 CALR    sub_21602C
  21622D  68 12                    JR      loc_216241

loc_21622F:
  21622F  c9 dc                    CP      A,4
  216231  6e 05                    JR      NZ,loc_216238
  216233  1e db fe                 CALR    sub_216111
  216236  68 09                    JR      loc_216241

loc_216238:
  216238  c9 dd                    CP      A,5
  21623A  6e 05                    JR      NZ,loc_216241
  21623C  1e f7 fe                 CALR    sub_216136
  21623F  68 00                    JR      loc_216241

loc_216241:
  216241  8e 2d 21                 LD      A,(XIZ+0x2D)
  216244  c9 61                    INC     1,A
  216246  be 2d 41                 LD      (XIZ+0x2D),A
  216249  0e                       RET

sub_21624A:
  21624A  43 4c 8c 20 00           LD      XHL,0x208C4C
  21624F  1d 24 63 20              CALL    dyn_206324
  216253  bb 0e 02 78 00           LDW     (XHL+0xE),0x78
  216258  30 84 00                 LD      WA,0x84
  21625B  1d 6a 77 20              CALL    dyn_20776A
  21625F  21 00                    LD      A,0
  216261  be 2c 41                 LD      (XIZ+0x2C),A
  216264  21 01                    LD      A,1
  216266  be 27 41                 LD      (XIZ+0x27),A
  216269  0e                       RET

sub_21626A:
  21626A  21 06                    LD      A,6
  21626C  f1 7f 5a 41              LD      (0x5A7F),A
  216270  8e 2c 21                 LD      A,(XIZ+0x2C)
  216273  c9 61                    INC     1,A
  216275  be 2c 41                 LD      (XIZ+0x2C),A
  216278  c9 cf 39                 CP      A,0x39
  21627B  67 12                    JR      C,loc_21628F
  21627D  c1 5b 58 21              LD      A,(0x585B)
  216281  c9 c8 02                 ADD     A,2
  216284  c9 cf 7f                 CP      A,0x7F
  216287  67 02                    JR      C,loc_21628B
  216289  21 7f                    LD      A,0x7F

loc_21628B:
  21628B  f1 5b 58 41              LD      (0x585B),A

loc_21628F:
  21628F  9e 0c 20                 LD      WA,(XIZ+0xC)
  216292  d8 d8                    CP      WA,0
  216294  6e 39                    JR      NZ,loc_2162CF
  216296  1d 03 68 20              CALL    dyn_206803
  21629A  1d 6a 67 21              CALL    dyn_21676A
  21629E  1d b1 67 21              CALL    dyn_2167B1
  2162A2  1e c8 ee                 CALR    dyn_21516D
  2162A5  21 00                    LD      A,0
  2162A7  be 13 41                 LD      (XIZ+0x13),A
  2162AA  1d eb 66 21              CALL    dyn_2166EB
  2162AE  33 36 00                 LD      HL,0x36
  2162B1  1d 45 68 21              CALL    dyn_216845
  2162B5  d9 a8                    LD      BC,0
  2162B7  da a8                    LD      DE,0
  2162B9  1d ba 03 21              CALL    dyn_2103BA
  2162BD  e8 a8                    LD      XWA,0
  2162BF  1d 59 77 20              CALL    dyn_207759
  2162C3  30 20 00                 LD      WA,0x20
  2162C6  1d 6a 77 20              CALL    dyn_20776A
  2162CA  21 02                    LD      A,2
  2162CC  be 27 41                 LD      (XIZ+0x27),A

loc_2162CF:
  2162CF  0e                       RET

sub_2162D0:
  2162D0  21 02                    LD      A,2
  2162D2  1d 95 6e 21              CALL    sub_216E95
  2162D6  c9 d9                    CP      A,1
  2162D8  66 0f                    JR      Z,loc_2162E9
  2162DA  21 0f                    LD      A,0xF
  2162DC  be 12 41                 LD      (XIZ+0x12),A
  2162DF  21 06                    LD      A,6
  2162E1  be 0e 41                 LD      (XIZ+0xE),A
  2162E4  21 04                    LD      A,4
  2162E6  be 27 41                 LD      (XIZ+0x27),A

loc_2162E9:
  2162E9  0e                       RET

sub_2162EA:
  2162EA  c1 df 5c 21              LD      A,(0x5CDF)
  2162EE  c9 33 04                 BIT     4,A
  2162F1  66 02                    JR      Z,loc_2162F5
  2162F3  68 0b                    JR      loc_216300

loc_2162F5:
  2162F5  c9 33 05                 BIT     5,A
  2162F8  66 02                    JR      Z,loc_2162FC
  2162FA  68 04                    JR      loc_216300

loc_2162FC:
  2162FC  68 00                    JR      loc_2162FE

loc_2162FE:
  2162FE  68 05                    JR      loc_216305

loc_216300:
  216300  21 04                    LD      A,4
  216302  be 27 41                 LD      (XIZ+0x27),A

loc_216305:
  216305  0e                       RET

sub_216306:
  216306  21 02                    LD      A,2
  216308  1d b9 6e 21              CALL    sub_216EB9
  21630C  c9 d9                    CP      A,1
  21630E  66 33                    JR      Z,loc_216343
  216310  1d 03 68 20              CALL    dyn_206803
  216314  1d 57 67 21              CALL    dyn_216757
  216318  1d 9e 67 21              CALL    dyn_21679E
  21631C  1d eb 66 21              CALL    dyn_2166EB
  216320  1e 00 ea                 CALR    dyn_214D23
  216323  e8 aa                    LD      XWA,2
  216325  1d 59 77 20              CALL    dyn_207759
  216329  30 22 00                 LD      WA,0x22
  21632C  1d 6a 77 20              CALL    dyn_20776A
  216330  21 05                    LD      A,5
  216332  be 27 41                 LD      (XIZ+0x27),A
  216335  1d 31 6e 21              CALL    dyn_216E31
  216339  21 09                    LD      A,9
  21633B  be 12 41                 LD      (XIZ+0x12),A
  21633E  21 06                    LD      A,6
  216340  be 0e 41                 LD      (XIZ+0xE),A

loc_216343:
  216343  0e                       RET

sub_216344:
  216344  21 09                    LD      A,9
  216346  be 12 41                 LD      (XIZ+0x12),A
  216349  21 06                    LD      A,6
  21634B  be 0e 41                 LD      (XIZ+0xE),A
  21634E  0e                       RET

sub_21634F:
  21634F  8e 27 21                 LD      A,(XIZ+0x27)
  216352  c9 d8                    CP      A,0
  216354  6e 05                    JR      NZ,loc_21635B
  216356  1e f1 fe                 CALR    sub_21624A
  216359  68 2d                    JR      loc_216388

loc_21635B:
  21635B  c9 d9                    CP      A,1
  21635D  6e 05                    JR      NZ,loc_216364
  21635F  1e 08 ff                 CALR    sub_21626A
  216362  68 24                    JR      loc_216388

loc_216364:
  216364  c9 da                    CP      A,2
  216366  6e 05                    JR      NZ,loc_21636D
  216368  1e 65 ff                 CALR    sub_2162D0
  21636B  68 1b                    JR      loc_216388

loc_21636D:
  21636D  c9 db                    CP      A,3
  21636F  6e 05                    JR      NZ,loc_216376
  216371  1e 76 ff                 CALR    sub_2162EA
  216374  68 12                    JR      loc_216388

loc_216376:
  216376  c9 dc                    CP      A,4
  216378  6e 05                    JR      NZ,loc_21637F
  21637A  1e 89 ff                 CALR    sub_216306
  21637D  68 09                    JR      loc_216388

loc_21637F:
  21637F  c9 dd                    CP      A,5
  216381  6e 05                    JR      NZ,loc_216388
  216383  1e be ff                 CALR    sub_216344
  216386  68 00                    JR      loc_216388

loc_216388:
  216388  8e 2d 21                 LD      A,(XIZ+0x2D)
  21638B  c9 61                    INC     1,A
  21638D  be 2d 41                 LD      (XIZ+0x2D),A
  216390  0e                       RET

sub_216391:
  216391  3b                       PUSH    XHL
  216392  cb 04                    PUSH    C
  216394  38                       PUSH    XWA
  216395  1d bc 6a 21              CALL    sub_216ABC
  216399  c9 db                    CP      A,3
  21639B  6f 04                    JR      NC,loc_2163A1
  21639D  21 03                    LD      A,3
  21639F  68 09                    JR      loc_2163AA

loc_2163A1:
  2163A1  c9 cf 09                 CP      A,9
  2163A4  67 04                    JR      C,loc_2163AA
  2163A6  21 08                    LD      A,8
  2163A8  68 00                    JR      loc_2163AA

loc_2163AA:
  2163AA  c9 ca 03                 SUB     A,3
  2163AD  d8 12                    EXTZ    WA
  2163AF  e8 12                    EXTZ    XWA
  2163B1  43 9e a0 24 00           LD      XHL,0x24A09E
  2163B6  e8 83                    ADD     XHL,XWA
  2163B8  c8 04                    PUSH    W
  2163BA  1d cb 60 20              CALL    dyn_2060CB
  2163BE  20 00                    LD      W,0
  2163C0  c9 0a 64                 DIV     WA,0x64
  2163C3  c8 89                    LD      A,W
  2163C5  c8 05                    POP     W
  2163C7  23 00                    LD      C,0

loc_2163C9:
  2163C9  83 20                    LD      W,(XHL)
  2163CB  c8 a1                    SUB     A,W
  2163CD  67 0a                    JR      C,loc_2163D9
  2163CF  cb 61                    INC     1,C
  2163D1  eb c8 06 00 00 00        ADD     XHL,6
  2163D7  68 f0                    JR      loc_2163C9

loc_2163D9:
  2163D9  be 28 43                 LD      (XIZ+0x28),C
  2163DC  43 da a0 24 00           LD      XHL,0x24A0DA
  2163E1  c8 04                    PUSH    W
  2163E3  1d cb 60 20              CALL    dyn_2060CB
  2163E7  20 00                    LD      W,0
  2163E9  c9 0a 64                 DIV     WA,0x64
  2163EC  c8 89                    LD      A,W
  2163EE  c8 05                    POP     W
  2163F0  23 00                    LD      C,0

loc_2163F2:
  2163F2  83 20                    LD      W,(XHL)
  2163F4  c8 a1                    SUB     A,W
  2163F6  67 0a                    JR      C,loc_216402
  2163F8  cb 61                    INC     1,C
  2163FA  eb c8 01 00 00 00        ADD     XHL,1
  216400  68 f0                    JR      loc_2163F2

loc_216402:
  216402  be 29 43                 LD      (XIZ+0x29),C
  216405  58                       POP     XWA
  216406  cb 05                    POP     C
  216408  5b                       POP     XHL
  216409  0e                       RET

sub_21640A:
  21640A  1e 84 ff                 CALR    sub_216391
  21640D  21 02                    LD      A,2
  21640F  1d cc 75 20              CALL    dyn_2075CC
  216413  43 a7 a1 24 00           LD      XHL,0x24A1A7
  216418  21 02                    LD      A,2
  21641A  1d f3 76 20              CALL    dyn_2076F3
  21641E  3b                       PUSH    XHL
  21641F  8e 28 21                 LD      A,(XIZ+0x28)
  216422  d8 12                    EXTZ    WA
  216424  e8 12                    EXTZ    XWA
  216426  43 94 a0 24 00           LD      XHL,0x24A094
  21642B  e8 83                    ADD     XHL,XWA
  21642D  83 21                    LD      A,(XHL)
  21642F  d8 12                    EXTZ    WA
  216431  5b                       POP     XHL
  216432  1d a8 6b 21              CALL    sub_216BA8
  216436  21 02                    LD      A,2
  216438  1d f3 76 20              CALL    dyn_2076F3
  21643C  23 00                    LD      C,0
  21643E  25 05                    LD      E,5
  216440  21 02                    LD      A,2
  216442  1d 8a 76 20              CALL    sub_20768A
  216446  43 b0 a1 24 00           LD      XHL,0x24A1B0
  21644B  21 02                    LD      A,2
  21644D  1d f3 76 20              CALL    dyn_2076F3
  216451  38                       PUSH    XWA
  216452  8e 28 21                 LD      A,(XIZ+0x28)
  216455  d8 12                    EXTZ    WA
  216457  e8 12                    EXTZ    XWA
  216459  d8 08 05 00              MUL     XWA,5
  21645D  e8 8b                    LD      XHL,XWA
  21645F  8e 29 21                 LD      A,(XIZ+0x29)
  216462  d8 12                    EXTZ    WA
  216464  e8 12                    EXTZ    XWA
  216466  eb 80                    ADD     XWA,XHL
  216468  d8 08 04 00              MUL     XWA,4
  21646C  43 df a0 24 00           LD      XHL,0x24A0DF
  216471  e8 83                    ADD     XHL,XWA
  216473  a3 23                    LD      XHL,(XHL)
  216475  58                       POP     XWA
  216476  21 02                    LD      A,2
  216478  23 06                    LD      C,6
  21647A  1d 51 68 21              CALL    sub_216851
  21647E  1d ac 68 21              CALL    sub_2168AC
  216482  21 00                    LD      A,0
  216484  be 2d 41                 LD      (XIZ+0x2D),A
  216487  21 02                    LD      A,2
  216489  be 27 41                 LD      (XIZ+0x27),A
  21648C  0e                       RET

sub_21648D:
  21648D  c1 df 5c 21              LD      A,(0x5CDF)
  216491  c9 33 04                 BIT     4,A
  216494  66 02                    JR      Z,loc_216498
  216496  68 0f                    JR      loc_2164A7

loc_216498:
  216498  c9 33 05                 BIT     5,A
  21649B  66 02                    JR      Z,loc_21649F
  21649D  68 08                    JR      loc_2164A7

loc_21649F:
  21649F  8e 2d 21                 LD      A,(XIZ+0x2D)
  2164A2  c9 cf 3c                 CP      A,0x3C
  2164A5  67 0f                    JR      C,loc_2164B6

loc_2164A7:
  2164A7  21 1e                    LD      A,0x1E
  2164A9  be 12 41                 LD      (XIZ+0x12),A
  2164AC  21 06                    LD      A,6
  2164AE  be 0e 41                 LD      (XIZ+0xE),A
  2164B1  21 03                    LD      A,3
  2164B3  be 27 41                 LD      (XIZ+0x27),A

loc_2164B6:
  2164B6  0e                       RET

sub_2164B7:
  2164B7  1d eb 66 21              CALL    dyn_2166EB
  2164BB  8e 15 20                 LD      W,(XIZ+0x15)
  2164BE  21 1f                    LD      A,0x1F
  2164C0  1e d4 e8                 CALR    dyn_214D97
  2164C3  ab 04 23                 LD      XHL,(XHL+4)
  2164C6  21 01                    LD      A,1
  2164C8  1d f3 76 20              CALL    dyn_2076F3
  2164CC  23 00                    LD      C,0
  2164CE  25 02                    LD      E,2
  2164D0  21 01                    LD      A,1
  2164D2  1d 8a 76 20              CALL    sub_20768A
  2164D6  21 01                    LD      A,1
  2164D8  43 a3 9f 24 00           LD      XHL,0x249FA3
  2164DD  1d f3 76 20              CALL    dyn_2076F3
  2164E1  21 00                    LD      A,0
  2164E3  be 10 41                 LD      (XIZ+0x10),A
  2164E6  21 00                    LD      A,0
  2164E8  be 2d 41                 LD      (XIZ+0x2D),A
  2164EB  21 04                    LD      A,4
  2164ED  be 27 41                 LD      (XIZ+0x27),A
  2164F0  0e                       RET

sub_2164F1:
  2164F1  c1 df 5c 21              LD      A,(0x5CDF)
  2164F5  c9 33 04                 BIT     4,A
  2164F8  66 0b                    JR      Z,loc_216505
  2164FA  28                       PUSH    WA
  2164FB  30 81 00                 LD      WA,0x81
  2164FE  1d 6a 77 20              CALL    dyn_20776A
  216502  48                       POP     WA
  216503  68 6d                    JR      loc_216572

loc_216505:
  216505  c9 33 05                 BIT     5,A
  216508  66 10                    JR      Z,loc_21651A
  21650A  28                       PUSH    WA
  21650B  30 82 00                 LD      WA,0x82
  21650E  1d 6a 77 20              CALL    dyn_20776A
  216512  48                       POP     WA
  216513  21 01                    LD      A,1
  216515  be 10 41                 LD      (XIZ+0x10),A
  216518  68 58                    JR      loc_216572

loc_21651A:
  21651A  c9 cc 0f                 AND     A,0xF
  21651D  66 3b                    JR      Z,loc_21655A
  21651F  c9 dc                    CP      A,4
  216521  6e 19                    JR      NZ,loc_21653C
  216523  8e 10 21                 LD      A,(XIZ+0x10)
  216526  c9 d8                    CP      A,0
  216528  66 10                    JR      Z,loc_21653A
  21652A  28                       PUSH    WA
  21652B  30 80 00                 LD      WA,0x80
  21652E  1d 6a 77 20              CALL    dyn_20776A
  216532  48                       POP     WA
  216533  c9 69                    DEC     1,A
  216535  be 10 41                 LD      (XIZ+0x10),A
  216538  68 20                    JR      loc_21655A

loc_21653A:
  21653A  68 1e                    JR      loc_21655A

loc_21653C:
  21653C  c9 cf 08                 CP      A,8
  21653F  6e 19                    JR      NZ,loc_21655A
  216541  8e 10 21                 LD      A,(XIZ+0x10)
  216544  c9 d9                    CP      A,1
  216546  66 10                    JR      Z,loc_216558
  216548  28                       PUSH    WA
  216549  30 80 00                 LD      WA,0x80
  21654C  1d 6a 77 20              CALL    dyn_20776A
  216550  48                       POP     WA
  216551  c9 61                    INC     1,A
  216553  be 10 41                 LD      (XIZ+0x10),A
  216556  68 02                    JR      loc_21655A

loc_216558:
  216558  68 00                    JR      loc_21655A

loc_21655A:
  21655A  d8 a8                    LD      WA,0
  21655C  8e 10 21                 LD      A,(XIZ+0x10)
  21655F  c9 08 30                 MUL     WA,0x30
  216562  d8 c8 20 00              ADD     WA,0x20
  216566  d8 89                    LD      BC,WA
  216568  32 84 00                 LD      DE,0x84
  21656B  1d bd 1d 21              CALL    dyn_211DBD
  21656F  78 a6 00                 JRL     loc_216618

loc_216572:
  216572  1d eb 66 21              CALL    dyn_2166EB
  216576  8e 10 21                 LD      A,(XIZ+0x10)
  216579  c9 d8                    CP      A,0
  21657B  66 05                    JR      Z,loc_216582
  21657D  21 21                    LD      A,0x21
  21657F  78 8e 00                 JRL     loc_216610

loc_216582:
  216582  38                       PUSH    XWA
  216583  8e 28 21                 LD      A,(XIZ+0x28)
  216586  d8 12                    EXTZ    WA
  216588  e8 12                    EXTZ    XWA
  21658A  d8 08 05 00              MUL     XWA,5
  21658E  e8 8b                    LD      XHL,XWA
  216590  8e 29 21                 LD      A,(XIZ+0x29)
  216593  d8 12                    EXTZ    WA
  216595  e8 12                    EXTZ    XWA
  216597  eb 80                    ADD     XWA,XHL
  216599  d8 08 04 00              MUL     XWA,4
  21659D  43 df a0 24 00           LD      XHL,0x24A0DF
  2165A2  e8 83                    ADD     XHL,XWA
  2165A4  a3 23                    LD      XHL,(XHL)
  2165A6  58                       POP     XWA
  2165A7  eb 89                    LD      XBC,XHL
  2165A9  e1 41 50 20              LD      XWA,(0x5041)
  2165AD  1d 2f 62 20              CALL    sub_20622F
  2165B1  6f 04                    JR      NC,loc_2165B7
  2165B3  21 22                    LD      A,0x22
  2165B5  68 59                    JR      loc_216610

loc_2165B7:
  2165B7  3b                       PUSH    XHL
  2165B8  8e 28 21                 LD      A,(XIZ+0x28)
  2165BB  d8 12                    EXTZ    WA
  2165BD  e8 12                    EXTZ    XWA
  2165BF  43 94 a0 24 00           LD      XHL,0x24A094
  2165C4  e8 83                    ADD     XHL,XWA
  2165C6  83 21                    LD      A,(XHL)
  2165C8  d8 12                    EXTZ    WA
  2165CA  5b                       POP     XHL
  2165CB  1d 97 61 20              CALL    0x206197
  2165CF  6f 04                    JR      NC,loc_2165D5
  2165D1  21 23                    LD      A,0x23
  2165D3  68 3b                    JR      loc_216610

loc_2165D5:
  2165D5  38                       PUSH    XWA
  2165D6  8e 28 21                 LD      A,(XIZ+0x28)
  2165D9  d8 12                    EXTZ    WA
  2165DB  e8 12                    EXTZ    XWA
  2165DD  d8 08 05 00              MUL     XWA,5
  2165E1  e8 8b                    LD      XHL,XWA
  2165E3  8e 29 21                 LD      A,(XIZ+0x29)
  2165E6  d8 12                    EXTZ    WA
  2165E8  e8 12                    EXTZ    XWA
  2165EA  eb 80                    ADD     XWA,XHL
  2165EC  d8 08 04 00              MUL     XWA,4
  2165F0  43 df a0 24 00           LD      XHL,0x24A0DF
  2165F5  e8 83                    ADD     XHL,XWA
  2165F7  a3 23                    LD      XHL,(XHL)
  2165F9  58                       POP     XWA
  2165FA  eb 89                    LD      XBC,XHL
  2165FC  e1 41 50 20              LD      XWA,(0x5041)
  216600  1d 2f 62 20              CALL    sub_20622F
  216604  f1 41 50 60              LD      (0x5041),XWA
  216608  1d ac 68 21              CALL    sub_2168AC
  21660C  21 20                    LD      A,0x20
  21660E  68 00                    JR      loc_216610

loc_216610:
  216610  be 12 41                 LD      (XIZ+0x12),A
  216613  21 06                    LD      A,6
  216615  be 0e 41                 LD      (XIZ+0xE),A

loc_216618:
  216618  0e                       RET

sub_216619:
  216619  8e 27 21                 LD      A,(XIZ+0x27)
  21661C  c9 d9                    CP      A,1
  21661E  6e 05                    JR      NZ,loc_216625
  216620  1e e7 fd                 CALR    sub_21640A
  216623  68 1b                    JR      loc_216640

loc_216625:
  216625  c9 da                    CP      A,2
  216627  6e 05                    JR      NZ,loc_21662E
  216629  1e 61 fe                 CALR    sub_21648D
  21662C  68 12                    JR      loc_216640

loc_21662E:
  21662E  c9 db                    CP      A,3
  216630  6e 05                    JR      NZ,loc_216637
  216632  1e 82 fe                 CALR    sub_2164B7
  216635  68 09                    JR      loc_216640

loc_216637:
  216637  c9 dc                    CP      A,4
  216639  6e 05                    JR      NZ,loc_216640
  21663B  1e b3 fe                 CALR    sub_2164F1
  21663E  68 00                    JR      loc_216640

loc_216640:
  216640  8e 2d 21                 LD      A,(XIZ+0x2D)
  216643  c9 61                    INC     1,A
  216645  be 2d 41                 LD      (XIZ+0x2D),A
  216648  0e                       RET

sub_216649:
  216649  c8 04                    PUSH    W
  21664B  30 ff 00                 LD      WA,0xFF
  21664E  1d d6 61 20              CALL    0x2061D6
  216652  c8 05                    POP     W
  216654  c9 69                    DEC     1,A
  216656  c9 ee 01                 SLL     1,A
  216659  c9 88                    LD      W,A
  21665B  1d 0c 6b 21              CALL    dyn_216B0C
  21665F  c9 cd 01                 XOR     A,1
  216662  c8 81                    ADD     A,W
  216664  d8 12                    EXTZ    WA
  216666  e8 12                    EXTZ    XWA
  216668  43 ce a1 24 00           LD      XHL,0x24A1CE
  21666D  e8 83                    ADD     XHL,XWA
  21666F  83 21                    LD      A,(XHL)
  216671  14                       PUSH    A
  216672  c9 c8 54                 ADD     A,0x54
  216675  be 12 41                 LD      (XIZ+0x12),A
  216678  21 06                    LD      A,6
  21667A  be 0e 41                 LD      (XIZ+0xE),A
  21667D  1e c1 f0                 CALR    dyn_215741
  216680  15                       POP     A
  216681  d8 12                    EXTZ    WA
  216683  e8 12                    EXTZ    XWA
  216685  e8 ee 01                 SLL     1,XWA
  216688  43 b8 a1 24 00           LD      XHL,0x24A1B8
  21668D  e8 83                    ADD     XHL,XWA
  21668F  93 20                    LD      WA,(XHL)
  216691  1d 97 61 20              CALL    0x206197
  216695  67 1b                    JR      C,loc_2166B2
  216697  c8 04                    PUSH    W
  216699  30 ff 00                 LD      WA,0xFF
  21669C  1d d6 61 20              CALL    0x2061D6
  2166A0  c8 05                    POP     W
  2166A2  c9 8b                    LD      C,A

loc_2166A4:
  2166A4  30 ff 00                 LD      WA,0xFF
  2166A7  cb 04                    PUSH    C
  2166A9  1d b8 61 20              CALL    sub_2061B8
  2166AD  cb 05                    POP     C
  2166AF  cb 1c f2                 DJNZ    C,loc_2166A4

loc_2166B2:
  2166B2  0e                       RET

dyn_2166B3:
  2166B3  3b                       PUSH    XHL
  2166B4  3a                       PUSH    XDE
  2166B5  39                       PUSH    XBC
  2166B6  38                       PUSH    XWA
  2166B7  33 10 00                 LD      HL,0x10
  2166BA  21 01                    LD      A,1
  2166BC  23 14                    LD      C,0x14
  2166BE  25 05                    LD      E,5
  2166C0  1d 94 74 20              CALL    dyn_207494
  2166C4  58                       POP     XWA
  2166C5  59                       POP     XBC
  2166C6  5a                       POP     XDE
  2166C7  5b                       POP     XHL
  2166C8  0e                       RET

dyn_2166C9:
  2166C9  3b                       PUSH    XHL
  2166CA  3a                       PUSH    XDE
  2166CB  39                       PUSH    XBC
  2166CC  38                       PUSH    XWA
  2166CD  21 01                    LD      A,1
  2166CF  23 00                    LD      C,0
  2166D1  25 2e                    LD      E,0x2E
  2166D3  1d c0 74 20              CALL    dyn_2074C0
  2166D7  58                       POP     XWA
  2166D8  59                       POP     XBC
  2166D9  5a                       POP     XDE
  2166DA  5b                       POP     XHL
  2166DB  0e                       RET

dyn_2166DC:
  2166DC  3b                       PUSH    XHL
  2166DD  3a                       PUSH    XDE
  2166DE  39                       PUSH    XBC
  2166DF  38                       PUSH    XWA
  2166E0  21 01                    LD      A,1
  2166E2  1d 98 75 20              CALL    dyn_207598
  2166E6  58                       POP     XWA
  2166E7  59                       POP     XBC
  2166E8  5a                       POP     XDE
  2166E9  5b                       POP     XHL
  2166EA  0e                       RET

dyn_2166EB:
  2166EB  3b                       PUSH    XHL
  2166EC  3a                       PUSH    XDE
  2166ED  39                       PUSH    XBC
  2166EE  38                       PUSH    XWA
  2166EF  21 01                    LD      A,1
  2166F1  1d cc 75 20              CALL    dyn_2075CC
  2166F5  58                       POP     XWA
  2166F6  59                       POP     XBC
  2166F7  5a                       POP     XDE
  2166F8  5b                       POP     XHL
  2166F9  0e                       RET

  ; ---- 0x47 bytes not traced ----

dyn_216741:
  216741  3b                       PUSH    XHL
  216742  3a                       PUSH    XDE
  216743  39                       PUSH    XBC
  216744  38                       PUSH    XWA
  216745  33 46 00                 LD      HL,0x46
  216748  21 02                    LD      A,2
  21674A  23 08                    LD      C,8
  21674C  25 0b                    LD      E,0xB
  21674E  1d 94 74 20              CALL    dyn_207494
  216752  58                       POP     XWA
  216753  59                       POP     XBC
  216754  5a                       POP     XDE
  216755  5b                       POP     XHL
  216756  0e                       RET

dyn_216757:
  216757  3b                       PUSH    XHL
  216758  3a                       PUSH    XDE
  216759  39                       PUSH    XBC
  21675A  38                       PUSH    XWA
  21675B  21 02                    LD      A,2
  21675D  23 0c                    LD      C,0xC
  21675F  25 20                    LD      E,0x20
  216761  1d c0 74 20              CALL    dyn_2074C0
  216765  58                       POP     XWA
  216766  59                       POP     XBC
  216767  5a                       POP     XDE
  216768  5b                       POP     XHL
  216769  0e                       RET

dyn_21676A:
  21676A  3b                       PUSH    XHL
  21676B  3a                       PUSH    XDE
  21676C  39                       PUSH    XBC
  21676D  38                       PUSH    XWA
  21676E  21 02                    LD      A,2
  216770  1d 98 75 20              CALL    dyn_207598
  216774  58                       POP     XWA
  216775  59                       POP     XBC
  216776  5a                       POP     XDE
  216777  5b                       POP     XHL
  216778  0e                       RET

sub_216779:
  216779  3b                       PUSH    XHL
  21677A  3a                       PUSH    XDE
  21677B  39                       PUSH    XBC
  21677C  38                       PUSH    XWA
  21677D  21 02                    LD      A,2
  21677F  1d cc 75 20              CALL    dyn_2075CC
  216783  58                       POP     XWA
  216784  59                       POP     XBC
  216785  5a                       POP     XDE
  216786  5b                       POP     XHL
  216787  0e                       RET

dyn_216788:
  216788  3b                       PUSH    XHL
  216789  3a                       PUSH    XDE
  21678A  39                       PUSH    XBC
  21678B  38                       PUSH    XWA
  21678C  33 8e 00                 LD      HL,0x8E
  21678F  21 03                    LD      A,3
  216791  23 08                    LD      C,8
  216793  25 03                    LD      E,3
  216795  1d 94 74 20              CALL    dyn_207494
  216799  58                       POP     XWA
  21679A  59                       POP     XBC
  21679B  5a                       POP     XDE
  21679C  5b                       POP     XHL
  21679D  0e                       RET

dyn_21679E:
  21679E  3b                       PUSH    XHL
  21679F  3a                       PUSH    XDE
  2167A0  39                       PUSH    XBC
  2167A1  38                       PUSH    XWA
  2167A2  21 03                    LD      A,3
  2167A4  23 0c                    LD      C,0xC
  2167A6  25 2b                    LD      E,0x2B
  2167A8  1d c0 74 20              CALL    dyn_2074C0
  2167AC  58                       POP     XWA
  2167AD  59                       POP     XBC
  2167AE  5a                       POP     XDE
  2167AF  5b                       POP     XHL
  2167B0  0e                       RET

dyn_2167B1:
  2167B1  3b                       PUSH    XHL
  2167B2  3a                       PUSH    XDE
  2167B3  39                       PUSH    XBC
  2167B4  38                       PUSH    XWA
  2167B5  21 03                    LD      A,3
  2167B7  1d 98 75 20              CALL    dyn_207598
  2167BB  58                       POP     XWA
  2167BC  59                       POP     XBC
  2167BD  5a                       POP     XDE
  2167BE  5b                       POP     XHL
  2167BF  0e                       RET

  ; ---- 0xf bytes not traced ----

dyn_2167CF:
  2167CF  3b                       PUSH    XHL
  2167D0  3a                       PUSH    XDE
  2167D1  39                       PUSH    XBC
  2167D2  38                       PUSH    XWA
  2167D3  1d b3 66 21              CALL    dyn_2166B3
  2167D7  1d 41 67 21              CALL    dyn_216741
  2167DB  1d 88 67 21              CALL    dyn_216788
  2167DF  58                       POP     XWA
  2167E0  59                       POP     XBC
  2167E1  5a                       POP     XDE
  2167E2  5b                       POP     XHL
  2167E3  0e                       RET

dyn_2167E4:
  2167E4  3b                       PUSH    XHL
  2167E5  3a                       PUSH    XDE
  2167E6  39                       PUSH    XBC
  2167E7  38                       PUSH    XWA
  2167E8  1d c9 66 21              CALL    dyn_2166C9
  2167EC  1d 57 67 21              CALL    dyn_216757
  2167F0  1d 9e 67 21              CALL    dyn_21679E
  2167F4  58                       POP     XWA
  2167F5  59                       POP     XBC
  2167F6  5a                       POP     XDE
  2167F7  5b                       POP     XHL
  2167F8  0e                       RET

dyn_2167F9:
  2167F9  3b                       PUSH    XHL
  2167FA  3a                       PUSH    XDE
  2167FB  39                       PUSH    XBC
  2167FC  38                       PUSH    XWA
  2167FD  1d dc 66 21              CALL    dyn_2166DC
  216801  1d 6a 67 21              CALL    dyn_21676A
  216805  1d b1 67 21              CALL    dyn_2167B1
  216809  58                       POP     XWA
  21680A  59                       POP     XBC
  21680B  5a                       POP     XDE
  21680C  5b                       POP     XHL
  21680D  0e                       RET

  ; ---- 0x37 bytes not traced ----

dyn_216845:
  216845  30 94 00                 LD      WA,0x94
  216848  0e                       RET

dyn_216849:
  216849  30 3c 01                 LD      WA,0x13C
  21684C  0e                       RET

  ; ---- 0x4 bytes not traced ----

sub_216851:
  216851  3b                       PUSH    XHL
  216852  3a                       PUSH    XDE
  216853  39                       PUSH    XBC
  216854  38                       PUSH    XWA
  216855  cb 8d                    LD      E,C
  216857  c9 8a                    LD      B,A

loc_216859:
  216859  eb ef 01                 SRL     1,XHL
  21685C  c9 eb 01                 RR      1,A
  21685F  eb ef 01                 SRL     1,XHL
  216862  c9 eb 01                 RR      1,A
  216865  eb ef 01                 SRL     1,XHL
  216868  c9 eb 01                 RR      1,A
  21686B  eb ef 01                 SRL     1,XHL
  21686E  c9 eb 01                 RR      1,A
  216871  c9 ef 04                 SRL     4,A
  216874  14                       PUSH    A
  216875  cb 1c e1                 DJNZ    C,loc_216859
  216878  20 0a                    LD      W,0xA
  21687A  cd 8b                    LD      C,E

loc_21687C:
  21687C  15                       POP     A
  21687D  c9 d8                    CP      A,0
  21687F  6e 04                    JR      NZ,loc_216885
  216881  cb d9                    CP      C,1
  216883  6e 02                    JR      NZ,loc_216887

loc_216885:
  216885  20 00                    LD      W,0

loc_216887:
  216887  c8 81                    ADD     A,W
  216889  29                       PUSH    BC
  21688A  c8 04                    PUSH    W
  21688C  d8 12                    EXTZ    WA
  21688E  e8 12                    EXTZ    XWA
  216890  d8 08 02 00              MUL     XWA,2
  216894  43 fc a1 24 00           LD      XHL,0x24A1FC
  216899  e8 83                    ADD     XHL,XWA
  21689B  ca 89                    LD      A,B
  21689D  1d f3 76 20              CALL    dyn_2076F3
  2168A1  c8 05                    POP     W
  2168A3  49                       POP     BC
  2168A4  cb 1c d5                 DJNZ    C,loc_21687C
  2168A7  58                       POP     XWA
  2168A8  59                       POP     XBC
  2168A9  5a                       POP     XDE
  2168AA  5b                       POP     XHL
  2168AB  0e                       RET

sub_2168AC:
  2168AC  3b                       PUSH    XHL
  2168AD  3a                       PUSH    XDE
  2168AE  39                       PUSH    XBC
  2168AF  38                       PUSH    XWA
  2168B0  21 03                    LD      A,3
  2168B2  1d cc 75 20              CALL    dyn_2075CC
  2168B6  e1 41 50 23              LD      XHL,(0x5041)
  2168BA  23 06                    LD      C,6
  2168BC  21 03                    LD      A,3
  2168BE  1d 51 68 21              CALL    sub_216851
  2168C2  58                       POP     XWA
  2168C3  59                       POP     XBC
  2168C4  5a                       POP     XDE
  2168C5  5b                       POP     XHL
  2168C6  0e                       RET

  ; ---- 0x53 bytes not traced ----

sub_21691A:
  21691A  3b                       PUSH    XHL
  21691B  29                       PUSH    BC
  21691C  14                       PUSH    A
  21691D  33 40 00                 LD      HL,0x40
  216920  1d 44 61 20              CALL    sub_206144
  216924  33 41 00                 LD      HL,0x41
  216927  1d 44 61 20              CALL    sub_206144
  21692B  33 42 00                 LD      HL,0x42
  21692E  1d 44 61 20              CALL    sub_206144
  216932  33 43 00                 LD      HL,0x43
  216935  1d 44 61 20              CALL    sub_206144
  216939  33 44 00                 LD      HL,0x44
  21693C  1d 44 61 20              CALL    sub_206144
  216940  33 45 00                 LD      HL,0x45
  216943  1d 44 61 20              CALL    sub_206144
  216947  33 46 00                 LD      HL,0x46
  21694A  1d 44 61 20              CALL    sub_206144
  21694E  33 47 00                 LD      HL,0x47
  216951  1d 44 61 20              CALL    sub_206144
  216955  33 48 00                 LD      HL,0x48
  216958  1d 44 61 20              CALL    sub_206144
  21695C  33 49 00                 LD      HL,0x49
  21695F  1d 44 61 20              CALL    sub_206144
  216963  33 4a 00                 LD      HL,0x4A
  216966  1d 44 61 20              CALL    sub_206144
  21696A  33 4b 00                 LD      HL,0x4B
  21696D  1d 44 61 20              CALL    sub_206144
  216971  33 4c 00                 LD      HL,0x4C
  216974  1d 44 61 20              CALL    sub_206144
  216978  33 4d 00                 LD      HL,0x4D
  21697B  1d 44 61 20              CALL    sub_206144
  21697F  33 4e 00                 LD      HL,0x4E
  216982  1d 44 61 20              CALL    sub_206144
  216986  15                       POP     A
  216987  49                       POP     BC
  216988  5b                       POP     XHL
  216989  0e                       RET

  ; ---- 0x5b bytes not traced ----

sub_2169E5:
  2169E5  3b                       PUSH    XHL
  2169E6  29                       PUSH    BC
  2169E7  14                       PUSH    A
  2169E8  33 51 00                 LD      HL,0x51
  2169EB  1d 44 61 20              CALL    sub_206144
  2169EF  33 52 00                 LD      HL,0x52
  2169F2  1d 44 61 20              CALL    sub_206144
  2169F6  33 53 00                 LD      HL,0x53
  2169F9  1d 44 61 20              CALL    sub_206144
  2169FD  33 54 00                 LD      HL,0x54
  216A00  1d 44 61 20              CALL    sub_206144
  216A04  33 55 00                 LD      HL,0x55
  216A07  1d 44 61 20              CALL    sub_206144
  216A0B  33 56 00                 LD      HL,0x56
  216A0E  1d 44 61 20              CALL    sub_206144
  216A12  33 57 00                 LD      HL,0x57
  216A15  1d 44 61 20              CALL    sub_206144
  216A19  33 58 00                 LD      HL,0x58
  216A1C  1d 44 61 20              CALL    sub_206144
  216A20  33 59 00                 LD      HL,0x59
  216A23  1d 44 61 20              CALL    sub_206144
  216A27  33 5a 00                 LD      HL,0x5A
  216A2A  1d 44 61 20              CALL    sub_206144
  216A2E  33 5b 00                 LD      HL,0x5B
  216A31  1d 44 61 20              CALL    sub_206144
  216A35  33 5c 00                 LD      HL,0x5C
  216A38  1d 44 61 20              CALL    sub_206144
  216A3C  33 5d 00                 LD      HL,0x5D
  216A3F  1d 44 61 20              CALL    sub_206144
  216A43  33 5e 00                 LD      HL,0x5E
  216A46  1d 44 61 20              CALL    sub_206144
  216A4A  15                       POP     A
  216A4B  49                       POP     BC
  216A4C  5b                       POP     XHL
  216A4D  0e                       RET

  ; ---- 0x54 bytes not traced ----

dyn_216AA2:
  216AA2  3b                       PUSH    XHL
  216AA3  29                       PUSH    BC
  216AA4  33 0b 00                 LD      HL,0xB
  216AA7  2b                       PUSH    HL
  216AA8  1d 5b 61 20              CALL    dyn_20615B
  216AAC  cf d9                    CP      L,1
  216AAE  4b                       POP     HL
  216AAF  66 06                    JR      Z,0x216AB7
  216AB1  db ca 01 00              SUB     HL,1
  216AB5  6e f0                    JR      NZ,0x216AA7
  216AB7  cf 89                    LD      A,L
  216AB9  49                       POP     BC
  216ABA  5b                       POP     XHL
  216ABB  0e                       RET

sub_216ABC:
  216ABC  3b                       PUSH    XHL
  216ABD  c8 04                    PUSH    W
  216ABF  1d a2 6a 21              CALL    dyn_216AA2
  216AC3  d8 12                    EXTZ    WA
  216AC5  e8 12                    EXTZ    XWA
  216AC7  43 12 a2 24 00           LD      XHL,0x24A212
  216ACC  e8 83                    ADD     XHL,XWA
  216ACE  83 21                    LD      A,(XHL)
  216AD0  c8 05                    POP     W
  216AD2  5b                       POP     XHL
  216AD3  0e                       RET

  ; ---- 0x38 bytes not traced ----

dyn_216B0C:
  216B0C  c1 21 50 21              LD      A,(0x5021)
  216B10  c9 69                    DEC     1,A
  216B12  c9 cd 01                 XOR     A,1
  216B15  c9 cc 01                 AND     A,1
  216B18  0e                       RET

sub_216B19:
  216B19  3b                       PUSH    XHL
  216B1A  29                       PUSH    BC
  216B1B  c8 04                    PUSH    W
  216B1D  33 10 00                 LD      HL,0x10
  216B20  21 00                    LD      A,0
  216B22  20 04                    LD      W,4

loc_216B24:
  216B24  2b                       PUSH    HL
  216B25  28                       PUSH    WA
  216B26  1d 5b 61 20              CALL    dyn_20615B
  216B2A  48                       POP     WA
  216B2B  cf 81                    ADD     A,L
  216B2D  4b                       POP     HL
  216B2E  db 61                    INC     1,HL
  216B30  c8 1c f1                 DJNZ    W,loc_216B24
  216B33  c8 05                    POP     W
  216B35  49                       POP     BC
  216B36  5b                       POP     XHL
  216B37  0e                       RET

sub_216B38:
  216B38  3b                       PUSH    XHL
  216B39  29                       PUSH    BC
  216B3A  14                       PUSH    A
  216B3B  33 10 00                 LD      HL,0x10
  216B3E  21 04                    LD      A,4

loc_216B40:
  216B40  2b                       PUSH    HL
  216B41  14                       PUSH    A
  216B42  1d 44 61 20              CALL    sub_206144
  216B46  15                       POP     A
  216B47  4b                       POP     HL
  216B48  db 61                    INC     1,HL
  216B4A  c9 1c f3                 DJNZ    A,loc_216B40
  216B4D  15                       POP     A
  216B4E  49                       POP     BC
  216B4F  5b                       POP     XHL
  216B50  0e                       RET

sub_216B51:
  216B51  3b                       PUSH    XHL
  216B52  29                       PUSH    BC
  216B53  14                       PUSH    A
  216B54  33 60 00                 LD      HL,0x60
  216B57  21 04                    LD      A,4

loc_216B59:
  216B59  2b                       PUSH    HL
  216B5A  14                       PUSH    A
  216B5B  1d 44 61 20              CALL    sub_206144
  216B5F  15                       POP     A
  216B60  4b                       POP     HL
  216B61  db 61                    INC     1,HL
  216B63  c9 1c f3                 DJNZ    A,loc_216B59
  216B66  15                       POP     A
  216B67  49                       POP     BC
  216B68  5b                       POP     XHL
  216B69  0e                       RET

sub_216B6A:
  216B6A  3b                       PUSH    XHL
  216B6B  29                       PUSH    BC
  216B6C  c8 04                    PUSH    W
  216B6E  20 00                    LD      W,0
  216B70  33 30 00                 LD      HL,0x30
  216B73  1d 5b 61 20              CALL    dyn_20615B
  216B77  cf e0                    OR      W,L
  216B79  33 31 00                 LD      HL,0x31
  216B7C  1d 5b 61 20              CALL    dyn_20615B
  216B80  cf e0                    OR      W,L
  216B82  c8 89                    LD      A,W
  216B84  c8 05                    POP     W
  216B86  49                       POP     BC
  216B87  5b                       POP     XHL
  216B88  0e                       RET

sub_216B89:
  216B89  3b                       PUSH    XHL
  216B8A  29                       PUSH    BC
  216B8B  c8 04                    PUSH    W
  216B8D  20 00                    LD      W,0
  216B8F  33 32 00                 LD      HL,0x32
  216B92  1d 5b 61 20              CALL    dyn_20615B
  216B96  cf e0                    OR      W,L
  216B98  33 33 00                 LD      HL,0x33
  216B9B  1d 5b 61 20              CALL    dyn_20615B
  216B9F  cf e0                    OR      W,L
  216BA1  c8 89                    LD      A,W
  216BA3  c8 05                    POP     W
  216BA5  49                       POP     BC
  216BA6  5b                       POP     XHL
  216BA7  0e                       RET

sub_216BA8:
  216BA8  3a                       PUSH    XDE
  216BA9  39                       PUSH    XBC
  216BAA  38                       PUSH    XWA
  216BAB  d8 cf 01 01              CP      WA,0x101
  216BAF  6f 08                    JR      NC,loc_216BB9
  216BB1  c9 8f                    LD      L,A
  216BB3  1d 72 82 20              CALL    sub_208272
  216BB7  68 0c                    JR      loc_216BC5

loc_216BB9:
  216BB9  d8 ca 01 01              SUB     WA,0x101
  216BBD  d8 61                    INC     1,WA
  216BBF  c9 8f                    LD      L,A
  216BC1  1d fa 82 20              CALL    sub_2082FA

loc_216BC5:
  216BC5  58                       POP     XWA
  216BC6  59                       POP     XBC
  216BC7  5a                       POP     XDE
  216BC8  0e                       RET

sub_216BC9:
  216BC9  38                       PUSH    XWA
  216BCA  d8 cf 01 01              CP      WA,0x101
  216BCE  6f 07                    JR      NC,loc_216BD7
  216BD0  43 06 10 27 00           LD      XHL,0x271006
  216BD5  68 0b                    JR      loc_216BE2

loc_216BD7:
  216BD7  d8 ca 01 01              SUB     WA,0x101
  216BDB  d8 61                    INC     1,WA
  216BDD  43 c1 1e 27 00           LD      XHL,0x271EC1

loc_216BE2:
  216BE2  d8 69                    DEC     1,WA
  216BE4  e8 12                    EXTZ    XWA
  216BE6  d8 08 13 00              MUL     XWA,0x13
  216BEA  e8 83                    ADD     XHL,XWA
  216BEC  58                       POP     XWA
  216BED  0e                       RET

dyn_216BEE:
  216BEE  3b                       PUSH    XHL
  216BEF  3a                       PUSH    XDE
  216BF0  39                       PUSH    XBC
  216BF1  38                       PUSH    XWA
  216BF2  d8 a8                    LD      WA,0
  216BF4  22 00                    LD      B,0
  216BF6  23 00                    LD      C,0
  216BF8  b3 50                    LD      (XHL),WA
  216BFA  eb 62                    INC     2,XHL
  216BFC  cb 61                    INC     1,C
  216BFE  cb cf 0c                 CP      C,0xC
  216C01  67 f5                    JR      C,0x216BF8
  216C03  42 20 00 00 00           LD      XDE,0x20
  216C08  ea ca 0c 00 00 00        SUB     XDE,0xC
  216C0E  ea ee 01                 SLL     1,XDE
  216C11  ea 83                    ADD     XHL,XDE
  216C13  ca 61                    INC     1,B
  216C15  ca cf 0e                 CP      B,0xE
  216C18  67 dc                    JR      C,0x216BF6
  216C1A  58                       POP     XWA
  216C1B  59                       POP     XBC
  216C1C  5a                       POP     XDE
  216C1D  5b                       POP     XHL
  216C1E  0e                       RET

  ; ---- 0x212 bytes not traced ----

dyn_216E31:
  216E31  14                       PUSH    A
  216E32  21 00                    LD      A,0
  216E34  f1 5b 58 41              LD      (0x585B),A
  216E38  15                       POP     A
  216E39  0e                       RET

dyn_216E3A:
  216E3A  14                       PUSH    A
  216E3B  21 81                    LD      A,0x81
  216E3D  f1 5b 58 41              LD      (0x585B),A
  216E41  15                       POP     A
  216E42  0e                       RET

dyn_216E43:
  216E43  c8 04                    PUSH    W
  216E45  c1 5b 58 20              LD      W,(0x585B)
  216E49  c9 80                    ADD     W,A
  216E4B  c8 d8                    CP      W,0
  216E4D  66 0d                    JR      Z,dyn_216E5C
  216E4F  c8 33 07                 BIT     7,W
  216E52  66 08                    JR      Z,dyn_216E5C
  216E54  f1 5b 58 40              LD      (0x585B),W
  216E58  21 01                    LD      A,1
  216E5A  68 08                    JR      0x216E64

dyn_216E5C:
  216E5C  20 00                    LD      W,0
  216E5E  f1 5b 58 40              LD      (0x585B),W
  216E62  21 00                    LD      A,0
  216E64  c8 05                    POP     W
  216E66  0e                       RET

dyn_216E67:
  216E67  c8 04                    PUSH    W
  216E69  c1 5b 58 20              LD      W,(0x585B)
  216E6D  c9 a0                    SUB     W,A
  216E6F  c8 cf 81                 CP      W,0x81
  216E72  66 0d                    JR      Z,dyn_216E81
  216E74  c8 33 07                 BIT     7,W
  216E77  66 08                    JR      Z,dyn_216E81
  216E79  f1 5b 58 40              LD      (0x585B),W
  216E7D  21 01                    LD      A,1
  216E7F  68 08                    JR      0x216E89

dyn_216E81:
  216E81  20 81                    LD      W,0x81
  216E83  f1 5b 58 40              LD      (0x585B),W
  216E87  21 00                    LD      A,0
  216E89  c8 05                    POP     W
  216E8B  0e                       RET

  ; ---- 0x9 bytes not traced ----

sub_216E95:
  216E95  c8 04                    PUSH    W
  216E97  c1 5b 58 20              LD      W,(0x585B)
  216E9B  c9 a0                    SUB     W,A
  216E9D  c8 d8                    CP      W,0
  216E9F  66 0d                    JR      Z,loc_216EAE
  216EA1  c8 33 07                 BIT     7,W
  216EA4  6e 08                    JR      NZ,loc_216EAE
  216EA6  f1 5b 58 40              LD      (0x585B),W
  216EAA  21 01                    LD      A,1
  216EAC  68 08                    JR      loc_216EB6

loc_216EAE:
  216EAE  20 00                    LD      W,0
  216EB0  f1 5b 58 40              LD      (0x585B),W
  216EB4  21 00                    LD      A,0

loc_216EB6:
  216EB6  c8 05                    POP     W
  216EB8  0e                       RET

sub_216EB9:
  216EB9  c8 04                    PUSH    W
  216EBB  c1 5b 58 20              LD      W,(0x585B)
  216EBF  c9 80                    ADD     W,A
  216EC1  c8 cf 7f                 CP      W,0x7F
  216EC4  66 0d                    JR      Z,loc_216ED3
  216EC6  c8 33 07                 BIT     7,W
  216EC9  6e 08                    JR      NZ,loc_216ED3
  216ECB  f1 5b 58 40              LD      (0x585B),W
  216ECF  21 01                    LD      A,1
  216ED1  68 08                    JR      loc_216EDB

loc_216ED3:
  216ED3  20 7f                    LD      W,0x7F
  216ED5  f1 5b 58 40              LD      (0x585B),W
  216ED9  21 00                    LD      A,0

loc_216EDB:
  216EDB  c8 05                    POP     W
  216EDD  0e                       RET

dyn_216EDE:
  216EDE  14                       PUSH    A
  216EDF  21 00                    LD      A,0
  216EE1  f1 f1 60 41              LD      (0x60F1),A
  216EE5  c9 c8 50                 ADD     A,0x50
  216EE8  f1 f5 60 41              LD      (0x60F5),A
  216EEC  21 a0                    LD      A,0xA0
  216EEE  f1 f3 60 41              LD      (0x60F3),A
  216EF2  c9 d1                    XOR     A,A
  216EF4  f1 f7 60 41              LD      (0x60F7),A
  216EF8  21 00                    LD      A,0
  216EFA  f1 f2 60 41              LD      (0x60F2),A
  216EFE  c9 c8 4c                 ADD     A,0x4C
  216F01  f1 f6 60 41              LD      (0x60F6),A
  216F05  21 98                    LD      A,0x98
  216F07  f1 f4 60 41              LD      (0x60F4),A
  216F0B  c9 d1                    XOR     A,A
  216F0D  f1 f8 60 41              LD      (0x60F8),A
  216F11  21 00                    LD      A,0
  216F13  f1 fd 60 41              LD      (0x60FD),A
  216F17  21 02                    LD      A,2
  216F19  f1 f9 60 41              LD      (0x60F9),A
  216F1D  f1 fa 60 41              LD      (0x60FA),A
  216F21  21 fc                    LD      A,0xFC
  216F23  f1 fb 60 41              LD      (0x60FB),A
  216F27  f1 fc 60 41              LD      (0x60FC),A
  216F2B  15                       POP     A
  216F2C  0e                       RET

  ; ---- 0x3e bytes not traced ----

dyn_216F6B:
  216F6B  14                       PUSH    A
  216F6C  c1 f1 60 21              LD      A,(0x60F1)
  216F70  f1 02 80 41              LD      (GE_WBA_H),A
  216F74  c1 f2 60 21              LD      A,(0x60F2)
  216F78  f1 03 80 41              LD      (GE_WBA_V),A
  216F7C  c1 f3 60 21              LD      A,(0x60F3)
  216F80  f1 04 80 41              LD      (GE_WSI_H),A
  216F84  c1 f4 60 21              LD      A,(0x60F4)
  216F88  f1 05 80 41              LD      (GE_WSI_V),A
  216F8C  15                       POP     A
  216F8D  0e                       RET

dyn_216F8E:
  216F8E  14                       PUSH    A
  216F8F  c1 f5 60 21              LD      A,(0x60F5)
  216F93  f1 02 80 41              LD      (GE_WBA_H),A
  216F97  c1 f6 60 21              LD      A,(0x60F6)
  216F9B  f1 03 80 41              LD      (GE_WBA_V),A
  216F9F  c1 f7 60 21              LD      A,(0x60F7)
  216FA3  f1 04 80 41              LD      (GE_WSI_H),A
  216FA7  c1 f8 60 21              LD      A,(0x60F8)
  216FAB  f1 05 80 41              LD      (GE_WSI_V),A
  216FAF  15                       POP     A
  216FB0  0e                       RET

dyn_216FB1:
  216FB1  14                       PUSH    A
  216FB2  21 01                    LD      A,1
  216FB4  f1 fd 60 41              LD      (0x60FD),A
  216FB8  15                       POP     A
  216FB9  0e                       RET

  ; ---- 0x9 bytes not traced ----

dyn_216FC3:
  216FC3  3b                       PUSH    XHL
  216FC4  3a                       PUSH    XDE
  216FC5  39                       PUSH    XBC
  216FC6  c1 fd 60 21              LD      A,(0x60FD)
  216FCA  c9 d8                    CP      A,0
  216FCC  6e 05                    JR      NZ,dyn_216FD3
  216FCE  21 00                    LD      A,0
  216FD0  78 0d 01                 JRL     0x2170E0

dyn_216FD3:
  216FD3  c9 d9                    CP      A,1
  216FD5  6e 7d                    JR      NZ,loc_217054
  216FD7  21 00                    LD      A,0
  216FD9  c1 02 80 22              LD      B,(GE_WBA_H)
  216FDD  c1 f1 60 23              LD      C,(0x60F1)
  216FE1  cb f2                    CP      B,C
  216FE3  66 12                    JR      Z,0x216FF7
  216FE5  67 06                    JR      C,loc_216FED
  216FE7  c1 f9 60 a2              SUB     B,(0x60F9)
  216FEB  68 04                    JR      loc_216FF1

loc_216FED:
  216FED  c1 f9 60 82              ADD     B,(0x60F9)

loc_216FF1:
  216FF1  f1 02 80 42              LD      (GE_WBA_H),B
  216FF5  21 01                    LD      A,1
  216FF7  c1 03 80 22              LD      B,(GE_WBA_V)
  216FFB  c1 f2 60 23              LD      C,(0x60F2)
  216FFF  cb f2                    CP      B,C
  217001  66 12                    JR      Z,0x217015
  217003  67 06                    JR      C,loc_21700B
  217005  c1 fa 60 a2              SUB     B,(0x60FA)
  217009  68 04                    JR      0x21700F

loc_21700B:
  21700B  c1 fa 60 82              ADD     B,(0x60FA)
  21700F  f1 03 80 42              LD      (GE_WBA_V),B
  217013  21 01                    LD      A,1
  217015  c1 04 80 22              LD      B,(GE_WSI_H)
  217019  c1 f3 60 23              LD      C,(0x60F3)
  21701D  cb f2                    CP      B,C
  21701F  66 12                    JR      Z,0x217033
  217021  67 06                    JR      C,loc_217029
  217023  c1 fb 60 82              ADD     B,(0x60FB)
  217027  68 04                    JR      loc_21702D

loc_217029:
  217029  c1 fb 60 a2              SUB     B,(0x60FB)

loc_21702D:
  21702D  f1 04 80 42              LD      (GE_WSI_H),B
  217031  21 01                    LD      A,1
  217033  c1 05 80 22              LD      B,(GE_WSI_V)
  217037  c1 f4 60 23              LD      C,(0x60F4)
  21703B  cb f2                    CP      B,C
  21703D  66 12                    JR      Z,0x217051
  21703F  67 06                    JR      C,dyn_217047
  217041  c1 fc 60 82              ADD     B,(0x60FC)
  217045  68 04                    JR      0x21704B

dyn_217047:
  217047  c1 fc 60 a2              SUB     B,(0x60FC)
  21704B  f1 05 80 42              LD      (GE_WSI_V),B
  21704F  21 01                    LD      A,1
  217051  78 82 00                 JRL     0x2170D6

loc_217054:
  217054  c9 da                    CP      A,2
  217056  6e 7c                    JR      NZ,loc_2170D4
  217058  21 00                    LD      A,0
  21705A  c1 02 80 22              LD      B,(GE_WBA_H)
  21705E  c1 f5 60 23              LD      C,(0x60F5)
  217062  cb f2                    CP      B,C
  217064  66 12                    JR      Z,loc_217078
  217066  67 06                    JR      C,loc_21706E
  217068  c1 f9 60 a2              SUB     B,(0x60F9)
  21706C  68 04                    JR      loc_217072

loc_21706E:
  21706E  c1 f9 60 82              ADD     B,(0x60F9)

loc_217072:
  217072  f1 02 80 42              LD      (GE_WBA_H),B
  217076  21 01                    LD      A,1

loc_217078:
  217078  c1 03 80 22              LD      B,(GE_WBA_V)
  21707C  c1 f6 60 23              LD      C,(0x60F6)
  217080  cb f2                    CP      B,C
  217082  66 12                    JR      Z,loc_217096
  217084  67 06                    JR      C,loc_21708C
  217086  c1 fa 60 a2              SUB     B,(0x60FA)
  21708A  68 04                    JR      loc_217090

loc_21708C:
  21708C  c1 fa 60 82              ADD     B,(0x60FA)

loc_217090:
  217090  f1 03 80 42              LD      (GE_WBA_V),B
  217094  21 01                    LD      A,1

loc_217096:
  217096  c1 04 80 22              LD      B,(GE_WSI_H)
  21709A  c1 f7 60 23              LD      C,(0x60F7)
  21709E  cb f2                    CP      B,C
  2170A0  66 12                    JR      Z,loc_2170B4
  2170A2  67 06                    JR      C,loc_2170AA
  2170A4  c1 fb 60 82              ADD     B,(0x60FB)
  2170A8  68 04                    JR      loc_2170AE

loc_2170AA:
  2170AA  c1 fb 60 a2              SUB     B,(0x60FB)

loc_2170AE:
  2170AE  f1 04 80 42              LD      (GE_WSI_H),B
  2170B2  21 01                    LD      A,1

loc_2170B4:
  2170B4  c1 05 80 22              LD      B,(GE_WSI_V)
  2170B8  c1 f8 60 23              LD      C,(0x60F8)
  2170BC  cb f2                    CP      B,C
  2170BE  66 12                    JR      Z,loc_2170D2
  2170C0  67 06                    JR      C,loc_2170C8
  2170C2  c1 fc 60 82              ADD     B,(0x60FC)
  2170C6  68 04                    JR      loc_2170CC

loc_2170C8:
  2170C8  c1 fc 60 a2              SUB     B,(0x60FC)

loc_2170CC:
  2170CC  f1 05 80 42              LD      (GE_WSI_V),B
  2170D0  21 01                    LD      A,1

loc_2170D2:
  2170D2  68 02                    JR      0x2170D6

loc_2170D4:
  2170D4  21 00                    LD      A,0
  2170D6  c9 d8                    CP      A,0
  2170D8  6e 06                    JR      NZ,0x2170E0
  2170DA  21 00                    LD      A,0
  2170DC  f1 fd 60 41              LD      (0x60FD),A
  2170E0  59                       POP     XBC
  2170E1  5a                       POP     XDE
  2170E2  5b                       POP     XHL
  2170E3  0e                       RET

sub_2170E4:
  2170E4  14                       PUSH    A
  2170E5  21 00                    LD      A,0
  2170E7  f1 f1 60 41              LD      (0x60F1),A
  2170EB  21 50                    LD      A,0x50
  2170ED  f1 f5 60 41              LD      (0x60F5),A
  2170F1  21 a0                    LD      A,0xA0
  2170F3  f1 f3 60 41              LD      (0x60F3),A
  2170F7  21 00                    LD      A,0
  2170F9  f1 f7 60 41              LD      (0x60F7),A
  2170FD  21 00                    LD      A,0
  2170FF  f1 f2 60 41              LD      (0x60F2),A
  217103  21 00                    LD      A,0
  217105  f1 f6 60 41              LD      (0x60F6),A
  217109  21 98                    LD      A,0x98
  21710B  f1 f4 60 41              LD      (0x60F4),A
  21710F  21 98                    LD      A,0x98
  217111  f1 f8 60 41              LD      (0x60F8),A
  217115  21 02                    LD      A,2
  217117  f1 f9 60 41              LD      (0x60F9),A
  21711B  21 00                    LD      A,0
  21711D  f1 fa 60 41              LD      (0x60FA),A
  217121  21 fc                    LD      A,0xFC
  217123  f1 fb 60 41              LD      (0x60FB),A
  217127  21 00                    LD      A,0
  217129  f1 fc 60 41              LD      (0x60FC),A
  21712D  15                       POP     A
  21712E  0e                       RET

dyn_21712F:
  21712F  14                       PUSH    A
  217130  21 00                    LD      A,0
  217132  f1 f1 60 41              LD      (0x60F1),A
  217136  21 00                    LD      A,0
  217138  f1 f5 60 41              LD      (0x60F5),A
  21713C  21 a0                    LD      A,0xA0
  21713E  f1 f3 60 41              LD      (0x60F3),A
  217142  21 a0                    LD      A,0xA0
  217144  f1 f7 60 41              LD      (0x60F7),A
  217148  21 00                    LD      A,0
  21714A  f1 f2 60 41              LD      (0x60F2),A
  21714E  21 4c                    LD      A,0x4C
  217150  f1 f6 60 41              LD      (0x60F6),A
  217154  21 98                    LD      A,0x98
  217156  f1 f4 60 41              LD      (0x60F4),A
  21715A  21 00                    LD      A,0
  21715C  f1 f8 60 41              LD      (0x60F8),A
  217160  21 00                    LD      A,0
  217162  f1 f9 60 41              LD      (0x60F9),A
  217166  21 02                    LD      A,2
  217168  f1 fa 60 41              LD      (0x60FA),A
  21716C  21 00                    LD      A,0
  21716E  f1 fb 60 41              LD      (0x60FB),A
  217172  21 fc                    LD      A,0xFC
  217174  f1 fc 60 41              LD      (0x60FC),A
  217178  15                       POP     A
  217179  0e                       RET

  ; ---- 0x2e bytes not traced ----

sub_2171A8:
  2171A8  58                       POP     XWA
  2171A9  be 08 60                 LD      (XIZ+8),XWA
  2171AC  0e                       RET

  ; ---- 0x38f8 bytes not traced ----

sub_21AAA5:
  21AAA5  43 17 99 21 00           LD      XHL,0x219917
  21AAAA  f1 1a 62 63              LD      (0x621A),XHL
  21AAAE  f1 f6 61 41              LD      (0x61F6),A
  21AAB2  5b                       POP     XHL
  21AAB3  f1 16 62 63              LD      (0x6216),XHL
  21AAB7  e8 d0                    XOR     XWA,XWA
  21AAB9  f1 12 62 60              LD      (0x6212),XWA
  21AABD  43 e2 aa 21 00           LD      XHL,0x21AAE2
  21AAC2  1d 24 63 20              CALL    dyn_206324

loc_21AAC6:
  21AAC6  e1 12 62 20              LD      XWA,(0x6212)
  21AACA  e8 e0                    OR      XWA,XWA
  21AACC  6e 06                    JR      NZ,loc_21AAD4
  21AACE  1d a8 71 21              CALL    sub_2171A8
  21AAD2  68 f2                    JR      loc_21AAC6

loc_21AAD4:
  21AAD4  1d a8 71 21              CALL    sub_2171A8
  21AAD8  e1 12 62 20              LD      XWA,(0x6212)
  21AADC  e1 16 62 23              LD      XHL,(0x6216)
  21AAE0  b3 d8                    JP      (XHL)

  ; ---- 0x2ae3 bytes not traced ----

dyn_21D5C5:
  21D5C5  f1 80 52 00 03           LDB     (0x5280),3
  21D5CA  f1 81 52 00 ff           LDB     (0x5281),0xFF
  21D5CF  21 00                    LD      A,0
  21D5D1  1d 57 db 20              CALL    dyn_20DB57
  21D5D5  f2 65 dc 20 e6           CALL    Z,dyn_20DC65
  21D5DA  1d cd 72 20              CALL    sub_2072CD
  21D5DE  be 08 02 e9 d5           LDW     (XIZ+8),0xD5E9
  21D5E3  be 0a 02 21 00           LDW     (XIZ+0xA),0x21
  21D5E8  0e                       RET

dyn_21D5E9:
  21D5E9  43 af e3 20 00           LD      XHL,0x20E3AF
  21D5EE  1d 24 63 20              CALL    dyn_206324
  21D5F2  40 f2 d5 21 00           LD      XWA,0x21D5F2
  21D5F7  be 08 60                 LD      (XIZ+8),XWA
  21D5FA  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D5FE  b0 fe                    RET     NZ
  21D600  be 08 02 0b d6           LDW     (XIZ+8),0xD60B
  21D605  be 0a 02 21 00           LDW     (XIZ+0xA),0x21
  21D60A  0e                       RET

dyn_21D60B:
  21D60B  1d 63 68 20              CALL    dyn_206863
  21D60F  43 34 cf 20 00           LD      XHL,0x20CF34
  21D614  1d 24 63 20              CALL    dyn_206324
  21D618  40 18 d6 21 00           LD      XWA,0x21D618
  21D61D  be 08 60                 LD      (XIZ+8),XWA
  21D620  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D624  b0 fe                    RET     NZ
  21D626  c1 f2 5d 3f 01           CPB     (0x5DF2),1
  21D62B  43 47 d6 21 00           LD      XHL,0x21D647
  21D630  66 11                    JR      Z,0x21D643
  21D632  c1 f2 5d 3f 02           CPB     (0x5DF2),2
  21D637  43 38 d7 21 00           LD      XHL,0x21D738
  21D63C  66 05                    JR      Z,0x21D643
  21D63E  43 e9 d5 21 00           LD      XHL,0x21D5E9
  21D643  be 08 63                 LD      (XIZ+8),XHL
  21D646  0e                       RET

dyn_21D647:
  21D647  1d 63 68 20              CALL    dyn_206863
  21D64B  43 ad f7 20 00           LD      XHL,0x20F7AD
  21D650  1d 24 63 20              CALL    dyn_206324
  21D654  40 54 d6 21 00           LD      XWA,0x21D654
  21D659  be 08 60                 LD      (XIZ+8),XWA
  21D65C  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D660  b0 fe                    RET     NZ
  21D662  c1 21 50 3f 00           CPB     (0x5021),0
  21D667  43 0b d6 21 00           LD      XHL,0x21D60B
  21D66C  76 c5 00                 JRL     Z,0x21D734
  21D66F  43 60 50 00 00           LD      XHL,0x5060
  21D674  31 10 00                 LD      BC,0x10
  21D677  f5 ed 02 00 00           LDW     (XHL+),0
  21D67C  d9 1c f8                 DJNZ    BC,0x21D677
  21D67F  43 80 50 00 00           LD      XHL,0x5080
  21D684  31 00 02                 LD      BC,0x200
  21D687  f5 ec 00 00              LDB     (XHL+),0
  21D68B  d9 1c f9                 DJNZ    BC,0x21D687
  21D68E  d8 a8                    LD      WA,0
  21D690  f1 25 50 41              LD      (0x5025),A
  21D694  f1 26 50 41              LD      (0x5026),A
  21D698  f1 27 50 50              LD      (0x5027),WA
  21D69C  f1 29 50 50              LD      (0x5029),WA
  21D6A0  f1 2b 50 50              LD      (0x502B),WA
  21D6A4  f1 2d 50 50              LD      (0x502D),WA
  21D6A8  f1 22 50 41              LD      (0x5022),A
  21D6AC  f1 23 50 50              LD      (0x5023),WA
  21D6B0  1d 12 7b 20              CALL    dyn_207B12
  21D6B4  1d 12 7b 20              CALL    dyn_207B12
  21D6B8  c1 21 50 21              LD      A,(0x5021)
  21D6BC  c9 69                    DEC     1,A
  21D6BE  c9 ef 01                 SRL     1,A
  21D6C1  c9 08 06                 MUL     WA,6
  21D6C4  43 64 18 27 00           LD      XHL,0x271864
  21D6C9  f3 07 ec e0 33           LDA     XHL,XHL+WA
  21D6CE  42 46 50 00 00           LD      XDE,0x5046
  21D6D3  d9 ae                    LD      BC,6
  21D6D5  83 11                    LDIR    (XDE+),(XHL+)
  21D6D7  f1 4c 50 00 00           LDB     (0x504C),0
  21D6DC  f1 4d 50 00 00           LDB     (0x504D),0
  21D6E1  1d 8b 86 20              CALL    dyn_20868B
  21D6E5  d1 5c 50 19 56 50        LDW     (0x5056),(0x505C)
  21D6EB  d1 5e 50 19 58 50        LDW     (0x5058),(0x505E)
  21D6F1  c1 48 50 21              LD      A,(0x5048)
  21D6F5  20 00                    LD      W,0
  21D6F7  d8 69                    DEC     1,WA
  21D6F9  d2 8a 18 27 80           ADD     WA,(0x27188A)
  21D6FE  1d 95 61 20              CALL    dyn_206195
  21D702  f1 3e 50 00 01           LDB     (0x503E),1
  21D707  f1 3f 50 02 05 00        LDW     (0x503F),5
  21D70D  e8 a8                    LD      XWA,0
  21D70F  f1 41 50 60              LD      (0x5041),XWA
  21D713  f1 45 50 00 00           LDB     (0x5045),0
  21D718  43 d3 ef 20 00           LD      XHL,0x20EFD3
  21D71D  1d 24 63 20              CALL    dyn_206324
  21D721  40 21 d7 21 00           LD      XWA,0x21D721
  21D726  be 08 60                 LD      (XIZ+8),XWA
  21D729  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D72D  b0 fe                    RET     NZ
  21D72F  43 00 d8 21 00           LD      XHL,0x21D800
  21D734  be 08 63                 LD      (XIZ+8),XHL
  21D737  0e                       RET

  ; ---- 0x20 bytes not traced ----

dyn_21D758:
  21D758  d1 5c 50 19 56 50        LDW     (0x5056),(0x505C)
  21D75E  d1 5e 50 19 58 50        LDW     (0x5058),(0x505E)
  21D764  21 00                    LD      A,0
  21D766  f1 93 5d 41              LD      (0x5D93),A
  21D76A  f1 94 5d 41              LD      (0x5D94),A
  21D76E  f1 95 5d 41              LD      (0x5D95),A
  21D772  f1 96 5d 41              LD      (0x5D96),A
  21D776  43 4e d8 20 00           LD      XHL,0x20D84E
  21D77B  1d 24 63 20              CALL    dyn_206324
  21D77F  40 7f d7 21 00           LD      XWA,0x21D77F
  21D784  be 08 60                 LD      (XIZ+8),XWA
  21D787  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D78B  b0 fe                    RET     NZ
  21D78D  c1 f4 5d 3f 01           CPB     (0x5DF4),1
  21D792  43 00 d8 21 00           LD      XHL,0x21D800
  21D797  67 1f                    JR      C,0x21D7B8
  21D799  43 56 d8 21 00           LD      XHL,0x21D856
  21D79E  66 18                    JR      Z,0x21D7B8
  21D7A0  c1 f4 5d 3f 03           CPB     (0x5DF4),3
  21D7A5  43 c0 d8 21 00           LD      XHL,0x21D8C0
  21D7AA  67 0c                    JR      C,0x21D7B8
  21D7AC  43 1c d9 21 00           LD      XHL,0x21D91C
  21D7B1  66 05                    JR      Z,0x21D7B8
  21D7B3  43 bc d7 21 00           LD      XHL,0x21D7BC
  21D7B8  be 08 63                 LD      (XIZ+8),XHL
  21D7BB  0e                       RET

  ; ---- 0x44 bytes not traced ----

dyn_21D800:
  21D800  43 0e 4c 21 00           LD      XHL,0x214C0E
  21D805  1d 24 63 20              CALL    dyn_206324
  21D809  40 09 d8 21 00           LD      XWA,0x21D809
  21D80E  be 08 60                 LD      (XIZ+8),XWA
  21D811  8e 0c 3f 00              CPB     (XIZ+0xC),0
  21D815  b0 fe                    RET     NZ
  21D817  1d b3 68 20              CALL    dyn_2068B3
  21D81B  c1 f0 60 3f 01           CPB     (0x60F0),1
  21D820  66 14                    JR      Z,loc_21D836
  21D822  1d 8b 86 20              CALL    dyn_20868B
  21D826  f1 f4 5d 00 00           LDB     (0x5DF4),0
  21D82B  be 08 02 58 d7           LDW     (XIZ+8),0xD758
  21D830  be 0a 02 21 00           LDW     (XIZ+0xA),0x21
  21D835  0e                       RET

loc_21D836:
  21D836  d1 5a 50 19 b7 5d        LDW     (0x5DB7),(0x505A)
  21D83C  21 01                    LD      A,1
  21D83E  1d a5 aa 21              CALL    sub_21AAA5
  21D842  1d 8b 86 20              CALL    dyn_20868B
  21D846  f1 f4 5d 00 00           LDB     (0x5DF4),0
  21D84B  be 08 02 58 d7           LDW     (XIZ+8),0xD758
  21D850  be 0a 02 21 00           LDW     (XIZ+0xA),0x21
  21D855  0e                       RET

  ; ---- 0x163 bytes not traced ----

sub_21D9B9:
  21D9B9  c1 91 6f 3f 10           CPB     (SYS_OS_VERSION),0x10
  21D9BE  6e 34                    JR      NZ,loc_21D9F4
  21D9C0  c1 59 6c 3f 00           CPB     (0x6C59),0
  21D9C5  66 2d                    JR      Z,loc_21D9F4
  21D9C7  c1 5b 6c 3f 01           CPB     (0x6C5B),1
  21D9CC  66 26                    JR      Z,loc_21D9F4
  21D9CE  28                       PUSH    WA
  21D9CF  c0 b0 21                 LD      A,(0xB0)
  21D9D2  c2 fe ff 9f 20           LD      W,(0x9FFFFE)
  21D9D7  c8 06                    CPL     W
  21D9D9  c8 e1                    OR      A,W
  21D9DB  c1 97 6e 31              EX      (0x6E97),A
  21D9DF  c9 88                    LD      W,A
  21D9E1  c1 97 6e d1              XOR     A,(0x6E97)
  21D9E5  c9 c0                    AND     W,A
  21D9E7  c9 06                    CPL     A
  21D9E9  c1 97 6e c1              AND     A,(0x6E97)
  21D9ED  c8 e1                    OR      A,W
  21D9EF  c1 82 6f e9              OR      (SYS_JOYPAD),A
  21D9F3  48                       POP     WA

loc_21D9F4:
  21D9F4  0e                       RET

sub_21D9F5:
  21D9F5  02                       PUSH    SR
  21D9F6  17 03                    LDF     3
  21D9F8  3c                       PUSH    XIX
  21D9F9  c8 80                    ADD     W,W
  21D9FB  c8 80                    ADD     W,W
  21D9FD  44 00 fe ff 00           LD      XIX,0xFFFE00
  21DA02  e3 03 f0 e1 24           LD      XIX,(XIX+W)
  21DA07  b4 e8                    CALL    (XIX)
  21DA09  5c                       POP     XIX
  21DA0A  03                       POP     SR
  21DA0B  0e                       RET

sub_21DA0C:
  21DA0C  c1 91 6f 3f 00           CPB     (SYS_OS_VERSION),0
  21DA11  6e 09                    JR      NZ,loc_21DA1C
  21DA13  f1 83 6f b3              RES     3,(0x6F83)
  21DA17  f1 a0 6d 00 00           LDB     (0x6DA0),0

loc_21DA1C:
  21DA1C  0e                       RET
