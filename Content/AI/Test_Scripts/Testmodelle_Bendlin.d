
const int VALUE_SC_SUMMONMUD = 300;

instance ITSC_SUMMONMUD(C_ITEM)
{
	name = NAME_SPRUCHROLLE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMMONMUD;
	visual = "ItSc_SumDemon.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONMUD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_WEAKGLIMMER";
	description = NAME_SPL_SUMMONMUD;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance AYA_TESTMODELL(NPC_DEFAULT)
{
	name[0] = "Aya";
	guild = GIL_NONE;
	id = 55555;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	fight_tactic = FAI_HUMAN_MASTER;
	daily_routine = rtn_start_55555;
	bodystateinterruptableoverride = TRUE;
	aivar[AIV_RANSACKED] = TRUE;
	aivar[AIV_DEATHINVGIVEN] = TRUE;
	aivar[AIV_VICTORYXPGIVEN] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_IGNORESFAKEGUILD] = TRUE;
	b_setattributestochapter(self,6);
	b_setfightskills(self,100);
	b_givenpctalents(self);
	EquipItem(self,itmw_beliarweapon_fire);
	CreateInvItems(self,itar_baubabe_l,1);
	CreateInvItems(self,itar_baubabe_m,1);
	CreateInvItems(self,itar_vlkbabe_l,1);
	CreateInvItems(self,itar_vlkbabe_m,1);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLACKHAIR,BODYTEXBABE_S,itar_vlkbabe_h);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
};


func void rtn_start_55555()
{
	ta_stand_armscrossed(6,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,6,0,"XXX");
};

func void rtn_follow_55555()
{
	ta_follow_player(8,0,23,0,"XXX");
	ta_follow_player(23,0,8,0,"XXX");
};


instance DIA_AYA_KOMMMIT(C_INFO)
{
	npc = aya_testmodell;
	nr = 1;
	condition = dia_aya_kommmit_condition;
	information = dia_aya_kommmit_info;
	permanent = TRUE;
	description = "Dobra, chodŸmy.";
};


func int dia_aya_kommmit_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_aya_kommmit_info()
{
	var int ayagoldamount;
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Dobra, chodŸmy.
	ayagoldamount = Npc_HasItems(other,itmi_gold);
	if(ayagoldamount > 1000)
	{
		ayagoldamount = 1000;
	};
	if(ayagoldamount > 0)
	{
		b_say(self,other,"$WHERETO");
		b_giveinvitems(other,self,itmi_gold,ayagoldamount);
		Npc_RemoveInvItems(self,itmi_gold,ayagoldamount);
	}
	else
	{
		b_say(self,other,"$SHITNOGOLD");
	};
	AI_StopProcessInfos(self);
	if(ayagoldamount > 0)
	{
		Npc_ExchangeRoutine(self,"Follow");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_AYA_WARTEHIER(C_INFO)
{
	npc = aya_testmodell;
	nr = 1;
	condition = dia_aya_wartehier_condition;
	information = dia_aya_wartehier_info;
	permanent = TRUE;
	description = "Obawiam siê, ¿e teraz musimy siê rozstaæ.";
};


func int dia_aya_wartehier_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_aya_wartehier_info()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//Obawiam siê, ¿e teraz musimy siê rozstaæ.
	b_say(self,other,"$YESGOOUTOFHERE");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_AYA_EXIT(C_INFO)
{
	npc = aya_testmodell;
	nr = 999;
	condition = dia_aya_exit_condition;
	information = dia_aya_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_aya_exit_condition()
{
	return TRUE;
};

func void dia_aya_exit_info()
{
	AI_StopProcessInfos(self);
};

