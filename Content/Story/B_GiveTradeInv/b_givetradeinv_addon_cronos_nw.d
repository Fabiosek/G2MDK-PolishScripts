
var int cronos_nw_itemsgiven_chapter_1;

func void b_givetradeinv_addon_cronos_nw(var C_NPC slf)
{
	if((KAPITEL >= 1) && (CRONOS_NW_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems(slf,itmi_flask,5);
		CreateInvItems(slf,itmi_sulfur,2);
		CreateInvItems(slf,itpo_mana_01,5);
		CreateInvItems(slf,itpo_health_01,6);
		CreateInvItems(slf,itmi_pitch,1);
		CreateInvItems(slf,itsc_light,5);
		CreateInvItems(slf,itsc_firebolt,5);
		CreateInvItems(slf,itsc_zap,5);
		CreateInvItems(slf,itsc_lightheal,5);
		CreateInvItems(slf,itsc_sumgobskel,2);
		CreateInvItems(slf,itsc_icelance,5);
		CreateInvItems(slf,itsc_whirlwind,1);
		CRONOS_NW_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
};

