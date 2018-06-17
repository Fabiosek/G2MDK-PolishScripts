
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "Jeste� tutaj farmerem?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//Jeste� tutaj farmerem?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//Mo�na by tak powiedzie�, ale w�a�ciwie to jestem tylko naj�tym pracownikiem.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//Ca�a okoliczna ziemia nale�y do jednego, bogatego cz�owieka.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "Z czego �yjecie?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//Z czego �yjecie?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//G��wnie z polowania i wyr�bu drzew. Oczywi�cie, hodujemy te� owce i uprawiamy ziemi�.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar obarczy� mnie tymi wszystkimi pracownikami i musz� im jako� wyznacza� zaj�cia. Ale tylko kilku z nich potrafi dobrze polowa�, wiesz?
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "Zatrudniacie pracownik�w na dni�wk�?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//Zatrudniacie pracownik�w na dni�wk�?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar odsy�a robotnik�w, kt�rzy nie przydaj� mu si� w gospodarstwie.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Ci w�a�nie trafiaj� do mnie. Ja ich karmi� i dla mnie tutaj pracuj�.
};


instance DIA_ADDON_BENGAR_MISSINGPEOPLE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_missingpeople_condition;
	information = dia_addon_bengar_missingpeople_info;
	description = "Czy ostatnimi czasy dzia�o si� tu co� dziwnego?";
};


func int dia_addon_bengar_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Czy ostatnimi czasy dzia�o si� tu co� dziwnego?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//Tu zawsze dzieje si� co� dziwnego.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//Jednak najdziwniejsze by�o nag�e znikni�cie Pardosa.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//To jeden z moich parobk�w. Na pewno nie by� z tych, co to uciekaj� noc� bez s�owa.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Zagin�� robotnik farmera Bengara, Pardos.");
	MIS_BENGAR_BRINGMISSPEOPLEBACK = LOG_RUNNING;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_bengar_missingpeople);
	Info_AddChoice(dia_addon_bengar_missingpeople,DIALOG_BACK,dia_addon_bengar_missingpeople_back);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Masz jakie� sugestie?",dia_addon_bengar_missingpeople_hint);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Mo�e ju� mu si� znudzi�o?",dia_addon_bengar_missingpeople_voll);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Co by�o takiego dziwnego w jego znikni�ciu?",dia_addon_bengar_missingpeople_was);
};

func void dia_addon_bengar_missingpeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//Co by�o takiego dziwnego w jego znikni�ciu?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos nie by� zbyt odwa�ny. Nigdy nie opuszcza� farmy.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//Wystarczy�o, �e zobaczy� chrz�szcza, a ju� bra� nogi za pas.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Nie s� to mo�e naj�adniejsze stworzenia, ale nie s� te� niebezpieczne.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//S�ysza�em, �e moi ludzie �api� je i jedz� ich mi�so. Obrzydliwe.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//Mo�na si� do tego przyzwyczai�.
};

func void dia_addon_bengar_missingpeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Mo�e ju� mu si� znudzi�o?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Bardzo lubi� t� prac�, wi�c ci�ko mi sobie wyobrazi�, �e uciek�.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//U mnie m�g� robi�, co chcia�, wi�c raczej nie uciek� do innego farmera.
};

func void dia_addon_bengar_missingpeople_hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Masz jakie� sugestie?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//Przypuszczam, �e porwali go bandyci. Ostatnio cz�sto tu ich widujemy.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//Kiedy� widzia�em, jak prowadzili ze sob� jakiego� cz�owieka z miasta.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//Wygl�da�o na to, �e nie szed� z w�asnej woli.
	Info_AddChoice(dia_addon_bengar_missingpeople,"Gdzie ci bandyci maj� sw�j ob�z?",dia_addon_bengar_missingpeople_lager);
};


var int bengar_toldaboutrangerbandits;

func void dia_addon_bengar_missingpeople_lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//Gdzie ci bandyci maj� sw�j ob�z?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//Za moimi polami znajdziesz wykute w skale schody, kt�re wiod� do ma�ej kotliny. Tam si� najpewniej zatrzymali.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//Ch�tnie bym sam poszuka� Pardosa, ale nie u�miecha mi si� spotkanie z tymi bandziorami.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//Na twoim miejscu trzyma�bym si� od nich z daleka. Nie lubi� obcych.
	BENGAR_TOLDABOUTRANGERBANDITS = TRUE;
};

func void dia_addon_bengar_missingpeople_back()
{
	Info_ClearChoices(dia_addon_bengar_missingpeople);
};


instance DIA_ADDON_BENGAR_RETURNPARDOS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_returnpardos_condition;
	information = dia_addon_bengar_returnpardos_info;
	description = "Czy Pardos wr�ci�?";
};


func int dia_addon_bengar_returnpardos_condition()
{
	if((MIS_BENGAR_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (Npc_GetDistToWP(pardos_nw,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_returnpardos_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Czy Pardos wr�ci�?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Tak, teraz odpoczywa w domu. Dzi�ki za wszystko.
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Nie ma sprawy.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Czekaj, chcia�bym ci si� jako� odwdzi�czy�, ale nie mam jak...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Nie ma sprawy.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BENGAR_FERNANDOSWEAPONS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_fernandosweapons_condition;
	information = dia_addon_bengar_fernandosweapons_info;
	description = "Czy ci bandyci nie�li ze sob� jak�� bro�?";
};


func int dia_addon_bengar_fernandosweapons_condition()
{
	if((BENGAR_TOLDABOUTRANGERBANDITS == TRUE) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Czy ci bandyci nie�li ze sob� jak�� bro�?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//G�upie pytanie. Widzia�e� kiedy� nieuzbrojonego rabusia?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//Nie chodzi o to. Pytam, czy nie mieli ze sob� naprawd� sporego jej zapasu. Du�ego transportu.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//Faktycznie, teraz sobie przypominam. Mieli ze sob� naprawd� sporo or�a.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Cz�� w beczkach, cz�� w workach, a cz�� na wozie.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "Co my�lisz o Onarze?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//Co my�lisz o Onarze?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//Ach. To chciwy dra�, przez kt�rego nas w ko�cu wszystkich powiesz�.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//Pewnego dnia paladyni wyjd� z miasta i my, farmerzy, zap�acimy krwi� za to, co on tu wyrabia.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//Ale nie mam wyboru. Stra� przychodzi tu tylko po to, �eby zbiera� podatki. Nie chroni� gospodarstwa.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//Gdybym by� lojalny w stosunku do miasta, to w zasadzie zosta�bym sam.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//Onar przynajmniej od czasu do czasu wysy�a najemnik�w, �eby zobaczy�, jak nam idzie.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "Co masz przeciwko kr�lewskim �o�nierzom?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//Co masz przeciwko kr�lewskim �o�nierzom?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//Wszystko! Od czasu, kiedy paladyni pojawili si� w mie�cie, nic si� nie poprawi�o. Wprost przeciwnie.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Teraz ci przekl�ci stra�nicy coraz cz�ciej zagl�daj� na nasze ziemie i kradn�, co im wpadnie w r�ce. A paladyni nic z tym nie robi�.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//Jedyni paladyni, jakich widzia�em, to ci dwaj, kt�rzy pilnuj� prze��czy.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//Nie rusz� si� o krok, nawet gdyby stra� nas wszystkich pozarzyna�a.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "Prze��czy?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//Prze��czy?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Ano. Prze��czy do starej G�rniczej Doliny, ko�o wodospad�w po drugiej stronie pastwisk na p�askowy�u.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Spytaj o to Malaka. W zesz�ym tygodniu by� tam kilka razy.
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "Mam rozwi�za� wasze problemy ze stra��.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//Mam rozwi�za� wasze problemy ze stra��.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//Co? M�wi�em Onarowi, �e powinien mi przys�a� kilku swoich najemnik�w.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//To moja szansa na to, �eby si� wykaza�.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Rewelacyjnie. Wiesz, co mi zrobi� stra�nicy, jak schrzanisz spraw�?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Ju� my�la�em, �e nikt nie przyjdzie.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//M�wi�em to Onarowi kilka dni temu. Za co mu p�ac� czynsz?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//Ci dranie przychodz� tu co tydzie� i zbieraj� podatki dla miasta.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//Dobrze, �e przyszed�e� w�a�nie teraz. Zazwyczaj zjawiaj� si� o tej porze.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//Powinni tu by� za chwil�.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "Dlaczego sami nie staniecie przeciwko stra�y?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//Sporo was. Dlaczego sami nie staniecie przeciwko stra�y?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//To prawda, jest nas wielu. Ale nie jeste�my zawodowymi �o�nierzami jak stra�nicy.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "Niech no stra�nicy przyjd�, zajm� si� nimi!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Niech no stra�nicy przyjd�, zajm� si� nimi!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//Nie mog� si� doczeka�. Nadchodz�! Widzisz, a nie m�wi�em!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Tylko nie nawal!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//No c�, powodzenia! Poka� im.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "Wasze problemy ze stra�� nale�� ju� do przesz�o�ci.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Wasze problemy ze stra�� nale�� ju� do przesz�o�ci.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Oszala�e�? Wiesz, co mi zrobi�, je�li ciebie nie b�dzie?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//Ci�gle tam stoj�. Powiedz im, �e powinni st�d CA�KOWICIE znikn��!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//Nie�le. Teraz mo�e zostan� nam jakie� drobne na koniec miesi�ca. Dzi�ki.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//Chcia�e� nawet za mnie zap�aci�. To bardzo mi�e z twojej strony.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "Pasterz Balthasar nie mo�e pa�� owiec na twoich pastwiskach?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Pasterz Balthasar nie mo�e pa�� owiec na twoich pastwiskach?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//Ach, o to chodzi. Powiedzia�em mu, �e Sekob powinien mi p�aci�, je�li chce korzysta� z moich pastwisk.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//M�wi�c prawd�, to tylko dokuczanie. Po prostu nie cierpi� Balthasara.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Je�li mam przekona� Bengara, aby wpu�ci� Balthasara z powrotem na swoje pastwiska, b�d� musia� wy�wiadczy� mu przys�ug�. Na pewno wkr�tce nadarzy si� ku temu jaka� okazja.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "Stra�nik�w ju� nie ma, a Balthasar znowu mo�e korzysta� z twoich pastwisk.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//Stra�nik�w ju� nie ma, a Balthasar znowu mo�e korzysta� z twoich pastwisk.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Dlaczego?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//Bo ja tak powiedzia�em.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Hmmm. W porz�dku, jak sobie �yczysz.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Niech wyprowadza swoje zwierz�ta gdzie� za pola uprawne.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "Trzymaj si�.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Trzymaj si�.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//Ty te�.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "Jak wygl�da sytuacja?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//Jak wygl�da sytuacja?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak znikn�� i zabra� ze sob� wszystko, i wszystkich, kt�rzy mogli dla mnie pracowa�. M�wi�, �e kieruje si� w g�ry.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//Nie m�g� ju� tu wytrzyma�.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Czasy s� ci�kie. Nie wiem, jak d�ugo jeszcze JA to wytrzymam.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//Codziennie z prze��czy wypadaj� hordy potwor�w i grasuj� na p�askowy�u. To mnie wyko�czy.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//Gdybym tak mia� przynajmniej kilku pomocnik�w albo najemnik�w.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//By� nawet taki jeden, co chcia� dla mnie pracowa�. Ale chyba zmieni� zdanie. Zdaje si�, �e nazywa� si� Wilk.
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"Bengar zosta� na farmie sam. Jego przyjaciel Malak odszed� i zabra� ze sob� pozosta�ych. Bengar s�dzi, �e schronili si� gdzie� w g�rach.");
	b_logentry(TOPIC_BENGARALLEIN,"Jego farma zosta�a bez �adnej ochrony. Prosi� mnie o pomoc, wspomnia� te� co� o najemniku imieniem Wilk. Czy ja przypadkiem nie znam tego cz�owieka?");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "Malak nie �yje.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak nie �yje.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//A wi�c sytuacja jeszcze bardziej si� pogorszy.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "Znalaz�em ci najemnika.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//Znalaz�em ci najemnika.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//Nie mia�em u siebie jeszcze nigdy kogo� takiego. Mam nadziej�, �e to si� uda.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Prosz�, we� to. S�dz�, �e ci si� przyda.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "Malak wr�ci�.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak wr�ci�.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//Najwy�sza pora. My�la�em, �e ju� nigdy go nie zobacz�.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "Wszystko b�dzie dobrze.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//Wszystko b�dzie dobrze.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak wr�ci�, ale sytuacja niewiele si� zmieni�a.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Je�li nie zdarzy si� jaki� cud, wszyscy tu zginiemy.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wilk to dziwny facet, ale chyba sobie poradzi.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Bez Malaka nic tu nie zostanie zrobione. Je�li wkr�tce co� si� nie wydarzy, b�d� musia� opu�ci� swoje gospodarstwo.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Mam nadziej�, �e nied�ugo wr�ci.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

