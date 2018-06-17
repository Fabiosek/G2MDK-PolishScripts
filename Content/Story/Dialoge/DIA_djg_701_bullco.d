
instance DIA_BULLCODJG_EXIT(C_INFO)
{
	npc = djg_701_bullco;
	nr = 999;
	condition = dia_bullcodjg_exit_condition;
	information = dia_bullcodjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bullcodjg_exit_condition()
{
	return TRUE;
};

func void dia_bullcodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_HALLO(C_INFO)
{
	npc = djg_701_bullco;
	nr = 5;
	condition = dia_bullcodjg_hallo_condition;
	information = dia_bullcodjg_hallo_info;
	description = "O co chodzi?";
};


func int dia_bullcodjg_hallo_condition()
{
	if(Npc_IsDead(djg_sylvio) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bullcodjg_hallo_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");	//O co chodzi?
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");	//Cholernie zimno! Nie wiem, czemu Sylvio koniecznie chcia³ tu przyleŸæ.
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");	//W okolicy pe³no jest miejsc, gdzie mo¿na coœ znaleŸæ!
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_WARTEMAL(C_INFO)
{
	npc = djg_701_bullco;
	nr = 6;
	condition = dia_bullcodjg_wartemal_condition;
	information = dia_bullcodjg_wartemal_info;
	permanent = TRUE;
	description = "Oprócz tego, wszystko w porz¹dku?";
};


func int dia_bullcodjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_bullcodjg_hallo) || Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		return TRUE;
	};
};

func void dia_bullcodjg_wartemal_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");	//A poza tym wszystko w porz¹dku?
	if(Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");	//Nie denerwuj mnie.
	}
	else
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");	//Nie teraz. Zamarzam! Chcê siê tylko st¹d szybko wydostaæ.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_SYLVIODEAD(C_INFO)
{
	npc = djg_701_bullco;
	nr = 7;
	condition = dia_bullco_sylviodead_condition;
	information = dia_bullco_sylviodead_info;
	important = TRUE;
};


func int dia_bullco_sylviodead_condition()
{
	if(Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_sylviodead_info()
{
	AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");	//Niech to szlag. Sylvio nie ¿yje.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BULLCO_WASNUN(C_INFO)
{
	npc = djg_701_bullco;
	nr = 8;
	condition = dia_bullco_wasnun_condition;
	information = dia_bullco_wasnun_info;
	description = "Co zamierzasz teraz robiæ?";
};


func int dia_bullco_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_bullco_sylviodead) && Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_wasnun_info()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");	//Skoro Sylvio nie ¿yje, jakie masz teraz plany?
	AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");	//Nie wiem. Pójdê z innymi ³owcami smoków, jeœli jeszcze mnie chc¹.
	Info_AddChoice(dia_bullco_wasnun,"Urwê ci ³eb.",dia_bullco_wasnun_kopfab);
	Info_AddChoice(dia_bullco_wasnun,"Wiesz mo¿e, gdzie s¹ pozostali?",dia_bullco_wasnun_woandere);
};

func void dia_bullco_wasnun_woandere()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");	//Wiesz, gdzie s¹ inni?
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");	//Noo... Widzia³em jednego z nich po drugiej stronie rzeki.
	Info_AddChoice(dia_bullco_wasnun,"Zabierz mnie do tych ³owców smoków.",dia_bullco_wasnun_woandere_zuihnen);
};

func void dia_bullco_wasnun_woandere_zuihnen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");	//Zabierz mnie do tych ³owców smoków.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");	//Hej, nie jestem twoim lokajem.
	Info_ClearChoices(dia_bullco_wasnun);
	Info_AddChoice(dia_bullco_wasnun,"Jak sobie chcesz.",dia_bullco_wasnun_woandere_zuihnen_alleine);
	Info_AddChoice(dia_bullco_wasnun,"Ciesz siê, ¿e darujê ci ¿ycie.",dia_bullco_wasnun_woandere_zuihnen_lebenlassen);
	Info_AddChoice(dia_bullco_wasnun,"Zap³acê ci za to 50 sztuk z³ota.",dia_bullco_wasnun_woandere_zuihnen_geld);
};

func void dia_bullco_wasnun_woandere_zuihnen_lebenlassen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");	//Bêdziesz mia³ szczêœcie, jeœli darujê ci ¿ycie.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");	//Zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_woandere_zuihnen_geld()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");	//Zap³acê ci za to 50 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");	//Niech bêdzie. Dawaj kasê.
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");	//ChodŸ za mn¹. Poka¿ê ci, gdzie ostatnio widzia³em jednego z tamtych ³owców smoków.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DJGVorposten");
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");	//Ty nie masz 50 z³otych monet, a ja nie dam siê nabraæ. Spadaj.
		AI_StopProcessInfos(self);
	};
};

func void dia_bullco_wasnun_woandere_zuihnen_alleine()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");	//Jak sobie ¿yczysz. Na pewno ich znajdziesz.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");	//Tylko siê nie zgub.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_kopfab()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00");	//Urwê ci ³eb.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01");	//Zamknij siê!
	Info_AddChoice(dia_bullco_wasnun,"Wyci¹gaj broñ! Skoñczymy to.",dia_bullco_wasnun_kopfab_angriff);
};

func void dia_bullco_wasnun_kopfab_angriff()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00");	//Wyci¹gaj broñ! Skoñczymy to.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01");	//Niech tak bêdzie!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BULLCO_PICKPOCKET(C_INFO)
{
	npc = djg_701_bullco;
	nr = 900;
	condition = dia_bullco_pickpocket_condition;
	information = dia_bullco_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bullco_pickpocket_condition()
{
	return c_beklauen(34,65);
};

func void dia_bullco_pickpocket_info()
{
	Info_ClearChoices(dia_bullco_pickpocket);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_BACK,dia_bullco_pickpocket_back);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_PICKPOCKET,dia_bullco_pickpocket_doit);
};

func void dia_bullco_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bullco_pickpocket);
};

func void dia_bullco_pickpocket_back()
{
	Info_ClearChoices(dia_bullco_pickpocket);
};

