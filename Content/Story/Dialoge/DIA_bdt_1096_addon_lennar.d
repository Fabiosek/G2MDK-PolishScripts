
instance DIA_ADDON_LENNAR_EXIT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 999;
	condition = dia_addon_lennar_exit_condition;
	information = dia_addon_lennar_exit_info;
	permanent = TRUE;
	description = "Muszê iœæ...";
};


func int dia_addon_lennar_exit_condition()
{
	return TRUE;
};

func void dia_addon_lennar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LENNAR_PICKPOCKET(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 900;
	condition = dia_addon_lennar_pickpocket_condition;
	information = dia_addon_lennar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_lennar_pickpocket_condition()
{
	return c_beklauen(65,100);
};

func void dia_addon_lennar_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_BACK,dia_addon_lennar_pickpocket_back);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_PICKPOCKET,dia_addon_lennar_pickpocket_doit);
};

func void dia_addon_lennar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};

func void dia_addon_lennar_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};


instance DIA_ADDON_LENNAR_HI(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 1;
	condition = dia_addon_lennar_hi_condition;
	information = dia_addon_lennar_hi_info;
	permanent = FALSE;
	description = "Czo³em!";
};


func int dia_addon_lennar_hi_condition()
{
	return TRUE;
};

func void dia_addon_lennar_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Czo³em!
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Czo³em, jestem Lennar. Witaj w Obozie Kopacza.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kopacza? Myœla³em, ¿e to obozowisko bandytów...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasne, ale bandyci te¿ zajmuj¹ siê tu kopaniem.
};


instance DIA_ADDON_LENNAR_ATTENTAT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 2;
	condition = dia_addon_lennar_attentat_condition;
	information = dia_addon_lennar_attentat_info;
	permanent = FALSE;
	description = "A co do próby zabójstwa Estebana...";
};


func int dia_addon_lennar_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//Tak?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//Wiesz, kto stoi za prób¹ zabójstwa?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//Oczywiœcie!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//To na pewno sprawka Emilia.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//Jak szalony biega³ do kopalni i ry³ tam niczym kret.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//Ale od czasu próby zabójstwa siedzi na ³awce i wcale siê z niej nie rusza.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//To jasne! Aby wejœæ do kopalni, musi mieæ czerwony kamieñ Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//Ale pewnie ju¿ nie œmie spojrzeæ mu prosto w oczy.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Lennar podejrzewa Emilia, poniewa¿ ten unika Estebana.");
};


instance DIA_ADDON_LENNAR_INSPEKTOR(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 3;
	condition = dia_addon_lennar_inspektor_condition;
	information = dia_addon_lennar_inspektor_info;
	permanent = FALSE;
	description = "Ale dlaczego Emilio ¿yczy³by œmierci Estebanowi?";
};


func int dia_addon_lennar_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Ale dlaczego Emilio ¿yczy³by œmierci Estebanowi?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//A sk¹d mam to wiedzieæ? Mo¿e ma kole¿kê, który chcia³by zaj¹æ miejsce Estebana?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//Tak, to mia³oby sens...
};


instance DIA_ADDON_LENNAR_MINE(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 4;
	condition = dia_addon_lennar_mine_condition;
	information = dia_addon_lennar_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_lennar_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Rzeczywiœcie masz dla mnie czerwony kamieñ.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Doskonale. Teraz rozkruszê ten przeklêty kamieñ – wiem, jak siê do tego zabraæ!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//I jeszcze jedno – jeœli bêdziesz kopaæ, pamiêtaj, ¿eby za mocno nie uderzaæ. Kilof mo¿e zaklinowaæ siê w z³ocie!
	b_upgrade_hero_hackchance(10);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LENNAR_GOLD(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 5;
	condition = dia_addon_lennar_gold_condition;
	information = dia_addon_lennar_gold_info;
	permanent = FALSE;
	description = "Nauczysz mnie wydobywaæ z³oto?";
};


func int dia_addon_lennar_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//Nauczysz mnie wydobywaæ z³oto?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Jasne, ale wtedy bêdziesz go mieæ wiêcej.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//W³aœnie o to chodzi.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Dobra, ale powinieneœ oddaæ mi czêœæ z³ota, które wykopiesz.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Có¿....
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Najlepiej od razu oddaj mi moj¹ czêœæ. Potrzebujê...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//Piêædziesi¹t sztuk z³ota.
};


var int lennar_teachgold;

instance DIA_ADDON_LENNAR_TRAIN(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 6;
	condition = dia_addon_lennar_train_condition;
	information = dia_addon_lennar_train_info;
	permanent = TRUE;
	description = "Naucz mnie, jak wydobywaæ z³oto! (50 sztuk z³ota)";
};


func int dia_addon_lennar_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_gold) && (LENNAR_TEACHGOLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_train_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Naucz mnie, jak wydobywaæ z³oto!
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//No dobra. Trzeba uderzaæ spokojnie i jednostajnie. Nie spiesz siê – ale uwa¿aj, ¿eby nie zasn¹æ przy pracy.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//Nie wal ci¹gle w jedno miejsce – spróbuj wyci¹æ ³adny z³oty samorodek.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Postêpuj zgodnie z moimi wskazówkami, a zostaniesz prawdziwym mistrzem wœród kopaczy.
		b_upgrade_hero_hackchance(10);
		LENNAR_TEACHGOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Najpierw chcê zobaczyæ moj¹ czêœæ.
	};
};


instance DIA_ADDON_LENNAR_HACKER(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 9;
	condition = dia_addon_lennar_hacker_condition;
	information = dia_addon_lennar_hacker_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_addon_lennar_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Ca³y czas jednym rytmem – dziêki temu bêdziesz mieæ same du¿e samorodki!
};

