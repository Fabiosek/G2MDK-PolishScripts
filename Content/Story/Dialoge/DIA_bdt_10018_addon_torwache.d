
instance DIA_ADDON_BDT_10018_TORWACHE_EXIT(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 999;
	condition = dia_addon_bdt_10018_torwache_exit_condition;
	information = dia_addon_bdt_10018_torwache_exit_info;
	permanent = TRUE;
	description = "Jeszcze porozmawiamy.";
};


func int dia_addon_bdt_10018_torwache_exit_condition()
{
	return TRUE;
};

func void dia_addon_bdt_10018_torwache_exit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00");	//Jeszcze porozmawiamy.
	if(BDT_100018_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//Wiesz, co ci powiem.
		BDT_100018_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Zje�d�aj.
	};
	AI_StopProcessInfos(self);
};


const string BDT_10018_CHECKPOINT = "BL_RAVEN_CHECK";

instance DIA_ADDON_BDT_10018_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 1;
	condition = dia_addon_bdt_10018_torwache_firstwarn_condition;
	information = dia_addon_bdt_10018_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_firstwarn_info()
{
	if(BDT_100018_TELLS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Hej, spokojnie! Nie mo�esz wej��, wi�c zje�d�aj!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Z drogi - musz� si� widzie� z Krukiem.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//Nikt nie mo�e tam wej��. Kruk wyda� wyra�ny rozkaz.
		BDT_100018_TELLS = TRUE;
		Log_CreateTopic(TOPIC_ADDON_TEMPEL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_TEMPEL,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_TEMPEL,"Stra�nik u wr�t �wi�tyni nie wpu�ci mnie do �rodka. Musz� znale�� spos�b, �eby si� tam dosta�.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//To znowu ty? Zaczynasz mnie dra�ni�!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_ADDON_BDT_10018_TORWACHE_SECONDWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_bdt_10018_torwache_secondwarn_condition;
	information = dia_addon_bdt_10018_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//Zr�b jeszcze jeden krok, a b�dzie to tw�j ostatni.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10018_TORWACHE_ATTACK(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 3;
	condition = dia_addon_bdt_10018_torwache_attack_condition;
	information = dia_addon_bdt_10018_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//Za Kruka!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_BDT_10018_TORWACHE_HI(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_hi_condition;
	information = dia_addon_10018_torwache_hi_info;
	permanent = FALSE;
	description = "To piekielnie wa�ne! Musz� si� z nim widzie�.";
};


func int dia_addon_10018_torwache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10018_torwache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//To piekielnie wa�ne! Musz� si� z nim widzie�.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//Nie. To wcale nie jest wa�ne. Tylko Bloodwyn m�g� wej�� do �rodka.
	b_logentry(TOPIC_ADDON_TEMPEL,"Tylko Bloodwyn ma prawo przebywa� wewn�trz �wi�tyni. Mo�e jednak jako� si� tam dostan�.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_BLOODWYN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_bloodwyn_condition;
	information = dia_addon_10018_torwache_bloodwyn_info;
	permanent = FALSE;
	description = "Bloodwyn? A on nie jest martwy?";
};


func int dia_addon_10018_torwache_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Bloodwyn? A on nie jest martwy?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//Jest silniejszy ni� kiedykolwiek. A jak si� dowie, �e kto� robi k�opoty, to go skasuje.
};


instance DIA_ADDON_BDT_10018_TORWACHE_BRIBE(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 9;
	condition = dia_addon_10018_torwache_bribe_condition;
	information = dia_addon_10018_torwache_bribe_info;
	permanent = FALSE;
	description = "Je�li mnie przepu�cisz, dam ci tysi�c sztuk z�ota.";
};


func int dia_addon_10018_torwache_bribe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bribe_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//Je�li mnie przepu�cisz, dam ci tysi�c sztuk z�ota.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//Marnujesz czas, idioto.
};


instance DIA_ADDON_BDT_10018_TORWACHE_DRIN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_drin_condition;
	information = dia_addon_10018_torwache_drin_info;
	permanent = FALSE;
	description = "Bloodwyn jest w �rodku? No to zabierz go stamt�d!";
};


func int dia_addon_10018_torwache_drin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_drin_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Bloodwyn jest w �rodku? No to zabierz go stamt�d!
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ha! Naprawd� wydaje ci si�, �e zrobi�bym co� takiego?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//By� mo�e w obozie jeste� wa�nym cz�owiekiem. Ale twoje wp�ywy ko�cz� si� DOK�ADNIE TU. Jasne?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//Id� wi�c do kopalni po z�oto albo zr�b co� innego - byleby� si� tu nie kr�ci�!
	MIS_BLOODWYNRAUS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn siedzi w �wi�tyni. Ale nie mog� si� teraz do niego dosta�. Mo�e powinienem znowu rozejrze� si� po kopalni?");
};


instance DIA_ADDON_BDT_10018_TORWACHE_KOPF(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_kopf_condition;
	information = dia_addon_10018_torwache_kopf_info;
	permanent = FALSE;
	description = "(Poka� g�ow� Bloodwyna)";
};


func int dia_addon_10018_torwache_kopf_condition()
{
	if(Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1)
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Masz! Dalej chcesz mnie powstrzymywa�?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Czy to... Czy to... To... Bloodwyn? O rany, to jest...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//Ee, tak, echem, nie, to znaczy... Mo�esz wej��.
	MIS_BLOODWYNRAUS = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

