
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "Czy to twoje owce?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Czy to twoje owce?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Jedyna, która do mnie nale¿y, reaguje na imiê Lucy. To moja ¿ona...
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Owce s¹ w³asnoœci¹ stra¿y. Przyprowadzaj¹ do mnie wszystkie biedulki, które zabior¹ farmerom.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ch³opie, ten œwir z m³otkiem mnie dobija.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//O kim ty mówisz?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Nie s³yszysz tego walenia? A jak myœlisz, kto w porcie przez ca³y dzieñ t³ucze m³otkiem?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//O tym wariacie, Fellanie. Codziennie zabiera ze sob¹ m³otek do szopy.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "Mogê siê zaj¹æ Fellanem...";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Mogê siê zaj¹æ Fellanem...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Chcesz mi pomóc? A jaki masz w tym interes?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ty mi to powiedz.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ach, o to chodzi! Dobra - jeœli przestanie waliæ tym m³otkiem, to zap³acê ci 25 sztuk z³ota.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Ale muszê ci coœ powiedzieæ - nie zdo³asz go przekonaæ. To œwir. Dotrze do niego tylko wtedy, jak mu zdrowo przy³o¿ysz!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Alwin chce, abym zmusi³ Fellana do przerwania prac na dachu. Zabójstwo nie jest dobr¹ metod¹.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"Zobaczê, co da siê zrobiæ...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"Jeœli go pobijê, bêdê mia³ k³opoty ze stra¿¹...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Zobaczê, co da siê zrobiæ...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Zastanów siê. Pamiêtaj, p³acê 25 z³otych monet.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Jeœli go pobijê, bêdê mia³ k³opoty ze stra¿¹...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Tutaj w porcie nikt nie zwraca specjalnej uwagi na walki...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Ale jeœli kogoœ tu okradniesz, albo zaczniesz coœ kombinowaæ z owcami, to wpadniesz w k³opoty.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Fellan ju¿ nie bêdzie wali³ m³otkiem.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan ju¿ nie bêdzie wali³ m³otkiem.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//S³yszysz? Koniec z tym ha³asem! W koñcu. Myœla³em, ¿e ten koleœ nigdy nie zrezygnuje.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Zrobi³eœ mi wielk¹ przys³ugê. Wiesz co, dam ci 30 sztuk z³ota.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "A co z owcami?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//A co z owcami?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Fellan ci¹gle ha³asuje i to je doprowadza do szaleñstwa. Któregoœ dnia ca³kiem zeœwiruj¹.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Owce jedz¹ i robi¹ siê coraz grubsze. Ca³kiem jak moja ¿ona. HA HA HA.
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Chyba bêdê musia³ jedn¹ z nich zaszlachtowaæ. Na ostatni¹ wieczerzê!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Po co?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Dla najemnika, który zamordowa³ paladyna. Oczywiœcie strac¹ go za to.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Muszê tylko zdecydowaæ, które stworzonko powêdruje do rzeŸni.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy ma wielkie szczêœcie, ¿e jeszcze ¿yje.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Myœla³em, ¿e Lucy jest twoj¹ ¿on¹.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Racja, ale jedn¹ owcê te¿ nazwa³em Lucy. Tê, która mia³a byæ ostatnim posi³kiem Benneta.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Ale wszystko siê jakoœ u³o¿y³o. Lucy bêdzie zadowolona.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Po pewnym czasie obserwowanie, jak owce jedz¹, staje siê doœæ nudne.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Muszê siê z nimi po¿egnaæ. Lord Hagen postanowi³, ¿e wszystkie owce pójd¹ na po¿ywienie dla armii.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Có¿, przynajmniej bêdê mia³ wiêcej czasu dla ¿ony.
	};
};

