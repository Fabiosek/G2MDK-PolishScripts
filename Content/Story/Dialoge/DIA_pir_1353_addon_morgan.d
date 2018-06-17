
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
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Id� spa�.
		if(MORGAN_PERM_COUNTER == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//Doskona�y pomys�.
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
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Obud� mnie, kiedy b�dzie si� co� dzia�o.
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
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Wspaniale! Teraz Greg wys�a� mnie do pi�owania desek!
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//Mi�ego szlachtowania potwor�w!
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
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//Jack Aligator ju� wr�ci�?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//Nie? No to pewnie nied�ugo wr�ci. Dobranoc.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_MEAT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 2;
	condition = dia_addon_morgan_meat_condition;
	information = dia_addon_morgan_meat_info;
	description = "Przynosz� mi�so.";
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
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//Przynosz� mi�so.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//Zaraz. Najpierw musz� si� napi�.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//No, ju� lepiej. Dobrze, powt�rz mi, czego chcesz.
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//Jack Aligator kaza� mi przynie�� to mi�so.
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
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co? To wszystko? Reszt� pewnie ze�ar�e�? No, niewa�ne...
	};
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Odda�em mi�so Morganowi.");
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
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg powierzy� mi dow�dztwo nad jedn� z dw�ch grup aborda�owych.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jestem odpowiedzialny za zaopatrzenie, kt�re dostarcza nam Jack Aligator.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Odpowiadam te� za to, aby okoliczne stwory nie zbli�y�y si� zanadto do obozu.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//Pomagaj� mi w tym moi ch�opcy.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//Powiedzia�em im, �e ma tu by� spokojnie, kiedy kapitan Greg wr�ci.
	};
};


instance DIA_ADDON_MORGAN_SLEEP(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 4;
	condition = dia_addon_morgan_sleep_condition;
	information = dia_addon_morgan_sleep_info;
	description = "Robisz co� konkretnego?";
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
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//Robisz co� konkretnego?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Ej, wolnego!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Moja praca jest bardzo wa�na.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Nadzoruj� szkolenie moich ludzi.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//Staram si� ich zmieni� w nieustraszonych wilk�w morskich, najlepszych pirat�w, jacy kiedykolwiek �eglowali po tych wodach.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Nie wys�uguj� si� lud�mi.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Ka�dy z nich dostaje niez�y grosz za swoj� robot�.
};


instance DIA_ADDON_MORGAN_JOINMORGAN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_joinmorgan_condition;
	information = dia_addon_morgan_joinmorgan_info;
	description = "Chc� do��czy� do waszej grupy.";
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
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chc� do��czy� do waszej grupy.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//Do nas? Moi ch�opcy na razie obijaj� si� na pla�y.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//I nawet palcem nie kiwn�, p�ki kapitan nie wr�ci. To wiem na pewno.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale je�li chcesz pokaza�, na co ci� sta�, mo�esz oczy�ci� pla�� na p�nocy.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Pe�no tam r�nego �miecia.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Je�li si� tego pozb�dziesz, ch�opaki na pewno ci� zaakceptuj�.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Witam w mojej ekipie. No, a teraz wracam do obowi�zkowego wypoczynku.
	Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Teraz nale�� do ekipy Morgana i mam oczy�ci� ze stwor�w p�nocn� pla��.");
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
	description = "P�nocna pla�a zosta�a oczyszczona.";
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
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//P�nocna pla�a zosta�a oczyszczona.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co z jaskini�? By�e� tam?
	if(Npc_IsDead(beachshadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Pewnie.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//�wietnie. Jeste� w porz�dku.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Oto twoja zap�ata.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Pla�a zosta�a oczyszczona. Wszystkie stwory nie �yj�.");
		MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Eee...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To te� cz�� twojego zadania. Wr��, kiedy ju� z ni� sko�czysz.
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Morgan chce te�, bym zaj�� si� jaskini�.");
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
	description = "Jest jeszcze co�, co mog� zrobi�?";
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
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Jest jeszcze co�, co mog� zrobi�?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Na razie nie.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Znajd� sobie jak�� koj� i zdob�d� solidn� butelk� rumu.
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
	description = "Je�li chodzi o Angusa i Hanka...";
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
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//Je�li chodzi o Angusa i Hanka...
	if(MORGAN_ANGUSSTORY == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Nawet mi o tym nie m�w!
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pewnie dorwali ich bandyci.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A ten dra� Angus mia� przy sobie m�j pier�cie�.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//No dobra, to by� ju� jego pier�cie�. Uczciwie wygra� go w ko�ci.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale ja pewnie bym si� odegra�, a tak - jak kamie� w wod�.
		MORGAN_ANGUSSTORY = TRUE;
	};
	Info_ClearChoices(dia_addon_morgan_foundthem);
	if(Npc_HasItems(other,itri_addon_morgansring_mission) > 0)
	{
		Info_AddChoice(dia_addon_morgan_foundthem,"Znalaz�em ich.",dia_addon_morgan_foundthem_now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Je�li znajdziesz gdzie� m�j pier�cie�, przynie� mi go, a ja ci to wynagrodz�.
	};
};

func void dia_addon_morgan_foundthem_now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Znalaz�em ich.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//I co? Mam ci p�aci� za ka�d� nowin�? Gdzie s�?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Nie �yj�.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//A pier�cie�? Co z nim?
	Info_ClearChoices(dia_addon_morgan_foundthem);
	Info_AddChoice(dia_addon_morgan_foundthem,"Oto on.",dia_addon_morgan_foundthem_givering);
	Info_AddChoice(dia_addon_morgan_foundthem,"Nie by�o go przy nich.",dia_addon_morgan_foundthem_noring);
};

func void dia_addon_morgan_foundthem_noring()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Nie by�o go przy nich.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//Co? Id� i sprawd� jeszcze raz! Musieli go mie�.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//To ma�y pier�cie�, bardzo �adnie zdobiony.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//Musisz go znale��! Musisz! S�yszysz?
	Info_ClearChoices(dia_addon_morgan_foundthem);
};

func void dia_addon_morgan_foundthem_givering()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Oto on.
	b_giveinvitems(other,self,itri_addon_morgansring_mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//Tak, to on! Jeste� naprawd� dobrym cz�owiekiem, wiesz?
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//We� t� kamienn� tabliczk�. Mo�e wygl�da niepozornie, ale Garett da ci za ni� niez�� sumk�.
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
	description = "Co my�lisz o Francisie?";
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
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co my�lisz o Francisie?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//A co mnie on obchodzi? Nic do niego nie mam, je�li on nie ma nic do mnie.
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Czy on nie jest tu szefem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//My�li, �e jest tu szefem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//Ale Greg kiedy� wr�ci i wtedy Francis p�jdzie pi�owa� deski.
};


instance DIA_ADDON_MORGAN_TRAIN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_train_condition;
	information = dia_addon_morgan_train_info;
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Pewnie. Mog� ci� podszkoli� w walce broni� jednor�czn�.
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
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Pami�taj o jednym. Ca�a ta gadka o honorze to jeden wielki stek bzdur. Albo ty jego, albo on ciebie. To wszystko.
			MORGAN_LABERCOUNT = 1;
		}
		else if(MORGAN_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//Musisz nauczy� si� zadawa� mocniejsze ciosy.
			MORGAN_LABERCOUNT = 2;
		}
		else if(MORGAN_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Ha ha ha! Przynajmniej umiesz ju� prawid�owo trzyma� bro�.
			MORGAN_LABERCOUNT = 0;
		};
	}
	else if(other.hitchance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Je�li chcesz nauczy� si� czego� wi�cej, musisz znale�� innego nauczyciela.
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

