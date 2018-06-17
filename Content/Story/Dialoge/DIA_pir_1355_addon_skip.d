
instance DIA_ADDON_SKIP_EXIT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 999;
	condition = dia_addon_skip_exit_condition;
	information = dia_addon_skip_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_PICKPOCKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 900;
	condition = dia_addon_skip_pickpocket_condition;
	information = dia_addon_skip_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_skip_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_skip_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_BACK,dia_addon_skip_pickpocket_back);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_PICKPOCKET,dia_addon_skip_pickpocket_doit);
};

func void dia_addon_skip_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_skip_pickpocket);
};

func void dia_addon_skip_pickpocket_back()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
};


instance DIA_ADDON_SKIP_HELLO(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_hello_condition;
	information = dia_addon_skip_hello_info;
	important = TRUE;
};


func int dia_addon_skip_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PLAYERTALKEDTOSKIPNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//A kog� to stary Skip znowu widzi!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//Ja ci� znam!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Zatoka ko�o miasta, pami�tasz?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip? To ty?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//Jak wida�, trudno mnie zapomnie�.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale wydaje mi si�, �e jeszcze gdzie� ci� widzia�em...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//A, no tak!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Rysownik si� nie popisa�, ale to by�e� ty.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Ale nie ma o czym gada�. Na swoim li�cie go�czym te� wygl�dam do�� szpetnie.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SKIPADW_BALTRAMPAKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 2;
	condition = dia_addon_skipadw_baltrampaket_condition;
	information = dia_addon_skipadw_baltrampaket_info;
	description = "Mam dla ciebie paczk� od Baltrama.";
};


func int dia_addon_skipadw_baltrampaket_condition()
{
	if(Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skipadw_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//Mam dla ciebie paczk� od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//Chyba naprawd� potrzebuje rumu, bo po co wysy�a�by towar w taki spos�b?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Oto dwie butelki rumu. Niestety, trzeci� opr�ni�em, czekaj�c tu na niego.
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_JOB(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 3;
	condition = dia_addon_skip_job_condition;
	information = dia_addon_skip_job_info;
	description = "Co tu robisz?";
};


func int dia_addon_skip_job_condition()
{
	return TRUE;
};

func void dia_addon_skip_job_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Wr�ci�em z Khorinis i czekam na powr�t kapitana Grega.
};


instance DIA_ADDON_SKIP_ADW_GREGGETROFFEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 4;
	condition = dia_addon_skip_adw_greggetroffen_condition;
	information = dia_addon_skip_adw_greggetroffen_info;
	description = "Widzia�em Grega w Khorinis.";
};


func int dia_addon_skip_adw_greggetroffen_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (GREGISBACK == FALSE) && Npc_KnowsInfo(other,dia_addon_skip_job))
	{
		return TRUE;
	};
};

func void dia_addon_skip_adw_greggetroffen_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Widzia�em Grega w Khorinis.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Naprawd�? Niech to diabli! Co� musia�o p�j�� naprawd� �le!
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Powinien ju� dawno wr�ci� z naszym statkiem.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//Najlepiej b�dzie, je�li wr�c� do Khorinis i poczekam tam na niego...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//Ale nie dzisiaj. Dopiero co wr�ci�em.
	b_giveplayerxp(XP_AMBIENT);
};


var int skip_transport_variation;

instance DIA_ADDON_SKIP_TRANSPORT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 99;
	condition = dia_addon_skip_transport_condition;
	information = dia_addon_skip_transport_info;
	permanent = TRUE;
	description = "Mo�esz mnie zabra� do Khorinis?";
};


func int dia_addon_skip_transport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_transport_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Mo�esz mnie zabra� do Khorinis?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Nie. Wyruszam p�niej. Najpierw musz� odpocz�� i napi� si� grogu.
	}
	else if(SKIP_TRANSPORT_VARIATION == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zwariowa�e�? Stracili�my nasz statek, rozumiesz?
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nie mam zamiaru u�ywa� naszej ostatniej �odzi, aby przewie�� kogo�, komu nie chce si� ruszy� ty�ka!
		SKIP_TRANSPORT_VARIATION = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Ile razy mam powtarza�? Nie!
	};
};


instance DIA_ADDON_SKIP_BANDITS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_bandits_condition;
	information = dia_addon_skip_bandits_info;
	description = "Co mo�esz mi powiedzie� o bandytach?";
};


func int dia_addon_skip_bandits_condition()
{
	return TRUE;
};

func void dia_addon_skip_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mo�esz mi powiedzie� o bandytach?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandytach? Napadaj� nas, ot co!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Niby po co wznosimy t� palisad�?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//To my ich tu przywie�li�my.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Nawet z nimi handlowali�my. �eby� wiedzia�, ile oni maj� z�ota! Ca�e krocie, m�wi� ci!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli gotowi p�aci� ka�d� cen� za beczk� rumu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale to ju� nale�y do przesz�o�ci. Teraz trwa wojna!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co si� sta�o?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ci dranie nie zap�acili nam za ostatni� dostaw�.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//A wi�c poszed�em do nich, �eby dosta� swoje z�oto.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Kiedy tylko wszed�em na bagna, ci obwiesie rzucili si� na mnie!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//Co gorsza, za�atwili Angusa i Hanka - dw�ch naszych najlepszych �eglarzy!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Nie zapuszczaj si� na bagna, m�wi� ci.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Atakuj� ka�dego, kto wygl�da inaczej ni� oni!
};


instance DIA_ADDON_SKIP_ARMORPRICE(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_armorprice_condition;
	information = dia_addon_skip_armorprice_info;
	description = "Potrzebny mi pancerz bandyt�w.";
};


func int dia_addon_skip_armorprice_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_armorprice_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Potrzebny mi pancerz bandyt�w.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Chcesz tam i��? Odbi�o ci do reszty.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Kiedy bandyci odkryj�, �e nie jeste� jednym z nich, nakarmi� tob� w�e b�otne.
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Wiesz, gdzie m�g�bym znale�� taki pancerz?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//Nigdy si� nie poddajesz, co? Dobrze wi�c. Kiedy� mieli�my jeden taki.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Mo�e wci�� le�y gdzie� w chacie Grega.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Mo�e ci go da, je�li tylko wr�ci...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Skip podejrzewa, �e zbroja jest w chacie Grega.");
};


instance DIA_ADDON_SKIP_GREGSHUT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_gregshut_condition;
	information = dia_addon_skip_gregshut_info;
	permanent = FALSE;
	description = "A jak si� dosta� do chaty?";
};


func int dia_addon_skip_gregshut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_armorprice) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_gregshut_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//A jak si� dosta� do chaty?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Spokojnie, ch�opcze!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chcesz podw�dzi� co�, co nale�y do Grega?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Kiedy kapitan opuszcza� nasz ob�z, poleci� Francisowi pilnowa�, aby nikt nie wchodzi� do jego chaty.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Francis ma klucz do chaty Grega, ale nie wpu�ci nikogo do �rodka.");
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_SKIP_FRANCIS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_francis_condition;
	information = dia_addon_skip_francis_info;
	permanent = FALSE;
	description = "Co mo�esz mi powiedzie� o Francisie?";
};


func int dia_addon_skip_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_gregshut))
	{
		return TRUE;
	};
};

func void dia_addon_skip_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mo�esz mi powiedzie� o Francisie?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//To nasz skarbnik.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapitan mu bardzo ufa. To dlatego powierzy� mu zast�pstwo.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//Chocia� reszta ch�opak�w nie szanuje go zbytnio.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Je�li chcesz wiedzie� wi�cej, pogadaj z Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Siedzi w ma�ej jaskini, na p�noc st�d.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//Samuel wie prawie wszystko o prawie wszystkich.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Powinienem porozmawia� z Samuelem. Mo�e b�dzie m�g� mi da� jakie� wskaz�wki.");
};


instance DIA_ADDON_SKIP_RAVEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_raven_condition;
	information = dia_addon_skip_raven_info;
	permanent = FALSE;
	description = "Spotka�e� kiedy� Kruka?";
};


func int dia_addon_skip_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Spotka�e� kiedy� Kruka?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Pewnie. Sta�em wtedy na stra�y z Henrym. Widzieli�my, jak Kruk zostawia swoich ludzi w wie�y stoj�cej kawa�ek na po�udnie st�d.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Skoro zostawi� ich tak blisko, to na pewno maj� nas szpiegowa�.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Widzia�em te�, jak obchodzi si� z lud�mi, kt�rzy nie okazuj� pos�usze�stwa.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Kiedy kto� poka�e cho� cie� niesubordynacji, mo�e straci� g�ow�.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Uwa�aj na Kruka, dobrze ci radz�.
};


instance DIA_ADDON_SKIP_ANGUSHANK(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushank_condition;
	information = dia_addon_skip_angushank_info;
	description = "Opowiedz mi co� wi�cej o Angusie i Hanku.";
};


func int dia_addon_skip_angushank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushank_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Opowiedz mi co� wi�cej o Angusie i Hanku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus i Hank mieli spotka� si� z bandytami poza obozem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//Mieli ze sob� wszystko, co tamci zam�wili.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Kut� stal, wytrychy i inne takie rzeczy.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Niestety, nie wr�cili. Te sukinsyny musia�y ich za�atwi�!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgan i Bill szukali ich, ale bezskutecznie.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill by� szczeg�lnie smutny, bo Angus i Hank to jego bliscy przyjaciele.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Jest m�ody i s�abo znosi takie wydarzenia.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Inni przyj�li to ze spokojem. Utrata d�br nie jest niczym wielkim. Ale ten grog, kt�ry nie�li...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//By�o tego ze 20 butelek!
	MIS_ADDON_SKIPSGROG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_SKIPSGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKIPSGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip chce odzyska� 20 butelek grogu, kt�re zabrali mu bandyci.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Angus i Hank mieli pohandlowa� z bandytami. Od tej pory ich nie widziano.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Poszukiwania Morgana i Billa nie przynios�y efektu...");
};


instance DIA_ADDON_SKIP_ANGUSHANKDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankdead_condition;
	information = dia_addon_skip_angushankdead_info;
	permanent = FALSE;
	description = "Je�li chodzi o Angusa i Hanka...";
};


func int dia_addon_skip_angushankdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && !Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankdead_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//Je�li chodzi o Angusa i Hanka...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Tak?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Znalaz�em ich.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Nie �yj�.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//A wi�c jednak. Biedni dranie!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Ale nie liczy�em na nic innego.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Powiniene� zanie�� te smutne wie�ci Billowi, je�li dot�d tego nie zrobi�e�.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale nie wal prosto z mostu. Bill jest jeszcze m�ody.
};


instance DIA_ADDON_SKIP_ANGUSHANKMURDER(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankmurder_condition;
	information = dia_addon_skip_angushankmurder_info;
	permanent = FALSE;
	description = "Wiem, kto zamordowa� Angusa i Hanka.";
};


func int dia_addon_skip_angushankmurder_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushankdead) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Wiem, kto zamordowa� Angusa i Hanka.
	if(MIS_ADDON_SKIPSGROG == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//No i dobrze. Ale to im nie zwr�ci �ycia.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Zemsta to z�y spos�b na zdobycie �up�w.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Najwa�niejsze, �e odzyska�em sw�j grog.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Morderca mnie nie obchodzi! Co z moim grogiem?
	};
};


instance DIA_ADDON_SKIP_GROG(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 9;
	condition = dia_addon_skip_grog_condition;
	information = dia_addon_skip_grog_info;
	permanent = TRUE;
	description = "W sprawie grogu...";
};


func int dia_addon_skip_grog_condition()
{
	if(MIS_ADDON_SKIPSGROG == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//W sprawie grogu...
	if(Npc_HasItems(other,itfo_addon_grog) >= 20)
	{
		Info_ClearChoices(dia_addon_skip_grog);
		Info_AddChoice(dia_addon_skip_grog,DIALOG_BACK,dia_addon_skip_grog_back);
		Info_AddChoice(dia_addon_skip_grog,"Oto twoje 20 flaszek.",dia_addon_skip_grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Brakuje 20 butelek, tak?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Tak, do cholery! To by� nasz ca�y zapas!
	};
};

func void dia_addon_skip_grog_back()
{
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Oto twoje 20 flaszek.
	b_giveinvitems(other,self,itfo_addon_grog,20);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip odzyska� swoje 20 butelek grogu i jest zadowolony.");
	MIS_ADDON_SKIPSGROG = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_SKIPSGROG);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Niech mnie kule bij�! Tak za darmo?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//No c�...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobrze, zap�ac� ci.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Masz mo�e co� bardziej interesuj�cego ni� z�oto?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmmm... Pomy�lmy... O, mam pier�cie�.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Wygra�em go wiele lat temu w ko�ci w jednej z portowych tawern.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Cz�owiek, kt�ry go przegra�, zapewnia�, �e pier�cie� jest magiczny. Ale nigdy nie mia�em okazji sprawdzi�, czy to prawda.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chcesz pier�cie� czy z�oto?
	Info_ClearChoices(dia_addon_skip_grog);
	Info_AddChoice(dia_addon_skip_grog,"Wezm� pieni�dze.",dia_addon_skip_grog_gold);
	Info_AddChoice(dia_addon_skip_grog,"Daj mi pier�cie�.",dia_addon_skip_grog_ring);
};

func void dia_addon_skip_grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Daj mi pier�cie�.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Prosz� bardzo.
	b_giveinvitems(self,other,itri_prot_edge_02,1);
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_gold()
{
	var int grogkohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Wezm� pieni�dze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Nie ma sprawy.
	grogkohle = VALUE_GROG * 20;
	b_giveinvitems(self,other,itmi_gold,grogkohle);
	Info_ClearChoices(dia_addon_skip_grog);
};


instance DIA_ADDON_SKIP_NEWS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 888;
	condition = dia_addon_skip_news_condition;
	information = dia_addon_skip_news_info;
	permanent = FALSE;
	description = "Masz mo�e co� do sprzedania?";
};


func int dia_addon_skip_news_condition()
{
	return TRUE;
};

func void dia_addon_skip_news_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Masz mo�e co� do sprzedania?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Je�li chcesz pohandlowa�, to pogadaj z Garrettem. On zajmuje si� naszymi zapasami.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_SKIP_ANHEUERN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 11;
	condition = dia_addon_skip_anheuern_condition;
	information = dia_addon_skip_anheuern_info;
	permanent = FALSE;
	description = "Powiniene� mi pom�c.";
};


func int dia_addon_skip_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Powiniene� mi pom�c.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co jest grane?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Kanion czeka.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Widz�, �e zgromadzi�e� ch�opc�w. Dobra robota!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Lepiej we� paru ch�opak�w!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Kanion jest bardzo niebezpieczny.
};


instance DIA_ADDON_SKIP_COMEON(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 12;
	condition = dia_addon_skip_comeon_condition;
	information = dia_addon_skip_comeon_info;
	permanent = TRUE;
	description = "Chod� ze mn�.";
};


func int dia_addon_skip_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_skip_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_skip_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Chod� ze mn�.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Czekaj. Wr��my do kanionu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//No to w drog�!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SKIP_GOHOME(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 13;
	condition = dia_addon_skip_gohome_condition;
	information = dia_addon_skip_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebuj� ju� twojej pomocy.";
};


func int dia_addon_skip_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Nie potrzebuj� ju� twojej pomocy.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//No to id�. Znajdziesz mnie w obozie, jakby co.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SKIP_TOOFAR(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 14;
	condition = dia_addon_skip_toofar_condition;
	information = dia_addon_skip_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skip_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To wystarczaj�co daleko!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Je�li naprawd� chcesz i�� dalej, to bez nas.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Je�li naprawd� chcesz i�� dalej, to beze mnie.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_TREFFPUNKT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_treffpunkt_condition;
	information = dia_addon_skip_treffpunkt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_treffpunkt_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (c_allcanyonrazordead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_treffpunkt_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Je�li zostaniemy rozdzieleni, spotkamy si� przy wodzie.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Idziemy!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ORKS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_orks_condition;
	information = dia_addon_skip_orks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_orks_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_skip_orks_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Orkowie! Nienawidz� tych bestii!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ALLRAZORSDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_allrazorsdead_condition;
	information = dia_addon_skip_allrazorsdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_allrazorsdead_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_allcanyonrazordead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_allrazorsdead_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Wygl�da na to, �e pozbyli�my si� brzytwiak�w.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Mo�emy troch� po�azi� po okolicy, je�li chcesz.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Oczywi�cie musimy zosta� w kanionie.
	AI_StopProcessInfos(self);
};

