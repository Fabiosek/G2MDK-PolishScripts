
var int juan_itemsgiven_chapter_1;

func void b_givetradeinv_addon_juan(var C_NPC slf)
{
	if((KAPITEL >= 1) && (JUAN_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_goldnugget_addon,2);
		CreateInvItems(slf,itfo_addon_pfeffer_01,1);
		CreateInvItems(slf,itfo_booze,5);
		CreateInvItems(slf,itfo_apple,5);
		CreateInvItems(slf,itfo_bread,5);
		CreateInvItems(slf,itpl_mana_herb_02,10);
		CreateInvItems(slf,itpl_mana_herb_03,5);
		CreateInvItems(slf,itpl_health_herb_02,10);
		CreateInvItems(slf,itpl_health_herb_03,5);
		CreateInvItems(slf,itpl_temp_herb,3);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,5);
		CreateInvItems(slf,itpo_mana_02,4);
		CreateInvItems(slf,itpo_health_02,4);
		CreateInvItems(slf,itpo_mana_03,3);
		CreateInvItems(slf,itpo_health_03,3);
		CreateInvItems(slf,itpo_mana_addon_04,1);
		CreateInvItems(slf,itpo_health_addon_04,1);
		CreateInvItems(slf,itrw_arrow,100);
		CreateInvItems(slf,itrw_bolt,100);
		JUAN_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
};

