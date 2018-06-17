
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Prosz�, prosz�, kogo tutaj mamy. Nasz wielki liberator we w�asnej osobie! Co tu robisz, bohaterze?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Potrzebuj� paru odpowiedzi.
	if(RANGER_SCKNOWSDEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Nie s�dzi�em, �e pojawisz si� tu z w�asnej woli.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to ma znaczy�?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To znaczy, �e kto� daje nagrod� za twoj� g�ow�. Nie widzia�e� jeszcze �adnych ulotek?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Jest na nich TWOJA g�ba. Tak... jeste� poszukiwanym cz�owiekiem. Nie wiedzia�e� o tym?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Kto� rozprowadza ulotki z moj� podobizn�. I kto� mi powiedzia�, �e to w�a�nie ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Kto� tu gada za du�o.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Ale masz racj�. To ja rozprowadzi�em ulotki. I co si� dzieje? Sam do mnie przychodzisz.
		MIS_STECKBRIEFE = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Ja? Nic. Ale m�j szef strasznie chcia�by ci� za�atwi�.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//Dlatego w�a�nie musia�em ci� znale��, �eby zanie�� mu twoj� g�ow�.
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Nie wierz� nawet w jedno twoje s�owo.";
};


func int dia_dexter_glaube_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierz� nawet w jedno twoje s�owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysi�gam na gr�b mojej matki!
};


instance DIA_ADDON_DEXTER_PATRICK(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_patrick_condition;
	information = dia_addon_dexter_patrick_info;
	description = "Widziano tu najemnika imieniem Patrick.";
};


func int dia_addon_dexter_patrick_condition()
{
	if((MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_patrick_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//Widziano tu najemnika imieniem Patrick.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrick? Nigdy o nim nie s�ysza�em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//A, pami�tam jednego ostro gard�uj�cego najemnika, kt�ry kr�ci� si� tu czasem ze swoj� kompani�.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//Od d�u�szego czasu go jednak nie widzia�em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//Mo�e ta kompania go obwiesi�a... Kt� to mo�e wiedzie�.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Dexter twierdzi, �e nie zna najemnika o imieniu Patrick.");
	DEXTER_KNOWSPATRICK = TRUE;
	b_giveplayerxp(XP_ADDON_DEXTER_KNOWSPATRICK);
};


instance DIA_ADDON_DEXTER_GREG(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_addon_dexter_greg_condition;
	information = dia_addon_dexter_greg_info;
	description = "Jest taki go�� z zas�oni�tym okiem. Szuka ciebie!";
};


func int dia_addon_dexter_greg_condition()
{
	if((SC_KNOWSGREGSSEARCHSDEXTER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Jest taki go�� z zas�oni�tym okiem. Szuka ciebie!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Wszyscy mnie ostatnio szukaj�... Mam si� tym przejmowa�?
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jak czego� ode mnie chce, to niech tu przyjdzie.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_DEXTER_MISSINGPEOPLE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_missingpeople_condition;
	information = dia_addon_dexter_missingpeople_info;
	description = "Podobno to ty porywasz ludzi z Khorinis.";
};


func int dia_addon_dexter_missingpeople_condition()
{
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//Podobno to ty porywasz ludzi z Khorinis.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Jednak uda�o ci si� to rozpracowa�... Gratuluj�, dobra robota.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//S�dzi�em, �e uda�o mi si� lepiej zatrze� �lady.
	Info_ClearChoices(dia_addon_dexter_missingpeople);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kto kaza� ci to robi�?",dia_addon_dexter_missingpeople_wer);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Co si� sta�o z tymi lud�mi?",dia_addon_dexter_missingpeople_wo);
};

func void dia_addon_dexter_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Co si� sta�o z tymi lud�mi? Gdzie oni s�? W okolicznych kopalniach?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//Dawno ju� ich tu nie ma. S� za g�rami na p�nocnym wschodzie, poza czyimkolwiek zasi�giem...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Niby mog� ci pokaza�, gdzie dok�adnie... Tylko po co?
};

func void dia_addon_dexter_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kto kaza� ci to robi�?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//M�j szef, gro�ny typ. Znasz go - to Kruk, jeden z Magnat�w ze Starego Obozu w G�rniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Potrzebowa� tych ludzi do swoich plan�w - tylko tyle si� dowiesz.
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kruk? Gro�ny? Hmm...",dia_addon_dexter_missingpeople_raven);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Magnat? W Khorinis?",dia_addon_dexter_missingpeople_raventot);
};

func void dia_addon_dexter_missingpeople_raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Kruk? Gro�ny? Hmm...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//A co ty tam wiesz?! Nie znasz go tak dobrze, jak ja.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//Ju� wtedy by� z niego kawa� sukinsyna, ale teraz...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Bardzo si� zmieni� po upadku Bariery. Twarz skry� mu czarny cie�.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//Jego wzrok przebija ci� niczym pazury dzikiej bestii, je�li zbyt d�ugo si� w niego wpatrze�...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Dobrze ci radz� - opu�� Khorinis, dop�ki jeszcze mo�esz to uczyni�.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//Nie czeka ci� tu nic poza �mierci�.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Dexter ma szefa, kt�ry nazywa si� Kruk. To by�y magnat. Chyba w�a�nie on jest odpowiedzialny za wszystkie porwania. Teraz potrzebuj� tylko jakiego� dowodu.");
	Info_ClearChoices(dia_addon_dexter_missingpeople);
};

func void dia_addon_dexter_missingpeople_raventot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Magnat? W Khorinis?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//Ju� nie jest Magnatem. Ma swoje tajne plany, o kt�rych Khorinis wkr�tce si� dowie...
};


instance DIA_ADDON_DEXTER_BOSS(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_addon_dexter_boss_condition;
	information = dia_addon_dexter_boss_info;
	description = "Tw�j szef? A kim�e on jest?";
};


func int dia_addon_dexter_boss_condition()
{
	if((KNOWS_DEXTER == TRUE) && (SC_KNOWSDEXTERASKIDNAPPER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_boss_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Tw�j szef? A kim�e on jest?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//Liczysz pewnie, �e ci tak od razu powiem, co? Pewnie tak.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//Nie mam �adnego powodu, aby udzieli� ci odpowiedzi.
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobi�?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_dexter_missingpeople))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobi�? Zabi� mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni�e�. Dlatego postanowi�em da� ci jeszcze jedn� szans�. Wyno� si� st�d - zniknij, ulotnij si�, zapadnij pod ziemi�. Id� i nigdy wi�cej nie pokazuj mi si� na oczy.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Musz� si� dowiedzie�, gdzie zabrano tych ludzi.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//Jasne. Mo�e spr�bujesz mnie zmusi�?
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//Lepiej ju� sobie id�!
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Je�li jeszcze raz ci� tutaj zobacz�, zabij� bez wahania.
	DEXTER_NOMORESMALLTALK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((DEXTER_NOMORESMALLTALK == TRUE) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//Skoro tego chcesz...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By�oby lepiej, gdyby� si� tutaj nie pokazywa�. Po prostu znalaz�e� si� w niew�a�ciwym miejscu w niew�a�ciwym czasie.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	b_greg_comestodexter();
	Info_ClearChoices(dia_dexter_kill);
	Info_AddChoice(dia_dexter_kill,DIALOG_ENDE,dia_dexter_kill_ende);
};

func void dia_dexter_kill_ende()
{
	var C_ITEM itm;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	itm = Npc_GetEquippedArmor(greg_nw);
	if(Hlp_IsItem(itm,itar_pir_h_addon) == FALSE)
	{
		AI_EquipArmor(greg_nw,itar_pir_h_addon);
	};
};


instance DIA_DEXTER_KOPF(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_kopf_condition;
	information = dia_dexter_kopf_info;
	permanent = FALSE;
	description = "Chcesz mojej g�owy? To spr�buj j� zdoby�!";
};


func int dia_dexter_kopf_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_hallo))
	{
		return TRUE;
	};
};

func void dia_dexter_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chcesz mojej g�owy? To spr�buj j� zdoby�!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//Jak sobie �yczysz!
	dia_dexter_kill_ende();
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

