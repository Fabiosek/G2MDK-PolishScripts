
const int AM_EYEPROTEDGE = 10;
const int AM_EYEPROTPOINT = 10;
const int AM_EYEPROTMAGE = 20;
const int AM_EYEPROTFIRE = 30;

instance ITMI_INNOSEYE_MIS(C_ITEM)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	on_equip = equip_innoseye;
	on_unequip = unequip_innoseye;
	text[0] = "Pulsuje energi¹.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_innoseye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] += AM_EYEPROTEDGE;
	self.protection[PROT_POINT] += AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] += AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] += AM_EYEPROTMAGE;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void unequip_innoseye()
{
	self.protection[PROT_EDGE] -= AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_EYEPROTEDGE;
	self.protection[PROT_POINT] -= AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] -= AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_EYEPROTMAGE;
};


instance ITMI_INNOSEYE_DISCHARGED_MIS(C_ITEM)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_discharged_mis;
	text[0] = "Oko jest martwe i pozbawione blasku.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_discharged_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITMI_INNOSEYE_BROKEN_MIS(C_ITEM)
{
	name = "Oko Innosa";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_broken_mis;
	text[0] = TEXT_INNOSEYE_SETTING;
	text[1] = TEXT_INNOSEYE_GEM;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_broken_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITWR_PERMISSIONTOWEARINNOSEYE_MIS(C_ITEM)
{
	name = "List polecaj¹cy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "List polecaj¹cy dla Pyrokara.";
};


func void use_permissiontowearinnoseye()
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
	Doc_PrintLines(ndocid,0,"Posiadacz tego listu ma zostaæ wpuszczony do œwiêtych sal klasztoru.");
	Doc_PrintLines(ndocid,0,"Oko Innosa ma mu zostaæ wydane w trybie natychmiastowym.");
	Doc_PrintLines(ndocid,0,"Niniejsze rozkazy wydajê jako zarz¹dca wyspy i reprezentant w³adzy królewskiej. Ich podstaw¹ prawn¹ jest uk³ad o podziale Koœcio³a Innosa z 2 roku Ognia.");
	Doc_PrintLines(ndocid,0,"Oczekujê zatem, ¿e zostan¹ one natychmiast wprowadzone w ¿ycie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niechaj Innos b³ogos³awi Króla");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lord Hagen");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
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
	on_state[0] = use_xardasbookforpyrokar;
};


func void use_xardasbookforpyrokar()
{
	Print(PRINT_IRDORATHBOOKDOESNTOPEN);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITKE_CHEST_SEKOB_XARDASBOOK_MIS(C_ITEM)
{
	name = "Klucz Xardasa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "do kufra na farmie Sekoba.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "Dziennik";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Dziennik";
	text[0] = "Dziennik Corneliusa.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	CORNELIUS_ISLIAR = TRUE;
	b_logentry(TOPIC_RESCUEBENNET,"Oto dowód niewinnoœci Benneta.");
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Jeœli Larius nadal bêdzie postêpowa³ w ten sposób, nic tu po mnie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ostatniej nocy spotka³o mnie coœ dziwnego. Jeden z tych mê¿czyzn w czarnych kapturach z³o¿y³ mi wizytê. Podobno s¹ oni s³ugami z³a, jednak mój goœæ mia³ w sobie coœ, co budzi³o zaufanie. Niemal czu³em bij¹c¹ od niego moc, choæ kiedy przemówi³, jego g³os by³ spokojny.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Zaoferowa³ mi 20.000 sztuk z³ota, jeœli doprowadzê do skazania jednego z najemników. Powiedzia³, ¿e nied³ugo zrozumiem, co mia³ na myœli.");
	Doc_PrintLines(ndocid,1,"Oczywiœcie zgodzi³em siê od razu, ci najemnicy i tak nie zas³uguj¹ na nic lepszego. Gdyby nie oni, moje ¿ycie by³oby du¿o ³atwiejsze. A z³oto zapewni mi dobrobyt a¿ do koñca mych dni.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Sta³o siê - aresztowali jednego z najemników. Zamierzam dotrzymaæ danego s³owa.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Almanach Opêtanych";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_dementorobsessionbook;
};


func void use_dementorobsessionbook()
{
	var int ndocid;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_OBSESSIONCOUNTER = 100;
	b_scisobsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
		Doc_PrintLine(ndocid,0,"");
		Doc_SetFont(ndocid,0,FONT_BOOK);
		Doc_PrintLines(ndocid,0,"edef Kon dirandorix");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"in Sparady bell ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"el utoy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kho ray xaondron");
		Doc_PrintLines(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"em piratoram endro");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		if(KAPITEL >= 3)
		{
			Doc_PrintLine(ndocid,1,"          VINO");
			Doc_PrintLine(ndocid,1,"FERNANDO");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     MALAK");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"BROMOR");
		};
		if(KAPITEL >= 4)
		{
			Doc_PrintLine(ndocid,1,"          ENGROM");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     RANDOLPH");
			Doc_PrintLine(ndocid,1,"");
		};
		if(KAPITEL >= 5)
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"          SEKOB");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"     BRUTUS");
			Doc_PrintLine(ndocid,1,"");
		};
		Doc_Show(ndocid);
	};
};


instance ITWR_PYROKARSOBSESSIONLIST(C_ITEM)
{
	name = "Magiczny list Pyrokara";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pyrokarsobsessionlist;
	scemename = "MAP";
	description = name;
};


func void use_pyrokarsobsessionlist()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Opêtani");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	if(KAPITEL >= 3)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"FERNANDO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"VINO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"MALAK");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BROMOR");
	};
	if(KAPITEL >= 4)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ENGROM");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"RANDOLPH");
	};
	if(KAPITEL >= 5)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"SEKOB");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BRUTUS");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
	};
	Doc_Show(ndocid);
};


instance ITPO_HEALHILDA_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healhilda;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Uzdrowienie czarnej gor¹czki";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healhilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITMW_MALETHSGEHSTOCK_MIS(C_ITEM)
{
	name = "Laska";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_VLKMACE;
	damagetotal = DAMAGE_VLKMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "Na ga³ce wygrawerowano";
	text[1] = "literê 'M'.";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_MALETHSBANDITGOLD(C_ITEM)
{
	name = "Sakwa pe³na z³ota!";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_malethsbanditgold;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_malethsbanditgold()
{
	b_playerfinditem(itmi_gold,300);
};


instance ITMI_MOLERATLUBRIC_MIS(C_ITEM)
{
	name = "£ój kretoszczura";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[4] = NAME_VALUE;
	count[4] = value;
};

instance ITWR_BABOSLETTER_MIS(C_ITEM)
{
	name = "List do Babo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosletter;
	scemename = "MAP";
	description = "List do Babo.";
};


func void use_babosletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Drogi Babo,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"pewnie zastanawiasz siê, jak napisa³yœmy ten list. Otó¿ zabra³yœmy wszystkie nasze oszczêdnoœci do Mistrza Marlasa i poprosi³yœmy, aby go dla nas napisa³. ¿yczymy ci wszystkiego najlepszego i przesy³amy ten obrazek jako prezent po¿egnalny - niechaj przypomina ci o nas podczas nocy, które spêdzisz w klasztorze.");
	Doc_PrintLines(ndocid,0,"Mamy nadziejê, ¿e lubisz takie obrazki.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Fehta i Bonka");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "Portret kobiety";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "Portret nagiej kobiety.";
};


func void use_babospinup()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Pinup.TGA",0);
	Doc_Show(ndocid);
};


instance ITWR_BABOSDOCS_MIS(C_ITEM)
{
	name = "Zwitek papierów";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Kilka dokumentów";
	text[3] = "zwiniêtych w rulon.";
};


func void use_babosdocs()
{
	BABOSDOCSOPEN = TRUE;
	CreateInvItems(self,itwr_babosletter_mis,1);
	CreateInvItems(self,itwr_babospinup_mis,1);
};


instance ITKE_IGARAZCHEST_MIS(C_ITEM)
{
	name = "Klucz do kufra";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Klucz do kufra";
	text[3] = "nale¿¹cego do Igaraza.";
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "Boska moc gwiazd";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_astronomy;
};


var int astronomy_once;

func void use_astronomy()
{
	var int ndocid;
	if(ASTRONOMY_ONCE == FALSE)
	{
		b_raiseattribute(self,ATR_MANA_MAX,2);
		Print(PRINT_READASTRONOMY);
		ASTRONOMY_ONCE = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...jednak kiedy upór wo³u po³¹czy siê z przebieg³oœci¹ wojownika, strze¿cie siê, albowiem bêdziecie œwiadkami wielkich zmian.");
	Doc_PrintLines(ndocid,0,"Upór wo³u po³¹czony z wytrwa³oœci¹ wojownika mo¿e zaburzyæ odwieczny porz¹dek. Kosmiczna materia oddzielaj¹ca wymiary staje siê coraz cieñsza i s³absza. Wkrótce nie bêdzie w stanie powstrzymaæ istot Beliara przed wdarciem siê do naszej rzeczywistoœci.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"W pradawnych czasach, kiedy oba œwiaty by³y po³¹czone siln¹ wiêzi¹, s³udzy Z³a mogli bez przeszkód pl¹drowaæ nasze ziemie, i tylko moc Innosa oraz jego Wybrañca pozwoli³a nam odeprzeæ ataki Wroga.");
	Doc_PrintLines(ndocid,1,"Jeœli taka sytuacja siê powtórzy, niechaj Innos ma nas w swej opiece, albowiem od stuleci nie by³o poœród nas jego Wybrañca.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


var int sc_obsessiontimes;

instance ITPO_HEALOBSESSION_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healobsession;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Uleczenie z opêtania";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healobsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
	SC_OBSESSIONTIMES = SC_OBSESSIONTIMES + 1;
	b_clearscobsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ITSE_GOLEMCHEST_MIS(C_ITEM)
{
	name = "Skórzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_golemchest;
	description = "Skórzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "W sakwie pe³no jest z³ota.";
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_golemchest()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Print(PRINT_FOUNDRING);
	CreateInvItems(hero,itri_prot_total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS(C_ITEM)
{
	name = "Bardzo stara mapa.";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_shatteredgolem_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_shatteredgolem_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_shatteredgolem_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_DIEGOSLETTER_MIS(C_ITEM)
{
	name = "List od Diega";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_diegosletter_mis;
	scemename = "MAP";
	description = "List Diega do Gerbrandta.";
};


func void use_diegosletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Gerbrandt, ");
	Doc_PrintLines(ndocid,0,"pope³ni³eœ b³¹d, nie zabijaj¹c mnie...");
	Doc_PrintLines(ndocid,0,"Wróci³em do miasta i nied³ugo siê spotkamy, a wtedy posiekam ciê na plasterki. Znasz mnie wystarczaj¹co d³ugo, by wiedzieæ, ¿e nie ¿artujê.");
	Doc_PrintLines(ndocid,0,"Nie przypuszcza³eœ pewnie, ¿e mogê jeszcze wróciæ zza Bariery. To b³¹d...");
	Doc_PrintLines(ndocid,0,"Wróci³em, by odzyskaæ, co moje.");
	Doc_PrintLines(ndocid,0,"Jeœli ¿ycie ci mi³e, uciekaj czym prêdzej z miasta. A ja przejmê twój interes. W ten sposób bêdziemy kwita.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Diego");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = "Wype³niona skórzana torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_diegostreasure;
	description = "Stara, skórzana torba Diega.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_diegostreasure()
{
	OPENEDDIEGOSBAG = TRUE;
	b_playerfinditem(itmi_gold,DIEGOSTREASURE);
};


instance ITMI_ULTHARSHOLYWATER_MIS(C_ITEM)
{
	name = "Woda œwiêcona Ulthara";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int itwr_minenanteil_mis_onetime;

instance ITWR_MINENANTEIL_MIS(C_ITEM)
{
	name = "Udzia³ w kopalni rudy Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_minenanteil_mis;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_minenanteil_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"Udzia³ w kopalni rudy");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Na mocy królewskiego Aktu W³asnoœci, wystawionego na czêœæ ziem królewskich, posiadacz tego dokumentu mo¿e eksploatowaæ surowce tych ziem,");
	Doc_PrintLines(ndocid,0,"na obszarze nie wiêkszym jednak ni¿ jeden ar królewski.");
	Doc_PrintLines(ndocid,0,"Na mocy Prawa o Miarach ar królewski równa siê powierzchni¹ fragmentowi terenu o szerokoœci 16 kroków i d³ugoœci 3.");
	Doc_PrintLines(ndocid,0,"Posiadacz tego dokumentu zostaje nadto zwolniony z obowi¹zków nak³adanych przez prawa swobody dostêpu,");
	Doc_PrintLines(ndocid,0,"jeœli jednak nie zdo³a uiœciæ op³aty za u¿ytkowane ziemie, to powróc¹ one na w³asnoœæ Korony.");
	Doc_PrintLine(ndocid,0,"         Podpisano");
	Doc_PrintLine(ndocid,0,"         Rz¹dca królewski,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                Salandril");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"Goœæ, który sprzeda³ te udzia³y kupcom, ma na imiê Salandril. Pewnie naj³atwiej go bêdzie znaleŸæ w górnym Khorinis - chyba ¿e ju¿ zwia³ przed d³ugim ramieniem sprawiedliwoœci.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Salandril nie ¿yje. Trzeba o tym powiedzieæ Serpentesowi.");
		};
		ITWR_MINENANTEIL_MIS_ONETIME = TRUE;
	};
};


instance ITAM_PROT_BLACKEYE_MIS(C_ITEM)
{
	name = "Amulet przyzywania dusz";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = name;
	text[2] = "";
	text[3] = "Ochrona przed Czarnym Spojrzeniem";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "Kamieñ z poœwiêconej ziemi";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_RICHTERKOMPROBRIEF_MIS(C_ITEM)
{
	name = "Zlecenie sêdziego";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_richterkomprobrief;
	scemename = "MAP";
	description = name;
};


func void use_richterkomprobrief()
{
	var int ndocid;
	SCKNOWSRICHTERKOMPROBRIEF = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Morgahard - ty robaku! Lepiej rób, co ci ka¿ê, albo inaczej sobie pogadamy. Byæ mo¿e nawet bêdê musia³ was aresztowaæ.");
	Doc_PrintLines(ndocid,0,"Sprawê trzeba za³atwiæ jutro w nocy, Larius coœ podejrzewa.");
	Doc_PrintLines(ndocid,0,"Jeœli teraz nie wyci¹gniemy od niego forsy, to mo¿e nie byæ kolejnej okazji. Zadbam o to, abyœcie go spotkali wieczorem na targowisku.");
	Doc_PrintLines(ndocid,0,"Tylko nie róbcie ha³asu. Chyba nie chcecie, ¿eby wsiedli na was stra¿nicy?");
	Doc_PrintLines(ndocid,0,"A gdyby mia³ go spotkaæ jakiœ nieszczêœliwy wypadek, to ja p³aka³ nie bêdê.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          G³ówny sêdzia i ");
	Doc_PrintLine(ndocid,0,"          królewski sekretarz");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MORGAHARDTIP(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_morgahardtip;
	scemename = "MAP";
	description = name;
};


func void use_morgahardtip()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Zrobi³em to. Mam nadziejê, ¿e spotkamy siê jeszcze, gdy ca³e zamieszanie przycichnie.");
	Doc_PrintLines(ndocid,0,"Nie martwcie siê. Jeœli wszystko zawiedzie, poproszê Onara o za³atwienie sprawy.");
	Doc_PrintLines(ndocid,0,"Wszystko bêdzie w porz¹dku.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     M.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Mapa œwiêtych kapliczek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_shrine_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_shrine_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_shrine_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_VINOSKELLERGEISTER_MIS(C_ITEM)
{
	name = "Duch wina";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_vinoskellergeister_mis;
};


func void use_vinoskellergeister_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Potêga winnego grona");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...W swoim czasie spróbowa³em niejednego, ale ten owoc, który dosta³em w zesz³ym tygodniu z zagranicy... przekroczy³ wszystkie oczekiwania...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...sok z tego winnego grona ma bukiet bogatszy ni¿ z jakiegokolwiek innego...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...nie jest Ÿle, ale ca³y czas martwiê siê, ¿e ktoœ mo¿e mnie z³apaæ w mojej tajnej pracowni. Nie mam pojêcia, co zrobiliby stra¿nicy, gdyby siê o tym wszystkim dowiedzieli. Byæ mo¿e wyrzuciliby mnie poza Barierê...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...Nabrali podejrzeñ. Muszê wszystko zostawiæ, dopóki sprawa troszkê nie przycichnie i nie nabiorê pewnoœci, ¿e nikt mnie ju¿ nie podejrzewa...");
	Doc_Show(ndocid);
};

