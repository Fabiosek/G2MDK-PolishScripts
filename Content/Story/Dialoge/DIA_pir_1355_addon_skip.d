
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
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//A kogó¿ to stary Skip znowu widzi!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//Ja ciê znam!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Zatoka ko³o miasta, pamiêtasz?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip? To ty?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//Jak widaæ, trudno mnie zapomnieæ.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale wydaje mi siê, ¿e jeszcze gdzieœ ciê widzia³em...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//A, no tak!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Rysownik siê nie popisa³, ale to by³eœ ty.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Ale nie ma o czym gadaæ. Na swoim liœcie goñczym te¿ wygl¹dam doœæ szpetnie.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SKIPADW_BALTRAMPAKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 2;
	condition = dia_addon_skipadw_baltrampaket_condition;
	information = dia_addon_skipadw_baltrampaket_info;
	description = "Mam dla ciebie paczkê od Baltrama.";
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
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//Mam dla ciebie paczkê od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//Chyba naprawdê potrzebuje rumu, bo po co wysy³a³by towar w taki sposób?
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Oto dwie butelki rumu. Niestety, trzeci¹ opró¿ni³em, czekaj¹c tu na niego.
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
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Wróci³em z Khorinis i czekam na powrót kapitana Grega.
};


instance DIA_ADDON_SKIP_ADW_GREGGETROFFEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 4;
	condition = dia_addon_skip_adw_greggetroffen_condition;
	information = dia_addon_skip_adw_greggetroffen_info;
	description = "Widzia³em Grega w Khorinis.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Widzia³em Grega w Khorinis.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Naprawdê? Niech to diabli! Coœ musia³o pójœæ naprawdê Ÿle!
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Powinien ju¿ dawno wróciæ z naszym statkiem.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//Najlepiej bêdzie, jeœli wrócê do Khorinis i poczekam tam na niego...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//Ale nie dzisiaj. Dopiero co wróci³em.
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
	description = "Mo¿esz mnie zabraæ do Khorinis?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Mo¿esz mnie zabraæ do Khorinis?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Nie. Wyruszam póŸniej. Najpierw muszê odpocz¹æ i napiæ siê grogu.
	}
	else if(SKIP_TRANSPORT_VARIATION == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zwariowa³eœ? Straciliœmy nasz statek, rozumiesz?
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nie mam zamiaru u¿ywaæ naszej ostatniej ³odzi, aby przewieŸæ kogoœ, komu nie chce siê ruszyæ ty³ka!
		SKIP_TRANSPORT_VARIATION = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Ile razy mam powtarzaæ? Nie!
	};
};


instance DIA_ADDON_SKIP_BANDITS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_bandits_condition;
	information = dia_addon_skip_bandits_info;
	description = "Co mo¿esz mi powiedzieæ o bandytach?";
};


func int dia_addon_skip_bandits_condition()
{
	return TRUE;
};

func void dia_addon_skip_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mo¿esz mi powiedzieæ o bandytach?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Bandytach? Napadaj¹ nas, ot co!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Niby po co wznosimy tê palisadê?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//To my ich tu przywieŸliœmy.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Nawet z nimi handlowaliœmy. ¯ebyœ wiedzia³, ile oni maj¹ z³ota! Ca³e krocie, mówiê ci!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Byli gotowi p³aciæ ka¿d¹ cenê za beczkê rumu.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale to ju¿ nale¿y do przesz³oœci. Teraz trwa wojna!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co siê sta³o?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ci dranie nie zap³acili nam za ostatni¹ dostawê.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//A wiêc poszed³em do nich, ¿eby dostaæ swoje z³oto.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Kiedy tylko wszed³em na bagna, ci obwiesie rzucili siê na mnie!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//Co gorsza, za³atwili Angusa i Hanka - dwóch naszych najlepszych ¿eglarzy!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Nie zapuszczaj siê na bagna, mówiê ci.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Atakuj¹ ka¿dego, kto wygl¹da inaczej ni¿ oni!
};


instance DIA_ADDON_SKIP_ARMORPRICE(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_armorprice_condition;
	information = dia_addon_skip_armorprice_info;
	description = "Potrzebny mi pancerz bandytów.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Potrzebny mi pancerz bandytów.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Chcesz tam iœæ? Odbi³o ci do reszty.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Kiedy bandyci odkryj¹, ¿e nie jesteœ jednym z nich, nakarmi¹ tob¹ wê¿e b³otne.
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Wiesz, gdzie móg³bym znaleŸæ taki pancerz?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//Nigdy siê nie poddajesz, co? Dobrze wiêc. Kiedyœ mieliœmy jeden taki.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Mo¿e wci¹¿ le¿y gdzieœ w chacie Grega.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Mo¿e ci go da, jeœli tylko wróci...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Skip podejrzewa, ¿e zbroja jest w chacie Grega.");
};


instance DIA_ADDON_SKIP_GREGSHUT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_gregshut_condition;
	information = dia_addon_skip_gregshut_info;
	permanent = FALSE;
	description = "A jak siê dostaæ do chaty?";
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
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//A jak siê dostaæ do chaty?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Spokojnie, ch³opcze!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Chcesz podwêdziæ coœ, co nale¿y do Grega?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Kiedy kapitan opuszcza³ nasz obóz, poleci³ Francisowi pilnowaæ, aby nikt nie wchodzi³ do jego chaty.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Francis ma klucz do chaty Grega, ale nie wpuœci nikogo do œrodka.");
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_SKIP_FRANCIS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_francis_condition;
	information = dia_addon_skip_francis_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//To nasz skarbnik.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapitan mu bardzo ufa. To dlatego powierzy³ mu zastêpstwo.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//Chocia¿ reszta ch³opaków nie szanuje go zbytnio.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jeœli chcesz wiedzieæ wiêcej, pogadaj z Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Siedzi w ma³ej jaskini, na pó³noc st¹d.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//Samuel wie prawie wszystko o prawie wszystkich.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Powinienem porozmawiaæ z Samuelem. Mo¿e bêdzie móg³ mi daæ jakieœ wskazówki.");
};


instance DIA_ADDON_SKIP_RAVEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_raven_condition;
	information = dia_addon_skip_raven_info;
	permanent = FALSE;
	description = "Spotka³eœ kiedyœ Kruka?";
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
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Spotka³eœ kiedyœ Kruka?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Pewnie. Sta³em wtedy na stra¿y z Henrym. Widzieliœmy, jak Kruk zostawia swoich ludzi w wie¿y stoj¹cej kawa³ek na po³udnie st¹d.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Skoro zostawi³ ich tak blisko, to na pewno maj¹ nas szpiegowaæ.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Widzia³em te¿, jak obchodzi siê z ludŸmi, którzy nie okazuj¹ pos³uszeñstwa.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Kiedy ktoœ poka¿e choæ cieñ niesubordynacji, mo¿e straciæ g³owê.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Uwa¿aj na Kruka, dobrze ci radzê.
};


instance DIA_ADDON_SKIP_ANGUSHANK(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushank_condition;
	information = dia_addon_skip_angushank_info;
	description = "Opowiedz mi coœ wiêcej o Angusie i Hanku.";
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
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Opowiedz mi coœ wiêcej o Angusie i Hanku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus i Hank mieli spotkaæ siê z bandytami poza obozem.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//Mieli ze sob¹ wszystko, co tamci zamówili.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Kut¹ stal, wytrychy i inne takie rzeczy.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Niestety, nie wrócili. Te sukinsyny musia³y ich za³atwiæ!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgan i Bill szukali ich, ale bezskutecznie.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill by³ szczególnie smutny, bo Angus i Hank to jego bliscy przyjaciele.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Jest m³ody i s³abo znosi takie wydarzenia.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Inni przyjêli to ze spokojem. Utrata dóbr nie jest niczym wielkim. Ale ten grog, który nieœli...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//By³o tego ze 20 butelek!
	MIS_ADDON_SKIPSGROG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_SKIPSGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKIPSGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip chce odzyskaæ 20 butelek grogu, które zabrali mu bandyci.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Angus i Hank mieli pohandlowaæ z bandytami. Od tej pory ich nie widziano.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Poszukiwania Morgana i Billa nie przynios³y efektu...");
};


instance DIA_ADDON_SKIP_ANGUSHANKDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankdead_condition;
	information = dia_addon_skip_angushankdead_info;
	permanent = FALSE;
	description = "Jeœli chodzi o Angusa i Hanka...";
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
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//Jeœli chodzi o Angusa i Hanka...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Tak?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Znalaz³em ich.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Nie ¿yj¹.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//A wiêc jednak. Biedni dranie!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Ale nie liczy³em na nic innego.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Powinieneœ zanieœæ te smutne wieœci Billowi, jeœli dot¹d tego nie zrobi³eœ.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale nie wal prosto z mostu. Bill jest jeszcze m³ody.
};


instance DIA_ADDON_SKIP_ANGUSHANKMURDER(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankmurder_condition;
	information = dia_addon_skip_angushankmurder_info;
	permanent = FALSE;
	description = "Wiem, kto zamordowa³ Angusa i Hanka.";
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
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Wiem, kto zamordowa³ Angusa i Hanka.
	if(MIS_ADDON_SKIPSGROG == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//No i dobrze. Ale to im nie zwróci ¿ycia.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Zemsta to z³y sposób na zdobycie ³upów.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Najwa¿niejsze, ¿e odzyska³em swój grog.
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
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Tak, do cholery! To by³ nasz ca³y zapas!
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
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip odzyska³ swoje 20 butelek grogu i jest zadowolony.");
	MIS_ADDON_SKIPSGROG = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_SKIPSGROG);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Niech mnie kule bij¹! Tak za darmo?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//No có¿...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobrze, zap³acê ci.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Masz mo¿e coœ bardziej interesuj¹cego ni¿ z³oto?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmmm... Pomyœlmy... O, mam pierœcieñ.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Wygra³em go wiele lat temu w koœci w jednej z portowych tawern.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Cz³owiek, który go przegra³, zapewnia³, ¿e pierœcieñ jest magiczny. Ale nigdy nie mia³em okazji sprawdziæ, czy to prawda.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chcesz pierœcieñ czy z³oto?
	Info_ClearChoices(dia_addon_skip_grog);
	Info_AddChoice(dia_addon_skip_grog,"Wezmê pieni¹dze.",dia_addon_skip_grog_gold);
	Info_AddChoice(dia_addon_skip_grog,"Daj mi pierœcieñ.",dia_addon_skip_grog_ring);
};

func void dia_addon_skip_grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Daj mi pierœcieñ.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Proszê bardzo.
	b_giveinvitems(self,other,itri_prot_edge_02,1);
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_gold()
{
	var int grogkohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Wezmê pieni¹dze.
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
	description = "Masz mo¿e coœ do sprzedania?";
};


func int dia_addon_skip_news_condition()
{
	return TRUE;
};

func void dia_addon_skip_news_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Masz mo¿e coœ do sprzedania?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jeœli chcesz pohandlowaæ, to pogadaj z Garrettem. On zajmuje siê naszymi zapasami.
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
	description = "Powinieneœ mi pomóc.";
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
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Powinieneœ mi pomóc.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co jest grane?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Kanion czeka.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Widzê, ¿e zgromadzi³eœ ch³opców. Dobra robota!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Lepiej weŸ paru ch³opaków!
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
	description = "ChodŸ ze mn¹.";
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
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//ChodŸ ze mn¹.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Czekaj. Wróæmy do kanionu.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//No to w drogê!
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
	description = "Nie potrzebujê ju¿ twojej pomocy.";
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
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//No to idê. Znajdziesz mnie w obozie, jakby co.
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
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To wystarczaj¹co daleko!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jeœli naprawdê chcesz iœæ dalej, to bez nas.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jeœli naprawdê chcesz iœæ dalej, to beze mnie.
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Jeœli zostaniemy rozdzieleni, spotkamy siê przy wodzie.
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Orkowie! Nienawidzê tych bestii!
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
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Wygl¹da na to, ¿e pozbyliœmy siê brzytwiaków.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Mo¿emy trochê po³aziæ po okolicy, jeœli chcesz.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Oczywiœcie musimy zostaæ w kanionie.
	AI_StopProcessInfos(self);
};

