
const int VALUE_ITAR_GOVERNOR = 1100;
const int VALUE_ITAR_JUDGE = 0;
const int VALUE_ITAR_SMITH = 0;
const int VALUE_ITAR_BARKEEPER = 0;
const int VALUE_ITAR_VLK_L = 120;
const int VALUE_ITAR_VLK_M = 120;
const int VALUE_ITAR_VLK_H = 120;
const int VALUE_ITAR_VLKBABE_L = 0;
const int VALUE_ITAR_VLKBABE_M = 0;
const int VALUE_ITAR_VLKBABE_H = 0;
const int VALUE_ITAR_MIL_L = 600;
const int VALUE_ITAR_MIL_M = 2500;
const int VALUE_ITAR_PAL_M = 5000;
const int VALUE_ITAR_PAL_H = 20000;
const int VALUE_ITAR_BAU_L = 80;
const int VALUE_ITAR_BAU_M = 100;
const int VALUE_ITAR_BAUBABE_L = 0;
const int VALUE_ITAR_BAUBABE_M = 0;
const int VALUE_ITAR_SLD_L = 500;
const int VALUE_ITAR_SLD_M = 1000;
const int VALUE_ITAR_DJG_CRAWLER = 1500;
const int VALUE_ITAR_SLD_H = 2500;
const int VALUE_ITAR_NOV_L = 280;
const int VALUE_ITAR_KDF_L = 500;
const int VALUE_ITAR_KDF_H = 3000;
const int VALUE_ITAR_LEATHER_L = 250;
const int VALUE_ITAR_BDT_M = 550;
const int VALUE_ITAR_BDT_H = 2100;
const int VALUE_ITAR_DJG_L = 3000;
const int VALUE_ITAR_DJG_M = 12000;
const int VALUE_ITAR_DJG_H = 20000;
const int VALUE_ITAR_DJG_BABE = 0;
const int VALUE_ITAR_XARDAS = 15000;
const int VALUE_ITAR_LESTER = 300;
const int VALUE_ITAR_DIEGO = 450;
const int VALUE_ITAR_CORANGAR = 600;
const int VALUE_ITAR_DEMENTOR = 500;
const int VALUE_ITAR_KDW_H = 450;
const int VALUE_ITAR_PRISONER = 10;

instance ITAR_GOVERNOR(C_ITEM)
{
	name = "Kaftan gubernatora";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_governor;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3ds";
	visual_change = "Armor_Governor.asc";
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

instance ITAR_JUDGE(C_ITEM)
{
	name = "Szata sêdziego";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_judge;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3DS";
	visual_change = "Armor_Judge.asc";
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

instance ITAR_SMITH(C_ITEM)
{
	name = "Strój kowala";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_itar_smith;
	wear = WEAR_TORSO;
	visual = "ItAr_Smith.3DS";
	visual_change = "Armor_Smith.asc";
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

instance ITAR_BARKEEPER(C_ITEM)
{
	name = "Strój ziemianina";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_barkeeper;
	wear = WEAR_TORSO;
	visual = "ItAr_Wirt.3DS";
	visual_change = "Armor_Barkeeper.asc";
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

instance ITAR_VLK_L(C_ITEM)
{
	name = "Strój obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_L.3DS";
	visual_change = "Armor_Vlk_L.asc";
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

instance ITAR_VLK_M(C_ITEM)
{
	name = "Strój obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_M.3DS";
	visual_change = "Armor_Vlk_M.asc";
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

instance ITAR_VLK_H(C_ITEM)
{
	name = "Strój obywatela";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_h;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3DS";
	visual_change = "Armor_Vlk_H.asc";
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

instance ITAR_VLKBABE_L(C_ITEM)
{
	name = "Strój obywatela 1";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_L.asc";
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

instance ITAR_VLKBABE_M(C_ITEM)
{
	name = "Strój obywatela 2";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_M.asc";
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

instance ITAR_VLKBABE_H(C_ITEM)
{
	name = "Strój obywatela 3";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_h;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_H.asc";
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

instance ITAR_MIL_L(C_ITEM)
{
	name = "Lekki pancerz stra¿y";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_l;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Armor_Mil_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_mil_l;
	on_unequip = unequip_itar_mil_l;
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


func void equip_itar_mil_l()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = TRUE;
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_mil_l()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = FALSE;
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_MIL_M(C_ITEM)
{
	name = "Ciê¿ki pancerz stra¿y";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 10;
	value = value_itar_mil_m;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_M.3DS";
	visual_change = "Armor_MIL_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_mil_m;
	on_unequip = unequip_itar_mil_m;
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


func void equip_itar_mil_m()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = TRUE;
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_mil_m()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = FALSE;
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_PAL_M(C_ITEM)
{
	name = "Pancerz rycerza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	value = value_itar_pal_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
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

instance ITAR_PAL_H(C_ITEM)
{
	name = "Pancerz paladyna";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_H.asc";
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

instance ITAR_BAU_L(C_ITEM)
{
	name = "Strój farmera 1";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bau_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	visual_change = "Armor_Bau_L.asc";
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

instance ITAR_BAU_M(C_ITEM)
{
	name = "Strój farmera 2";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bau_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_M.3ds";
	visual_change = "Armor_Bau_M.asc";
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

instance ITAR_BAUBABE_L(C_ITEM)
{
	name = "Suknia farmerki 1";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_baubabe_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_L.asc";
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

instance ITAR_BAUBABE_M(C_ITEM)
{
	name = "Suknia farmerki 2";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_baubabe_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_M.asc";
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

instance ITAR_SLD_L(C_ITEM)
{
	name = "Lekki pancerz najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_L.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_l;
	on_unequip = unequip_itar_sld_l;
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


func void equip_itar_sld_l()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_sld_l()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_SLD_M(C_ITEM)
{
	name = "Œredni pancerz najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 5;
	value = value_itar_sld_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_m;
	on_unequip = unequip_itar_sld_m;
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


func void equip_itar_sld_m()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_sld_m()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_SLD_H(C_ITEM)
{
	name = "Ciê¿ki pancerz najemnika";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 10;
	value = value_itar_sld_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_h;
	on_unequip = unequip_itar_sld_h;
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


func void equip_itar_sld_h()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_sld_h()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_DJG_CRAWLER(C_ITEM)
{
	name = "Zbroja z pancerzy pe³zaczy";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_itar_djg_crawler;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_Crawler.3ds";
	visual_change = "Armor_Djg_Crawler.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_djg_crawler;
	on_unequip = unequip_itar_djg_crawler;
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


func void equip_itar_djg_crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCARMOR_EQUIPPED = TRUE;
		if(MC_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_djg_crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCARMOR_EQUIPPED = FALSE;
		if(MC_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_DJG_L(C_ITEM)
{
	name = "Lekki pancerz ³owcy smoków";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	value = value_itar_djg_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
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

instance ITAR_DJG_M(C_ITEM)
{
	name = "Œredni pancerz ³owcy smoków";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 75;
	protection[PROT_MAGIC] = 35;
	value = value_itar_djg_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_M.3ds";
	visual_change = "Armor_Djg_M.asc";
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

instance ITAR_DJG_H(C_ITEM)
{
	name = "Ciê¿ki pancerz ³owcy smoków";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 150;
	protection[PROT_BLUNT] = 150;
	protection[PROT_POINT] = 150;
	protection[PROT_FIRE] = 100;
	protection[PROT_MAGIC] = 50;
	value = value_itar_djg_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	visual_change = "Armor_Djg_H.asc";
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

instance ITAR_DJG_BABE(C_ITEM)
{
	name = "Kobiecy pancerz ³owcy smoków";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 0;
	value = value_itar_djg_babe;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3DS";
	visual_change = "Armor_Djg_Babe.asc";
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

instance ITAR_NOV_L(C_ITEM)
{
	name = "Szata nowicjusza";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 10;
	value = value_itar_nov_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_nov_l;
	on_unequip = unequip_itar_nov_l;
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


func void equip_itar_nov_l()
{
	if(Npc_IsPlayer(self))
	{
		NOVARMOR_EQUIPPED = TRUE;
		if(NOV01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_nov_l()
{
	if(Npc_IsPlayer(self))
	{
		NOVARMOR_EQUIPPED = FALSE;
		if(NOV01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_KDF_L(C_ITEM)
{
	name = "Szata Maga Ognia";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = value_itar_kdf_l;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_l;
	on_unequip = unequip_itar_kdf_l;
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


func void equip_itar_kdf_l()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = TRUE;
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_kdf_l()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = FALSE;
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_KDF_H(C_ITEM)
{
	name = "Ciê¿ka szata ognia";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_kdf_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_h;
	on_unequip = unequip_itar_kdf_h;
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


func void equip_itar_kdf_h()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = TRUE;
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_kdf_h()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = FALSE;
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_LEATHER_L(C_ITEM)
{
	name = "Skórzany pancerz";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_itar_leather_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l;
	on_unequip = unequip_itar_leather_l;
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


func void equip_itar_leather_l()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
		};
	};
};

func void unequip_itar_leather_l()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
		};
	};
};


instance ITAR_BDT_M(C_ITEM)
{
	name = "Œredni pancerz bandyty";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_M.3ds";
	visual_change = "Armor_Bdt_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
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

instance ITAR_BDT_H(C_ITEM)
{
	name = "Ciê¿ki pancerz bandyty";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_H.3ds";
	visual_change = "Armor_Bdt_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
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

instance ITAR_XARDAS(C_ITEM)
{
	name = "Szata Mrocznej Magii";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_xardas;
	wear = WEAR_TORSO;
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

instance ITAR_LESTER(C_ITEM)
{
	name = "Szata Lestera";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_lester;
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	visual_change = "Armor_Lester.asc";
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

instance ITAR_DIEGO(C_ITEM)
{
	name = "Pancerz Diega";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_diego;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	visual_change = "Armor_Diego.asc";
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

instance ITAR_CORANGAR(C_ITEM)
{
	name = "Pancerz Cor Angara";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	value = value_itar_corangar;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	visual_change = "Armor_CorAngar.asc";
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

instance ITAR_DEMENTOR(C_ITEM)
{
	name = "Mroczny p³aszcz";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 130;
	protection[PROT_BLUNT] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 65;
	value = value_itar_dementor;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Dementor.asc";
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

instance ITAR_KDW_H(C_ITEM)
{
	name = "Szata Maga Wody";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_kdw_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_KdW_H.asc";
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

instance ITAR_PRISONER(C_ITEM)
{
	name = "£achy skazañca";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_prisoner;
	wear = WEAR_TORSO;
	visual = "ItAr_Prisoner.3ds";
	visual_change = "Armor_Prisoner.asc";
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

