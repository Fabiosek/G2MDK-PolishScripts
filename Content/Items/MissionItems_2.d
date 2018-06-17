
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "Kamie� Wiedzy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITWR_PALADINLETTER_MIS(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepaladinletter;
	scemename = "MAP";
	description = "List do Lorda Hagena";
};


func void usepaladinletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Lordzie Hagenie!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ekspedycja do G�rniczej Doliny zako�czy�a si� kl�sk�. Ponie�li�my ogromne straty. Niedobitki schroni�y si� w zamku otoczonym przez ork�w.");
	Doc_PrintLines(ndocid,0,"Smoki atakowa�y nas wielokrotnie. Spustoszy�y tereny dooko�a zamku. Niechaj Innos pomo�e nam przetrwa� do przybycia posi�k�w. Zbrojny wypad z zamku nie jest mo�liwy.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niech nas Innos strze�e.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Garond");
	Doc_Show(ndocid);
};


instance ITWR_LETTERFORGORN_MIS(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useletterforgorn;
	scemename = "MAP";
	description = "List Miltena do Gorna";
};


func void useletterforgorn()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Gorn!");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLines(ndocid,0,"Garond zgodzi� si� wypu�ci� ci� na wolno�� - za 1000 sztuk z�ota.");
	Doc_PrintLines(ndocid,0,"Je�li masz wi�c jakie� z�oto, lepiej powiedz, gdzie je ukry�e�.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Milten");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "Klucz do lochu";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do lochu";
	text[3] = "zamkowego.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "Klucz do magazynu";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do magazynu";
	text[3] = "zamkowego.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "Klucz do drzwi";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz do pierwszych drzwi.";
	text[2] = "Wyryto na nim imi�.";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "Klucz do drzwi";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Klucz do drugich drzwi.";
	text[2] = "Wyryto na nim imi�.";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "Sk�rzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usegornstreasure;
	description = "Sk�rzana sakwa Gorna.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegornstreasure()
{
	b_playerfinditem(itmi_gold,250);
	GORNS_BEUTEL = TRUE;
};


instance ITWR_SILVESTRO_MIS(C_ITEM)
{
	name = "Wiadomo��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Wiadomo�� od Silvestra";
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Od kr�lewskiego paladyna Silvestra");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kolejny dzie� dr��enia przed nami. Dzi� zamierzamy przebi� si� przez �cian� skaln�.");
	Doc_PrintLines(ndocid,0,"Mam z�e przeczucia, wi�c zabezpiecz� wydobyt� dotychczas rud�.");
	Doc_PrintLines(ndocid,0,"Tylko Diego zna okolic�. Musz� mu wi�c zaufa�. To on zabierze skrzynie - ale nie puszcz� go samego.");
	Doc_PrintLines(ndocid,0,"Musz� chroni� rud� za wszelk� cen�, wy�l� wi�c z nim dw�ch rycerzy.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niech �yje Kr�l");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Silvestro");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Pazury z�bacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Pazury przyw�dcy stada";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "Sk�rzana sakiewka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = useolav;
	description = "Sakiewka Olava";
	text[0] = "";
	text[1] = "";
	text[2] = "W �rodku podzwania kilka monet.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useolav()
{
	b_playerfinditem(itmi_gold,25);
};


instance ITMI_GOLDPLATE_MIS(C_ITEM)
{
	name = "Z�oty talerz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_PASS_MIS(C_ITEM)
{
	name = "Klucz do prze��czy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Niewielki klucz";
	text[1] = "otwieraj�cy bram� na prze��czy.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "Klucz Bromora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz do pokoju w�a�ciciela";
	text[1] = "burdelu.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "Klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "Niewielki klucz do kufra.";
	text[1] = "Sam kufer znajduje si�";
	text[2] = "pod mostem.";
	text[3] = "W �rodku ukryto kamie� runiczny.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "Notatka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "Trucizna krwiopijc�w";
};


func void usebloodmis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��d�o krwiopijcy zawiera �mierteln� trucizn�, na kt�r� trzeba bardzo uwa�a�.");
	Doc_PrintLines(ndocid,0,"Dlatego podczas usuwania ��d�a nale�y przestrzega� nast�puj�cej zasady:");
	Doc_PrintLines(ndocid,0,"��d�o rozcinamy od ko�ca a� do samej podstawy.");
	Doc_PrintLines(ndocid,0,"Usuwamy sk�r�, a nast�pnie nacinamy tkank� otaczaj�c� gruczo�.");
	Doc_PrintLines(ndocid,0,"Zawiera ona substancj� o w�a�ciwo�ciach leczniczych.");
	Doc_PrintLines(ndocid,0,"Jednak ludzki organizm po jakim� czasie uodparnia si� na jej dzia�anie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Damarok");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Teraz wiem, jak uzyska� substancj� lecznicz� z ��de� krwiopijc�w.");
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance ITWR_PFANDBRIEF_MIS(C_ITEM)
{
	name = "Weksel";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepfandbrief;
	scemename = "MAP";
	description = name;
};


func void usepfandbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"D�ug mo�e zosta� sp�acony poprzez");
	Doc_PrintLine(ndocid,0,"przej�cie zastawionego przedmiotu, kt�rego");
	Doc_PrintLine(ndocid,0,"warto�� r�wna jest warto�ci d�ugu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Zastawiono: ozdobny z�oty kielich");
	Doc_PrintLines(ndocid,0,"z kolekcji Krwawych Kielich�w");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"podpisano");
	Doc_PrintLine(ndocid,0,"Lutero, kupiec");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"Lehmar, lichwiarz");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "Mapa kopalni Garonda";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld_oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_oldworld_oremines()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_oldworld_oremines_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


instance ITWR_MANOWAR(C_ITEM)
{
	name = "Tekst";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemanowar;
	scemename = "MAP";
	description = "S�owa pie�ni.";
};


func void usemanowar()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Lament Dominique");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"D��ymy do Jego �aski.");
	Doc_PrintLines(ndocid,0,"Innos chroni mnie i moich braci.");
	Doc_PrintLines(ndocid,0,"Nie pozwol� si� zatrzyma� mym wrogom,");
	Doc_PrintLines(ndocid,0,"Albowiem w mym sercu p�onie Jego ogie�.");
	Doc_PrintLines(ndocid,0,"Moje ostrze s�u�y tylko Jemu.");
	Doc_PrintLines(ndocid,0,"Niechaj zabrzmi Jego �wi�te imi�.");
	Doc_PrintLines(ndocid,0,"Ka�dy, kto mi si� sprzeciwi");
	Doc_PrintLines(ndocid,0,"zginie na miejscu,");
	Doc_PrintLines(ndocid,0,"bom jest wojownikiem Innosa.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Wiadomo��";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = "Wiadomo��";
};


func void usekdwletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Opu�cili�my ob�z i zamierzamy uda� si� do samego centrum destrukcji. Mo�e tam znajdziemy odpowiedzi, kt�rych szukali�my przez tyle lat. Jeden Adanos wie, dok�d zawiedzie nas ta �cie�ka.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Adanos niech b�dzie z nami");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "Notatka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = "Wiadomo��";
};


func void usegilbertletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mam ju� do��. Ukrywam si� tutaj strasznie d�ugo, a Bariera podobno upad�a.");
	Doc_PrintLines(ndocid,0,"Teraz raczej nikt nie b�dzie mnie szuka�. Mam do�� tej jaskini i ca�ej tej cholernej doliny. Id� do domu.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Gilbert");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITRI_TENGRON(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_tengron;
	on_unequip = unequip_itri_tengron;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = NAME_ADDON_TENGRONSRING;
	text[2] = NAME_BONUS_HP;
	count[2] = RI_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HP;
};

func void unequip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HP;
	if(self.attribute[ATR_HITPOINTS] > (RI_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

