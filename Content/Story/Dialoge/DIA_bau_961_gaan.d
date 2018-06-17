
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
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//Ach! Nowy przybysz. Witaj w Wodnym Krêgu.
		DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras pragnie siê z tob¹ widzieæ. Spotkaj siê z nim jak najszybciej.
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
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//To prawda, ³adnie tu. Ale gdybyœ zobaczy³, co jest po drugiej stronie prze³êczy, pewnie przesta³byœ tak myœleæ.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//Jeœli ten widok robi na tobie wra¿enie, to poczekaj, a¿ zobaczysz Górnicz¹ Dolinê.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Kim jesteœ?";
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
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//Mam na imiê Gaan. Jestem myœliwym, pracujê dla Bengara, miejscowego farmera.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//Wiêkszoœæ czasu spêdzam na œwie¿ym powietrzu, wyleguj¹c siê na s³oñcu.
};


instance DIA_ADDON_GAAN_RANGER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_ranger_condition;
	information = dia_addon_gaan_ranger_info;
	description = "Sk¹d ta powa¿na mina?";
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
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Sk¹d ta powa¿na mina?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//Nosisz nasz pierœcieñ z akwamarynem.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//Nale¿ysz do Wodnego Krêgu?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//Oczywiœcie. Dobrze widzieæ wœród nas now¹ twarz.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GAAN_AUFGABEBEIMRING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_aufgabebeimring_condition;
	information = dia_addon_gaan_aufgabebeimring_info;
	description = "Czym siê zajmujesz w tym 'Krêgu'?";
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
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//Czym siê zajmujesz w tym krêgu?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//Pilnujê prze³êczy. Mam uwa¿aæ na wszystkich, którzy przez ni¹ przechodz¹.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Od kiedy paladyni zamknêli bramê prze³êczy, ma³o kto ni¹ chodzi.
};


instance DIA_ADDON_GAAN_MISSINGPEOPLE(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_missingpeople_condition;
	information = dia_addon_gaan_missingpeople_info;
	description = "Wiesz mo¿e coœ o zaginionych?";
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
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Wiesz mo¿e coœ o zaginionych?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Oczywiœcie. To w³aœnie dlatego wszyscy zachowujemy wzmo¿on¹ czujnoœæ.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//Prawdê jednak mówi¹c, nie widzia³em tu nic podejrzanego.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "Co powinienem wiedzieæ o Górniczej Dolinie?";
};


func int dia_gaan_wald_condition()
{
	return TRUE;
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//Co powinienem wiedzieæ o Górniczej Dolinie?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//Sam nie wiem. Widzia³em j¹ jedynie z daleka, ale wygl¹da³a doœæ niebezpiecznie.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//Jeœli zechcesz siê tam udaæ, pamiêtaj, aby trzymaæ siê drogi.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Masz do wyboru drogê przez wielki jar albo przez kamienny most. Ta druga jest krótsza i bardziej bezpieczna.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Musisz byæ ostro¿ny, po okolicy krêci siê pe³no orków.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//Nie chcê, ¿eby siê okaza³o, ¿e bêdê musia³ zaci¹gn¹æ ciê do zielarki.
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
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Nazywa siê Sagitta. Zajmuje siê uzdrawianiem farmerów i ludzi spoza miasta portowego.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//Zadziwiaj¹ca kobieta.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//Nikt nie lubi do niej chodziæ, za to wszyscy uwielbiaj¹ o niej plotkowaæ.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//Ale jeœli zachorujesz, zapewniam ciê, ¿e nigdzie nie uzyskasz bardziej skutecznej pomocy ni¿ w pe³nej zió³ kuchni Sagitty.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//Znajdziesz j¹ w lesie rosn¹cym za farm¹ Sekoba.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "Jak wygl¹da to niebezpieczne zwierzê?";
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
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//Jak wygl¹da to niebezpieczne zwierzê?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//Nie wiem dok³adnie, nigdy go nie widzia³em. S³ysza³em tylko pochrz¹kiwanie i g³oœne sapanie. Ale widzia³em, do czego jest zdolne.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Zabija nawet wilki. Co wiêcej, jednemu z nich dos³ownie odgryz³o g³owê.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "Ile mi zap³acisz, jeœli zabijê dla ciebie tê bestiê?";
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
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//Ile mi zap³acisz, jeœli zabijê dla ciebie tê bestiê?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//Jeœli j¹ zabijesz, jestem gotów oddaæ ci wszystkie swoje oszczêdnoœci.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Sk¹d przychodzi to stworzenie?";
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
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Sk¹d przychodzi to stworzenie?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Na pewno nie z lasu. Mo¿e z Górniczej Doliny. Nie jestem do koñca pewien.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//Nigdy nie by³em w Górniczej Dolinie.
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
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//Ta obrzydliwa bestia nie ¿yje.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//A wiêc znowu bêdê móg³ normalnie polowaæ.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Proszê, oto obiecane pieni¹dze.
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
	description = "Mo¿esz mnie nauczyæ czegoœ o polowaniu?";
};


func int dia_gaan_askteacher_condition()
{
	return TRUE;
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Mo¿esz mnie nauczyæ czegoœ o polowaniu?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//Nie ma problemu. Za 100 monet mogê ci pokazaæ, jak siê patroszy upolowane zwierzêta.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Za futra i inne trofea mo¿na dostaæ naprawdê sporo pieniêdzy.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Gaan mo¿e mnie nauczyæ, jak sporz¹dzaæ trofea.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Proszê - oto 100 sztuk z³ota. Opowiedz mi o oprawianiu zwierz¹t.";
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
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Zap³acê ci 100 sztuk z³ota, jeœli powiesz mi, jak siê oprawia zwierzêta.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//No, to mi siê podoba.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//PrzyjdŸ póŸniej, kiedy ju¿ bêdziesz mia³ czym zap³aciæ.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "Czego mo¿esz mnie nauczyæ?";
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
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//Czego mo¿esz mnie nauczyæ?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//To zale¿y od tego, czego ty chcia³byœ siê nauczyæ.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Usuñ k³y",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Usuñ pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Obedrzyj ze skóry",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("¯¹d³o krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Skrzyd³a krwiopijcy",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Róg smoczego zêbacza",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//Niestety, nie mogê ci powiedzieæ nic, czego byœ ju¿ nie wiedzia³.
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
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Zwierzêta nie lubi¹ byæ pozbawiane pazurów. Musisz wykonaæ bardzo precyzyjne ciêcie.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Skrzy¿uj lekko rêce, a potem silnie pchnij.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Handlarze bardzo lubi¹, jeœli ktoœ p³aci im pazurami.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//Naj³atwiej jest pozbawiæ zwierzê zêbów. Natnij no¿em dzi¹s³o dooko³a zêba.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Potem musisz ju¿ tylko uderzyæ w z¹b - i po wszystkim.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//Obdzieranie ze skóry najlepiej jest zacz¹æ od wykonania g³êbokiego naciêcia dooko³a tylnych koñczyn.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//Jeœli zrobisz to w³aœciwie, zdarcie skóry to ju¿ drobnostka.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//Na tylnej stronie odw³oku tej muchy znajduje siê miêkki punkt.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//Jeœli na niego naciœniesz, wysunie siê ¿¹d³o, które bêdziesz móg³ odci¹æ no¿em.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//Najlepszym sposobem na usuniêcie skrzyde³ krwiopijcy jest odciêcie ich ostrym no¿em tu¿ przy samym ciele.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//Musisz uwa¿aæ, skrzyd³a s¹ bardzo delikatne. Jeœli naruszysz ich delikatn¹ pow³okê, stan¹ siê bezwartoœciowe.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Na przyk³adzie tego nieco przeroœniêtego zêbacza poka¿ê ci, jak usuwa siê rogi.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//Najpierw musisz wbiæ nó¿ jak najg³êbiej w sam œrodek czo³a, a nastêpnie ostro¿nie podwa¿yæ róg.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//Jeœli nie mo¿esz oddzieliæ go od czaszki, bêdziesz sobie musia³ pomóc drugim no¿em.
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
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//Ostatnie zwierzê, które upolowa³em, to by³ olbrzymi szczur. Niezbyt cenna zdobycz.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//Parê dni temu w okolicy pojawi³a siê jakaœ bestia.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//Zabija wszystko, co siê rusza. A ja tracê przez ni¹ zarobek.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"Jakaœ dziwna bestia sprawia problemy myœliwemu Gaanowi. Dopóki potwór tu grasuje, Gaan nie bêdzie móg³ normalnie polowaæ.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//Jest coraz gorzej. Od tego czasu od strony prze³êczy nadci¹gnê³y ca³e tuziny tych istot.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Trudno coœ upolowaæ w tych warunkach.
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

