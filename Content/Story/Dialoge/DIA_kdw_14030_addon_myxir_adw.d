
instance DIA_ADDON_MYXIR_ADW_EXIT(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 999;
	condition = dia_addon_myxir_adw_exit_condition;
	information = dia_addon_myxir_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_ADWHELLO(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_adwhello_condition;
	information = dia_addon_myxir_adwhello_info;
	description = "Masz jakie� wie�ci?";
};


func int dia_addon_myxir_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Masz jakie� wie�ci?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Fascynuj� mnie budowniczowie tych ruin!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Szkoda, �e ich j�zyk jest martwy, tak jak oni.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//Ich pot�ne rytua�y i przywo�ania nie by�y w stanie im pom�c.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Przywo�ania?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Budowniczowie byli mocno zwi�zani ze �wiatem duch�w.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Je�li dobrze rozumiem, uwa�ali, �e ca�y czas pozostaj� w kontakcie ze swoimi przodkami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Dlatego, aby otrzyma� od nich rady lub przepowiednie, regularnie odprawiali rytua�y przywo�ania.
	Info_ClearChoices(dia_addon_myxir_adwhello);
	Info_AddChoice(dia_addon_myxir_adwhello,"Jak dzia�a�y te przywo�ania?",dia_addon_myxir_adwhello_wie);
	Info_AddChoice(dia_addon_myxir_adwhello,"O ile wiem, o�ywie�cy nie gadaj� zbyt wiele.",dia_addon_myxir_adwhello_watt);
};

func void dia_addon_myxir_adwhello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak dzia�a�y te przywo�ania?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Stra�nicy umar�ych znali specjalne zakl�cia, kt�rymi starali si� przeb�aga� duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Opisy, kt�re tu znalaz�em, s� w wi�kszo�ci bardzo m�tne. Niecz�sto znajduj� jasne odpowiedzi na swoje pytania.
};

func void dia_addon_myxir_adwhello_watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//O ile wiem, o�ywie�cy nie gadaj� zbyt wiele.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Budowniczowie nie stworzyli bezdusznych o�ywie�c�w, takich jak zombie czy inne plugawe istoty.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//Duchy s� duszami wielkich wojownik�w, kap�an�w i w�adc�w.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Nie mam w�tpliwo�ci, �e naprawd� istniej�.
};


instance DIA_ADDON_MYXIR_PERMADW(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 10;
	condition = dia_addon_myxir_permadw_condition;
	information = dia_addon_myxir_permadw_info;
	permanent = TRUE;
	description = "Je�li spotkam ducha, dam ci zna�.";
};


func int dia_addon_myxir_permadw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_adwhello) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Je�li spotkam ducha, dam ci zna�.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//Tak, koniecznie.
};


instance DIA_ADDON_MYXIR_GEISTTAFEL(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geisttafel_condition;
	information = dia_addon_myxir_geisttafel_info;
	description = "Przys�a� mnie Saturas.";
};


func int dia_addon_myxir_geisttafel_condition()
{
	if((SATURAS_RIESENPLAN == TRUE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geisttafel_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Przys�a� mnie Saturas.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Kruk dosta� si� do �wi�tyni i zamkn�� za sob� portal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas uwa�a, �e swoj� wiedz� o �wi�tyni Kruk uzyska� od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//O Adanosie!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Kruk musia� przyzwa� ducha najwy�szego kap�ana Khardimona, aby dowiedzie� si�, jak wej�� do �wi�tyni.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Wed�ug zapis�w, gr�b kap�ana znajduje si� w jaskiniach pod fortec�!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//B�dziesz musia� zrobi� tak samo.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale nie mo�esz ju� spyta� Khardimona...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//W zachodniej cz�ci doliny znajduje si� gr�b wodza Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//B�dziesz musia� go odnale��... i przebudzi� Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//W tych inskrypcjach zapisano, jak wyznawca Adanosa mo�e przywo�a� ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//My�lisz, �e to mo�e si� uda�?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Przeczyta�em wiele sprzecznych informacji.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Na przyk�ad inskrypcje Y'Beriona, przyw�dcy Bractwa �ni�cego.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale wierz� w ka�de s�owo autora TYCH zapis�w!
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_RUNNING;
	Info_ClearChoices(dia_addon_myxir_geisttafel);
	Info_AddChoice(dia_addon_myxir_geisttafel,"M�wisz powa�nie?",dia_addon_myxir_geisttafel_geist);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Dlaczego Quarhodrona? Dlaczego nie kap�ana Khardimona?",dia_addon_myxir_geisttafel_khardimon);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Bractwo �ni�cego nie g�osi�o samych k�amstw. ",dia_addon_myxir_geisttafel_psi);
};

func void dia_addon_myxir_geisttafel_khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Dlaczego Quarhodrona? Dlaczego nie kap�ana Khardimona?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Kruk z pewno�ci� sprofanowa� jego gr�b w czasie przywo�ania.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Musimy poszuka� innego ducha.
};

func void dia_addon_myxir_geisttafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bractwo �ni�cego nie g�osi�o samych k�amstw. �ni�cy naprawd� istnia�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nie tylko k�amstwa sprawi�y, �e byli niewiarygodni, lecz ich w�asne s�owa.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//By�y m�tne! Wyznawcy �ni�cego pozostawali pod z�ym wp�ywem palonego przez nich bagiennego ziela.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Powaga i podnios�o�� s��w spisanych na tej kamiennej tablicy przekonuj� mnie, �e ich autor m�wi prawd�.
};

func void dia_addon_myxir_geisttafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//M�wisz powa�nie?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Chc�, �eby sprawdzono ka�dy zakamarek.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//Nawet je�li istnieje jedynie cie� szansy na spotkanie jednego z budowniczych, musimy go wykorzysta�.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Kruk tak w�a�nie zrobi�.
	Info_AddChoice(dia_addon_myxir_geisttafel,"Zgoda. Co mam zrobi�, je�li chc� przyzwa� ducha?",dia_addon_myxir_geisttafel_wie);
};

func void dia_addon_myxir_geisttafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Zgoda. Co mam zrobi�, je�li chc� przyzwa� ducha?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Znajd� grobowiec Quarhodrona na zachodzie doliny.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Przyzwij ducha, wypowiadaj�c s�owa stra�nik�w umar�ych, kt�re tu spisa�em.
	CreateInvItems(self,itwr_addon_summonancientghost,1);
	b_giveinvitems(self,other,itwr_addon_summonancientghost,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//To wszystko. Teraz musimy znale�� jego gr�b.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Powodzenia, synu!
	b_logentry(TOPIC_ADDON_QUARHODRON,"Myxir chce, bym obudzi� ducha staro�ytnego wodza, Quarhodrona i zapyta� go o rad�. Da� mi dokumenty z formu�� magiczn�, kt�r� musz� odczyta� na g�os przy grobie Quarhodrona, na zachodzie.");
	Info_ClearChoices(dia_addon_myxir_geisttafel);
};


instance DIA_ADDON_MYXIR_GEISTPERM(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geistperm_condition;
	information = dia_addon_myxir_geistperm_info;
	description = "Przypomnij mi, o co chodzi z tym wodzem Quarhodronem?";
};


func int dia_addon_myxir_geistperm_condition()
{
	if(MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geistperm_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//Przypomnij mi, o co chodzi z tym wodzem Quarhodronem?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Powiniene� znale�� jego gr�b i przywo�a� ducha s�owami stra�nika umar�ych.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Masz je spisane. Musisz je jedynie g�o�no wypowiedzie�.
};


instance DIA_ADDON_MYXIR_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_talkedtoghost_condition;
	information = dia_addon_myxir_talkedtoghost_info;
	description = "Rozmawia�em z Quarhodronem.";
};


func int dia_addon_myxir_talkedtoghost_condition()
{
	if((MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING) && (SC_TALKEDTOGHOST == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Rozmawia�em z Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//Wi�c naprawd� uda�o ci si� przywo�a� go z krainy umar�ych?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To wprost niesamowite. Jeszcze bardziej podziwiam tych budowniczych.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kto wie, co mogliby osi�gn��, gdyby wci�� istnieli...
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MYXIR_GEISTBESCHWOEREN);
	if((SATURAS_KNOWSHOW2GETINTEMPEL == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co powiedzia� duch?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Da� mi co�, dzi�ki czemu b�d� m�g� dosta� si� do �wi�tyni.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Wi�c id� prosto do Saturasa. Interesuje go, co masz do powiedzenia.
		b_logentry(TOPIC_ADDON_QUARHODRON,"Kiedy obudz� Quarhodrona, mam si� zg�osi� do Saturasa.");
	};
};


instance DIA_ADDON_MYXIR_ADW_TEACH(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 90;
	condition = dia_addon_myxir_adw_teach_condition;
	information = dia_addon_myxir_adw_teach_info;
	permanent = TRUE;
	description = "Naucz mnie tego dziwnego j�zyka.";
};


var int dia_addon_myxir_adw_teach_noperm;
var int dia_addon_myxir_adw_teach_onetime;

func int dia_addon_myxir_adw_teach_condition()
{
	if((DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_teach_info()
{
	b_dia_addon_myxir_teachrequest();
	if(DIA_ADDON_MYXIR_ADW_TEACH_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_MYXIRTEACH);
		DIA_ADDON_MYXIR_ADW_TEACH_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(dia_addon_myxir_adw_teach);
		Info_AddChoice(dia_addon_myxir_adw_teach,DIALOG_BACK,dia_addon_myxir_adw_teach_back);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		b_dia_addon_myxir_teachl1();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_1,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),dia_addon_myxir_adw_teach_language_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		b_dia_addon_myxir_teachl2();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_2,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),dia_addon_myxir_adw_teach_language_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		b_dia_addon_myxir_teachl3();
		Info_AddChoice(dia_addon_myxir_adw_teach,b_buildlearnstring(NAME_ADDON_LEARNLANGUAGE_3,b_getlearncosttalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),dia_addon_myxir_adw_teach_language_3);
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_myxir_adw_teach_language_x()
{
	b_dia_addon_myxir_teach_language_x();
};

func void dia_addon_myxir_adw_teach_back()
{
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_1()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_1))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_2()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_2))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

func void dia_addon_myxir_adw_teach_language_3()
{
	if(b_teachplayertalentforeignlanguage(self,other,LANGUAGE_3))
	{
		dia_addon_myxir_adw_teach_language_x();
	};
	Info_ClearChoices(dia_addon_myxir_adw_teach);
};

