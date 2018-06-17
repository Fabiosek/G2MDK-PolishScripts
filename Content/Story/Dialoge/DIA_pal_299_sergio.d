
instance DIA_SERGIO_EXIT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 999;
	condition = dia_sergio_exit_condition;
	information = dia_sergio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sergio_exit_condition()
{
	return TRUE;
};

func void dia_sergio_exit_info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Niech Innos oœwietla œcie¿kê, po której kroczysz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_WELCOME(C_INFO)
{
	npc = pal_299_sergio;
	nr = 5;
	condition = dia_sergio_welcome_condition;
	information = dia_sergio_welcome_info;
	important = TRUE;
};


func int dia_sergio_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,dia_sergio_isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_welcome_info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Innos z tob¹, s³ucham, co mogê dla ciebie zrobiæ?
};


instance DIA_SERGIO_ISGAROTH(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_isgaroth_condition;
	information = dia_sergio_isgaroth_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_isgaroth_condition()
{
	if(Npc_KnowsInfo(hero,pc_prayshrine_paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_sergio_isgaroth_info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Modli³eœ siê za mych braci. Serdecznie ci za to dziêkujê. Co mogê dla ciebie zrobiæ?
	Info_ClearChoices(dia_sergio_isgaroth);
	Info_AddChoice(dia_sergio_isgaroth,"Mo¿e ma³y datek?",dia_sergio_isgaroth_spende);
	Info_AddChoice(dia_sergio_isgaroth,"Podziel siê ze mn¹ swoim doœwiadczeniem i wiedz¹ na temat walki.",dia_sergio_isgaroth_xp);
};

func void dia_sergio_isgaroth_spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Mo¿e ma³y datek?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Niech to z³oto dobrze ci s³u¿y.
	b_giveinvitems(self,other,itmi_gold,100);
	Info_ClearChoices(dia_sergio_isgaroth);
};

func void dia_sergio_isgaroth_xp()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Podziel siê ze mn¹ swoim doœwiadczeniem i wiedz¹ na temat walki.
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Kiedy walczysz, zawsze pamiêtaj, by chroniæ siê przed atakiem z ty³u.
	other.hitchance[NPC_TALENT_2H] = other.hitchance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_sergio_isgaroth);
};


instance DIA_SERGIO_AUFGABE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_aufgabe_condition;
	information = dia_sergio_aufgabe_info;
	description = "Chcê skorzystaæ z biblioteki.";
};


func int dia_sergio_aufgabe_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_sergio_isgaroth))
	{
		return TRUE;
	};
};

func void dia_sergio_aufgabe_info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Chcê skorzystaæ z biblioteki.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//Obawiam siê, ¿e to niemo¿liwe. Najpierw musisz wykonaæ przydzielone ci zadania.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Mogê ci jednak pomóc. Udaj siê do Mistrza Isgarotha i porozmawiaj z nim. S³ysza³em, ¿e potrzebuje pomocy, sam mia³em siê tym zaj¹æ, ale chyba mogê ci zaufaæ.
	SERGIO_SENDS = TRUE;
	Wld_InsertNpc(blackwolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(TOPIC_ISGAROTHWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ISGAROTHWOLF,LOG_RUNNING);
	b_logentry(TOPIC_ISGAROTHWOLF,"Mistrz Isgaroth potrzebuje pomocy w kaplicy. Powinienem siê z nim spotkaæ.");
};


instance DIA_SERGIO_WHAT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_what_condition;
	information = dia_sergio_what_info;
	description = "Co tu porabiasz?";
};


func int dia_sergio_what_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_sergio_what_info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Co porabiasz?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Modlê siê do Innosa, by wzmocni³ me ramiê i wolê.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Dziêki temu, niestraszni mi wrogowie, pokonujê ich, oddaj¹c czeœæ Innosowi.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//O jakich wrogach mówisz?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//O wszystkich tych, którzy sprzeciwiaj¹ siê woli Innosa. Niewa¿ne czy s¹ ludŸmi, czy demonami z piek³a rodem.
};


instance DIA_SERGIO_BABO(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_babo_condition;
	information = dia_sergio_babo_info;
	description = "Móg³byœ poæwiczyæ trochê z Babo?";
};


func int dia_sergio_babo_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_anliegen))
	{
		return TRUE;
	};
};

func void dia_sergio_babo_info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Móg³byœ poæwiczyæ trochê z Babo?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//Dlaczego sam nie przyjdzie i o to nie zapyta?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Chyba jest nieœmia³y.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Rozumiem. Dobrze, skoro to tyle dla niego znaczy, bêdê go trenowa³, codziennie rano po dwie godziny. Przeka¿ mu, ¿e zaczynamy o pi¹tej.
	Npc_ExchangeRoutine(self,"TRAIN");
	b_startotherroutine(babo,"TRAIN");
	b_logentry(TOPIC_BABOTRAIN,"Sergio zgodzi³ siê trenowaæ z Babo ka¿dego dnia przez dwie godziny.");
};


instance DIA_SERGIO_WHY(C_INFO)
{
	npc = pal_299_sergio;
	nr = 4;
	condition = dia_sergio_why_condition;
	information = dia_sergio_why_info;
	description = "Dlaczego nie przebywasz z pozosta³ymi paladynami?";
};


func int dia_sergio_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_welcome) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_why_info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Dlaczego nie przebywasz z pozosta³ymi paladynami?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//To, ¿e tu jestem, mo¿e siê wydawaæ dziwne, jednak my, paladyni, s³u¿ymy tak¿e magom, gdy¿ i oni, tak jak my, czcz¹ Innosa.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//My, paladyni, walczymy w imiê Innosa. Jego wola jest naszym prawem. W tej chwili oczekujê na rozkazy od magów.
};


instance DIA_SERGIO_ORDERS(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_orders_condition;
	information = dia_sergio_orders_info;
	permanent = TRUE;
	description = "Dosta³eœ ju¿ nowe rozkazy?";
};


func int dia_sergio_orders_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_why) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_orders_info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//Dosta³eœ ju¿ nowe rozkazy?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//W tej chwili muszê siê staraæ odnaleŸæ si³ê w modlitwie.
};


instance DIA_SERGIO_START(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_start_condition;
	information = dia_sergio_start_info;
	permanent = FALSE;
	description = "Masz mnie eskortowaæ do prze³êczy.";
};


func int dia_sergio_start_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (SERGIO_FOLLOW == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_start_info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//Masz mnie eskortowaæ do prze³êczy.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Dobrze, uczyniê to. Znam drogê, chodŸ za mn¹.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_SERGIO_GUIDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_guide_condition;
	information = dia_sergio_guide_info;
	permanent = TRUE;
	description = "Idziemy?";
};


func int dia_sergio_guide_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_guide_info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Jak leci?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Zabiorê ciê do prze³êczy. Jednak niebezpieczna czêœæ podró¿y dopiero tam siê rozpocznie.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//Nie marnujmy jednak czasu.
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_ENDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_ende_condition;
	information = dia_sergio_ende_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_ende_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_ende_info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Jesteœmy na miejscu. Bez wzglêdu na to, co czeka na ciebie w Górniczej Dolinie, liczê, ¿e ca³o powrócisz z tej wyprawy.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Nie obawiaj siê - wrócê.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Niech Innos prowadzi ciê i ochrania.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_SERGIO_PERM(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_perm_condition;
	information = dia_sergio_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_perm_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//Na Innosa, Bracie. Jeœli chcesz dowiedzieæ siê czegoœ o Konsekracji Miecza, porozmawiaj z Mardukiem.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//S³ysza³em o tobie. Jesteœ cz³owiekiem z farm, który powróci³ z Górniczej Doliny. Przyjmij mój szacunek.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_PICKPOCKET(C_INFO)
{
	npc = pal_299_sergio;
	nr = 900;
	condition = dia_sergio_pickpocket_condition;
	information = dia_sergio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sergio_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_sergio_pickpocket_info()
{
	Info_ClearChoices(dia_sergio_pickpocket);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_BACK,dia_sergio_pickpocket_back);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_PICKPOCKET,dia_sergio_pickpocket_doit);
};

func void dia_sergio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sergio_pickpocket);
};

func void dia_sergio_pickpocket_back()
{
	Info_ClearChoices(dia_sergio_pickpocket);
};

