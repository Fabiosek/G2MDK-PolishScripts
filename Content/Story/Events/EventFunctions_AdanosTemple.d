
var int adw_adanostempel_stonegrd_trigg_func_01_onetime;

func void adw_adanostempel_stonegrd_trigg_func_01()
{
	if(adw_adanostempel_stonegrd_trigg_func_01_onetime == FALSE)
	{
		b_awake_stoneguardian(stoneguardian_adanostempelentrance_01);
		b_awake_stoneguardian(stoneguardian_adanostempelentrance_02);
		b_awake_stoneguardian(stoneguardian_adanostempelentrance_03);
		b_awake_stoneguardian(stoneguardian_adanostempelentrance_04);
		if((Npc_IsDead(stoneguardian_adanostempelentrance_01) == FALSE) || (Npc_IsDead(stoneguardian_adanostempelentrance_02) == FALSE) || (Npc_IsDead(stoneguardian_adanostempelentrance_03) == FALSE) || (Npc_IsDead(stoneguardian_adanostempelentrance_04) == FALSE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		b_killnpc(bdt_10400_addon_deadbandit);
		b_killnpc(bdt_10401_addon_deadbandit);
		adw_adanostempel_stonegrd_trigg_func_01_onetime = TRUE;
	};
};


var int open_adanostempelchest_01_func_onetime;

func void open_adanostempelchest_01_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_01_FUNC_ONETIME == FALSE)
	{
		b_awake_stoneguardian(stoneguardian_treasurepits_05c);
		b_awake_stoneguardian(stoneguardian_treasurepits_05e);
		if((Npc_IsDead(stoneguardian_treasurepits_05c) == FALSE) || (Npc_IsDead(stoneguardian_treasurepits_05e) == FALSE))
		{
			Snd_Play("THRILLJINGLE_03");
		};
		OPEN_ADANOSTEMPELCHEST_01_FUNC_ONETIME = TRUE;
	};
};


var int open_adanostempelchest_02_func_onetime;

func void open_adanostempelchest_02_func_s1()
{
	if(OPEN_ADANOSTEMPELCHEST_02_FUNC_ONETIME == FALSE)
	{
		b_awake_stoneguardian(stoneguardian_treasurepits_09a);
		b_awake_stoneguardian(stoneguardian_treasurepits_09c);
		b_awake_stoneguardian(stoneguardian_treasurepits_09e);
		if((Npc_IsDead(stoneguardian_treasurepits_09a) == FALSE) || (Npc_IsDead(stoneguardian_treasurepits_09c) == FALSE) || (Npc_IsDead(stoneguardian_treasurepits_09e) == FALSE))
		{
			Snd_Play("THRILLJINGLE_02");
		};
		OPEN_ADANOSTEMPELCHEST_02_FUNC_ONETIME = TRUE;
	};
};


var int adw_adanostempel_stonegrd_trigg_func_02_onetime;

func void adw_adanostempel_stonegrd_trigg_func_02()
{
	if(adw_adanostempel_stonegrd_trigg_func_02_onetime == FALSE)
	{
		b_awake_stoneguardian(stoneguardian_rhademes_14a);
		b_awake_stoneguardian(stoneguardian_rhademes_14d);
		b_awake_stoneguardian(stoneguardian_rhademes_14f);
		SC_TOOKRHADEMESTRAP = TRUE;
		adw_adanostempel_stonegrd_trigg_func_02_onetime = TRUE;
	};
};


var int evt_raven_awake_func_onetime;

func void evt_raven_awake_func()
{
};

