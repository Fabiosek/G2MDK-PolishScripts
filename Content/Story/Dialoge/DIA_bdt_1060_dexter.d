
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
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Proszê, proszê, kogo tutaj mamy. Nasz wielki liberator we w³asnej osobie! Co tu robisz, bohaterze?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Potrzebujê paru odpowiedzi.
	if(RANGER_SCKNOWSDEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//Nie s¹dzi³em, ¿e pojawisz siê tu z w³asnej woli.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//Co to ma znaczyæ?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//To znaczy, ¿e ktoœ daje nagrodê za twoj¹ g³owê. Nie widzia³eœ jeszcze ¿adnych ulotek?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//Jest na nich TWOJA gêba. Tak... jesteœ poszukiwanym cz³owiekiem. Nie wiedzia³eœ o tym?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//Ktoœ rozprowadza ulotki z moj¹ podobizn¹. I ktoœ mi powiedzia³, ¿e to w³aœnie ty.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Ktoœ tu gada za du¿o.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//Ale masz racjê. To ja rozprowadzi³em ulotki. I co siê dzieje? Sam do mnie przychodzisz.
		MIS_STECKBRIEFE = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//Czego ode mnie chcesz?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Ja? Nic. Ale mój szef strasznie chcia³by ciê za³atwiæ.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//Dlatego w³aœnie musia³em ciê znaleŸæ, ¿eby zanieœæ mu twoj¹ g³owê.
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Nie wierzê nawet w jedno twoje s³owo.";
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
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Nie wierzê nawet w jedno twoje s³owo.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hej, to prawda. Przysiêgam na grób mojej matki!
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
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrick? Nigdy o nim nie s³ysza³em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//A, pamiêtam jednego ostro gard³uj¹cego najemnika, który krêci³ siê tu czasem ze swoj¹ kompani¹.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//Od d³u¿szego czasu go jednak nie widzia³em.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//Mo¿e ta kompania go obwiesi³a... Któ¿ to mo¿e wiedzieæ.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Dexter twierdzi, ¿e nie zna najemnika o imieniu Patrick.");
	DEXTER_KNOWSPATRICK = TRUE;
	b_giveplayerxp(XP_ADDON_DEXTER_KNOWSPATRICK);
};


instance DIA_ADDON_DEXTER_GREG(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_addon_dexter_greg_condition;
	information = dia_addon_dexter_greg_info;
	description = "Jest taki goœæ z zas³oniêtym okiem. Szuka ciebie!";
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
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//Jest taki goœæ z zas³oniêtym okiem. Szuka ciebie!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Wszyscy mnie ostatnio szukaj¹... Mam siê tym przejmowaæ?
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//Jak czegoœ ode mnie chce, to niech tu przyjdzie.
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
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//Jednak uda³o ci siê to rozpracowaæ... Gratulujê, dobra robota.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//S¹dzi³em, ¿e uda³o mi siê lepiej zatrzeæ œlady.
	Info_ClearChoices(dia_addon_dexter_missingpeople);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kto kaza³ ci to robiæ?",dia_addon_dexter_missingpeople_wer);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Co siê sta³o z tymi ludŸmi?",dia_addon_dexter_missingpeople_wo);
};

func void dia_addon_dexter_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Co siê sta³o z tymi ludŸmi? Gdzie oni s¹? W okolicznych kopalniach?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//Dawno ju¿ ich tu nie ma. S¹ za górami na pó³nocnym wschodzie, poza czyimkolwiek zasiêgiem...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//Niby mogê ci pokazaæ, gdzie dok³adnie... Tylko po co?
};

func void dia_addon_dexter_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Kto kaza³ ci to robiæ?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//Mój szef, groŸny typ. Znasz go - to Kruk, jeden z Magnatów ze Starego Obozu w Górniczej Dolinie.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//Potrzebowa³ tych ludzi do swoich planów - tylko tyle siê dowiesz.
	Info_AddChoice(dia_addon_dexter_missingpeople,"Kruk? GroŸny? Hmm...",dia_addon_dexter_missingpeople_raven);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Magnat? W Khorinis?",dia_addon_dexter_missingpeople_raventot);
};

func void dia_addon_dexter_missingpeople_raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Kruk? GroŸny? Hmm...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//A co ty tam wiesz?! Nie znasz go tak dobrze, jak ja.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//Ju¿ wtedy by³ z niego kawa³ sukinsyna, ale teraz...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//Bardzo siê zmieni³ po upadku Bariery. Twarz skry³ mu czarny cieñ.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//Jego wzrok przebija ciê niczym pazury dzikiej bestii, jeœli zbyt d³ugo siê w niego wpatrzeæ...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//Dobrze ci radzê - opuœæ Khorinis, dopóki jeszcze mo¿esz to uczyniæ.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//Nie czeka ciê tu nic poza œmierci¹.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Dexter ma szefa, który nazywa siê Kruk. To by³y magnat. Chyba w³aœnie on jest odpowiedzialny za wszystkie porwania. Teraz potrzebujê tylko jakiegoœ dowodu.");
	Info_ClearChoices(dia_addon_dexter_missingpeople);
};

func void dia_addon_dexter_missingpeople_raventot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//Magnat? W Khorinis?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//Ju¿ nie jest Magnatem. Ma swoje tajne plany, o których Khorinis wkrótce siê dowie...
};


instance DIA_ADDON_DEXTER_BOSS(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_addon_dexter_boss_condition;
	information = dia_addon_dexter_boss_info;
	description = "Twój szef? A kim¿e on jest?";
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
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Twój szef? A kim¿e on jest?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//Liczysz pewnie, ¿e ci tak od razu powiem, co? Pewnie tak.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//Nie mam ¿adnego powodu, aby udzieliæ ci odpowiedzi.
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "Co zamierzasz zrobiæ?";
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
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//I co zamierzasz zrobiæ? Zabiæ mnie?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Tak. Ale ty nas uwolni³eœ. Dlatego postanowi³em daæ ci jeszcze jedn¹ szansê. Wynoœ siê st¹d - zniknij, ulotnij siê, zapadnij pod ziemiê. IdŸ i nigdy wiêcej nie pokazuj mi siê na oczy.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//Muszê siê dowiedzieæ, gdzie zabrano tych ludzi.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//Jasne. Mo¿e spróbujesz mnie zmusiæ?
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//Lepiej ju¿ sobie idŸ!
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Jeœli jeszcze raz ciê tutaj zobaczê, zabijê bez wahania.
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
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//By³oby lepiej, gdybyœ siê tutaj nie pokazywa³. Po prostu znalaz³eœ siê w niew³aœciwym miejscu w niew³aœciwym czasie.
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
	description = "Chcesz mojej g³owy? To spróbuj j¹ zdobyæ!";
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
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//Chcesz mojej g³owy? To spróbuj j¹ zdobyæ!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//Jak sobie ¿yczysz!
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

