
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//STÓJ - w imiê Innosa! Jestem Marcos, królewski paladyn. Mów czego chcesz, i lepiej mów prawdê!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//Wybraniec Innosa zawsze mówi prawdê.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Wybacz mi, dostojny magu. Nie zdawa³em sobie sprawy, z kim rozmawiam.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//Nic siê nie sta³o.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//Czy wolno mi wiedzieæ, co sprowadza ciê w te strony?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Spokojnie - wype³niam rozkazy Lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//Jesteœ ¿o³nierzem. Co ciê tu sprowadza?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Spokojnie, obaj pracujemy dla Lorda Hagena.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Od kiedy to Lord Hagen zatrudnia najemników? Mów - czego tu szukasz?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "Muszê dostarczyæ Lordowi Hagenowi dowód na istnienie smoków.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//Muszê dostarczyæ Lordowi Hagenowi dowód na istnienie smoków.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Nie traæ zatem czasu i nie nadstawiaj niepotrzebnie karku.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Czy s¹dzisz, ¿e znajdziesz tutaj smocz¹ ³uskê, któr¹ bêdziesz mu móg³ pokazaæ?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//IdŸ do zamku i porozmawiaj z kapitanem Garondem.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//Musi siê dowiedzieæ, ¿e wype³niasz misjê powierzon¹ ci przez Lorda Hagena! Na pewno udzieli ci pomocy.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "Przysy³a mnie Garond...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//Przysy³a mnie Garond - kaza³ mi siê dowiedzieæ, ile rudy zdo³aliœcie wydobyæ.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Powiedz Garondowi, ¿e musieliœmy przerwaæ wydobycie z powodu nasilaj¹cych siê ataków orków.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//Próbowa³em dotrzeæ do zamku wraz z grup¹ swoich ludzi, ale tylko ja prze¿y³em.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//Ruda znajduje siê w bezpiecznym miejscu. Wydobyliœmy CZTERY skrzynie. IdŸ zameldowaæ o tym Garondowi.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Powiedz mu, ¿e bêdê broni³ tej rudy, dopóki starczy mi si³. Nie wiem jednak, jak d³ugo jeszcze zdo³am unikaæ orków.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Powiedz mu, ¿e potrzebujê wsparcia.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//Dam mu znaæ.
	b_logentry(TOPIC_SCOUTMINE,"Paladyn Marcos strze¿e w niewielkiej dolinie CZTERECH skrzyñ rudy.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"Marcos chce, aby Garond wys³a³ mu posi³ki.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "Jak wygl¹da sytuacja?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//Jak sytuacja?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//Potrzebujê solidnego ³yka mikstury leczniczej!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//Wytrzymam - ale liczê na to, ¿e Garond nied³ugo przyœle mi wsparcie.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Dziêkujê ci za pomoc. Niechaj Innos da nam si³ê.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//Nie poddam siê! Innos daje mi si³ê!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

