
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "Kim jeste�?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Mam na imi� Maria i jestem �on� Onara.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Czego tu szukasz?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "Chcia�em si� po prostu rozejrze�...";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Chcia�em si� po prostu rozejrze�...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//Odk�d znale�li si� tutaj ci wszyscy m�czy�ni, w domu nie mo�na mie� ani chwili spokoju.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Wsz�dzie jest ich pe�no.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Czy obecno�� najemnik�w jest dla ciebie k�opotliwa?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Czy obecno�� najemnik�w jest dla ciebie k�opotliwa?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Hm, zapomnij o tym, co przed chwil� powiedzia�am. W ko�cu chodzi przecie� o nasze bezpiecze�stwo.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Przynajmniej dop�ki tu s�, nie musimy si� obawia� o w�asne �ycie.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Zanim ich tu sprowadzili�my, ci�gle mieli�my na g�owie stra�. Tylko �e zamiast nas chroni�, pl�drowali nasz� spi�arni�.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Zabrali nam wi�kszo�� tegorocznych zbior�w i kilka owiec. Nie zrobili nic, �eby nam si� odwdzi�czy�.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Kilku z tych �otr�w posun�o si� nawet do kradzie�y.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Nie zrozum mnie �le, �o�nierzu. Wiem, s� w�r�d was r�wnie� uczciwe osoby.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "A mo�na wiedzie�, co ci ukradli?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//A mo�na wiedzie�, co ci ukradli?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//Przede wszystkim z�oto i srebro. Zabrali te� m�j prezent �lubny, z�oty talerz.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Za�o�� si�, �e teraz le�y zakurzony w kufrze jakiego� stra�nika.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "Mam przy sobie z�oty talerz. Czy to twoja w�asno��?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Mam przy sobie z�oty talerz. Czy to twoja w�asno��?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Tak! To on! Stokrotne dzi�ki!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "A jak b�dzie z moj� nagrod�?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//A jak b�dzie z moj� nagrod�?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Jeste� najemnikiem na s�u�bie u mojego m�a, prawda?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Zgadza si�.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Ile ci p�aci m�j m��?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//To za ma�o. Id� do niego i popro� o podwy�k�.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//S�dzisz, �e na to przystanie?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Wierz mi, wie, co go czeka, je�li si� nie zgodzi.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Czy chcesz si� zatrudni� na naszej farmie jako najemnik?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"Nie, nie bardzo.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Tak.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Prosz�, we� to. Zas�u�y�e� sobie.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Nie, nie bardzo.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Wi�c przyjmij w nagrod� to z�oto. Zas�u�y�e� na nie.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Tak.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Dobrze, je�li zatrudnisz si� u nas jako najemnik, dopilnuj�, aby� dosta� godziw� zap�at�.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Wr�� tutaj, kiedy ju� uzgodnisz z moim m�em kwesti� wynagrodzenia.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "Opowiedz mi o Onarze.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Opowiedz mi o Onarze.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//To dobry cz�owiek. Troch� zrz�dliwy i strasznie niecierpliwy, ale w ko�cu ka�dy ma jakie� wady.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Kiedy� powiedzia�am m�owi: czemu pozwalasz �o�nierzom z miasta tak si� traktowa�?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//Zr�b co�! Tak w�a�nie powiedzia�am.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//Postanowili�my zatrudni� najemnik�w. Teraz czuj� si� tutaj jak na wojnie.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Ale w ko�cu to JEST wojna, czy� nie?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Czy ostatnio zdarzy�o si� tu co� interesuj�cego?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Czy ostatnio zdarzy�o si� tu co� interesuj�cego?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Przechodzi�a t�dy grupa paladyn�w.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Najpierw s�dzili�my, �e b�d� chcieli zaatakowa� farm�, ale okaza�o si�, �e zmierzali do G�rniczej Doliny.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Kilka nocy temu Wasili wyp�oszy� z�odzieja. Poza tym nie dzia�o si� tutaj nic godnego uwagi.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//Odk�d najemnicy opu�cili nasz dom, zrobi�o si� tutaj znacznie ciszej.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

