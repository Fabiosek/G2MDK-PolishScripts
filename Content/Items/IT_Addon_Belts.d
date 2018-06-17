
const int VALUE_ITBE_ADDON_LEATHER_01 = 250;
const int VALUE_ITBE_ADDON_LEATHER_02 = 250;
const int VALUE_ITBE_ADDON_SLD_01 = 250;
const int VALUE_ITBE_ADDON_NOV_01 = 250;
const int VALUE_ITBE_ADDON_MIL_01 = 250;
const int VALUE_ITBE_ADDON_KDF_01 = 250;
const int VALUE_ITBE_ADDON_MC = 250;
const int VALUE_ITBE_ADDON_STR_5 = 500;
const int VALUE_ITBE_ADDON_STR_10 = 1000;
const int VALUE_ITBE_ADDON_DEX_5 = 500;
const int VALUE_ITBE_ADDON_DEX_10 = 1000;
const int VALUE_ITBE_ADDON_PROT_EDGE = 500;
const int VALUE_ITBE_ADDON_PROT_POINT = 500;
const int VALUE_ITBE_ADDON_PROT_MAGIC = 500;
const int VALUE_ITBE_ADDON_PROT_FIRE = 500;
const int VALUE_ITBE_ADDON_PROT_EDGPOI = 1000;
const int VALUE_ITBE_ADDON_PROT_TOTAL = 2000;
const int BA_BONUS01 = 5;
const int BA_BONUS02 = 5;
const int BELT_PROT_01 = 5;
const int BELTBONUS_STR01 = 5;
const int BELTBONUS_STR02 = 10;
const int BELTBONUS_DEX01 = 5;
const int BELTBONUS_DEX02 = 10;
const int BELTBONUS_PROTEDGE = 10;
const int BELTBONUS_PROTPOINT = 10;
const int BELTBONUS_PROTMAGIC = 10;
const int BELTBONUS_PROTFIRE = 10;
const int BELTBONUS_PROTEDGPOI = 7;
const int BELTBONUS_PROTTOTAL = 7;

instance ITBE_ADDON_LEATHER_01(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_leather_01;
	visual = "ItMI_Belt_06.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_leather_01;
	on_unequip = unequip_itbe_addon_leather_01;
	description = "Skórzany pas";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARLEATHER;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_leather_01()
{
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(Npc_IsPlayer(self))
	{
		LEATHER01_EQUIPPED = TRUE;
		if(LEATHERARMOR_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS02;
			self.protection[PROT_FIRE] += BA_BONUS02;
		};
	};
};

func void unequip_itbe_addon_leather_01()
{
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(Npc_IsPlayer(self))
	{
		LEATHER01_EQUIPPED = FALSE;
		if(LEATHERARMOR_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS02;
			self.protection[PROT_FIRE] -= BA_BONUS02;
		};
	};
};


instance ITBE_ADDON_SLD_01(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_sld_01;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_sld_01;
	on_unequip = unequip_itbe_addon_sld_01;
	description = "Pas najemnika";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARSLD;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_sld_01()
{
	SLD01_EQUIPPED = TRUE;
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(SLDARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] += BA_BONUS01;
		self.protection[PROT_BLUNT] += BA_BONUS01;
		self.protection[PROT_POINT] += BA_BONUS01;
		self.protection[PROT_MAGIC] += BA_BONUS02;
		self.protection[PROT_FIRE] += BA_BONUS02;
	};
};

func void unequip_itbe_addon_sld_01()
{
	SLD01_EQUIPPED = FALSE;
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(SLDARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_BONUS01;
		self.protection[PROT_BLUNT] -= BA_BONUS01;
		self.protection[PROT_POINT] -= BA_BONUS01;
		self.protection[PROT_MAGIC] -= BA_BONUS02;
		self.protection[PROT_FIRE] -= BA_BONUS02;
	};
};


instance ITBE_ADDON_NOV_01(C_ITEM)
{
	name = NAME_ADDON_BELTMAGE;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_nov_01;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_nov_01;
	on_unequip = unequip_itbe_addon_nov_01;
	description = "Szarfa Gotowoœci";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARNOV;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_nov_01()
{
	NOV01_EQUIPPED = TRUE;
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(NOVARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] += BA_BONUS01;
		self.protection[PROT_BLUNT] += BA_BONUS01;
		self.protection[PROT_POINT] += BA_BONUS01;
		self.protection[PROT_MAGIC] += BA_BONUS02;
		self.protection[PROT_FIRE] += BA_BONUS02;
	};
};

func void unequip_itbe_addon_nov_01()
{
	NOV01_EQUIPPED = FALSE;
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(NOVARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_BONUS01;
		self.protection[PROT_BLUNT] -= BA_BONUS01;
		self.protection[PROT_POINT] -= BA_BONUS01;
		self.protection[PROT_MAGIC] -= BA_BONUS02;
		self.protection[PROT_FIRE] -= BA_BONUS02;
	};
};


instance ITBE_ADDON_MIL_01(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_mil_01;
	visual = "ItMi_Belt_03.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_mil_01;
	on_unequip = unequip_itbe_addon_mil_01;
	description = "Pas stra¿y";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARMIL;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_mil_01()
{
	MIL01_EQUIPPED = TRUE;
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(MILARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] += BA_BONUS01;
		self.protection[PROT_BLUNT] += BA_BONUS01;
		self.protection[PROT_POINT] += BA_BONUS01;
		self.protection[PROT_MAGIC] += BA_BONUS02;
		self.protection[PROT_FIRE] += BA_BONUS02;
	};
};

func void unequip_itbe_addon_mil_01()
{
	MIL01_EQUIPPED = FALSE;
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(MILARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_BONUS01;
		self.protection[PROT_BLUNT] -= BA_BONUS01;
		self.protection[PROT_POINT] -= BA_BONUS01;
		self.protection[PROT_MAGIC] -= BA_BONUS02;
		self.protection[PROT_FIRE] -= BA_BONUS02;
	};
};


instance ITBE_ADDON_KDF_01(C_ITEM)
{
	name = NAME_ADDON_BELTMAGE;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_kdf_01;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_kdf_01;
	on_unequip = unequip_itbe_addon_kdf_01;
	description = "Szarfa Ognia";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARKDF;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_kdf_01()
{
	KDF01_EQUIPPED = TRUE;
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(KDFARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] += BA_BONUS01;
		self.protection[PROT_BLUNT] += BA_BONUS01;
		self.protection[PROT_POINT] += BA_BONUS01;
		self.protection[PROT_MAGIC] += BA_BONUS02;
		self.protection[PROT_FIRE] += BA_BONUS02;
	};
};

func void unequip_itbe_addon_kdf_01()
{
	KDF01_EQUIPPED = FALSE;
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(KDFARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_BONUS01;
		self.protection[PROT_BLUNT] -= BA_BONUS01;
		self.protection[PROT_POINT] -= BA_BONUS01;
		self.protection[PROT_MAGIC] -= BA_BONUS02;
		self.protection[PROT_FIRE] -= BA_BONUS02;
	};
};


instance ITBE_ADDON_MC(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_mc;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_mc;
	on_unequip = unequip_itbe_addon_mc;
	description = "Pas Pe³zacza";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELT_PROT_01;
	text[2] = NAME_PROT_POINT;
	count[2] = BELT_PROT_01;
	text[3] = NAME_ADDON_BEARMC;
	count[3] = BA_BONUS01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_mc()
{
	MC_EQUIPPED = TRUE;
	self.protection[PROT_EDGE] += BELT_PROT_01;
	self.protection[PROT_BLUNT] += BELT_PROT_01;
	self.protection[PROT_POINT] += BELT_PROT_01;
	if(MCARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] += BA_BONUS01;
		self.protection[PROT_BLUNT] += BA_BONUS01;
		self.protection[PROT_POINT] += BA_BONUS01;
		self.protection[PROT_MAGIC] += BA_BONUS01;
		self.protection[PROT_FIRE] += BA_BONUS01;
	};
};

func void unequip_itbe_addon_mc()
{
	MC_EQUIPPED = FALSE;
	self.protection[PROT_EDGE] -= BELT_PROT_01;
	self.protection[PROT_BLUNT] -= BELT_PROT_01;
	self.protection[PROT_POINT] -= BELT_PROT_01;
	if(MCARMOR_EQUIPPED == TRUE)
	{
		self.protection[PROT_EDGE] -= BA_BONUS01;
		self.protection[PROT_BLUNT] -= BA_BONUS01;
		self.protection[PROT_POINT] -= BA_BONUS01;
		self.protection[PROT_MAGIC] -= BA_BONUS02;
		self.protection[PROT_FIRE] -= BA_BONUS02;
	};
};


instance ITBE_ADDON_STR_5(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_str_5;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_str_5;
	on_unequip = unequip_itbe_addon_str_5;
	description = "Pas Si³y";
	text[2] = NAME_BONUS_STR;
	count[2] = BELTBONUS_STR01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_str_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BELTBONUS_STR01);
};

func void unequip_itbe_addon_str_5()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BELTBONUS_STR01);
};


instance ITBE_ADDON_STR_10(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_str_10;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_str_10;
	on_unequip = unequip_itbe_addon_str_10;
	description = "Pas Mocy";
	text[2] = NAME_BONUS_STR;
	count[2] = BELTBONUS_STR02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_str_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,BELTBONUS_STR02);
};

func void unequip_itbe_addon_str_10()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-BELTBONUS_STR02);
};


instance ITBE_ADDON_DEX_5(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_dex_5;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_dex_5;
	on_unequip = unequip_itbe_addon_dex_5;
	description = "Pas Umiejêtnoœci";
	text[2] = NAME_BONUS_DEX;
	count[2] = BELTBONUS_DEX01;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_dex_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BELTBONUS_DEX01);
};

func void unequip_itbe_addon_dex_5()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BELTBONUS_DEX01);
};


instance ITBE_ADDON_DEX_10(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_dex_10;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_dex_10;
	on_unequip = unequip_itbe_addon_dex_10;
	description = "Pas Zrêcznoœci";
	text[2] = NAME_BONUS_DEX;
	count[2] = BELTBONUS_DEX02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_dex_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,BELTBONUS_DEX02);
};

func void unequip_itbe_addon_dex_10()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-BELTBONUS_DEX02);
};


instance ITBE_ADDON_PROT_EDGE(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_prot_edge;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_edge;
	on_unequip = unequip_itbe_addon_prot_edge;
	description = "Pas Ochrony";
	text[2] = NAME_PROT_EDGE;
	count[2] = BELTBONUS_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_edge()
{
	self.protection[PROT_EDGE] += BELTBONUS_PROTEDGE;
	self.protection[PROT_BLUNT] += BELTBONUS_PROTEDGE;
};

func void unequip_itbe_addon_prot_edge()
{
	self.protection[PROT_EDGE] -= BELTBONUS_PROTEDGE;
	self.protection[PROT_BLUNT] -= BELTBONUS_PROTEDGE;
};


instance ITBE_ADDON_PROT_POINT(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_prot_point;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_point;
	on_unequip = unequip_itbe_addon_prot_point;
	description = "Pas Obrony";
	text[2] = NAME_PROT_POINT;
	count[2] = BELTBONUS_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_point()
{
	self.protection[PROT_POINT] += BELTBONUS_PROTPOINT;
};

func void unequip_itbe_addon_prot_point()
{
	self.protection[PROT_POINT] -= BELTBONUS_PROTPOINT;
};


instance ITBE_ADDON_PROT_MAGIC(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_prot_magic;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_magic;
	on_unequip = unequip_itbe_addon_prot_magic;
	description = "Pas Magicznej Obrony";
	text[2] = NAME_PROT_MAGIC;
	count[2] = BELTBONUS_PROTMAGIC;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_magic()
{
	self.protection[PROT_MAGIC] += BELTBONUS_PROTMAGIC;
};

func void unequip_itbe_addon_prot_magic()
{
	self.protection[PROT_MAGIC] -= BELTBONUS_PROTMAGIC;
};


instance ITBE_ADDON_PROT_FIRE(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_prot_fire;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_fire;
	on_unequip = unequip_itbe_addon_prot_fire;
	description = "Pas Ognistego Biegacza";
	text[2] = NAME_PROT_FIRE;
	count[2] = BELTBONUS_PROTFIRE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_fire()
{
	self.protection[PROT_FIRE] += BELTBONUS_PROTFIRE;
};

func void unequip_itbe_addon_prot_fire()
{
	self.protection[PROT_FIRE] -= BELTBONUS_PROTFIRE;
};


instance ITBE_ADDON_PROT_EDGPOI(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MISSION | ITEM_MULTI;
	value = value_itbe_addon_prot_edgpoi;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_edgpoi;
	on_unequip = unequip_itbe_addon_prot_edgpoi;
	description = "Pas Ochrony";
	text[2] = NAME_PROT_EDGE;
	count[2] = BELTBONUS_PROTEDGPOI;
	text[3] = NAME_PROT_POINT;
	count[3] = BELTBONUS_PROTEDGPOI;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_edgpoi()
{
	self.protection[PROT_EDGE] += BELTBONUS_PROTEDGPOI;
	self.protection[PROT_BLUNT] += BELTBONUS_PROTEDGPOI;
	self.protection[PROT_POINT] += BELTBONUS_PROTEDGPOI;
};

func void unequip_itbe_addon_prot_edgpoi()
{
	self.protection[PROT_EDGE] -= BELTBONUS_PROTEDGPOI;
	self.protection[PROT_BLUNT] -= BELTBONUS_PROTEDGPOI;
	self.protection[PROT_POINT] -= BELTBONUS_PROTEDGPOI;
};


instance ITBE_ADDON_PROT_TOTAL(C_ITEM)
{
	name = NAME_ADDON_BELT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = value_itbe_addon_prot_total;
	visual = "ItMi_Belt_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addon_prot_total;
	on_unequip = unequip_itbe_addon_prot_total;
	description = "Pas Stra¿nika";
	text[1] = NAME_PROT_EDGE;
	count[1] = BELTBONUS_PROTTOTAL;
	text[2] = NAME_PROT_POINT;
	count[2] = BELTBONUS_PROTTOTAL;
	text[3] = NAME_PROT_MAGIC;
	count[3] = BELTBONUS_PROTTOTAL;
	text[4] = NAME_PROT_FIRE;
	count[4] = BELTBONUS_PROTTOTAL;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addon_prot_total()
{
	self.protection[PROT_EDGE] += BELTBONUS_PROTTOTAL;
	self.protection[PROT_BLUNT] += BELTBONUS_PROTTOTAL;
	self.protection[PROT_POINT] += BELTBONUS_PROTTOTAL;
	self.protection[PROT_MAGIC] += BELTBONUS_PROTTOTAL;
	self.protection[PROT_FIRE] += BELTBONUS_PROTTOTAL;
};

func void unequip_itbe_addon_prot_total()
{
	self.protection[PROT_EDGE] -= BELTBONUS_PROTTOTAL;
	self.protection[PROT_BLUNT] -= BELTBONUS_PROTTOTAL;
	self.protection[PROT_POINT] -= BELTBONUS_PROTTOTAL;
	self.protection[PROT_MAGIC] -= BELTBONUS_PROTTOTAL;
	self.protection[PROT_FIRE] -= BELTBONUS_PROTTOTAL;
};

