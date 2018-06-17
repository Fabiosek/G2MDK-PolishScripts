
instance DIA_WAMBO_EXIT(C_INFO)
{
	npc = mil_316_wambo;
	nr = 999;
	condition = dia_wambo_exit_condition;
	information = dia_wambo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wambo_exit_condition()
{
	return TRUE;
};

func void dia_wambo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAMBO_PICKPOCKET(C_INFO)
{
	npc = mil_316_wambo;
	nr = 900;
	condition = dia_wambo_pickpocket_condition;
	information = dia_wambo_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie¿ tego klucza bêdzie doœæ ryzykownym zadaniem)";
};


func int dia_wambo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void dia_wambo_pickpocket_info()
{
	Info_ClearChoices(dia_wambo_pickpocket);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_BACK,dia_wambo_pickpocket_back);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_PICKPOCKET,dia_wambo_pickpocket_doit);
};

func void dia_wambo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_city_tower_04,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_wambo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_wambo_pickpocket_back()
{
	Info_ClearChoices(dia_wambo_pickpocket);
};


instance DIA_WAMBO_JOB(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_job_condition;
	information = dia_wambo_job_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_wambo_job_condition()
{
	return TRUE;
};

func void dia_wambo_job_info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Pilnujê, by nikt nie wchodzi³ do domów.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Bezpoœredni rozkaz Lorda Hagena. Niech ci nawet nie przychodzi do g³owy go ³amaæ!
};


instance DIA_WAMBO_SITUATION(C_INFO)
{
	npc = mil_316_wambo;
	nr = 10;
	condition = dia_wambo_situation_condition;
	information = dia_wambo_situation_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_wambo_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_job))
	{
		return TRUE;
	};
};

func void dia_wambo_situation_info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Jak siê maj¹ sprawy?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//W tej chwili panuje spokój.
};


instance DIA_WAMBO_RAMIREZ(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_ramirez_condition;
	information = dia_wambo_ramirez_info;
	permanent = FALSE;
	description = "Przychodzê od naszego wspólnego przyjaciela, Ramireza.";
};


func int dia_wambo_ramirez_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_viertel))
	{
		return TRUE;
	};
};

func void dia_wambo_ramirez_info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//Przychodzê od naszego wspólnego przyjaciela, Ramireza.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Czy¿by? Ramirez to nêdzny szczur. Nie jest moim przyjacielem. Niewa¿ne. Przynios³eœ coœ dla mnie?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//Zale¿y, czego chcesz.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//Dobra, powiem ci, o co chodzi. Ty p³acisz 250 sztuk z³ota, a ja zmyjê siê st¹d w nocy.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//Jeœli jednak bêdziesz siê zbytnio rzuca³ w oczy, a ja to zauwa¿ê, z naszej umowy nici.
};


instance DIA_WAMBO_DEAL(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_deal_condition;
	information = dia_wambo_deal_info;
	permanent = TRUE;
	description = "(Zap³aæ 250 sztuk z³ota)";
};


var int dia_wambo_deal_permanent;

func int dia_wambo_deal_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_ramirez) && (DIA_WAMBO_DEAL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wambo_deal_info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//Mam dla ciebie pieni¹dze...
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//W porz¹dku, w nocy mnie tu nie bêdzie.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//Pamiêtaj, ¿e nie wiem nawet, jak siê nazywasz.
		DIA_WAMBO_DEAL_PERMANENT = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//...ale akurat nie przy sobie.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Nie cierpiê, kiedy robi siê ze mnie durnia. Dawaj z³oto.
		AI_StopProcessInfos(self);
	};
};

