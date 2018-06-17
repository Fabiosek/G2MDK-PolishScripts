
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//St�j! Ani kroku dalej!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Nie ma sprawy!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//Czy�by? No prosz�, kolejna zagubiona owieczka, co? Z pocz�tku wzi��em ci� za jednego z drani poluj�cych w tym rejonie.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Widz� jednak, �e nie jeste� jednym z nich. Wygl�dasz raczej niegro�nie!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "Wygl�dasz na my�liwego, ale chyba nie wiesz, co zrobi� z wolnym czasem.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//Wygl�dasz na my�liwego, ale chyba nie wiesz za bardzo, co zrobi� z wolnym czasem.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha, Ha! Taa - tu si� z tob� zgadzam. Ale c� mog� zrobi�, skoro nie mog� przedosta� si� przez prze��cz.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Czekam wi�c tutaj i staram si� robi� to, co umiem najlepiej.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Jednak �al mi mojego kolegi, Engroma.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Podejd� bli�ej ognia, ogrzej si� troch�.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"Mimo to wydaje si�, �e jako� sobie radzisz.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Jeste� by�ym wi�niem zza Bariery?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Jeste� by�ym wi�niem zza Bariery?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Nie, nie! Sk�d ten pomys�? Przyby�em tu tylko po to, �eby si� szybko wzbogaci�.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Kto� z tych okolic powiedzia� mi, �e te ziemie to �wietny teren �owiecki.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Sporo zwierzyny, je�li wiesz, co mam na my�li.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Ostatnio za� jedyn� rzecz�, o jak� tu naprawd� �atwo, jest mo�liwo�� oberwania od ork�w, je�li zapu�cisz si� zbyt daleko.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//A ja jeszcze pozwoli�em si� tym durniom zastraszy�.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Znam tych �artownisi�w.
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Mimo to wydaje si�, �e jako� sobie radzisz.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//C�! Nie mog� narzeka�. Mimo tych zafajdanych ork�w, tereny na obrze�ach rzeki nale�� do stosunkowo bezpiecznych.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Wydaje mi si�, �e nie lubi� zbli�a� si� do wody. Cho� mo�e to tylko zbieg okoliczno�ci.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Dlaczego jest ci �al Engroma?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Dlaczego jest ci �al Engroma?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Poniewa� �lepo za mn� pod��a, o nic nawet nie pyta.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//Przez to wpakowali�my si� w k�opoty. Chciwo��, jak wida�, nie pop�aca.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "Na co polujesz nad rzek�?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//Na co polujesz nad rzek�?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//Co to za pytanie? Przejd� si� tylko brzegiem, a szybko si� domy�lisz. Oczywi�cie na topielce!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Nie�atwo z�apa� te bestie, ale za to smakuj� wy�mienicie.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Od czasu do czasu natykam si� te� na �cierwojady, ale nimi te� nie pogardzam.
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "Tw�j kumpel jest chyba nieco zestresowany!";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Tw�j kumpel jest chyba nieco zestresowany!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Przesta�! Nie prowokuj go wi�cej, bo urwie mi �eb. W tej chwili nic nie poradz� na to, �e musimy tu siedzie�.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Kiedy� sobie za to odbij�!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "Mo�esz nauczy� mnie czego� o polowaniu?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Czy m�g�by� nauczy� mnie czego� o polowaniach?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Rozumiem! Nagle ci si� spodoba�y. W porz�dku, ale nie ma nic za darmo.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Czego ��dasz?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Nie masz przypadkiem czego� do jedzenia, czego� innego ni� mi�so topielca? Powiedzmy, kawa�ek sera. Tak, ser... Odda�bym �ycie za kawa�ek sera.
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Zobacz�, co da si� zrobi�.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Talbin mo�e mnie nauczy�, jak sporz�dza� trofea.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Oto tw�j ser. Czy teraz b�dziesz mnie uczy�?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Oto tw�j ser. Czy teraz b�dziesz mnie uczy�?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Naprawd� uda�o ci si� go zdoby�? Od wiek�w nie jad�em czego� tak wspania�ego. Dzi�kuj�. Er, a co powiesz na... o tak. Jasne!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//W tej chwili nie mam przy sobie sera.
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//To zbyt pi�kne, by mog�o by� prawdziwe. Daj mi zna� jak go zdob�dziesz.
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "Czego mo�esz mnie nauczy�?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Czego mo�esz mnie nauczy�?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//A co chcesz wiedzie�?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Usu� pazury",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Obedrzyj ze sk�ry",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("R�g cieniostwora",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_HEART] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Usu� serce",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Musz� ci� rozczarowa�. Wiesz ju� wszystko, czego m�g�bym ci� nauczy�. Jeszcze raz, dzi�ki za ser!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Odr�bywanie pazur�w jest stosunkowo �atwe. �apiesz pazur na wysoko�ci stawu i przyciskasz mocno do ziemi.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//Potem bierzesz n� i ostro�ne odcinasz pazur.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Naj�atwiejszy spos�b na osk�rowanie topielca to rozci�� sk�r� wzd�u� brzucha...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//...potem szarpn�� mocno za tylne �apy, i �ci�gn�� sk�r� w jednym kawa�ku.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Rogi cieniostwora s� bardzo twarde, tote� u�ywa si� ich do robienia figurek i narz�dzi.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Bardzo trudne do zdobycia s� serca magicznych stworze�. Je�li zechcesz dosta� jedno z nich, musisz bardzo uwa�a�, szczeg�lnie w przypadku golem�w.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Czy kto� t�dy przechodzi�?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Czy kto� t�dy przechodzi�?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Tak. Niedawno widzia�em tutaj grupk� �miesznych go�ci! Paradowali w swoich wyglansowanych zbrojach i udawali bardzo wa�nych.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "Czego tu chcieli ci '�mieszni go�cie'?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//Czego tu chcieli ci '�mieszni go�cie'?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Pytali o zapasy i sprz�t. Cz�owieku, ja sam ledwo ci�gn�!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Ci�gle gadali co� o zabijaniu smok�w. Bogowie jedni wiedz�, sk�d przysz�a ta banda, nie wzbudzili jednak mojego zaufania.
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"Grupa �owc�w smok�w zatrzyma�a si� obok siedziby my�liwego Talbina.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Jeste� sam?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Jeste� sam?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Tak. M�j kompan, Engrom, po prostu wsta� wczoraj i poszed� sobie. Powiedzia�, �e mia� wizj�, w kt�rej s�ysza� jaki� �agodny g�os.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Ja tam nic nie s�ysza�em. Pomy�la�em sobie, �e pewnie do ko�ca mu ju� odbi�o.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//...chwil� potem ju� go nie by�o.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Je�li spotkasz gdzie� Engroma, przypomnij sukinkotowi, �e wci�� mi jest winny sk�r� topielca.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//My�la�em, �e nie chcia� odej��, bo ba� si� ork�w. Czeka�, a� znikn�.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Jak ju� m�wi�em - ca�kowicie mu odbi�o.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "Znalaz�em twojego kompana, Engroma.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Znalaz�em twojego kompana, Engroma.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Tak? Gdzie jest?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Nie �yje.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Ju� wi�cej go chyba nie ujrzysz.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Prosz�, znalaz�em przy nim sk�r� topielca.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Poszukiwacze go op�tali.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Poszukiwacze, a kt� to taki?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//To s�udzy Z�a. Prawdziwi przyw�dcy ork�w.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//Na Innosa, musz� si� st�d wydosta�, nawet nara�aj�c �ycie. Teraz albo nigdy!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Talbin, my�liwy z G�rniczej Doliny, pobieg� w stron� prze��czy, jakby �ciga�y go ca�e chmary krwiopijc�w. S�dz�, �e skieruje si� do Khorinis.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Dok�d si� udasz?";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Dok�d p�jdziesz?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Zabierz mnie za prze��cz, prosz�.
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"Nie mam dla ciebie czasu.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"Id� po prostu przed siebie.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"W porz�dku.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Musz� si� st�d wynosi�, dotrze� za prze��cz. Z drogi!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//W porz�dku.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Dzi�kuj�. Po prostu p�jd� za tob�.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Id� po prostu przed siebie.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Tak ciemno... Nie wejd� tam za �adne skarby.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//Nie mam dla ciebie czasu.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Chcesz mnie tu zostawi�, bym zgni�. Sp�oniesz za to w piekle!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Hej!";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hej!
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Won. Poradz� sobie bez ciebie, szumowino.
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

