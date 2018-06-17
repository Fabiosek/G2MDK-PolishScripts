
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
		Doc_PrintLines(ndocid,0,"P�no ju�");
		Doc_PrintLines(ndocid,0,"Jak �atwo by�o przewidzie�, t�pni�cie w Starej Kopalni bardzo rozsierdzi�o Magnat�w.");
		Doc_PrintLines(ndocid,0,"Gomez jest teraz jak beczka prochu, gotowa eksplodowa� w ka�dej chwili.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Uwa�a, �e win� za ostatnie wydarzenia ponosi ten nowy wi�zie�. To rzeczywi�cie tajemniczy cz�owiek... Lepiej dla niego, �eby si� tu wi�cej nie pokazywa�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Gomez jest w paskudnym humorze i chyba wiem, co planuje. Musimy uprzedzi� Mag�w Wody, nim b�dzie za p�no!");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Corristo");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Mo�e uda si� nam zapobiec katastrofie. Wol� nie my�le�, co si� stanie, je�li Wolna Kopalnia...");
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
		Doc_PrintLines(ndocid,0,"Pozwoli�em sobie troch� si� tutaj urz�dzi�. Kto by pomy�la�, �e pewnego dnia b�d� jedynym magiem w obozie?");
		Doc_PrintLines(ndocid,0,"Nie powiem, �eby cieszy� mnie powr�t tutaj. Prawd� m�wi�c, mam ochot� jak najszybciej st�d uciec.");
		Doc_PrintLines(ndocid,0,"Ta ca�a wyprawa skazana jest na pora�k�.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Wczoraj wyruszyli g�rnicy. Zabrali ze sob� Diega. Nie zdziwi�bym si�, gdyby ten cwaniak przy pierwszej okazji da� nog�.");
		Doc_PrintLines(ndocid,1,"Jako� nie wyobra�am go sobie z kilofem w r�ku.");
		Doc_PrintLines(ndocid,1,"C�, wykorzystam wolny czas na zg��bianie tajnik�w alchemii.");
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
		Doc_PrintLines(ndocid,0,"Znale�li�my troch� towaru, ale nic specjalnego. Poza tym mamy tu:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 skrzynie starych szmat");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 skrzy� zardzewia�ego �elaza");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 skrzynie po�amanych pancerzy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 (potwornie �mierdz�cych) skrzy� sk�ry i futer");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 skrzynie kilof�w");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 skrzynie narz�dzi");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 skrzy� kamieni (bez rudy)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 skrzyni� zardzewia�ych �yletek");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 skrzynie zniszczonych naczy�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 beczu�ek z wod�");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 skrzyni� czego� paskudnego (dawno do cna przegni�ego)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Engor");
		Doc_Show(ndocid);
	};
};

