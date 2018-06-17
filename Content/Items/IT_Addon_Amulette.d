
const int VALUE_ITAM_ADDON_FRANCO = 1200;
const int HP_ITAM_ADDON_FRANCO = 40;
const int STR_FRANCO = 4;
const int DEX_FRANCO = 4;
const int VALUE_ITRI_ADDON_HEALTH_01 = 400;
const int VALUE_ITAM_ADDON_HEALTH = 800;
const int VALUE_ITRI_ADDON_MANA_01 = 1000;
const int VALUE_ITAM_ADDON_MANA = 2000;
const int VALUE_ITRI_ADDON_STR_01 = 500;
const int VALUE_ITAM_ADDON_STR = 1000;
const int HP_RING_SOLO_BONUS = 20;
const int HP_RING_DOUBLE_BONUS = 60;
const int HP_AMULETT_SOLO_BONUS = 40;
const int HP_AMULETT_EINRING_BONUS = 80;
const int HP_AMULETT_ARTEFAKT_BONUS = 160;
const int MA_RING_SOLO_BONUS = 5;
const int MA_RING_DOUBLE_BONUS = 15;
const int MA_AMULETT_SOLO_BONUS = 10;
const int MA_AMULETT_EINRING_BONUS = 20;
const int MA_AMULETT_ARTEFAKT_BONUS = 40;
const int STR_RING_SOLO_BONUS = 5;
const int STR_RING_DOUBLE_BONUS = 15;
const int STR_AMULETT_SOLO_BONUS = 10;
const int STR_AMULETT_EINRING_BONUS = 20;
const int STR_AMULETT_ARTEFAKT_BONUS = 40;

instance ITAM_ADDON_FRANCO(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_franco;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_franco;
	on_unequip = unequip_itam_addon_franco;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet Franka";
	text[2] = NAME_BONUS_STR;
	count[2] = STR_FRANCO;
	text[3] = NAME_BONUS_DEX;
	count[3] = DEX_FRANCO;
	text[4] = NAME_BONUS_HP;
	count[4] = hp_itam_addon_franco;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_franco()
{
	self.attribute[ATR_STRENGTH] += STR_FRANCO;
	self.attribute[ATR_DEXTERITY] += DEX_FRANCO;
	self.attribute[ATR_HITPOINTS_MAX] += HP_ITAM_ADDON_FRANCO;
	self.attribute[ATR_HITPOINTS] += HP_ITAM_ADDON_FRANCO;
};

func void unequip_itam_addon_franco()
{
	self.attribute[ATR_STRENGTH] -= STR_FRANCO;
	self.attribute[ATR_DEXTERITY] -= DEX_FRANCO;
	self.attribute[ATR_HITPOINTS_MAX] -= HP_ITAM_ADDON_FRANCO;
	if(self.attribute[ATR_HITPOINTS] > (HP_ITAM_ADDON_FRANCO + 2))
	{
		self.attribute[ATR_HITPOINTS] -= HP_ITAM_ADDON_FRANCO;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_ADDON_HEALTH(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_health;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_health;
	on_unequip = unequip_itam_addon_health;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet Uzdrowiciela";
	text[2] = NAME_BONUS_HP;
	count[2] = HP_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_health()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_AMULETT_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itam_addon_health()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_AMULETT_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_HEALTH_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_health_01;
	on_unequip = unequip_itri_addon_health_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Uzdrowiciela";
	text[2] = NAME_BONUS_HP;
	count[2] = HP_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_health_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_1_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_health_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_1_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_HEALTH_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_HEALTH_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_health_02;
	on_unequip = unequip_itri_addon_health_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Uzdrowiciela";
	text[2] = NAME_BONUS_HP;
	count[2] = HP_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_health_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_2_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_health_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_2_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITAM_ADDON_MANA(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_mana;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_mana;
	on_unequip = unequip_itam_addon_mana;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet Kap³ana";
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_mana()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_AMULETT_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itam_addon_mana()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_AMULETT_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_MANA_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_mana_01;
	on_unequip = unequip_itri_addon_mana_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Kap³ana";
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_mana_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_1_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_mana_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_1_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_MANA_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_MANA_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_mana_02;
	on_unequip = unequip_itri_addon_mana_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Kap³ana";
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_mana_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_2_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_mana_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_2_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITAM_ADDON_STR(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_str;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_str;
	on_unequip = unequip_itam_addon_str;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Amulet Wojownika";
	text[2] = NAME_PROT_EDGE;
	count[2] = STR_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_str()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_AMULETT_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};

func void unequip_itam_addon_str()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_AMULETT_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};


instance ITRI_ADDON_STR_01(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_str_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_str_01;
	on_unequip = unequip_itri_addon_str_01;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Wojownika";
	text[2] = NAME_PROT_EDGE;
	count[2] = STR_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_str_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_1_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};

func void unequip_itri_addon_str_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_1_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};


instance ITRI_ADDON_STR_02(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_str_02;
	on_unequip = unequip_itri_addon_str_02;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Pierœcieñ Wojownika";
	text[2] = NAME_PROT_EDGE;
	count[2] = STR_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_str_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_2_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};

func void unequip_itri_addon_str_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_2_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
};

