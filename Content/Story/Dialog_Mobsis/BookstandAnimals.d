
var int animals_1_permanent;
var int animals_2_permanent;
var int animals_3_permanent;

func void use_bookstandanimals1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"My�liwy taki b�dzie te� wiedzia�, jak preparowa� swe zdobycze i pozyskiwa� trofea.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Pozyskiwanie k��w");
		Doc_PrintLines(ndocid,0,"K�y to dla wielu zwierz�t bro�, a najcenniejsze s� te, kt�re mo�na pozyska� z truche� wilk�w, z�baczy, cieniostwor�w, w�y b�otnych i trolli.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Obdzieranie ze sk�ry");
		Doc_PrintLines(ndocid,1,"Umiej�tno�� ceniona w�r�d do�wiadczonych my�liwych, gdy� pozwala na pozyskiwanie warto�ciowych sk�r owiec, wilk�w, cieniostwor�w,");
		Doc_PrintLines(ndocid,1,"w�y b�otnych i topielc�w.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Pozyskiwanie szpon�w");
		Doc_PrintLines(ndocid,1,"Mo�na je praktykowa� na jaszczurach, z�baczach, topielcach i cieniostworach.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Krwiopijcy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Wypatroszenie tych lataj�cych potwor�w nie jest proste, mo�na im jednak");
		Doc_PrintLines(ndocid,0,"usun�� skrzyd�a i wyj�� ��d�a.");
		Doc_PrintLines(ndocid,0,"I jedne, i drugie stanowi� cenne trofea my�liwskie.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Polne bestie i pe�zacze atakuj� za pomoc� �uwaczek. Szczeg�lnie cenne s� narz�dy");
		Doc_PrintLines(ndocid,1,"tych drugich, zawieraj�ce wydzielin�, kt�rej wypicie zwi�ksza moc magiczn�.");
		Doc_PrintLines(ndocid,1,"Nie nale�y nadu�ywa� tego cudownego �rodka, gdy� z czasem organizm ludzki przestaje na� reagowa�.");
		Doc_PrintLines(ndocid,1,"Podobnie popularne s� p�yty pancerza pe�zacza, z kt�rych mo�na tworzy� bardzo dobre zbroje.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"�owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka�de stworzenie mo�e pozostawi� po sobie trofeum, kt�re zwi�kszy maj�tek i s�aw� do�wiadczonego my�liwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ognisty jaszczur");
		Doc_PrintLines(ndocid,0,"Ta jaszczuropodobna, ziej�ca ogniem istota jest wyj�tkowo gro�na dla ka�dego przebywaj�cego w pobli�u.");
		Doc_PrintLines(ndocid,0,"Jej cenny j�zyk mo�e spr�bowa� zdoby� tylko kto� dysponuj�cy jak�� ochron� przed ogniem.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Cieniostw�r");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Wi�kszo�� z tych stworze� to zaszyci g��boko w lasach samotnicy.");
		Doc_PrintLines(ndocid,1,"Pozosta�o ich na �wiecie bardzo niewiele, nie stanowi� wi�c zagro�enia dla ludzi - chyba �e wkroczy si� na ich tereny �owieckie.");
		Doc_PrintLines(ndocid,1,"Dobrze wiedzie�, gdzie znajduj� si� te tereny - r�g cieniostwora to cenne trofeum my�liwskie, kt�re jednak trzeba");
		Doc_PrintLines(ndocid,1,"umie� odpowiednio preparowa�.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};

