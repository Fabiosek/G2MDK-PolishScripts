
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
		Doc_PrintLine(ndocid,0,"£owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Myœliwy taki bêdzie te¿ wiedzia³, jak preparowaæ swe zdobycze i pozyskiwaæ trofea.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Pozyskiwanie k³ów");
		Doc_PrintLines(ndocid,0,"K³y to dla wielu zwierz¹t broñ, a najcenniejsze s¹ te, które mo¿na pozyskaæ z truche³ wilków, zêbaczy, cieniostworów, wê¿y b³otnych i trolli.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Obdzieranie ze skóry");
		Doc_PrintLines(ndocid,1,"Umiejêtnoœæ ceniona wœród doœwiadczonych myœliwych, gdy¿ pozwala na pozyskiwanie wartoœciowych skór owiec, wilków, cieniostworów,");
		Doc_PrintLines(ndocid,1,"wê¿y b³otnych i topielców.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Pozyskiwanie szponów");
		Doc_PrintLines(ndocid,1,"Mo¿na je praktykowaæ na jaszczurach, zêbaczach, topielcach i cieniostworach.");
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
		Doc_PrintLine(ndocid,0,"£owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Krwiopijcy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Wypatroszenie tych lataj¹cych potworów nie jest proste, mo¿na im jednak");
		Doc_PrintLines(ndocid,0,"usun¹æ skrzyd³a i wyj¹æ ¿¹d³a.");
		Doc_PrintLines(ndocid,0,"I jedne, i drugie stanowi¹ cenne trofea myœliwskie.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Polne bestie i pe³zacze atakuj¹ za pomoc¹ ¿uwaczek. Szczególnie cenne s¹ narz¹dy");
		Doc_PrintLines(ndocid,1,"tych drugich, zawieraj¹ce wydzielinê, której wypicie zwiêksza moc magiczn¹.");
		Doc_PrintLines(ndocid,1,"Nie nale¿y nadu¿ywaæ tego cudownego œrodka, gdy¿ z czasem organizm ludzki przestaje nañ reagowaæ.");
		Doc_PrintLines(ndocid,1,"Podobnie popularne s¹ p³yty pancerza pe³zacza, z których mo¿na tworzyæ bardzo dobre zbroje.");
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
		Doc_PrintLine(ndocid,0,"£owy i zwierzyna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Ka¿de stworzenie mo¿e pozostawiæ po sobie trofeum, które zwiêkszy maj¹tek i s³awê doœwiadczonego myœliwego.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ognisty jaszczur");
		Doc_PrintLines(ndocid,0,"Ta jaszczuropodobna, ziej¹ca ogniem istota jest wyj¹tkowo groŸna dla ka¿dego przebywaj¹cego w pobli¿u.");
		Doc_PrintLines(ndocid,0,"Jej cenny jêzyk mo¿e spróbowaæ zdobyæ tylko ktoœ dysponuj¹cy jak¹œ ochron¹ przed ogniem.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Cieniostwór");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Wiêkszoœæ z tych stworzeñ to zaszyci g³êboko w lasach samotnicy.");
		Doc_PrintLines(ndocid,1,"Pozosta³o ich na œwiecie bardzo niewiele, nie stanowi¹ wiêc zagro¿enia dla ludzi - chyba ¿e wkroczy siê na ich tereny ³owieckie.");
		Doc_PrintLines(ndocid,1,"Dobrze wiedzieæ, gdzie znajduj¹ siê te tereny - róg cieniostwora to cenne trofeum myœliwskie, które jednak trzeba");
		Doc_PrintLines(ndocid,1,"umieæ odpowiednio preparowaæ.");
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

