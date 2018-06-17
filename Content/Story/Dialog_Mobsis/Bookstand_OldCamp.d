
func void bookstand_milten_03_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"PóŸno ju¿");
		Doc_PrintLines(ndocid,0,"Jak ³atwo by³o przewidzieæ, t¹pniêcie w Starej Kopalni bardzo rozsierdzi³o Magnatów.");
		Doc_PrintLines(ndocid,0,"Gomez jest teraz jak beczka prochu, gotowa eksplodowaæ w ka¿dej chwili.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Uwa¿a, ¿e winê za ostatnie wydarzenia ponosi ten nowy wiêzieñ. To rzeczywiœcie tajemniczy cz³owiek... Lepiej dla niego, ¿eby siê tu wiêcej nie pokazywa³.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Gomez jest w paskudnym humorze i chyba wiem, co planuje. Musimy uprzedziæ Magów Wody, nim bêdzie za póŸno!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Corristo");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Mo¿e uda siê nam zapobiec katastrofie. Wolê nie myœleæ, co siê stanie, jeœli Wolna Kopalnia...");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1()
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
		Doc_PrintLines(ndocid,0,"Pozwoli³em sobie trochê siê tutaj urz¹dziæ. Kto by pomyœla³, ¿e pewnego dnia bêdê jedynym magiem w obozie?");
		Doc_PrintLines(ndocid,0,"Nie powiem, ¿eby cieszy³ mnie powrót tutaj. Prawdê mówi¹c, mam ochotê jak najszybciej st¹d uciec.");
		Doc_PrintLines(ndocid,0,"Ta ca³a wyprawa skazana jest na pora¿kê.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Wczoraj wyruszyli górnicy. Zabrali ze sob¹ Diega. Nie zdziwi³bym siê, gdyby ten cwaniak przy pierwszej okazji da³ nogê.");
		Doc_PrintLines(ndocid,1,"Jakoœ nie wyobra¿am go sobie z kilofem w rêku.");
		Doc_PrintLines(ndocid,1,"Có¿, wykorzystam wolny czas na zg³êbianie tajników alchemii.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Milten");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Zapasy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"ZnaleŸliœmy trochê towaru, ale nic specjalnego. Poza tym mamy tu:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 skrzynie starych szmat");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 skrzyñ zardzewia³ego ¿elaza");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 skrzynie po³amanych pancerzy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 (potwornie œmierdz¹cych) skrzyñ skóry i futer");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 skrzynie kilofów");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 skrzynie narzêdzi");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 skrzyñ kamieni (bez rudy)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 skrzyniê zardzewia³ych ¿yletek");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 skrzynie zniszczonych naczyñ");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 beczu³ek z wod¹");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 skrzyniê czegoœ paskudnego (dawno do cna przegni³ego)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Engor");
		Doc_Show(ndocid);
	};
};

