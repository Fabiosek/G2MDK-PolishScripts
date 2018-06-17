
instance ITWR_SATURASFIRSTMESSAGE_ADDON_SEALED(C_ITEM)
{
	name = "Zapieczêtowana wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Ta wiadomoœæ zosta³a dok³adnie zapieczêtowana.";
};


var int use_saturasfirstmessage_onetime;

func void use_saturasfirstmessage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Szanowny Vatrasie,");
	Doc_PrintLines(ndocid,0,"Dotarliœmy do portalu. Mia³eœ racjê.");
	Doc_PrintLines(ndocid,0,"S¹ znaki wskazuj¹ce na to, ¿e naprawdê czcili Adanosa. SprawdŸ, proszê, moje notatki i potwierdŸ nasze ustalenia.");
	Doc_PrintLines(ndocid,0,"Od kilku dni nie widzieliœmy tych dziwnych kamiennych istot.");
	Doc_PrintLines(ndocid,0,"Ziemia wci¹¿ trzêsie siê z niewiadomych powodów.");
	Doc_PrintLines(ndocid,0,"S¹dzê, ¿e nasze badania wkrótce wska¿¹ nam, co mo¿e byæ tego przyczyn¹.");
	Doc_PrintLines(ndocid,0,"Znaleziony przez nas ornament ma wiêksze znaczenie, ni¿ wczeœniej s¹dziliœmy. Wydaje nam siê, ¿e jest to jakiœ klucz-artefakt. Niestety, nie jest kompletny. Musimy go dok³adniej zbadaæ.");
	Doc_PrintLines(ndocid,0,"Wyœlij jednego z cz³onków Wodnego Krêgu, by nam go dostarczy³. Jeœli to mo¿liwe, nie przysy³aj Cavalorna.");
	Doc_PrintLines(ndocid,0,"Poprosi³em go ju¿ o dostarczenie Ci tego listu. Wydaje mi siê, ¿e ju¿ wystarczaj¹co nam pomóg³.");
	Doc_PrintLines(ndocid,0,"Mam nadziejê, ¿e postêpujemy w³aœciwie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_Show(ndocid);
	if((use_saturasfirstmessage_onetime == FALSE) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_KDW,"Zabra³em bandycie wiadomoœæ, któr¹ Cavalorn mia³ dostarczyæ Vatrasowi, Magowi Wody. To teraz moje zadanie.");
		use_saturasfirstmessage_onetime = TRUE;
	};
	if(SC_KNOWSRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Istnieje stowarzyszenie zw¹ce siê Wodnym Krêgiem. Wygl¹da na to, ¿e rz¹dz¹ nim Magowie Wody.");
	};
	if(SC_ISRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Cavalorn nale¿y do Wodnego Krêgu.");
	};
	SC_KNOWSRANGER = TRUE;
};

func void use_saturasfirstmessage_sealed()
{
	CreateInvItems(self,itwr_saturasfirstmessage_addon,1);
	SATURASFIRSTMESSAGEOPENED = TRUE;
	use_saturasfirstmessage();
};


instance ITWR_SATURASFIRSTMESSAGE_ADDON(C_ITEM)
{
	name = "Otwarta wiadomoœæ";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage;
	scemename = "MAP";
	description = name;
	text[2] = "List Saturasa do Vatrasa";
};

instance ITMI_ORNAMENT_ADDON(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du¿ego, ozdobnego pierœcienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITMI_ORNAMENT_ADDON_VATRAS(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment du¿ego, ozdobnego pierœcienia";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON(C_ITEM)
{
	name = "Mapa Nefariusa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_ornaments;
	description = name;
	text[0] = "Na mapie zaznaczono miejsca,";
	text[1] = "gdzie wed³ug Nefariusa znajduj¹ siê brakuj¹ce ornamenty.";
	text[2] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_ornaments()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_ornaments_addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_DEXTER(C_ITEM)
{
	name = "Mapa terenów Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_dexter;
	description = name;
	text[0] = "Skip zaznaczy³ miejsce,";
	text[1] = "gdzie mogê znaleŸæ szefa bandytów,";
	text[2] = "Dextera.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_dexter()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_dexter);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


prototype RANGERRING_PROTOTYPE(C_ITEM)
{
	name = "Pierœcieñ z akwamarynem";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ranger_addon;
	on_unequip = unequip_itri_ranger_addon;
	description = "Symbol przynale¿noœci do Wodnego Krêgu";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void equip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,itri_ranger_addon) == FALSE)
			{
				RANGERRINGISLARESRING = TRUE;
			};
		};
		SCISWEARINGRANGERRING = TRUE;
		Print(PRINT_ADDON_SCISWEARINGRANGERRING);
	};
};

func void unequip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_ISRANGER == FALSE)
		{
			SCISWEARINGRANGERRING = FALSE;
		};
		RANGERRINGISLARESRING = FALSE;
	};
};


instance ITRI_RANGER_LARES_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "Ten pierœcieñ nale¿y do Laresa.";
};

instance ITRI_RANGER_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "To mój pierœcieñ.";
};

instance ITRI_LANCERING(RANGERRING_PROTOTYPE)
{
	text[1] = "Ten pierœcieñ nale¿y do Lance'a.";
};

instance ITMI_PORTALRING_ADDON(C_ITEM)
{
	name = "Ozdobny pierœcieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = "Ten pierœcieñ otwiera portal";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ITWR_MARTIN_MILIZEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "List polecaj¹cy od Martina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_martinmilizempfehlung_addon;
	scemename = "MAP";
	description = "List polecaj¹cy dla Lorda Andre";
	text[2] = "powinien mi umo¿liwiæ";
	text[3] = "wst¹pienie w szeregi stra¿y.";
};


func void use_martinmilizempfehlung_addon()
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
	Doc_PrintLines(ndocid,0,"Drogi Lordzie Andre,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Wraz z tym listem przysy³am Ci nowego rekruta do naszej stra¿y.");
	Doc_PrintLines(ndocid,0,"Udowodni³ swoj¹ przydatnoœæ, wykonuj¹c trudne i odpowiedzialne zadania.");
	Doc_PrintLines(ndocid,0,"Jestem pewien, ¿e bêdzie siê dobrze spisywa³, broni¹c króla oraz mieszkañców tego miasta.");
	Doc_PrintLine(ndocid,0,"Innosie, chroñ króla.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Kwatermistrz Martin");
	Doc_Show(ndocid);
};


instance ITWR_RAVENSKIDNAPPERMISSION_ADDON(C_ITEM)
{
	name = "Rozkazy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ravenskidnappermission_addon;
	scemename = "MAP";
	description = name;
	text[2] = "Zabra³em ten list";
	text[3] = "bandycie Dexterowi.";
};


var int use_ravenskidnappermission_addon_onetime;

func void use_ravenskidnappermission_addon()
{
	var int ndocid;
	if((use_ravenskidnappermission_addon_onetime == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE != 0))
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Teraz mam to na piœmie. Kruk, dawny magnat, stoi za porwaniami mieszkañców Khorinis. Jego kryjówka znajduje siê gdzieœ za górami, w pó³nocno-wschodniej czêœci Khorinis. Vatras powinien zobaczyæ ten dokument.");
		use_ravenskidnappermission_addon_onetime = TRUE;
	};
	SCKNOWSMISSINGPEOPLEAREINADDONWORLD = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"Dexter, ty draniu!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Kiedy jeszcze by³em magnatem, mo¿na by³o bardziej na tobie polegaæ.");
	Doc_PrintLines(ndocid,0,"Jeœli nie zdo³asz porwaæ wiêcej ludzi z miasta i przys³aæ ich do mnie, to bêdziemy mieli niez³y problem z ch³opakami w naszej kryjówce.");
	Doc_PrintLines(ndocid,0,"Potrzebujê tu wiêcej niewolników albo ch³opaki zaczn¹ siê buntowaæ. Chyba nie muszê ci mówiæ, co to znaczy, prawda?");
	Doc_PrintLines(ndocid,0,"Jestem bardzo bliski dostania siê do œwi¹tyni. Nie mogê sobie pozwoliæ na ¿adne, absolutnie ¿adne k³opoty.");
	Doc_PrintLines(ndocid,0,"A, jest jeszcze jeden problem:");
	Doc_PrintLines(ndocid,0,"Prêdzej czy póŸniej bêdziemy musieli znaleŸæ drogê przez wysokie góry w pó³nocno-wschodnim Khorinis. Piraci nie zapewni¹ nam transportu, kiedy przestaniemy im p³aciæ.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Kruk");
	Doc_Show(ndocid);
};


instance ITWR_VATRAS_KDFEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "List polecaj¹cy od Vatrasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatraskdfempfehlung_addon;
	scemename = "MAP";
	description = "List polecaj¹cy od Vatrasa";
	text[2] = "powinien pomóc mi";
	text[3] = "wejœæ do klasztoru Magów Ognia";
	text[4] = "bez zap³aty.";
};


func void use_vatraskdfempfehlung_addon()
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
	Doc_PrintLines(ndocid,0,"Bracia Ognia");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"W³aœnie poinformowano mnie, ¿e aby do³¹czyæ do waszego stowarzyszenia, trzeba wnieœæ op³atê.");
	Doc_PrintLines(ndocid,0,"List ten dostarczy oddany cz³owiek, który chcia³by zostaæ nowicjuszem w waszych szeregach.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};


instance ITMI_LOSTINNOSSTATUE_DARON(C_ITEM)
{
	name = "Cenny pos¹¿ek Innosa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LUCIASLOVELETTER_ADDON(C_ITEM)
{
	name = "List po¿egnalny Lucii";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luciasloveletter_addon;
	scemename = "MAP";
	description = name;
};


func void use_luciasloveletter_addon()
{
	var int ndocid;
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia napisa³a list po¿egnalny dla Elvricha. Z pewnoœci¹ bêdzie chcia³ go przeczytaæ.");
	MIS_LUCIASLETTER = LOG_RUNNING;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Najdro¿szy Elvrichu,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"¯adne s³owa nie oddadz¹ tego, jak mi przykro.");
	Doc_PrintLines(ndocid,0,"Wiem, ¿e ciê¿ko bêdzie ci to zrozumieæ. Dosz³am jednak do wniosku, ¿e lepiej bêdzie dla nas obojga, jeœli znajdziesz sobie porz¹dniejsz¹ dziewczynê.");
	Doc_PrintLines(ndocid,0,"Udajê siê w miejsce, z którego ju¿ nie wrócê. Zapomnij o mnie. Nieprzyzwoita dziewczyna jak ja nie zas³uguje na takiego dobrego ch³opaka. ¯egnaj.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lucia");
	Doc_Show(ndocid);
};


prototype EFFECTITEMPROTOTYPE_ADDON(C_ITEM)
{
	name = "Kamieñ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_AMBOSSEFFEKT_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FOREST_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_BIGFARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_RAKE(C_ITEM)
{
	name = "Grabie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "RAKE";
	on_state[1] = use_rake;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void use_rake()
{
};


instance ITRI_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Pierœcieñ gildii";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "RzeŸbiony pierœcieñ";
	text[2] = "zamorskiej gildii Araxos";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITWR_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Dostawa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_addon_bandittrader;
	scemename = "MAP";
	description = name;
	text[2] = "Zabra³em ten list bandytom";
	text[3] = "za farm¹ Sekoba.";
};


var int use_itwr_addon_bandittrader_onetime;

func void use_itwr_addon_bandittrader()
{
	var int ndocid;
	BANDITTRADER_LIEFERUNG_GELESEN = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"15 krótkich mieczy");
	Doc_PrintLines(ndocid,0,"20 pa³aszy");
	Doc_PrintLines(ndocid,0,"25 bochenków chleba");
	Doc_PrintLines(ndocid,0,"15 butelek wina");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"To ju¿ ostatni raz.");
	Doc_PrintLines(ndocid,0,"Zaczyna robiæ siê za gor¹co.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Fernando");
	Doc_Show(ndocid);
	if((MIS_VATRAS_FINDTHEBANDITTRADER != 0) && (use_itwr_addon_bandittrader_onetime == FALSE))
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"Znalaz³em dokument potwierdzaj¹cy, ¿e Fernando jest handlarzem broni¹, którego szukam.");
		use_itwr_addon_bandittrader_onetime = TRUE;
	};
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN(C_ITEM)
{
	name = "Przesy³ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Wiadomoœæ Vatrasa dla Saturasa";
};


func void use_vatras2saturas_findraven()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Szanowny Saturasie,");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Mam nadziejê, ¿e zbli¿asz siê do koñca. Sytuacja w mieœcie ostatnio siê uspokoi³a. Jednak obawiam siê, ¿e to cisza przed burz¹. Pospiesz siê, proszê. Potrzebujê ciê tutaj.");
	Doc_PrintLines(ndocid,0,"Przestudiowa³em zapiski i potwierdzam twoje podejrzenia. Symbole rzeczywiœcie wskazuj¹ na kulturê, która czci³a Adanosa. Dlatego musimy pozostaæ czujni i nie daæ siê zaœlepiæ s³owom fa³szywych proroków.");
	Doc_PrintLines(ndocid,0,"Zaginieni mieszkañcy zostali porwani przez Kruka, by³ego magnata. S¹ w rejonie, do którego z pewnoœci¹ zaprowadzi nas portal.");
	Doc_PrintLines(ndocid,0,"Jeszcze jedno – przysy³am Ci pomocnika. Osoba, która przyniesie ten list, jest doœæ wyj¹tkowa. Za ka¿dym razem, gdy na ciebie spogl¹da, ma w oku ten charakterystyczny b³ysk. Nie jestem jeszcze tego ca³kiem pewien, ale mo¿liwe, ¿e to ON, nawet jeœli inaczej go sobie wyobra¿aliœmy.");
	Doc_PrintLines(ndocid,0,"SprawdŸ go. Wierzê, ¿e mam racjê.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Vatras");
	Doc_Show(ndocid);
};

func void use_vatras2saturas_findraven_sealed()
{
	CreateInvItems(self,itwr_vatras2saturas_findraven_opened,1);
	VATRAS2SATURAS_FINDRAVEN_OPEN = TRUE;
	use_vatras2saturas_findraven();
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN_OPENED(C_ITEM)
{
	name = "Otwarta przesy³ka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven;
	scemename = "MAP";
	description = name;
	text[2] = "Wiadomoœæ Vatrasa dla Saturasa";
};

instance ITAM_ADDON_WISPDETECTOR(C_ITEM)
{
	name = "Amulet z rudy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEXSTRG;
	visual = "ItAm_Mana_01.3ds";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER_BLUE";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_wispdetector;
	on_unequip = unequip_wispdetector;
	description = "Amulet szukaj¹cego ognika";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int equip_wispdetector_onetime;

func void equip_wispdetector()
{
	var C_NPC detwsp;
	if(equip_wispdetector_onetime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WISPSEARCHING = WISPSEARCH_NF;
		equip_wispdetector_onetime = TRUE;
	};
	detwsp = Hlp_GetNpc(wisp_detector);
	AI_Teleport(detwsp,"TOT");
	Wld_SpawnNpcRange(self,wisp_detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",wisp_detector,wisp_detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void unequip_wispdetector()
{
	var C_NPC detwsp;
	detwsp = Hlp_GetNpc(wisp_detector);
	if(Npc_IsDead(detwsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(detwsp,"TOT");
	b_removenpc(detwsp);
	AI_Teleport(detwsp,"TOT");
};


instance ITFO_ADDON_KROKOFLEISCH_MISSION(C_ITEM)
{
	name = "Miêso bagiennego szczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	description = name;
	text[1] = "Ma podejrzany zapach!";
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};

instance ITRI_ADDON_MORGANSRING_MISSION(C_ITEM)
{
	name = "Pierœcieñ Morgana";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_morgansring;
	on_unequip = unequip_morgansring;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[1] = "Pierœcieñ zdobiony jest mnóstwem piêknych run.";
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_morgansring()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITMI_FOCUS(C_ITEM)
{
	name = "Kamieñ ogniskuj¹cy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_MANAPOTION";
	description = name;
};

instance ITMI_ADDON_STEEL_PAKET(C_ITEM)
{
	name = "Pakiet stali";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ta paczka jest NAPRAWDÊ ciê¿ka.";
	text[3] = "Zawiera spor¹ bry³ê stali.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_STONEPLATECOMMON_ADDON(C_ITEM)
{
	name = "Stara kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATECOMMON;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_stoneplatecommon;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Szara kamienna tablica";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STONEPLATECOMMON;
};


func void use_stoneplatecommon()
{
	var int ndocid;
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,-1,70,50,90,50,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Kasta wojowników wywo³a³a gniew naszego boga.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"RADEMES, nastêpca QUARHODRONA, zosta³ wypêdzony. Ale jego z³owroga moc dotar³a do nas nawet z jego miejsca wygnania.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Byliœmy wobec niej bezsilni.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Na JARKENDAR spad³ gniew ADANOSA!");
	}
	else
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_02.TGA",0);
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_01(C_ITEM)
{
	name = "Czerwona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_01;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Czerwona kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"My, trzej pozostali przywódcy Rady Piêciu, za³o¿yliœmy pu³apki w œwi¹tyni i zapieczêtowaliœmy jej wejœcie. Oby miecz na zawsze ju¿ pozosta³ w mroku.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_05(C_ITEM)
{
	name = "¯ó³ta kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_05;
	scemename = "MAP";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "¯ó³ta kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_05()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"Ja, który sprzeciwi³em siê rozkazom trójki, zbudowa³em pierwsz¹ pu³apkê. I tylko ja znam w³aœciwe wrota.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_03(C_ITEM)
{
	name = "Niebieska kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_03;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Niebieska kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_03()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON przygotowa³ drug¹ pu³apkê. Tylko ten, kto nie zejdzie ze œcie¿ki œwiat³a, dotrze do trzeciej komnaty.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_04(C_ITEM)
{
	name = "Zielona kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_04;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Zielona kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_04()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"Trzecia pu³apka zosta³a zbudowana przez QUARHODRONA i jedynie on wie, jak otworzyæ bramê.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_02(C_ITEM)
{
	name = "Fioletowa kamienna tablica";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_02;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[2] = "Fioletowa kamienna tablica";
	text[3] = "";
};


func void use_addon_stone_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON by³ te¿ tym, który z pomoc¹ KHARDIMONA zapieczêtowa³ zewnêtrzn¹ bramê œwi¹tyni. ¯aden z nich nie prze¿y³ tego rytua³u.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Jedynie ja pozosta³em, aby byæ œwiadkiem tych wydarzeñ.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Oby RADEMES przez ca³¹ wiecznoœæ gni³ wewn¹trz œwi¹tyni!");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Erfjkemvfj RADEMES Fjewheege Egdgsmkd!");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_KOMPASS_MIS(C_ITEM)
{
	name = "Z³oty kompas";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITSE_ADDON_FRANCISCHEST(C_ITEM)
{
	name = "Skrzynia ze skarbem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = francischest;
	description = "Skrzynia ze skarbem";
	text[0] = "Skrzynia jest dosyæ ciê¿ka.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void francischest()
{
	CreateInvItems(hero,itmi_goldchest,1);
	CreateInvItems(hero,itmw_francisdagger_mis,1);
	CreateInvItems(hero,itmi_gold,153);
	CreateInvItems(hero,itmi_goldcup,1);
	CreateInvItems(hero,itmi_silvernecklace,1);
	CreateInvItems(hero,itwr_addon_francisabrechnung_mis,1);
	Snd_Play("Geldbeutel");
	Print("Zdoby³em stertê ró¿nych rzeczy.");
};


instance ITWR_ADDON_FRANCISABRECHNUNG_MIS(C_ITEM)
{
	name = "Wynagrodzenie";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usefrancisabrechnung_mis;
};


func void usefrancisabrechnung_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Statek kupiecki 'Syrena'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Suma ³upów: 14560");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Za³oga       : 9840");
	Doc_PrintLine(ndocid,0,"Oficerowie   : 2500");
	Doc_PrintLine(ndocid,0,"Kapitan      : 1200");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"moja dzia³ka  : 2220");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fregata 'Miriam'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Suma ³upów: 4890");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Za³oga       : 2390");
	Doc_PrintLine(ndocid,0,"Oficerowie   : 500");
	Doc_PrintLine(ndocid,0,"Kapitan      : 500");
	Doc_PrintLine(ndocid,0,"----------------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"moja dzia³ka  : 1000");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Statek handlowy 'Nico'");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Suma ³upów: 9970");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Za³oga       : 5610");
	Doc_PrintLine(ndocid,1,"Oficerowie   : 1500");
	Doc_PrintLine(ndocid,1,"Kapitan      : 1000");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"moja dzia³ka  : 1860");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Statek kupiecki 'Maria'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Suma ³upów: 7851");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Za³oga       : 4000");
	Doc_PrintLine(ndocid,1,"Oficerowie   : 750");
	Doc_PrintLine(ndocid,1,"Kapitan      : 1000");
	Doc_PrintLine(ndocid,1,"----------------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"moja dzia³ka  : 1701");
	Doc_PrintLine(ndocid,1,"");
	FRANCIS_HASPROOF = TRUE;
	Doc_Show(ndocid);
	b_say(self,self,"$ADDON_THISLITTLEBASTARD");
};


instance ITWR_ADDON_GREGSLOGBUCH_MIS(C_ITEM)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Dziennik Grega";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegregslogbuch;
};


func void usegregslogbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLines(ndocid,0,"Mam ju¿ doœæ tej pla¿y! Wokó³ tylko piasek. Nie mogê nawet spaæ, bo mnie wszêdzie swêdzi. Czas, ¿eby Kruk w koñcu sypn¹³ z³otem za wiêŸniów i ¿ebyœmy w koñcu st¹d odp³ynêli. Coœ mi siê zdaje, ¿e muszê powa¿nie pogadaæ z tym bufonem.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Co ten pacan sobie wyobra¿a? Kaza³ odprawiæ mnie z kwitkiem swoim œmierdz¹cym najemnikom. Wkrótce siê dowie, z kim ma do czynienia. Na pocz¹tek za³atwiê tego s³u¿alca Bloodwyna.");
	Doc_PrintLines(ndocid,0,"Jeœli wkrótce nie zap³aci, bêdê musia³ zrobiæ siê naprawdê niemi³y.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLines(ndocid,1,"Bandyci siê rozzuchwalili. Wci¹¿ nie zap³acili za ostatni transport. Po prostu za ma³o wiemy. Muszê wybadaæ, co planuje Kruk.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Wezmê wiêkszoœæ za³ogi na kontynent i zabezpieczymy rudê. Francis zostanie z paroma ludŸmi i ufortyfikuje obóz.");
	Doc_PrintLines(ndocid,1,"Aby mieæ pewnoœæ, ¿e ka¿dy ma zajêcie, da³em Bonesowi zbrojê. Przekradnie siê w niej do obozu bandytów i dowie siê, co knuje Kruk.");
	GREG_GAVEARMORTOBONES = TRUE;
	Doc_Show(ndocid);
};


instance ITKE_ADDON_BLOODWYN_01(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz Bloodwyna";
	text[2] = "Pasuje do skrzyni";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ADDON_HEILER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Klucz kamiennego stra¿nika";
	text[2] = "Pasuje do skrzyni";
	text[3] = "w dziwnym budynku na bagnie";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEMPELTORKEY(C_ITEM)
{
	name = "Kamienna tablica Quarhodrona";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemename = "MAP";
	on_state[0] = use_tempeltorkey;
	text[2] = "Klucz do œwi¹tyni Adanosa";
};


func void use_tempeltorkey()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  Jhehedra Akhantar");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_BLOODWYN_KOPF(C_ITEM)
{
	name = "G³owa Bloodwyna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_ADDON_TREASUREMAP(C_ITEM)
{
	name = "Mapa do skarbu";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_treasuremap;
	description = name;
	text[0] = "";
	text[1] = "Na mapie s¹ zaznaczone jakieœ miejsca.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_treasuremap()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_addon_treasuremap);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};


instance ITMI_ADDON_GREGSTREASUREBOTTLE_MIS(C_ITEM)
{
	name = "Wiadomoœæ w butelce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_gregsbottle;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "W œrodku jest kawa³ek papieru";
};


func void use_gregsbottle()
{
	b_playerfinditem(itwr_addon_treasuremap,1);
};


instance ITMI_EROLSKELCH(C_ITEM)
{
	name = "Pêkniêta srebrna misa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

