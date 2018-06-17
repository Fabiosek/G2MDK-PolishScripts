
instance DIA_ADDON_LARES_PATCH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 99;
	condition = dia_addon_lares_patch_condition;
	information = dia_addon_lares_patch_info;
	description = "(odzyskaj fragment ornamentu)";
};


func int dia_addon_lares_patch_condition()
{
	if(Npc_HasItems(self,itmi_ornament_addon_vatras) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_patch_info()
{
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
};


instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_HALTSMAUL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_haltsmaul_condition;
	information = dia_addon_lares_haltsmaul_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_haltsmaul_condition()
{
	if((LARES_HALTSMAUL == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_haltsmaul_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//Do zobaczenia w porcie.
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	if(RANGERMEETINGRUNNING == 0)
	{
		return TRUE;
	};
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Chyba oszala�em. Co ty tutaj robisz?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//PRZYP�YN��E� tu?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//To niez�y spos�b na omini�cie stra�nik�w przy bramie.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Czy my si� znamy?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hej! Lares, ty stary draniu...",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Czy my si� znamy?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Ch�opie, nie pami�tasz mnie? Trzyma�em si� w pobli�u Nowego Obozu.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Cz�owieku, ale by�o fajowo. Pami�tasz Lee?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywi�cie, �e pami�tam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej! Lares, ty stary draniu, jak si� tu dosta�e�?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Uda�o mi si� w sam� por� uciec z doliny, razem z Lee i paroma innymi ch�opakami.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pami�tasz Lee, prawda?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywi�cie, �e pami�tam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Wi�c wydosta�em si� z nim z Kolonii zaraz po tym, jak Bariera zosta�a zniszczona.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Teraz on i jego ch�opcy s� w gospodarstwie Onara.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Zawar� uk�ad z w�a�cicielem. Lee i jego ch�opaki broni� gospodarstwa, a Onar ich karmi.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Oczywi�cie, �e pami�tam Lee!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Wiele przeszed�e�, co? Lee by� przyw�dc� najemnik�w w Nowym Obozie.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_ADDON_LARES_VATRAS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_vatras_condition;
	information = dia_addon_lares_vatras_info;
	description = "Vatras mnie przysy�a.";
};


func int dia_addon_lares_vatras_condition()
{
	if(VATRAS_GEHZULARES == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_lares_vatras_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras mnie przysy�a - wspomina�, �e mo�esz mi pom�c.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//Pozna�e� ju� Vatrasa... Musia�e� zrobi� na nim niema�e wra�enie.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//Inaczej z pewno�ci� nie poda�by ci mojego imienia - zw�aszcza �e wci�� trzeba rozwi�za� spraw� zaginionych ludzi.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Czego ci potrzeba?
	LARES_RANGERHELP = TRUE;
	if(GREGLOCATION == GREG_FARM1)
	{
		b_startotherroutine(bau_974_bauer,"GregInTaverne");
		GREGLOCATION = GREG_TAVERNE;
		b_startotherroutine(greg_nw,"Taverne");
	};
};


instance DIA_ADDON_LARES_WHATAREYOUGUYS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_addon_lares_whatareyouguys_condition;
	information = dia_addon_lares_whatareyouguys_info;
	description = "Co ��czy ci� z Vatrasem?";
};


func int dia_addon_lares_whatareyouguys_condition()
{
	if((LARES_RANGERHELP == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_whatareyouguys_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co ��czy ci� z Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//Powiedzmy, �e mam pewn� umow� z Magami Wody. Jasne?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakiego rodzaju umow�?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//My dla nich pracujemy, a oni dbaj�, aby�my nie mieli k�opot�w przez nasz� przesz�o��.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//M�wisz teraz o Wodnym Kr�gu, tak?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//H�? Wiesz o nim?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi powiedzia�.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Trzeba by�o tak od razu.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares nale�y do Wodnego Kr�gu.");
};


instance DIA_ADDON_LARES_RANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ranger_condition;
	information = dia_addon_lares_ranger_info;
	description = "Opowiedz mi wi�cej o Wodnym Kr�gu.";
};


func int dia_addon_lares_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Opowiedz mi wi�cej o Wodnym Kr�gu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//Kr�g jest dla Mag�w Wody tym, czym paladyni s� dla Mag�w Ognia.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//W odr�nieniu od paladyn�w Kr�g woli jednak pozostawa� w cieniu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//Kr�g jest pot�n� broni� w walce z niebezpiecze�stwami zagra�aj�cymi ludno�ci Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Aby by�o to mo�liwe, nikt z nich nie mo�e jednak wiedzie� o jego istnieniu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Wi�c nic na ten temat nie m�w!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Nie ma sprawy.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Kr�g jest dla Mag�w Wody tym, czym paladyni s� dla Mag�w Ognia, poza tym, �e dzia�a on w tajemnicy. Niewtajemniczeni nie mog� wiedzie�, KTO do niego nale�y, aby nie mo�na by�o pozna� jego prawdziwej si�y.");
};


instance DIA_ADDON_LARES_WANNABERANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_wannaberanger_condition;
	information = dia_addon_lares_wannaberanger_info;
	description = "Chcia�bym si� przy��czy� do Wodnego Kr�gu.";
};


func int dia_addon_lares_wannaberanger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ranger) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//Chcia�bym si� przy��czy� do Wodnego Kr�gu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//Dobry pomys�, cho� decyzja nale�y do Mag�w Wody.
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	Info_ClearChoices(dia_addon_lares_wannaberanger);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Rozumiem.",dia_addon_lares_wannaberanger_back);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Jak to jest nale�e� do Kr�gu?",dia_addon_lares_wannaberanger_howisit);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Jak ci si� uda�o zaimponowa� Magom Wody?",dia_addon_lares_wannaberanger_aboutyou);
};

func void dia_addon_lares_wannaberanger_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Rozumiem.
	Info_ClearChoices(dia_addon_lares_wannaberanger);
};

func void dia_addon_lares_wannaberanger_aboutyou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Jak ci si� uda�o zaimponowa� Magom Wody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chroni�em ich przez d�ugi czas, gdy jeszcze �yli otoczeni Barier�.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//Naprawd� - powinni by� wdzi�czni...
};

func void dia_addon_lares_wannaberanger_howisit()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Jak to jest nale�e� do Kr�gu?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//R�nimy si� od innych gildii z Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jako jeden z nas nigdy nie musisz robi� czego�, czego nie chcesz.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Wymagamy tylko jednego - sied� cicho.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujemy w ukryciu. Obcy nie wiedz�, kto nale�y do Kr�gu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Na razie ci� poobserwujemy i potem podejmiemy decyzj�.
};

func void b_lares_geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Wkr�tce odb�dzie si� tajne spotkanie w gospodzie Orlana.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Przyb�d� tam jak najszybciej - tam otrzymasz sprz�t.
};


instance DIA_ADDON_LARES_RINGBACK(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback_condition;
	information = dia_addon_lares_ringback_info;
	description = "Jestem ju� cz�onkiem Wodnego Kr�gu.";
};


func int dia_addon_lares_ringback_condition()
{
	if((SC_ISRANGER == TRUE) && (MIS_ADDON_LARES_COMETORANGERMEETING != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Jestem ju� cz�onkiem Wodnego Kr�gu.
	if((LARES_GOTRINGBACK == FALSE) && (SC_GOTLARESRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Doskonale! Oddasz mi teraz m�j pier�cie� z akwamarynem?
		if(b_giveinvitems(other,self,itri_ranger_lares_addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jasne.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Mam nadziej�, �e si� przyda�. Ciesz� si�, �e jeste� ju� jednym z nas.
			LARES_GOTRINGBACK = TRUE;
			b_giveplayerxp(XP_AMBIENT);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Niestety, nie mam go przy sobie.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Tylko go nie zgub! B�dzie mi jeszcze potrzebny.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Teraz by� pewnie chcia� nowy ekwipunek? S�uchaj mnie bardzo uwa�nie.
	b_lares_geheimtreffen();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares zaprosi� mnie na sekretne spotkanie Kr�gu w gospodzie Orlana.");
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
};


instance DIA_ADDON_LARES_RINGBACK2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback2_condition;
	information = dia_addon_lares_ringback2_info;
	description = "Oto tw�j pier�cie�.";
};


func int dia_addon_lares_ringback2_condition()
{
	if(Npc_HasItems(other,itri_ranger_lares_addon) && (LARES_GOTRINGBACK == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback2_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Oto tw�j pier�cie�.
	b_giveinvitems(other,self,itri_ranger_lares_addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//Ach... Dobrze. Ju� s�dzi�em, �e go zgubi�e�.
	b_giveplayerxp(XP_AMBIENT);
	LARES_GOTRINGBACK = TRUE;
};


instance DIA_ADDON_LARES_GEDULD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_geduld_condition;
	information = dia_addon_lares_geduld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_geduld_condition()
{
	if((RANGERMEETINGRUNNING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_geduld_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Zaraz - czekamy jeszcze na kogo�.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GETRANGERARMOR(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_getrangerarmor_condition;
	information = dia_addon_lares_getrangerarmor_info;
	important = TRUE;
};


func int dia_addon_lares_getrangerarmor_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RANGERMEETINGRUNNING == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_getrangerarmor_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//M�j m�ody przyjacielu... Zebrali�my si� dzisiaj, aby uczci� twoje wst�pienie w szeregi Wodnego Kr�gu.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Ci tutaj b�d� ci� teraz mieli na oku.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Rzecz jasna to nie wszyscy cz�onkowie Wodnego Kr�gu, wi�c miej si� na baczno�ci.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez wzgl�du na to, czy odniesiesz sukces, czy co� zawalisz, i tak si� o tym dowiemy.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Niniejszym wr�czam ci pancerz gildii.
	CreateInvItem(hero,itar_ranger_addon);
	AI_EquipArmor(hero,itar_ranger_addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//No� go z dum�, ale nie daj si� przy�apa� w nim w mie�cie lub innych miejscach publicznych.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pami�taj, �e nie chcemy si� ujawnia�. Nikt niepowo�any nie mo�e si� dowiedzie�, kto nale�y do Wodnego Kr�gu.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikt nie m�wi o Wodnym Kr�gu - to pierwsza i najwa�niejsza zasada. Nie �am jej.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Jeszcze jakie� pytania?
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Musz� si� zmywa�.",dia_addon_lares_getrangerarmor_end);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Jak mo�esz mi pom�c?",dia_addon_lares_getrangerarmor_learn);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"A co z broni�?",dia_addon_lares_getrangerarmor_weapons);
};

func void dia_addon_lares_getrangerarmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//A co z broni�?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//Broni� Kr�gu jest pika, ale ka�dy cz�onek mo�e u�ywa� tego, z czym jest najlepiej zaznajomiony.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Oto jedna z naszych pik. Jako� nigdy nie potrafi�em si� do niej przyzwyczai� - mo�e tobie lepiej p�jdzie.
	CreateInvItems(self,itmw_rangerstaff_addon,1);
	b_giveinvitems(self,other,itmw_rangerstaff_addon,1);
};

func void dia_addon_lares_getrangerarmor_end()
{
	b_makerangerreadytoleavemeetingall();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Musz� si� zmywa�.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Nie b�d� ci� zatrzymywa�.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Udaj si� jak najszybciej do Vatrasa - on zleci ci pierwsze zadanie.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Bracia Kr�gu - wracajmy do naszych zaj��.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Ci�gle nie uda�o nam si� powstrzyma� bandyckich porwa� - trzeba rozwi�za� ten problem jak najszybciej.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanosie, dbaj o r�wnowag� tego �wiata...
	LARES_TAKEFIRSTMISSIONFROMVATRAS = TRUE;
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,DIALOG_ENDE,dia_addon_lares_getrangerarmor_weiter);
};

func void dia_addon_lares_getrangerarmor_weiter()
{
	AI_StopProcessInfos(self);
	b_rangermeetingparking();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Na tajnym spotkaniu w gospodzie Orlana otrzyma�em zbroj�. Teraz powinienem uda� si� do Vatrasa, by otrzyma� pierwszy rozkaz jako cz�onek Kr�gu.");
};

func void dia_addon_lares_getrangerarmor_learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//Jak mo�esz mi pom�c?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//Poprzez wspomo�enie pracy nad twoj� zr�czno�ci�.
	if(Npc_IsDead(sld_805_cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Je�li chcesz lepiej walczy� broni� bia��, pom�w z Cordem - to mistrz w pos�ugiwaniu si� r�nego rodzaju ostrzami.
	};
	if(Npc_IsDead(bau_961_gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann z kolei ch�tnie nauczy ci� paru rzeczy o wyprawianiu sk�r zwierz�t.
	};
	if(Npc_IsDead(mil_350_addon_martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Od Martina mo�esz nauczy� si� wiele o paladynach.
	};
	if(Npc_IsDead(bau_4300_addon_cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn z kolei umie si� podkrada�, mo�e ci� r�wnie� nauczy� walki broni� jednor�czn� oraz pos�ugiwania si� �ukiem.
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Zwr�� si� do Orlana, je�li potrzebujesz noclegu.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//Wszystkie twoje potrzeby magiczne powinien zaspokoi� Vatras.
};


instance DIA_ADDON_LARES_TELEPORTSTATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_teleportstation_condition;
	information = dia_addon_lares_teleportstation_info;
	description = "Korzysta�e� kiedy� z kamienia teleportacyjnego?";
};


func int dia_addon_lares_teleportstation_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SCUSED_TELEPORTER == TRUE) && (MIS_LARES_BRINGRANGERTOME != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_teleportstation_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Korzysta�e� kiedy� z kamienia teleportacyjnego?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Nie, ale s�ysza�em o nich. Magowie Wody nie maj� jeszcze pewno�ci, co z nimi robi�.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//Ja ju� jeden wypr�bowa�em...
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//Powinienem si� by� domy�li�. Istnieje cokolwiek, na co by� si� nie powa�y�?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Je�li nabierzesz ochoty na zabaw� w teleportacj�, to pom�w z karczmarzem, Orlanem. Mo�e wpu�ci ci� do swej zamkni�tej jaskini...
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Chyba trzyma kamie� teleportacyjny w pobli�u swej gospody - na potrzeby Mag�w Wody.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Wyjd� z miasta przez wschodni� bram� i id� wzd�u� �cie�ki. Na pewno trafisz.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Lares powiedzia� mi, �e w pobli�u gospody Orlana znajduje si� ukryty kamie� teleportacyjny.");
	ORLAN_HINT_LARES = TRUE;
};


instance DIA_ADDON_LARES_ORNAMENT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornament_condition;
	information = dia_addon_lares_ornament_info;
	description = "Vatras wr�czy� mi ten ornament, abym ci go przekaza�.";
};


func int dia_addon_lares_ornament_condition()
{
	if(Npc_HasItems(other,itmi_ornament_addon_vatras) && Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras wr�czy� mi ten ornament, abym ci go przekaza� i poleci� zwr�ci�.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//Ech... A to ci 'niespodzianka'. Znowu wszystko na mojej g�owie... Powinienem by� si� domy�li�.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Teraz musz� przeby� ca�� wysp� i odda� to co� Magom Wody.
};


instance DIA_ADDON_LARES_ORNAMENTBRINGJOB(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornamentbringjob_condition;
	information = dia_addon_lares_ornamentbringjob_info;
	description = "Zrobi� to za ciebie!";
};


func int dia_addon_lares_ornamentbringjob_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornamentbringjob_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Zrobi� to za ciebie!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//Hmm... Nie, chyba lepiej b�dzie, je�li ja to zrobi�. Mo�esz mi jednak towarzyszy�, je�li chcesz.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Niestety, nie mog� teraz opu�ci� tego miejsca - musz� pilnowa� portu.
	b_logentry(TOPIC_ADDON_KDW,"Przynios�em Laresowi ornament Vatrasa. Chce, �ebym dostarczy� go Magom Wody.");
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_RUNNING;
};


instance DIA_ADDON_LARES_YOURMISSION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_yourmission_condition;
	information = dia_addon_lares_yourmission_info;
	permanent = TRUE;
	description = "Czym konkretnie si� tu zajmujesz?";
};


func int dia_addon_lares_yourmission_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_LARES_BRINGRANGERTOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_yourmission_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Czym konkretnie si� tu zajmujesz?
	if(!Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Nie mog� o tym m�wi�.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras urwa�by mi �eb...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//Robi� to samo, co wszyscy pozostali - wykonuj� zadania zlecone przez Mag�w Wody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Cz�� zaginionych to rybacy - razem z nimi znikn�y r�wnie� ich �odzie.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//W�a�nie dlatego stoj� tu i obserwuj� port - mo�e uda mi si� co� odkry�.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mo�esz mi pom�c.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Dam ci m�j pier�cie� z akwamarynem. To znak Wodnego Kr�gu.
		CreateInvItems(self,itri_ranger_lares_addon,1);
		b_giveinvitems(self,other,itri_ranger_lares_addon,1);
		SC_GOTLARESRING = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Za�� go - dzi�ki temu inni rozpoznaj�, �e pracujesz dla mnie.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Znajd� mi zast�pc� tak, abym m�g� w spokoju odnie�� ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Kto� z nas z regu�y obserwuje targowisko, cho� nie mam poj�cia, kto zajmuje si� tym w tej chwili.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Najlepiej porozmawiaj ze wszystkimi przebywaj�cymi tam lud�mi - w�a�ciwa osoba rozpozna ci� po pier�cieniu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Powiedz jej, aby znalaz�a zast�pstwo.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares da� mi sw�j pier�cie� z akwamarynem - znak rozpoznawczy Kr�gu. Gdy za�o�� pier�cie�, zauwa�� go pozostali cz�onkowie tej organizacji.");
		Log_CreateTopic(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Lares nie mo�e opu�ci� portu. Powinienem przej�� si� po rynku, nosz�c jego pier�cie� z akwamarynem, aby znale�� kogo�, kto go zast�pi.");
		MIS_LARES_BRINGRANGERTOME = LOG_RUNNING;
	};
};


instance DIA_ADDON_LARES_BALTRAMABLOESE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_baltramabloese_condition;
	information = dia_addon_lares_baltramabloese_info;
	description = "Rozmawia�em z Baltramem.";
};


func int dia_addon_lares_baltramabloese_condition()
{
	if((MIS_LARES_BRINGRANGERTOME == LOG_RUNNING) && (BALTRAM_EXCHANGE4LARES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_baltramabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Rozmawia�em z Baltramem - zorganizuje ci zast�pc�.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Doskonale. Nareszcie b�dzie sobie mo�na st�d p�j��.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//Mo�esz zatrzyma� na razie m�j pier�cie�.
		if(Npc_KnowsInfo(other,dia_addon_lares_wannaberanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//Dop�ki nie otrzymasz w�asnego, mo�e ci si� przyda�.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//Mo�e kiedy� zdecydujesz si� do nas do��czy�...
		};
	};
	MIS_LARES_BRINGRANGERTOME = LOG_SUCCESS;
	LARES_CANBRINGSCTOPLACES = TRUE;
};


var int lares_peoplemissing_perm;

instance DIA_ADDON_LARES_PEOPLEMISSING(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_addon_lares_peoplemissing_condition;
	information = dia_addon_lares_peoplemissing_info;
	permanent = TRUE;
	description = "Co do zaginionych...";
};


func int dia_addon_lares_peoplemissing_condition()
{
	if((LARES_RANGERHELP == TRUE) && (LARES_PEOPLEMISSING_PERM == FALSE) && ((SC_ISRANGER == FALSE) || (MISSINGPEOPLERETURNEDHOME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_peoplemissing_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//Co do zaginionych...
	Info_ClearChoices(dia_addon_lares_peoplemissing);
	Info_AddChoice(dia_addon_lares_peoplemissing,DIALOG_BACK,dia_addon_lares_peoplemissing_back);
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Uda�o mi si� ocali� cz�� z zaginionych.",dia_addon_lares_peoplemissing_saved);
	}
	else if((MIS_LARES_BRINGRANGERTOME != 0) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Wiem, gdzie przebywaj� zaginieni!",dia_addon_lares_peoplemissing_success);
	}
	else
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Czy to nie jest raczej zadanie dla stra�y?",dia_addon_lares_peoplemissing_mil);
		Info_AddChoice(dia_addon_lares_peoplemissing,"Powiedz, co wiesz o tej sprawie.",dia_addon_lares_peoplemissing_tellme);
	};
};

func void dia_addon_lares_peoplemissing_back()
{
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_tellme()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//Powiedz, co wiesz o tej sprawie.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Pierwszy by� miejscowy rybak imieniem William. Pewnego dnia po prostu nie wr�ci� z morza.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Pocz�tkowo s�dzili�my, �e jaki� potw�r morski zniszczy� mu ��d� podczas po�ow�w.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Wkr�tce jednak zacz�li znika� inni; co gorsza, zupe�nie przypadkowi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dlatego te� nie mamy poj�cia, jak si� zabra� do tej sprawy. Musimy chyba czeka� na jaki� �lad.
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
};

func void dia_addon_lares_peoplemissing_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//Czy to nie jest raczej zadanie dla stra�y?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Taa... Ju� widz�, jak cokolwiek robi� w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nigdy nie znajd� przyczyny tych zdarze� - uznaj�, �e ludzie po prostu znikaj� bez wie�ci.
};

func void dia_addon_lares_peoplemissing_success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//Wiem, gdzie przebywaj� zaginieni!
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//Czy�by?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//Dawny Magnat imieniem Kruk zleci� ich porwanie.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jeste� pewien? Hmm... Trzeba ich jako� oswobodzi�.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracuj� nad tym.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//Dobra. Je�li b�dzie ci potrzebna moja pomoc...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//...to wiem, gdzie ci� znale��. Jasne.
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_saved()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Uda�o mi si� ocali� cz�� z zaginionych.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//Wiedzia�em, �e ci si� uda. Wreszcie mog� zaj�� si� swoimi sprawami...
	b_giveplayerxp(XP_AMBIENT);
	LARES_PEOPLEMISSING_PERM = TRUE;
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};


var int dia_addon_lares_rangerhelp_gilde_onetime_waffe;
var int dia_addon_lares_rangerhelp_gilde_onetime_geld;
var int dia_addon_lares_rangerhelp_gilde_onetime_ruestung;

instance DIA_ADDON_LARES_RANGERHELP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_rangerhelp_condition;
	information = dia_addon_lares_rangerhelp_info;
	permanent = TRUE;
	description = "Potrzebuj� pomocy.";
};


func int dia_addon_lares_rangerhelp_condition()
{
	if(((LARES_RANGERHELP == TRUE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE)) || Npc_IsInState(moe,zs_attack))
	{
		return TRUE;
	};
};

func void dia_addon_lares_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Potrzebuj� pomocy.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//Jak mog� ci� wesprze�?
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	Info_AddChoice(dia_addon_lares_rangerhelp,DIALOG_BACK,dia_addon_lares_rangerhelp_nix);
	if(Npc_IsInState(moe,zs_attack))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Denerwuje mnie taki jeden...",dia_addon_lares_rangerhelp_moe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Potrzeba mi lepszej broni.",dia_addon_lares_rangerhelp_waffe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Mo�e jakim� lepszym pancerzem?",dia_addon_lares_rangerhelp_ruestung);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Potrzeba mi pieni�dzy.",dia_addon_lares_rangerhelp_geld);
	};
};

func void dia_addon_lares_rangerhelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//Mo�e jakim� lepszym pancerzem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//W tej sprawie lepiej udaj si� do Mattea - on handluje dobrymi zbrojami. Niestety, nie s� tanie.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Pewnie da si� to za�atwi� bez znacz�cego wydatku - o ile nie masz nic przeciwko odrobinie k�opot�w ze stra��...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//A konkretnie? O co chodzi?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Przy domu Mattea znajduje si� magazynek, ale z�o�one w nim towary zosta�y skonfiskowane przez stra�.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Udaj si� do Zurisa na targowisko i wydosta� od niego zakl�cie usypiaj�ce, za pomoc� kt�rego wyeliminujesz stra�nik�w.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//Tam musi by� co� niez�ego.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG = TRUE;
};

func void dia_addon_lares_rangerhelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Potrzeba mi lepszej broni.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Przykro mi, z tym ci nie pomog�. Zak�adam, �e odwiedzi�e� ju� targowisko?
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE = TRUE;
};

func void dia_addon_lares_rangerhelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Potrzeba mi pieni�dzy.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//A kto ich nie potrzebuje? Nie mam nic na zbyciu. Chocia�... Lichwiarz Lehmar ma u mnie d�ug wdzi�czno�ci.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Id� do niego i wyp�a� tyle, ile ci potrzeba - ja zajm� si� reszt�. Znajdziesz go w porcie, w pobli�u przej�cia do dolnej cz�ci miasta.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD = TRUE;
	RANGERHELP_LEHMARKOHLE = TRUE;
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_nix()
{
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_moe()
{
	AI_Output(other,self,"DIA_Addon_Lares_Moe_15_00");	//Denerwuje mnie taki jeden...
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Chwila...
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,moe,AR_GUARDSTOPSFIGHT,0);
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "Za wszelk� cen� musz� si� skontaktowa� z paladynami!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Musz� koniecznie porozmawia� z paladynami!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//A czego od NICH chcesz?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Posiadaj� pot�ny amulet zwany Okiem Innosa. Musz� go mie�.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//I my�lisz, �e po prostu ci go oddadz�? Nigdy nie dostaniesz si� do g�rnego miasta.
	if(!Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Znajd� jaki� spos�b.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasne, je�li chcesz si� przymila� mieszka�com, albo zostaniesz ch�opcem na posy�ki w stra�y.
	};
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Czy wiesz, dlaczego s� tu paladyni?";
};


func int dia_lares_whypalhere_condition()
{
	if(other.guild == GIL_NONE)
	{
		if(Npc_KnowsInfo(other,dia_lares_paladine) || (RANGERHELP_GILDEMIL == TRUE) || (RANGERHELP_GILDESLD == TRUE) || (RANGERHELP_GILDEKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Czy wiesz, dlaczego tu s� paladyni?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikt nie wie na pewno... Wi�kszo�� ludzi uwa�a, �e to z powodu ork�w, ale ja mam inne zdanie na ten temat.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//To ma pewnie co� wsp�lnego ze star� koloni� karn�.
};


instance DIA_ADDON_LARES_GILDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_gilde_condition;
	information = dia_addon_lares_gilde_info;
	permanent = TRUE;
	description = "Vatras wspomnia�, �e mo�esz mi pom�c do��czy� do jednej z gildii.";
};


func int dia_addon_lares_gilde_condition()
{
	if((LARES_RANGERHELP == TRUE) && (other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_gilde_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras wspomnia�, �e mo�esz mi pom�c do��czy� do jednej z gildii.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//Nie lubisz si� przepracowywa�, co?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Rozumiem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//Je�li chcesz si� przy��czy� do Lee, to mog� pogada� z najemnikami.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Z pewno�ci� �atwiej by�oby ci si� wkr�ci� do klasztoru...
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//A zdecydowanie najprostsze by�oby do��czenie do stra�y.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Kt�r� gildi� wybierasz?
	Info_ClearChoices(dia_addon_lares_gilde);
	Info_AddChoice(dia_addon_lares_gilde,"Musz� to jeszcze przemy�le�...",dia_addon_lares_gilde_back);
	Info_AddChoice(dia_addon_lares_gilde,"Mag�w Ognia.",dia_addon_lares_gilde_kdf);
	Info_AddChoice(dia_addon_lares_gilde,"Najemnik�w.",dia_addon_lares_gilde_sld);
	Info_AddChoice(dia_addon_lares_gilde,"Stra�.",dia_addon_lares_gilde_mil);
};

func void dia_addon_lares_gilde_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Musz� to jeszcze przemy�le�...
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_sld()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//Najemnik�w.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Lee z pewno�ci� ci� przyjmie.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Najpierw musisz jednak przej�� pewn� pr�b�...
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Pom�w lepiej z Cordem na farmie Onara.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//On pomo�e ci w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Powiedz mu, �e jeste� moim protegowanym. Zrozumie, o co chodzi.
	RANGERHELP_GILDESLD = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPSLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Lares s�dzi, �e Cord, kt�ry jest na farmie bogatego ziemianina, mo�e mi pom�c dosta� si� do najemnik�w.");
	SC_KNOWSCORDASRANGERFROMLARES = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Stra�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//Taaak. Wiem chyba, co ci� u nich tak poci�ga - wygl�dasz mi na kogo�, kto uwielbia dawa� innym wyk�ady o obowi�zuj�cym prawie, kradn�c jednocze�nie na pot�g�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//W porcie znajduje si� magazyn paladyn�w. Kwatermistrzem jest tam m�j dobry znajomy.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Nazywa si� Martin - mo�e on zdo�a ci pom�c.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPMIL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Lares twierdzi, �e kwatermistrz Martin pomo�e mi szybciej dosta� si� w szeregi stra�y. Zwykle przebywa w porcie, gdzie paladyni maj� sw�j magazyn.");
	RANGERHELP_GILDEMIL = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_kdf()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//Mag�w Ognia.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//Vatras pewnie si� tego nie spodziewa�... Inaczej by ci� do mnie nie przys�a�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Je�li chcesz si� dosta� do klasztoru, to b�dzie ci� to kosztowa�.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Nie pozwol� ci wej�� do �rodka, je�li nie op�acisz daniny.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//Tylko Vatras mo�e co� z tym zrobi� - musisz z nim pom�wi� w tej sprawie.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Lares twierdzi, �e Vatras zna dobry spos�b na wst�pienie do klasztoru.");
	RANGERHELP_GILDEKDF = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};


var int lares_workforlee;
var int lares_waytoonar;

instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = TRUE;
	description = "Powiedz mi co� o Lee i jego najemnikach.";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && (LARES_WAYTOONAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Powiedz mi co� o Lee i jego najemnikach.
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co konkretnie chcesz wiedzie�?
	Info_ClearChoices(dia_lares_aboutsld);
	Info_AddChoice(dia_lares_aboutsld,DIALOG_BACK,dia_lares_aboutsld_back);
	Info_AddChoice(dia_lares_aboutsld,"A dlaczego TY nie jeste� razem z Lee i jego najemnikami?",dia_lares_aboutsld_whynotyou);
	Info_AddChoice(dia_lares_aboutsld,"Powiedz mi co� wi�cej o najemnikach.",dia_lares_aboutsld_sld);
	Info_AddChoice(dia_lares_aboutsld,"Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?",dia_lares_aboutsld_waytoonar);
};

func void dia_lares_aboutsld_back()
{
	Info_ClearChoices(dia_lares_aboutsld);
};

func void dia_lares_aboutsld_sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Powiedz mi co� wi�cej o najemnikach.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//C�, je�li jeste� takim twardzielem jak kiedy�, nie powinni sprawi� ci k�opotu.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Wi�kszo�� z nich to bandyci, a je�li sobie z nimi nie poradzisz, to daleko nie zajdziesz.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//Je�li jeste� delikatny, to na pewno z nimi nie wygrasz....
};

func void dia_lares_aboutsld_whynotyou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A dlaczego TY nie jeste� razem z Lee i jego najemnikami?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale� jestem! Tylko �e nie na farmie.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Mo�na powiedzie�, �e zosta�em tu wys�any na posterunek. Nie chcemy, aby statek odp�yn�� bez nas.
	LARES_WORKFORLEE = TRUE;
	Info_AddChoice(dia_lares_aboutsld,"O jakim statku m�wi�e�?",dia_lares_aboutsld_schiff);
};

func void dia_lares_aboutsld_schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jakim statku m�wi�e�?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Stoi w porcie, za klifami. Lee i paru jego ludzi bardzo chce si� st�d wydosta�.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale to mo�e troch� potrwa�...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Dlaczego?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Lepiej zapytaj o to Lee, je�li go spotkasz... Ma jakie� plany.
};

func void dia_lares_aboutsld_waytoonar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak dostan� si� do gospodarstwa tego w�a�ciciela ziemskiego?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//To do�� proste. Wyjd� z miasta wschodni� bram� i id� drog� na wsch�d.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//Mog� wskaza� ci drog�, je�li chcesz.
	LARES_WAYTOONAR = TRUE;
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 14;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Wiesz co� o gildii z�odziei w mie�cie?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Wiesz co� o gildii z�odziei w mie�cie?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Te twoje pytania...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Oczywi�cie, �e jest tu taka gildia. Jak w ka�dym wi�kszym mie�cie.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//Ka�dy paser czy kieszonkowiec ma z ni� pewnie jakie� powi�zania.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 15;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Wiesz, gdzie mog� znale�� gildi� z�odziei?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Wiesz, gdzie mog� znale�� gildi� z�odziei?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//Bez obrazy, ale nawet gdybym wiedzia�, to nie powiedzia�bym ci ani s�owa.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Ci ludzie s� zwykle BARDZO dra�liwi, je�li chodzi o te sprawy.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Powiniene� by� bardzo ostro�ny, je�li chcesz si� z nimi zadawa�.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 16;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "Mam tutaj klucz. Zardzewia� od morskiej wody...";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mam tutaj klucz. Zardzewia� od morskiej wody...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//No i?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Wydaje mi si�, �e pozwoli mi dosta� si� do kryj�wki gildii z�odziei...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//C�, mo�liwe, �e to klucz do kana��w.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 17;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Gdzie znajd� kana�y?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Gdzie znajd� kana�y?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//A co ja mog� wiedzie�... Zwykle maj� uj�cie na brzegu morza.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Jeste� teraz w stra�y!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//Normalnie umr� ze �miechu - by�y skazaniec w stra�y miejskiej...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Wi�c teraz jeste� jednym z paladyn�w Kr�la!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//Tylko ty mog�e� wyci�� taki numer...
		if(LARES_WORKFORLEE == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//Nie b�dziesz robi� mi problem�w z powodu pracy u Lee, prawda?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ale znasz mnie...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nie �api�. By�e� w klasztorze. Jak tam jest?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Inaczej.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Domy�lam si�.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Podobno Lee przyj�� ci� do kompanii.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratulacje.
	};
};


instance DIA_ADDON_LARES_FOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_addon_lares_forest_condition;
	information = dia_addon_lares_forest_info;
	description = "Mo�esz mi towarzyszy� w drodze przez g�sty las na wschodzie?";
};


func int dia_addon_lares_forest_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lares_forest_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Mo�esz mi towarzyszy� w drodze przez g�sty las na wschodzie?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jasne, tylko po co si� tam zapuszczasz?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius prosi�, aby poszuka� dalszych ornament�w.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z miejsc, kt�re mam zbada�, znajduje si� w �rodku tego lasu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Rozumiem. Samemu to zbyt niebezpieczne?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Nie ma sprawy. Daj zna�, jak b�dziesz chcia� rusza�.
	RANGERHELP_ORNAMENTFOREST = TRUE;
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = TRUE;
	description = "Dobra, chod�my.";
};


func int dia_lares_gonow_condition()
{
	if(((LARES_WAYTOONAR == TRUE) || (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) || (RANGERHELP_ORNAMENTFOREST == TRUE)) && ((LARESGUIDE_ZUMPORTAL == 0) || (LARESGUIDE_ZUMPORTAL == 8)) && ((LARESGUIDE_ZUONAR == FALSE) || (LARESGUIDE_ZUONAR != LOG_SUCCESS)) && ((LARESGUIDE_ORNAMENTFOREST == 0) || (LARESGUIDE_ORNAMENTFOREST == 3)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_goingconditions()
{
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//A wi�c ruszajmy... Chod� za mn�.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobra, chod�my.
	if(LARES_CANBRINGSCTOPLACES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nie mog� si� st�d ruszy�, dop�ki kto� mnie nie zast�pi lub nie zostanie rozwi�zana sprawa gin�cych ludzi.
	}
	else if(MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING)
	{
		b_lares_geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Gdzie teraz?
		Info_ClearChoices(dia_lares_gonow);
		Info_AddChoice(dia_lares_gonow,DIALOG_BACK,dia_lares_gonow_warte);
		if(LARES_WAYTOONAR == TRUE)
		{
			Info_AddChoice(dia_lares_gonow,"Na farm� Onara.",dia_lares_gonow_onar);
		};
		if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (LARES_ANGEKOMMEN == FALSE))
		{
			Info_AddChoice(dia_lares_gonow,"Odnie�my ornament Vatrasa.",dia_lares_gonow_maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LARESGUIDE_ORNAMENTFOREST == 0) && (RANGERHELP_ORNAMENTFOREST == TRUE))
		{
			Info_AddChoice(dia_lares_gonow,"Zapu��my si� w ten g�sty las na wschodzie.",dia_lares_gonow_forest);
		};
	};
};

func void dia_lares_gonow_maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Odnie�my ornament Vatrasa.
	LARESGUIDE_ZUMPORTAL = 1;
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//Na farm� Onara.
	LARESGUIDE_ZUONAR = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//Zapu��my si� w ten g�sty las na wschodzie.
	LARESGUIDE_ORNAMENTFOREST = 1;
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_warte()
{
	Info_ClearChoices(dia_lares_gonow);
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if((LARESGUIDE_ZUONAR == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//A wi�c jeste�my.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//A wi�c tutaj jeste�. Ju� zaczyna�em my�le�, �e ze�ar�y ci� wilki.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//C�, przez reszt� drogi poradzisz sobie sam. Musz� wraca� do miasta. Mam tam kilka spraw do za�atwienia.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Id� po prostu t� drog� i pami�taj - b�d� twardy i nie daj sobie wcisn�� kitu, a wszystko p�jdzie jak po ma�le.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUONAR = LOG_SUCCESS;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER1(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter1_condition;
	information = dia_addon_lares_arrivedportalinter1_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter1_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LARESGUIDE_ZUMPORTAL == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter1_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Jeste�my ju� za miastem, tutaj nikt nas nie pods�ucha... Mam ci co� do powiedzenia.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ten ornament nale�y zanie�� Saturasowi. Pami�tasz go, prawda?
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Jasne.",dia_addon_lares_arrivedportalinter1_ja);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Saturas? Kto to taki?",dia_addon_lares_arrivedportalinter1_wer);
	LARESGUIDE_ZUMPORTAL = 2;
};

func void dia_addon_lares_arrivedportalinter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Jako dawni mieszka�cy Nowego Obozu mamy dobre stosunki z Magami Wody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Nawet Lee b�dzie ich chroni� w razie potrzeby.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Wi�kszo�� mych wysi�k�w w mie�cie koncentrowa�a si� na utrzymywaniu wraz z Vatrasem kontaktu z Magami Wody.
	b_makerangerreadyformeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A to jest pancerz, kt�ry ka�dy z nas od nich otrzyma�. Cz�onkowie Wodnego Kr�gu nosili takie zbroje, jeszcze przed wojnami z orkami.
	if(CAVALORN_RANGERHINT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//A sk�d si� w tym wszystkim wzi�� Cavalorn? Nie pami�tam go z Nowego Obozu.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//Masz racj�, nasza spo�eczno�� si� rozros�a. Nawet ja nie wiem, ilu nas dok�adnie jest.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale chod�my ju�. Chc� si� bardziej oddali� od miasta - p�niej pogadamy.
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
};

func void dia_addon_lares_arrivedportalinter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kto to taki?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//G��wny Mag Wody z Nowego Obozu. Jeszcze z czas�w, gdy G�rnicz� Dolin� otacza�a Bariera.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Wraz z Lee zawarli�my umow� z Magami Wody i po��czyli�my si�y przeciwko Staremu Obozowi.
	dia_addon_lares_arrivedportalinter1_teil2();
};

func void dia_addon_lares_arrivedportalinter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jasne. By� g��wnym Magiem Wody z Nowego Obozu.
	dia_addon_lares_arrivedportalinter1_teil2();
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter_condition;
	information = dia_addon_lares_arrivedportalinterweiter_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LARESGUIDE_ZUMPORTAL == 2))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Jak leci? Wszystko w porz�dku?
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING) && (Npc_GetDistToWP(erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//Ten go�� ma problemy z bandytami.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//Dobrze wiedzie�, ale czasu to my mamy raczej ma�o.
	};
	LARESGUIDE_ZUMPORTAL = 3;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter2_condition;
	information = dia_addon_lares_arrivedportalinterweiter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LARESGUIDE_ZUMPORTAL == 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Nie wkurzaj mnie...
	LARESGUIDE_ZUMPORTAL = 4;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter2_condition;
	information = dia_addon_lares_arrivedportalinter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LARESGUIDE_ZUMPORTAL == 4))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//Magowie Wody s� strasznie podekscytowani - od kilku tygodni trwaj� wykopaliska na p�nocnym wschodzie. Nie wiem, co chc� tam znale��.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Zacz�o si� od tego, �e ziemia zatrz�s�a si� jak w okresie, kiedy istnia�a jeszcze Bariera.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Obudzi�y si� kamienne maszkary, kt�re zacz�y niszczy� wszystko, co odwa�y�o si� podej�� do nich bli�ej ni� na 100 krok�w.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//Magowie Wody zniszczyli te istoty i przekopuj� tamt� okolic�, �eby dowiedzie� si� czego� wi�cej.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale wkr�tce zobaczysz to na w�asne oczy.
	LARESGUIDE_ZUMPORTAL = 5;
	b_logentry(TOPIC_ADDON_KDW,"Lares powiedzia� mi o wykopaliskach Mag�w Wody. Badaj� oni dziwne wydarzenia, jakie mia�y miejsce w tamtej okolicy, i s� prawdopodobnie odpowiedzialne za tajemnicze trz�sienia ziemi oraz pojawienie si� kamiennych istot.");
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER3(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter3_condition;
	information = dia_addon_lares_arrivedportalinterweiter3_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter3_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LARESGUIDE_ZUMPORTAL == 5))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter3_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Wszystko w porz�dku?
	LARESGUIDE_ZUMPORTAL = 6;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER4(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter4_condition;
	information = dia_addon_lares_arrivedportalinterweiter4_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter4_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LARESGUIDE_ZUMPORTAL == 6))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter4_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Uwa�aj - tutaj mo�e by� niebezpiecznie.
	LARESGUIDE_ZUMPORTAL = 7;
};


instance DIA_ADDON_LARES_ARRIVEDPORTAL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportal_condition;
	information = dia_addon_lares_arrivedportal_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportal_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LARESGUIDE_ZUMPORTAL == 7))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportal_info()
{
	b_makerangerreadytoleavemeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//Jeste�my na miejscu.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//We� ten ornament. Gdzie� w tej okolicy powinni przebywa� Magowie Wody - zanie� im go.
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//Je�li napotkasz tu jakie� stwory, kt�re b�d� dla ciebie zbyt silne, to po prostu uciekaj jak najszybciej do Saturasa.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On ju� sobie z nimi jako� poradzi. Ja musz� teraz wraca�.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//I jeszcze jedno - nawet nie my�l o badaniu okolicy z ornamentem. Id� prosto do Saturasa.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Do zobaczenia.
	b_logentry(TOPIC_ADDON_KDW,"Lares przekaza� mi ornament. Mam go zanie�� do Saturasa, Maga Wody.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUMPORTAL = 8;
	LARES_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_LARES_ALBERN(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_albern_condition;
	information = dia_addon_lares_albern_info;
	important = TRUE;
};


func int dia_addon_lares_albern_condition()
{
	if((LARES_ANGEKOMMEN == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_lares_albern_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//Nie �artuj sobie! Dostarcz ten ornament!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GOFORESTPRE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforestpre_condition;
	information = dia_addon_lares_goforestpre_info;
	important = TRUE;
};


func int dia_addon_lares_goforestpre_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LARESGUIDE_ORNAMENTFOREST == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_goforestpre_ja()
{
	b_makerangerreadyformeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Tak.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dobrze. Chod� za mn�. To nie b�dzie przyjemne...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LARESGUIDE_ORNAMENTFOREST = 2;
};

func void dia_addon_lares_goforestpre_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Nie. Mo�esz ju� sobie i��.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//To chyba ju� koniec? Do zobaczenia p�niej.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LARESGUIDE_ORNAMENTFOREST = 3;
};

func void dia_addon_lares_goforestpre_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Nadal chcesz, abym towarzyszy� ci w drodze przez las?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Przemy�la�e� to sobie? Naprawd� chcesz i�� do tego miejsca?
	};
	Info_ClearChoices(dia_addon_lares_goforestpre);
	Info_AddChoice(dia_addon_lares_goforestpre,"Nie. Mo�esz ju� sobie i��.",dia_addon_lares_goforestpre_nein);
	Info_AddChoice(dia_addon_lares_goforestpre,"Tak.",dia_addon_lares_goforestpre_ja);
};


instance DIA_ADDON_LARES_GOFOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforest_condition;
	information = dia_addon_lares_goforest_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_goforest_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LARESGUIDE_ORNAMENTFOREST == 2) && Npc_IsDead(stoneguardian_ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_addon_lares_goforest_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		b_makerangerreadytoleavemeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Moje zadanie ju� sko�czone, poradzisz sobie beze mnie. Czas si� zmywa�.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LARESGUIDE_ORNAMENTFOREST = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Pospiesz si� - wola�bym nie zostawa� tu zbyt d�ugo.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_LARES_PORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_portalinterweiter_condition;
	information = dia_addon_lares_portalinterweiter_info;
	permanent = TRUE;
	description = "Chod�my.";
};


func int dia_addon_lares_portalinterweiter_condition()
{
	if((LARESGUIDE_ZUMPORTAL != 0) && (LARESGUIDE_ZUMPORTAL != 8))
	{
		return TRUE;
	};
};

func void dia_addon_lares_portalinterweiter_info()
{
	if(LARESGUIDE_ZUMPORTAL == 4)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//Przesta� si� maza�.
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//Tak, tak.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Chod�my.
	if(LARESGUIDE_ZUMPORTAL == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Zwolnij troch�.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Pod��aj za mn�.
	};
	AI_StopProcessInfos(self);
	if(LARESGUIDE_ZUMPORTAL == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LARESGUIDE_ZUMPORTAL == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LARESGUIDE_ZUMPORTAL == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LARESGUIDE_ZUMPORTAL == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LARESGUIDE_ZUMPORTAL == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Mo�esz mnie czego� nauczy�?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jasne - lepsza si�a i zr�czno�� na pewno ci nie zaszkodz�.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares mo�e pom�c mi zwi�kszy� si�� i zr�czno��.");
};


var int lares_merkedex;
var int lares_merkestr;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "Ucz mnie.";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//Ucz mnie.
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	LARES_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ju� sta�e� si� bardziej zr�czny.
	};
	if(other.attribute[ATR_STRENGTH] > LARES_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//Dobrze - twoja si�a wzrasta.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_lares_teachstr_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "Jakie� wie�ci?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Jakie� wie�ci?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Dzi�ki tobie wie�ci s� naprawd� wspania�e. Wypu�cili Benneta. Wr�ci� ju� na farm�.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Id� do niego. My�l�, �e chcia�by ci sam podzi�kowa�.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Mo�na tak powiedzie�. Paladyni aresztowali Benneta, naszego kowala.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//S�ysza�em. To z�a wiadomo��.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Taa, to za ma�o powiedziane.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak to si� sta�o?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet poszed� do miasta po zapasy. No i ju� nie wr�ci�.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Je�li chcesz wiedzie� wi�cej, pogadaj z Hodgesem. By� w mie�cie razem z Bennetem.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "Jakie� wie�ci o Bennecie?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Jakie� wie�ci o Bennecie?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Wygl�da na to, �e zabrali go do koszar i wrzucili do lochu.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak mo�emy go stamt�d wydosta�?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Nie mam na razie �adnych pomys��w. Nie mog� dosta� si� do celi, �eby z nim porozmawia�.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Mog� tylko nadstawia� ucha, ale tutaj niewiele mo�na si� dowiedzie�.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "Dlaczego nie polujesz na smoki?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Dlaczego nie polujesz na smoki?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//To nie moja dzia�ka. Takie rzeczy zostawiam innym.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nie, nie. �wie�e morskie powietrze - tego mi teraz trzeba.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "Masz mo�e ochot� na opuszczenie wyspy?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Chcia�by� mo�e opu�ci� t� wysp�?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Najbardziej na �wiecie. A co chodzi ci po g�owie?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Dowiedzia�em si�, gdzie ukrywa si� przyw�dca smok�w. Jest na wyspie, niedaleko st�d.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Zamierzam si� go pozby� raz na zawsze.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Brzmi �wietnie. Wchodz� w to, je�li mog� si� do czego� przyda�.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Nie chcia�by� si� nauczy�, jak poprawi� swoj� zr�czno��, albo jak lepiej pos�ugiwa� si� broniami jednor�cznymi?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Statek jest ju� pe�en, ale dam ci zna�, je�li co� si� zmieni.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"Do niczego mi si� nie przydasz.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"Wiedzia�em, �e mog� na tobie polega�.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Wiedzia�em, �e mog� na tobie polega�.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Wszyscy spotkamy si� na statku.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Cz�owiek czynu - to mi si� podoba. Do zobaczenia.
	LARES_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Doceniam twoj� propozycj�, ale do niczego mi si� nie przydasz.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Musisz si� zdecydowa�. Wiesz, gdzie mnie szuka�, je�li zechcesz o tym pogada�.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "Jednak wol�, �eby� zosta�.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Jednak wol�, �eby� zosta�.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak sobie chcesz, ale nast�pnym razem zastan�w si�, co komu obiecujesz.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "Wci�� jeste� zainteresowany podr�?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Wci�� jeste� zainteresowany podr�?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Zwykle nie pozwalam si� tak traktowa�, ale poniewa� jeste� jednym z nas, to tym razem puszcz� ci to p�azem.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Spotkamy si� na statku.
		LARES_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Nie bierz tego do siebie, ale wydaje mi si�, �e mia�e� racj�.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Lepiej je�li zostan� tutaj.
		AI_StopProcessInfos(self);
	};
};

