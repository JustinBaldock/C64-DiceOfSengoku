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

60000 rem setup
 