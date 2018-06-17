
instance DIA_ADDON_GREG_EXIT(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 999;
	condition = dia_addon_greg_exit_condition;
	information = dia_addon_greg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_PICKPOCKET(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 900;
	condition = dia_addon_greg_pickpocket_condition;
	information = dia_addon_greg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_greg_pickpocket_condition()
{
	return c_beklauen(111,666);
};

func void dia_addon_greg_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_BACK,dia_addon_greg_pickpocket_back);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_pickpocket_doit);
};

func void dia_addon_greg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_greg_pickpocket);
};

func void dia_addon_greg_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
};


instance DIA_ADDON_GREG_IMNEW(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 1;
	condition = dia_addon_greg_imnew_condition;
	information = dia_addon_greg_imnew_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_imnew_condition()
{
	return TRUE;
};

func void dia_addon_greg_imnew_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//Ej, ty! Co robisz w mojej chacie?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//Ja...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//Nie ma mnie par� dni, a ka�dy my�li, �e mo�e robi�, co mu si� �ywnie podoba?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//Dobrze, ale co tu si� dzieje?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//A co, palisada jest sko�czona? A mo�e w kanionie nie roi si� ju� od potwor�w? Wszyscy maj� to gdzie� i le�� brzuchem do g�ry!
	GREGISBACK = TRUE;
	if(!Npc_IsDead(francis))
	{
		AI_TurnToNPC(self,francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//To wszystko, co uda�o ci si� zrobi�, Francis?
		if(c_bodystatecontains(francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//Z�a� z mojej �awki! I to ju�!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//A ty? Co takiego zrobi�e�?
	Info_ClearChoices(dia_addon_greg_imnew);
	Info_AddChoice(dia_addon_greg_imnew,"Nie by�o tego zbyt wiele.",dia_addon_greg_imnew_nich);
	if((Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0)) || (c_towerbanditsdead() == TRUE))
	{
		Info_AddChoice(dia_addon_greg_imnew,"Pracowa�em.",dia_addon_greg_imnew_turm);
	};
};

func void b_userakebilanz()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//Nie my�l, �e zapomn� o tym, co jeste� mi winien!
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//Na ca�ej wyspie zakopa�em rzeczy warte par� setek sztuk z�ota.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//A ty oczywi�cie wszystko sobie przyw�aszczy�e�, co?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//B�dziesz musia� odpracowa� sw�j d�ug.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//Teraz poznasz prawdziwe znaczenie s�owa "praca".
	};
	if(!Npc_IsDead(francis))
	{
		Npc_ExchangeRoutine(francis,"GREGISBACK");
		AI_StartState(francis,zs_saw,1,"ADW_PIRATECAMP_BEACH_19");
		FRANCIS_AUSGESCHISSEN = TRUE;
	};
	Info_ClearChoices(dia_addon_greg_imnew);
};

func void dia_addon_greg_imnew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Nie by�o tego zbyt wiele.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//Niewa�ne. Nied�ugo ci co� wynajd�, ch�opcze.
	b_userakebilanz();
};

func void dia_addon_greg_imnew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//Pracowa�em.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Co takiego?
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//Pozby�em si� bandyt�w z wie�y.
	};
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//Pla�a na p�nocy jest ju� bezpieczna.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Dobrze. Ale to i tak dopiero pocz�tek.
	b_userakebilanz();
};


instance DIA_ADDON_GREG_JOINPIRATES(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_joinpirates_condition;
	information = dia_addon_greg_joinpirates_info;
	permanent = FALSE;
	description = "Co mam zrobi�?";
};


func int dia_addon_greg_joinpirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_imnew) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_joinpirates_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//Co mam zrobi�?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//Najpierw musimy doprowadzi� to miejsce do porz�dku.
	if(Npc_IsDead(morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, ten obibok, b�dzie pi�owa� deski.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//A ty przejmiesz jego robot� i oczy�cisz kanion z tych cholernych stwor�w.
	MIS_ADDON_GREG_CLEARCANYON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CLEARCANYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CLEARCANYON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg chce, �ebym przej�� robot� po Morganie i oczy�ci� kanion z potwor�w.");
	Info_ClearChoices(dia_addon_greg_joinpirates);
	Info_AddChoice(dia_addon_greg_joinpirates,"No to id�.",dia_addon_greg_joinpirates_leave);
	if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
	{
		Info_AddChoice(dia_addon_greg_joinpirates,"Mam tam p�j�� sam?",dia_addon_greg_joinpirates_compadres);
	};
	Info_AddChoice(dia_addon_greg_joinpirates,"O jakich stworach m�wi�e�?",dia_addon_greg_joinpirates_clearcanyon);
};

func void dia_addon_greg_joinpirates_leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//No to id�.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//Chwila. Od teraz jeste� jednym z nas.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//Za�� jaki� porz�dny str�j, zanim ruszysz na polowanie.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//To jeden z naszych pancerzy. Powinien pasowa� na ciebie.
	CreateInvItems(self,itar_pir_m_addon,1);
	b_giveinvitems(self,other,itar_pir_m_addon,1);
	AI_EquipArmor(hero,itar_pir_m_addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//I nie oci�gaj si� z robot�.
	Info_ClearChoices(dia_addon_greg_joinpirates);
};

func void dia_addon_greg_joinpirates_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Mam tam p�j�� sam?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Mo�esz wzi�� paru ch�opak�w, je�li chcesz.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Powinni uczciwie popracowa�, zamiast si� leni�.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg powiedzia�, �e mog� wzi�� z sob� cz�� ch�opak�w.");
};

func void dia_addon_greg_joinpirates_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//O jakich stworach m�wi�e�?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//O brzytwiakach. Co prawda siedz� w kanionie, ale czasami podchodz� pod nasz ob�z.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//Nie chc�, �eby kt�ry� z moich ludzi zosta� po�arty.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"�cigamy tylko brzytwiaki.");
};


instance DIA_ADDON_GREG_ABOUTCANYON(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_aboutcanyon_condition;
	information = dia_addon_greg_aboutcanyon_info;
	permanent = TRUE;
	description = "W sprawie kanionu...";
};


func int dia_addon_greg_aboutcanyon_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_greg_aboutcanyon_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//W sprawie kanionu...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Tak, o co chodzi?
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
	if(c_allcanyonrazordead() == FALSE)
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,DIALOG_BACK,dia_addon_greg_aboutcanyon_back);
		if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
		{
			Info_AddChoice(dia_addon_greg_aboutcanyon,"Kto� mo�e mi w tym pom�c?",dia_addon_greg_aboutcanyon_compadres);
		};
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Jakich stwor�w mam si� pozby�?",dia_addon_greg_aboutcanyon_job);
	}
	else
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,"Pozby�em si� wszystkich brzytwiak�w.",dia_addon_greg_aboutcanyon_razorsdead);
	};
};

func void dia_addon_greg_aboutcanyon_back()
{
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Kto� mo�e mi w tym pom�c?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//We� paru ch�opak�w ze sob�.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//I tak tylko si� obijaj�.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//Jakich stwor�w mam si� pozby�?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Przede wszystkim zabij brzytwiaki. Reszta mena�erii jest stosunkowo bezpieczna.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_razorsdead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//Pozby�em si� wszystkich brzytwiak�w.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Dobrze, bardzo dobrze... Wida�, �e potrafisz to i owo.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg by� prawie pod wra�eniem, kiedy dowiedzia� si�, �e zabi�em wszystkie brzytwiaki w kanionie.");
	MIS_ADDON_GREG_CLEARCANYON = LOG_SUCCESS;
	b_addon_piratesgohome();
	b_giveplayerxp(XP_ADDON_CLEARCANYON);
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};


instance DIA_ADDON_GREG_BANDITARMOR(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditarmor_condition;
	information = dia_addon_greg_banditarmor_info;
	permanent = TRUE;
	description = "Potrzebuj� pancerza, jaki nosz� bandyci.";
};


func int dia_addon_greg_banditarmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//Potrzebuj� pancerza, jaki nosz� bandyci.
	if(MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Musisz na niego zas�u�y�. Poka�, co potrafisz, to pogadamy.
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//Najpierw za�atw wszystkie brzytwiaki.
		};
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Greg chce, �ebym pom�g� mu wprowadzi� troch� wigoru do obozu. Potem mo�emy porozmawia� o zbroi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Nie�le ci idzie.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Chcia�em, �eby Bones za�o�y� bandycki pancerz i szpiegowa� tych psubrat�w...
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//Ale s�dz�, �e ty si� lepiej nadasz do takiej roboty.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Mo�e nawet uda ci si� wyj�� stamt�d w jednym kawa�ku.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Pogadaj z Bonesem, to da ci pancerz. Na�� go i id� do obozu bandyt�w.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//Chcia�bym wiedzie�, po co te �winie sprowadzi�y si� do doliny.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Tak jest, kapitanie!
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Po zabiciu wszystkich brzytwiak�w w kanionie mog� odebra� moj� zbroj� od Bonesa.");
		Log_CreateTopic(TOPIC_ADDON_SCOUTBANDITS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_SCOUTBANDITS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Mam si� dowiedzie� dla Grega, dlaczego w�a�ciwie bandyci przybyli do doliny.");
		MIS_GREG_SCOUTBANDITS = LOG_RUNNING;
	};
};


instance DIA_ADDON_GREG_AUFTRAEGE2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_auftraege2_condition;
	information = dia_addon_greg_auftraege2_info;
	description = "Masz dla mnie jeszcze jakie� zadanie?";
};


func int dia_addon_greg_auftraege2_condition()
{
	if((MIS_GREG_SCOUTBANDITS != 0) && ((c_towerbanditsdead() == FALSE) || ((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void dia_addon_greg_auftraege2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Masz dla mnie jeszcze jakie� zadanie?
	if((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//Pla�a na p�nocy wci�� jest pe�na stwor�w.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Morgan jak zwykle si� obija.
		Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Greg chce, �ebym si� zaj�� pla��. Pe�no na niej r�nych stwor�w i trzeba j� oczy�ci�.");
		MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	};
	if(c_towerbanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//W wie�y stoj�cej w�r�d po�udniowych klif�w wci�� gnie�d�� si� bandyci.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//W sumie to Francis mia� si� tym zaj��.
		Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Greg chce, �ebym przep�dzi� bandyt�w z wie�y na po�udnie od obozu.");
		MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//Ale je�li chcesz, to mo�esz za�atwi� i t� spraw�.
};


instance DIA_ADDON_GREG_SAUBER2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_sauber2_condition;
	information = dia_addon_greg_sauber2_info;
	description = "P�nocna pla�a jest ju� bezpieczna.";
};


func int dia_addon_greg_sauber2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_sauber2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//P�nocna pla�a jest ju� bezpieczna.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Wspaniale. Oto twoja nagroda.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Powiedzia�em Gregowi, �e oczy�ci�em p�nocn� pla��.");
	MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
};


instance DIA_ADDON_GREG_BANDITPLATT2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditplatt2_condition;
	information = dia_addon_greg_banditplatt2_info;
	description = "Bandyci ju� nie wr�c� do wie�y.";
};


func int dia_addon_greg_banditplatt2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && (c_towerbanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditplatt2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//Bandyci ju� nie wr�c� do wie�y.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Doskonale. �wietnie si� spisa�e�. Oto zap�ata za tw�j trud.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandyci w wie�y nie �yj�. Greg jest bardzo zadowolony.");
	MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
};


instance DIA_ADDON_GREG_BANDITGOLDMINE(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditgoldmine_condition;
	information = dia_addon_greg_banditgoldmine_info;
	permanent = TRUE;
	description = "Bandyci odkryli kopalni� z�ota.";
};


func int dia_addon_greg_banditgoldmine_condition()
{
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (MIS_GREG_SCOUTBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditgoldmine_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//Bandyci odkryli kopalni� z�ota.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//Wiedzia�em! Dlatego tylu ich tu przylaz�o!
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nikt nie mieszka�by w�r�d tych bagien roj�cych si� od potwor�w, je�li nie mia�by naprawd� solidnego powodu.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Dobra robota. Tu jest co� dla ciebie.
	b_giveinvitems(self,other,itri_addon_str_01,1);
	b_logentry(TOPIC_ADDON_SCOUTBANDITS,"Poinformowa�em Grega o kopalni z�ota.");
	MIS_GREG_SCOUTBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_GREG_SCOUTBANDITS);
};


instance DIA_ADDON_GREG_WHOAREYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_whoareyou_condition;
	information = dia_addon_greg_whoareyou_info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int dia_addon_greg_whoareyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == FALSE) && (SC_MEETSGREGTIME == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_whoareyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//Mam na imi� Greg i jestem przyw�dc� tej garstki ludzi.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Zadowolony?
};


instance DIA_ADDON_GREG_NICETOSEEYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_nicetoseeyou_condition;
	information = dia_addon_greg_nicetoseeyou_info;
	permanent = FALSE;
	description = "Jak si� tu dosta�e�?";
};


func int dia_addon_greg_nicetoseeyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nicetoseeyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//Jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//Nie spodziewa�e� si� mnie, co?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//�eby nie by�o niedom�wie� - ja jestem Greg, a to jest m�j ob�z.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//Wszystko gra?
};


instance DIA_ADDON_GREG_STORY(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 99;
	condition = dia_addon_greg_story_condition;
	information = dia_addon_greg_story_info;
	permanent = TRUE;
	description = "Interesuje mnie jeszcze jedna rzecz.";
};


func int dia_addon_greg_story_condition()
{
	if(((Npc_KnowsInfo(other,dia_addon_greg_whoareyou) == TRUE) || (Npc_KnowsInfo(other,dia_addon_greg_nicetoseeyou) == TRUE)) && (MIS_GREG_SCOUTBANDITS != 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_story_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//Interesuje mnie jeszcze jedna rzecz.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//Co znowu?
	Info_ClearChoices(dia_addon_greg_story);
	Info_AddChoice(dia_addon_greg_story,DIALOG_BACK,dia_addon_greg_story_back);
	Info_AddChoice(dia_addon_greg_story,"Jak si� tu dosta�e�?",dia_addon_greg_story_way);
	Info_AddChoice(dia_addon_greg_story,"Gdzie jest tw�j statek?",dia_addon_greg_story_ship);
	if(RAVENISDEAD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_story,"Co wiesz o Kruku?",dia_addon_greg_story_raven);
	};
};

func void dia_addon_greg_story_back()
{
	Info_ClearChoices(dia_addon_greg_story);
};

func void dia_addon_greg_story_way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//Jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//Uda�o mi si� znale�� tunel. W starej piramidzie pilnowanej przez dw�ch mag�w.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//Niby magowie, ale nawet nie zorientowali si�, �e tam by�em.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//Najpierw my�la�em, �e to grobowiec. Chcia�em sprawdzi�, czy nie ma w nim czego� warto�ciowego.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//I tak sobie szed�em, a� nagle znalaz�em si� w mojej ukochanej dolinie.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//A ju� my�la�em, �e przez reszt� �ycia b�d� si� ukrywa� przed stra��.
};

func void dia_addon_greg_story_ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Gdzie jest tw�j statek?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//Nie uwierzysz. Od miesi�cy nie widzia�em w okolicy �adnego statku.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//Od miesi�cy, wyobra�asz sobie? I kiedy wreszcie jaki� si� pojawi�, to kr�lewski okr�t wojenny!
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Pe�en paladyn�w, od topu po kil.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//Je�li ju� mie� pecha, to na ca�ego...
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//�atwo ci m�wi�. Roznie�li nas w drzazgi jak pust� skrzyni� po owocach. Z ca�ej za�ogi tylko ja dotar�em �ywy do brzegu.
};

func void dia_addon_greg_story_raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//Co wiesz o Kruku?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//Z tego, co mi wiadomo, by� jednym z magnat�w. Wielka szycha w Kolonii.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//Nie mam poj�cia, co teraz porabia, ani czemu jego ludzie poszli za nim.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//Ale wierz mi, na pewno co� knuje. Nie nale�y do tych, co zaszywaj� si� na bagnach i chc�, �eby �wiat o nich zapomnia�.
};


instance DIA_ADDON_GREG_RAVENDEAD(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_ravendead_condition;
	information = dia_addon_greg_ravendead_info;
	description = "Kruk jest histori�.";
};


func int dia_addon_greg_ravendead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_ravendead_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//Kruk jest histori�.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Niech mnie diabli porw�! Nie spodziewa�em si� tego. Musia�e� go nie�le zaskoczy�!
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//Oto 500 sztuk z�ota. Nale�� ci si�.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//Masz charakter. Podobasz mi si�.
	b_giveplayerxp(XP_ADDON_GREGRAVENLOHN);
};

