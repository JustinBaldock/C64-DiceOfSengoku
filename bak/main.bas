10 rem setup
20 gosub 60000
30 rem display title screen
40 gosub 55000
50 rem create players
60 rem gosub 50000

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
50020 print "how many players (2-6)"; input p: rem check for valid input
50030 print "now decide if players are cpu / human"
50040 for x = 1 to p
50050 print "Is player "x" cpu/human"; input s
50060 if s not c or h then goto 50050
50070 if s = c then pl(x,1)=c : pl(x,2)=cpu
50080 if s = h then pl(x,1)=h : gosub get name
50090 next p
50100 return

55000 rem function - display title screen 
55010 print "dice of sengoku"
55020 return

59000 rem set characterset pointer to address 12288
59010 rem poke 53272,(peek(53272)and240)+12
59020 rem iterate over characters 122-127
59030 for ch=122 to 127: 
59040 for byte=0to7: rem 8 bytes per chacter
59050 rem read next byte of character data (cd)
59060 rem then save the data to the character memory
59070 read cd 
59080 poke 12288+(8*ch)+byte,cd
59090 rem iterate to next byte
59100 next byte
59110 rem do next character
59120 next ch
59130 return

60000 rem function - setup
60010 let pl=0: rem pl = current player
60020 let mp=1: rem mp = max number players
60030 dim pl(6,2): rem array of players, max 6 players
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
62030 if dp(i)=1 then di$=chr$(127)
62040 if dp(i)=2 then di$=chr$(123)
62050 if dp(i)=3 then di$=chr$(122)
62060 if dp(i)=4 then di$=chr$(126)
62070 if dp(i)=5 then di$=chr$(125)
62080 if dp(i)=6 then di$=chr$(124)
62090 print "dice",i,di$
62100 next i
62110 return

63000 rem custom character set
63010 DATA 048,120,252,254,159,031,031,028 : REM CHARACTER 122
63020 DATA 048,040,036,255,036,036,040,048 : REM CHARACTER 123
63030 DATA 161,162,164,008,080,032,080,128 : REM CHARACTER 124
63040 DATA 065,066,068,008,080,032,080,128 : REM CHARACTER 125
63050 DATA 001,002,004,008,080,032,080,128 : REM CHARACTER 126
63060 DATA 066,036,024,060,126,066,231,126 : REM CHARACTER 127
