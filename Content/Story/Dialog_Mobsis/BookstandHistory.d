
var int history_1_permanent;
var int history_2_permanent;
var int history_3_permanent;

func void use_bookstandhistory1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Sztuka walki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Najlepsz¹ obron¹ jest atak - w ka¿dym razie przeciwko zwierzêtom i bestiom. W ich przypadku parowanie ciosów nie ma sensu.");
		Doc_PrintLines(ndocid,0,"Lepiej szachowaæ przeciwnika celnymi ciosami i przygotowaæ zaskakuj¹c¹ kombinacjê, której nie zdo³a odeprzeæ.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Pamiêtaj jednak, ¿e ³¹czenie ciosów w p³ynne sekwencje to domena doœwiadczonych wojowników, a ³¹czenie poszczególnych sekwencji jest jeszcze trudniejsze.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Wyspa");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Khorinis to portowe miasto le¿¹ce na wyspie w pobli¿u wybrze¿y Królestwa Myrtany.");
		Doc_PrintLines(ndocid,0,"Wiêkszoœæ swej w¹tpliwej s³awy wyspa zawdziêcza Górniczej Dolinie, gdzie znajdowa³a siê kolonia karna, otoczona przez wiele lat magiczn¹ barier¹. To tutaj wszyscy skazañcy kraju");
		Doc_PrintLines(ndocid,0,"zajmowali siê wydobywaniem z najg³êbszych pok³adów skorupy ziemskiej magicznej rudy.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Oprócz miasta znajduj¹ siê tam liczne farmy, a na ¿yznych ziemiach uprawia siê pszenicê, rzepê i hoduje owce.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Od pokoleñ najwiêksza z farm nale¿a³a do wielmo¿y, który przekazywa³ swoje ziemie innym pod uprawê.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"W centrum wyspy znajduje siê pradawny Klasztor Innosa zarz¹dzany przez Magów Ognia, którzy zajmuj¹ siê badaniem natury magii, alchemi¹ i wytwarzaniem win.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Prawo wyspy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka¿de zebranie grupy ludzi musi siê odbywaæ w absolutnym spokoju - i to niezale¿nie od miejsca, w którym siê odbywa.");
		Doc_PrintLines(ndocid,0,"Ka¿da zbrodnia przeciwko ogó³owi bêdzie karana.");
		Doc_PrintLines(ndocid,0,"Ogó³ zabrania wszczynania bójek oraz brania w nich udzia³u.");
		Doc_PrintLines(ndocid,0,"Zbrodni¹ jest równie¿ kradzie¿, a prawo chroni tak¿e owce.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Atak na cz³owieka lub jego zabicie oznacza dla sprawcy bezzw³oczne os¹dzenie. ");
		Doc_PrintLines(ndocid,1,"W najlepszym razie winny musi zap³aciæ wysok¹ grzywnê.");
		Doc_PrintLines(ndocid,1,"Wszystkie wiêksze skupiska ludzkie s¹ chronione przez odpowiednie s³u¿by. Ich funkcjonariusze karz¹ przestêpców i dbaj¹ o ³ad i porz¹dek.");
		Doc_PrintLines(ndocid,1,"Praworz¹dna wiêkszoœæ poinformuje w³adze o przestêpstwie, sprawcy nie s¹ tu mile widziani,");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"choæ zdarzaj¹ siê jednostki o ¿adne prawa nie dbaj¹ce - to m.in wszelacy bandyci i najemnicy.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

