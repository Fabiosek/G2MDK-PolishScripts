
instance DIA_FESTER_EXIT(C_INFO)
{
	npc = sld_816_fester;
	nr = 999;
	condition = dia_fester_exit_condition;
	information = dia_fester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fester_exit_condition()
{
	return TRUE;
};

func void dia_fester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_HELLO(C_INFO)
{
	npc = sld_816_fester;
	nr = 1;
	condition = dia_fester_hello_condition;
	information = dia_fester_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_fester_hello_condition()
{
	return TRUE;
};

func void dia_fester_hello_info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//Co tutaj robisz?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//Przygotowuj� si� do bitwy...
};


instance DIA_FESTER_AUFTRAG(C_INFO)
{
	npc = sld_816_fester;
	nr = 2;
	condition = dia_fester_auftrag_condition;
	information = dia_fester_auftrag_info;
	permanent = FALSE;
	description = "Dlaczego?";
};


func int dia_fester_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_hello))
	{
		return TRUE;
	};
};

func void dia_fester_auftrag_info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Dlaczego?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Ostatnimi czasy ch�opi mieli coraz wi�ksze problemy z polnymi bestiami.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//Niekt�rzy z nich zostali nawet po�arci.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//Onar nie uzna� tego za zabawne. Nie zap�aci� �adnemu z nas przez ca�y tydzie�.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//Do pewnego stopnia by�a to moja wina. Teraz Lee chce, �ebym zniszczy� gniazdo tych stworze�.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//Inni ju� porobili zak�ady, czy uda mi si� prze�y�...
};


instance DIA_FESTER_YOUFIGHT(C_INFO)
{
	npc = sld_816_fester;
	nr = 3;
	condition = dia_fester_youfight_condition;
	information = dia_fester_youfight_info;
	permanent = FALSE;
	description = "Dobry z ciebie wojownik?";
};


func int dia_fester_youfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_hello) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_youfight_info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Dobry z ciebie wojownik?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//Nie�le sobie radz� z mieczem, ale najlepszy jestem w �ucznictwie! A dlaczego pytasz?
};


instance DIA_FESTER_WONEST(C_INFO)
{
	npc = sld_816_fester;
	nr = 4;
	condition = dia_fester_wonest_condition;
	information = dia_fester_wonest_info;
	permanent = FALSE;
	description = "Gdzie jest gniazdo?";
};


func int dia_fester_wonest_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_auftrag) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_wonest_info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Gdzie jest gniazdo?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//Po�rodku tego pola, w du�ej skale.
};


var int fester_choice;
const int FC_GOLD = 0;
const int FC_JOIN = 1;

instance DIA_FESTER_TOGETHER(C_INFO)
{
	npc = sld_816_fester;
	nr = 5;
	condition = dia_fester_together_condition;
	information = dia_fester_together_info;
	permanent = FALSE;
	description = "Mogliby�my spr�bowa� razem...";
};


func int dia_fester_together_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_auftrag))
	{
		return TRUE;
	};
};

func void dia_fester_together_info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//Mogliby�my spr�bowa� razem...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//Chcesz mi pom�c? Ale dlaczego?
	Info_ClearChoices(dia_fester_together);
	Info_AddChoice(dia_fester_together,"Chc� zarobi�!",dia_fester_together_gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_fester_together,"Chc� si� do was przy��czy�!",dia_fester_together_join);
	};
};

func void dia_fester_together_join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//Chc� si� do was przy��czy�!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Ach, wi�c to tak... Chcesz pokaza�, jaki jeste� odwa�ny...
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//Dobrze, spr�bujmy pokona� bestie wsp�lnymi si�ami.
	FESTER_CHOICE = FC_JOIN;
	Info_ClearChoices(dia_fester_together);
};

func void dia_fester_together_gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//Chc� zarobi�!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//Ty draniu! Zawsze wykorzystujesz okazj�, co?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//Albo ci zap�ac�, albo mnie ukatrupisz.
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//Dobrze, mog� ci obieca� 50 sztuk z�ota. To wszystko, co mam.
	FESTER_CHOICE = FC_GOLD;
	Info_ClearChoices(dia_fester_together);
};


var int fester_losgeh_day;

instance DIA_FESTER_TOGETHERNOW(C_INFO)
{
	npc = sld_816_fester;
	nr = 6;
	condition = dia_fester_togethernow_condition;
	information = dia_fester_togethernow_info;
	permanent = TRUE;
	description = "Zaatakujmy gniazdo!";
};


func int dia_fester_togethernow_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_together) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_togethernow_info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Zaatakujmy gniazdo!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//Po ciemku? Nie, nie, lepiej zrobi� to w dzie�.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Teraz? Czy potrzebujesz si� wcze�niej przygotowa�?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//M�g�by� najpierw wr�ci� na farm�...
		Info_ClearChoices(dia_fester_togethernow);
		Info_AddChoice(dia_fester_togethernow,"Dobrze, zaczekajmy jeszcze troch�...",dia_fester_togethernow_later);
		Info_AddChoice(dia_fester_togethernow,"Teraz jest odpowiedni moment.",dia_fester_togethernow_now);
	};
};

func void dia_fester_togethernow_now()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//Teraz jest odpowiedni moment.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//No dobrze, zobaczmy, co my tu mamy.
	Npc_ExchangeRoutine(self,"GUIDE");
	FESTER_LOSGEH_DAY = b_getdayplus();
	MIS_FESTER_KILLBUGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FESTERRAUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FESTERRAUBER,LOG_RUNNING);
	b_logentry(TOPIC_FESTERRAUBER,"Zamierzam wraz z Festerem zaatakowa� gniazdo polnych bestii.");
	Info_ClearChoices(dia_fester_togethernow);
	AI_StopProcessInfos(self);
};

func void dia_fester_togethernow_later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//Dobrze, zaczekajmy jeszcze troch�...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//Wiesz, gdzie mnie szuka�...
	Info_ClearChoices(dia_fester_togethernow);
};


instance DIA_FESTER_INCAVE(C_INFO)
{
	npc = sld_816_fester;
	nr = 7;
	condition = dia_fester_incave_condition;
	information = dia_fester_incave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fester_incave_condition()
{
	if((MIS_FESTER_KILLBUGS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
		return TRUE;
	};
};

func void dia_fester_incave_info()
{
	if(Wld_GetDay() > FESTER_LOSGEH_DAY)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Gdzie do diab�a si� podziewa�e�?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//A wi�c to tutaj sko�czyli martwi wie�niacy. To obrzydliwe.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//Te obrzydliwe stworzenia powinny znikn�� z powierzchni ziemi.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Wracajmy!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_WASMITABMACHUNG(C_INFO)
{
	npc = sld_816_fester;
	nr = 8;
	condition = dia_fester_wasmitabmachung_condition;
	information = dia_fester_wasmitabmachung_info;
	permanent = FALSE;
	description = "Wracajmy!";
};


func int dia_fester_wasmitabmachung_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_incave))
	{
		return TRUE;
	};
};

func void dia_fester_wasmitabmachung_info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//Wracajmy!
	if(FESTERS_GIANT_BUG_KILLED == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//�artujesz? W og�le mi nie pomog�e�.
	}
	else if(FESTER_CHOICE == FC_JOIN)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//Hmmm, m�g�bym ci pom�c w dostaniu si� do naszej grupy, ale tego nie zrobi�.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//Dlaczego??
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//Je�li powiem komukolwiek, �e mi pomog�e�, obarcz� mnie nowym zadaniem.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//Rozumiesz, �e to nie jest tylko m�j kaprys, prawda?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//Przykro mi ch�opcze, z pewno�ci� znajdziesz kogo� innego, kto ci pomo�e.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Chcia�e� wykorzysta� sytuacj�, w jakiej si� znalaz�em. Jak widzisz, by�em w tym lepszy!
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//Ale sp�jrz na to z innej strony, przynajmniej zdoby�e� nieco do�wiadczenia. Zawsze to co�, prawda?
	};
	MIS_FESTER_KILLBUGS = LOG_OBSOLETE;
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int fester_duell_day;
var int fester_fightverarscht;
var int fester_fightsylvio;

instance DIA_FESTER_PERMPRUEGEL(C_INFO)
{
	npc = sld_816_fester;
	nr = 9;
	condition = dia_fester_permpruegel_condition;
	information = dia_fester_permpruegel_info;
	permanent = TRUE;
	description = "Trzeba ci b�dzie znowu przetrzepa� sk�r�.";
};


func int dia_fester_permpruegel_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) || Npc_KnowsInfo(other,dia_jarvis_missionko) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_fester_permpruegel_info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//Trzeba ci b�dzie znowu przetrzepa� sk�r�.
	if(FESTER_DUELL_DAY < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,itmi_gold,random);
		FESTER_DUELL_DAY = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) && (FESTER_FIGHTVERARSCHT == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//Nie lubi�, jak kto� ze mnie �artuje.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//Trz�s� si�, trz�s�...
		FESTER_FIGHTVERARSCHT = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//Zbratanie si� z Sylviem nie by�o dobrym pomys�em.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//Jeste� jednym z przydupas�w Lee, prawda? Przyszed�e� do niew�a�ciwej osoby!
		FESTER_FIGHTSYLVIO = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//Czego u diab�a znowu ode mnie chcesz?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//Uwielbiam patrze�, jak tarzasz si� w b�ocie!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//Chyba masz k�opot ze s�uchem?
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_FESTER_PICKPOCKET(C_INFO)
{
	npc = sld_816_fester;
	nr = 900;
	condition = dia_fester_pickpocket_condition;
	information = dia_fester_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fester_pickpocket_condition()
{
	return c_beklauen(27,45);
};

func void dia_fester_pickpocket_info()
{
	Info_ClearChoices(dia_fester_pickpocket);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_BACK,dia_fester_pickpocket_back);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_PICKPOCKET,dia_fester_pickpocket_doit);
};

func void dia_fester_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fester_pickpocket);
};

func void dia_fester_pickpocket_back()
{
	Info_ClearChoices(dia_fester_pickpocket);
};

