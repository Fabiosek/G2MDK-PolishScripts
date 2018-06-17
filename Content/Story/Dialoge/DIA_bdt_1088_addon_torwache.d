
instance DIA_BDT_1088_ADDON_TORWACHE_EXIT(C_INFO)
{
	npc = bdt_1088_addon_torwache;
	nr = 999;
	condition = dia_bdt_1088_addon_torwache_exit_condition;
	information = dia_bdt_1088_addon_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1088_addon_torwache_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1088_addon_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1088_CHECKPOINT = "BL_UP_CHECK";

instance DIA_BDT_1088_ADDON_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = bdt_1088_addon_torwache;
	nr = 1;
	condition = dia_bdt_1088_addon_torwache_firstwarn_condition;
	information = dia_bdt_1088_addon_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1088_addon_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_1088_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bdt_1088_addon_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_00");	//STÓJ!
	if(MIS_SEND_BUDDLER == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1088_Torwache_FirstWarn_15_01");	//Przepuœæ mnie, stra¿niku.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_06_02");	//W porz¹dku. Mo¿esz przejœæ.
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else if((MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		if(TORWACHE_GREETINGS == 0)
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_03");	//Bez czerwonego kamienia nie wejdziesz.
			TORWACHE_GREETINGS = 1;
		}
		else if(TORWACHE_GREETINGS == 1)
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_04");	//Nie zrozumia³eœ? Z DROGI!
			TORWACHE_GREETINGS = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_05");	//Z DROGI!
		};
	}
	else if(MIS_SEND_BUDDLER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_06");	//Hej, bez pozwolenia od Thorusa nie mogê ciê przepuœciæ.
	};
	AI_StopProcessInfos(self);
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1088_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_BDT_1088_ADDON_TORWACHE_SECONDWARN(C_INFO)
{
	npc = bdt_1088_addon_torwache;
	nr = 2;
	condition = dia_bdt_1088_addon_torwache_secondwarn_condition;
	information = dia_bdt_1088_addon_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1088_addon_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1088_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1088_addon_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_SecondWarn_06_00");	//Dobra, spokojnie. To twoja ostatnia szansa. NATYCHMIAST siê cofnij, bo inaczej po tobie...
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1088_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1088_ADDON_TORWACHE_ATTACK(C_INFO)
{
	npc = bdt_1088_addon_torwache;
	nr = 3;
	condition = dia_bdt_1088_addon_torwache_attack_condition;
	information = dia_bdt_1088_addon_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1088_addon_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1088_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1088_addon_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_1088_Addon_Torwache_Attack_06_00");	//Chyba sobie ¿artujesz. No w ka¿dym razie ja jestem powa¿ny...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};

