
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
	description = "Masz jakieœ wieœci?";
};


func int dia_addon_myxir_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Masz jakieœ wieœci?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//Fascynuj¹ mnie budowniczowie tych ruin!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//Szkoda, ¿e ich jêzyk jest martwy, tak jak oni.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//Ich potê¿ne rytua³y i przywo³ania nie by³y w stanie im pomóc.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Przywo³ania?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//Budowniczowie byli mocno zwi¹zani ze œwiatem duchów.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//Jeœli dobrze rozumiem, uwa¿ali, ¿e ca³y czas pozostaj¹ w kontakcie ze swoimi przodkami.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//Dlatego, aby otrzymaæ od nich rady lub przepowiednie, regularnie odprawiali rytua³y przywo³ania.
	Info_ClearChoices(dia_addon_myxir_adwhello);
	Info_AddChoice(dia_addon_myxir_adwhello,"Jak dzia³a³y te przywo³ania?",dia_addon_myxir_adwhello_wie);
	Info_AddChoice(dia_addon_myxir_adwhello,"O ile wiem, o¿ywieñcy nie gadaj¹ zbyt wiele.",dia_addon_myxir_adwhello_watt);
};

func void dia_addon_myxir_adwhello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//Jak dzia³a³y te przywo³ania?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//Stra¿nicy umar³ych znali specjalne zaklêcia, którymi starali siê przeb³agaæ duchy.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//Opisy, które tu znalaz³em, s¹ w wiêkszoœci bardzo mêtne. Nieczêsto znajdujê jasne odpowiedzi na swoje pytania.
};

func void dia_addon_myxir_adwhello_watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//O ile wiem, o¿ywieñcy nie gadaj¹ zbyt wiele.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//Budowniczowie nie stworzyli bezdusznych o¿ywieñców, takich jak zombie czy inne plugawe istoty.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//Duchy s¹ duszami wielkich wojowników, kap³anów i w³adców.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//Nie mam w¹tpliwoœci, ¿e naprawdê istniej¹.
};


instance DIA_ADDON_MYXIR_PERMADW(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 10;
	condition = dia_addon_myxir_permadw_condition;
	information = dia_addon_myxir_permadw_info;
	permanent = TRUE;
	description = "Jeœli spotkam ducha, dam ci znaæ.";
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
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//Jeœli spotkam ducha, dam ci znaæ.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//Tak, koniecznie.
};


instance DIA_ADDON_MYXIR_GEISTTAFEL(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geisttafel_condition;
	information = dia_addon_myxir_geisttafel_info;
	description = "Przys³a³ mnie Saturas.";
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
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Przys³a³ mnie Saturas.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Kruk dosta³ siê do œwi¹tyni i zamkn¹³ za sob¹ portal.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas uwa¿a, ¿e swoj¹ wiedzê o œwi¹tyni Kruk uzyska³ od ducha!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//O Adanosie!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//Kruk musia³ przyzwaæ ducha najwy¿szego kap³ana Khardimona, aby dowiedzieæ siê, jak wejœæ do œwi¹tyni.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//Wed³ug zapisów, grób kap³ana znajduje siê w jaskiniach pod fortec¹!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//Bêdziesz musia³ zrobiæ tak samo.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//Ale nie mo¿esz ju¿ spytaæ Khardimona...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//W zachodniej czêœci doliny znajduje siê grób wodza Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//Bêdziesz musia³ go odnaleŸæ... i przebudziæ Quarhodrona.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//W tych inskrypcjach zapisano, jak wyznawca Adanosa mo¿e przywo³aæ ducha.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Myœlisz, ¿e to mo¿e siê udaæ?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//Przeczyta³em wiele sprzecznych informacji.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//Na przyk³ad inskrypcje Y'Beriona, przywódcy Bractwa Œni¹cego.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//Ale wierzê w ka¿de s³owo autora TYCH zapisów!
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_RUNNING;
	Info_ClearChoices(dia_addon_myxir_geisttafel);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Mówisz powa¿nie?",dia_addon_myxir_geisttafel_geist);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Dlaczego Quarhodrona? Dlaczego nie kap³ana Khardimona?",dia_addon_myxir_geisttafel_khardimon);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Bractwo Œni¹cego nie g³osi³o samych k³amstw. ",dia_addon_myxir_geisttafel_psi);
};

func void dia_addon_myxir_geisttafel_khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Dlaczego Quarhodrona? Dlaczego nie kap³ana Khardimona?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Kruk z pewnoœci¹ sprofanowa³ jego grób w czasie przywo³ania.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//Musimy poszukaæ innego ducha.
};

func void dia_addon_myxir_geisttafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//Bractwo Œni¹cego nie g³osi³o samych k³amstw. Œni¹cy naprawdê istnia³.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//To nie tylko k³amstwa sprawi³y, ¿e byli niewiarygodni, lecz ich w³asne s³owa.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//By³y mêtne! Wyznawcy Œni¹cego pozostawali pod z³ym wp³ywem palonego przez nich bagiennego ziela.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//Powaga i podnios³oœæ s³ów spisanych na tej kamiennej tablicy przekonuj¹ mnie, ¿e ich autor mówi prawdê.
};

func void dia_addon_myxir_geisttafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Mówisz powa¿nie?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//Chcê, ¿eby sprawdzono ka¿dy zakamarek.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//Nawet jeœli istnieje jedynie cieñ szansy na spotkanie jednego z budowniczych, musimy go wykorzystaæ.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Kruk tak w³aœnie zrobi³.
	Info_AddChoice(dia_addon_myxir_geisttafel,"Zgoda. Co mam zrobiæ, jeœli chcê przyzwaæ ducha?",dia_addon_myxir_geisttafel_wie);
};

func void dia_addon_myxir_geisttafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Zgoda. Co mam zrobiæ, jeœli chcê przyzwaæ ducha?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//ZnajdŸ grobowiec Quarhodrona na zachodzie doliny.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//Przyzwij ducha, wypowiadaj¹c s³owa stra¿ników umar³ych, które tu spisa³em.
	CreateInvItems(self,itwr_addon_summonancientghost,1);
	b_giveinvitems(self,other,itwr_addon_summonancientghost,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//To wszystko. Teraz musimy znaleŸæ jego grób.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Powodzenia, synu!
	b_logentry(TOPIC_ADDON_QUARHODRON,"Myxir chce, bym obudzi³ ducha staro¿ytnego wodza, Quarhodrona i zapyta³ go o radê. Da³ mi dokumenty z formu³¹ magiczn¹, któr¹ muszê odczytaæ na g³os przy grobie Quarhodrona, na zachodzie.");
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
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//Powinieneœ znaleŸæ jego grób i przywo³aæ ducha s³owami stra¿nika umar³ych.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//Masz je spisane. Musisz je jedynie g³oœno wypowiedzieæ.
};


instance DIA_ADDON_MYXIR_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_talkedtoghost_condition;
	information = dia_addon_myxir_talkedtoghost_info;
	description = "Rozmawia³em z Quarhodronem.";
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
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//Rozmawia³em z Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//Wiêc naprawdê uda³o ci siê przywo³aæ go z krainy umar³ych?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//To wprost niesamowite. Jeszcze bardziej podziwiam tych budowniczych.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Kto wie, co mogliby osi¹gn¹æ, gdyby wci¹¿ istnieli...
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MYXIR_GEISTBESCHWOEREN);
	if((SATURAS_KNOWSHOW2GETINTEMPEL == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//Co powiedzia³ duch?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//Da³ mi coœ, dziêki czemu bêdê móg³ dostaæ siê do œwi¹tyni.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Wiêc idŸ prosto do Saturasa. Interesuje go, co masz do powiedzenia.
		b_logentry(TOPIC_ADDON_QUARHODRON,"Kiedy obudzê Quarhodrona, mam siê zg³osiæ do Saturasa.");
	};
};


instance DIA_ADDON_MYXIR_ADW_TEACH(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 90;
	condition = dia_addon_myxir_adw_teach_condition;
	information = dia_addon_myxir_adw_teach_info;
	permanent = TRUE;
	description = "Naucz mnie tego dziwnego jêzyka.";
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

