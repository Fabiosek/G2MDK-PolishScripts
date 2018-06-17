
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = "(Kradzie� tego klucza b�dzie do�� �atwa)";
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "Hej, co s�ycha�?";
};


func int dia_rangar_hallo_condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Hej, co s�ycha�?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//P�ki paladyni nie maj� dla mnie �adnych zada�, mog� si� spokojnie odpr�y� i wypi� kilka piwek. Czeg� wi�cej mo�na pragn��.
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracujesz dla paladyn�w?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Taaa, donosz� im o sytuacji w mie�cie. W tej chwili jest wyj�tkowo spokojnie.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "Jak si� maj� sprawy z orkami?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak si� maj� sprawy z orkami?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Nie ma si� czym martwi� - paladyni i my, stra�nicy miejscy, panujemy nad wszystkim.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Id� lepiej do domu i pozw�l nam w spokoju wype�nia� nasze obowi�zki. Strze�emy miasta i jego obywateli.
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "Mo�e jeszcze jedno piwko?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Mo�e jeszcze jedno piwko?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ach - nie ma nic lepszego ni� ch�odny porter.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Zdaje si�, �e chcia�e� powiedzie� co� o orkach.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Och tak, tak, prawda. Orkowie nie stanowi� �adnego zagro�enia dla miasta.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Utkn�li w G�rniczej Dolinie, a prze��cz jest obstawiona przez paladyn�w.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Nawet chrz�szcz si� nie przeci�nie.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Nigdy nie odmawiam piwa.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Podobno zauwa�ono za miastem orka.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Taa, jaaasne, wielki, niebezpieczny ork. Prawdziwe monstrum. Na pewno zaatakuje miasto.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Pos�uchaj no, nakopiemy mu do tego t�ustego, orkowego ty�ka, je�li tylko zbli�y si� do miasta. Rozumiesz?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Rozumiem.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Smakowite, zimne piwo... Absolutnie najlepsze.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Niecz�sto spotyka si� kogo�, kto stawia piwo. Jeste� w porz�dku.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasne, ch�tnie si� jeszcze napij�. Przynie� jedno.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RANGAR_ERWISCHT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 5;
	condition = dia_addon_rangar_erwischt_condition;
	information = dia_addon_rangar_erwischt_info;
	description = "Co ty tu robisz?";
};


var int dia_addon_rangar_erwischt_onetime;

func int dia_addon_rangar_erwischt_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_ADDON_RANGAR_ERWISCHT_ONETIME == FALSE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_erwischt_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Co ty tu robisz?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//Eee... Ja... Ten tego... To nie twoja sprawa! Wynocha.
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin ucieszy si�, jak mu powiem, kto grzeba� w jego rzeczach...
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//A r�b, co chcesz. Id� tam jeszcze raz.
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GOTRANGAR = TRUE;
};


instance DIA_ADDON_RANGAR_NACHHAKEN(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_addon_rangar_nachhaken_condition;
	information = dia_addon_rangar_nachhaken_info;
	permanent = TRUE;
	description = "I my�lisz, �e tak po prostu o tym zapomn�?";
};


func int dia_addon_rangar_nachhaken_condition()
{
	if((SC_GOTRANGAR == TRUE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_nachhaken_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//I my�lisz, �e tak po prostu o tym zapomn�?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//I co si� tak rzucasz? To tylko kilka drobnostek.
};

