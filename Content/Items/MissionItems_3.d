
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
	text[0] = "Pulsuje energi�.";
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
	name = "List polecaj�cy";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "List polecaj�cy dla Pyrokara.";
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
	Doc_PrintLines(ndocid,0,"Posiadacz tego listu ma zosta� wpuszczony do �wi�tych sal klasztoru.");
	Doc_PrintLines(ndocid,0,"Oko Innosa ma mu zosta� wydane w trybie natychmiastowym.");
	Doc_PrintLines(ndocid,0,"Niniejsze rozkazy wydaj� jako zarz�dca wyspy i reprezentant w�adzy kr�lewskiej. Ich podstaw� prawn� jest uk�ad o podziale Ko�cio�a Innosa z 2 roku Ognia.");
	Doc_PrintLines(ndocid,0,"Oczekuj� zatem, �e zostan� one natychmiast wprowadzone w �ycie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Niechaj Innos b�ogos�awi Kr�la");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Lord Hagen");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "Dw�r Irdorath";
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
	b_logentry(TOPIC_RESCUEBENNET,"Oto dow�d niewinno�ci Benneta.");
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Je�li Larius nadal b�dzie post�powa� w ten spos�b, nic tu po mnie.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ostatniej nocy spotka�o mnie co� dziwnego. Jeden z tych m�czyzn w czarnych kapturach z�o�y� mi wizyt�. Podobno s� oni s�ugami z�a, jednak m�j go�� mia� w sobie co�, co budzi�o zaufanie. Niemal czu�em bij�c� od niego moc, cho� kiedy przem�wi�, jego g�os by� spokojny.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Zaoferowa� mi 20.000 sztuk z�ota, je�li doprowadz� do skazania jednego z najemnik�w. Powiedzia�, �e nied�ugo zrozumiem, co mia� na my�li.");
	Doc_PrintLines(ndocid,1,"Oczywi�cie zgodzi�em si� od razu, ci najemnicy i tak nie zas�uguj� na nic lepszego. Gdyby nie oni, moje �ycie by�oby du�o �atwiejsze. A z�oto zapewni mi dobrobyt a� do ko�ca mych dni.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Sta�o si� - aresztowali jednego z najemnik�w. Zamierzam dotrzyma� danego s�owa.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Almanach Op�tanych";
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
	Doc_PrintLine(ndocid,0,"Op�tani");
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
	description = "Uzdrowienie czarnej gor�czki";
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
	text[0] = "Na ga�ce wygrawerowano";
	text[1] = "liter� 'M'.";
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
	name = "Sakwa pe�na z�ota!";
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
	name = "��j kretoszczura";
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
	Doc_PrintLines(ndocid,0,"pewnie zastanawiasz si�, jak napisa�y�my ten list. Ot� zabra�y�my wszystkie nasze oszcz�dno�ci do Mistrza Marlasa i poprosi�y�my, aby go dla nas napisa�. �yczymy ci wszystkiego najlepszego i przesy�amy ten obrazek jako prezent po�egnalny - niechaj przypomina ci o nas podczas nocy, kt�re sp�dzisz w klasztorze.");
	Doc_PrintLines(ndocid,0,"Mamy nadziej�, �e lubisz takie obrazki.");
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
	name = "Zwitek papier�w";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Kilka dokument�w";
	text[3] = "zwini�tych w rulon.";
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
	text[3] = "nale��cego do Igaraza.";
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
	Doc_PrintLines(ndocid,0,"...jednak kiedy up�r wo�u po��czy si� z przebieg�o�ci� wojownika, strze�cie si�, albowiem b�dziecie �wiadkami wielkich zmian.");
	Doc_PrintLines(ndocid,0,"Up�r wo�u po��czony z wytrwa�o�ci� wojownika mo�e zaburzy� odwieczny porz�dek. Kosmiczna materia oddzielaj�ca wymiary staje si� coraz cie�sza i s�absza. Wkr�tce nie b�dzie w stanie powstrzyma� istot Beliara przed wdarciem si� do naszej rzeczywisto�ci.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"W pradawnych czasach, kiedy oba �wiaty by�y po��czone siln� wi�zi�, s�udzy Z�a mogli bez przeszk�d pl�drowa� nasze ziemie, i tylko moc Innosa oraz jego Wybra�ca pozwoli�a nam odeprze� ataki Wroga.");
	Doc_PrintLines(ndocid,1,"Je�li taka sytuacja si� powt�rzy, niechaj Innos ma nas w swej opiece, albowiem od stuleci nie by�o po�r�d nas jego Wybra�ca.");
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
	description = "Uleczenie z op�tania";
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
	name = "Sk�rzany mieszek";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_golemchest;
	description = "Sk�rzany mieszek.";
	text[0] = "";
	text[1] = "";
	text[2] = "W sakwie pe�no jest z�ota.";
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
	Doc_PrintLines(ndocid,0,"pope�ni�e� b��d, nie zabijaj�c mnie...");
	Doc_PrintLines(ndocid,0,"Wr�ci�em do miasta i nied�ugo si� spotkamy, a wtedy posiekam ci� na plasterki. Znasz mnie wystarczaj�co d�ugo, by wiedzie�, �e nie �artuj�.");
	Doc_PrintLines(ndocid,0,"Nie przypuszcza�e� pewnie, �e mog� jeszcze wr�ci� zza Bariery. To b��d...");
	Doc_PrintLines(ndocid,0,"Wr�ci�em, by odzyska�, co moje.");
	Doc_PrintLines(ndocid,0,"Je�li �ycie ci mi�e, uciekaj czym pr�dzej z miasta. A ja przejm� tw�j interes. W ten spos�b b�dziemy kwita.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Diego");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = "Wype�niona sk�rzana torba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_diegostreasure;
	description = "Stara, sk�rzana torba Diega.";
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
	name = "Woda �wi�cona Ulthara";
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
	name = "Udzia� w kopalni rudy Khorinis";
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
	Doc_PrintLine(ndocid,0,"Udzia� w kopalni rudy");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Na mocy kr�lewskiego Aktu W�asno�ci, wystawionego na cz�� ziem kr�lewskich, posiadacz tego dokumentu mo�e eksploatowa� surowce tych ziem,");
	Doc_PrintLines(ndocid,0,"na obszarze nie wi�kszym jednak ni� jeden ar kr�lewski.");
	Doc_PrintLines(ndocid,0,"Na mocy Prawa o Miarach ar kr�lewski r�wna si� powierzchni� fragmentowi terenu o szeroko�ci 16 krok�w i d�ugo�ci 3.");
	Doc_PrintLines(ndocid,0,"Posiadacz tego dokumentu zostaje nadto zwolniony z obowi�zk�w nak�adanych przez prawa swobody dost�pu,");
	Doc_PrintLines(ndocid,0,"je�li jednak nie zdo�a ui�ci� op�aty za u�ytkowane ziemie, to powr�c� one na w�asno�� Korony.");
	Doc_PrintLine(ndocid,0,"         Podpisano");
	Doc_PrintLine(ndocid,0,"         Rz�dca kr�lewski,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                Salandril");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"Go��, kt�ry sprzeda� te udzia�y kupcom, ma na imi� Salandril. Pewnie naj�atwiej go b�dzie znale�� w g�rnym Khorinis - chyba �e ju� zwia� przed d�ugim ramieniem sprawiedliwo�ci.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Salandril nie �yje. Trzeba o tym powiedzie� Serpentesowi.");
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
	name = "Kamie� z po�wi�conej ziemi";
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
	name = "Zlecenie s�dziego";
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
	Doc_PrintLines(ndocid,0,"Morgahard - ty robaku! Lepiej r�b, co ci ka��, albo inaczej sobie pogadamy. By� mo�e nawet b�d� musia� was aresztowa�.");
	Doc_PrintLines(ndocid,0,"Spraw� trzeba za�atwi� jutro w nocy, Larius co� podejrzewa.");
	Doc_PrintLines(ndocid,0,"Je�li teraz nie wyci�gniemy od niego forsy, to mo�e nie by� kolejnej okazji. Zadbam o to, aby�cie go spotkali wieczorem na targowisku.");
	Doc_PrintLines(ndocid,0,"Tylko nie r�bcie ha�asu. Chyba nie chcecie, �eby wsiedli na was stra�nicy?");
	Doc_PrintLines(ndocid,0,"A gdyby mia� go spotka� jaki� nieszcz�liwy wypadek, to ja p�aka� nie b�d�.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          G��wny s�dzia i ");
	Doc_PrintLine(ndocid,0,"          kr�lewski sekretarz");
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
	Doc_PrintLines(ndocid,0,"Zrobi�em to. Mam nadziej�, �e spotkamy si� jeszcze, gdy ca�e zamieszanie przycichnie.");
	Doc_PrintLines(ndocid,0,"Nie martwcie si�. Je�li wszystko zawiedzie, poprosz� Onara o za�atwienie sprawy.");
	Doc_PrintLines(ndocid,0,"Wszystko b�dzie w porz�dku.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     M.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Mapa �wi�tych kapliczek";
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
	Doc_PrintLines(ndocid,0,"Pot�ga winnego grona");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...W swoim czasie spr�bowa�em niejednego, ale ten owoc, kt�ry dosta�em w zesz�ym tygodniu z zagranicy... przekroczy� wszystkie oczekiwania...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...sok z tego winnego grona ma bukiet bogatszy ni� z jakiegokolwiek innego...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...nie jest �le, ale ca�y czas martwi� si�, �e kto� mo�e mnie z�apa� w mojej tajnej pracowni. Nie mam poj�cia, co zrobiliby stra�nicy, gdyby si� o tym wszystkim dowiedzieli. By� mo�e wyrzuciliby mnie poza Barier�...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"...Nabrali podejrze�. Musz� wszystko zostawi�, dop�ki sprawa troszk� nie przycichnie i nie nabior� pewno�ci, �e nikt mnie ju� nie podejrzewa...");
	Doc_Show(ndocid);
};

