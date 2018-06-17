
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
	description = "Wygl�dasz jak kopacz.";
};


func int dia_addon_emilio_hi_condition()
{
	return TRUE;
};

func void dia_addon_emilio_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Wygl�dasz jak kopacz.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//Bo JESTEM kopaczem. Gdy ostatnio by�em w kopalni, tyra�em jak w�.
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
	description = "Co si� dzieje ze z�otem z kopalni?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co si� dzieje ze z�otem z kopalni?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus je zbiera i rozprowadza. Nikt nie mo�e zatrzyma� tego, co znajdzie.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Ka�dy otrzymuje tylko cz�� z�ota, by my�liwi i stra�nicy te� co� mieli.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//To dobrze. Od czasu wprowadzenia tej zasady mamy mniej zabitych, a kopacze i tak dostaj� wi�cej ni� ci z zewn�trz.
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
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To pomys� Thorusa i Estebana.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus zajmuje si� rozprowadzaniem z�ota, a Esteban organizacj� pracy w kopalni.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Oczywi�cie nie chce mu si� biega� do Thorusa za ka�dym razem, gdy wysy�a kogo� do kopalni.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Po to s� te czerwone tabliczki - dzi�ki nim Thorus wpuszcza nas do �rodka. To co� jak karta wst�pu.
};


var int emilio_switch;

instance DIA_ADDON_EMILIO_ATTENTAT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 4;
	condition = dia_addon_emilio_attentat_condition;
	information = dia_addon_emilio_attentat_info;
	permanent = TRUE;
	description = "Co wiesz o pr�bie zab�jstwa?";
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
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co wiesz o pr�bie zab�jstwa?
	if(EMILIO_SWITCH == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//Hej, nie mam z tym nic wsp�lnego!
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
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//Powiedz mi, DLACZEGO Senyan zawo�a� "Patrzcie, kogo tu mamy?"
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//Chodzi�o o nieuregulowany d�ug.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Zabi�e� Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//Masz jaki� problem?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//Nie, sk�d, nie mam �adnego problemu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Wprost przeciwnie. Ten gnojek pracowa� dla Estebana.
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
	description = "Dlaczego nie jeste� teraz w kopalni?";
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
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Dlaczego nie jeste� teraz w kopalni?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//By�em tam bardzo d�ugo i pracowa�em tak ci�ko, �e prawie odpad�y mi r�ce. Potrzebuj� kilku dni odpoczynku.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//Potem wezm� sw�j kolejny czerwony kamie�.
};


instance DIA_ADDON_EMILIO_VONEMILIO(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 6;
	condition = dia_addon_emilio_vonemilio_condition;
	information = dia_addon_emilio_vonemilio_info;
	permanent = FALSE;
	description = "Lennar powiedzia� mi o tobie kilka ciekawych rzeczy....";
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
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar powiedzia� mi o tobie kilka ciekawych rzeczy....
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten go�� to idiota! Na pewno to zauwa�y�e�.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//Powiedzia�, �e nie by�e� w kopalni od czasu pr�by zab�jstwa.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//Nn... Nic nie wiem!
	if(!Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Zm�wi�e� si� z Senyanem, tak?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Jeste�cie w zmowie z Estebanem! S�ysza�em, o czym gadali�cie!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Esteban ma nas gdzie�. Dlaczego mam ufa� jego ludziom?
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Zostaw mnie w spokoju!
		AI_StopProcessInfos(self);
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio uwa�a Lennara za idiot�.");
};


instance DIA_ADDON_EMILIO_HILFMIR(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 7;
	condition = dia_addon_emilio_hilfmir_condition;
	information = dia_addon_emilio_hilfmir_info;
	permanent = FALSE;
	description = "Pom� mi znale�� kolesia, kt�ry zorganizowa� pr�b� zab�jstwa!";
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
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pom� mi znale�� cz�owieka, kt�ry zorganizowa� pr�b� zab�jstwa!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Nie! Nie chc� mie� z tym nic wsp�lnego!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Je�eli taki idiota, jak Lennar, zauwa�y� twoje dziwne zachowanie, Esteban szybko co� zw�cha.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//Ja... Cholera! Podam ci tylko imi�. Nie powiem nic wi�cej.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//S�ucham.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno, id� do Huno. On musi co� wiedzie�.
	EMILIO_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio w ko�cu wykrztusi� imi�: Huno.");
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
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//Ta �winia my�li tylko o pieni�dzach.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Co kilka dni kto� zostaje po�arty przez pe�zacza.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nie chce wys�a� do kopalni wojownik�w.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A dlaczego? Bo ci kolesie stanowi� cz�� Stra�y Kruka, a on boi si� im rozkazywa�.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Zamiast tego pozwala nam zdycha�!
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
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Wi�c teraz ty tu jeste� szefem. W takim razie ruszam w swoj� drog�.
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
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Ci�ko pracuj�, ale nie zostan� po�arty przez pe�zacza.
};

