
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
		Doc_PrintLine(ndocid,0,"Kamienie runiczne i ich sk³adniki");
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
		Doc_PrintLine(ndocid,0,"PIERWSZY KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy pierwszego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Œwiat³o");
		Doc_PrintLine(ndocid,0,"Z³ota moneta");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ognista strza³a");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ma³a b³yskawica");
		Doc_PrintLine(ndocid,0,"Ska³a krystaliczna");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Szkielet-goblin");
		Doc_PrintLine(ndocid,0,"Koœæ goblina");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie lekkich ran");
		Doc_PrintLine(ndocid,0,"Roœlina lecznicza");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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
		Doc_PrintLine(ndocid,0,"DRUGI KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy drugiego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kula ognia");
		Doc_PrintLine(ndocid,0,"Smo³a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lodowa strza³a");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Przyzwanie wilka");
		Doc_PrintLine(ndocid,0,"Skóra wilka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Piêœæ wichru");
		Doc_PrintLine(ndocid,0,"Wêgiel");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Sen");
		Doc_PrintLine(ndocid,0,"Bagienne ziele");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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
		Doc_PrintLine(ndocid,0,"TRZECI KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy trzeciego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie œrednich ran");
		Doc_PrintLine(ndocid,0,"Ziele lecznicze");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ma³a burza ognista");
		Doc_PrintLine(ndocid,0,"Smo³a, Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Tworzenie szkieletu");
		Doc_PrintLine(ndocid,0,"Koœæ szkieletu");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Strach");
		Doc_PrintLine(ndocid,0,"Czarna per³a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Bry³a lodu");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Piorun kulisty");
		Doc_PrintLine(ndocid,0,"Ska³a krystaliczna");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kula ognia");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Smo³a, Siarka");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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
		Doc_PrintLine(ndocid,0,"CZWARTY KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy czwartego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Du¿a kula ognia");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"Smo³a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"B³yskawica");
		Doc_PrintLine(ndocid,0,"Ska³a krystaliczna");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Obudzenie golema");
		Doc_PrintLine(ndocid,0,"Serce kamiennego golema");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Zniszczenie o¿ywieñca");
		Doc_PrintLine(ndocid,0,"Woda œwiêcona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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
		Doc_PrintLine(ndocid,0,"PI¥TY KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy pi¹tego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lodowa fala");
		Doc_PrintLine(ndocid,0,"Kwarcyt");
		Doc_PrintLine(ndocid,0,"Akwamaryn");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Du¿a burza ognista");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"Ognista pokrzywa");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Przyzwanie demona");
		Doc_PrintLine(ndocid,0,"Serce demona");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Leczenie ciê¿kich ran");
		Doc_PrintLine(ndocid,0,"Korzeñ leczniczy");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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
		Doc_PrintLine(ndocid,0,"SZÓSTY KR¥G");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Runy szóstego krêgu i potrzebne do ich stworzenia sk³adniki:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Deszcz ognia");
		Doc_PrintLine(ndocid,0,"Smo³a");
		Doc_PrintLine(ndocid,0,"Siarka");
		Doc_PrintLine(ndocid,0,"Jêzyk ognistego jaszczura");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Tchnienie œmierci");
		Doc_PrintLine(ndocid,0,"Wêgiel");
		Doc_PrintLine(ndocid,0,"Czarna per³a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Œmiertelna fala");
		Doc_PrintLine(ndocid,0,"Koœæ szkieletu");
		Doc_PrintLine(ndocid,0,"Czarna per³a");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Armia ciemnoœci");
		Doc_PrintLine(ndocid,0,"Koœæ szkieletu");
		Doc_PrintLine(ndocid,0,"Czarna per³a");
		Doc_PrintLine(ndocid,0,"Serce kamiennego golema");
		Doc_PrintLine(ndocid,0,"Serce demona");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Zmniejszenie potwora");
		Doc_PrintLine(ndocid,1,"Koœæ goblina");
		Doc_PrintLine(ndocid,1,"Kie³ trolla");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Tworzenie runy wymaga jednej sztuki lub porcji odpowiedniego sk³adnika.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Trzeba te¿ znaæ w³aœciwe zaklêcie, dysponowaæ zwojem, na którym je spisano oraz pustym kamieniem runicznym.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Dopiero po spe³nieniu tych wszystkich warunków mo¿na rozpocz¹æ pracê przy stole runicznym.");
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

