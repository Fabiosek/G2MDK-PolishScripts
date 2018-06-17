
var int ignaz_itemsgiven_chapter_1;
var int ignaz_itemsgiven_chapter_2;
var int ignaz_itemsgiven_chapter_3;
var int ignaz_itemsgiven_chapter_4;
var int ignaz_itemsgiven_chapter_5;

func void b_givetradeinv_ignaz(var C_NPC slf)
{
	if((KAPITEL >= 1) && (IGNAZ_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,100);
		CreateInvItems(slf,itpo_mana_01,1);
		CreateInvItems(slf,itpo_health_01,1);
		CreateInvItems(slf,itpo_speed,1);
		CreateInvItems(slf,itpo_health_addon_04,3);
		CreateInvItems(slf,itpo_mana_addon_04,3);
		CreateInvItems(slf,itmi_flask,10);
		CreateInvItems(slf,itsc_trfsheep,1);
		CreateInvItems(slf,itsc_trfscavenger,1);
		CreateInvItems(slf,itsc_trfgiantrat,1);
		CreateInvItems(slf,itsc_trfgiantbug,1);
		CreateInvItems(slf,itsc_trfwolf,3);
		CreateInvItems(slf,itsc_trflurker,1);
		CreateInvItems(slf,itsc_trfwaran,1);
		CreateInvItems(slf,itsc_trfsnapper,3);
		CreateInvItems(slf,itsc_trfwarg,1);
		CreateInvItems(slf,itsc_trfshadowbeast,1);
		CreateInvItems(slf,itsc_trfdragonsnapper,1);
		CreateInvItems(slf,itsc_trffirewaran,1);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itsc_sleep,1);
		IGNAZ_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if((KAPITEL >= 2) && (IGNAZ_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,200);
		CreateInvItems(slf,itpo_health_addon_04,3);
		CreateInvItems(slf,itpo_mana_addon_04,3);
		CreateInvItems(slf,itpo_mana_01,2);
		CreateInvItems(slf,itpo_health_01,2);
		CreateInvItems(slf,itpo_speed,2);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if((KAPITEL >= 3) && (IGNAZ_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,300);
		CreateInvItems(slf,itpo_health_addon_04,3);
		CreateInvItems(slf,itpo_mana_addon_04,3);
		CreateInvItems(slf,itpo_mana_01,3);
		CreateInvItems(slf,itpo_health_01,3);
		CreateInvItems(slf,itpo_speed,3);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if((KAPITEL >= 4) && (IGNAZ_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,400);
		CreateInvItems(slf,itpo_health_addon_04,3);
		CreateInvItems(slf,itpo_mana_addon_04,3);
		CreateInvItems(slf,itpo_mana_01,4);
		CreateInvItems(slf,itpo_health_01,4);
		CreateInvItems(slf,itpo_speed,4);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if((KAPITEL >= 5) && (IGNAZ_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems(slf,itmi_gold,500);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_speed,5);
		CreateInvItems(slf,itsc_charm,5);
		CreateInvItems(slf,itmi_flask,10);
		IGNAZ_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

