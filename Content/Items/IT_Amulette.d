
const int VALUE_AM_PROTFIRE = 600;
const int AM_PROTFIRE = 10;
const int VALUE_AM_PROTEDGE = 800;
const int AM_PROTEDGE = 10;
const int VALUE_AM_PROTMAGE = 700;
const int AM_PROTMAGE = 10;
const int VALUE_AM_PROTPOINT = 500;
const int AM_PROTPOINT = 10;
const int VALUE_AM_PROTTOTAL = 1000;
const int AM_TPROTFIRE = 8;
const int AM_TPROTEDGE = 8;
const int AM_TPROTMAGE = 8;
const int AM_TPROTPOINT = 8;
const int VALUE_AM_DEX = 1000;
const int AM_DEX = 10;
const int VALUE_AM_MANA = 1000;
const int AM_MANA = 10;
const int VALUE_AM_STRG = 1000;
const int AM_STRG = 10;
const int VALUE_AM_HP = 400;
const int AM_HP = 40;
const int VALUE_AM_HPMANA = 1300;
const int AM_HPMANA_HP = 30;
const int AM_HPMANA_MANA = 10;
const int VALUE_AM_DEXSTRG = 1600;
const int AM_DEXSTRG_DEX = 8;
const int AM_DEXSTRG_STRG = 8;

instance ITAM_PROT_FIRE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTFIRE;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_fire_01;
	on_unequip = unequip_itam_prot_fire_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet ognia";
	text[2] = NAME_PROT_FIRE;
	count[2] = AM_PROTFIRE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_fire_01()
{
	self.protection[PROT_FIRE] += AM_PROTFIRE;
};

func void unequip_itam_prot_fire_01()
{
	self.protection[PROT_FIRE] -= AM_PROTFIRE;
};


instance ITAM_PROT_EDGE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTEDGE;
	visual = "ItAm_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_edge_01;
	on_unequip = unequip_itam_prot_edge_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet pancerza";
	text[2] = NAME_PROT_EDGE;
	count[2] = AM_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_edge_01()
{
	self.protection[PROT_EDGE] += AM_PROTEDGE;
	self.protection[PROT_BLUNT] += AM_PROTEDGE;
};

func void unequip_itam_prot_edge_01()
{
	self.protection[PROT_EDGE] -= AM_PROTEDGE;
	self.protection[PROT_BLUNT] -= AM_PROTEDGE;
};


instance ITAM_PROT_POINT_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTPOINT;
	visual = "ItAm_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_point_01;
	on_unequip = unequip_itam_prot_point_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet d�bowej sk�ry";
	text[2] = NAME_PROT_POINT;
	count[2] = AM_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_point_01()
{
	self.protection[PROT_POINT] += AM_PROTPOINT;
};

func void unequip_itam_prot_point_01()
{
	self.protection[PROT_POINT] -= AM_PROTPOINT;
};


instance ITAM_PROT_MAGE_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTMAGE;
	visual = "ItAm_Prot_Mage_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_prot_mage_01;
	on_unequip = unequip_itam_prot_mage_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet duchowej si�y";
	text[2] = NAME_PROT_MAGIC;
	count[2] = AM_PROTMAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_prot_mage_01()
{
	self.protection[PROT_MAGIC] += AM_PROTMAGE;
};

func void unequip_itam_prot_mage_01()
{
	self.protection[PROT_MAGIC] -= AM_PROTMAGE;
};


instance ITAM_PROT_TOTAL_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_PROTTOTAL;
	visual = "ItAm_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_value_am_prottotal;
	on_unequip = unequip_value_am_prottotal;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet magicznego pancerza";
	text[1] = NAME_PROT_FIRE;
	count[1] = AM_TPROTFIRE;
	text[2] = NAME_PROT_MAGIC;
	count[2] = AM_TPROTMAGE;
	text[3] = NAME_PROT_POINT;
	count[3] = AM_TPROTPOINT;
	text[4] = NAME_PROT_EDGE;
	count[4] = AM_TPROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_value_am_prottotal()
{
	self.protection[PROT_EDGE] += AM_TPROTEDGE;
	self.protection[PROT_BLUNT] += AM_TPROTEDGE;
	self.protection[PROT_POINT] += AM_TPROTPOINT;
	self.protection[PROT_FIRE] += AM_TPROTFIRE;
	self.protection[PROT_MAGIC] += AM_TPROTMAGE;
};

func void unequip_value_am_prottotal()
{
	self.protection[PROT_EDGE] -= AM_TPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_TPROTEDGE;
	self.protection[PROT_POINT] -= AM_TPROTPOINT;
	self.protection[PROT_FIRE] -= AM_TPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_TPROTMAGE;
};


instance ITAM_DEX_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEX;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_dex_01;
	on_unequip = unequip_itam_dex_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet zwinno�ci";
	text[2] = NAME_BONUS_DEX;
	count[2] = AM_DEX;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,AM_DEX);
};

func void unequip_itam_dex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-AM_DEX);
};


instance ITAM_STRG_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_STRG;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_strg_01;
	on_unequip = unequip_itam_strg_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet si�y";
	text[2] = NAME_BONUS_STR;
	count[2] = AM_STRG;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,AM_STRG);
};

func void unequip_itam_strg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-AM_STRG);
};


instance ITAM_HP_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_HP;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_hp_01;
	on_unequip = unequip_itam_hp_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet �ycia";
	text[2] = NAME_BONUS_HP;
	count[2] = AM_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + AM_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + AM_HP;
};

func void unequip_itam_hp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - AM_HP;
	if(self.attribute[ATR_HITPOINTS] > (AM_HP + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - AM_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_MANA_01(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_MANA;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_mana_01;
	on_unequip = unequip_itam_mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet magii";
	text[2] = NAME_BONUS_MANA;
	count[2] = AM_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + AM_MANA;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + AM_MANA;
};

func void unequip_itam_mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - AM_MANA;
	if(self.attribute[ATR_MANA] > AM_MANA)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_MANA;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITAM_DEX_STRG_01(C_ITEM)
{
	name = "Amulet mocy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_DEXSTRG;
	visual = "ItAm_Dex_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_dex_strg_01;
	on_unequip = unequip_itam_dex_strg_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet mocy";
	text[2] = NAME_BONUS_DEX;
	count[2] = AM_DEXSTRG_DEX;
	text[3] = NAME_BONUS_STR;
	count[3] = AM_DEXSTRG_STRG;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_dex_strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,AM_DEXSTRG_DEX);
	Npc_ChangeAttribute(self,ATR_STRENGTH,AM_DEXSTRG_STRG);
};

func void unequip_itam_dex_strg_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-AM_DEXSTRG_DEX);
	Npc_ChangeAttribute(self,ATR_STRENGTH,-AM_DEXSTRG_STRG);
};


instance ITAM_HP_MANA_01(C_ITEM)
{
	name = "Amulet o�wiecenia";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_hp_mana_01;
	on_unequip = unequip_itam_hp_mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet o�wiecenia";
	text[2] = NAME_BONUS_HP;
	count[2] = AM_HPMANA_HP;
	text[3] = NAME_BONUS_MANA;
	count[3] = AM_HPMANA_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_hp_mana_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + AM_HPMANA_HP;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + AM_HPMANA_HP;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + AM_HPMANA_MANA;
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + AM_HPMANA_MANA;
};

func void unequip_itam_hp_mana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - AM_HPMANA_MANA;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - AM_HPMANA_HP;
	if(self.attribute[ATR_HITPOINTS] > (AM_HPMANA_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - AM_HPMANA_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
	if(self.attribute[ATR_MANA] >= AM_HPMANA_MANA)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_HPMANA_MANA;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};

