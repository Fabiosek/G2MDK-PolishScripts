
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Witaj, jestem tu nowy.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Nie chcia³bym, ¿ebyœ to odebra³ w niew³aœciwy sposób, ale nie mam teraz ochoty na pogawêdkê - jestem zupe³nie wykoñczony.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Masz strasznie du¿o pracy, co?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Racja. Bennet wyrabia tyle broni, ¿e ledwie nad¹¿am z jej polerowaniem.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o farmie?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Co mo¿esz mi powiedzieæ o farmie?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//To jest farma Onara.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//A ten du¿y budynek to jego dom. Jedno skrzyd³o zajmuj¹ najemnicy.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//Odk¹d siê sprowadzili, my, farmerzy, musimy mieszkaæ w stodole.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//Ale mi to nie przeszkadza, to dobrze, ¿e ktoœ pilnuje farmy.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Ten budynek to kuchnia.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Kuchnia znajduje siê na ty³ach kuŸni.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Przy odrobinie szczêœcia mo¿e za³apiesz siê na coœ do jedzenia.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "A o co chodzi z tymi najemnikami?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//A o co chodzi z tymi najemnikami?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar wynaj¹³ ich, ¿eby obroniæ siê przed stra¿¹.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Najemnicy chroni¹ tak¿e farmê, trzodê i farmerów.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Wiêc ¿eby ci nie przysz³o do g³owy coœ ukraœæ.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Oni tylko czekaj¹ na pretekst, ¿eby ciê zbiæ na kwaœne jab³ko.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Mogê od ciebie kupiæ broñ?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Mogê kupiæ u ciebie jak¹œ broñ?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//Wybór jest doœæ ubogi. Wiêkszoœæ mieczy i toporów trafia do Onara.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Dlaczego nie pracujesz?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Dlaczego nie pracujesz?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Jeszcze nie s³ysza³eœ? Paladyni aresztowali Benneta.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Kowal Bennet zosta³ aresztowany w mieœcie przez paladynów.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "Co siê sta³o?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//Byliœmy na zakupach w mieœcie, kiedy nagle us³yszeliœmy krzyk: 'Tu s¹, pojmaæ ich!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//O rany, ale siê przestraszy³em! Ucieka³em, jakby œciga³o mnie ca³e stado demonów.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Bennet by³ tu¿ za mn¹. Nie wiem, co siê sta³o, ale kiedy dotar³em do bram miasta, jego ju¿ nie by³o.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Musia³ siê zgubiæ gdzieœ po drodze.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "Jaki zarzut postawiono Bennetowi?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Jaki zarzut postawiono Bennetowi?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Morderstwo! Podobno zabi³ paladyna. Co za wierutna bzdura! Przez ca³y czas by³ tu¿ obok mnie.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Wiêc dlaczego nie pójdziesz do miasta i nie wyjaœnisz ca³ej sprawy?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//Zamknêliby mnie do pud³a jako jego wspólnika. Szczególnie w obecnej sytuacji.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Sytuacji?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//No wiesz, Onar. To siê musia³o tak skoñczyæ.
	b_logentry(TOPIC_RESCUEBENNET,"Podobno Bennet zamordowa³ paladyna. Jego czeladnik Hodges twierdzi, ¿e to nieprawda, jednak boi siê oœwiadczyæ to w mieœcie.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "Jak zareagowali na to wasi najemnicy?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//Jak zareagowali na to wasi najemnicy?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Oczywiœcie nie wiem dok³adnie, co zamierzaj¹, ale niektórzy z nich s¹ naprawdê wkurzeni.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//Domyœlam siê.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Gdyby to zale¿a³o od nich, natychmiast zaatakowaliby miasto, ¿eby odbiæ Benneta.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Porozmawiaj z Lee, mo¿e coœ da siê zrobiæ.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

