
const int VALUE_GOLDNUGGET = 18;
const int VALUE_WHITEPEARL = 120;
const int VALUE_ADDON_JOINT_01 = 60;

instance ITMI_GOLDNUGGET_ADDON(C_ITEM)
{
	name = "Bry³ka z³ota";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDNUGGET;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_ADDON_WHITEPEARL(C_ITEM)
{
	name = "Per³a";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WHITEPEARL;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_ADDON_JOINT_01(C_ITEM)
{
	name = "Zielony nowicjusz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ADDON_JOINT_01;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemename = "JOINT";
	on_state[0] = use_addon_joint_01;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


var int firstjoint;

func void use_addon_joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FIRSTJOINT == FALSE)
		{
			FIRSTJOINT = TRUE;
			b_giveplayerxp(5);
		};
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITMI_BALTRAMPAKET(C_ITEM)
{
	name = "Dostawa Beltrama";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ciê¿ka paczka";
	text[3] = "pe³na dobrych rzeczy";
	text[4] = "od farmera Akila.";
};

instance ITMI_PACKET_BALTRAM4SKIP_ADDON(C_ITEM)
{
	name = "Paczka dla Skipa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Ta ciê¿ka paczka";
	text[3] = "pe³na dobrych rzeczy";
	text[4] = "ma trafiæ do pirata Skipa.";
};

instance ITMI_BROMORSGELD_ADDON(C_ITEM)
{
	name = "Z³ota misa Bromora";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Na dnie misy";
	text[3] = "ostrym narzêdziem ";
	text[4] = "wydrapano imiê 'Bromor'.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_ADDON_CAVALORNSBEUTEL(C_ITEM)
{
	name = "Skórzana torba Cavalorna";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_cavalornsbeutel;
	description = name;
	text[0] = "";
	text[1] = "Przywi¹zana jest do niej wywieszka";
	text[2] = "z imieniem 'Cavalorn',";
	text[3] = "a w œrodku jest bry³a rudy.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cavalornsbeutel()
{
	CreateInvItems(hero,itmi_nugget,1);
	Print(PRINT_FOUNDORENUGGET);
	SC_OPENEDCAVALORNSBEUTEL = TRUE;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"W chacie Cavalorna w Górniczej Dolinie znalaz³em torbê z bry³k¹ rudy. Ten stary drañ na pewno o niej zapomnia³.");
};


instance ITMI_SKULL(C_ITEM)
{
	name = "Czaszka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ITMI_IECELLO(C_ITEM)
{
	name = "Wiolonczela";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemename = "CELLO";
	on_state[0] = use_cello;
	description = name;
};


func void use_cello()
{
};


instance ITMI_IECELLOBOW(C_ITEM)
{
	name = "Smyczek wiolonczeli";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDRUM(C_ITEM)
{
	name = "Bêben";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemename = "PAUKE";
	on_state[0] = use_drum;
	description = name;
};


func void use_drum()
{
};


instance ITMI_IEDRUMSCHEIT(C_ITEM)
{
	name = "Tr¹ba";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemename = "DRUMSCHEIT";
	on_state[0] = use_drumscheit;
	description = name;
};


func void use_drumscheit()
{
};


instance ITMI_IEDRUMSTICK(C_ITEM)
{
	name = "Pa³eczka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDUDELBLAU(C_ITEM)
{
	name = "Niebieskie dudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};


func void use_dudel()
{
};


instance ITMI_IEDUDELGELB(C_ITEM)
{
	name = "¯ó³te dudy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};

instance ITMI_IEHARFE(C_ITEM)
{
	name = "Harfa";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemename = "HARFE";
	on_state[0] = use_harfe;
	description = name;
};


func void use_harfe()
{
};


instance ITMI_IELAUTE(C_ITEM)
{
	name = "Lutnia";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemename = "IELAUTE";
	on_state[0] = use_laute;
	description = name;
};


func void use_laute()
{
};


instance ITMI_ADDON_LENNAR_PAKET(C_ITEM)
{
	name = "Brzêcz¹ca paczka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	on_state[0] = use_lennarpaket;
	material = MAT_LEATHER;
	description = name;
	text[2] = "W œrodku s¹ wytrychy,";
	text[3] = "du¿o wytrychów.";
	text[4] = " ";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_lennarpaket()
{
	b_playerfinditem(itke_lockpick,LENNAR_PICKLOCK_AMOUNT);
	Snd_Play("Geldbeutel");
	LENNARPAKET_OPEN = TRUE;
};


instance ITMI_ZEITSPALT_ADDON(C_ITEM)
{
	name = "Czarna ruda";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemename = "MAPSEALED";
	on_state[0] = use_zeitspalt_addon;
	material = MAT_STONE;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = name;
	text[3] = "Dzia³anie nieznane.";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void use_zeitspalt_addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};

