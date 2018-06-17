
func void use_bookstand_rune_01_s1()
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
		Doc_PrintLine(ndocid,0,"Strona 1");
		Doc_PrintLine(ndocid,0,"Kamienie runiczne");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strona 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1()
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
		Doc_PrintLine(ndocid,0,"Strona 1");
		Doc_PrintLine(ndocid,0,"Kamienie runiczne i ich sk�adniki");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strona 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1()
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
		Doc_PrintLine(ndocid,0,"Strona 1");
		Doc_PrintLine(ndocid,0,"Nauka Innosa");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strona 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1()
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
		Doc_PrintLine(ndocid,0,"Strona 1");
		Doc_PrintLine(ndocid,0,"Przykazania Innosa");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strona 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_01_s1()
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
		Doc_PrintLine(ndocid,0,"PIERWSZY KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy pierwszego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�wiat�o");
		Doc_PrintLine(ndocid,0,"Z�ota moneta");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ognista strza�a");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ma�a b�yskawica");
		Doc_PrintLine(ndocid,0,"Ska�a krystaliczna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Szkielet-goblin");
		Doc_PrintLine(ndocid,0,"Ko�� goblina");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie lekkich ran");
		Doc_PrintLine(ndocid,0,"Ro�lina lecznicza");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_02_s1()
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
		Doc_PrintLine(ndocid,0,"DRUGI KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy drugiego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kula ognia");
		Doc_PrintLine(ndocid,0,"Smo�a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lodowa strza�a");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Przyzwanie wilka");
		Doc_PrintLine(ndocid,0,"Sk�ra wilka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Pi�� wichru");
		Doc_PrintLine(ndocid,0,"W�giel");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Sen");
		Doc_PrintLine(ndocid,0,"Bagienne ziele");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_03_s1()
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
		Doc_PrintLine(ndocid,0,"TRZECI KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy trzeciego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie �rednich ran");
		Doc_PrintLine(ndocid,0,"Ziele lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ma�a burza ognista");
		Doc_PrintLine(ndocid,0,"Smo�a, Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Tworzenie szkieletu");
		Doc_PrintLine(ndocid,0,"Ko�� szkieletu");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Strach");
		Doc_PrintLine(ndocid,0,"Czarna per�a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Bry�a lodu");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Piorun kulisty");
		Doc_PrintLine(ndocid,0,"Ska�a krystaliczna");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kula ognia");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Smo�a, Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_04_s1()
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
		Doc_PrintLine(ndocid,0,"CZWARTY KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy czwartego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Du�a kula ognia");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"Smo�a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"B�yskawica");
		Doc_PrintLine(ndocid,0,"Ska�a krystaliczna");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Obudzenie golema");
		Doc_PrintLine(ndocid,0,"Serce kamiennego golema");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Zniszczenie o�ywie�ca");
		Doc_PrintLine(ndocid,0,"Woda �wi�cona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_05_s1()
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
		Doc_PrintLine(ndocid,0,"PI�TY KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy pi�tego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lodowa fala");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Du�a burza ognista");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"Ognista pokrzywa");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Przyzwanie demona");
		Doc_PrintLine(ndocid,0,"Serce demona");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie ci�kich ran");
		Doc_PrintLine(ndocid,0,"Korze� leczniczy");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_kreise_06_s1()
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
		Doc_PrintLine(ndocid,0,"SZ�STY KR�G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy sz�stego kr�gu i potrzebne do ich stworzenia sk�adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Deszcz ognia");
		Doc_PrintLine(ndocid,0,"Smo�a");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"J�zyk ognistego jaszczura");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Tchnienie �mierci");
		Doc_PrintLine(ndocid,0,"W�giel");
		Doc_PrintLine(ndocid,0,"Czarna per�a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�miertelna fala");
		Doc_PrintLine(ndocid,0,"Ko�� szkieletu");
		Doc_PrintLine(ndocid,0,"Czarna per�a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Armia ciemno�ci");
		Doc_PrintLine(ndocid,0,"Ko�� szkieletu");
		Doc_PrintLine(ndocid,0,"Czarna per�a");
		Doc_PrintLine(ndocid,0,"Serce kamiennego golema");
		Doc_PrintLine(ndocid,0,"Serce demona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Zmniejszenie potwora");
		Doc_PrintLine(ndocid,1,"Ko�� goblina");
		Doc_PrintLine(ndocid,1,"Kie� trolla");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk�adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te� zna� w�a�ciwe zakl�cie, dysponowa� zwojem, na kt�rym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe�nieniu tych wszystkich warunk�w mo�na rozpocz�� prac� przy stole runicznym.");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rules_01_s1()
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
		Doc_PrintLine(ndocid,0,"Strona 1");
		Doc_PrintLine(ndocid,0,"Zasady");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Strona 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

