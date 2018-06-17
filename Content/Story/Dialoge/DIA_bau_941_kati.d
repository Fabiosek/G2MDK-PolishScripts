
instance DIA_KATI_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_exit_condition;
	information = dia_kati_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_kati_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_SLDNOCHDA(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_sldnochda_condition;
	information = dia_kati_sldnochda_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_kati_sldnochda_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_kati_sldnochda_info()
{
	var int hilfe;
	if(hilfe == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//Te rzezimieszki gro¿¹ mojemu mê¿owi! Jesteœmy obywatelami miasta, lojalnymi wobec naszego Króla! A oni chc¹ nas obrabowaæ!
		hilfe = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//Nie stój tak, zrób coœ! Pomo¿esz nam?
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Farmie Akila zagra¿aj¹ najemnicy.");
	AI_StopProcessInfos(self);
};


instance DIA_KATI_HALLO(C_INFO)
{
	npc = bau_941_kati;
	nr = 5;
	condition = dia_kati_hallo_condition;
	information = dia_kati_hallo_info;
	permanent = FALSE;
	description = "Wszystko w porz¹dku?";
};


func int dia_kati_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_kati_hallo_info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//Czy wszystko w porz¹dku?
	if(Npc_IsDead(akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//Mój ukochany m¹¿ nie ¿yje! Innosie! Za jakie grzechy tak mnie pokara³eœ?
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(randolph,"Start");
		b_giveplayerxp(XP_AKIL_TOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//Tak, wszystko w porz¹dku, dziêkujê.
	};
};


instance DIA_KATI_ESSEN(C_INFO)
{
	npc = bau_941_kati;
	nr = 12;
	condition = dia_kati_essen_condition;
	information = dia_kati_essen_info;
	permanent = FALSE;
	description = "Akil mówi, ¿e masz dla mnie jedzenie.";
};


func int dia_kati_essen_condition()
{
	if((KATI_MAHLZEIT == TRUE) && (Npc_IsDead(akil) == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_essen_info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//Akil mówi, ¿e masz dla mnie jedzenie.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//Od czasu kiedy upad³a Bariera, zrobi³o siê tutaj bardzo niebezpiecznie. To dla nas ciê¿kie czasy.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//Proszê, masz tu kawa³ek chleba, odrobinê miêsa i parê ³yków wody. Obawiam siê, ¿e nie mogê sobie pozwoliæ na poczêstowanie ciê czymœ innym.
	b_giveinvitems(self,other,itfo_bread,1);
	b_giveinvitems(self,other,itfo_water,1);
	b_giveinvitems(self,other,itfomutton,1);
};


instance DIA_KATI_BALTRAM(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_baltram_condition;
	information = dia_kati_baltram_info;
	permanent = FALSE;
	description = "Baltram mnie przys³a³...";
};


func int dia_kati_baltram_condition()
{
	if(Npc_IsDead(akil) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && (LIEFERUNG_GEHOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_baltram_info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//Przysy³a mnie Baltram. Mam odebraæ dla niego dostawê.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//Ale¿ oczywiœcie. Proszê, wszystko zapakowa³am.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_KATI_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_941_kati;
	nr = 6;
	condition = dia_kati_bauernaufstand_condition;
	information = dia_kati_bauernaufstand_info;
	permanent = FALSE;
	description = "Czemu nie bronicie siê przed tyrani¹ Onara?";
};


func int dia_kati_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//Czemu nie bronicie siê przed tyrani¹ Onara?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//Dla farmerów mieszkaj¹cych w pobli¿u miasta lepiej jest polegaæ na stra¿nikach ni¿ na najemnikach Onara.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//Z drugiej strony, Bengar i Sekob prêdzej porzuc¹ swoje farmy, ni¿ zaczn¹ pracowaæ dla Króla.
};


instance DIA_KATI_ANDEREHOEFE(C_INFO)
{
	npc = bau_941_kati;
	nr = 7;
	condition = dia_kati_anderehoefe_condition;
	information = dia_kati_anderehoefe_info;
	permanent = FALSE;
	description = "Gdzie maj¹ swoje farmy Bengar i Sekob?";
};


func int dia_kati_anderehoefe_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_anderehoefe_info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//Gdzie maj¹ swoje farmy Bengar i Sekob?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//Mieszkaj¹ niedaleko posiad³oœci Onara. Udaj siê st¹d na wschód, a znajdziesz ich bez trudu.
};


instance DIA_KATI_HIERWEG(C_INFO)
{
	npc = bau_941_kati;
	nr = 9;
	condition = dia_kati_hierweg_condition;
	information = dia_kati_hierweg_info;
	permanent = FALSE;
	description = "Czy kiedykolwiek myœla³aœ o tym, ¿eby siê st¹d wyprowadziæ?";
};


func int dia_kati_hierweg_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_hierweg_info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//Czy kiedykolwiek myœla³aœ o tym, ¿eby siê st¹d wyprowadziæ?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//Nie jest ³atwo uciec z tej czêœci kraju. Wokó³ naszych ziem roztacza siê pasmo wysokich gór.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//Istniej¹ dwie drogi, którymi mo¿na siê st¹d wydostaæ: morze i prze³êcz wiod¹ca do Górniczej Doliny.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//Poniewa¿ nie mo¿emy sobie pozwoliæ na podró¿ statkiem, a Górnicza Dolina jest miejscem, z którego nie ma powrotu, bêdziemy musieli tu zostaæ.
};


instance DIA_KATI_PASS(C_INFO)
{
	npc = bau_941_kati;
	nr = 10;
	condition = dia_kati_pass_condition;
	information = dia_kati_pass_info;
	permanent = FALSE;
	description = "Co wiesz na temat prze³êczy?";
};


func int dia_kati_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hierweg))
	{
		return TRUE;
	};
};

func void dia_kati_pass_info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//Co wiesz o prze³êczy?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//Nigdy na niej nie by³am, ale wiem, ¿e znajduje siê gdzieœ w okolicy farmy Bengara.
};


instance DIA_KATI_PERMKAP1(C_INFO)
{
	npc = bau_941_kati;
	nr = 11;
	condition = dia_kati_permkap1_condition;
	information = dia_kati_permkap1_info;
	permanent = TRUE;
	description = "Uwa¿aj na swojego mê¿a.";
};


func int dia_kati_permkap1_condition()
{
	if(!c_npcisdown(akil) && Npc_KnowsInfo(other,dia_kati_hallo) && Npc_KnowsInfo(other,dia_kati_bauernaufstand) && Npc_KnowsInfo(other,dia_kati_anderehoefe) && Npc_KnowsInfo(other,dia_kati_hierweg) && Npc_KnowsInfo(other,dia_kati_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_kati_permkap1_info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//Uwa¿aj na swojego mê¿a.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//Zrobiê, co w mojej mocy.
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP3_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap3_exit_condition;
	information = dia_kati_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_kati_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PERM(C_INFO)
{
	npc = bau_941_kati;
	nr = 3;
	condition = dia_kati_perm_condition;
	information = dia_kati_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_kati_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_perm_info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//Jakoœ dajemy sobie radê. Zastanawiam siê, jak d³ugo jeszcze bêdziemy siê musieli opieraæ tym czarnym diab³om.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//D³u¿ej ju¿ tego nie zniosê. Buszuj¹ po naszym domu i ca³y czas wydaj¹ z siebie te denerwuj¹ce dŸwiêki.
};


instance DIA_KATI_KAP4_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap4_exit_condition;
	information = dia_kati_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_kati_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP5_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap5_exit_condition;
	information = dia_kati_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_kati_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP6_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap6_exit_condition;
	information = dia_kati_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_kati_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PICKPOCKET(C_INFO)
{
	npc = bau_941_kati;
	nr = 900;
	condition = dia_kati_pickpocket_condition;
	information = dia_kati_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_kati_pickpocket_condition()
{
	return c_beklauen(13,15);
};

func void dia_kati_pickpocket_info()
{
	Info_ClearChoices(dia_kati_pickpocket);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_BACK,dia_kati_pickpocket_back);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_PICKPOCKET,dia_kati_pickpocket_doit);
};

func void dia_kati_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kati_pickpocket);
};

func void dia_kati_pickpocket_back()
{
	Info_ClearChoices(dia_kati_pickpocket);
};

