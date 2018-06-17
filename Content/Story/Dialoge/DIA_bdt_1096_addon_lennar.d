
instance DIA_ADDON_LENNAR_EXIT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 999;
	condition = dia_addon_lennar_exit_condition;
	information = dia_addon_lennar_exit_info;
	permanent = TRUE;
	description = "Musz� i��...";
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
	description = "Czo�em!";
};


func int dia_addon_lennar_hi_condition()
{
	return TRUE;
};

func void dia_addon_lennar_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Czo�em!
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Czo�em, jestem Lennar. Witaj w Obozie Kopacza.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Kopacza? My�la�em, �e to obozowisko bandyt�w...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Jasne, ale bandyci te� zajmuj� si� tu kopaniem.
};


instance DIA_ADDON_LENNAR_ATTENTAT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 2;
	condition = dia_addon_lennar_attentat_condition;
	information = dia_addon_lennar_attentat_info;
	permanent = FALSE;
	description = "A co do pr�by zab�jstwa Estebana...";
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
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//Wiesz, kto stoi za pr�b� zab�jstwa?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//Oczywi�cie!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//To na pewno sprawka Emilia.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//Jak szalony biega� do kopalni i ry� tam niczym kret.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//Ale od czasu pr�by zab�jstwa siedzi na �awce i wcale si� z niej nie rusza.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//To jasne! Aby wej�� do kopalni, musi mie� czerwony kamie� Estebana.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//Ale pewnie ju� nie �mie spojrze� mu prosto w oczy.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Lennar podejrzewa Emilia, poniewa� ten unika Estebana.");
};


instance DIA_ADDON_LENNAR_INSPEKTOR(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 3;
	condition = dia_addon_lennar_inspektor_condition;
	information = dia_addon_lennar_inspektor_info;
	permanent = FALSE;
	description = "Ale dlaczego Emilio �yczy�by �mierci Estebanowi?";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//Ale dlaczego Emilio �yczy�by �mierci Estebanowi?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//A sk�d mam to wiedzie�? Mo�e ma kole�k�, kt�ry chcia�by zaj�� miejsce Estebana?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//Tak, to mia�oby sens...
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
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//Rzeczywi�cie masz dla mnie czerwony kamie�.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Doskonale. Teraz rozkrusz� ten przekl�ty kamie� � wiem, jak si� do tego zabra�!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//I jeszcze jedno � je�li b�dziesz kopa�, pami�taj, �eby za mocno nie uderza�. Kilof mo�e zaklinowa� si� w z�ocie!
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
	description = "Nauczysz mnie wydobywa� z�oto?";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//Nauczysz mnie wydobywa� z�oto?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Jasne, ale wtedy b�dziesz go mie� wi�cej.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//W�a�nie o to chodzi.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Dobra, ale powiniene� odda� mi cz�� z�ota, kt�re wykopiesz.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//C�....
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//Najlepiej od razu oddaj mi moj� cz��. Potrzebuj�...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//Pi��dziesi�t sztuk z�ota.
};


var int lennar_teachgold;

instance DIA_ADDON_LENNAR_TRAIN(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 6;
	condition = dia_addon_lennar_train_condition;
	information = dia_addon_lennar_train_info;
	permanent = TRUE;
	description = "Naucz mnie, jak wydobywa� z�oto! (50 sztuk z�ota)";
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
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Naucz mnie, jak wydobywa� z�oto!
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//No dobra. Trzeba uderza� spokojnie i jednostajnie. Nie spiesz si� � ale uwa�aj, �eby nie zasn�� przy pracy.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//Nie wal ci�gle w jedno miejsce � spr�buj wyci�� �adny z�oty samorodek.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Post�puj zgodnie z moimi wskaz�wkami, a zostaniesz prawdziwym mistrzem w�r�d kopaczy.
		b_upgrade_hero_hackchance(10);
		LENNAR_TEACHGOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//Najpierw chc� zobaczy� moj� cz��.
	};
};


instance DIA_ADDON_LENNAR_HACKER(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 9;
	condition = dia_addon_lennar_hacker_condition;
	information = dia_addon_lennar_hacker_info;
	permanent = TRUE;
	description = "Wszystko w porz�dku?";
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
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Wszystko w porz�dku?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Ca�y czas jednym rytmem � dzi�ki temu b�dziesz mie� same du�e samorodki!
};

