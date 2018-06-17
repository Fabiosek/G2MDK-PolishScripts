
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
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Chyba oszala³em. Co ty tutaj robisz?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//PRZYP£YN¥£EŒ tu?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//To niez³y sposób na ominiêcie stra¿ników przy bramie.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Czy my siê znamy?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hej! Lares, ty stary draniu...",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Czy my siê znamy?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Ch³opie, nie pamiêtasz mnie? Trzyma³em siê w pobli¿u Nowego Obozu.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Cz³owieku, ale by³o fajowo. Pamiêtasz Lee?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywiœcie, ¿e pamiêtam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hej! Lares, ty stary draniu, jak siê tu dosta³eœ?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Uda³o mi siê w sam¹ porê uciec z doliny, razem z Lee i paroma innymi ch³opakami.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Pamiêtasz Lee, prawda?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Oczywiœcie, ¿e pamiêtam Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Wiêc wydosta³em siê z nim z Kolonii zaraz po tym, jak Bariera zosta³a zniszczona.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Teraz on i jego ch³opcy s¹ w gospodarstwie Onara.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Zawar³ uk³ad z w³aœcicielem. Lee i jego ch³opaki broni¹ gospodarstwa, a Onar ich karmi.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Oczywiœcie, ¿e pamiêtam Lee!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Wiele przeszed³eœ, co? Lee by³ przywódc¹ najemników w Nowym Obozie.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_ADDON_LARES_VATRAS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_vatras_condition;
	information = dia_addon_lares_vatras_info;
	description = "Vatras mnie przysy³a.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras mnie przysy³a - wspomina³, ¿e mo¿esz mi pomóc.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//Pozna³eœ ju¿ Vatrasa... Musia³eœ zrobiæ na nim niema³e wra¿enie.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//Inaczej z pewnoœci¹ nie poda³by ci mojego imienia - zw³aszcza ¿e wci¹¿ trzeba rozwi¹zaæ sprawê zaginionych ludzi.
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
	description = "Co ³¹czy ciê z Vatrasem?";
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
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//Co ³¹czy ciê z Vatrasem?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//Powiedzmy, ¿e mam pewn¹ umowê z Magami Wody. Jasne?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//Jakiego rodzaju umowê?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//My dla nich pracujemy, a oni dbaj¹, abyœmy nie mieli k³opotów przez nasz¹ przesz³oœæ.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//Mówisz teraz o Wodnym Krêgu, tak?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//Hê? Wiesz o nim?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras mi powiedzia³.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//Trzeba by³o tak od razu.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares nale¿y do Wodnego Krêgu.");
};


instance DIA_ADDON_LARES_RANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ranger_condition;
	information = dia_addon_lares_ranger_info;
	description = "Opowiedz mi wiêcej o Wodnym Krêgu.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Opowiedz mi wiêcej o Wodnym Krêgu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//Kr¹g jest dla Magów Wody tym, czym paladyni s¹ dla Magów Ognia.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//W odró¿nieniu od paladynów Kr¹g woli jednak pozostawaæ w cieniu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//Kr¹g jest potê¿n¹ broni¹ w walce z niebezpieczeñstwami zagra¿aj¹cymi ludnoœci Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//Aby by³o to mo¿liwe, nikt z nich nie mo¿e jednak wiedzieæ o jego istnieniu.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//Wiêc nic na ten temat nie mów!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Nie ma sprawy.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Kr¹g jest dla Magów Wody tym, czym paladyni s¹ dla Magów Ognia, poza tym, ¿e dzia³a on w tajemnicy. Niewtajemniczeni nie mog¹ wiedzieæ, KTO do niego nale¿y, aby nie mo¿na by³o poznaæ jego prawdziwej si³y.");
};


instance DIA_ADDON_LARES_WANNABERANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_wannaberanger_condition;
	information = dia_addon_lares_wannaberanger_info;
	description = "Chcia³bym siê przy³¹czyæ do Wodnego Krêgu.";
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
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//Chcia³bym siê przy³¹czyæ do Wodnego Krêgu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//Dobry pomys³, choæ decyzja nale¿y do Magów Wody.
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	Info_ClearChoices(dia_addon_lares_wannaberanger);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Rozumiem.",dia_addon_lares_wannaberanger_back);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Jak to jest nale¿eæ do Krêgu?",dia_addon_lares_wannaberanger_howisit);
	Info_AddChoice(dia_addon_lares_wannaberanger,"Jak ci siê uda³o zaimponowaæ Magom Wody?",dia_addon_lares_wannaberanger_aboutyou);
};

func void dia_addon_lares_wannaberanger_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//Rozumiem.
	Info_ClearChoices(dia_addon_lares_wannaberanger);
};

func void dia_addon_lares_wannaberanger_aboutyou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//Jak ci siê uda³o zaimponowaæ Magom Wody?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//Chroni³em ich przez d³ugi czas, gdy jeszcze ¿yli otoczeni Barier¹.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//Naprawdê - powinni byæ wdziêczni...
};

func void dia_addon_lares_wannaberanger_howisit()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//Jak to jest nale¿eæ do Krêgu?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//Ró¿nimy siê od innych gildii z Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Jako jeden z nas nigdy nie musisz robiæ czegoœ, czego nie chcesz.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//Wymagamy tylko jednego - siedŸ cicho.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//Pracujemy w ukryciu. Obcy nie wiedz¹, kto nale¿y do Krêgu.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//Na razie ciê poobserwujemy i potem podejmiemy decyzjê.
};

func void b_lares_geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//Wkrótce odbêdzie siê tajne spotkanie w gospodzie Orlana.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Przyb¹dŸ tam jak najszybciej - tam otrzymasz sprzêt.
};


instance DIA_ADDON_LARES_RINGBACK(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback_condition;
	information = dia_addon_lares_ringback_info;
	description = "Jestem ju¿ cz³onkiem Wodnego Krêgu.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//Jestem ju¿ cz³onkiem Wodnego Krêgu.
	if((LARES_GOTRINGBACK == FALSE) && (SC_GOTLARESRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Doskonale! Oddasz mi teraz mój pierœcieñ z akwamarynem?
		if(b_giveinvitems(other,self,itri_ranger_lares_addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Jasne.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//Mam nadziejê, ¿e siê przyda³. Cieszê siê, ¿e jesteœ ju¿ jednym z nas.
			LARES_GOTRINGBACK = TRUE;
			b_giveplayerxp(XP_AMBIENT);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Niestety, nie mam go przy sobie.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Tylko go nie zgub! Bêdzie mi jeszcze potrzebny.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//Teraz byœ pewnie chcia³ nowy ekwipunek? S³uchaj mnie bardzo uwa¿nie.
	b_lares_geheimtreffen();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares zaprosi³ mnie na sekretne spotkanie Krêgu w gospodzie Orlana.");
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
};


instance DIA_ADDON_LARES_RINGBACK2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback2_condition;
	information = dia_addon_lares_ringback2_info;
	description = "Oto twój pierœcieñ.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Oto twój pierœcieñ.
	b_giveinvitems(other,self,itri_ranger_lares_addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//Ach... Dobrze. Ju¿ s¹dzi³em, ¿e go zgubi³eœ.
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
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//Zaraz - czekamy jeszcze na kogoœ.
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
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//Mój m³ody przyjacielu... Zebraliœmy siê dzisiaj, aby uczciæ twoje wst¹pienie w szeregi Wodnego Krêgu.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//Ci tutaj bêd¹ ciê teraz mieli na oku.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Rzecz jasna to nie wszyscy cz³onkowie Wodnego Krêgu, wiêc miej siê na bacznoœci.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Bez wzglêdu na to, czy odniesiesz sukces, czy coœ zawalisz, i tak siê o tym dowiemy.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Niniejszym wrêczam ci pancerz gildii.
	CreateInvItem(hero,itar_ranger_addon);
	AI_EquipArmor(hero,itar_ranger_addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Noœ go z dum¹, ale nie daj siê przy³apaæ w nim w mieœcie lub innych miejscach publicznych.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Pamiêtaj, ¿e nie chcemy siê ujawniaæ. Nikt niepowo³any nie mo¿e siê dowiedzieæ, kto nale¿y do Wodnego Krêgu.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nikt nie mówi o Wodnym Krêgu - to pierwsza i najwa¿niejsza zasada. Nie ³am jej.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Jeszcze jakieœ pytania?
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Muszê siê zmywaæ.",dia_addon_lares_getrangerarmor_end);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"Jak mo¿esz mi pomóc?",dia_addon_lares_getrangerarmor_learn);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"A co z broni¹?",dia_addon_lares_getrangerarmor_weapons);
};

func void dia_addon_lares_getrangerarmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//A co z broni¹?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//Broni¹ Krêgu jest pika, ale ka¿dy cz³onek mo¿e u¿ywaæ tego, z czym jest najlepiej zaznajomiony.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Oto jedna z naszych pik. Jakoœ nigdy nie potrafi³em siê do niej przyzwyczaiæ - mo¿e tobie lepiej pójdzie.
	CreateInvItems(self,itmw_rangerstaff_addon,1);
	b_giveinvitems(self,other,itmw_rangerstaff_addon,1);
};

func void dia_addon_lares_getrangerarmor_end()
{
	b_makerangerreadytoleavemeetingall();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//Muszê siê zmywaæ.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Nie bêdê ciê zatrzymywaæ.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Udaj siê jak najszybciej do Vatrasa - on zleci ci pierwsze zadanie.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Bracia Krêgu - wracajmy do naszych zajêæ.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//Ci¹gle nie uda³o nam siê powstrzymaæ bandyckich porwañ - trzeba rozwi¹zaæ ten problem jak najszybciej.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanosie, dbaj o równowagê tego œwiata...
	LARES_TAKEFIRSTMISSIONFROMVATRAS = TRUE;
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,DIALOG_ENDE,dia_addon_lares_getrangerarmor_weiter);
};

func void dia_addon_lares_getrangerarmor_weiter()
{
	AI_StopProcessInfos(self);
	b_rangermeetingparking();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Na tajnym spotkaniu w gospodzie Orlana otrzyma³em zbrojê. Teraz powinienem udaæ siê do Vatrasa, by otrzymaæ pierwszy rozkaz jako cz³onek Krêgu.");
};

func void dia_addon_lares_getrangerarmor_learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//Jak mo¿esz mi pomóc?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//Poprzez wspomo¿enie pracy nad twoj¹ zrêcznoœci¹.
	if(Npc_IsDead(sld_805_cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//Jeœli chcesz lepiej walczyæ broni¹ bia³¹, pomów z Cordem - to mistrz w pos³ugiwaniu siê ró¿nego rodzaju ostrzami.
	};
	if(Npc_IsDead(bau_961_gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gann z kolei chêtnie nauczy ciê paru rzeczy o wyprawianiu skór zwierz¹t.
	};
	if(Npc_IsDead(mil_350_addon_martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Od Martina mo¿esz nauczyæ siê wiele o paladynach.
	};
	if(Npc_IsDead(bau_4300_addon_cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn z kolei umie siê podkradaæ, mo¿e ciê równie¿ nauczyæ walki broni¹ jednorêczn¹ oraz pos³ugiwania siê ³ukiem.
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Zwróæ siê do Orlana, jeœli potrzebujesz noclegu.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//Wszystkie twoje potrzeby magiczne powinien zaspokoiæ Vatras.
};


instance DIA_ADDON_LARES_TELEPORTSTATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_teleportstation_condition;
	information = dia_addon_lares_teleportstation_info;
	description = "Korzysta³eœ kiedyœ z kamienia teleportacyjnego?";
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
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Korzysta³eœ kiedyœ z kamienia teleportacyjnego?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//Nie, ale s³ysza³em o nich. Magowie Wody nie maj¹ jeszcze pewnoœci, co z nimi robiæ.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//Ja ju¿ jeden wypróbowa³em...
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//Powinienem siê by³ domyœliæ. Istnieje cokolwiek, na co byœ siê nie powa¿y³?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Jeœli nabierzesz ochoty na zabawê w teleportacjê, to pomów z karczmarzem, Orlanem. Mo¿e wpuœci ciê do swej zamkniêtej jaskini...
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//Chyba trzyma kamieñ teleportacyjny w pobli¿u swej gospody - na potrzeby Magów Wody.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//WyjdŸ z miasta przez wschodni¹ bramê i idŸ wzd³u¿ œcie¿ki. Na pewno trafisz.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Lares powiedzia³ mi, ¿e w pobli¿u gospody Orlana znajduje siê ukryty kamieñ teleportacyjny.");
	ORLAN_HINT_LARES = TRUE;
};


instance DIA_ADDON_LARES_ORNAMENT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornament_condition;
	information = dia_addon_lares_ornament_info;
	description = "Vatras wrêczy³ mi ten ornament, abym ci go przekaza³.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras wrêczy³ mi ten ornament, abym ci go przekaza³ i poleci³ zwróciæ.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//Ech... A to ci 'niespodzianka'. Znowu wszystko na mojej g³owie... Powinienem by³ siê domyœliæ.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//Teraz muszê przebyæ ca³¹ wyspê i oddaæ to coœ Magom Wody.
};


instance DIA_ADDON_LARES_ORNAMENTBRINGJOB(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornamentbringjob_condition;
	information = dia_addon_lares_ornamentbringjob_info;
	description = "Zrobiê to za ciebie!";
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
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//Zrobiê to za ciebie!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//Hmm... Nie, chyba lepiej bêdzie, jeœli ja to zrobiê. Mo¿esz mi jednak towarzyszyæ, jeœli chcesz.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Niestety, nie mogê teraz opuœciæ tego miejsca - muszê pilnowaæ portu.
	b_logentry(TOPIC_ADDON_KDW,"Przynios³em Laresowi ornament Vatrasa. Chce, ¿ebym dostarczy³ go Magom Wody.");
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_RUNNING;
};


instance DIA_ADDON_LARES_YOURMISSION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_yourmission_condition;
	information = dia_addon_lares_yourmission_info;
	permanent = TRUE;
	description = "Czym konkretnie siê tu zajmujesz?";
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
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//Czym konkretnie siê tu zajmujesz?
	if(!Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//Nie mogê o tym mówiæ.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras urwa³by mi ³eb...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//Robiê to samo, co wszyscy pozostali - wykonujê zadania zlecone przez Magów Wody.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Czêœæ zaginionych to rybacy - razem z nimi zniknê³y równie¿ ich ³odzie.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//W³aœnie dlatego stojê tu i obserwujê port - mo¿e uda mi siê coœ odkryæ.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//Ale mo¿esz mi pomóc.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Dam ci mój pierœcieñ z akwamarynem. To znak Wodnego Krêgu.
		CreateInvItems(self,itri_ranger_lares_addon,1);
		b_giveinvitems(self,other,itri_ranger_lares_addon,1);
		SC_GOTLARESRING = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//Za³ó¿ go - dziêki temu inni rozpoznaj¹, ¿e pracujesz dla mnie.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//ZnajdŸ mi zastêpcê tak, abym móg³ w spokoju odnieœæ ornament.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//Ktoœ z nas z regu³y obserwuje targowisko, choæ nie mam pojêcia, kto zajmuje siê tym w tej chwili.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//Najlepiej porozmawiaj ze wszystkimi przebywaj¹cymi tam ludŸmi - w³aœciwa osoba rozpozna ciê po pierœcieniu.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Powiedz jej, aby znalaz³a zastêpstwo.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares da³ mi swój pierœcieñ z akwamarynem - znak rozpoznawczy Krêgu. Gdy za³o¿ê pierœcieñ, zauwa¿¹ go pozostali cz³onkowie tej organizacji.");
		Log_CreateTopic(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Lares nie mo¿e opuœciæ portu. Powinienem przejœæ siê po rynku, nosz¹c jego pierœcieñ z akwamarynem, aby znaleŸæ kogoœ, kto go zast¹pi.");
		MIS_LARES_BRINGRANGERTOME = LOG_RUNNING;
	};
};


instance DIA_ADDON_LARES_BALTRAMABLOESE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_baltramabloese_condition;
	information = dia_addon_lares_baltramabloese_info;
	description = "Rozmawia³em z Baltramem.";
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
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//Rozmawia³em z Baltramem - zorganizuje ci zastêpcê.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Doskonale. Nareszcie bêdzie sobie mo¿na st¹d pójœæ.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//Mo¿esz zatrzymaæ na razie mój pierœcieñ.
		if(Npc_KnowsInfo(other,dia_addon_lares_wannaberanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//Dopóki nie otrzymasz w³asnego, mo¿e ci siê przydaæ.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//Mo¿e kiedyœ zdecydujesz siê do nas do³¹czyæ...
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
		Info_AddChoice(dia_addon_lares_peoplemissing,"Uda³o mi siê ocaliæ czêœæ z zaginionych.",dia_addon_lares_peoplemissing_saved);
	}
	else if((MIS_LARES_BRINGRANGERTOME != 0) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Wiem, gdzie przebywaj¹ zaginieni!",dia_addon_lares_peoplemissing_success);
	}
	else
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Czy to nie jest raczej zadanie dla stra¿y?",dia_addon_lares_peoplemissing_mil);
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
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//Pierwszy by³ miejscowy rybak imieniem William. Pewnego dnia po prostu nie wróci³ z morza.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//Pocz¹tkowo s¹dziliœmy, ¿e jakiœ potwór morski zniszczy³ mu ³ódŸ podczas po³owów.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//Wkrótce jednak zaczêli znikaæ inni; co gorsza, zupe³nie przypadkowi.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Dlatego te¿ nie mamy pojêcia, jak siê zabraæ do tej sprawy. Musimy chyba czekaæ na jakiœ œlad.
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
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//Czy to nie jest raczej zadanie dla stra¿y?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//Taa... Ju¿ widzê, jak cokolwiek robi¹ w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//Nigdy nie znajd¹ przyczyny tych zdarzeñ - uznaj¹, ¿e ludzie po prostu znikaj¹ bez wieœci.
};

func void dia_addon_lares_peoplemissing_success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//Wiem, gdzie przebywaj¹ zaginieni!
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//Czy¿by?
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//Dawny Magnat imieniem Kruk zleci³ ich porwanie.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Jesteœ pewien? Hmm... Trzeba ich jakoœ oswobodziæ.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//Pracujê nad tym.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//Dobra. Jeœli bêdzie ci potrzebna moja pomoc...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//...to wiem, gdzie ciê znaleŸæ. Jasne.
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_saved()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//Uda³o mi siê ocaliæ czêœæ z zaginionych.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//Wiedzia³em, ¿e ci siê uda. Wreszcie mogê zaj¹æ siê swoimi sprawami...
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
	description = "Potrzebujê pomocy.";
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
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//Potrzebujê pomocy.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//Jak mogê ciê wesprzeæ?
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
		Info_AddChoice(dia_addon_lares_rangerhelp,"Mo¿e jakimœ lepszym pancerzem?",dia_addon_lares_rangerhelp_ruestung);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"Potrzeba mi pieniêdzy.",dia_addon_lares_rangerhelp_geld);
	};
};

func void dia_addon_lares_rangerhelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//Mo¿e jakimœ lepszym pancerzem?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//W tej sprawie lepiej udaj siê do Mattea - on handluje dobrymi zbrojami. Niestety, nie s¹ tanie.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//Pewnie da siê to za³atwiæ bez znacz¹cego wydatku - o ile nie masz nic przeciwko odrobinie k³opotów ze stra¿¹...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//A konkretnie? O co chodzi?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//Przy domu Mattea znajduje siê magazynek, ale z³o¿one w nim towary zosta³y skonfiskowane przez stra¿.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Udaj siê do Zurisa na targowisko i wydostañ od niego zaklêcie usypiaj¹ce, za pomoc¹ którego wyeliminujesz stra¿ników.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//Tam musi byæ coœ niez³ego.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG = TRUE;
};

func void dia_addon_lares_rangerhelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//Potrzeba mi lepszej broni.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//Przykro mi, z tym ci nie pomogê. Zak³adam, ¿e odwiedzi³eœ ju¿ targowisko?
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE = TRUE;
};

func void dia_addon_lares_rangerhelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//Potrzeba mi pieniêdzy.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//A kto ich nie potrzebuje? Nie mam nic na zbyciu. Chocia¿... Lichwiarz Lehmar ma u mnie d³ug wdziêcznoœci.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//IdŸ do niego i wyp³aæ tyle, ile ci potrzeba - ja zajmê siê reszt¹. Znajdziesz go w porcie, w pobli¿u przejœcia do dolnej czêœci miasta.
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
	description = "Za wszelk¹ cenê muszê siê skontaktowaæ z paladynami!";
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
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Muszê koniecznie porozmawiaæ z paladynami!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//A czego od NICH chcesz?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//Posiadaj¹ potê¿ny amulet zwany Okiem Innosa. Muszê go mieæ.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//I myœlisz, ¿e po prostu ci go oddadz¹? Nigdy nie dostaniesz siê do górnego miasta.
	if(!Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Znajdê jakiœ sposób.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Jasne, jeœli chcesz siê przymilaæ mieszkañcom, albo zostaniesz ch³opcem na posy³ki w stra¿y.
	};
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Czy wiesz, dlaczego s¹ tu paladyni?";
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
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Czy wiesz, dlaczego tu s¹ paladyni?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nikt nie wie na pewno... Wiêkszoœæ ludzi uwa¿a, ¿e to z powodu orków, ale ja mam inne zdanie na ten temat.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//To ma pewnie coœ wspólnego ze star¹ koloni¹ karn¹.
};


instance DIA_ADDON_LARES_GILDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_gilde_condition;
	information = dia_addon_lares_gilde_info;
	permanent = TRUE;
	description = "Vatras wspomnia³, ¿e mo¿esz mi pomóc do³¹czyæ do jednej z gildii.";
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
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras wspomnia³, ¿e mo¿esz mi pomóc do³¹czyæ do jednej z gildii.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//Nie lubisz siê przepracowywaæ, co?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//Rozumiem.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//Jeœli chcesz siê przy³¹czyæ do Lee, to mogê pogadaæ z najemnikami.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//Z pewnoœci¹ ³atwiej by³oby ci siê wkrêciæ do klasztoru...
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//A zdecydowanie najprostsze by³oby do³¹czenie do stra¿y.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Któr¹ gildiê wybierasz?
	Info_ClearChoices(dia_addon_lares_gilde);
	Info_AddChoice(dia_addon_lares_gilde,"Muszê to jeszcze przemyœleæ...",dia_addon_lares_gilde_back);
	Info_AddChoice(dia_addon_lares_gilde,"Magów Ognia.",dia_addon_lares_gilde_kdf);
	Info_AddChoice(dia_addon_lares_gilde,"Najemników.",dia_addon_lares_gilde_sld);
	Info_AddChoice(dia_addon_lares_gilde,"Stra¿.",dia_addon_lares_gilde_mil);
};

func void dia_addon_lares_gilde_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//Muszê to jeszcze przemyœleæ...
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_sld()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//Najemników.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//Lee z pewnoœci¹ ciê przyjmie.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//Najpierw musisz jednak przejœæ pewn¹ próbê...
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Pomów lepiej z Cordem na farmie Onara.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//On pomo¿e ci w tej sprawie.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Powiedz mu, ¿e jesteœ moim protegowanym. Zrozumie, o co chodzi.
	RANGERHELP_GILDESLD = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPSLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Lares s¹dzi, ¿e Cord, który jest na farmie bogatego ziemianina, mo¿e mi pomóc dostaæ siê do najemników.");
	SC_KNOWSCORDASRANGERFROMLARES = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//Stra¿.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//Taaak. Wiem chyba, co ciê u nich tak poci¹ga - wygl¹dasz mi na kogoœ, kto uwielbia dawaæ innym wyk³ady o obowi¹zuj¹cym prawie, kradn¹c jednoczeœnie na potêgê.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//W porcie znajduje siê magazyn paladynów. Kwatermistrzem jest tam mój dobry znajomy.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Nazywa siê Martin - mo¿e on zdo³a ci pomóc.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPMIL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Lares twierdzi, ¿e kwatermistrz Martin pomo¿e mi szybciej dostaæ siê w szeregi stra¿y. Zwykle przebywa w porcie, gdzie paladyni maj¹ swój magazyn.");
	RANGERHELP_GILDEMIL = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_kdf()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//Magów Ognia.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//Vatras pewnie siê tego nie spodziewa³... Inaczej by ciê do mnie nie przys³a³.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Jeœli chcesz siê dostaæ do klasztoru, to bêdzie ciê to kosztowaæ.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Nie pozwol¹ ci wejœæ do œrodka, jeœli nie op³acisz daniny.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//Tylko Vatras mo¿e coœ z tym zrobiæ - musisz z nim pomówiæ w tej sprawie.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Lares twierdzi, ¿e Vatras zna dobry sposób na wst¹pienie do klasztoru.");
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
	description = "Powiedz mi coœ o Lee i jego najemnikach.";
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
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Powiedz mi coœ o Lee i jego najemnikach.
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//Co konkretnie chcesz wiedzieæ?
	Info_ClearChoices(dia_lares_aboutsld);
	Info_AddChoice(dia_lares_aboutsld,DIALOG_BACK,dia_lares_aboutsld_back);
	Info_AddChoice(dia_lares_aboutsld,"A dlaczego TY nie jesteœ razem z Lee i jego najemnikami?",dia_lares_aboutsld_whynotyou);
	Info_AddChoice(dia_lares_aboutsld,"Powiedz mi coœ wiêcej o najemnikach.",dia_lares_aboutsld_sld);
	Info_AddChoice(dia_lares_aboutsld,"Jak dostanê siê do gospodarstwa tego w³aœciciela ziemskiego?",dia_lares_aboutsld_waytoonar);
};

func void dia_lares_aboutsld_back()
{
	Info_ClearChoices(dia_lares_aboutsld);
};

func void dia_lares_aboutsld_sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Powiedz mi coœ wiêcej o najemnikach.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Có¿, jeœli jesteœ takim twardzielem jak kiedyœ, nie powinni sprawiæ ci k³opotu.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Wiêkszoœæ z nich to bandyci, a jeœli sobie z nimi nie poradzisz, to daleko nie zajdziesz.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//Jeœli jesteœ delikatny, to na pewno z nimi nie wygrasz....
};

func void dia_lares_aboutsld_whynotyou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//A dlaczego TY nie jesteœ razem z Lee i jego najemnikami?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Ale¿ jestem! Tylko ¿e nie na farmie.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Mo¿na powiedzieæ, ¿e zosta³em tu wys³any na posterunek. Nie chcemy, aby statek odp³yn¹³ bez nas.
	LARES_WORKFORLEE = TRUE;
	Info_AddChoice(dia_lares_aboutsld,"O jakim statku mówi³eœ?",dia_lares_aboutsld_schiff);
};

func void dia_lares_aboutsld_schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//O jakim statku mówi³eœ?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Stoi w porcie, za klifami. Lee i paru jego ludzi bardzo chce siê st¹d wydostaæ.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Ale to mo¿e trochê potrwaæ...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Dlaczego?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Lepiej zapytaj o to Lee, jeœli go spotkasz... Ma jakieœ plany.
};

func void dia_lares_aboutsld_waytoonar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Jak dostanê siê do gospodarstwa tego w³aœciciela ziemskiego?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//To doœæ proste. WyjdŸ z miasta wschodni¹ bram¹ i idŸ drog¹ na wschód.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//Mogê wskazaæ ci drogê, jeœli chcesz.
	LARES_WAYTOONAR = TRUE;
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 14;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Wiesz coœ o gildii z³odziei w mieœcie?";
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
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Wiesz coœ o gildii z³odziei w mieœcie?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Te twoje pytania...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Oczywiœcie, ¿e jest tu taka gildia. Jak w ka¿dym wiêkszym mieœcie.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//Ka¿dy paser czy kieszonkowiec ma z ni¹ pewnie jakieœ powi¹zania.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 15;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Wiesz, gdzie mogê znaleŸæ gildiê z³odziei?";
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
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Wiesz, gdzie mogê znaleŸæ gildiê z³odziei?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//Bez obrazy, ale nawet gdybym wiedzia³, to nie powiedzia³bym ci ani s³owa.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Ci ludzie s¹ zwykle BARDZO dra¿liwi, jeœli chodzi o te sprawy.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Powinieneœ byæ bardzo ostro¿ny, jeœli chcesz siê z nimi zadawaæ.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 16;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "Mam tutaj klucz. Zardzewia³ od morskiej wody...";
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
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Mam tutaj klucz. Zardzewia³ od morskiej wody...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//No i?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Wydaje mi siê, ¿e pozwoli mi dostaæ siê do kryjówki gildii z³odziei...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Có¿, mo¿liwe, ¿e to klucz do kana³ów.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 17;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Gdzie znajdê kana³y?";
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
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Gdzie znajdê kana³y?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//A co ja mogê wiedzieæ... Zwykle maj¹ ujœcie na brzegu morza.
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
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Jesteœ teraz w stra¿y!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//Normalnie umrê ze œmiechu - by³y skazaniec w stra¿y miejskiej...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Wiêc teraz jesteœ jednym z paladynów Króla!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//Tylko ty mog³eœ wyci¹æ taki numer...
		if(LARES_WORKFORLEE == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//Nie bêdziesz robiæ mi problemów z powodu pracy u Lee, prawda?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ale znasz mnie...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Nie ³apiê. By³eœ w klasztorze. Jak tam jest?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Inaczej.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Domyœlam siê.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//Podobno Lee przyj¹³ ciê do kompanii.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Gratulacje.
	};
};


instance DIA_ADDON_LARES_FOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_addon_lares_forest_condition;
	information = dia_addon_lares_forest_info;
	description = "Mo¿esz mi towarzyszyæ w drodze przez gêsty las na wschodzie?";
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
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Mo¿esz mi towarzyszyæ w drodze przez gêsty las na wschodzie?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Jasne, tylko po co siê tam zapuszczasz?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius prosi³, aby poszukaæ dalszych ornamentów.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//Jedno z miejsc, które mam zbadaæ, znajduje siê w œrodku tego lasu.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//Rozumiem. Samemu to zbyt niebezpieczne?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//Nie ma sprawy. Daj znaæ, jak bêdziesz chcia³ ruszaæ.
	RANGERHELP_ORNAMENTFOREST = TRUE;
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = TRUE;
	description = "Dobra, chodŸmy.";
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
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//A wiêc ruszajmy... ChodŸ za mn¹.
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
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobra, chodŸmy.
	if(LARES_CANBRINGSCTOPLACES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//Nie mogê siê st¹d ruszyæ, dopóki ktoœ mnie nie zast¹pi lub nie zostanie rozwi¹zana sprawa gin¹cych ludzi.
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
			Info_AddChoice(dia_lares_gonow,"Na farmê Onara.",dia_lares_gonow_onar);
		};
		if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (LARES_ANGEKOMMEN == FALSE))
		{
			Info_AddChoice(dia_lares_gonow,"Odnieœmy ornament Vatrasa.",dia_lares_gonow_maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LARESGUIDE_ORNAMENTFOREST == 0) && (RANGERHELP_ORNAMENTFOREST == TRUE))
		{
			Info_AddChoice(dia_lares_gonow,"Zapuœæmy siê w ten gêsty las na wschodzie.",dia_lares_gonow_forest);
		};
	};
};

func void dia_lares_gonow_maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Odnieœmy ornament Vatrasa.
	LARESGUIDE_ZUMPORTAL = 1;
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//Na farmê Onara.
	LARESGUIDE_ZUONAR = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//Zapuœæmy siê w ten gêsty las na wschodzie.
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
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//A wiêc jesteœmy.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//A wiêc tutaj jesteœ. Ju¿ zaczyna³em myœleæ, ¿e ze¿ar³y ciê wilki.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Có¿, przez resztê drogi poradzisz sobie sam. Muszê wracaæ do miasta. Mam tam kilka spraw do za³atwienia.
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//IdŸ po prostu t¹ drog¹ i pamiêtaj - b¹dŸ twardy i nie daj sobie wcisn¹æ kitu, a wszystko pójdzie jak po maœle.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Jesteœmy ju¿ za miastem, tutaj nikt nas nie pods³ucha... Mam ci coœ do powiedzenia.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//Ten ornament nale¿y zanieœæ Saturasowi. Pamiêtasz go, prawda?
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Jasne.",dia_addon_lares_arrivedportalinter1_ja);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Saturas? Kto to taki?",dia_addon_lares_arrivedportalinter1_wer);
	LARESGUIDE_ZUMPORTAL = 2;
};

func void dia_addon_lares_arrivedportalinter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//Jako dawni mieszkañcy Nowego Obozu mamy dobre stosunki z Magami Wody.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Nawet Lee bêdzie ich chroniæ w razie potrzeby.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//Wiêkszoœæ mych wysi³ków w mieœcie koncentrowa³a siê na utrzymywaniu wraz z Vatrasem kontaktu z Magami Wody.
	b_makerangerreadyformeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//A to jest pancerz, który ka¿dy z nas od nich otrzyma³. Cz³onkowie Wodnego Krêgu nosili takie zbroje, jeszcze przed wojnami z orkami.
	if(CAVALORN_RANGERHINT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//A sk¹d siê w tym wszystkim wzi¹³ Cavalorn? Nie pamiêtam go z Nowego Obozu.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//Masz racjê, nasza spo³ecznoœæ siê rozros³a. Nawet ja nie wiem, ilu nas dok³adnie jest.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//Ale chodŸmy ju¿. Chcê siê bardziej oddaliæ od miasta - póŸniej pogadamy.
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
};

func void dia_addon_lares_arrivedportalinter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Kto to taki?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//G³ówny Mag Wody z Nowego Obozu. Jeszcze z czasów, gdy Górnicz¹ Dolinê otacza³a Bariera.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Wraz z Lee zawarliœmy umowê z Magami Wody i po³¹czyliœmy si³y przeciwko Staremu Obozowi.
	dia_addon_lares_arrivedportalinter1_teil2();
};

func void dia_addon_lares_arrivedportalinter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Jasne. By³ g³ównym Magiem Wody z Nowego Obozu.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//Jak leci? Wszystko w porz¹dku?
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING) && (Npc_GetDistToWP(erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//Ten goœæ ma problemy z bandytami.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//Dobrze wiedzieæ, ale czasu to my mamy raczej ma³o.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//Magowie Wody s¹ strasznie podekscytowani - od kilku tygodni trwaj¹ wykopaliska na pó³nocnym wschodzie. Nie wiem, co chc¹ tam znaleŸæ.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//Zaczê³o siê od tego, ¿e ziemia zatrzês³a siê jak w okresie, kiedy istnia³a jeszcze Bariera.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Obudzi³y siê kamienne maszkary, które zaczê³y niszczyæ wszystko, co odwa¿y³o siê podejœæ do nich bli¿ej ni¿ na 100 kroków.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//Magowie Wody zniszczyli te istoty i przekopuj¹ tamt¹ okolicê, ¿eby dowiedzieæ siê czegoœ wiêcej.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//Ale wkrótce zobaczysz to na w³asne oczy.
	LARESGUIDE_ZUMPORTAL = 5;
	b_logentry(TOPIC_ADDON_KDW,"Lares powiedzia³ mi o wykopaliskach Magów Wody. Badaj¹ oni dziwne wydarzenia, jakie mia³y miejsce w tamtej okolicy, i s¹ prawdopodobnie odpowiedzialne za tajemnicze trzêsienia ziemi oraz pojawienie siê kamiennych istot.");
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Wszystko w porz¹dku?
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Uwa¿aj - tutaj mo¿e byæ niebezpiecznie.
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
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//Jesteœmy na miejscu.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//WeŸ ten ornament. Gdzieœ w tej okolicy powinni przebywaæ Magowie Wody - zanieœ im go.
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//Jeœli napotkasz tu jakieœ stwory, które bêd¹ dla ciebie zbyt silne, to po prostu uciekaj jak najszybciej do Saturasa.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//On ju¿ sobie z nimi jakoœ poradzi. Ja muszê teraz wracaæ.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//I jeszcze jedno - nawet nie myœl o badaniu okolicy z ornamentem. IdŸ prosto do Saturasa.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//Do zobaczenia.
	b_logentry(TOPIC_ADDON_KDW,"Lares przekaza³ mi ornament. Mam go zanieœæ do Saturasa, Maga Wody.");
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
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//Nie ¿artuj sobie! Dostarcz ten ornament!
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
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//Dobrze. ChodŸ za mn¹. To nie bêdzie przyjemne...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LARESGUIDE_ORNAMENTFOREST = 2;
};

func void dia_addon_lares_goforestpre_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//Nie. Mo¿esz ju¿ sobie iœæ.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//To chyba ju¿ koniec? Do zobaczenia póŸniej.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LARESGUIDE_ORNAMENTFOREST = 3;
};

func void dia_addon_lares_goforestpre_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Nadal chcesz, abym towarzyszy³ ci w drodze przez las?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Przemyœla³eœ to sobie? Naprawdê chcesz iœæ do tego miejsca?
	};
	Info_ClearChoices(dia_addon_lares_goforestpre);
	Info_AddChoice(dia_addon_lares_goforestpre,"Nie. Mo¿esz ju¿ sobie iœæ.",dia_addon_lares_goforestpre_nein);
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
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//Moje zadanie ju¿ skoñczone, poradzisz sobie beze mnie. Czas siê zmywaæ.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LARESGUIDE_ORNAMENTFOREST = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Pospiesz siê - wola³bym nie zostawaæ tu zbyt d³ugo.
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
	description = "ChodŸmy.";
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
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//Przestañ siê mazaæ.
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//Tak, tak.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//ChodŸmy.
	if(LARESGUIDE_ZUMPORTAL == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Zwolnij trochê.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Pod¹¿aj za mn¹.
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Jasne - lepsza si³a i zrêcznoœæ na pewno ci nie zaszkodz¹.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares mo¿e pomóc mi zwiêkszyæ si³ê i zrêcznoœæ.");
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
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ju¿ sta³eœ siê bardziej zrêczny.
	};
	if(other.attribute[ATR_STRENGTH] > LARES_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//Dobrze - twoja si³a wzrasta.
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
	description = "Jakieœ wieœci?";
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
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Jakieœ wieœci?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Dziêki tobie wieœci s¹ naprawdê wspania³e. Wypuœcili Benneta. Wróci³ ju¿ na farmê.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//IdŸ do niego. Myœlê, ¿e chcia³by ci sam podziêkowaæ.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Mo¿na tak powiedzieæ. Paladyni aresztowali Benneta, naszego kowala.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//S³ysza³em. To z³a wiadomoœæ.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Taa, to za ma³o powiedziane.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Jak to siê sta³o?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet poszed³ do miasta po zapasy. No i ju¿ nie wróci³.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Jeœli chcesz wiedzieæ wiêcej, pogadaj z Hodgesem. By³ w mieœcie razem z Bennetem.
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
	description = "Jakieœ wieœci o Bennecie?";
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
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Jakieœ wieœci o Bennecie?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Wygl¹da na to, ¿e zabrali go do koszar i wrzucili do lochu.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Jak mo¿emy go stamt¹d wydostaæ?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Nie mam na razie ¿adnych pomys³ów. Nie mogê dostaæ siê do celi, ¿eby z nim porozmawiaæ.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Mogê tylko nadstawiaæ ucha, ale tutaj niewiele mo¿na siê dowiedzieæ.
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
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//To nie moja dzia³ka. Takie rzeczy zostawiam innym.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nie, nie. Œwie¿e morskie powietrze - tego mi teraz trzeba.
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
	description = "Masz mo¿e ochotê na opuszczenie wyspy?";
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
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Chcia³byœ mo¿e opuœciæ tê wyspê?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Najbardziej na œwiecie. A co chodzi ci po g³owie?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Dowiedzia³em siê, gdzie ukrywa siê przywódca smoków. Jest na wyspie, niedaleko st¹d.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Zamierzam siê go pozbyæ raz na zawsze.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Brzmi œwietnie. Wchodzê w to, jeœli mogê siê do czegoœ przydaæ.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Nie chcia³byœ siê nauczyæ, jak poprawiæ swoj¹ zrêcznoœæ, albo jak lepiej pos³ugiwaæ siê broniami jednorêcznymi?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Statek jest ju¿ pe³en, ale dam ci znaæ, jeœli coœ siê zmieni.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"Do niczego mi siê nie przydasz.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"Wiedzia³em, ¿e mogê na tobie polegaæ.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Wiedzia³em, ¿e mogê na tobie polegaæ.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Wszyscy spotkamy siê na statku.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Cz³owiek czynu - to mi siê podoba. Do zobaczenia.
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
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Doceniam twoj¹ propozycjê, ale do niczego mi siê nie przydasz.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Musisz siê zdecydowaæ. Wiesz, gdzie mnie szukaæ, jeœli zechcesz o tym pogadaæ.
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
	description = "Jednak wolê, ¿ebyœ zosta³.";
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
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Jednak wolê, ¿ebyœ zosta³.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Jak sobie chcesz, ale nastêpnym razem zastanów siê, co komu obiecujesz.
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
	description = "Wci¹¿ jesteœ zainteresowany podró¿¹?";
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
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Wci¹¿ jesteœ zainteresowany podró¿¹?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Zwykle nie pozwalam siê tak traktowaæ, ale poniewa¿ jesteœ jednym z nas, to tym razem puszczê ci to p³azem.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Spotkamy siê na statku.
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
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Nie bierz tego do siebie, ale wydaje mi siê, ¿e mia³eœ racjê.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Lepiej jeœli zostanê tutaj.
		AI_StopProcessInfos(self);
	};
};

