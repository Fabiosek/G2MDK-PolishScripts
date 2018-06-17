
instance DIA_ADDON_BANDITGUARD_EXIT(C_INFO)
{
	npc = bdt_1064_bandit_l;
	nr = 999;
	condition = dia_banditguard_exit_condition;
	information = dia_banditguard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_banditguard_exit_condition()
{
	return TRUE;
};

func void dia_banditguard_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1064_CHECKPOINT = "NW_CASTLEMINE_TOWER_05";

instance DIA_BDT_1064_BANDITGUARD_FIRSTWARN(C_INFO)
{
	npc = bdt_1064_bandit_l;
	nr = 1;
	condition = dia_bdt_1064_banditguard_firstwarn_condition;
	information = dia_bdt_1064_banditguard_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1064_banditguard_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_1064_CHECKPOINT) <= 800)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bdt_1064_banditguard_firstwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_00");	//Jest tylko JEDEN sposób, ¿ebyœ dosta³ siê do obozu ¯YWY - przez most.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1064_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1064_BANDITGUARD_SECONDWARN(C_INFO)
{
	npc = bdt_1064_bandit_l;
	nr = 2;
	condition = dia_bdt_1064_banditguard_secondwarn_condition;
	information = dia_bdt_1064_banditguard_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1064_banditguard_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1064_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 75)))
	{
		return TRUE;
	};
};

func void dia_bdt_1064_banditguard_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_01");	//Chcesz oberwaæ, co? Zrób jeszcze JEDEN krok, a zrzucê ciê z urwiska.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1064_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1064_BANDITGUARD_ATTACK(C_INFO)
{
	npc = bdt_1064_bandit_l;
	nr = 3;
	condition = dia_bdt_1064_banditguard_attack_condition;
	information = dia_bdt_1064_banditguard_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1064_banditguard_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1064_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 75)))
	{
		return TRUE;
	};
};

func void dia_bdt_1064_banditguard_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_02");	//Dobra, sam siê o to prosi³eœ...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_ADDON_BANDITGUARD_PERM(C_INFO)
{
	npc = bdt_1064_bandit_l;
	nr = 99;
	condition = dia_banditguard_perm_condition;
	information = dia_banditguard_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_banditguard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_banditguard_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Dexwache_Add_04_03");	//Nie dra¿nij mnie!
	AI_StopProcessInfos(self);
};

