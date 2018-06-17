
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
		Doc_PrintLine(ndocid,0,"i ich sk³adniki");
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
		Doc_PrintLines(ndocid,1,"Ka¿da praca wykonywana przy stole alchemicznym wymaga zu¿ycia menzurki.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka¿dej mikstury leczniczej czy przywracaj¹cej moc magiczn¹ wymaga u¿ycia specjalnego sk³adnika oraz roœliny, jak¹ jest w tym wypadku:");
		Doc_PrintLine(ndocid,1,"Rdest polny");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka¿dej mikstury maj¹cej sta³y i okreœlony wp³yw na cia³o lub umys³ wymaga u¿ycia roœliny, jak¹ jest w tym wypadku:");
		Doc_PrintLines(ndocid,1,"Szczaw królewski");
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
		Doc_PrintLine(ndocid,0,"i ich sk³adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Esencja lecznicza");
		Doc_PrintLine(ndocid,0,"2 roœliny lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ekstrakt leczniczy");
		Doc_PrintLine(ndocid,0,"2 zio³a lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir leczniczy");
		Doc_PrintLine(ndocid,0,"2 korzenie lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Ka¿da praca wykonywana przy stole alchemicznym wymaga zu¿ycia menzurki.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka¿dej mikstury leczniczej czy przywracaj¹cej moc magiczn¹ wymaga u¿ycia specjalnego sk³adnika oraz roœliny, jak¹ jest w tym wypadku:");
		Doc_PrintLine(ndocid,1,"Rdest polny");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Warzenie ka¿dej mikstury maj¹cej sta³y i okreœlony wp³yw na cia³o lub umys³ wymaga u¿ycia roœliny, jak¹ jest w tym wypadku:");
		Doc_PrintLines(ndocid,1,"Szczaw królewski");
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
		Doc_PrintLines(ndocid,0,"Mikstury powoduj¹ce sta³e zmiany");
		Doc_PrintLine(ndocid,0,"i ich sk³adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir zrêcznoœci");
		Doc_PrintLine(ndocid,0,"1 goblinie jagody");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mikstura szybkoœci");
		Doc_PrintLines(ndocid,0,"1 zêbate ziele - ta mikstura zamiast szczawiu królewskiego wymaga rdestu polnego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Eliksir si³y");
		Doc_PrintLine(ndocid,0,"1 smoczy korzeñ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Eliksir ¿ycia");
		Doc_PrintLine(ndocid,0,"1 korzeñ leczniczy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Eliksir ducha");
		Doc_PrintLine(ndocid,0,"1 ognisty korzeñ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Uwarzenie tych mikstur to najwy¿szy stopieñ alchemicznego wtajemniczenia. Ka¿da z tych mikstur wymaga u¿ycia szczawiu królewskiego.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Mikstura szybkoœci ma mniej skomplikowan¹ recepturê (nie wymaga u¿ycia szczawiu królewskiego).");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

