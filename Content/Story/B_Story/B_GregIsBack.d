
func void gregisback_s1()
{
	if(GREGISBACK == FALSE)
	{
		Wld_InsertNpc(pir_1320_addon_greg,"ADW_PIRATECAMP_GREG");
		b_startotherroutine(bill,"GREGISBACK");
		b_startotherroutine(morgan,"GREGISBACK");
		b_startotherroutine(alligatorjack,"GREGISBACK");
		Wld_InsertNpc(canyonrazor07,"ADW_CANYON_MINE1_01");
		Wld_InsertNpc(canyonrazor08,"ADW_CANYON_PATH_TO_LIBRARY_07A");
		Wld_InsertNpc(canyonrazor09,"ADW_CANYON_PATH_TO_LIBRARY_36");
		Wld_InsertNpc(canyonrazor10,"ADW_CANYON_PATH_TO_MINE2_04");
	};
	GREGISBACK = TRUE;
};

