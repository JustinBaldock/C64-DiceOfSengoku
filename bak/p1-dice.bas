1 rem 100 Programs for the Commodore 64 by John Gordon and Ian McLean
6 rem Page 6 - Page 8
10 rem dice
20 rem ****
30 rem
100 print chr$(147):rem clear screen
110 poke 53281,0:rem black screen
120 poke 53280,0:rem black border
130 print chr$(158):rem yellow ink
140 print
150 print tab(20)"dice"
160 print:print:print
170 print tab(12);"this program rolls"
180 print tab(15);"three dice"
190 for n=0 to 7
200 print
210 next n
220 rem *****
230 s$=chr$(32)
240 t$=s$:e$=s$+s$+s$+s$
250 for n=0 to 4
260 s$=s$+s$
270 next n
280 s$=s$+e$
290 rem s$ contains 36 spaces
300 up$=chr$(145)
310 for n=0 to 2
320 up$=up$+up$
330 next n
340 rem up$ contains 8 cursor up codes
350 r$=chr$(188)
360 a$=r$+t$+t$
370 b$=t$+r$+t$
380 c$=t$+t$+r$
390 d$=r$+t$+r$
400 rem dot patterns in strings
410 dim dice$(2,2)
450 rem ****
500 rem again
510 print tab(11)"press any key to roll"
520 get w$:if w$="" then 520
530 rem wait for key
540 rem no space between inverted commas
560 for n=0 to 7
570 print s$
580 next n
590 print up$
600 rem clear previous throw
610 rem ****
620 for n=0 to 2
630 vl%=1+6*rnd(1)
640 on vl% gosub 1000,2000,3000,4000,5000,6000
650 next
660 rem generate patterns
670 rem ****
680 for n=0 to 2
690 print, dice$(0,n),dice$(1,n),dice$(2,n)
700 next
710 print:print
720 rem print patterns
730 rem ****
740 for d=0 to 200:next
750 rem delay
760 goto 500: rem go to 'again'
780 rem ****
790 rem subroutines
800 rem ***
1000 rem one
1010 dice$(n,0)=e$
1020 dice$(n,1)=b$
1030 dice$(n,2)=e$
1040 return
1050 rem ***
2000 rem two
2010 dice$(n,0)=a$
2020 dice$(n,1)=e$
2030 dice$(n,2)=c$
2040 return
2050 rem ***
3000 rem three
3010 dice$(n,0)=a$
3020 dice$(n,1)=b$
3030 dice$(n,2)=c$
3040 return
3050 rem ****
4000 rem four
4010 dice$(n,0)=d$
4020 dice$(n,1)=e$
4030 dice$(n,2)=d$
4040 return
4050 rem ****
5000 rem five
5010 dice$(n,0)=d$
5020 dice$(n,1)=b$
5030 dice$(n,2)=d$
5040 return
5050 rem ****
6000 rem six
6010 dice$(n,0)=d$
6020 dice$(n,1)=d$
6030 dice$(n,2)=d$
6040 return
6050 rem ****
