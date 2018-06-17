
const int VALUE_ITAR_PIR_L_ADDON = 1100;
const int VALUE_ITAR_PIR_M_ADDON = 1300;
const int VALUE_ITAR_PIR_H_ADDON = 1500;
const int VALUE_ITAR_THORUS_ADDON = 1300;
const int VALUE_ITAR_RAVEN_ADDON = 1300;
const int VALUE_ITAR_OREBARON_ADDON = 1300;
const int VALUE_ITAR_RANGER_ADDON = 1300;
const int VALUE_ITAR_KDW_L_ADDON = 1300;
const int VALUE_ITAR_BLOODWYN_ADDON = 1300;

instance ITAR_PIR_L_ADDON(C_ITEM)
{
	name = "Pirackie ubranie";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_pir_l_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_L_ADDON.3ds";
	visual_change = "Armor_Pir_L_Addon.ASC";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_PIR_M_ADDON(C_ITEM)
{
	name = "Piracka zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_pir_m_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_M_ADDON.3ds";
	visual_change = "Armor_PIR_M_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_PIR_H_ADDON(C_ITEM)
{
	name = "Ubranie kapitana";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_pir_h_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_PIR_H_ADDON.3ds";
	visual_change = "Armor_PIR_H_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_THORUS_ADDON(C_ITEM)
{
	name = "Ciê¿ka zbroja gwardzisty";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_thorus_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = "Zbroja stra¿nika Kruka";
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_RAVEN_ADDON(C_ITEM)
{
	name = "Zbroja Kruka";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 100;
	value = value_itar_raven_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Raven_ADDON.3ds";
	visual_change = "Armor_Raven_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_OREBARON_ADDON(C_ITEM)
{
	name = "Zbroja magnata";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_orebaron_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_CHAOS_ADDON.3ds";
	visual_change = "Armor_CHAOS_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_RANGER_ADDON(C_ITEM)
{
	name = "Zbroja Wodnego Krêgu";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 10;
	value = value_itar_ranger_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	visual_change = "Armor_Ranger_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_FAKE_RANGER(C_ITEM)
{
	name = "Zniszczona zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ITAR_RANGER_ADDON;
	wear = WEAR_TORSO;
	visual = "ItAr_Ranger_ADDON.3ds";
	visual_change = "Armor_Ranger_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_KDW_L_ADDON(C_ITEM)
{
	name = "Lekka toga Maga Wody";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 25;
	value = value_itar_kdw_l_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_KDW_L_ADDON.3ds";
	visual_change = "Armor_KDW_L_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_BLOODWYN_ADDON(C_ITEM)
{
	name = "Zbroja Bloodwyna";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bloodwyn_addon;
	wear = WEAR_TORSO;
	visual = "ItAr_Bloodwyn_ADDON.3ds";
	visual_change = "Armor_Bloodwyn_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_MAYAZOMBIE_ADDON(C_ITEM)
{
	name = "Stara zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = 0;
	wear = WEAR_TORSO;
	visual = "ItAr_Raven_ADDON.3ds";
	visual_change = "Armor_MayaZombie_Addon.asc";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_FIREARMOR_ADDON(C_ITEM)
{
	name = "Magiczna zbroja";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_XARDAS;
	wear = WEAR_TORSO | WEAR_EFFECT;
	effect = "SPELLFX_FIREARMOR";
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Xardas.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

