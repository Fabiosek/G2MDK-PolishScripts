
instance DIA_ADDON_JUAN_EXIT(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 999;
	condition = dia_addon_juan_exit_condition;
	information = dia_addon_juan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_juan_exit_condition()
{
	return TRUE;
};

func void dia_addon_juan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_JUAN_PICKPOCKET(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 900;
	condition = dia_addon_juan_pickpocket_condition;
	information = dia_addon_juan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_juan_pickpocket_condition()
{
	return c_beklauen(65,73);
};

func void dia_addon_juan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_BACK,dia_addon_juan_pickpocket_back);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_PICKPOCKET,dia_addon_juan_pickpocket_doit);
};

func void dia_addon_juan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_juan_pickpocket);
};

func void dia_addon_juan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
};


instance DIA_ADDON_JUAN_HI(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_hi_condition;
	information = dia_addon_juan_hi_info;
	permanent = FALSE;
	description = "Co s³ychaæ?";
};


func int dia_addon_juan_hi_condition()
{
	return TRUE;
};

func void dia_addon_juan_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//Co s³ychaæ?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//Czego chcesz? Masz mi coœ wa¿nego do powiedzenia? Jeœli nie, to zabieraj siê st¹d.
	if(!Npc_IsDead(freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//W przeciwnym razie mój kolega ci do³o¿y. No to chcesz czegoœ?
		b_startotherroutine(freund,"STAND");
	};
};


instance DIA_ADDON_JUAN_LOSUNG(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_losung_condition;
	information = dia_addon_juan_losung_info;
	permanent = FALSE;
	description = "Podobno masz wiele ciekawych rzeczy....";
};


func int dia_addon_juan_losung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_hi) && ((TOM_TELLS == TRUE) || (MIS_HUNO_STAHL == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void dia_addon_juan_losung_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//Podobno masz wiele ciekawych rzeczy....
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//Naprawdê? Esteban ¿artuje sobie ze mnie? Odwali³em ca³¹ robotê i siedzê w tej brudnej dziurze...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//A on po prostu przysy³a kogoœ po te rzeczy? Kto ja jestem? Magazynier?
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//No i co? To nie mój problem.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//To BÊDZIE twój problem. Chcesz odebraæ towar - œwietnie, mo¿esz go ode mnie kupiæ.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//WeŸ z³oto od Estebana, Kruka, albo kogo tam chcesz. Nie obchodzi mnie to. Jak ktoœ chce mieæ towar, musi za niego zap³aciæ.
};


instance DIA_ADDON_JUAN_AUFSMAUL(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_aufsmaul_condition;
	information = dia_addon_juan_aufsmaul_info;
	permanent = FALSE;
	description = "Nie przychodzê od Estebana!";
};


func int dia_addon_juan_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//Nie przychodzê od Estebana!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Och? W takim razie... Poczekaj sekundkê, masz na ramieniu jakiegoœ robaka...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_JUAN_TRADE(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 99;
	condition = dia_addon_juan_trade_condition;
	information = dia_addon_juan_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_juan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_trade_info()
{
	b_say(other,self,"$TRADE_3");
};

