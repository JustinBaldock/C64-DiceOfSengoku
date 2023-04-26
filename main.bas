10 rem 
20 gosub 60000 : rem function - setup
30 rem
40 gosub 55000 rem function - title screen
50 rem
60 gosub 50000 : rem create players
65 rem gosub 62000 :rem check dice roll

70 rem process player turn
71 rem check for available territory before each turn
80 for pl = 0 to mp
90 rem gosub process player turn.
100 gosub 2000
110 rem if territory is true then gosub player-turn
120 if te = 1 then next pl : rem if territory is true
130 rem game has ended
140 rem display scores
150 gosub 45000
160 end

200 dim dp(6) :rem dicepool
210 gosub 1000
250 end

1000 rem roll dice
1001 rem dice = 1 = samurai
1002 rem dice = 2 = archer
1003 rem dice = 3 = horse
1004 rem dice = 4 = 3 x swordman
1005 rem dice = 5 = 2 x swordman
1006 rem dice = 6 = 1 x swordman
1009 rem rnd(x) takes a seed x, we are putting time 
1010 for i = 0 to 6
1020 dp(i) = 1+int(rnd(0)*6)
1030 next i
1040 return

2000 rem check if territory available
2010 te=0 : rem set territory to false
2020 for i = 0 to 13
2030 if te(i,0)=0 then te=1:rem print"territory available."
2040 next i
2050 return

45000 rem function - display scores
45010 return

50000 rem function - create players
50001 rem local variables; p= number players
50002 rem x= loop counter, s= temp string variable
50003 rem global variables; pl()
50010 print chr$(147)
50020 print "how many players (2-6)": input p
50024 if (p<2) or (p>6) then goto 50020 : rem input was not valid input
50030 rem print "now decide if players are cpu / human"
50040 for x = 1 to p
50050 print "is player ",x
50055 print "cpu or human [c/h]": input s$
50060 if (s$ = "c") or (s$ = "h") then goto 50070
50065 goto 50055 : rem input was not valid
50070 if s$ = "c" then pl$(x,1)="c" : pl$(x,2)="cpu"
50080 if s$ = "h" then pl$(x,1)="h" : gosub 51000 : rem get player name
50090 next x
50100 return

51000 rem get player name
51010 print "enter player name": input na$
51020 print "name is ",na$,"correct? y/n": input ui$
51030 if ui$ = "y" then goto 51050
51040 goto 51010 : rem player name not correct
51050 pl$(x,2)=na$
51060 return

55000 rem function - title screen
55010 print "dice of sengoku"
55020 return

59000 rem set characterset pointer to block 14 address 14336
59010 poke 53272, (peek(53272)and 240)or 14
59020 rem iterate over characters 122-127
59030 for ch=0 to 127: 
59040 for byte=0to7: rem 8 bytes per chacter
59050 rem read next byte of character data (cd)
59060 rem then save the data to the character memory
59070 read cd 
59080 poke 14336+(8*ch)+byte,cd
59090 rem iterate to next byte
59100 next byte
59110 rem do next character
59120 next ch
59130 return

60000 rem function - setup
60010 let pl=0: rem pl = current player
60020 let mp=1: rem mp = max number players
60030 dim pl$(6,2): rem array of players, max 6 players
60031 rem each having 2 elements. cpu/human, name
60040 dim te(13,11)
60041 rem array of territory, max 14 territory, each having 11 elements?.
60050 dim te$(13)
60060 rem setup territory
60070 gosub 60700
60080 rem setup characters
60090 gosub 59000
60100 return

60700 rem setup territory data
60701 rem owner (0=no one, 1-6 player), clan (0-4), score (1-3)
60702 rem defence type 1(1-4), defence num 1(1-10), defence type 2(1-4)
60703 rem defence num 2(1-10)
60704 rem defence type 3(1-4), defence num 3(1-10), defence type 4(1-4)
60705 rem defence num 4(1-10)
60706 rem 1=samurai 2=archer 3=horse 4=sword 5=archer + horse
60710 rem territory 0
60711 te$(0)="kumanoto"
60712 te(0,0)=0: te(0,1)=0: te(0,2)=3
60713 te(0,3)=1: te(0,4)=2: te(0,5)=2: te(0,6)=1
60714 te(0,7)=3: te(0,8)=1: te(0,9)=4: te(0,10)=4
60720 rem territory 1
60721 te$(1)="cassantoda"
60722 te(1,0)=0: te(1,1)=1: te(1,2)=2
60723 te(1,3)=1: te(1,4)=1: te(1,5)=4: te(1,6)=8
60724 te(1,7)=0: te(1,8)=0: te(1,9)=0: te(1,10)=0
60730 rem territory 2
60731 te$(2)="takahashi"
60732 te(2,0)=0: te(2,1)=1: te(2,2)=2
60733 te(2,3)=3: te(2,4)=2: te(2,5)=4: te(2,6)=5
60734 te(2,7)=4: te(2,8)=2: te(2,9)=0: te(2,10)=0
60740 rem territory 3
60741 te$(3)="matsuyama"
60742 te(3,0)=0: te(3,1)=2: te(3,2)=2
60743 te(3,3)=1: te(3,4)=1: te(3,5)=4: te(3,6)=4
60744 te(3,7)=4: te(3,8)=4: te(3,9)=0: te(3,10)=0
60750 rem territory 4
60751 te$(4)="marugame"
60752 te(4,0)=0: te(4,1)=2: te(4,2)=1
60753 te(4,3)=1: te(4,4)=2: te(4,5)=3: te(4,6)=1
60754 te(4,7)=0: te(4,8)=0: te(4,9)=0: te(4,10)=0
60760 rem territory 5
60761 te$(5)="odani"
60762 te(5,0)=0: te(5,1)=3: te(5,2)=1
60763 te(5,3)=4: te(5,4)=10: te(5,5)=0: te(5,6)=0
60764 te(5,7)=0: te(5,8)=0: te(5,9)=0: te(5,10)=0
60770 rem territory 6
60771 te$(6)="gifu"
60772 te(6,0)=0: te(6,1)=3: te(6,2)=1
60773 te(6,3)=1: te(6,4)=1: te(6,5)=2: te(6,6)=1
60774 te(6,7)=3: te(6,8)=1: te(6,9)=0: te(6,10)=0
60780 rem territory 7
60781 te$(7)="azuchi"
60782 te(7,0)=0: te(7,1)=3: te(7,2)=3
60783 te(7,3)=2: te(7,4)=1: te(7,5)=3: te(7,6)=2
60784 te(7,7)=4: te(7,8)=5: te(7,9)=0: te(7,10)=0
60790 rem territory 8
60791 te$(8)="matsumoto"
60792 te(8,0)=0: te(8,1)=3: te(8,2)=2
60793 te(8,3)=2: te(8,4)=1: te(8,5)=2: te(8,6)=1
60794 te(8,7)=4: te(8,8)=7: te(8,9)=0: te(8,10)=0
60800 rem territory 9
60811 te$(9)="kitanosho"
60812 te(9,0)=0: te(9,1)=4: te(9,2)=3
60813 te(9,3)=1: te(9,4)=1: te(9,5)=5: te(9,6)=1
60814 te(9,7)=4: te(9,8)=6: te(9,9)=0: te(9,10)=0
60820 rem territory 10
60821 te$(10)="kasugayma"
60822 te(10,0)=0: te(10,1)=4: te(10,2)=4
60823 te(10,3)=2: te(10,4)=2: te(10,5)=3: te(10,6)=2
60824 te(10,7)=0: te(10,8)=0: te(10,9)=0: te(10,10)=0
60830 rem territory 11
60831 te$(11)="kiyosu"
60832 te(11,0)=0: te(11,1)=5: te(11,2)=2
60833 te(11,3)=1: te(11,4)=1: te(11,5)=2: te(11,6)=1
60834 te(11,7)=3: te(11,8)=1: te(11,9)=4: te(11,10)=3
60840 rem territory 12
60841 te$(12)="inuyama"
60842 te(12,0)=0: te(12,1)=5: te(12,2)=1
60843 te(12,3)=1: te(12,4)=1: te(12,5)=2: te(12,6)=2
60844 te(12,7)=0: te(12,8)=0: te(12,9)=0: te(12,10)=0
60850 rem territory 13
60851 te$(13)="edo"
60852 te(13,0)=0: te(13,1)=5: te(13,2)=3
60853 te(13,3)=5: te(13,4)=1: te(13,5)=5: te(13,6)=1
60854 te(13,7)=4: te(13,8)=3: te(13,9)=0: te(13,10)=0
60860 return 

61000 rem function to test territory array
61010 for i = 0 to 13
61020 print te$(i)
61030 print "owner="te(i,0),"clan="te(i,1)
61040 next i
61100 return

62000 rem check roll of dice
62010 gosub 1000
62020 for i = 0 to 6
62030 if dp(i)=1 then di$=chr$(186)
62040 if dp(i)=2 then di$=chr$(187)
62050 if dp(i)=3 then di$=chr$(188)
62060 if dp(i)=4 then di$=chr$(189)
62070 if dp(i)=5 then di$=chr$(190)
62080 if dp(i)=6 then di$=chr$(191)
62090 print "dice",i,di$
62100 next i
62110 return

63000 rem custom character set
63010 DATA 60,102,110,110,96,98,60,0
63020 DATA 24,60,102,126,102,102,102,0
63030 DATA 124,102,102,124,102,102,124,0
63040 DATA 60,102,96,96,96,102,60,0
63050 DATA 120,108,102,102,102,108,120,0
63060 DATA 126,96,96,120,96,96,126,0
63070 DATA 126,96,96,120,96,96,96,0
63080 DATA 60,102,96,110,102,102,60,0
63090 DATA 102,102,102,126,102,102,102,0
63100 DATA 60,24,24,24,24,24,60,0
63110 DATA 30,12,12,12,12,108,56,0
63120 DATA 102,108,120,112,120,108,102,0
63130 DATA 96,96,96,96,96,96,126,0
63140 DATA 99,119,127,107,99,99,99,0
63150 DATA 102,118,126,126,110,102,102,0
63160 DATA 60,102,102,102,102,102,60,0
63170 DATA 124,102,102,124,96,96,96,0
63180 DATA 60,102,102,102,102,60,14,0
63190 DATA 124,102,102,124,120,108,102,0
63200 DATA 60,102,96,60,6,102,60,0
63210 DATA 126,24,24,24,24,24,24,0
63220 DATA 102,102,102,102,102,102,60,0
63230 DATA 102,102,102,102,102,60,24,0
63240 DATA 99,99,99,107,127,119,99,0
63250 DATA 102,102,60,24,60,102,102,0
63260 DATA 102,102,102,60,24,24,24,0
63270 DATA 126,6,12,24,48,96,126,0
63280 DATA 60,48,48,48,48,48,60,0
63290 DATA 12,18,48,124,48,98,252,0
63300 DATA 60,12,12,12,12,12,60,0
63310 DATA 0,24,60,126,24,24,24,24
63320 DATA 0,16,48,127,127,48,16,0
63330 DATA 0,0,0,0,0,0,0,0
63340 DATA 24,24,24,24,0,0,24,0
63350 DATA 102,102,102,0,0,0,0,0
63360 DATA 102,102,255,102,255,102,102,0
63370 DATA 24,62,96,60,6,124,24,0
63380 DATA 98,102,12,24,48,102,70,0
63390 DATA 60,102,60,56,103,102,63,0
63400 DATA 6,12,24,0,0,0,0,0
63410 DATA 12,24,48,48,48,24,12,0
63420 DATA 48,24,12,12,12,24,48,0
63430 DATA 0,102,60,255,60,102,0,0
63440 DATA 0,24,24,126,24,24,0,0
63450 DATA 0,0,0,0,0,24,24,48
63460 DATA 0,0,0,126,0,0,0,0
63470 DATA 0,0,0,0,0,24,24,0
63480 DATA 0,3,6,12,24,48,96,0
63490 DATA 60,102,110,118,102,102,60,0
63500 DATA 24,24,56,24,24,24,126,0
63510 DATA 60,102,6,12,48,96,126,0
63520 DATA 60,102,6,28,6,102,60,0
63530 DATA 6,14,30,102,127,6,6,0
63540 DATA 126,96,124,6,6,102,60,0
63550 DATA 60,102,96,124,102,102,60,0
63560 DATA 126,102,12,24,24,24,24,0
63570 DATA 60,102,102,60,102,102,60,0
63580 DATA 60,102,102,62,6,102,60,0
63590 DATA 0,0,24,0,0,24,0,0
63600 DATA 0,0,24,0,0,24,24,48
63610 DATA 14,24,48,96,48,24,14,0
63620 DATA 0,0,126,0,126,0,0,0
63630 DATA 112,24,12,6,12,24,112,0
63640 DATA 60,102,6,12,24,0,24,0
63650 DATA 0,0,0,255,255,0,0,0
63660 DATA 8,28,62,127,127,28,62,0
63670 DATA 24,24,24,24,24,24,24,24
63680 DATA 0,0,0,255,255,0,0,0
63690 DATA 0,0,255,255,0,0,0,0
63700 DATA 0,255,255,0,0,0,0,0
63710 DATA 0,0,0,0,255,255,0,0
63720 DATA 48,48,48,48,48,48,48,48
63730 DATA 12,12,12,12,12,12,12,12
63740 DATA 0,0,0,224,240,56,24,24
63750 DATA 24,24,28,15,7,0,0,0
63760 DATA 24,24,56,240,224,0,0,0
63770 DATA 192,192,192,192,192,192,255,255
63780 DATA 192,224,112,56,28,14,7,3
63790 DATA 3,7,14,28,56,112,224,192
63800 DATA 255,255,192,192,192,192,192,192
63810 DATA 255,255,3,3,3,3,3,3
63820 DATA 0,60,126,126,126,126,60,0
63830 DATA 0,0,0,0,0,255,255,0
63840 DATA 54,127,127,127,62,28,8,0
63850 DATA 96,96,96,96,96,96,96,96
63860 DATA 0,0,0,7,15,28,24,24
63870 DATA 195,231,126,60,60,126,231,195
63880 DATA 0,60,126,102,102,126,60,0
63890 DATA 24,24,102,102,24,24,60,0
63900 DATA 6,6,6,6,6,6,6,6
63910 DATA 8,28,62,127,62,28,8,0
63920 DATA 24,24,24,255,255,24,24,24
63930 DATA 192,192,48,48,192,192,48,48
63940 DATA 24,24,24,24,24,24,24,24
63950 DATA 0,0,3,62,118,54,54,0
63960 DATA 255,127,63,31,15,7,3,1
63970 DATA 0,0,0,0,0,0,0,0
63980 DATA 240,240,240,240,240,240,240,240
63990 DATA 0,0,0,0,255,255,255,255
64000 DATA 255,0,0,0,0,0,0,0
64010 DATA 0,0,0,0,0,0,0,255
64020 DATA 192,192,192,192,192,192,192,192
64030 DATA 204,204,51,51,204,204,51,51
64040 DATA 3,3,3,3,3,3,3,3
64050 DATA 0,0,0,0,204,204,51,51
64060 DATA 255,254,252,248,240,224,192,128
64070 DATA 3,3,3,3,3,3,3,3
64080 DATA 24,24,24,31,31,24,24,24
64090 DATA 0,0,0,0,15,15,15,15
64100 DATA 24,24,24,31,31,0,0,0
64110 DATA 0,0,0,248,248,24,24,24
64120 DATA 0,0,0,0,0,0,255,255
64130 DATA 0,0,0,31,31,24,24,24
64140 DATA 24,24,24,255,255,0,0,0
64150 DATA 0,0,0,255,255,24,24,24
64160 DATA 24,24,24,248,248,24,24,24
64170 DATA 192,192,192,192,192,192,192,192
64180 DATA 224,224,224,224,224,224,224,224
64190 DATA 7,7,7,7,7,7,7,7
64200 DATA 255,255,0,0,0,0,0,0
64210 DATA 255,255,255,0,0,0,0,0
64220 DATA 0,0,0,0,0,255,255,255
64230 DATA 48,120,252,254,159,31,31,28
64240 DATA 48,40,36,255,36,36,40,48
64250 DATA 161,162,164,8,80,32,80,128
64260 DATA 65,66,68,8,80,32,80,128
64270 DATA 1,2,4,8,80,32,80,128
64280 DATA 66,36,24,60,126,66,231,126

