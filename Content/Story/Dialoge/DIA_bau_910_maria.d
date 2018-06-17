
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
	description = "Kim jesteœ?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//Mam na imiê Maria i jestem ¿on¹ Onara.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//Czego tu szukasz?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "Chcia³em siê po prostu rozejrzeæ...";
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
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//Chcia³em siê po prostu rozejrzeæ...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//Odk¹d znaleŸli siê tutaj ci wszyscy mê¿czyŸni, w domu nie mo¿na mieæ ani chwili spokoju.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//Wszêdzie jest ich pe³no.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Czy obecnoœæ najemników jest dla ciebie k³opotliwa?";
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
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Czy obecnoœæ najemników jest dla ciebie k³opotliwa?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Hm, zapomnij o tym, co przed chwil¹ powiedzia³am. W koñcu chodzi przecie¿ o nasze bezpieczeñstwo.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Przynajmniej dopóki tu s¹, nie musimy siê obawiaæ o w³asne ¿ycie.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Zanim ich tu sprowadziliœmy, ci¹gle mieliœmy na g³owie stra¿. Tylko ¿e zamiast nas chroniæ, pl¹drowali nasz¹ spi¿arniê.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//Zabrali nam wiêkszoœæ tegorocznych zbiorów i kilka owiec. Nie zrobili nic, ¿eby nam siê odwdziêczyæ.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//Kilku z tych ³otrów posunê³o siê nawet do kradzie¿y.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Nie zrozum mnie Ÿle, ¿o³nierzu. Wiem, s¹ wœród was równie¿ uczciwe osoby.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "A mo¿na wiedzieæ, co ci ukradli?";
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
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//A mo¿na wiedzieæ, co ci ukradli?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//Przede wszystkim z³oto i srebro. Zabrali te¿ mój prezent œlubny, z³oty talerz.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//Za³o¿ê siê, ¿e teraz le¿y zakurzony w kufrze jakiegoœ stra¿nika.
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
	description = "Mam przy sobie z³oty talerz. Czy to twoja w³asnoœæ?";
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
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//Mam przy sobie z³oty talerz. Czy to twoja w³asnoœæ?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Tak! To on! Stokrotne dziêki!
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
	description = "A jak bêdzie z moj¹ nagrod¹?";
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
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//A jak bêdzie z moj¹ nagrod¹?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//Jesteœ najemnikiem na s³u¿bie u mojego mê¿a, prawda?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Zgadza siê.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//Ile ci p³aci mój m¹¿?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//To za ma³o. IdŸ do niego i poproœ o podwy¿kê.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//S¹dzisz, ¿e na to przystanie?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//Wierz mi, wie, co go czeka, jeœli siê nie zgodzi.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Czy chcesz siê zatrudniæ na naszej farmie jako najemnik?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"Nie, nie bardzo.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Tak.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Proszê, weŸ to. Zas³u¿y³eœ sobie.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//Nie, nie bardzo.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Wiêc przyjmij w nagrodê to z³oto. Zas³u¿y³eœ na nie.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Tak.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//Dobrze, jeœli zatrudnisz siê u nas jako najemnik, dopilnujê, abyœ dosta³ godziw¹ zap³atê.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Wróæ tutaj, kiedy ju¿ uzgodnisz z moim mê¿em kwestiê wynagrodzenia.
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
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//To dobry cz³owiek. Trochê zrzêdliwy i strasznie niecierpliwy, ale w koñcu ka¿dy ma jakieœ wady.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//Kiedyœ powiedzia³am mê¿owi: czemu pozwalasz ¿o³nierzom z miasta tak siê traktowaæ?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//Zrób coœ! Tak w³aœnie powiedzia³am.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//Postanowiliœmy zatrudniæ najemników. Teraz czujê siê tutaj jak na wojnie.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//Ale w koñcu to JEST wojna, czy¿ nie?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Czy ostatnio zdarzy³o siê tu coœ interesuj¹cego?";
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
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Czy ostatnio zdarzy³o siê tu coœ interesuj¹cego?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//Przechodzi³a têdy grupa paladynów.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//Najpierw s¹dziliœmy, ¿e bêd¹ chcieli zaatakowaæ farmê, ale okaza³o siê, ¿e zmierzali do Górniczej Doliny.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Kilka nocy temu Wasili wyp³oszy³ z³odzieja. Poza tym nie dzia³o siê tutaj nic godnego uwagi.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//Odk¹d najemnicy opuœcili nasz dom, zrobi³o siê tutaj znacznie ciszej.
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

