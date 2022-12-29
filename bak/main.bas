10 rem setup
20 gosub 60000

30 rem display title screen
40 gosub 55000

50 rem create players
60 gosub 50000

70 rem process player turn
71 rem check for available territory before each turn
80 for pl = 1 to mp
90 rem gosub territory check function
100 if territory = true then gosub player-turn
110 next pl
120 if territory = true then goto 70
130 rem game has ended
140 rem display scores
150 gosub 45000

100 dim dp(7) :rem dicepool
110 gosub 1000
120 for i = 1 to 7
130 print dp(i)
140 next i
150 end

1000 rem roll dice
1001 rem rnd(x) takes a seed x, we are putting time 
1010 for i = 1 to 7
1020 dp(i) = 1+ int(rnd(0)*6)
1030 next i
1040 return
1050 

45000 rem function - display scores
45010 return

50000 rem function - create players
50001 rem local variables; p= number players, x= loop counter, s= temp string variable
50002 rem global variables; pl()
50010 cls
50020 print "how many players (2-6)"; input p; rem check for valid input
50030 print "now decide if players are cpu / human"
50040 for x = 1 to p
50050 print "Is player "x" cpu/human"; input s
50060 if s not c or h then goto 50050
50070 if s = c then pl(x,1)=c ; pl(x,2)=cpu
50080 if s = h then pl(x,1)=h ; gosub get name
50090 next p
50100 return

55000 rem function - display title screen 
55010 return

60000 rem function - setup
60010 let pl = 0 ; rem pl = current player
60020 let mp = 0 ; rem mp = max number players
60030 dim pl(6,2) ; rem array of players, max 6 players, each having 2 elements. cpu/human, name
60040 dim te(14,4 ; rem array of territory, max 14 territory, each having 3 elements?. owner (0=no one, 1-6 player), clan (0-4), score, defense
60050 dim de(
60030 return 
