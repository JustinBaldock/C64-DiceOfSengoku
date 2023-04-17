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
2030 if te(i,0)=0 then te=1: print"territory available."
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

60000 rem function - setup
60010 let pl=0: rem pl = current player
60020 let mp=1: rem mp = max number players
60030 dim pl(6,2): rem array of players, max 6 players
60031 rem each having 2 elements. cpu/human, name
60040 dim te(13,11)
60041 rem array of territory, max 14 territory, each having 11 elements?.
60050 dim te$(13)
60051 rem owner (0=no one, 1-6 player), clan (0-4), score (1-3)
60052 rem defence type 1(1-4), defence num 1(1-10), defence type 2(1-4)
60053 rem defence num 2(1-10)
60054 rem defence type 3(1-4), defence num 3(1-10), defence type 4(1-4)
60055 rem defence num 4(1-10)
60056 rem 1=samurai 2=archer 3=horse 4=sword 5=archer + horse
60060 rem territory 0
60061 te$(0)="kumanoto"
60062 te(0,0)=0: te(0,1)=0: te(0,2)=3
60063 te(0,3)=1: te(0,4)=2: te(0,5)=2: te(0,6)=1
60064 te(0,7)=3: te(0,8)=1: te(0,9)=4: te(0,10)=4
60070 rem territory 1
60071 te$(1)="cassantoda"
60072 te(1,0)=0: te(1,1)=1: te(1,2)=2
60073 te(1,3)=1: te(1,4)=1: te(1,5)=4: te(1,6)=8
60074 te(1,7)=0: te(1,8)=0: te(1,9)=0: te(1,10)=0
60080 rem territory 2
60081 te$(2)="takahashi"
60082 te(2,0)=0: te(2,1)=1: te(2,2)=2
60083 te(2,3)=3: te(2,4)=2: te(2,5)=4: te(2,6)=5
60084 te(2,7)=4: te(2,8)=2: te(2,9)=0: te(2,10)=0
60090 rem territory 3
60091 te$(3)="matsuyama"
60092 te(3,0)=0: te(3,1)=2: te(3,2)=2
60093 te(3,3)=1: te(3,4)=1: te(3,5)=4: te(3,6)=4
60094 te(3,7)=4: te(3,8)=4: te(3,9)=0: te(3,10)=0
60100 rem territory 4
60101 te$(4)="marugame"
60102 te(4,0)=0: te(4,1)=2: te(4,2)=1
60103 te(4,3)=1: te(4,4)=2: te(4,5)=3: te(4,6)=1
60104 te(4,7)=0: te(4,8)=0: te(4,9)=0: te(4,10)=0
60110 rem territory 5
60111 te$(5)="odani"
60112 te(5,0)=0: te(5,1)=3: te(5,2)=1
60113 te(5,3)=4: te(5,4)=10: te(5,5)=0: te(5,6)=0
60114 te(5,7)=0: te(5,8)=0: te(5,9)=0: te(5,10)=0
60120 rem territory 6
60121 te$(6)="gifu"
60122 te(6,0)=0: te(6,1)=3: te(6,2)=1
60123 te(6,3)=1: te(6,4)=1: te(6,5)=2: te(6,6)=1
60124 te(6,7)=3: te(6,8)=1: te(6,9)=0: te(6,10)=0
60130 rem territory 7
60131 te$(7)="azuchi"
60132 te(7,0)=0: te(7,1)=3: te(7,2)=3
60133 te(7,3)=2: te(7,4)=1: te(7,5)=3: te(7,6)=2
60134 te(7,7)=4: te(7,8)=5: te(7,9)=0: te(7,10)=0
60140 rem territory 8
60141 te$(8)="matsumoto"
60142 te(8,0)=0: te(8,1)=3: te(8,2)=2
60143 te(8,3)=2: te(8,4)=1: te(8,5)=2: te(8,6)=1
60144 te(8,7)=4: te(8,8)=7: te(8,9)=0: te(8,10)=0
60150 rem territory 9
60151 te$(9)="kitanosho"
60152 te(9,0)=0: te(9,1)=4: te(9,2)=3
60153 te(9,3)=1: te(9,4)=1: te(9,5)=5: te(9,6)=1
60154 te(9,7)=4: te(9,8)=6: te(9,9)=0: te(9,10)=0
60160 rem territory 10
60161 te$(10)="kasugayma"
60162 te(10,0)=0: te(10,1)=4: te(10,2)=4
60163 te(10,3)=2: te(10,4)=2: te(10,5)=3: te(10,6)=2
60164 te(10,7)=0: te(10,8)=0: te(10,9)=0: te(10,10)=0
60170 rem territory 11
60171 te$(11)="kiyosu"
60172 te(11,0)=0: te(11,1)=5: te(11,2)=2
60173 te(11,3)=1: te(11,4)=1: te(11,5)=2: te(11,6)=1
60174 te(11,7)=3: te(11,8)=1: te(11,9)=4: te(11,10)=3
60180 rem territory 12
60181 te$(12)="inuyama"
60182 te(12,0)=0: te(12,1)=5: te(12,2)=1
60183 te(12,3)=1: te(12,4)=1: te(12,5)=2: te(12,6)=2
60184 te(12,7)=0: te(12,8)=0: te(12,9)=0: te(12,10)=0
60190 rem territory 13
60191 te$(13)="edo"
60192 te(13,0)=0: te(13,1)=5: te(13,2)=3
60193 te(13,3)=5: te(13,4)=1: te(13,5)=5: te(13,6)=1
60194 te(13,7)=4: te(13,8)=3: te(13,9)=0: te(13,10)=0
60200 return 

61000 rem function to test territory array
61010 for i = 0 to 13
61020 print te$(i)
61030 print "owner="te(i,0),"clan="te(i,1)
61040 next i
61100 return

62000 rem check roll of dice
62010 gosub 1000
62020 for i = 0 to 6
62030 print "dice",i,dp(i)
62040 next i
62050 return

