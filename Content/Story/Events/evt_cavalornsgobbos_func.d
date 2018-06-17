
var int evt_cavalornsgobbos_func_onetime;

func void evt_cavalornsgobbos_func()
{
	if(evt_cavalornsgobbos_func_onetime == FALSE)
	{
		Wld_InsertNpc(ygobbo_green,"NW_XARDAS_GOBBO_01");
		Wld_InsertNpc(ygobbo_green,"NW_XARDAS_GOBBO_02");
		Wld_InsertNpc(ygobbo_green,"NW_XARDAS_GOBBO_02");
		evt_cavalornsgobbos_func_onetime = TRUE;
	};
};

