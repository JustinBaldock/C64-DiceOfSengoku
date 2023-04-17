
 � SETUP  � 60000 4 � DISPLAY TITLE SCREEN @( � 55000 U2 � CREATE PLAYERS g< � GOSUB 50000 �F � PROCESS PLAYER TURN �G � CHECK FOR AVAILABLE TERRITORY BEFORE EACH TURN �P � PL � 0 � MP �Z � GOSUB PROCESS PLAYER TURN. �d � 2000 &	n � IF TERRITORY IS TRUE THEN GOSUB PLAYER-TURN S	x � TE � 1 � � PL : � IF TERRITORY IS TRUE h	� � GAME HAS ENDED }	� � DISPLAY SCORES �	� � 45000 �	� � �	� � DP(6) :� DICEPOOL �	� � 1000 �	� � �	�� ROLL DICE �	�� DICE = 1 = SAMURAI �	�� DICE = 2 = ARCHER 
�� DICE = 3 = HORSE .
�� DICE = 4 = 3 X SWORDMAN L
�� DICE = 5 = 2 X SWORDMAN j
�� DICE = 6 = 1 X SWORDMAN �
�� RND(X) TAKES A SEED X, WE ARE PUTTING TIME �
�� I � 0 � 6 �
�DP(I) � 1��(�(0)�6) �
� I �
� �
�� CHECK IF TERRITORY AVAILABLE �TE�0 : � SET TERRITORY TO FALSE )�� I � 0 � 13 Y�� TE(I,0)�0 � TE�1: �"TERRITORY AVAILABLE." a�� I g� �ȯ� FUNCTION - DISPLAY SCORES �ү� �PÏ FUNCTION - CREATE PLAYERS �QÏ LOCAL VARIABLES; P= NUMBER PLAYERS RÏ X= LOOP COUNTER, S= TEMP STRING VARIABLE "SÏ GLOBAL VARIABLES; PL() /ZÙ �(147) ldÙ "HOW MANY PLAYERS (2-6)"; � P: � CHECK FOR VALID INPUT �nÙ "NOW DECIDE IF PLAYERS ARE CPU / HUMAN" �xÁ X � 1 � P ��Ù "IS PLAYER "X" CPU/HUMAN"; � S ��Ë S � C � H � � 50050 �Ë S � C � PL(X,1)�C : PL(X,2)�CPU 2�Ë S � H � PL(X,1)�H : � � NAME :�Â P @�Î f�֏ FUNCTION - DISPLAY TITLE SCREEN ~�֙ "DICE OF SENGOKU" ��֎ �`� FUNCTION - SETUP �j� PL�0: � PL = CURRENT PLAYER �t� MP�1: � MP = MAX NUMBER PLAYERS ~� PL(6,2): � ARRAY OF PLAYERS, MAX 6 PLAYERS B� EACH HAVING 2 ELEMENTS. CPU/HUMAN, NAME ��� TE(13,11): � ARRAY OF TERRITORY, MAX 14 TERRITORY, EACH HAVING 11 ELEMENTS?. ��� TE$(13) ��� OWNER (0=NO ONE, 1-6 PLAYER), CLAN (0-4), SCORE (1-3) 8�� DEFENCE TYPE 1(1-4), DEFENCE NUM 1(1-10), DEFENCE TYPE 2(1-4), DEFENCE NUM 2(1-10) ��� DEFENCE TYPE 3(1-4), DEFENCE NUM 3(1-10), DEFENCE TYPE 4(1-4), DEFENCE NUM 4(1-10) ��� 1=SAMURAI 2=ARCHER 3=HORSE 4=SWORD 5=ARCHER + HORSE ��� TERRITORY 0 ���TE$(0)�"KUMANOTO" ��TE(0,0)�0: TE(0,1)�0: TE(0,2)�3 F��TE(0,3)�1: TE(0,4)�2: TE(0,5)�2: TE(0,6)�1 v��TE(0,7)�3: TE(0,8)�1: TE(0,9)�4: TE(0,10)�4 ��� TERRITORY 1 ���TE$(1)�"CASSANTODA" ���TE(1,0)�0: TE(1,1)�1: TE(1,2)�2 ���TE(1,3)�1: TE(1,4)�1: TE(1,5)�4: TE(1,6)�8 #��TE(1,7)�0: TE(1,8)�0: TE(1,9)�0: TE(1,10)�0 5�� TERRITORY 2 L��TE$(2)�"TAKAHASHI" p��TE(2,0)�0: TE(2,1)�1: TE(2,2)�2 ���TE(2,3)�3: TE(2,4)�2: TE(2,5)�4: TE(2,6)�5 ���TE(2,7)�4: TE(2,8)�2: TE(2,9)�0: TE(2,10)�0 ��� TERRITORY 3 ���TE$(3)�"MATSUYAMA" ��TE(3,0)�0: TE(3,1)�2: TE(3,2)�2 K��TE(3,3)�1: TE(3,4)�1: TE(3,5)�4: TE(3,6)�4 {��TE(3,7)�4: TE(3,8)�4: TE(3,9)�0: TE(3,10)�0 ��� TERRITORY 4 ���TE$(4)�"MARUGAME" ���TE(4,0)�0: TE(4,1)�2: TE(4,2)�1 ���TE(4,3)�1: TE(4,4)�2: TE(4,5)�3: TE(4,6)�1 &��TE(4,7)�0: TE(4,8)�0: TE(4,9)�0: TE(4,10)�0 8�� TERRITORY 5 K��TE$(5)�"ODANI" o��TE(5,0)�0: TE(5,1)�3: TE(5,2)�1 ���TE(5,3)�4: TE(5,4)�10: TE(5,5)�0: TE(5,6)�0 ���TE(5,7)�0: TE(5,8)�0: TE(5,9)�0: TE(5,10)�0 ��� TERRITORY 6 ���TE$(6)�"GIFU" ��TE(6,0)�0: TE(6,1)�3: TE(6,2)�1 F��TE(6,3)�1: TE(6,4)�1: TE(6,5)�2: TE(6,6)�1 v��TE(6,7)�3: TE(6,8)�1: TE(6,9)�0: TE(6,10)�0 ��� TERRITORY 7 ���TE$(7)�"AZUCHI" ���TE(7,0)�0: TE(7,1)�3: TE(7,2)�3 ���TE(7,3)�2: TE(7,4)�1: TE(7,5)�3: TE(7,6)�2 ��TE(7,7)�4: TE(7,8)�5: TE(7,9)�0: TE(7,10)�0 1�� TERRITORY 8 H��TE$(8)�"MATSUMOTO" l��TE(8,0)�0: TE(8,1)�3: TE(8,2)�2 ���TE(8,3)�2: TE(8,4)�1: TE(8,5)�2: TE(8,6)�1 ���TE(8,7)�4: TE(8,8)�7: TE(8,9)�0: TE(8,10)�0 ��� TERRITORY 9 ���TE$(9)�"KITANOSHO" ��TE(9,0)�0: TE(9,1)�4: TE(9,2)�3 G��TE(9,3)�1: TE(9,4)�1: TE(9,5)�5: TE(9,6)�1 w��TE(9,7)�4: TE(9,8)�6: TE(9,9)�0: TE(9,10)�0 � � TERRITORY 10 ��TE$(10)�"KASUGAYMA" ��TE(10,0)�0: TE(10,1)�4: TE(10,2)�4 ��TE(10,3)�2: TE(10,4)�2: TE(10,5)�3: TE(10,6)�2 0�TE(10,7)�0: TE(10,8)�0: TE(10,9)�0: TE(10,10)�0 C
� TERRITORY 11 X�TE$(11)�"KIYOSU" �TE(11,0)�0: TE(11,1)�5: TE(11,2)�2 ��TE(11,3)�1: TE(11,4)�1: TE(11,5)�2: TE(11,6)�1 ��TE(11,7)�3: TE(11,8)�1: TE(11,9)�4: TE(11,10)�3 �� TERRITORY 12 �TE$(12)�"INUYAMA" 6�TE(12,0)�0: TE(12,1)�5: TE(12,2)�1 i�TE(12,3)�1: TE(12,4)�1: TE(12,5)�2: TE(12,6)�2 ��TE(12,7)�0: TE(12,8)�0: TE(12,9)�0: TE(12,10)�0 �� TERRITORY 13 ��TE$(13)�"EDO" � �TE(13,0)�0: TE(13,1)�5: TE(13,2)�3 !�TE(13,3)�5: TE(13,4)�1: TE(13,5)�5: TE(13,6)�1 P"�TE(13,7)�4: TE(13,8)�3: TE(13,9)�0: TE(13,10)�0 V(� }H� FUNCTION TO TEST TERRITORY ARRAY �R� I � 0 � 13 �\� TE$(I) �f� "OWNER="TE(I,0),"CLAN="TE(I,1) �p� I ��� �0� CHECK ROLL OF DICE �:� 1000 D� I � 0 � 6 N� "DICE",I,DP(I) X� I %b�   