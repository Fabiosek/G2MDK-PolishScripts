
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//Czego chcesz?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "Jestem zajêty roznoszeniem kie³bas.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Jestem zajêty roznoszeniem kie³bas.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Dziêkujê. Mam nadziejê, ¿e to nie jest ostatnia kie³basa, jak¹ przyjdzie mi tutaj zjeœæ.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Pope³ni³em wykroczenie przeciw spo³ecznoœci.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Teraz oczekujê, a¿ Najwy¿sza Rada zdecyduje, czy bêdê móg³ pozostaæ w klasztorze.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "Opowiedz mi, co zasz³o.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Opowiedz mi, co zasz³o.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Podczas zamiatania zabra³em z pokoju jednego z magów ksi¹¿kê, aby j¹ póŸniej przeczytaæ.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Mistrz Hyglas oczywiœcie od razu to zauwa¿y³ i poprosi³ mnie o jej zwrot.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Poniewa¿ obawia³em siê kary, powiedzia³em mu, ¿e jej nie mam, ale jeszcze tego samego dnia Mistrz przy³apa³ mnie z ksiêg¹ w mojej komnacie.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Bardzo siê zdenerwowa³ i powiadomi³ Najwy¿sz¹ Radê. Teraz obraduj¹ nad tym, czy pozwoliæ mi tu zostaæ.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Czy mogê ci jakoœ pomóc?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Czy mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Nie, mój los zale¿y jedynie od ³aski Innosa i magów.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hej, czy to prawda, ¿e za¿¹da³eœ Próby Ognia?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Tak. I zamierzam j¹ przejœæ.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Dobrze. Mo¿e bêdê w stanie ci pomóc. Mam tu bardzo przydatny zwój magiczny. Zwój SNU. Zainteresowany?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Nie, nie potrzebujê twojej pomocy.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Czego ¿¹dasz?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"Co mogê z tym zrobiæ?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//Co mogê z tym zrobiæ?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//Przy pomocy tego zaklêcia bêdziesz móg³ uœpiæ na krótki czas ka¿dego, kto posiada wolê s³absz¹ od twojej.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//To mo¿e okazaæ siê niezwykle przydatne, jeœli ktoœ stanie ci na drodze...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//A sk¹d bêdê wiedzia³, czy ktoœ ma wolê s³absz¹ od mojej?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Mo¿esz sobie darowaæ próby uœpienia magów. Ale na wiêkszoœæ nowicjuszy powinno podzia³aæ.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Nie, nie potrzebujê twojej pomocy.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Jeœli zmienisz zdanie, mo¿esz w ka¿dej chwili wróciæ.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Co za to chcesz?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Ka¿dy nowy mag ma prawo do jednego ¿yczenia.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//Jeœli rzeczywiœcie uda ci siê przejœæ Próbê Ognia, mo¿esz sobie za¿yczyæ, aby pozwolono mi zostaæ w klasztorze.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Nie, nie potrzebujê twojej pomocy.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Dobrze, daj mi ten zwój.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Dobrze, daj mi ten zwój.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Powodzenia w czasie próby. Niech ciê Innos prowadzi.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Dyrian da³ mi magiczny zwój snu. Jeœli zostanê magiem, mam siê odwdziêczyæ, zapewniaj¹c mu miejsce w klasztorze.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "Zmieni³em zdanie. Daj mi zaklêcie nasenne.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Zmieni³em zdanie. Daj mi zaklêcie nasenne.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Dobrze, jeœli przejdziesz próbê, bêdziesz móg³ dopilnowaæ, aby pozwolono mi zostaæ w klasztorze.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//Dziêkujê, uratowa³eœ mnie!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//Och - wybacz, Mistrzu - nie chcia³em siê narzucaæ.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//Dziêkujê z ca³ego serca za umo¿liwienie mi pozostania w klasztorze. Od dziœ moje ¿ycie siê zmieni...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Jak leci?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Dobrze. Naprawdê lubiê tê pracê, Mistrzu.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Dziêkujê Innosowi, ¿e mogê przebywaæ tutaj, w klasztorze.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//¯e te¿ w ogóle o to pytasz... Pok³ada³em w tobie wszystkie moje nadzieje, a ty zostawi³eœ mnie na lodzie.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Nic mi ju¿ nie pozosta³o, oprócz alkoholu. I to wszystko twoja wina!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Proszê, oto 5 sztuk z³ota dla ciebie.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"Mogê wszystko wyjaœniæ.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Uwa¿aj, co mówisz.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Proszê, oto 5 sztuk z³ota.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//5 sztuk z³ota? Dajesz mi 5 sztuk z³ota i uwa¿asz, ¿e to wystarczaj¹ca rekompensata za moje zmarnowane ¿ycie?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Zabiorê ca³e twoje z³oto!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Mogê wszystko wyjaœniæ.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//OszczêdŸ sobie naiwnych wymówek.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//K³amiesz za ka¿dym razem, kiedy tylko otwierasz usta. Zostaw mnie w spokoju.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Uwa¿aj, co mówisz.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Bardzo proszê, mo¿esz mi groziæ. Nic ci to nie da.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Powiem ca³emu œwiatu, jaki z ciebie bezduszny, zak³amany drañ! Tylko najpierw skoñczê tê flaszkê...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//ZejdŸ mi z oczu! Brzydzê siê tob¹!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Co tam?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Po prostu zostaw mnie w spokoju! Nie chcê mieæ z tob¹ wiêcej nic wspólnego!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

