
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_ADDON_GAAN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 1;
	condition = dia_addon_gaan_meetingisrunning_condition;
	information = dia_addon_gaan_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_gaan_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_gaan_meetingisrunning_one_time;

func void dia_addon_gaan_meetingisrunning_info()
{
	if(DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Ach! Nowy przybysz. Witaj w Wodnym Kr�gu.
		DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras pragnie si� z tob� widzie�. Spotkaj si� z nim jak najszybciej.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "Masz tu sporo przestrzeni.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//Masz tu sporo przestrzeni.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//To prawda, �adnie tu. Ale gdyby� zobaczy�, co jest po drugiej stronie prze��czy, pewnie przesta�by� tak my�le�.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Je�li ten widok robi na tobie wra�enie, to poczekaj, a� zobaczysz G�rnicz� Dolin�.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Kim jeste�?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Mam na imi� Gaan. Jestem my�liwym, pracuj� dla Bengara, miejscowego farmera.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Wi�kszo�� czasu sp�dzam na �wie�ym powietrzu, wyleguj�c si� na s�o�cu.
};


instance DIA_ADDON_GAAN_RANGER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_ranger_condition;
	information = dia_addon_gaan_ranger_info;
	description = "Sk�d ta powa�na mina?";
};


func int dia_addon_gaan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (SCISWEARINGRANGERRING == TRUE) && (RANGERMEETINGRUNNING == 0))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Sk�d ta powa�na mina?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Nosisz nasz pier�cie� z akwamarynem.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Nale�ysz do Wodnego Kr�gu?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Oczywi�cie. Dobrze widzie� w�r�d nas now� twarz.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GAAN_AUFGABEBEIMRING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_aufgabebeimring_condition;
	information = dia_addon_gaan_aufgabebeimring_info;
	description = "Czym si� zajmujesz w tym 'Kr�gu'?";
};


func int dia_addon_gaan_aufgabebeimring_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_gaan_ranger) || (RANGERMEETINGRUNNING != 0)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_aufgabebeimring_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//Czym si� zajmujesz w tym kr�gu?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Pilnuj� prze��czy. Mam uwa�a� na wszystkich, kt�rzy przez ni� przechodz�.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Od kiedy paladyni zamkn�li bram� prze��czy, ma�o kto ni� chodzi.
};


instance DIA_ADDON_GAAN_MISSINGPEOPLE(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_missingpeople_condition;
	information = dia_addon_gaan_missingpeople_info;
	description = "Wiesz mo�e co� o zaginionych?";
};


func int dia_addon_gaan_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_gaan_aufgabebeimring) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Wiesz mo�e co� o zaginionych?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Oczywi�cie. To w�a�nie dlatego wszyscy zachowujemy wzmo�on� czujno��.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Prawd� jednak m�wi�c, nie widzia�em tu nic podejrzanego.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "Co powinienem wiedzie� o G�rniczej Dolinie?";
};


func int dia_gaan_wald_condition()
{
	return TRUE;
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Co powinienem wiedzie� o G�rniczej Dolinie?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Sam nie wiem. Widzia�em j� jedynie z daleka, ale wygl�da�a do�� niebezpiecznie.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Je�li zechcesz si� tam uda�, pami�taj, aby trzyma� si� drogi.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Masz do wyboru drog� przez wielki jar albo przez kamienny most. Ta druga jest kr�tsza i bardziej bezpieczna.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Musisz by� ostro�ny, po okolicy kr�ci si� pe�no ork�w.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Nie chc�, �eby si� okaza�o, �e b�d� musia� zaci�gn�� ci� do zielarki.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "Zielarki?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Zielarki?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Nazywa si� Sagitta. Zajmuje si� uzdrawianiem farmer�w i ludzi spoza miasta portowego.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Zadziwiaj�ca kobieta.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Nikt nie lubi do niej chodzi�, za to wszyscy uwielbiaj� o niej plotkowa�.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Ale je�li zachorujesz, zapewniam ci�, �e nigdzie nie uzyskasz bardziej skutecznej pomocy ni� w pe�nej zi� kuchni Sagitty.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Znajdziesz j� w lesie rosn�cym za farm� Sekoba.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "Jak wygl�da to niebezpieczne zwierz�?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//Jak wygl�da to niebezpieczne zwierz�?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Nie wiem dok�adnie, nigdy go nie widzia�em. S�ysza�em tylko pochrz�kiwanie i g�o�ne sapanie. Ale widzia�em, do czego jest zdolne.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Zabija nawet wilki. Co wi�cej, jednemu z nich dos�ownie odgryz�o g�ow�.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "Ile mi zap�acisz, je�li zabij� dla ciebie t� besti�?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Ile mi zap�acisz, je�li zabij� dla ciebie t� besti�?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Je�li j� zabijesz, jestem got�w odda� ci wszystkie swoje oszcz�dno�ci.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Sk�d przychodzi to stworzenie?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Sk�d przychodzi to stworzenie?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Na pewno nie z lasu. Mo�e z G�rniczej Doliny. Nie jestem do ko�ca pewien.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Nigdy nie by�em w G�rniczej Dolinie.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if((Npc_IsDead(gaans_snapper) == TRUE) && (RANGERMEETINGRUNNING != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//Ta obrzydliwa bestia nie �yje.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//A wi�c znowu b�d� m�g� normalnie polowa�.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Prosz�, oto obiecane pieni�dze.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "Mo�esz mnie nauczy� czego� o polowaniu?";
};


func int dia_gaan_askteacher_condition()
{
	return TRUE;
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Mo�esz mnie nauczy� czego� o polowaniu?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Nie ma problemu. Za 100 monet mog� ci pokaza�, jak si� patroszy upolowane zwierz�ta.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Za futra i inne trofea mo�na dosta� naprawd� sporo pieni�dzy.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Gaan mo�e mnie nauczy�, jak sporz�dza� trofea.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Prosz� - oto 100 sztuk z�ota. Opowiedz mi o oprawianiu zwierz�t.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Zap�ac� ci 100 sztuk z�ota, je�li powiesz mi, jak si� oprawia zwierz�ta.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//No, to mi si� podoba.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Przyjd� p�niej, kiedy ju� b�dziesz mia� czym zap�aci�.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "Czego mo�esz mnie nauczy�?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Czego mo�esz mnie nauczy�?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//To zale�y od tego, czego ty chcia�by� si� nauczy�.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Usu� k�y",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Usu� pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Obedrzyj ze sk�ry",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("��d�o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Skrzyd�a krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("R�g smoczego z�bacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Niestety, nie mog� ci powiedzie� nic, czego by� ju� nie wiedzia�.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Zwierz�ta nie lubi� by� pozbawiane pazur�w. Musisz wykona� bardzo precyzyjne ci�cie.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Skrzy�uj lekko r�ce, a potem silnie pchnij.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Handlarze bardzo lubi�, je�li kto� p�aci im pazurami.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Naj�atwiej jest pozbawi� zwierz� z�b�w. Natnij no�em dzi�s�o dooko�a z�ba.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Potem musisz ju� tylko uderzy� w z�b - i po wszystkim.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Obdzieranie ze sk�ry najlepiej jest zacz�� od wykonania g��bokiego naci�cia dooko�a tylnych ko�czyn.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//Je�li zrobisz to w�a�ciwie, zdarcie sk�ry to ju� drobnostka.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//Na tylnej stronie odw�oku tej muchy znajduje si� mi�kki punkt.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Je�li na niego naci�niesz, wysunie si� ��d�o, kt�re b�dziesz m�g� odci�� no�em.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Najlepszym sposobem na usuni�cie skrzyde� krwiopijcy jest odci�cie ich ostrym no�em tu� przy samym ciele.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Musisz uwa�a�, skrzyd�a s� bardzo delikatne. Je�li naruszysz ich delikatn� pow�ok�, stan� si� bezwarto�ciowe.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Na przyk�adzie tego nieco przero�ni�tego z�bacza poka�� ci, jak usuwa si� rogi.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//Najpierw musisz wbi� n� jak najg��biej w sam �rodek czo�a, a nast�pnie ostro�nie podwa�y� r�g.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//Je�li nie mo�esz oddzieli� go od czaszki, b�dziesz sobie musia� pom�c drugim no�em.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "Jak idzie polowanie?";
};


func int dia_gaan_jagd_condition()
{
	return TRUE;
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//Jak idzie polowanie?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if(Npc_IsDead(gaans_snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Ostatnie zwierz�, kt�re upolowa�em, to by� olbrzymi szczur. Niezbyt cenna zdobycz.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Par� dni temu w okolicy pojawi�a si� jaka� bestia.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Zabija wszystko, co si� rusza. A ja trac� przez ni� zarobek.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"Jaka� dziwna bestia sprawia problemy my�liwemu Gaanowi. Dop�ki potw�r tu grasuje, Gaan nie b�dzie m�g� normalnie polowa�.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Jest coraz gorzej. Od tego czasu od strony prze��czy nadci�gn�y ca�e tuziny tych istot.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Trudno co� upolowa� w tych warunkach.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//Nie narzekam.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

