
var int salandril_itemsgiven_chapter_1;
var int salandril_itemsgiven_chapter_2;
var int salandril_itemsgiven_chapter_3;
var int salandril_itemsgiven_chapter_4;
var int salandril_itemsgiven_chapter_5;

func void b_givetradeinv_salandril(var C_NPC slf)
{
	if((KAPITEL >= 1) && (SALANDRIL_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_02,5);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itpo_health_03,2);
		CreateInvItems(slf,itpl_speed_herb_01,2);
		CreateInvItems(slf,itsc_firerain,1);
		CreateInvItems(slf,itsc_thunderstorm,1);
		CreateInvItems(slf,itam_prot_fire_01,1);
		SALANDRIL_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (SALANDRIL_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_02,5);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itpo_health_03,2);
		SALANDRIL_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (SALANDRIL_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_02,5);
		CreateInvItems(slf,itpo_health_02,5);
		CreateInvItems(slf,itpo_mana_03,2);
		CreateInvItems(slf,itpo_health_03,2);
		SALANDRIL_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (SALANDRIL_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_mana_02,2);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itpo_mana_03,5);
		CreateInvItems(slf,itpo_health_03,5);
		SALANDRIL_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (SALANDRIL_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itpo_mana_02,2);
		CreateInvItems(slf,itpo_health_02,2);
		CreateInvItems(slf,itpo_mana_03,5);
		CreateInvItems(slf,itpo_health_03,5);
		SALANDRIL_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

