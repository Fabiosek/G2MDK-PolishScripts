
var int rethon_itemsgiven_chapter_1;
var int rethon_itemsgiven_chapter_2;
var int rethon_itemsgiven_chapter_3;
var int rethon_itemsgiven_chapter_4;
var int rethon_itemsgiven_chapter_5;

func void b_givetradeinv_rethon(var C_NPC slf)
{
	if(RETHON_ITEMSGIVEN_CHAPTER_4 == FALSE)
	{
		CreateInvItems(slf,itmw_inquisitor,1);
		CreateInvItems(slf,itmw_streitaxt2,1);
		CreateInvItems(slf,itmw_kriegshammer2,1);
		CreateInvItems(slf,itmw_orkschlaechter,1);
		CreateInvItems(slf,itmw_folteraxt,1);
		CreateInvItems(slf,itmw_krummschwert,1);
		CreateInvItems(slf,itmw_barbarenstreitaxt,1);
		CreateInvItems(slf,itmw_berserkeraxt,1);
		RETHON_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
};

