
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
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Niebiosom niech bêd¹ dziêki! Nie ma ju¿ bandytów! Ocali³eœ mi ¿ycie!
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
	description = "Kim jesteœ?";
};


func int dia_addon_elvrich_wer_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Kim jesteœ?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//Mam na imiê Elvrich. Pochodzê z miasta.
	if(MIS_THORBEN_BRINGELVRICHBACK == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Mistrz Thorben powiedzia³, ¿e gdzieœ znikn¹³eœ.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Ci bandyci porwali mnie i uwiêzili.
};


instance DIA_ADDON_ELVRICH_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_missingpeople_condition;
	information = dia_addon_elvrich_missingpeople_info;
	description = "W mieœcie coraz czêœciej znikaj¹ ludzie.";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//W mieœcie coraz czêœciej znikaj¹ ludzie.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//Nic mi o tym nie wiadomo. Wiem tylko, co mi siê przytrafi³o.
};


instance DIA_ADDON_ELVRICH_WHATEXACTLY(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whatexactly_condition;
	information = dia_addon_elvrich_whatexactly_info;
	description = "Co w³aœciwie siê sta³o?";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//Co w³aœciwie siê sta³o?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//Poszed³em na umówione spotkanie z dziewczyn¹.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Ma na imiê Lucia. Razem planowaliœmy uciec w góry, jak najdalej od miasta i jego problemów.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//Przyszed³em na miejsce, ale wtedy nagle wyskoczyli bandyci i zwi¹zali nas.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//Próbowa³em walczyæ, ale bezskutecznie. By³o ich wiêcej. Swoj¹ drog¹ - nie widzia³eœ ich mo¿e?
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Czego od was chcieli?",dia_addon_elvrich_whatexactly_want);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Opowiedz mi o Lucii.",dia_addon_elvrich_whatexactly_lucia);
};

func void dia_addon_elvrich_whatexactly_want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//Czego od was chcieli?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Uda³o mi siê ich pods³uchaæ. Nie zrozumia³em wszystkiego, ale chyba planowali sprzedaæ nas w niewolê.
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Dok¹d planowali was zawieŸæ?",dia_addon_elvrich_whatexactly_pirates);
};

func void dia_addon_elvrich_whatexactly_pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Dok¹d planowali was zawieŸæ?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//Gdzieœ na Khorinis. Ale bez statku chyba nie mo¿na siê tam dostaæ.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//Zaci¹gnêli mnie na przystañ przy piaszczystym brzegu. Jacyœ piraci mieli tam obóz.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//Jeden z bandytów poszed³ rozmawiaæ z piratami. K³ócili siê doœæ za¿arcie.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//S¹dzê, ¿e bandyci chcieli, aby piraci ich przewieŸli.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//Ale tamci nie zgodzili siê. Bandyci zaszyli siê tutaj i postanowili czekaæ na dalszy rozwój wypadków.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//Wygl¹da³o na to, ¿e nie maj¹ ¿adnego pomys³u. A potem zjawi³eœ siê ty.
	ELVRICH_SCKNOWSPIRATS = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Elvrich, czeladnik stolarza Thorbena, zosta³ porwany przez bandytów. Piraci s¹ prawdopodobnie w zmowie z bandytami.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Piraci w Khorinis?",dia_addon_elvrich_whatexactly_here);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Gdzie jest ta przystañ piratów?",dia_addon_elvrich_whatexactly_pirat);
};

func void dia_addon_elvrich_whatexactly_here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Piraci w Khorinis?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//Nie wiem o nich zbyt wiele. Po raz pierwszy widzia³em ich w³aœnie na przystani.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//Zawsze starali siê nie rzucaæ w oczy. Jeden z nich jest poszukiwany w Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//Boj¹ siê, ¿e zawisn¹. To dlatego ¿adnego z nich nie spotkasz w mieœcie.
};

func void dia_addon_elvrich_whatexactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Opowiedz mi o Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//Lucia mieszka³a w dzielnicy portowej i pracowa³a dla tego drania Bromora. Jest bardzo piêkna.
};

func void dia_addon_elvrich_whatexactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Gdzie jest ta przystañ piratów?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Nie tak daleko od przystani w Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//Stañ na pomoœcie i patrz¹c na morze, wsi¹dŸ do ³ódki i skieruj siê w prawo, p³yn¹c wzd³u¿ wybrze¿a.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//Wydaje mi siê, ¿e przystañ znajduje siê w pierwszej ma³ej zatoczce, któr¹ napotkasz.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"¯eby dotrzeæ do miejsca l¹dowania piratów, trzeba najpierw iœæ do portu w Khorinis. Z nabrze¿a skierowanego w morze trzeba pop³yn¹æ wzd³u¿ wybrze¿a w prawo.");
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
	description = "Bromor powiedzia³ mi, ¿e Lucia ukrad³a mu z³ot¹ misê...";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor powiedzia³ mi, ¿e Lucia ukrad³a mu z³ot¹ misê...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//No, jeœli naprawdê ukrad³a tê misê, to bandyci pewnie j¹ zabrali.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Z³ot¹ misê Bromora maj¹ zapewne bandyci z pó³nocnego lasu za farm¹ Sekoba.");
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
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//Rozdzieliliœmy siê na rozdro¿u w pobli¿u farmy Onara.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//Bandyci powlekli j¹ do lasu za farm¹ Sekoba.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//Niech Innos ma j¹ w opiece.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia zosta³a zabrana przez bandytów do lasu, gdzieœ na pó³noc za farm¹ Sekoba.");
	SC_KNOWSLUCIACAUGHTBYBANDITS = TRUE;
};


instance DIA_ADDON_ELVRICH_FERNANDOSWAFFEN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_fernandoswaffen_condition;
	information = dia_addon_elvrich_fernandoswaffen_info;
	description = "Czy bandyci, którzy was porwali, mieli przy sobie wiêkszy ³adunek broni?";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//Czy bandyci, którzy was porwali, mieli przy sobie wiêkszy ³adunek broni?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//O tak! Mieli jej tyle, ¿e ledwie byli w stanie wszystko udŸwign¹æ.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//Uciekli w kierunku farmy Sekoba, zabieraj¹c ca³y orê¿.
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Œlad prowadzi do lasu za farm¹ Sekoba, gdzieœ na pó³noc. Powiedziano mi, ¿e s¹ tam bandyci, którzy otrzymali du¿y transport broni.");
};


instance DIA_ADDON_ELVRICH_LUCIALETTER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 4;
	condition = dia_addon_elvrich_lucialetter_condition;
	information = dia_addon_elvrich_lucialetter_info;
	description = "Znalaz³em list od Lucii.";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//Znalaz³em list od Lucii.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//Co? Daj mi go!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//Nie! Nie mogê w to uwierzyæ! Nie, nie wierzê!!!
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//To niemo¿liwe, ¿eby teraz mnie zostawi³a!
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//Zabierz ten list. Nie chcê go! Ona do mnie wróci. Wiem to.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Elvrich nie chce uwierzyæ, ¿e Lucia posz³a z bandytami z w³asnej woli. Nadal liczy na powrót ukochanej, mimo ¿e dosta³ od niej jednoznaczny po¿egnalny list.");
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
	description = "Naprawdê powinieneœ wróciæ do miasta.";
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
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//Naprawdê powinieneœ wróciæ do miasta.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//A myœla³eœ, ¿e co zrobiê? Od razu pójdê do mistrza Thorbena.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Bêdziesz teraz szuka³ bandytów?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//Wygl¹da na to, ¿e tak...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//Jeœli odnajdziesz Luciê, zabierzesz j¹ do miasta, prawda?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//Zobaczê, co da siê zrobiæ.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich wróci³ do stolarza Thorbena.");
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
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Dziêkujê za ratunek.
};

