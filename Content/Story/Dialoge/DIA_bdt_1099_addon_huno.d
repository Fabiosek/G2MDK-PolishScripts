
instance DIA_ADDON_HUNO_EXIT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 999;
	condition = dia_addon_huno_exit_condition;
	information = dia_addon_huno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_huno_exit_condition()
{
	return TRUE;
};

func void dia_addon_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 900;
	condition = dia_addon_huno_pickpocket_condition;
	information = dia_addon_huno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_huno_pickpocket_condition()
{
	return c_beklauen(85,102);
};

func void dia_addon_huno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_BACK,dia_addon_huno_pickpocket_back);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_PICKPOCKET,dia_addon_huno_pickpocket_doit);
};

func void dia_addon_huno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_huno_pickpocket);
};

func void dia_addon_huno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
};


instance DIA_ADDON_HUNO_ABWIMMELN(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_abwimmeln_condition;
	information = dia_addon_huno_abwimmeln_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_huno_abwimmeln_condition()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		return TRUE;
	};
	if((HUNO_ZUSNAF == TRUE) && !Npc_KnowsInfo(other,dia_addon_fisk_meeting) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_huno_abwimmeln_info()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//Czego jeszcze chcesz? Spadaj!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//Na co czekasz? IdŸ siê napiæ!
	};
	AI_StopProcessInfos(self);
};


var int knows_flucht;
var int huno_angepisst;

instance DIA_ADDON_HUNO_HI(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_hi_condition;
	information = dia_addon_huno_hi_info;
	permanent = FALSE;
	description = "Od razu widaæ, ¿e znasz siê na swoim fachu.";
};


func int dia_addon_huno_hi_condition()
{
	return TRUE;
};

func void dia_addon_huno_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//Od razu widaæ, ¿e znasz siê na swoim fachu.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//Ju¿ to kiedyœ s³ysza³em... przynosisz stal?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Stal? Nie, chyba mnie z kimœ pomyli³eœ....
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hmm... wygl¹dasz znajomo. Spotkaliœmy siê wczeœniej?
	Info_ClearChoices(dia_addon_huno_hi);
	Info_AddChoice(dia_addon_huno_hi,"Oczywiœcie, w Starym Obozie.",dia_addon_huno_hi_ja);
	Info_AddChoice(dia_addon_huno_hi,"Nie pamiêtam tego.",dia_addon_huno_hi_no);
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Huno handluje wyrobami kowalskimi.");
};

func void dia_addon_huno_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Oczywiœcie, w Starym Obozie.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//W Starym Obozie... racja... to ty jesteœ tym wœcibskim goœciem... myœla³em, ¿e nie ¿yjesz.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//Có¿, wszyscy tak s¹dzili. Kto jeszcze prze¿y³?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//Paru ludzi. Niektórzy uciekli z Krukiem, tak jak ja. Wielu zginê³o w obozie.
	Info_ClearChoices(dia_addon_huno_hi);
	KNOWS_FLUCHT = TRUE;
};

func void dia_addon_huno_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//Nie pamiêtam tego.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hmm... Sam mam w g³owie mêtlik... Szlag by to trafi³...
	Info_ClearChoices(dia_addon_huno_hi);
};


instance DIA_ADDON_HUNO_BLITZ(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 2;
	condition = dia_addon_huno_blitz_condition;
	information = dia_addon_huno_blitz_info;
	permanent = FALSE;
	description = "Opowiedz mi o ucieczce.";
};


func int dia_addon_huno_blitz_condition()
{
	if((KNOWS_FLUCHT == TRUE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_blitz_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Opowiedz mi o ucieczce.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//Kiedy przesta³a istnieæ bariera, zapanowa³ chaos.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Niektórzy siê ukryli – inni uciekli, a wszystko zosta³o spl¹drowane.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//Co zrobi³eœ?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//Próbowa³em uciec z obozu, gdy nagle zrobi³o siê strasznie jasno i poczu³em straszliwy ból.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//Trafi³ mnie cholerny piorun! Ci¹gle mi siê zdaje, ¿e go s³yszê...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//PóŸniej dowiedzia³em siê, ¿e znalaz³ mnie Thorus i zabra³ ze sob¹.
};


var int huno_armorperm;

instance DIA_ADDON_HUNO_ARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_armor_condition;
	information = dia_addon_huno_armor_info;
	permanent = TRUE;
	description = "Potrzebujê lepszej zbroi.";
};


func int dia_addon_huno_armor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_hi) && (HUNO_ARMORPERM == FALSE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_armor_info()
{
	Info_ClearChoices(dia_addon_huno_armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//Potrzebujê lepszej zbroi.
	if(HUNO_ARMORCHEAP == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//Có¿ – mo¿esz j¹ mieæ. To, ¿e jest taka droga, to wina Estebana.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//Ten parszywy pies œci¹ga haracz z ka¿dej sprzedanej przeze mnie zbroi.
		BDT_ARMOR_H_VALUE = 2100;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Kup ciê¿k¹ zbrojê bandytów. Ochrona (broñ i strza³y) 45, 2100 sztuk z³ota.",dia_addon_huno_armor_buy);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Fisk powiedzia³, ¿e sprzedasz mi j¹ po dobrej cenie.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Fisk, powiadasz... Hmm, dobrze, jestem mu winien przys³ugê.
		BDT_ARMOR_H_VALUE = 1400;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		Info_AddChoice(dia_addon_huno_armor,"Kup ciê¿k¹ zbrojê bandytów. Ochrona (broñ i strza³y) 45, 1400 sztuk z³ota.",dia_addon_huno_armor_buy);
	};
};

func void dia_addon_huno_armor_back()
{
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Dobra, biorê zbrojê.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_H_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Wygl¹da nieŸle.
		b_giveinvitems(self,other,itar_bdt_h,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//Nie ma z³ota, nie ma zbroi.
	};
	if(BDT_ARMOR_H_VALUE < 2100)
	{
		HUNO_ARMORPERM = TRUE;
	};
	Info_ClearChoices(dia_addon_huno_armor);
};


instance DIA_ADDON_HUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_attentat_condition;
	information = dia_addon_huno_attentat_info;
	permanent = FALSE;
	description = "A co do próby zabójstwa Estebana...";
};


func int dia_addon_huno_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_huno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//Czego ode mnie chcesz?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//Szukam osoby, która zleci³a zabójstwo...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//I przyszed³eœ z tym do mnie?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//Myœla³em, ¿e mo¿esz coœ wiedzieæ na ten temat.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//Ale nie wiem!
};


var int huno_nochmal;
var int huno_somethings_perm;
var int huno_counter;

func void b_addon_huno_stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//A teraz s³uchaj! Zabieraj st¹d swój ty³ek, zanim przestanê nad sob¹ panowaæ!
	HUNO_ANGEPISST = TRUE;
};


instance DIA_ADDON_HUNO_SOMETHINGS(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_somethings_condition;
	information = dia_addon_huno_somethings_info;
	permanent = TRUE;
	description = "S³ysza³em trochê ciekawych rzeczy na twój temat...";
};


func int dia_addon_huno_somethings_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_attentat) && (HUNO_SOMETHINGS_PERM == FALSE) && ((FINN_TELLALL == TRUE) || (PAUL_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_huno_somethings_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//S³ysza³em trochê ciekawych rzeczy na twój temat...
	if(HUNO_NOCHMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//Hê?
		HUNO_NOCHMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Znowu zaczynasz? Mam nadziejê, ¿e tym razem to coœ wa¿nego...
	};
	HUNO_COUNTER = 0;
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//Podobno w momencie zamachu nie by³o ciê na stanowisku!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//Tak?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(PAUL_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul powiedzia³, ¿e nienawidzisz Estebana.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//Czy¿by? Coœ jeszcze?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(EMILIO_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio zdradzi³ twoje imiê! Na pewno wiesz coœ na temat próby zabójstwa!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//A wiêc porozmawia³eœ sobie ze starym Emiliem, co?
		if(HUNO_COUNTER > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//Nie tylko on ciebie podejrzewa.
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//Jak to?
			HUNO_SOMETHINGS_PERM = TRUE;
			Info_ClearChoices(dia_addon_huno_somethings);
			Info_AddChoice(dia_addon_huno_somethings,"Chcê siê dogadaæ ze zleceniodawc¹ zabójstwa!",dia_addon_huno_somethings_contra);
			Info_AddChoice(dia_addon_huno_somethings,"Jeœli stoisz za t¹ prób¹ zabójstwa, to zap³acisz za to!",dia_addon_huno_somethings_pro);
			b_logentry(TOPIC_ADDON_ESTEBAN,"Wygl¹da na to, ¿e trzymam Huna w szachu.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//Mo¿e te¿ powinienem z nim porozmawiaæ. Jestem pewien, ¿e to pomo¿e mu zmieniæ zdanie!
			b_addon_huno_stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nic wiêcej...
		b_addon_huno_stress();
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_huno_somethings_pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//Jeœli stoisz za t¹ prób¹ zabójstwa, to zap³acisz za to!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//Jesteœ idiot¹! Naprawdê zamierzasz podlizywaæ siê Estebanowi?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Spadaj st¹d!
	HUNO_MEGA_ANGEPISST = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//Chcê siê dogadaæ ze zleceniodawc¹ zabójstwa!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//Wyst¹pisz przeciwko Estebanowi? Naprawdê? Wiêc to udowodnij!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//Zbyt d³ugo ju¿ czekam na dostawê stali od piratów.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//Domyœlam siê, ¿e przej¹³ j¹ Esteban. Chce sprzedaæ mi stal po wy¿szej cenie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Oczywiœcie sam nie brudzi sobie tym r¹k. Ma na us³ugach paru bandytów z bagna.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//Sk¹d o tym wiesz?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Pijani bandyci du¿o mówi¹...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Ten gadatliwy bandyta ma jakieœ imiê?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//Nie powinno ciê to obchodziæ. Ale goœæ, którego SZUKASZ, nazywa siê Juan. Jednak od dawna nie widzia³em go w obozie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//Bêdziesz musia³ poszukaæ go na bagnie.
	MIS_HUNO_STAHL = LOG_RUNNING;
	HUNO_ANGEPISST = FALSE;
	Log_CreateTopic(TOPIC_ADDON_HUNO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HUNO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HUNO,"Huno czeka na dostawê stali od piratów. S¹dzi, ¿e na rozkaz Estebana przechwyci³ j¹ niejaki Juan, który ukrywa siê gdzieœ na bagnie.");
	Info_ClearChoices(dia_addon_huno_somethings);
	Info_AddChoice(dia_addon_huno_somethings,"Najpierw powiesz mi, kto zleci³ zabójstwo!",dia_addon_huno_somethings_tellmenow);
	Info_AddChoice(dia_addon_huno_somethings,"W porz¹dku, zrobiê to dla ciebie!",dia_addon_huno_somethings_mission);
};

func void dia_addon_huno_somethings_mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//W porz¹dku, zrobiê to dla ciebie!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Dobrze. Zobaczymy, czy mogê ci zaufaæ.
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_tellmenow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//Najpierw powiesz mi, kto zleci³ zabójstwo!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//Nie. Nie ufam ci.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Uwa¿aj. Nastêpn¹ rozmowê odbêdê albo z nim, albo z Estebanem.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//To zale¿y od ciebie.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//W takim razie dobrze! Zaaran¿ujê twoje spotkanie ze zleceniodawc¹. Ale na moich zasadach, zrozumiano?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//IdŸ do knajpy i porozmawiaj z ober¿yst¹. On powie ci, co robiæ dalej.
	HUNO_ZUSNAF = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno powiedzia³ mi, ¿ebym zamieni³ s³ówko ze Snafem.");
};


instance DIA_ADDON_HUNO_PAKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_paket_condition;
	information = dia_addon_huno_paket_info;
	permanent = FALSE;
	description = "Mam stal.";
};


func int dia_addon_huno_paket_condition()
{
	if((MIS_HUNO_STAHL == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_steel_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_huno_paket_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//Mam stal.
	b_giveinvitems(other,self,itmi_addon_steel_paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//I co? Juan te¿ tam by³?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//Wiedzia³em! Za wszystkim sta³ ten szczur, Esteban.
	if(HUNO_ZUSNAF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//Jesteœ w porz¹dku. Jeœli mam byæ szczery, nie spodziewa³em siê tego.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Proszê, oto twoja nagroda.
		b_giveinvitems(self,other,itmi_gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//Co bêdzie teraz z nasz¹ umow¹?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//Cz³owiek, którego szukasz, czeka na ciebie w knajpie. Porozmawiaj z ober¿yst¹.
		HUNO_ZUSNAF = TRUE;
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno powiedzia³ mi, ¿ebym zamieni³ s³ówko ze Snafem.");
	MIS_HUNO_STAHL = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HUNOSTAHL);
};


instance DIA_ADDON_HUNO_TRADE(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 888;
	condition = dia_addon_huno_trade_condition;
	information = dia_addon_huno_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_huno_trade_condition()
{
	if(HUNO_ANGEPISST == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_huno_trade_info()
{
	b_say(other,self,"$TRADE_3");
	b_givetradeinv(self);
};

