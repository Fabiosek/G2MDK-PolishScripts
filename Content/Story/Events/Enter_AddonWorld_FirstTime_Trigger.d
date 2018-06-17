
var int enter_addonworld_firsttime_trigger_onetime;

func void enter_addonworld_firsttime_trigger_func()
{
	if(ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME == FALSE)
	{
		b_killnpc(pir_1370_addon_angus);
		b_killnpc(pir_1371_addon_hank);
		b_killnpc(vlk_4304_addon_william);
		b_killnpc(none_addon_114_lance_adw);
		b_killnpc(strf_1131_addon_sklave);
		b_killnpc(strf_1132_addon_sklave);
		b_killnpc(strf_1133_addon_sklave);
		b_killnpc(strf_1134_addon_sklave);
		b_killnpc(strf_1135_addon_sklave);
		b_killnpc(strf_1141_addon_sklave);
		b_killnpc(strf_1142_addon_sklave);
		b_killnpc(strf_1143_addon_sklave);
		b_killnpc(strf_1144_addon_sklave);
		b_killnpc(bdt_10400_addon_deadbandit);
		b_killnpc(bdt_10401_addon_deadbandit);
		b_killnpc(stoneguardian_minedead1);
		b_killnpc(stoneguardian_minedead2);
		b_killnpc(stoneguardian_minedead3);
		b_killnpc(stoneguardian_minedead4);
		ENTER_ADDONWORLD_FIRSTTIME_TRIGGER_ONETIME = TRUE;
	};
};

