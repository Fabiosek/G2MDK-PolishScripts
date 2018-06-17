
var int alchemy_1_permanent;
var int alchemy_2_permanent;
var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mikstury o mocy magicznej");
		Doc_PrintLine(ndocid,0,"i ich sk�adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esencja many");
		Doc_PrintLine(ndocid,0,"2 ogniste pokrzywy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ekstrakt many");
		Doc_PrintLine(ndocid,0,"2 ogniste ziela");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir many");
		Doc_PrintLine(ndocid,0,"2 ogniste korzenie");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ka�da praca wykonywana przy stole alchemicznym wymaga zu�ycia menzurki.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka�dej mikstury leczniczej czy przywracaj�cej moc magiczn� wymaga u�ycia specjalnego sk�adnika oraz ro�liny, jak� jest w tym wypadku:");
		Doc_PrintLine(ndocid,1,"Rdest polny");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka�dej mikstury maj�cej sta�y i okre�lony wp�yw na cia�o lub umys� wymaga u�ycia ro�liny, jak� jest w tym wypadku:");
		Doc_PrintLines(ndocid,1,"Szczaw kr�lewski");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mikstury lecznicze");
		Doc_PrintLine(ndocid,0,"i ich sk�adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esencja lecznicza");
		Doc_PrintLine(ndocid,0,"2 ro�liny lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ekstrakt leczniczy");
		Doc_PrintLine(ndocid,0,"2 zio�a lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir leczniczy");
		Doc_PrintLine(ndocid,0,"2 korzenie lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ka�da praca wykonywana przy stole alchemicznym wymaga zu�ycia menzurki.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka�dej mikstury leczniczej czy przywracaj�cej moc magiczn� wymaga u�ycia specjalnego sk�adnika oraz ro�liny, jak� jest w tym wypadku:");
		Doc_PrintLine(ndocid,1,"Rdest polny");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka�dej mikstury maj�cej sta�y i okre�lony wp�yw na cia�o lub umys� wymaga u�ycia ro�liny, jak� jest w tym wypadku:");
		Doc_PrintLines(ndocid,1,"Szczaw kr�lewski");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Mikstury powoduj�ce sta�e zmiany");
		Doc_PrintLine(ndocid,0,"i ich sk�adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir zr�czno�ci");
		Doc_PrintLine(ndocid,0,"1 goblinie jagody");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mikstura szybko�ci");
		Doc_PrintLines(ndocid,0,"1 z�bate ziele - ta mikstura zamiast szczawiu kr�lewskiego wymaga rdestu polnego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir si�y");
		Doc_PrintLine(ndocid,0,"1 smoczy korze�");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Eliksir �ycia");
		Doc_PrintLine(ndocid,0,"1 korze� leczniczy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Eliksir ducha");
		Doc_PrintLine(ndocid,0,"1 ognisty korze�");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uwarzenie tych mikstur to najwy�szy stopie� alchemicznego wtajemniczenia. Ka�da z tych mikstur wymaga u�ycia szczawiu kr�lewskiego.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Mikstura szybko�ci ma mniej skomplikowan� receptur� (nie wymaga u�ycia szczawiu kr�lewskiego).");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

