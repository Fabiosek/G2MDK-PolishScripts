
var int morgan_perm_counter;

instance DIA_ADDON_MORGAN_EXIT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 999;
	condition = dia_addon_morgan_exit_condition;
	information = dia_addon_morgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_morgan_exit_condition()
{
	return TRUE;
};

func int dia_addon_morgan_exit_info()
{
	if(GREGISBACK == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//IdŸ spaæ.
		if(MORGAN_PERM_COUNTER == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//Doskona³y pomys³.
			MORGAN_PERM_COUNTER = 1;
		}
		else if(MORGAN_PERM_COUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//W takim razie dobranoc.
			MORGAN_PERM_COUNTER = 2;
		}
		else if(MORGAN_PERM_COUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//No i co jeszcze?
			MORGAN_PERM_COUNTER = 3;
		}
		else if(MORGAN_PERM_COUNTER == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//ObudŸ mnie, kiedy bêdzie siê coœ dzia³o.
			MORGAN_PERM_COUNTER = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_PICKPOCKET(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 900;
	condition = dia_addon_morgan_pickpocket_condition;
	information = dia_addon_morgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_morgan_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_morgan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_BACK,dia_addon_morgan_pickpocket_back);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_PICKPOCKET,dia_addon_morgan_pickpocket_doit);
};

func void dia_addon_morgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};

func void dia_addon_morgan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};


instance DIA_ADDON_MORGAN_ANHEUERN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_anheuern_condition;
	information = dia_addon_morgan_anheuern_info;
	important = TRUE;
};


func int dia_addon_morgan_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GREGISBACK == TRUE))
	{
		return TRUE;
	};
};

func int dia_addon_morgan_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Wspaniale! Teraz Greg wys³a³ mnie do pi³owania desek!
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//Mi³ego szlachtowania potworów!
	};
};


instance DIA_ADDON_MORGAN_HELLO(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_hello_condition;
	information = dia_addon_morgan_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_morgan_hello_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == FALSE) && Npc_IsInState(self,zs_talk) && (Npc_IsDead(alligatorjack) == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Ej, ty!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//Tak? Czego chcesz?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//Jack Aligator ju¿ wróci³?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//Nie? No to pewnie nied³ugo wróci. Dobranoc.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_MEAT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 2;
	condition = dia_addon_morgan_meat_condition;
	information = dia_addon_morgan_meat_info;
	description = "Przynoszê miêso.";
};


func int dia_addon_morgan_meat_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_meat_info()
{
	var int givenmeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//Przynoszê miêso.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//Zaraz. Najpierw muszê siê napiæ.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//No, ju¿ lepiej. Dobrze, powtórz mi, czego chcesz.
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//Jack Aligator kaza³ mi przynieœæ to miêso.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//No tak, teraz sobie przypominam. Dawaj je tu!
	givenmeat = Npc_HasItems(other,itfomuttonraw);
	if(givenmeat > 10)
	{
		givenmeat = 10;
	};
	b_giveinvitems(other,self,itfomuttonraw,givenmeat);
	if(givenmeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co? To wszystko? Resztê pewnie ze¿ar³eœ? No, niewa¿ne...
	};
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Odda³em miêso Morganowi.");
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ALLIGATORJACK_BRINGMEAT);
};


instance DIA_ADDON_MORGAN_JOB(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 3;
	condition = dia_addon_morgan_job_condition;
	information = dia_addon_morgan_job_info;
	description = "Co tu robisz?";
};


func int dia_addon_morgan_job_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_meat))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_job_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg powierzy³ mi dowództwo nad jedn¹ z dwóch grup aborda¿owych.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jestem odpowiedzialny za zaopatrzenie, które dostarcza nam Jack Aligator.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Odpowiadam te¿ za to, aby okoliczne stwory nie zbli¿y³y siê zanadto do obozu.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//Pomagaj¹ mi w tym moi ch³opcy.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//Powiedzia³em im, ¿e ma tu byæ spokojnie, kiedy kapitan Greg wróci.
	};
};


instance DIA_ADDON_MORGAN_SLEEP(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 4;
	condition = dia_addon_morgan_sleep_condition;
	information = dia_addon_morgan_sleep_info;
	description = "Robisz coœ konkretnego?";
};


func int dia_addon_morgan_sleep_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_job))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_sleep_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//Robisz coœ konkretnego?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Ej, wolnego!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Moja praca jest bardzo wa¿na.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Nadzorujê szkolenie moich ludzi.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//Staram siê ich zmieniæ w nieustraszonych wilków morskich, najlepszych piratów, jacy kiedykolwiek ¿eglowali po tych wodach.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Nie wys³ugujê siê ludŸmi.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Ka¿dy z nich dostaje niez³y grosz za swoj¹ robotê.
};


instance DIA_ADDON_MORGAN_JOINMORGAN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_joinmorgan_condition;
	information = dia_addon_morgan_joinmorgan_info;
	description = "Chcê do³¹czyæ do waszej grupy.";
};


func int dia_addon_morgan_joinmorgan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_joinmorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chcê do³¹czyæ do waszej grupy.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//Do nas? Moi ch³opcy na razie obijaj¹ siê na pla¿y.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//I nawet palcem nie kiwn¹, póki kapitan nie wróci. To wiem na pewno.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale jeœli chcesz pokazaæ, na co ciê staæ, mo¿esz oczyœciæ pla¿ê na pó³nocy.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Pe³no tam ró¿nego œmiecia.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Jeœli siê tego pozbêdziesz, ch³opaki na pewno ciê zaakceptuj¹.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Witam w mojej ekipie. No, a teraz wracam do obowi¹zkowego wypoczynku.
	Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Teraz nale¿ê do ekipy Morgana i mam oczyœciæ ze stworów pó³nocn¹ pla¿ê.");
	MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_LURKERPLATT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 6;
	condition = dia_addon_morgan_lurkerplatt_condition;
	information = dia_addon_morgan_lurkerplatt_info;
	permanent = TRUE;
	description = "Pó³nocna pla¿a zosta³a oczyszczona.";
};


func int dia_addon_morgan_lurkerplatt_condition()
{
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && (MIS_ADDON_MORGANLURKER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//Pó³nocna pla¿a zosta³a oczyszczona.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co z jaskini¹? By³eœ tam?
	if(Npc_IsDead(beachshadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Pewnie.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//Œwietnie. Jesteœ w porz¹dku.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Oto twoja zap³ata.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Pla¿a zosta³a oczyszczona. Wszystkie stwory nie ¿yj¹.");
		MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Eee...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To te¿ czêœæ twojego zadania. Wróæ, kiedy ju¿ z ni¹ skoñczysz.
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Morgan chce te¿, bym zaj¹³ siê jaskini¹.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_MORGAN_AUFTRAG2(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_auftrag2_condition;
	information = dia_addon_morgan_auftrag2_info;
	permanent = TRUE;
	description = "Jest jeszcze coœ, co mogê zrobiæ?";
};


func int dia_addon_morgan_auftrag2_condition()
{
	if(MIS_ADDON_MORGANLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_auftrag2_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Jest jeszcze coœ, co mogê zrobiæ?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Na razie nie.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//ZnajdŸ sobie jak¹œ kojê i zdob¹dŸ solidn¹ butelkê rumu.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaach. To jest trunek!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Najlepiej spytaj o to kapitana.
	};
	AI_StopProcessInfos(self);
};


var int morgan_angusstory;

instance DIA_ADDON_MORGAN_FOUNDTHEM(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 7;
	condition = dia_addon_morgan_foundthem_condition;
	information = dia_addon_morgan_foundthem_info;
	permanent = TRUE;
	description = "Jeœli chodzi o Angusa i Hanka...";
};


func int dia_addon_morgan_foundthem_condition()
{
	if((MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_skip_angushank))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_foundthem_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//Jeœli chodzi o Angusa i Hanka...
	if(MORGAN_ANGUSSTORY == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Nawet mi o tym nie mów!
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pewnie dorwali ich bandyci.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A ten drañ Angus mia³ przy sobie mój pierœcieñ.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//No dobra, to by³ ju¿ jego pierœcieñ. Uczciwie wygra³ go w koœci.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale ja pewnie bym siê odegra³, a tak - jak kamieñ w wodê.
		MORGAN_ANGUSSTORY = TRUE;
	};
	Info_ClearChoices(dia_addon_morgan_foundthem);
	if(Npc_HasItems(other,itri_addon_morgansring_mission) > 0)
	{
		Info_AddChoice(dia_addon_morgan_foundthem,"Znalaz³em ich.",dia_addon_morgan_foundthem_now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Jeœli znajdziesz gdzieœ mój pierœcieñ, przynieœ mi go, a ja ci to wynagrodzê.
	};
};

func void dia_addon_morgan_foundthem_now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Znalaz³em ich.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//I co? Mam ci p³aciæ za ka¿d¹ nowinê? Gdzie s¹?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Nie ¿yj¹.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//A pierœcieñ? Co z nim?
	Info_ClearChoices(dia_addon_morgan_foundthem);
	Info_AddChoice(dia_addon_morgan_foundthem,"Oto on.",dia_addon_morgan_foundthem_givering);
	Info_AddChoice(dia_addon_morgan_foundthem,"Nie by³o go przy nich.",dia_addon_morgan_foundthem_noring);
};

func void dia_addon_morgan_foundthem_noring()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Nie by³o go przy nich.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//Co? IdŸ i sprawdŸ jeszcze raz! Musieli go mieæ.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//To ma³y pierœcieñ, bardzo ³adnie zdobiony.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//Musisz go znaleŸæ! Musisz! S³yszysz?
	Info_ClearChoices(dia_addon_morgan_foundthem);
};

func void dia_addon_morgan_foundthem_givering()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Oto on.
	b_giveinvitems(other,self,itri_addon_morgansring_mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//Tak, to on! Jesteœ naprawdê dobrym cz³owiekiem, wiesz?
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//WeŸ tê kamienn¹ tabliczkê. Mo¿e wygl¹da niepozornie, ale Garett da ci za ni¹ niez³¹ sumkê.
	MIS_ADDON_MORGAN_SEEKTRAITOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGANSRING);
	Info_ClearChoices(dia_addon_morgan_foundthem);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
};


instance DIA_ADDON_MORGAN_FRANCIS(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_francis_condition;
	information = dia_addon_morgan_francis_info;
	description = "Co myœlisz o Francisie?";
};


func int dia_addon_morgan_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_morgan_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co myœlisz o Francisie?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//A co mnie on obchodzi? Nic do niego nie mam, jeœli on nie ma nic do mnie.
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Czy on nie jest tu szefem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//Myœli, ¿e jest tu szefem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//Ale Greg kiedyœ wróci i wtedy Francis pójdzie pi³owaæ deski.
};


instance DIA_ADDON_MORGAN_TRAIN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_train_condition;
	information = dia_addon_morgan_train_info;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_morgan_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_train_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Pewnie. Mogê ciê podszkoliæ w walce broni¹ jednorêczn¹.
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
	MORGAN_ADDON_TEACHPLAYER = TRUE;
};


var int morgan_merke1h;
var int morgan_labercount;

instance DIA_ADDON_MORGAN_TEACH(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_teach_condition;
	information = dia_addon_morgan_teach_info;
	permanent = TRUE;
	description = "Naucz mnie tego!";
};


func int dia_addon_morgan_teach_condition()
{
	if(MORGAN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Naucz mnie tego!
	MORGAN_MERKE1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] > MORGAN_MERKE1H)
	{
		if(MORGAN_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Pamiêtaj o jednym. Ca³a ta gadka o honorze to jeden wielki stek bzdur. Albo ty jego, albo on ciebie. To wszystko.
			MORGAN_LABERCOUNT = 1;
		}
		else if(MORGAN_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//Musisz nauczyæ siê zadawaæ mocniejsze ciosy.
			MORGAN_LABERCOUNT = 2;
		}
		else if(MORGAN_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Ha ha ha! Przynajmniej umiesz ju¿ prawid³owo trzymaæ broñ.
			MORGAN_LABERCOUNT = 0;
		};
	}
	else if(other.hitchance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Jeœli chcesz nauczyæ siê czegoœ wiêcej, musisz znaleŸæ innego nauczyciela.
	};
	Info_ClearChoices(dia_addon_morgan_teach);
};

func void dia_addon_morgan_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,1) * 5),dia_addon_morgan_teach_1h_5);
};

