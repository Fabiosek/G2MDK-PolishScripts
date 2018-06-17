
instance DIA_ADDON_EMILIO_EXIT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 999;
	condition = dia_addon_emilio_exit_condition;
	information = dia_addon_emilio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_emilio_exit_condition()
{
	return TRUE;
};

func void dia_addon_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EMILIO_PICKPOCKET(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 900;
	condition = dia_addon_emilio_pickpocket_condition;
	information = dia_addon_emilio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_emilio_pickpocket_condition()
{
	return c_beklauen(76,112);
};

func void dia_addon_emilio_pickpocket_info()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_BACK,dia_addon_emilio_pickpocket_back);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_PICKPOCKET,dia_addon_emilio_pickpocket_doit);
};

func void dia_addon_emilio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};

func void dia_addon_emilio_pickpocket_back()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};


instance DIA_ADDON_BDT_10015_EMILIO_HI(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_hi_condition;
	information = dia_addon_emilio_hi_info;
	permanent = FALSE;
	description = "Wygl¹dasz jak kopacz.";
};


func int dia_addon_emilio_hi_condition()
{
	return TRUE;
};

func void dia_addon_emilio_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Wygl¹dasz jak kopacz.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//Bo JESTEM kopaczem. Gdy ostatnio by³em w kopalni, tyra³em jak wó³.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BDT_10015_EMILIO_GOLD(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 2;
	condition = dia_addon_emilio_gold_condition;
	information = dia_addon_emilio_gold_info;
	permanent = FALSE;
	description = "Co siê dzieje ze z³otem z kopalni?";
};


func int dia_addon_emilio_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gold_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co siê dzieje ze z³otem z kopalni?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus je zbiera i rozprowadza. Nikt nie mo¿e zatrzymaæ tego, co znajdzie.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Ka¿dy otrzymuje tylko czêœæ z³ota, by myœliwi i stra¿nicy te¿ coœ mieli.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//To dobrze. Od czasu wprowadzenia tej zasady mamy mniej zabitych, a kopacze i tak dostaj¹ wiêcej ni¿ ci z zewn¹trz.
};


instance DIA_ADDON_BDT_10015_EMILIO_STEIN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 3;
	condition = dia_addon_emilio_stein_condition;
	information = dia_addon_emilio_stein_info;
	permanent = FALSE;
	description = "O co chodzi z tymi czerwonymi kamieniami?";
};


func int dia_addon_emilio_stein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//O co chodzi z tymi czerwonymi kamieniami?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To pomys³ Thorusa i Estebana.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus zajmuje siê rozprowadzaniem z³ota, a Esteban organizacj¹ pracy w kopalni.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Oczywiœcie nie chce mu siê biegaæ do Thorusa za ka¿dym razem, gdy wysy³a kogoœ do kopalni.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Po to s¹ te czerwone tabliczki - dziêki nim Thorus wpuszcza nas do œrodka. To coœ jak karta wstêpu.
};


var int emilio_switch;

instance DIA_ADDON_EMILIO_ATTENTAT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 4;
	condition = dia_addon_emilio_attentat_condition;
	information = dia_addon_emilio_attentat_info;
	permanent = TRUE;
	description = "Co wiesz o próbie zabójstwa?";
};


func int dia_addon_emilio_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return FALSE;
	}
	else if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void dia_addon_emilio_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co wiesz o próbie zabójstwa?
	if(EMILIO_SWITCH == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//Hej, nie mam z tym nic wspólnego!
		EMILIO_SWITCH = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//KOMPLETNIE NIC!
		EMILIO_SWITCH = 0;
	};
};


instance DIA_ADDON_BDT_10015_EMILIO_SENYAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_senyan_condition;
	information = dia_addon_emilio_senyan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_emilio_senyan_condition()
{
	if(Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_senyan_info()
{
	if(SENYAN_CALLED == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//Powiedz mi, DLACZEGO Senyan zawo³a³ "Patrzcie, kogo tu mamy?"
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//Chodzi³o o nieuregulowany d³ug.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Zabi³eœ Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//Masz jakiœ problem?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//Nie, sk¹d, nie mam ¿adnego problemu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Wprost przeciwnie. Ten gnojek pracowa³ dla Estebana.
	SENYAN_CONTRA = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio nie stoi po stronie Estebana.");
};


instance DIA_ADDON_EMILIO_JETZT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 5;
	condition = dia_addon_emilio_jetzt_condition;
	information = dia_addon_emilio_jetzt_info;
	permanent = FALSE;
	description = "Dlaczego nie jesteœ teraz w kopalni?";
};


func int dia_addon_emilio_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Dlaczego nie jesteœ teraz w kopalni?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//By³em tam bardzo d³ugo i pracowa³em tak ciê¿ko, ¿e prawie odpad³y mi rêce. Potrzebujê kilku dni odpoczynku.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//Potem wezmê swój kolejny czerwony kamieñ.
};


instance DIA_ADDON_EMILIO_VONEMILIO(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 6;
	condition = dia_addon_emilio_vonemilio_condition;
	information = dia_addon_emilio_vonemilio_info;
	permanent = FALSE;
	description = "Lennar powiedzia³ mi o tobie kilka ciekawych rzeczy....";
};


func int dia_addon_emilio_vonemilio_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt) && Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_vonemilio_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar powiedzia³ mi o tobie kilka ciekawych rzeczy....
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten goœæ to idiota! Na pewno to zauwa¿y³eœ.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//Powiedzia³, ¿e nie by³eœ w kopalni od czasu próby zabójstwa.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//Nn... Nic nie wiem!
	if(!Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Zmówi³eœ siê z Senyanem, tak?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Jesteœcie w zmowie z Estebanem! S³ysza³em, o czym gadaliœcie!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Esteban ma nas gdzieœ. Dlaczego mam ufaæ jego ludziom?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Zostaw mnie w spokoju!
		AI_StopProcessInfos(self);
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio uwa¿a Lennara za idiotê.");
};


instance DIA_ADDON_EMILIO_HILFMIR(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 7;
	condition = dia_addon_emilio_hilfmir_condition;
	information = dia_addon_emilio_hilfmir_info;
	permanent = FALSE;
	description = "Pomó¿ mi znaleŸæ kolesia, który zorganizowa³ próbê zabójstwa!";
};


func int dia_addon_emilio_hilfmir_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hilfmir_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pomó¿ mi znaleŸæ cz³owieka, który zorganizowa³ próbê zabójstwa!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Nie! Nie chcê mieæ z tym nic wspólnego!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Je¿eli taki idiota, jak Lennar, zauwa¿y³ twoje dziwne zachowanie, Esteban szybko coœ zw¹cha.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//Ja... Cholera! Podam ci tylko imiê. Nie powiem nic wiêcej.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//S³ucham.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno, idŸ do Huno. On musi coœ wiedzieæ.
	EMILIO_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio w koñcu wykrztusi³ imiê: Huno.");
};


instance DIA_ADDON_EMILIO_GEGENESTEBAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 8;
	condition = dia_addon_emilio_gegenesteban_condition;
	information = dia_addon_emilio_gegenesteban_info;
	permanent = FALSE;
	description = "Jaki masz problem z Estebanem?";
};


func int dia_addon_emilio_gegenesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gegenesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Jaki masz problem z Estebanem?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//Ta œwinia myœli tylko o pieni¹dzach.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Co kilka dni ktoœ zostaje po¿arty przez pe³zacza.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nie chce wys³aæ do kopalni wojowników.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A dlaczego? Bo ci kolesie stanowi¹ czêœæ Stra¿y Kruka, a on boi siê im rozkazywaæ.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Zamiast tego pozwala nam zdychaæ!
};


instance DIA_ADDON_BDT_10015_EMILIO_MINE(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_mine_condition;
	information = dia_addon_emilio_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_emilio_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Wiêc teraz ty tu jesteœ szefem. W takim razie ruszam w swoj¹ drogê.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_EMILIO_HACKER(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_hacker_condition;
	information = dia_addon_emilio_hacker_info;
	permanent = TRUE;
	description = "Co nowego?";
};


func int dia_addon_emilio_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Co nowego?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Ciê¿ko pracujê, ale nie zostanê po¿arty przez pe³zacza.
};

