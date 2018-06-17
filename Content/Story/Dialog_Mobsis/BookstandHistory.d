
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
		Doc_PrintLines(ndocid,0,"Najlepsz� obron� jest atak - w ka�dym razie przeciwko zwierz�tom i bestiom. W ich przypadku parowanie cios�w nie ma sensu.");
		Doc_PrintLines(ndocid,0,"Lepiej szachowa� przeciwnika celnymi ciosami i przygotowa� zaskakuj�c� kombinacj�, kt�rej nie zdo�a odeprze�.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Pami�taj jednak, �e ��czenie cios�w w p�ynne sekwencje to domena do�wiadczonych wojownik�w, a ��czenie poszczeg�lnych sekwencji jest jeszcze trudniejsze.");
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
		Doc_PrintLines(ndocid,0,"Khorinis to portowe miasto le��ce na wyspie w pobli�u wybrze�y Kr�lestwa Myrtany.");
		Doc_PrintLines(ndocid,0,"Wi�kszo�� swej w�tpliwej s�awy wyspa zawdzi�cza G�rniczej Dolinie, gdzie znajdowa�a si� kolonia karna, otoczona przez wiele lat magiczn� barier�. To tutaj wszyscy skaza�cy kraju");
		Doc_PrintLines(ndocid,0,"zajmowali si� wydobywaniem z najg��bszych pok�ad�w skorupy ziemskiej magicznej rudy.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Opr�cz miasta znajduj� si� tam liczne farmy, a na �yznych ziemiach uprawia si� pszenic�, rzep� i hoduje owce.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Od pokole� najwi�ksza z farm nale�a�a do wielmo�y, kt�ry przekazywa� swoje ziemie innym pod upraw�.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"W centrum wyspy znajduje si� pradawny Klasztor Innosa zarz�dzany przez Mag�w Ognia, kt�rzy zajmuj� si� badaniem natury magii, alchemi� i wytwarzaniem win.");
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
		Doc_PrintLines(ndocid,0,"Ka�de zebranie grupy ludzi musi si� odbywa� w absolutnym spokoju - i to niezale�nie od miejsca, w kt�rym si� odbywa.");
		Doc_PrintLines(ndocid,0,"Ka�da zbrodnia przeciwko og�owi b�dzie karana.");
		Doc_PrintLines(ndocid,0,"Og� zabrania wszczynania b�jek oraz brania w nich udzia�u.");
		Doc_PrintLines(ndocid,0,"Zbrodni� jest r�wnie� kradzie�, a prawo chroni tak�e owce.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Atak na cz�owieka lub jego zabicie oznacza dla sprawcy bezzw�oczne os�dzenie. ");
		Doc_PrintLines(ndocid,1,"W najlepszym razie winny musi zap�aci� wysok� grzywn�.");
		Doc_PrintLines(ndocid,1,"Wszystkie wi�ksze skupiska ludzkie s� chronione przez odpowiednie s�u�by. Ich funkcjonariusze karz� przest�pc�w i dbaj� o �ad i porz�dek.");
		Doc_PrintLines(ndocid,1,"Praworz�dna wi�kszo�� poinformuje w�adze o przest�pstwie, sprawcy nie s� tu mile widziani,");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"cho� zdarzaj� si� jednostki o �adne prawa nie dbaj�ce - to m.in wszelacy bandyci i najemnicy.");
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

