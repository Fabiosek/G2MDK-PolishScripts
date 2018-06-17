
instance ITWR_XARDASLETTERTOOPENBOOK_MIS(C_ITEM)
{
	name = "List Xardasa";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardaslettertoopenbook;
	scemename = "MAP";
	description = name;
};


func void use_xardaslettertoopenbook()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Podejrzewa³em, ¿e Ÿród³em z³a w Górniczej Dolinie by³ jeden ze smoków.");
	Doc_PrintLines(ndocid,0,"Myli³em siê.");
	Doc_PrintLines(ndocid,0,"Jeœli wszystko przebieg³o zgodnie z moim");
	Doc_PrintLines(ndocid,0,"planem, szukasz teraz zapewne Dworu Irdorath.");
	Doc_PrintLines(ndocid,0,"Ksi¹¿ka, któr¹ da³eœ Pyrokarowi, zawiera wszystkie potrzebne Ci wskazówki.");
	Doc_PrintLines(ndocid,0,"Powinienem by³ siê domyœliæ, dlaczego Poszukiwacze tak bardzo");
	Doc_PrintLines(ndocid,0,"chcieli j¹ zdobyæ.");
	Doc_PrintLines(ndocid,0,"Musisz j¹ odzyskaæ!");
	Doc_PrintLines(ndocid,0,"Otworzysz j¹ s³owami 'XARAK BENDARDO'. Tylko nie mów o tym nikomu!");
	Doc_PrintLines(ndocid,0,"Muszê zaj¹æ siê teraz wa¿niejszymi sprawami.");
	Doc_PrintLines(ndocid,0,"Odt¹d jesteœ zdany jedynie na siebie. Tylko Ty mo¿esz pokonaæ Ÿród³o z³a.");
	Doc_PrintLines(ndocid,0,"Jeszcze siê spotkamy!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             Xardas.");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"W swoim liœcie Xardas poinformowa³ mnie, jakie s³owa otwieraj¹ ksiêgê DWÓR IRDORATH.");
	};
	MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "Klucz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "z ksiêgi 'Dwór Irdorath'";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "Dwór Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_hallsofirdorath;
};


func void use_hallsofirdorath()
{
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == TRUE)
	{
		b_say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,itwr_hallsofirdorath_open_mis,1);
		CreateInvItems(hero,itke_monastarysecretlibrary_mis,1);
		CreateInvItems(hero,itwr_uselampidiot_mis,1);
		Print(PRINT_IRDORATHBOOKHIDDENKEY);
		b_giveplayerxp(XP_HALLSOFIRDORATHISOPEN);
		ITWR_HALLSOFIRDORATHISOPEN = TRUE;
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Uda³o mi siê otworzyæ ksiêgê Xardasa. Znalaz³em w niej tajemnicz¹ wiadomoœæ i dziwny klucz. Kto wie, co jeszcze kryje siê w klasztornych podziemiach.");
	}
	else
	{
		CreateInvItems(hero,itwr_hallsofirdorath_mis,1);
		Print(PRINT_IRDORATHBOOKDOESNTOPEN);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ITWR_HALLSOFIRDORATH_OPEN_MIS(C_ITEM)
{
	name = "Dwór Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_hallsofirdorath_open;
};


func void use_hallsofirdorath_open()
{
	var int ndocid;
	if(ITWR_SCREADSHALLSOFIRDORATH == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Przeczyta³em ksiêgê Xardasa. Jest w niej wzmianka o tajnej bibliotece, która zapewne znajduje siê w podziemiach klasztoru.");
	};
	ITWR_SCREADSHALLSOFIRDORATH = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...tak oto ukry³em wejœcie do biblioteki za zamaskowanymi drzwiami, by uchroniæ moje zapiski ze œwi¹tyñ Beliara.");
	Doc_PrintLines(ndocid,0,"Gdyby dowiedzieli siê o nich moi bracia, mogliby je pochopnie zniszczyæ.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Teraz zaœ wiedz¹ tylko, ¿e œwi¹tynie te niegdyœ istnia³y.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Na wszelki wypadek zostawi³em kilka s³ug na stra¿y biblioteki.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Ten klucz otwiera ostatnie drzwi.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "Zakurzona ksiêga";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_xardasseamapbook_mis;
};


func void use_xardasseamapbook_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...Jestem pewien, ¿e ta budowla to Dwór Irdorath. Znajduje siê on na niewielkiej wyspie, ca³kiem blisko przystani w Khorinis. Nie ma w¹tpliwoœci, ¿e Beliara interesuje ruda z kopalñ...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"...Im s¹ potê¿niejsi, tym bardziej przydatni bêd¹ dla niego jako o¿ywieñczy s³udzy. Pokonanie tych upad³ych paladynów to nie³atwe zadanie. Jeden z nich wpad³ w moje rêce. Mam tylko nadziejê, ¿e pozostali nie dowiedz¹ siê o nim...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...Upad³y paladyn nie reaguje na ¿adne bodŸce. Jego zbrojê i inne przedmioty schowa³em w tylnej komorze. Drzwi mo¿na otworzyæ tylko od wewn¹trz, wiêc stworzy³em na tê okazjê specjaln¹ runê teleportacji. Instrukcje s¹ w almanachu, by móg³ je znaleŸæ Wybraniec...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"...Znaki s¹ jasne! Gdy przybêdzie Wybrany, przyda siê mu ka¿da pomoc. Beliar i tak jest ju¿ zbyt silny. Zgromadzi³em tu na wszelki wypadek kilka przydatnych artefaktów. Podejrzewam, ¿e Wybraniec bêdzie jednym z nas,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"dlatego spisa³em dla niego instrukcje w almanachu.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...Nie mam ju¿ z³udzeñ. Jesteœmy bezbronni wobec wyroków losu. Gdy Beliar odpowiednio uroœnie w si³ê, spróbuje przej¹æ w³adzê nad ca³ym œwiatem. Muszê znaleŸæ Wybrañca!");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"...Wybuchnie wojna, która zadecyduje o losach œwiata. Chyba jestem jedynym, który potrafi odczytaæ znaki. Pozostali po prostu je ignoruj¹. Wybraniec nadejdzie, a jego przyjœcie bêdzie oznaczaæ pocz¹tek wojny. Odwieczna rywalizacja mo¿e zostaæ rozstrzygniêta.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"Nie bêdê sta³ bezczynnie, pozwalaj¹c innym decydowaæ o losach œwiata.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...Ze staro¿ytnych pism dowiedzia³em siê, jak stworzyæ legendarn¹ broñ pradawnych Smoczych Mistrzów. Nie wiem jednak, gdzie szukaæ potrzebnych sk³adników. Na wszelki wypadek zapisa³em wszystko w almanachu. Kto wie, mo¿e przyjdzie nam walczyæ tak¿e ze smokami.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "Podniszczony list";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[0] = "z ksiêgi 'Dwór Irdorath'";
};


func void useitwr_uselampidiot_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"               Lampa rzuca œwiat³o");
	Doc_PrintLine(ndocid,0,"               na podziemne korytarze");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_SEAMAP_IRDORATH(C_ITEM)
{
	name = "Mapa morska wyspy Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_seamap_irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_seamap_irdorath()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(ndocid);
	if((MIS_SHIPISFREE == FALSE) && (KAPITEL < 6))
	{
		b_say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKNOWSWAYTOIRDORATH == FALSE)
	{
		Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
		b_logentry(TOPIC_SHIP,"Wygl¹da na to, ¿e muszê siê dostaæ na wyspê nieprzyjaciela. Bêdê potrzebowa³ statku, za³ogi i kapitana.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
	MIS_SCKNOWSWAYTOIRDORATH = TRUE;
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "Akt okrêtowy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "Upowa¿nienie";
	text[4] = "do korzystania z okrêtu paladynów.";
};


func void useitwr_forgedshipletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Upowa¿nienie");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0," Ten dokument uprawnia jego");
	Doc_PrintLine(ndocid,0," posiadacza do swobodnego wykorzystania");
	Doc_PrintLine(ndocid,0," królewskiej galery wojennej Lorda Hagena");
	Doc_PrintLine(ndocid,0," przez czas nieograniczony.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     królewska pieczêæ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "Klucz do wie¿y stra¿nika g³ównej bramy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_ITEM)
{
	name = "Klucz do kajuty kapitañskiej";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITPO_POTIONOFDEATH_01_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "£zy Innosa";
	text[1] = "???";
	count[1] = MANA_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_potionofdeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;
		PrintScreen(PRINT_LEARNSTR5,-1,45,FONT_SCREEN,2);
		PrintScreen(PRINT_LEARNDEX5,-1,55,FONT_SCREEN,2);
		PrintScreen(PRINT_FULLYHEALED,-1,65,FONT_SCREEN,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		b_say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ITPO_POTIONOFDEATH_02_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "£zy Innosa";
	text[1] = "Ta mikstura zapewnia Magom Ognia specjalne moce,";
	text[2] = "jeœli u¿yje jej ktoœ inny, umrze.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = "Œwiêta Aura Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_amulettofdeath_mis;
	on_unequip = unequip_itam_amulettofdeath_mis;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Œwiêta aura Innosa.";
	text[2] = "Ten amulet chroni swego posiadacza";
	text[3] = "przed wszelkimi obra¿eniami.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void unequip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
};


instance ITPO_HEALRANDOLPH_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healrandolph;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Leczenie z na³ogu";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};

