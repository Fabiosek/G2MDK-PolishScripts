
instance DIA_OPOLOS_KAP1_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap1_exit_condition;
	information = dia_opolos_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_opolos_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLO(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_hello_condition;
	information = dia_opolos_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_hello_info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Witaj, a wiêc to ty jesteœ ten nowy.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//Jestem Opolos. Zajmujê siê owcami.
};


instance DIA_OPOLOS_WURST(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_wurst_condition;
	information = dia_opolos_wurst_info;
	permanent = FALSE;
	description = "Mam tu kie³basê z baraniny...";
};


func int dia_opolos_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_opolos_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//Mam tu kie³basê z baraniny...
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//To fantastycznie. Uwielbiam kie³basê z baraniny.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_OPOLOS_HOWLONG(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_howlong_condition;
	information = dia_opolos_howlong_info;
	permanent = FALSE;
	description = "Od jak dawna jesteœ w klasztorze?";
};


func int dia_opolos_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello))
	{
		return TRUE;
	};
};

func void dia_opolos_howlong_info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//Od jak dawna jesteœ w klasztorze?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//Mieszkam tu ju¿ trzy lata. Ale, choæ bardzo bym tego chcia³, nie zacz¹³em jeszcze nauki.
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Dlaczego?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//Zajmujê siê pilnowaniem owiec, a nie studiowaniem manuskryptów.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//Dopóki Mistrz Parlan nie zwolni mnie z tych obowi¹zków, nie mogê korzystaæ z biblioteki.
	MIS_HELPOPOLOS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_OPOLOSSTUDY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSSTUDY,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSSTUDY,"Opolos strze¿e owiec. Bardzo chcia³by móc studiowaæ pisma w bibliotece.");
};


instance DIA_OPOLOS_MONASTERY(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_monastery_condition;
	information = dia_opolos_monastery_info;
	permanent = FALSE;
	description = "Jak mam siê zachowywaæ w klasztorze?";
};


func int dia_opolos_monastery_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_monastery_info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//Jak mam siê zachowywaæ w klasztorze?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Nigdy nie ok³amuj magów. Nie knuj tak¿e przeciwko braciom.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Zawsze szanuj w³asnoœæ zgromadzenia. Jeœli z³amiesz któr¹œ z tych zasad, bêdziesz musia³ zap³aciæ grzywnê Mistrzowi Parlanowi.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Trzymaj siê te¿ z dala od Agona, inaczej skoñczysz jak Babo.
};


instance DIA_OPOLOS_BEIBRINGEN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_beibringen_condition;
	information = dia_opolos_beibringen_info;
	permanent = FALSE;
	description = "Czy móg³byœ mnie czegoœ nauczyæ?";
};


func int dia_opolos_beibringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_opolos_beibringen_info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Czy móg³byœ mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Jasne, zawsze by³em dobry w bitce. Mogê ci pokazaæ, jak wzmocniæ miêœnie ramion.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//Chcia³bym siê jednak dowiedzieæ czegoœ o miksturach, szczególnie tych magicznych.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//Jak móg³bym ci w tym pomóc?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//Có¿, móg³byœ 'po¿yczyæ' od Neorasa na chwilê któr¹œ z jego receptur.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//Jeœli mi j¹ przyniesiesz, bêdê ciê trenowa³.
	Log_CreateTopic(TOPIC_OPOLOSREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSREZEPT,"Opolos chce rzuciæ okiem na recepturê mikstury many. Pracuj¹c dla Neorasa, móg³bym j¹ po¿yczyæ.");
};


instance DIA_OPOLOS_REZEPT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_rezept_condition;
	information = dia_opolos_rezept_info;
	permanent = TRUE;
	description = "Co do tej receptury...";
};


var int dia_opolos_rezept_permanent;

func int dia_opolos_rezept_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_OPOLOS_REZEPT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_rezept_info()
{
	if(Npc_HasItems(other,itwr_manarezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//Mam tu recepturê, o któr¹ prosi³eœ.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Dobrze, niech na ni¹ spojrzê.
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Aha... hm... tak... rozumiem... no, no...
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Doskonale, wielkie dziêki. Jeœli chcesz, mo¿emy razem potrenowaæ.
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		OPOLOS_REZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"Opolos mo¿e mi pokazaæ, jak staæ siê silniejszym.");
	}
	else if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//Odnios³em ju¿ recepturê Neorasowi.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//O cholera - chyba nigdy niczego siê tu nie nauczê. Niewa¿ne. Pomogê ci mimo to.
		OPOLOS_REZEPT = LOG_FAILED;
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"Opolos mo¿e mi pokazaæ, jak staæ siê silniejszym.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//Wrócimy do tego póŸniej.
	};
};


instance DIA_OPOLOS_TEACH_STR(C_INFO)
{
	npc = nov_605_opolos;
	nr = 99;
	condition = dia_opolos_teach_str_condition;
	information = dia_opolos_teach_str_info;
	permanent = TRUE;
	description = "Chcê byæ silniejszy.";
};


func int dia_opolos_teach_str_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (OPOLOS_TEACHSTR == TRUE))
	{
		return TRUE;
	};
};

func void dia_opolos_teach_str_info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//Chcia³bym staæ siê silniejszy.
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//Jesteœ ju¿ doœæ silny. Niczego wiêcej nie mogê ciê nauczyæ.
	};
	Info_ClearChoices(dia_opolos_teach_str);
};

func void dia_opolos_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_opolos_teach_str_5);
};


instance DIA_OPOLOS_AGON(C_INFO)
{
	npc = nov_605_opolos;
	nr = 4;
	condition = dia_opolos_agon_condition;
	information = dia_opolos_agon_info;
	permanent = FALSE;
	description = "Kim s¹ Agon i Babo?";
};


func int dia_opolos_agon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_agon_info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Kim s¹ Agon i Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon opiekuje siê ogrodem z zio³ami. Jest jeszcze nowicjuszem, ale zachowuje siê tak, jakby by³ przynajmniej wybrañcem.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Babo przyby³ do klasztoru na krótko przed tob¹. Na pocz¹tku pomaga³ Agonowi w ogrodzie.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//Musieli siê chyba pok³óciæ. Od tamtego czasu Babo zamiata dziedziniec.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Wiesz, co siê sta³o?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Nie do koñca. Musisz sam ich zapytaæ. Jednak s³owa Agona znacz¹ tu wiêcej ni¿ s³owa innych nowicjuszy - jest siostrzeñcem gubernatora.
};


instance DIA_OPOLOS_LIESEL(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_liesel_condition;
	information = dia_opolos_liesel_info;
	permanent = TRUE;
	description = "Spójrz, przyprowadzi³em Betsy.";
};


func int dia_opolos_liesel_condition()
{
	if((other.guild == GIL_NOV) && (LIESEL_GIVEAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_liesel_info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Spójrz, przyprowadzi³em Betsy. Zaopiekujesz siê ni¹?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = zs_mm_allscheduler;
		LIESEL_GIVEAWAY = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Oczywiœcie. Bardzo ³adne zwierzê. Dobrze siê ni¹ zajmê.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Hm... Gdzieœ mi siê chyba zapodzia³a. Wrócê póŸniej.
	};
};


instance DIA_OPOLOS_BIBLOTHEK(C_INFO)
{
	npc = nov_605_opolos;
	nr = 98;
	condition = dia_opolos_biblothek_condition;
	information = dia_opolos_biblothek_info;
	permanent = TRUE;
	description = "Jeœli chodzi o bibliotekê...";
};


func int dia_opolos_biblothek_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_opolos_howlong))
	{
		return TRUE;
	};
};

func void dia_opolos_biblothek_info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//Jeœli chodzi o bibliotekê...
	if(PARLAN_ERLAUBNIS == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//To ta zamkniêta sala na lewo, obok bramy.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//Klucz do niej dostaniesz jednak tylko wtedy, kiedy Mistrz Parlan uzna, ¿e mo¿esz rozpocz¹æ nauki.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//Szczêœciarzu! Masz klucz do biblioteki, mimo ¿e jesteœ tu tak krótko.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Wykorzystaj swoj¹ szansê, poczytaj dok³adnie stare manuskrypty.
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLOAGAIN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_helloagain_condition;
	information = dia_opolos_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_helloagain_condition()
{
	if((other.guild == GIL_KDF) && (MIS_HELPOPOLOS == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_opolos_helloagain_info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Witam. Dziêkujê za pomoc. Postaram siê skorzystaæ z szansy, jak¹ otrzyma³em, i nauczyæ siê jak najwiêcej.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//Nie masz pewnie czasu, ¿eby rozmawiaæ ze zwyk³ym nowicjuszem, Mistrzu.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HOWISIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_howisit_condition;
	information = dia_opolos_howisit_info;
	permanent = TRUE;
	description = "Co s³ychaæ?";
};


func int dia_opolos_howisit_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_opolos_howisit_info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//Jak leci?
	if(MIS_HELPOPOLOS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Wspaniale. Odk¹d mogê siê uczyæ, wszystko jest w jak najlepszym porz¹dku.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//Lojalnie wype³niam zlecone mi zadania, Mistrzu.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Co dzieñ Innos stawia przede mn¹ nowe wyzwania. Bêdê nadal pracowa³ nad doskonaleniem siebie.
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP2_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap2_exit_condition;
	information = dia_opolos_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_opolos_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap3_exit_condition;
	information = dia_opolos_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_PERM(C_INFO)
{
	npc = nov_605_opolos;
	nr = 39;
	condition = dia_opolos_kap3_perm_condition;
	information = dia_opolos_kap3_perm_info;
	permanent = TRUE;
	description = "Jak tam owce?";
};


func int dia_opolos_kap3_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//Jak tam owce?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//A jak ci siê wydaje? Chodz¹ sobie i skubi¹ trawê.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//Zastanawiam siê, co siê dzieje na zewn¹trz. Magowie wydaj¹ siê niespokojni.
	Info_ClearChoices(dia_opolos_kap3_perm);
	Info_AddChoice(dia_opolos_kap3_perm,DIALOG_BACK,dia_opolos_kap3_perm_back);
	Info_AddChoice(dia_opolos_kap3_perm,"W Górniczej Dolinie pojawi³y siê smoki.",dia_opolos_kap3_perm_dragons);
	Info_AddChoice(dia_opolos_kap3_perm,"Po kraju wêdruj¹ dziwni przybysze w czarnych szatach.",dia_opolos_kap3_perm_dmt);
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_opolos_kap3_perm,"Pedro nas zdradzi³.",dia_opolos_kap3_perm_pedro);
	};
};

func void dia_opolos_kap3_perm_back()
{
	Info_ClearChoices(dia_opolos_kap3_perm);
};


var int opolos_dragons;

func void dia_opolos_kap3_perm_dragons()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//W Górniczej Dolinie pojawi³y siê smoki. Wraz z armi¹ orków oblegaj¹ oddzia³y królewskie.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Smoki - zawsze myœla³em, ¿e istniej¹ jedynie w strasznych opowieœciach.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//S¹ prawdziwe, uwierz mi.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//Królewscy paladyni chyba sobie z nimi poradz¹, prawda?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//Zobaczymy.
	if(OPOLOS_DRAGONS == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DRAGONS = TRUE;
	};
};


var int opolos_dmt;

func void dia_opolos_kap3_perm_dmt()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Po kraju wêdruj¹ dziwni przybysze w czarnych szatach.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//Co masz na myœli? Jacy przybysze?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nikt nie wie, sk¹d siê wziêli. Nosz¹ d³ugie, czarne szaty i zakrywaj¹ sobie twarze.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//Wygl¹da na to, ¿e s¹ jakiegoœ rodzaju magami. A przynajmniej znaj¹ czary.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//To brzmi niepokoj¹co. Mam jednak nadziejê, ¿e Najwy¿sza Rada poradzi sobie z tym problemem.
	if(OPOLOS_DMT == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DMT = TRUE;
	};
};


var int opolos_pedro;

func void dia_opolos_kap3_perm_pedro()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro nas zdradzi³.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//S³ysza³em, nie wiedzia³em jednak, ¿e i ty o tym wiesz. Dlatego w³aœnie nic nie mówi³em.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Czy wróg jest silniejszy od nas - to znaczy, czy mo¿emy go jakoœ pokonaæ?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//Wszystko jest mo¿liwe. Póki ¿ycia, póty nadziei.
	if(OPOLOS_PEDRO == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_PEDRO = TRUE;
	};
};


instance DIA_OPOLOS_KAP4_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap4_exit_condition;
	information = dia_opolos_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_opolos_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP5_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap5_exit_condition;
	information = dia_opolos_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_opolos_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_PICKPOCKET(C_INFO)
{
	npc = nov_605_opolos;
	nr = 900;
	condition = dia_opolos_pickpocket_condition;
	information = dia_opolos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_opolos_pickpocket_condition()
{
	return c_beklauen(54,70);
};

func void dia_opolos_pickpocket_info()
{
	Info_ClearChoices(dia_opolos_pickpocket);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_BACK,dia_opolos_pickpocket_back);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_PICKPOCKET,dia_opolos_pickpocket_doit);
};

func void dia_opolos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_opolos_pickpocket);
};

func void dia_opolos_pickpocket_back()
{
	Info_ClearChoices(dia_opolos_pickpocket);
};

