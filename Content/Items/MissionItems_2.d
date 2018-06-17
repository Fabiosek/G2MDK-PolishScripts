
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "Kamieñ Wiedzy";
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
	Doc_PrintLines(ndocid,0,"Ekspedycja do Górniczej Doliny zakoñczy³a siê klêsk¹. Ponieœliœmy ogromne straty. Niedobitki schroni³y siê w zamku otoczonym przez orków.");
	Doc_PrintLines(ndocid,0,"Smoki atakowa³y nas wielokrotnie. Spustoszy³y tereny dooko³a zamku. Niechaj Innos pomo¿e nam przetrwaæ do przybycia posi³ków. Zbrojny wypad z zamku nie jest mo¿liwy.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niech nas Innos strze¿e.");
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
	Doc_PrintLines(ndocid,0,"Garond zgodzi³ siê wypuœciæ ciê na wolnoœæ - za 1000 sztuk z³ota.");
	Doc_PrintLines(ndocid,0,"Jeœli masz wiêc jakieœ z³oto, lepiej powiedz, gdzie je ukry³eœ.");
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
	text[2] = "Wyryto na nim imiê.";
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
	text[2] = "Wyryto na nim imiê.";
	text[3] = "Gomez";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usegornstreasure;
	description = "Skórzana sakwa Gorna.";
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
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Wiadomoœæ od Silvestra";
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Od królewskiego paladyna Silvestra");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kolejny dzieñ dr¹¿enia przed nami. Dziœ zamierzamy przebiæ siê przez œcianê skaln¹.");
	Doc_PrintLines(ndocid,0,"Mam z³e przeczucia, wiêc zabezpieczê wydobyt¹ dotychczas rudê.");
	Doc_PrintLines(ndocid,0,"Tylko Diego zna okolicê. Muszê mu wiêc zaufaæ. To on zabierze skrzynie - ale nie puszczê go samego.");
	Doc_PrintLines(ndocid,0,"Muszê chroniæ rudê za wszelk¹ cenê, wyœlê wiêc z nim dwóch rycerzy.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niech ¿yje Król");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Silvestro");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Pazury zêbacza";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Pazury przywódcy stada";
	text[0] = "";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "Skórzana sakiewka";
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
	text[2] = "W œrodku podzwania kilka monet.";
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
	name = "Z³oty talerz";
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
	name = "Klucz do prze³êczy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Niewielki klucz";
	text[1] = "otwieraj¹cy bramê na prze³êczy.";
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
	description = "Klucz do pokoju w³aœciciela";
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
	text[1] = "Sam kufer znajduje siê";
	text[2] = "pod mostem.";
	text[3] = "W œrodku ukryto kamieñ runiczny.";
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
	description = "Trucizna krwiopijców";
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
	Doc_PrintLines(ndocid,0,"¯¹d³o krwiopijcy zawiera œmierteln¹ truciznê, na któr¹ trzeba bardzo uwa¿aæ.");
	Doc_PrintLines(ndocid,0,"Dlatego podczas usuwania ¿¹d³a nale¿y przestrzegaæ nastêpuj¹cej zasady:");
	Doc_PrintLines(ndocid,0,"¯¹d³o rozcinamy od koñca a¿ do samej podstawy.");
	Doc_PrintLines(ndocid,0,"Usuwamy skórê, a nastêpnie nacinamy tkankê otaczaj¹c¹ gruczo³.");
	Doc_PrintLines(ndocid,0,"Zawiera ona substancjê o w³aœciwoœciach leczniczych.");
	Doc_PrintLines(ndocid,0,"Jednak ludzki organizm po jakimœ czasie uodparnia siê na jej dzia³anie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Damarok");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Teraz wiem, jak uzyskaæ substancjê lecznicz¹ z ¿¹de³ krwiopijców.");
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
	Doc_PrintLine(ndocid,0,"D³ug mo¿e zostaæ sp³acony poprzez");
	Doc_PrintLine(ndocid,0,"przejêcie zastawionego przedmiotu, którego");
	Doc_PrintLine(ndocid,0,"wartoœæ równa jest wartoœci d³ugu.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Zastawiono: ozdobny z³oty kielich");
	Doc_PrintLines(ndocid,0,"z kolekcji Krwawych Kielichów");
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
	description = "S³owa pieœni.";
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
	Doc_PrintLines(ndocid,0,"D¹¿ymy do Jego ³aski.");
	Doc_PrintLines(ndocid,0,"Innos chroni mnie i moich braci.");
	Doc_PrintLines(ndocid,0,"Nie pozwolê siê zatrzymaæ mym wrogom,");
	Doc_PrintLines(ndocid,0,"Albowiem w mym sercu p³onie Jego ogieñ.");
	Doc_PrintLines(ndocid,0,"Moje ostrze s³u¿y tylko Jemu.");
	Doc_PrintLines(ndocid,0,"Niechaj zabrzmi Jego œwiête imiê.");
	Doc_PrintLines(ndocid,0,"Ka¿dy, kto mi siê sprzeciwi");
	Doc_PrintLines(ndocid,0,"zginie na miejscu,");
	Doc_PrintLines(ndocid,0,"bom jest wojownikiem Innosa.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = "Wiadomoœæ";
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
	Doc_PrintLines(ndocid,0,"Opuœciliœmy obóz i zamierzamy udaæ siê do samego centrum destrukcji. Mo¿e tam znajdziemy odpowiedzi, których szukaliœmy przez tyle lat. Jeden Adanos wie, dok¹d zawiedzie nas ta œcie¿ka.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Adanos niech bêdzie z nami");
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
	description = "Wiadomoœæ";
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
	Doc_PrintLines(ndocid,0,"Mam ju¿ doœæ. Ukrywam siê tutaj strasznie d³ugo, a Bariera podobno upad³a.");
	Doc_PrintLines(ndocid,0,"Teraz raczej nikt nie bêdzie mnie szuka³. Mam doœæ tej jaskini i ca³ej tej cholernej doliny. Idê do domu.");
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

