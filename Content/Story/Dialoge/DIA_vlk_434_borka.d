
instance DIA_BORKA_EXIT(C_INFO)
{
	npc = vlk_434_borka;
	nr = 999;
	condition = dia_borka_exit_condition;
	information = dia_borka_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_borka_exit_condition()
{
	return TRUE;
};

func void dia_borka_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_PICKPOCKET(C_INFO)
{
	npc = vlk_434_borka;
	nr = 900;
	condition = dia_borka_pickpocket_condition;
	information = dia_borka_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_borka_pickpocket_condition()
{
	return c_beklauen(80,120);
};

func void dia_borka_pickpocket_info()
{
	Info_ClearChoices(dia_borka_pickpocket);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_BACK,dia_borka_pickpocket_back);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_PICKPOCKET,dia_borka_pickpocket_doit);
};

func void dia_borka_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_borka_pickpocket);
};

func void dia_borka_pickpocket_back()
{
	Info_ClearChoices(dia_borka_pickpocket);
};


instance DIA_BORKA_PISSOFF(C_INFO)
{
	npc = vlk_434_borka;
	condition = dia_borka_pissoff_condition;
	information = dia_borka_pissoff_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_borka_pissoff_condition()
{
	if((KNOWS_BORKA_DEALER != TRUE) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return TRUE;
	};
};

func void dia_borka_pissoff_info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//Ej, ty! Gdzie idziesz? Niewa�ne, co zamierzasz - zd��ysz zrobi� to p�niej.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//Stoisz przed klejnotem Khorinis - CZERWON� LATARNI�. To najcudowniejszy zamtuz w ca�ej Myrtanie, do diaska!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//Zawijaj� tu �eglarze z najdalszych kra�c�w �wiata, tylko po to, �eby sp�dzi� kilka nocy pod Czerwon� Latarni�.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//A teraz ty masz okazj� - nie, zaszczyt - sp�dzi� noc z Nadi�, najbardziej nami�tnym kwiatem stworzonym przez bog�w!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//Wejd�, a zaznasz czego�, o czym inni nawet nie �nili!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_TROUBLE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_trouble_condition;
	information = dia_borka_trouble_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_trouble_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ANDRE_REDLIGHT != LOG_RUNNING) && (Npc_IsDead(nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void dia_borka_trouble_info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//Dlaczego tam tak stoisz? Wejd� i spotkaj si� z nasz� nami�tn� Nadi�.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//Ta rozpalona kr�lowa nocy nada nowe znaczenie twojemu �yciu!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_SMOKE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_smoke_condition;
	information = dia_borka_smoke_info;
	permanent = TRUE;
	description = "Nie wiesz, gdzie m�g�bym kupi� troch� ziela?";
};


func int dia_borka_smoke_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_smoke_info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//Nie wiesz, gdzie m�g�bym kupi� troch� ziela?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//Nie. Zje�d�aj!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_BUYHERB(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_buyherb_condition;
	information = dia_borka_buyherb_info;
	permanent = TRUE;
	description = "S�ysza�em, �e sprzedajesz ziele.";
};


func int dia_borka_buyherb_condition()
{
	if((KNOWS_BORKA_DEALER == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (BORKA_DEAL == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//S�ysza�em, �e sprzedajesz ziele.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//Przepraszam, panie Stra�niku. To jaka� pomy�ka. Ja nic nie wiem o zielu.
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//Kto tak powiedzia�?
		Info_ClearChoices(dia_borka_buyherb);
		Info_AddChoice(dia_borka_buyherb,"To nieistotne.",dia_borka_buyherb_egal);
		Info_AddChoice(dia_borka_buyherb,"Tak m�wi Nadja.",dia_borka_buyherb_nadja);
	};
};

func void dia_borka_buyherb_egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//To nieistotne.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//Chc� si� po prostu upewni�, kto ci� przys�a�.
	Info_ClearChoices(dia_borka_buyherb);
	Info_AddChoice(dia_borka_buyherb,"Tak m�wi Nadja.",dia_borka_buyherb_nadja);
	Info_AddChoice(dia_borka_buyherb,"No to chcesz dobi� targu, czy nie?",dia_borka_buyherb_deal);
};

func void dia_borka_buyherb_nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//Tak m�wi Nadja.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//No prosz�, ma�y ptaszek za�piewa�. Wiesz co, nie powiniene� wierzy� we wszystko, co ta dziewka wygaduje.
	NADJA_VICTIM = TRUE;
	UNDERCOVER_FAILED = TRUE;
	Info_ClearChoices(dia_borka_buyherb);
};

func void dia_borka_buyherb_deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//No to chcesz dobi� targu, czy nie?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//...w porz�dku... dogadajmy si�. Ty dajesz mi 50 sztuk z�ota, wtedy ja ci daj� ziele. Bez targowania si�.
	Info_ClearChoices(dia_borka_buyherb);
	BORKA_DEAL = TRUE;
};


instance DIA_BORKA_SECOND_CHANCE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_second_chance_condition;
	information = dia_borka_second_chance_info;
	permanent = TRUE;
	description = "Dogadajmy si� (zap�a� 50 sztuk z�ota).";
};


func int dia_borka_second_chance_condition()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((BORKA_DEAL == TRUE) && (Npc_HasItems(other,itmi_gold) >= 50) && (Hlp_IsItem(heroarmor,itar_mil_l) == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_second_chance_info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//Dobijmy targu. Tu mam z�oto.
	b_giveinvitems(hero,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//W porz�dku...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//...oto �wie�a soczysta �odyga ziela.
	b_giveinvitems(self,hero,itmi_joint,1);
	BORKA_DEAL = 2;
	AI_StopProcessInfos(self);
};

