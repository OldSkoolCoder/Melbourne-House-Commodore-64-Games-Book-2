1 REM ALLIGATOR
10 PRINT"{clear}{space*15}{reverse on}alligator!{reverse off}":PRINT"{down*14}";
20 V=53248:POKE2040,192:POKE2041,194:POKE2042,194:POKE2043,194:POKE2044,194
22 POKE2045,194:POKE2046,194:POKE2047,194
25 FORI=12288TO12350:READQ:POKEI,Q:POKEI+64,Q:NEXT
30 POKEV+39,0:POKEV+40,7:POKEV+41,7:POKEV+42,7:POKEV+43,7:POKEV+16,0
33 POKEV+44,7:POKEV+45,7:POKEV+46,7
35 FORI=12366TO12381STEP3:READQ:POKEI,Q:NEXT
40 FORI=12416TO12437STEP3:READQ:POKEI,Q:POKEI+1,0:POKEI+2,0:NEXT
45 FORI=12440TO12478:POKEI,0:NEXT
50 FORI=49152TO49262:READQ:POKEI,Q:NEXT
60 NM=4
70 FORI=54272TO54296:POKEI,0:NEXT
90 PRINT"{space*11}hit any key to start"
95 GETX$:IFX$=""THEN95
97 GOSUB1300
100 POKEV+21,0:NM=NM-1:IFNM=0THEN600
102 PRINT"{clear}";:POKE53280,14:POKE53281,6
105 FORI=1024TO1143:POKEI,160:POKEI+54272,14:NEXT
110 FORI=1144TO1823:K=RND(1):IFK<.92THEN130
115 K=RND(1):IFK<.4THENPOKEI,42:POKEI+54272,10:GOTO130
117 IFK<.6THENPOKEI,81:POKEI+54272,0:GOTO130
120 POKEI,88:POKEI+54272,13
130 NEXT
135 POKEV,10:POKEV+1,150:POKEV+16,0:POKE178,1
140 AI=28-R:TM=0
144 FORI=1TO7
145 K1=INT(RND(1)*280+40):K2=INT(RND(0)*30+200)
147 IFK1>255THENPOKEV+16,PEEK(V+16)OR2^I:POKEV+2*I,K1-256:GOTO154
150 POKEV+2*I,K1:POKEV+16,PEEK(V+16)AND(255-2^I)
154 POKEV+2*I+1,K2
156 NEXT
157 R=R+1:GOSUB1100:POKE1545,32
160 POKEV+21,255:PRINT"{down*2}{reverse on}{light blue}air"
170 POKEV+30,0
180 TI$="000000":GOSUB1000
200 SYS(49233):IFTM>120-2*RTHEN600
205 GOSUB1000:IFAR>=AITHEN700
210 AX=PEEK(V)+256*(PEEK(V+16)AND1)
220 IFPEEK(V+1)<67THENGOSUB400:GOTO230
225 FL=0
230 IFAX>327AND(PEEK(V+21)AND30)<>0THEN750
235 IF(PEEK(V+30)AND1)=1THENGOSUB500
240 K1=INT(AX/8)+40*INT((PEEK(V+1)-42)/8)+1024:IFPEEK(K1)=32THEN200
250 IFPEEK(K1)=42THENGOSUB450
260 IFPEEK(K1)=81THENGOSUB550
270 IFPEEK(K1)=88THENGOSUB300
280 GOTO200
300 SC=SC+10:POKEK1,32:GOSUB1000
310 RETURN
400 IFFL=1THEN420
410 TM=TM+INT(TI/60):TI$="000000":GOSUB1100:FL=1
420 RETURN
450 SC=SC+20:POKEK1,32:GOSUB1000
460 RETURN
500 F1=0
505 FORJ=1TO7:K2=PEEK(V+2*J)+(2^(8-J))*(PEEK(V+16)AND(2^J)):K3=PEEK(V+2*J+1)
507 GOSUB1000
510 K4=PEEK(V)+256*(PEEK(V+16)AND1)
512 IF(PEEK(V+21)AND(2^J))=0THEN540
515 IFK2-K4>=18ANDK2-K4<25ANDK3-PEEK(V+1)<8THENF1=J
540 NEXT:IFF1=0THENRETURN
545 IFF1=FBTHEN350
547 SC=SC+150:POKEV+21,PEEK(V+21)AND(255-2^F1):GOSUB1000
548 POKEV+30,0:RETURN
550 GOSUB1300
580 GOTO100
600 POKEV+21,0:POKE53281,0:POKE53280,0:PRINT"{clear}{cyan}{space*17}game over"
610 PRINT"{down*4}{space*12}your score was ";SC
620 GETX$:IFX$=""THENEND
630 GOTO620
700 POKEV+21,0:POKE53281,0:PRINT"{clear}{yellow}{space*11}alligator drowned"
710 FORT=1TO3000:NEXT
720 GOTO100
750 IF(PEEK(V+21)AND30)=0THEN100
760 PRINT"{clear}{cyan}{space*2}one or more yellow fish remaining"
770 POKE53281,0:PRINT"{down*4}{space*12}lose one alligator"
780 FORT=1TO3000:NEXT
790 GOTO100
1000 AR=INT(TI/60):POKE55340+AR,14
1005 FORI=1058TO1063:POKEI,160:NEXT
1010 PRINT"{home}{reverse on}{light blue}score{space*2}";SC;TAB(28);"time: ";120-2*R-TM-AR
1020 RETURN
1100 FORI=55340TO55340+AI:POKEI,0:NEXT
1110 RETURN
1300 FORX=15TO0STEP-1:IFNM=4THEN1302
1301 POKE53281,X+100
1302 POKE54296,X:POKE54276,129:POKE54277,15
1305 POKE54278,128:POKE54273,X:POKE54272,200:NEXT
1310 POKE54276,0:POKE54277,0:RETURN
10000 DATA0,0,0,0,0,0,0,0,0,224,0,0,96,0,1,32,0,3,48,252,230,63,255,252
10010 DATA31,255,248,31,255,240,15,255,255,7,255,255,1,255,0,3,122,0,6,6,0
10020 DATA6,6,0,0,3,0,0,1,128,0,0,0,0,0,0,0,0,0
10030 DATA0,0,224,240,240,255
10040 DATA0,128,198,111,63,111,198,128
10100 DATA165,197,201,41,208,39,173,16,208,41,1,240,7,173,0,208,201,74,176,24
10110 DATA24,173,0,208,105,6,141,0,208,173,0,208,201,6,176,8,173,16,208,9,1,141
10120 DATA 16,208,96,201,62,208,14,173,1,208,201,64,144,6,56,233,6,141,1,208,96
10130 DATA201,12,208,251,173,1,208,201,240,176,244,24,105,6,141,1,208,96,165,178
10140 DATA201,0,208,12,169,193,141,248,7,169,1,133,178,76,0,192,169,192,141,248
10150 DATA7,169,0,133,178,76,0,192
