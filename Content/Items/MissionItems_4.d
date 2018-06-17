
const int VALUE_DRAGONEGG = 200;
const int VALUE_ORCELITERING = 130;

instance ITAM_MANA_ANGAR_MIS(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_MANA;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_mana_angar;
	on_unequip = unequip_itam_mana_angar;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Magiczny amulet Angara";
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_mana_angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + AM_MANA;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + AM_MANA;
};

func void unequip_itam_mana_angar()
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


instance ITMW_1H_FERROSSWORD_MIS(C_ITEM)
{
	name = "Miecz Ferosa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_2;
	damagetotal = DAMAGE_SPECIAL_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_KEROLOTHSGELDBEUTEL_MIS(C_ITEM)
{
	name = "Skórzana torba Kerolotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usekerolothsgeldbeutel;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usekerolothsgeldbeutel()
{
	CreateInvItems(self,itmi_gold,300);
	CreateInvItems(self,itmi_kerolothsgeldbeutelleer_mis,1);
	Print(PRINT_KEROLOTHSGELDBEUTEL);
	Snd_Play("Geldbeutel");
};


instance ITMI_KEROLOTHSGELDBEUTELLEER_MIS(C_ITEM)
{
	name = "Skórzana torba Kerolotha";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_SENGRATHSARMBRUST_MIS(C_ITEM)
{
	name = "Kusza Sengratha";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_MILARMBRUST;
	damagetotal = DAMAGE_MILARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MILARMBRUST;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TALBINSLURKERSKIN(C_ITEM)
{
	name = "Skóra topielca";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_REPTILESKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Na wewnêtrznej stronie wygarbowano imiê 'Talbin'.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONEGG_MIS(C_ITEM)
{
	name = "Smocze jajo";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_DRAGONEGG;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Jajo jest ciep³e, a ze œrodka";
	text[1] = "dochodzi s³aby dŸwiêk, jakby drapanie.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_ORCELITERING(C_ITEM)
{
	name = "Pierœcieñ orkowych przywódców";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = VALUE_ORCELITERING;
	visual = "ItRi_Str_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_orcelitering;
	on_unequip = unequip_orcelitering;
	description = name;
	text[0] = "Pierœcieñ jest szorstki i";
	text[1] = "dziwnie zimny w dotyku.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_orcelitering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
	Print(PRINT_ORCELITERINGEQUIP);
};

func void unequip_orcelitering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,20);
};


var int neoras_scuseddragoneggdrink;

instance ITPO_DRAGONEGGDRINKNEORAS_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = use_dragoneggdrinkneoras;
	scemename = "POTIONFAST";
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ITEMGLIMMER";
	description = "Mikstura wydzieliny ze smoczych jaj";
	text[3] = "Skutki nieznane.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_dragoneggdrinkneoras()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ELIXIER);
	b_raiseattribute(self,ATR_STRENGTH,3);
	Snd_Play("DEM_Warn");
	NEORAS_SCUSEDDRAGONEGGDRINK = TRUE;
};


instance ITWR_MAP_ORCELITE_MIS(C_ITEM)
{
	name = "Orkowa mapa wojenna";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_orcelite_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int use_map_newworld_orcelite_mis_onetime;

func void use_map_newworld_orcelite_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_orcelite_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Orcelite.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
	if((use_map_newworld_orcelite_mis_onetime == FALSE) && (MIS_KILLORKOBERST != 0))
	{
		b_logentry(TOPIC_ORCELITE,"Przy orkowym pu³kowniku znalaz³em dziwn¹ mapê. Wygl¹da jak plan dzia³añ wojennych tych stworzeñ.");
		use_map_newworld_orcelite_mis_onetime = TRUE;
	};
};


instance ITWR_MAP_CAVES_MIS(C_ITEM)
{
	name = "Jaskinie Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_caves_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_caves_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_caves_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Caves.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};

