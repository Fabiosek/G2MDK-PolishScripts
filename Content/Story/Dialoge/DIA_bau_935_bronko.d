
instance DIA_BRONKO_EXIT(C_INFO)
{
	npc = bau_935_bronko;
	nr = 999;
	condition = dia_bronko_exit_condition;
	information = dia_bronko_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bronko_exit_condition()
{
	return TRUE;
};

func void dia_bronko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRONKO_HALLO(C_INFO)
{
	npc = bau_935_bronko;
	nr = 1;
	condition = dia_bronko_hallo_condition;
	information = dia_bronko_hallo_info;
	important = TRUE;
};


func int dia_bronko_hallo_condition()
{
	return TRUE;
};

func void dia_bronko_hallo_info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//Dok¹d wiêc siê udajemy?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//Jesteœ tutaj zarz¹dc¹?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//Zaraz dam ci po ³bie, ³ajdaku.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//Je¿eli chcesz spacerowaæ po mojej ziemi, musisz zap³aciæ 5 z³otych monet, albo dostaniesz niez³y wycisk.
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Zapomnij o tym. Nic ode mnie nie dostaniesz.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Twojej ziemi? Uprawiasz j¹?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Twojej ziemi? Uprawiasz j¹?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//Jasne. Z jakiej innej przyczyny musia³byœ mi p³aciæ?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//Mo¿esz iœæ i popytaæ o mnie, nie mam nic przeciwko. He, he!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//Dziêkujê i ¿yczê mi³ego dnia.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//Nie masz nawet 5 z³otych monet. Chcesz siê wykrêciæ, co?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//Zapomnij o tym. Nic ode mnie nie dostaniesz.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//W takim wypadku obawiam siê, ¿e muszê wygarbowaæ ci skórê.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//Wam w stra¿y miejskiej brakuje kasy, co?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//Nie obchodzi mnie, ¿e jesteœ magiem. I tak musisz zap³aciæ. Zrozumiano?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Skoro nie mam wyboru - proszê, oto twoje pieni¹dze.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"No to chodŸ i spróbuj.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//No to chodŸ i spróbuj.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//No có¿, w takim wypadku...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BRONKO_KEINBAUER(C_INFO)
{
	npc = bau_935_bronko;
	nr = 2;
	condition = dia_bronko_keinbauer_condition;
	information = dia_bronko_keinbauer_info;
	permanent = TRUE;
	description = "Ty, wieœniak? Nie rozœmieszaj mnie.";
};


var int dia_bronko_keinbauer_noperm;

func int dia_bronko_keinbauer_condition()
{
	if(((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING) || (BABERA_BRONKOKEINBAUER == TRUE)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && (DIA_BRONKO_KEINBAUER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bronko_keinbauer_info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//Ty, wieœniak? Nie rozœmieszaj mnie. Jesteœ nikim, naprawdê.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Cooo? Mam ci daæ w gêbê?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(Postrasz Bronka najemnikami)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"Sekob uprawia tê ziemiê, a ty jesteœ tylko drobnym kanciarzem.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"No to poka¿, co potrafisz.",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"Niewa¿ne.",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//No to poka¿, co potrafisz.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//Mia³em nadziejê, ¿e to powiesz.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//Sekob uprawia tê ziemiê, a ty jesteœ tylko drobnym kanciarzem, który chce wy³udziæ od ludzi pieni¹dze.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//Kto tak powiedzia³?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//Ja tak mówiê. Sekob chce, ¿ebyœ wróci³ do pracy, zamiast siê tu bezczynnie pêtaæ.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//I co z tego? Co teraz zamierzasz zrobiæ?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//Niewa¿ne.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Spadaj!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//Dobrze, zatem muszê chyba powiedzieæ zarz¹dcy Onarowi, ¿e jest tu wieœniak, który odmawia p³acenia czynszu.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Ehem. Poczekaj chwilkê. Onar wyœle za mn¹ wszystkich swoich najemników.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//I co z tego?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//No dobrze, dobrze. Dam ci, co tam chcesz, ale nie mieszajmy do tego najemników, w porz¹dku?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Masz, oddam ci nawet ca³e moje z³oto.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//Wrócê ju¿ na swoje pole. Wszystko, byleby tylko nie najemnicy.
	AI_StopProcessInfos(self);
	DIA_BRONKO_KEINBAUER_NOPERM = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BRONKO_FLEISSIG(C_INFO)
{
	npc = bau_935_bronko;
	nr = 3;
	condition = dia_bronko_fleissig_condition;
	information = dia_bronko_fleissig_info;
	permanent = TRUE;
	description = "(Rozdra¿nij Bronka)";
};


func int dia_bronko_fleissig_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_bronko_fleissig_info()
{
	if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//Co tam? Uwijasz siê jak pszczó³ka, co?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//Co tam? Dalej gêba ci siê nie zamyka?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//Jesteœ najemnikiem, prawda? Mog³em siê domyœliæ.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//Nie sprowadzisz tu tych najemników, co?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Proszê, nie bij mnie.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//Bêdê nawet... pracowa³, dobrze?
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRONKO_PICKPOCKET(C_INFO)
{
	npc = bau_935_bronko;
	nr = 900;
	condition = dia_bronko_pickpocket_condition;
	information = dia_bronko_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bronko_pickpocket_condition()
{
	return c_beklauen(54,80);
};

func void dia_bronko_pickpocket_info()
{
	Info_ClearChoices(dia_bronko_pickpocket);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_BACK,dia_bronko_pickpocket_back);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_PICKPOCKET,dia_bronko_pickpocket_doit);
};

func void dia_bronko_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bronko_pickpocket);
};

func void dia_bronko_pickpocket_back()
{
	Info_ClearChoices(dia_bronko_pickpocket);
};

