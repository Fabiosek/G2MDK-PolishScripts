
instance DIA_ADDON_ELVRICH_EXIT(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 999;
	condition = dia_addon_elvrich_exit_condition;
	information = dia_addon_elvrich_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_elvrich_exit_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_PICKPOCKET(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 900;
	condition = dia_addon_elvrich_pickpocket_condition;
	information = dia_addon_elvrich_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_elvrich_pickpocket_condition()
{
	return c_beklauen(62,110);
};

func void dia_addon_elvrich_pickpocket_info()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_BACK,dia_addon_elvrich_pickpocket_back);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_PICKPOCKET,dia_addon_elvrich_pickpocket_doit);
};

func void dia_addon_elvrich_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};

func void dia_addon_elvrich_pickpocket_back()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};


instance DIA_ADDON_ELVRICH_BANDITSTHERE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_banditsthere_condition;
	information = dia_addon_elvrich_banditsthere_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_elvrich_banditsthere_noperm;

func int dia_addon_elvrich_banditsthere_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_banditsthere_info()
{
	if(Npc_IsDead(bdt_10307_addon_rangerbandit_m) && Npc_IsDead(bdt_10308_addon_rangerbandit_l) && Npc_IsDead(bdt_10309_addon_rangerbandit_l) && Npc_IsDead(bdt_10310_addon_rangerbandit_m))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Niebiosom niech b�d� dzi�ki! Nie ma ju� bandyt�w! Ocali�e� mi �ycie!
		DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM = TRUE;
		self.aivar[AIV_NOFIGHTPARKER] = FALSE;
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ELVRICH_WER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wer_condition;
	information = dia_addon_elvrich_wer_info;
	description = "Kim jeste�?";
};


func int dia_addon_elvrich_wer_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kim jeste�?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Mam na imi� Elvrich. Pochodz� z miasta.
	if(MIS_THORBEN_BRINGELVRICHBACK == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistrz Thorben powiedzia�, �e gdzie� znikn��e�.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Ci bandyci porwali mnie i uwi�zili.
};


instance DIA_ADDON_ELVRICH_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_missingpeople_condition;
	information = dia_addon_elvrich_missingpeople_info;
	description = "W mie�cie coraz cz�ciej znikaj� ludzie.";
};


func int dia_addon_elvrich_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//W mie�cie coraz cz�ciej znikaj� ludzie.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//Nic mi o tym nie wiadomo. Wiem tylko, co mi si� przytrafi�o.
};


instance DIA_ADDON_ELVRICH_WHATEXACTLY(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whatexactly_condition;
	information = dia_addon_elvrich_whatexactly_info;
	description = "Co w�a�ciwie si� sta�o?";
};


func int dia_addon_elvrich_whatexactly_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whatexactly_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co w�a�ciwie si� sta�o?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Poszed�em na um�wione spotkanie z dziewczyn�.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Ma na imi� Lucia. Razem planowali�my uciec w g�ry, jak najdalej od miasta i jego problem�w.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Przyszed�em na miejsce, ale wtedy nagle wyskoczyli bandyci i zwi�zali nas.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Pr�bowa�em walczy�, ale bezskutecznie. By�o ich wi�cej. Swoj� drog� - nie widzia�e� ich mo�e?
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Czego od was chcieli?",dia_addon_elvrich_whatexactly_want);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Opowiedz mi o Lucii.",dia_addon_elvrich_whatexactly_lucia);
};

func void dia_addon_elvrich_whatexactly_want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Czego od was chcieli?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Uda�o mi si� ich pods�ucha�. Nie zrozumia�em wszystkiego, ale chyba planowali sprzeda� nas w niewol�.
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Dok�d planowali was zawie��?",dia_addon_elvrich_whatexactly_pirates);
};

func void dia_addon_elvrich_whatexactly_pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Dok�d planowali was zawie��?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//Gdzie� na Khorinis. Ale bez statku chyba nie mo�na si� tam dosta�.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Zaci�gn�li mnie na przysta� przy piaszczystym brzegu. Jacy� piraci mieli tam ob�z.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z bandyt�w poszed� rozmawia� z piratami. K��cili si� do�� za�arcie.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//S�dz�, �e bandyci chcieli, aby piraci ich przewie�li.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale tamci nie zgodzili si�. Bandyci zaszyli si� tutaj i postanowili czeka� na dalszy rozw�j wypadk�w.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Wygl�da�o na to, �e nie maj� �adnego pomys�u. A potem zjawi�e� si� ty.
	ELVRICH_SCKNOWSPIRATS = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Elvrich, czeladnik stolarza Thorbena, zosta� porwany przez bandyt�w. Piraci s� prawdopodobnie w zmowie z bandytami.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Piraci w Khorinis?",dia_addon_elvrich_whatexactly_here);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Gdzie jest ta przysta� pirat�w?",dia_addon_elvrich_whatexactly_pirat);
};

func void dia_addon_elvrich_whatexactly_here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Piraci w Khorinis?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Nie wiem o nich zbyt wiele. Po raz pierwszy widzia�em ich w�a�nie na przystani.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Zawsze starali si� nie rzuca� w oczy. Jeden z nich jest poszukiwany w Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Boj� si�, �e zawisn�. To dlatego �adnego z nich nie spotkasz w mie�cie.
};

func void dia_addon_elvrich_whatexactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Opowiedz mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Lucia mieszka�a w dzielnicy portowej i pracowa�a dla tego drania Bromora. Jest bardzo pi�kna.
};

func void dia_addon_elvrich_whatexactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Gdzie jest ta przysta� pirat�w?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Nie tak daleko od przystani w Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Sta� na pomo�cie i patrz�c na morze, wsi�d� do ��dki i skieruj si� w prawo, p�yn�c wzd�u� wybrze�a.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Wydaje mi si�, �e przysta� znajduje si� w pierwszej ma�ej zatoczce, kt�r� napotkasz.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"�eby dotrze� do miejsca l�dowania pirat�w, trzeba najpierw i�� do portu w Khorinis. Z nabrze�a skierowanego w morze trzeba pop�yn�� wzd�u� wybrze�a w prawo.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,DIALOG_BACK,dia_addon_elvrich_whatexactly_back);
};

func void dia_addon_elvrich_whatexactly_back()
{
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
};


instance DIA_ADDON_ELVRICH_BROMOR(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_bromor_condition;
	information = dia_addon_elvrich_bromor_info;
	description = "Bromor powiedzia� mi, �e Lucia ukrad�a mu z�ot� mis�...";
};


func int dia_addon_elvrich_bromor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_bromor_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor powiedzia� mi, �e Lucia ukrad�a mu z�ot� mis�...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, je�li naprawd� ukrad�a t� mis�, to bandyci pewnie j� zabrali.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Z�ot� mis� Bromora maj� zapewne bandyci z p�nocnego lasu za farm� Sekoba.");
};


instance DIA_ADDON_ELVRICH_WHEREISLUCIA(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whereislucia_condition;
	information = dia_addon_elvrich_whereislucia_info;
	description = "Gdzie jest teraz Lucia?";
};


func int dia_addon_elvrich_whereislucia_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_LUCIASLETTER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whereislucia_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Gdzie jest teraz Lucia?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Rozdzielili�my si� na rozdro�u w pobli�u farmy Onara.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Bandyci powlekli j� do lasu za farm� Sekoba.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Niech Innos ma j� w opiece.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia zosta�a zabrana przez bandyt�w do lasu, gdzie� na p�noc za farm� Sekoba.");
	SC_KNOWSLUCIACAUGHTBYBANDITS = TRUE;
};


instance DIA_ADDON_ELVRICH_FERNANDOSWAFFEN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_fernandoswaffen_condition;
	information = dia_addon_elvrich_fernandoswaffen_info;
	description = "Czy bandyci, kt�rzy was porwali, mieli przy sobie wi�kszy �adunek broni?";
};


func int dia_addon_elvrich_fernandoswaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_fernandoswaffen_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//Czy bandyci, kt�rzy was porwali, mieli przy sobie wi�kszy �adunek broni?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//O tak! Mieli jej tyle, �e ledwie byli w stanie wszystko ud�wign��.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Uciekli w kierunku farmy Sekoba, zabieraj�c ca�y or�.
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"�lad prowadzi do lasu za farm� Sekoba, gdzie� na p�noc. Powiedziano mi, �e s� tam bandyci, kt�rzy otrzymali du�y transport broni.");
};


instance DIA_ADDON_ELVRICH_LUCIALETTER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 4;
	condition = dia_addon_elvrich_lucialetter_condition;
	information = dia_addon_elvrich_lucialetter_info;
	description = "Znalaz�em list od Lucii.";
};


func int dia_addon_elvrich_lucialetter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && Npc_HasItems(other,itwr_luciasloveletter_addon))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_lucialetter_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Znalaz�em list od Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//Co? Daj mi go!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//Nie! Nie mog� w to uwierzy�! Nie, nie wierz�!!!
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//To niemo�liwe, �eby teraz mnie zostawi�a!
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//Zabierz ten list. Nie chc� go! Ona do mnie wr�ci. Wiem to.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Elvrich nie chce uwierzy�, �e Lucia posz�a z bandytami z w�asnej woli. Nadal liczy na powr�t ukochanej, mimo �e dosta� od niej jednoznaczny po�egnalny list.");
	b_giveplayerxp(XP_ADDON_LUCIASLETTER);
	MIS_LUCIASLETTER = LOG_SUCCESS;
};


instance DIA_ADDON_ELVRICH_WASNUN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wasnun_condition;
	information = dia_addon_elvrich_wasnun_info;
	permanent = FALSE;
	description = "Naprawd� powiniene� wr�ci� do miasta.";
};


func int dia_addon_elvrich_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whereislucia))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_wasnun_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Naprawd� powiniene� wr�ci� do miasta.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A my�la�e�, �e co zrobi�? Od razu p�jd� do mistrza Thorbena.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//B�dziesz teraz szuka� bandyt�w?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//Wygl�da na to, �e tak...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Je�li odnajdziesz Luci�, zabierzesz j� do miasta, prawda?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Zobacz�, co da si� zrobi�.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich wr�ci� do stolarza Thorbena.");
	ELVRICH_GOESBACK2THORBEN = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,itmw_1h_bau_mace);
};


instance DIA_ADDON_ELVRICH_PERM(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_perm_condition;
	information = dia_addon_elvrich_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_elvrich_perm_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && Npc_IsInState(self,zs_talk) && (MIS_LUCIASLETTER != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Dzi�kuj� za ratunek.
};

