FasdUAS 1.101.10   ��   ��    k             l     ��  ��    5 /Run via quicksilver trigger to tile all windows     � 	 	 ^ R u n   v i a   q u i c k s i l v e r   t r i g g e r   t o   t i l e   a l l   w i n d o w s   
  
 l     ��������  ��  ��        l     ��  ��    \ Vfound in comments here: http://www.macosxhints.com/article.php?story=20060105082728937     �   � f o u n d   i n   c o m m e n t s   h e r e :   h t t p : / / w w w . m a c o s x h i n t s . c o m / a r t i c l e . p h p ? s t o r y = 2 0 0 6 0 1 0 5 0 8 2 7 2 8 9 3 7      l     ��������  ��  ��        j     �� �� 0 numcols numCols  m     ����       j    �� �� 0 screenwidth screenWidth  m    �����      j    �� �� 0 screenheight screenHeight  m    ����8      l     ��  ��    � � If you don't want to hard-code your screen width, because eg. you use multiple screens with differing properties at different times, then uncomment the 2 lines below:     �    N   I f   y o u   d o n ' t   w a n t   t o   h a r d - c o d e   y o u r   s c r e e n   w i d t h ,   b e c a u s e   e g .   y o u   u s e   m u l t i p l e   s c r e e n s   w i t h   d i f f e r i n g   p r o p e r t i e s   a t   d i f f e r e n t   t i m e s ,   t h e n   u n c o m m e n t   t h e   2   l i n e s   b e l o w :   ! " ! l     �� # $��   # � �set screenWidth to word 3 of (do shell script "defaults read /Library/Preferences/com.apple.windowserver | grep -w Width") as number    $ � % % s e t   s c r e e n W i d t h   t o   w o r d   3   o f   ( d o   s h e l l   s c r i p t   " d e f a u l t s   r e a d   / L i b r a r y / P r e f e r e n c e s / c o m . a p p l e . w i n d o w s e r v e r   |   g r e p   - w   W i d t h " )   a s   n u m b e r "  & ' & l     �� ( )��   ( � �set screenHeight to word 3 of (do shell script "defaults read /Library/Preferences/com.apple.windowserver | grep -w Height") as number    ) � * * s e t   s c r e e n H e i g h t   t o   w o r d   3   o f   ( d o   s h e l l   s c r i p t   " d e f a u l t s   r e a d   / L i b r a r y / P r e f e r e n c e s / c o m . a p p l e . w i n d o w s e r v e r   |   g r e p   - w   H e i g h t " )   a s   n u m b e r '  + , + l     ��������  ��  ��   ,  - . - l     /���� / r      0 1 0 m     ����  1 o      ���� 0 menubarheight menubarHeight��  ��   .  2 3 2 l     ��������  ��  ��   3  4 5 4 l    6���� 6 O     7 8 7 r     9 : 9 6    ; < ; n     = > = 1    ��
�� 
pnam > 4   �� ?
�� 
pcap ? m   
 ����  < =    @ A @ 1    ��
�� 
pisf A m    ��
�� boovtrue : o      ���� 0 frontapp frontApp 8 m     B B�                                                                                  sevs  alis    �  Macintosh HD               ����H+   ���System Events.app                                               ´�� zr        ����  	                CoreServices    �٢�      � PB     ��� ��� ���  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   5  C D C l     ��������  ��  ��   D  E F E l     �� G H��   G Z Tsome apps are wacky and put the windows higher for some reason, adjust for this bug.    H � I I � s o m e   a p p s   a r e   w a c k y   a n d   p u t   t h e   w i n d o w s   h i g h e r   f o r   s o m e   r e a s o n ,   a d j u s t   f o r   t h i s   b u g . F  J K J l   0 L���� L Z    0 M N���� M l   & O���� O G    & P Q P =    R S R o    ���� 0 frontapp frontApp S m     T T � U U  F i n d e r Q =  ! $ V W V o   ! "���� 0 frontapp frontApp W m   " # X X � Y Y & M i c r o s o f t   E n t o u r a g e��  ��   N r   ) , Z [ Z m   ) *���� , [ o      ���� 0 menubarheight menubarHeight��  ��  ��  ��   K  \ ] \ l     �� ^ _��   ^ &  leave room for the Excel Toolbar    _ � ` ` @ l e a v e   r o o m   f o r   t h e   E x c e l   T o o l b a r ]  a b a l  1 > c���� c Z   1 > d e���� d l  1 4 f���� f =  1 4 g h g o   1 2���� 0 frontapp frontApp h m   2 3 i i � j j  M i c r o s o f t   E x c e l��  ��   e r   7 : k l k m   7 8���� 7 l o      ���� 0 menubarheight menubarHeight��  ��  ��  ��   b  m n m l     ��������  ��  ��   n  o p o l  ?� q���� q Q   ?� r s t r k   B� u u  v w v l  B B�� x y��   x�� For some reason Finder calls minimized windows "collapsed" while other apps call them "miniaturized", so I deal with this by duplacating lots of code and having this big if/else. It's okay though because Finder's menubarHeight of 44 bug requires some tweaking of the numbers to resize the windows right. So the duplicate code isn't a total waste, but I'm sure there's a way to do this with list repeating.    y � z z,   F o r   s o m e   r e a s o n   F i n d e r   c a l l s   m i n i m i z e d   w i n d o w s   " c o l l a p s e d "   w h i l e   o t h e r   a p p s   c a l l   t h e m   " m i n i a t u r i z e d " ,   s o   I   d e a l   w i t h   t h i s   b y   d u p l a c a t i n g   l o t s   o f   c o d e   a n d   h a v i n g   t h i s   b i g   i f / e l s e .   I t ' s   o k a y   t h o u g h   b e c a u s e   F i n d e r ' s   m e n u b a r H e i g h t   o f   4 4   b u g   r e q u i r e s   s o m e   t w e a k i n g   o f   t h e   n u m b e r s   t o   r e s i z e   t h e   w i n d o w s   r i g h t .   S o   t h e   d u p l i c a t e   c o d e   i s n ' t   a   t o t a l   w a s t e ,   b u t   I ' m   s u r e   t h e r e ' s   a   w a y   t o   d o   t h i s   w i t h   l i s t   r e p e a t i n g . w  {�� { Z   B� | }�� ~ | =  B E  �  o   B C���� 0 frontapp frontApp � m   C D � � � � �  F i n d e r } O   H� � � � k   L� � �  � � � l  L L�� � ���   � N H Ignore windows that are minimized, invisible or that don't have a title    � � � � �   I g n o r e   w i n d o w s   t h a t   a r e   m i n i m i z e d ,   i n v i s i b l e   o r   t h a t   d o n ' t   h a v e   a   t i t l e �  � � � r   L | � � � I  L x�� ���
�� .corecnte****       **** � l  L t ����� � 6  L t � � � 2  L Q��
�� 
cwin � F   R s � � � F   S h � � � =  T ] � � � 1   U Y��
�� 
pvis � m   Z \��
�� boovtrue � >  ^ g � � � 1   _ a��
�� 
pnam � m   b f � � � � �   � =  i r � � � 1   j n��
�� 
wshd � m   o q��
�� boovfals��  ��  ��   � o      ���� 0 windowcount windowCount �  � � � r   } � � � � I  } ��� ���
�� .corecnte****       **** � 2  } ���
�� 
cwin��   � o      ����  0 allwindowcount allWindowCount �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � ' ! Set number of rows appropriately    � � � � B   S e t   n u m b e r   o f   r o w s   a p p r o p r i a t e l y �  � � � r   � � � � � I  � ��� � �
�� .sysorondlong        doub � l  � � ����� � ^   � � � � � o   � ����� 0 windowcount windowCount � o   � ����� 0 numcols numCols��  ��   � �� ���
�� 
dire � m   � ���
�� olierndU��   � o      ���� 0 numrows numRows �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � Z T Special case if the number of windows is less than the number of columns preference    � � � � �   S p e c i a l   c a s e   i f   t h e   n u m b e r   o f   w i n d o w s   i s   l e s s   t h a n   t h e   n u m b e r   o f   c o l u m n s   p r e f e r e n c e �  � � � Z   � � � ����� � B  � � � � � o   � ����� 0 windowcount windowCount � o   � ����� 0 numcols numCols � k   � � � �  � � � r   � � � � � m   � �����  � o      ���� 0 numrows numRows �  ��� � r   � � � � � o   � ����� 0 windowcount windowCount � o      ���� 0 numcols numCols��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � . ( Special case is there's only one window    � � � � P   S p e c i a l   c a s e   i s   t h e r e ' s   o n l y   o n e   w i n d o w �  � � � Z   � � � ����� � =   � � � � � o   � ����� 0 windowcount windowCount � m   � �����  � k   � � � �  � � � r   � � � � � m   � �����  � o      ���� 0 numrows numRows �  ��� � r   � � � � � m   � �����  � o      ���� 0 numcols numCols��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � O I skipWindow is for skipping over windows which are invisible or titleless    � � � � �   s k i p W i n d o w   i s   f o r   s k i p p i n g   o v e r   w i n d o w s   w h i c h   a r e   i n v i s i b l e   o r   t i t l e l e s s �  � � � r   � � � � � m   � ���   � o      �~�~ 0 
skipwindow 
skipWindow �  ��} � Y   �� ��| � ��{ � Y   �� ��z � ��y � k  � � �  � � � l �x � ��x   � 7 1 If we've done all the windows, then just get out    � � � � b   I f   w e ' v e   d o n e   a l l   t h e   w i n d o w s ,   t h e n   j u s t   g e t   o u t �  � � � Z   � ��w�v � ?   � � � l  ��u�t � [   � � � [  
   ]   o  �s�s 0 j   o  �r�r 0 numcols numCols o  	�q�q 0 i   � m  
�p�p �u  �t   � o  �o�o 0 windowcount windowCount �  S  �w  �v   �  l �n�n   9 3 Get a handle to the window we might want to resize    � f   G e t   a   h a n d l e   t o   t h e   w i n d o w   w e   m i g h t   w a n t   t o   r e s i z e 	
	 r  1 4  -�m
�m 
cwin l ,�l�k [  , [  ( [  & ]  $ o  �j�j 0 j   o  #�i�i 0 numcols numCols o  $%�h�h 0 i   m  &'�g�g  o  (+�f�f 0 
skipwindow 
skipWindow�l  �k   o      �e�e 0 	thewindow 	theWindow
  l 22�d�d   O I Check that the window is visible and titled -- if it's not, then skip it    � �   C h e c k   t h a t   t h e   w i n d o w   i s   v i s i b l e   a n d   t i t l e d   - -   i f   i t ' s   n o t ,   t h e n   s k i p   i t  V  2s k  Nn   !"! r  NW#$# [  NS%&% o  NQ�c�c 0 
skipwindow 
skipWindow& m  QR�b�b $ o      �a�a 0 
skipwindow 
skipWindow" '�`' r  Xn()( 4  Xj�_*
�_ 
cwin* l \i+�^�]+ [  \i,-, [  \e./. [  \c010 ]  \a232 o  \]�\�\ 0 j  3 o  ]`�[�[ 0 numrows numRows1 o  ab�Z�Z 0 i  / m  cd�Y�Y - o  eh�X�X 0 
skipwindow 
skipWindow�^  �]  ) o      �W�W 0 	thewindow 	theWindow�`   l 6M4�V�U4 G  6M565 = 6?787 n  6=9:9 1  9=�T
�T 
pvis: o  69�S�S 0 	thewindow 	theWindow8 m  =>�R
�R boovfals6 = BK;<; n  BG=>= 1  EG�Q
�Q 
pnam> o  BE�P�P 0 	thewindow 	theWindow< m  GJ?? �@@  �V  �U   ABA l tt�O�N�M�O  �N  �M  B CDC l tt�LEF�L  E   resize the window   F �GG $   r e s i z e   t h e   w i n d o wD H�KH r  t�IJI J  t�KK LML l 	t�N�J�IN I t��HO�G
�H .sysorondlong        doubO l t�P�F�EP ^  t�QRQ ]  t{STS o  tu�D�D 0 i  T o  uz�C�C 0 screenwidth screenWidthR o  {��B�B 0 numcols numCols�F  �E  �G  �J  �I  M UVU [  ��WXW l 	��Y�A�@Y o  ���?�? 0 menubarheight menubarHeight�A  �@  X l ��Z�>�=Z I ���<[�;
�< .sysorondlong        doub[ l ��\�:�9\ ^  ��]^] ]  ��_`_ o  ���8�8 0 j  ` l ��a�7�6a \  ��bcb o  ���5�5 0 screenheight screenHeightc m  ���4�4 �7  �6  ^ o  ���3�3 0 numrows numRows�:  �9  �;  �>  �=  V ded l 	��f�2�1f I ���0g�/
�0 .sysorondlong        doubg l ��h�.�-h [  ��iji l ��k�,�+k ^  ��lml ]  ��non o  ���*�* 0 i  o o  ���)�) 0 screenwidth screenWidthm o  ���(�( 0 numcols numCols�,  �+  j l ��p�'�&p ^  ��qrq o  ���%�% 0 screenwidth screenWidthr o  ���$�$ 0 numcols numCols�'  �&  �.  �-  �/  �2  �1  e s�#s l 	��t�"�!t I ��� u�
�  .sysorondlong        doubu l 
��v��v l ��w��w [  ��xyx l ��z��z [  ��{|{ m  ���� | l ��}��} I ���~�
� .sysorondlong        doub~ l ���� ^  ����� ]  ����� o  ���� 0 j  � l ������ \  ����� o  ���� 0 screenheight screenHeight� m  ���� �  �  � o  ���� 0 numrows numRows�  �  �  �  �  �  �  y ^  ����� l �����
� \  ����� o  ���	�	 0 screenheight screenHeight� m  ���� �  �
  � o  ���� 0 numrows numRows�  �  �  �  �  �"  �!  �#  J n      ��� 1  ���
� 
pbnd� o  ���� 0 	thewindow 	theWindow�K  �z 0 i   � m   � ���   � \   � ���� o   � ��� 0 numcols numCols� m   � ��� �y  �| 0 j   � m   � ���   � \   � ���� o   � �� �  0 numrows numRows� m   � ����� �{  �}   � m   H I���                                                                                  MACS  alis    t  Macintosh HD               ����H+   ���
Finder.app                                                      �w��(��        ����  	                CoreServices    �٢�      �(��     ��� ��� ���  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��   ~ O  ����� k  ���� ��� l ��������  � N H Ignore windows that are minimized, invisible or that don't have a title   � ��� �   I g n o r e   w i n d o w s   t h a t   a r e   m i n i m i z e d ,   i n v i s i b l e   o r   t h a t   d o n ' t   h a v e   a   t i t l e� ��� r  �+��� I �'�����
�� .corecnte****       ****� l �#������ 6 �#��� 2 � ��
�� 
cwin� F  "��� F  ��� = ��� 1  ��
�� 
pvis� m  	��
�� boovtrue� > ��� 1  ��
�� 
pnam� m  �� ���  � = !��� 1  ��
�� 
pmnd� m   ��
�� boovfals��  ��  ��  � o      ���� 0 windowcount windowCount� ��� r  ,9��� I ,5�����
�� .corecnte****       ****� 2 ,1��
�� 
cwin��  � o      ����  0 allwindowcount allWindowCount� ��� l ::��������  ��  ��  � ��� l ::������  � ' ! Set number of rows appropriately   � ��� B   S e t   n u m b e r   o f   r o w s   a p p r o p r i a t e l y� ��� r  :Q��� I :M����
�� .sysorondlong        doub� l :C������ ^  :C��� o  :=���� 0 windowcount windowCount� o  =B���� 0 numcols numCols��  ��  � �����
�� 
dire� m  FI��
�� olierndU��  � o      ���� 0 numrows numRows� ��� l RR��������  ��  ��  � ��� l RR������  � Z T Special case if the number of windows is less than the number of columns preference   � ��� �   S p e c i a l   c a s e   i f   t h e   n u m b e r   o f   w i n d o w s   i s   l e s s   t h a n   t h e   n u m b e r   o f   c o l u m n s   p r e f e r e n c e� ��� Z  Rq������� B R[��� o  RU���� 0 windowcount windowCount� o  UZ���� 0 numcols numCols� k  ^m�� ��� r  ^c��� m  ^_���� � o      ���� 0 numrows numRows� ���� r  dm��� o  dg���� 0 windowcount windowCount� o      ���� 0 numcols numCols��  ��  ��  � ��� l rr��������  ��  ��  � ��� l rr������  � . ( Special case is there's only one window   � ��� P   S p e c i a l   c a s e   i s   t h e r e ' s   o n l y   o n e   w i n d o w� ��� Z  r�������� =  rw��� o  ru���� 0 windowcount windowCount� m  uv���� � k  z��� ��� r  z��� m  z{���� � o      ���� 0 numrows numRows� ���� r  ����� m  ������ � o      ���� 0 numcols numCols��  ��  ��  � ��� l ����������  ��  ��  � ��� l ��������  � O I skipWindow is for skipping over windows which are invisible or titleless   � ��� �   s k i p W i n d o w   i s   f o r   s k i p p i n g   o v e r   w i n d o w s   w h i c h   a r e   i n v i s i b l e   o r   t i t l e l e s s� ��� r  ����� m  ������  � o      ���� 0 
skipwindow 
skipWindow� ���� Y  ���������� Y  ������ ��� k  ��  l ������   7 1 If we've done all the windows, then just get out    � b   I f   w e ' v e   d o n e   a l l   t h e   w i n d o w s ,   t h e n   j u s t   g e t   o u t  Z  ��	
����	 ?  �� l ������ [  �� [  �� ]  �� o  ������ 0 j   o  ������ 0 numcols numCols o  ������ 0 i   m  ������ ��  ��   o  ������ 0 windowcount windowCount
  S  ����  ��    l ������   9 3 Get a handle to the window we might want to resize    � f   G e t   a   h a n d l e   t o   t h e   w i n d o w   w e   m i g h t   w a n t   t o   r e s i z e  r  �� 4  ����
�� 
cwin l ������ [  ��  [  ��!"! [  ��#$# ]  ��%&% o  ������ 0 j  & o  ������ 0 numcols numCols$ o  ������ 0 i  " m  ������   o  ������ 0 
skipwindow 
skipWindow��  ��   o      ���� 0 	thewindow 	theWindow '(' l ����)*��  ) O I Check that the window is visible and titled -- if it's not, then skip it   * �++ �   C h e c k   t h a t   t h e   w i n d o w   i s   v i s i b l e   a n d   t i t l e d   - -   i f   i t ' s   n o t ,   t h e n   s k i p   i t( ,-, V  �"./. k  �00 121 r  �343 [  �565 o  � ���� 0 
skipwindow 
skipWindow6 m   ���� 4 o      ���� 0 
skipwindow 
skipWindow2 7��7 r  898 4  ��:
�� 
cwin: l ;����; [  <=< [  >?> [  @A@ ]  BCB o  ���� 0 j  C o  ���� 0 numrows numRowsA o  ���� 0 i  ? m  ���� = o  ���� 0 
skipwindow 
skipWindow��  ��  9 o      ���� 0 	thewindow 	theWindow��  / l ��D����D G  ��EFE = ��GHG n  ��IJI 1  ����
�� 
pvisJ o  ������ 0 	thewindow 	theWindowH m  ����
�� boovfalsF = ��KLK n  ��MNM 1  ����
�� 
pnamN o  ������ 0 	thewindow 	theWindowL m  ��OO �PP  ��  ��  - QRQ l ##��������  ��  ��  R STS l ##��UV��  U   resize the window   V �WW $   r e s i z e   t h e   w i n d o wT X��X r  #�YZY J  #�[[ \]\ l 	#4^����^ I #4��_��
�� .sysorondlong        doub_ l #0`����` ^  #0aba ]  #*cdc o  #$���� 0 i  d o  $)���� 0 screenwidth screenWidthb o  */���� 0 numcols numCols��  ��  ��  ��  ��  ] efe [  4Gghg l 	45i����i o  45���� 0 menubarheight menubarHeight��  ��  h l 5Fj����j I 5F��k�
�� .sysorondlong        doubk l 5Bl�~�}l ^  5Bmnm ]  5>opo o  56�|�| 0 j  p l 6=q�{�zq \  6=rsr o  6;�y�y 0 screenheight screenHeights o  ;<�x�x 0 menubarheight menubarHeight�{  �z  n o  >A�w�w 0 numrows numRows�~  �}  �  ��  ��  f tut l 	Gdv�v�uv I Gd�tw�s
�t .sysorondlong        doubw l G`x�r�qx [  G`yzy l GT{�p�o{ ^  GT|}| ]  GN~~ o  GH�n�n 0 i   o  HM�m�m 0 screenwidth screenWidth} o  NS�l�l 0 numcols numCols�p  �o  z l T_��k�j� ^  T_��� o  TY�i�i 0 screenwidth screenWidth� o  Y^�h�h 0 numcols numCols�k  �j  �r  �q  �s  �v  �u  u ��g� l 	d���f�e� I d��d��c
�d .sysorondlong        doub� l 
d���b�a� l d���`�_� [  d���� l dw��^�]� [  dw��� o  de�\�\ 0 menubarheight menubarHeight� l ev��[�Z� I ev�Y��X
�Y .sysorondlong        doub� l er��W�V� ^  er��� ]  en��� o  ef�U�U 0 j  � l fm��T�S� \  fm��� o  fk�R�R 0 screenheight screenHeight� o  kl�Q�Q 0 menubarheight menubarHeight�T  �S  � o  nq�P�P 0 numrows numRows�W  �V  �X  �[  �Z  �^  �]  � ^  w���� l w~��O�N� \  w~��� o  w|�M�M 0 screenheight screenHeight� o  |}�L�L 0 menubarheight menubarHeight�O  �N  � o  ~��K�K 0 numrows numRows�`  �_  �b  �a  �c  �f  �e  �g  Z n      ��� 1  ���J
�J 
pbnd� o  ���I�I 0 	thewindow 	theWindow��  �� 0 i  � m  ���H�H    \  ����� o  ���G�G 0 numcols numCols� m  ���F�F ��  �� 0 j  � m  ���E�E  � \  ����� o  ���D�D 0 numrows numRows� m  ���C�C ��  ��  � 4  ���B�
�B 
capp� o  ���A�A 0 frontapp frontApp��   s R      �@��
�@ .ascrerr ****      � ****� l     ��?�>� o      �=�= 0 error_message  �?  �>  � �<��;
�< 
errn� l     ��:�9� o      �8�8 0 error_number  �:  �9  �;   t I ���7��
�7 .sysodlogaskr        TEXT� b  ����� b  ����� b  ����� m  ���� ���  E r r o r :  � l ����6�5� o  ���4�4 0 error_number  �6  �5  � m  ���� ���  .  � l ����3�2� o  ���1�1 0 error_message  �3  �2  � �0��
�0 
btns� J  ���� ��/� m  ���� ���  O K�/  � �.��-
�. 
dflt� m  ���,�, �-  ��  ��   p ��+� l     �*�)�(�*  �)  �(  �+       �'��&�%�$��'  � �#�"�!� �# 0 numcols numCols�" 0 screenwidth screenWidth�! 0 screenheight screenHeight
�  .aevtoappnull  �   � ****�& �%��$8� �������
� .aevtoappnull  �   � ****� k    ���  -��  4��  J��  a��  o��  �  �  � ����� 0 j  � 0 i  � 0 error_message  � 0 error_number  � ,�� B����� T X�� i� ���� ���
�	�������?�� �����O������������� � 0 menubarheight menubarHeight
� 
pcap
� 
pnam�  
� 
pisf� 0 frontapp frontApp
� 
bool� ,� 7
� 
cwin
� 
pvis
� 
wshd
�
 .corecnte****       ****�	 0 windowcount windowCount�  0 allwindowcount allWindowCount
� 
dire
� olierndU
� .sysorondlong        doub� 0 numrows numRows� 0 
skipwindow 
skipWindow� 0 	thewindow 	theWindow� 
�  
pbnd
�� 
capp
�� 
pmnd�� 0 error_message  � ������
�� 
errn�� 0 error_number  ��  
�� 
btns
�� 
dflt
�� .sysodlogaskr        TEXT���E�O� *�k/�,�[�,\Ze81E�UO�� 
 �� �& �E�Y hO��  �E�Y hOa�� ���*a -�[[[a ,\Ze8\[�,\Za 9A\[a ,\Zf8A1j E` O*a -j E` O_ b   !a a l E` O_ b    kE` O_ Ec   Y hO_ k  kE` OkEc   Y hOjE` O
j_ kkh   �jb   kkh �b    �k_  Y hO*a �b    �k_ /E` O @h_ a ,f 
 _ �,a  �&_ kE` O*a �_  �k_ /E` [OY��O�b   b   !j ��b  � _ !j �b   b   !b  b   !j �b  � _ !j b  �_ !j a v_ a ,F[OY�[OY�UY�*a  �/�*a -�[[[a ,\Ze8\[�,\Za !9A\[a ",\Zf8A1j E` O*a -j E` O_ b   !a a l E` O_ b    mE` O_ Ec   Y hO_ k  kE` OkEc   Y hOjE` O
j_ kkh   �jb   kkh �b    �k_  Y hO*a �b    �k_ /E` O @h_ a ,f 
 _ �,a # �&_ kE` O*a �_  �k_ /E` [OY��O�b   b   !j ��b  � _ !j �b   b   !b  b   !j ��b  � _ !j b  �_ !j a v_ a ,F[OY�[OY�UW $X $ %a &�%a '%�%a (a )kva *ka  +ascr  ��ޭ