
instance DIA_ADDON_HENRY_EXIT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 999;
	condition = dia_addon_henry_exit_condition;
	information = dia_addon_henry_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_henry_exit_condition()
{
	return TRUE;
};

func void dia_addon_henry_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_henry_gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 sztuk z³ota.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 sztuk z³ota.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 sztuk z³ota.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 sztuk z³ota.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 sztuk z³ota.
	}
	else
	{
		b_say_gold(self,other,gold);
	};
};


instance DIA_ADDON_HENRY_PICKPOCKET(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 900;
	condition = dia_addon_henry_pickpocket_condition;
	information = dia_addon_henry_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_henry_pickpocket_condition()
{
	return c_beklauen(40,60);
};

func void dia_addon_henry_pickpocket_info()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_BACK,dia_addon_henry_pickpocket_back);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_PICKPOCKET,dia_addon_henry_pickpocket_doit);
};

func void dia_addon_henry_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_henry_pickpocket);
};

func void dia_addon_henry_pickpocket_back()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
};


const string PIR_1354_CHECKPOINT = "ADW_PIRATECAMP_WAY_02";

instance DIA_ADDON_HENRY_HELLO(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_hello_condition;
	information = dia_addon_henry_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_hello_condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//Stój, kto idzie?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Swój czy wróg?
	Info_ClearChoices(dia_addon_henry_hello);
	Info_AddChoice(dia_addon_henry_hello,"Wróg!",dia_addon_henry_hello_feind);
	Info_AddChoice(dia_addon_henry_hello,"Swój!",dia_addon_henry_hello_freund);
};


var int henry_sc_frech;

func void dia_addon_henry_hello_feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Wróg!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Spryciarz... Chcesz, ¿ebym ci porachowa³ koœci?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Mów, co masz do powiedzenia, albo odejdŸ.
	HENRY_SC_FRECH = TRUE;
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};

func void dia_addon_henry_hello_freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Swój!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//Ka¿dy tak mo¿e powiedzieæ. Nie znam ciê. Czego tutaj szukasz?
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};


instance DIA_ADDON_HENRY_SECONDWARN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_secondwarn_condition;
	information = dia_addon_henry_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//Jeszcze jeden krok i rzucê ciê rekinom na po¿arcie!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HENRY_ATTACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_attack_condition;
	information = dia_addon_henry_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//Sam tego chcia³eœ.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


var int henry_zoll_whatfor;

instance DIA_ADDON_HENRY_WANTENTER(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_wantenter_condition;
	information = dia_addon_henry_wantenter_info;
	permanent = FALSE;
	description = "Chcê wejœæ!";
};


func int dia_addon_henry_wantenter_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_wantenter_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//Chcê wejœæ!
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Naprawdê? To ciê bêdzie kosztowaæ...
	b_henry_gold(500);
	if(HENRY_ZOLL_WHATFOR == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Niby czemu?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Musisz wszystko komplikowaæ?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//W tym obozie jest wiele rzeczy, które mog¹ ciê zainteresowaæ.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE) || (Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//A ty wygl¹dasz na kogoœ, kto ma pieni¹dze.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//Nie zedrê przecie¿ z ciebie ostatniej koszuli. Zobaczysz, op³aci ci siê.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//No, chyba ¿e ten strój ukrad³eœ.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//Masz przy sobie pieni¹dze, prawda?
	};
};

func void b_henry_nojoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//Jeœli chcesz do nas do³¹czyæ, to mam dla ciebie z³¹ wiadomoœæ, ch³opcze.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Kapitan wyp³yn¹³ w rejs, a tylko on decyduje, kogo przyjmie siê do za³ogi.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//Ale mo¿esz tu zostaæ do jego powrotu.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Jeœli nie bêdziesz sprawiaæ k³opotów, rzecz jasna.
};


instance DIA_ADDON_HENRY_EINIGEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_einigen2_condition;
	information = dia_addon_henry_einigen2_info;
	description = "Oto twoje 500 sztuk z³ota.";
};


func int dia_addon_henry_einigen2_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter) && !Npc_KnowsInfo(other,dia_addon_henry_einigen) && (Npc_HasItems(other,itmi_gold) >= 500))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Oto twoje 500 sztuk z³ota.
	b_giveinvitems(other,self,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//Wspaniale. Witamy w naszym skromnym obozie.
	b_henry_nojoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ADDON_HENRY_EINIGEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_einigen_condition;
	information = dia_addon_henry_einigen_info;
	description = "Mo¿e siê potargujemy?";
};


func int dia_addon_henry_einigen_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Mo¿e siê potargujemy?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Có¿, daj mi jakiœ powód, dla którego mia³bym opuœciæ cenê.
};


instance DIA_ADDON_HENRY_MEATFORMORGAN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 4;
	condition = dia_addon_henry_meatformorgan_condition;
	information = dia_addon_henry_meatformorgan_info;
	permanent = FALSE;
	description = "Mam miêso dla Morgana.";
};


func int dia_addon_henry_meatformorgan_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_henry_meatformorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//Mam miêso dla Morgana.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//Aha. A kto ciê przysy³a?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Jack Aligator. Mówi, ¿e Morgan czeka na dostawê.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//Tak, tak.. Jakby sam nie móg³ siê ruszyæ...
};


instance DIA_ADDON_HENRY_MALCOM(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_malcom_condition;
	information = dia_addon_henry_malcom_info;
	description = "Malcolm mnie przysy³a. ";
};


func int dia_addon_henry_malcom_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MALCOMBOTSCHAFT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_malcom_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Malcolm mnie przysy³a. Mówi³, ¿e na drewno przyjdzie trochê poczekaæ.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//Tak, tak... Powinienem by³ wiedzieæ. Jak zwykle, bêdziemy czekaæ ca³e wieki.
	b_malcomexident();
};


instance DIA_ADDON_HENRY_BALTRAMPACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_baltrampack_condition;
	information = dia_addon_henry_baltrampack_info;
	description = "Mam przesy³kê dla Skipa.";
};


func int dia_addon_henry_baltrampack_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_henry_baltrampack_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//Mam przesy³kê dla Skipa. Jest w œrodku?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Tak, jest w œrodku. Coœ jeszcze?
};


var int henry_amount;

instance DIA_ADDON_HENRY_TRIBUT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 7;
	condition = dia_addon_henry_tribut_condition;
	information = dia_addon_henry_tribut_info;
	permanent = TRUE;
	description = "Wpuœæ mnie.";
};


func int dia_addon_henry_tribut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_tribut_info()
{
	HENRY_AMOUNT = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Wpuœæ mnie.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Hmm...
	if(Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//Przynios³eœ mi wiadomoœæ od drwali.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_meatformorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//Jesteœ pomocnikiem Jacka Aligatora i masz miêso dla Morgana.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_baltrampack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//Masz paczkê dla Skipa.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
	{
		if(HENRY_AMOUNT < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//A co najciekawsze...
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//Uda³o ci siê pokonaæ tych bandziorów z wie¿y.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//Nie myœla³em, ¿e uda ci siê tego dokonaæ!
		HENRY_AMOUNT = HENRY_AMOUNT - 200;
	};
	if(HENRY_AMOUNT <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Wiesz, co ci powiem? WchodŸ za darmo...
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(dia_addon_henry_tribut);
	}
	else
	{
		b_henry_gold(HENRY_AMOUNT);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//...albo odejdŸ.
		Info_ClearChoices(dia_addon_henry_tribut);
		Info_AddChoice(dia_addon_henry_tribut,"To zbyt wiele.",dia_addon_henry_tribut_nein);
		if(Npc_HasItems(other,itmi_gold) >= HENRY_AMOUNT)
		{
			Info_AddChoice(dia_addon_henry_tribut,"Dobrze. Tu jest twoje z³oto.",dia_addon_henry_tribut_ja);
		};
	};
};

func void dia_addon_henry_tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Dobrze. Tu jest twoje z³oto.
	b_giveinvitems(other,self,itmi_gold,HENRY_AMOUNT);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Dziêki. Witamy w naszych skromnych progach.
	b_henry_nojoin();
	Info_ClearChoices(dia_addon_henry_tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void dia_addon_henry_tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//To zbyt wiele.
	if(HENRY_AMOUNT < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//No co ty? I tak ju¿ spuœci³em z ceny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Daj mi spokój, co?
	};
	Info_ClearChoices(dia_addon_henry_tribut);
};


instance DIA_ADDON_HENRY_PALISADE(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_condition;
	information = dia_addon_henry_palisade_info;
	permanent = FALSE;
	description = "Co robisz?";
};


func int dia_addon_henry_palisade_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//Co robisz?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//A na co to wygl¹da? Nadzorujê budowê palisady, ¿eby te lenie zrobi³y to na czas.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//Jeœli tego nie dokoñczymy, to kapitan Greg da nam popaliæ.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Pilnujê te¿, aby nikt niepowo³any tu nie wszed³.
};


instance DIA_ADDON_HENRY_PALISADE_WHATFOR(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 12;
	condition = dia_addon_henry_palisade_whatfor_condition;
	information = dia_addon_henry_palisade_whatfor_info;
	permanent = FALSE;
	description = "Po co stawiacie tê palisadê?";
};


func int dia_addon_henry_palisade_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//Po co stawiacie tê palisadê?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Choæby po to, ¿eby utrudniæ ¿ycie bandytom!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Te sukinkoty podchodz¹ coraz bli¿ej. Zupe³nie jak rekiny okr¹¿aj¹ce rozbitka na pe³nym morzu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Kilku z nich zaszy³o siê w wie¿y na po³udniu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//Ale s¹dzê, ¿e to tylko zwiad.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//Tak wiêc, jeœli w koñcu zaatakuj¹, bêdziemy przygotowani.
	Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"W wie¿y na po³udniu od obozu piratów siedzi grupa bandytów.");
};

func void b_henry_whereistower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Gdzie jest ta wie¿a?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Jeœli wyruszysz st¹d i bêdziesz trzyma³ siê prawej strony...
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//...to po pewnym czasie powinieneœ zobaczyæ wie¿ê na ma³ym klifie.
};


instance DIA_ADDON_HENRY_TURMBANDITEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 13;
	condition = dia_addon_henry_turmbanditen_whatfor_condition;
	information = dia_addon_henry_turmbanditen_whatfor_info;
	permanent = TRUE;
	description = "Jeœli chodzi o tych bandytów z wie¿y...";
};


func int dia_addon_henry_turmbanditen_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor) && (MIS_HENRY_FREEBDTTOWER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_henry_turmbanditen_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//Jeœli chodzi o tych bandytów z wie¿y...
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Tak?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//Ju¿ nie bêd¹ sprawiaæ k³opotów.
		if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Wspaniale! Jeden problem z g³owy.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Pokona³eœ ich w pojedynkê? Panowie, czapki z g³ów!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Kto wie, mo¿e kiedyœ bêdziesz prawdziwym piratem!
		};
		sawpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(sawpirate,"START");
		hammerpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(hammerpirate,"START");
		MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Bandyci w wie¿y nie ¿yj¹.");
		b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
	}
	else if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//Co teraz?
		b_henry_whereistower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//Tylko nie myœl, ¿eby pójœæ tam samemu!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//PóŸniej wyœlê tam dwóch ch³opaków z mojej grupy aborda¿owej. Oni poradz¹ sobie z bandytami.
		KNOWS_HENRYSENTERTRUPP = TRUE;
	};
};


instance DIA_ADDON_HENRY_PALISADE_BANDITS(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 14;
	condition = dia_addon_henry_palisade_bandits_condition;
	information = dia_addon_henry_palisade_bandits_info;
	permanent = FALSE;
	description = "Dlaczego zostaliœcie zaatakowani przez bandytów?";
};


func int dia_addon_henry_palisade_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Dlaczego zostaliœcie zaatakowani przez bandytów?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//A jak s¹dzisz? Wojujemy z nimi od jakiegoœ czasu.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Na pocz¹tku wszystko by³o w porz¹dku. PrzywieŸliœmy ich tutaj, a oni odeszli w g³¹b bagien i nie niepokoili nas wiêcej.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//Niestety, póŸniej zaczêli napadaæ na ka¿dego, kto nie nale¿a³ do ich bandy.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Nie mam pojêcia, co za demony ich opêta³y!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//Myœlê, ¿e chc¹ zabraæ nasze ³odzie, bo to chyba jedyny sposób, by siê st¹d wyrwaæ.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//Porozmawiaj ze Skipem. By³ w ich obozie i omal nie przyp³aci³ tego ¿yciem.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//To bardzo ciekawa historia!
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//Niestety, nie bêdziesz móg³ jej wys³uchaæ, bo nie zap³aci³eœ myta.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
};


var int henry_entercrewmember;

instance DIA_ADDON_HENRY_ENTERCREW(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 31;
	condition = dia_addon_henry_entercrew_condition;
	information = dia_addon_henry_entercrew_info;
	permanent = TRUE;
	description = "Chcê do³¹czyæ do waszej grupy aborda¿owej.";
};


func int dia_addon_henry_entercrew_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ENTERCREWMEMBER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_entercrew_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//Chcê do³¹czyæ do waszej grupy aborda¿owej.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//Tym siê nie wykpisz, ch³opcze!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//Najpierw musimy ustaliæ, czy w ogóle zas³ugujesz na wpuszczenie ciê do obozu!
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Witam w mojej grupie!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//Przyda nam siê dodatkowe ramiê, kiedy bêdziemy walczyæ z bandytami.
		if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm... Jak powiedzia³em, weŸ jednego z ch³opców i wykurz bandziorów z wie¿y.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//Ale ju¿ to zrobi³eœ.
		}
		else
		{
			if(Npc_IsDead(sawpirate) && Npc_IsDead(hammerpirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Obaj moi ludzie nie ¿yj¹. Wygl¹da na to, ¿e bêdziesz musia³ pójœæ tam sam.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Pozb¹dŸ siê bandytów z wie¿y!
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce, ¿ebym usun¹³ bandytów z wie¿y. Nie mo¿e jednak daæ mi ¿adnego wsparcia.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//WeŸ jednego z moich ch³opców i pozb¹dŸ siê bandytów z wie¿y.
				HENRY_GETPARTYMEMBER = TRUE;
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry chce, ¿ebym usun¹³ bandytów z wie¿y. Mogê zabraæ ze sob¹ jednego z jego ch³opaków.");
			};
			b_henry_whereistower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Tak jest!
			MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
		};
		HENRY_ENTERCREWMEMBER = TRUE;
	};
};


instance DIA_ADDON_HENRY_OWEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 32;
	condition = dia_addon_henry_owen_condition;
	information = dia_addon_henry_owen_info;
	description = "Mogê wam jeszcze jakoœ pomóc?";
};


func int dia_addon_henry_owen_condition()
{
	if((MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS) && (HENRY_ENTERCREWMEMBER == TRUE) && !Npc_IsDead(malcom))
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Mogê wam jeszcze jakoœ pomóc?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//Od wielu dni czekamy na drewno potrzebne do budowy palisady.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcolm i Owen powinni byli dostarczyæ je ju¿ dawno temu.
	if(!Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Obóz drwali nie jest zbyt daleko - nad jeziorem le¿¹cym w kotlinie na po³udniowym wschodzie.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcolm powiedzia³, ¿e dostawa siê opóŸni, ale my ju¿ czekamy ca³e wieki!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Powiedz im, ¿e czekamy na drewno!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//Nie, czekaj... Powiedz to Owenowi. Malcolm jest ma³o wiarygodny.
	b_malcomexident();
	MIS_HENRY_HOLOWEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_HOLOWEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOLOWEN,"Henry czeka przy palisadzie na drewno. Mam powiadomiæ o tym Owena, który razem z Malcolmem przebywa w kotlinie.");
};

func void b_addon_henry_malcomsdead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//Co siê dzieje z Malcolmem?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//Nie ¿yje.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Mia³ nielichego pecha, co?
};


instance DIA_ADDON_HENRY_OWEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 33;
	condition = dia_addon_henry_owen2_condition;
	information = dia_addon_henry_owen2_info;
	permanent = TRUE;
	description = "Jeœli chodzi o drwala Owena...";
};


func int dia_addon_henry_owen2_condition()
{
	if(MIS_HENRY_HOLOWEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//Jeœli chodzi o drwala Owena...
	if(Npc_IsDead(pir_1367_addon_owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//Nie ¿yje...
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Szlag by to trafi³! Teraz bêdê musia³ wys³aæ kogoœ innego.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//Chyba ju¿ pora, ¿eby Morgan ruszy³ ty³ek i pozby³ siê tych stworów.
		b_addon_henry_malcomsdead();
		MIS_HENRY_HOLOWEN = LOG_OBSOLETE;
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen i Malcom nie ¿yj¹.");
		Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_OBSOLETE);
	}
	else if(OWEN_COMESTOHENRY == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen dostarczy drewno.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Doskonale. Czas ju¿ najwy¿szy.
		b_addon_henry_malcomsdead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Oto twoja nagroda.
		b_giveinvitems(self,other,itmi_gold,200);
		b_startotherroutine(pir_1367_addon_owen,"PostStart");
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen dostarczy drewno Henry'emu.");
		MIS_HENRY_HOLOWEN = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_OWEN_COMESTOHENRY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Gdzie jest ten obóz?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//Kawa³ek na po³udniowy wschód, nieopodal kotliny.
	};
};


var int henry_perm_once;

instance DIA_ADDON_HENRY_PALISADE_CANHELP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 34;
	condition = dia_addon_henry_palisade_canhelp_condition;
	information = dia_addon_henry_palisade_canhelp_info;
	permanent = TRUE;
	description = "Potrzebujesz pomocy?";
};


func int dia_addon_henry_palisade_canhelp_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_SUCCESS) || (MIS_HENRY_HOLOWEN == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_canhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Potrzebujesz pomocy?
	if(HENRY_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Masz jakieœ doœwiadczenie w stawianiu palisad?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//Niezbyt du¿e.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//W takim razie nie mam dla ciebie ¿adnej pracy. Poszukaj sobie innego zajêcia.
		HENRY_PERM_ONCE = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//Rób, co chcesz, tylko nie przeszkadzaj mi w pracy, jasne?
};


instance DIA_ADDON_HENRY_WHATTEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 21;
	condition = dia_addon_henry_whatteach_condition;
	information = dia_addon_henry_whatteach_info;
	permanent = TRUE;
	description = "Mo¿esz mnie podszkoliæ w walce?";
};


func int dia_addon_henry_whatteach_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ADDON_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_whatteach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Mo¿esz mnie podszkoliæ w walce?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//Najpierw obowi¹zek, potem przyjemnoœæ. Zrób coœ po¿ytecznego, to ciê nauczê walczyæ.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//Wszystko jest wliczone w cenê.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Pewnie, czemu nie?
		HENRY_ADDON_TEACHPLAYER = TRUE;
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	};
};


var int henry_merke2h;
var int henry_labercount;

func void b_henry_commentfightskill()
{
	if(HENRY_LABERCOUNT == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//Szybko siê uczysz, zupe³nie jak prawdziwy pirat.
		HENRY_LABERCOUNT = 1;
	}
	else if(HENRY_LABERCOUNT == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//Jeœli tak dalej pójdzie, to sam bêdziesz siê rwa³ do aborda¿y.
		HENRY_LABERCOUNT = 2;
	}
	else if(HENRY_LABERCOUNT == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//Pamiêtaj, ¿e najd³u¿ej ¿yj¹ ci, którzy opanowali sztukê parowania.
		HENRY_LABERCOUNT = 0;
	};
};


instance DIA_ADDON_HENRY_TEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_teach_condition;
	information = dia_addon_henry_teach_info;
	permanent = TRUE;
	description = "Ucz mnie.";
};


func int dia_addon_henry_teach_condition()
{
	if(HENRY_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Ucz mnie.
	HENRY_MERKE2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] > HENRY_MERKE2H)
	{
		b_henry_commentfightskill();
	}
	else if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//Masz przed sob¹ du¿o nauki.
	};
	Info_ClearChoices(dia_addon_henry_teach);
};

func void dia_addon_henry_teach_cb_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_cb_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,1) * 5),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};


instance DIA_ADDON_HENRY_PALISADE_TRAIN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_train_condition;
	information = dia_addon_henry_palisade_train_info;
	permanent = FALSE;
	description = "Greg jest twoim szefem?";
};


func int dia_addon_henry_palisade_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_train_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg jest twoim szefem?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//Zgadza siê. Ale dla ciebie to jest Kapitan Greg. Rozumiemy siê?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//To wielki cz³owiek. Kiedy go spotkasz, nawet nie myœl, by zrobiæ coœ g³upiego. Nie spodoba ci siê jego reakcja na takie zachowanie.
	if(pir_1300_addon_greg_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//Ju¿ z nim rozmawia³em.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//W takim razie wiesz, o czym mówiê.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//Niestety, nie ma go w tej chwili w obozie.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Jego zastêpc¹ jest Francis.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//Ca³ymi dniami siedzi przed chat¹ Grega i gapi siê na nas jak sroka w gnat.
};


instance DIA_ADDON_HENRY_YOUROWNTRUPP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_yourowntrupp_condition;
	information = dia_addon_henry_yourowntrupp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_henry_yourowntrupp_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_yourowntrupp_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//Kapitan powierzy³ ci dowództwo nad grup¹ uderzeniow¹?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Ch³opakom przyda siê trochê pracy!
	AI_StopProcessInfos(self);
};

