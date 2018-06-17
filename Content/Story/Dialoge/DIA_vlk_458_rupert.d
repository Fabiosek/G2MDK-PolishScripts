
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Witaj, nieznajomy!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Pewnie jesteœ g³odny i spragniony - a mo¿e zerkniesz okiem na moje towary?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "W³aœciwie, to chcia³em siê widzieæ z paladynami...";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//W³aœciwie, to chcia³em siê widzieæ z paladynami...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//Niewielka jest na to szansa. Od kiedy paladyni urz¹dzili swoj¹ siedzibê w górnym mieœcie, ciê¿ko jest siê tam dostaæ.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Czy mo¿esz mi pomóc dostaæ siê do górnego miasta?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Ja? Niemo¿liwe, nie mam tu w³aœciwie nic do powiedzenia.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//W dolnej czêœci miasta jest tylko kilka osób, których wp³ywy mog³yby ci zapewniæ wstêp do górnego miasta.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Jedn¹ z nich jest mój szef, Matteo. To z nim powinieneœ porozmawiaæ.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Jeœli chcê siê dostaæ do górnego miasta, bêdê potrzebowa³ pomocy jakiejœ wp³ywowej osobistoœci z dolnej czêœci miasta.");
	b_logentry(TOPIC_OV,"Kupiec Matteo to jeden z bardziej wp³ywowych mieszkañców dolnej czêœci miasta.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "Gdzie go znajdê?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Gdzie go znajdê?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Stoisz w³aœnie przed jego sklepem. Prawie go nie opuszcza. WejdŸ do œrodka.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Sklep Mattea znajduje siê przy po³udniowej bramie miasta. Mo¿na tam kupiæ orê¿, ¿ywnoœæ oraz wyposa¿enie.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "Jakich innych wp³ywowych obywateli mia³eœ na myœli?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//Jakich innych wp³ywowych obywateli mia³eœ na myœli?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Najwa¿niejszymi osobami w tej czêœci miasta s¹ dzia³aj¹cy na tej ulicy kupcy i rzemieœlnicy.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Powinieneœ naj¹æ siê u któregoœ jako czeladnik - tak jak ja.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Od kiedy pracujê dla Mattea, miastowi nabrali do mnie szacunku.
	b_logentry(TOPIC_OV,"Spróbujê zatrudniæ siê jako czeladnik u jednego z mistrzów.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "Potrzebujê pieniêdzy. Szukam pracy.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Potrzebujê pieniêdzy. Szukam pracy.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//S³ysza³em, ¿e Bosper ma jakieœ problemy z zaopatrzeniem. Jego sklep znajduje siê kilka kroków st¹d.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//Mówi¹, ¿e ponoæ dobrze p³aci.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "Co chcesz mi zaproponowaæ?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Co sprzedajesz?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//W tej chwili wybór jest niewielki.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Ten cholerny w³aœciciel ziemski przerwa³ dostawy, a to co skupujemy z ma³ych farm, nie wystarcza, by zaspokoiæ potrzeby miasta.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Poka¿ mi swoje towary.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_cheese) < 5)
	{
		CreateInvItems(self,itfo_cheese,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Poka¿ mi swoje towary.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Musisz mi wybaczyæ niewielki wybór, cz³owiek z twoj¹ pozycj¹ z pewnoœci¹ przywyk³ do czegoœ wiêcej.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "Powiedz mi proszê coœ wiêcej o buncie ch³opów.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Powiedz mi proszê coœ wiêcej o buncie ch³opów.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//To doœæ proste: Onar, bogaty w³aœciciel ziemski, przesta³ p³aciæ miastu podatki.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//WyobraŸ sobie! Jesteœmy w stanie wojny z orkami, a ten snob chce zagarn¹æ wszystko dla siebie.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//W zwyk³ych okolicznoœciach stra¿ miejska szybko zajê³aby siê t¹ spraw¹.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Ale uwa¿aj, bo teraz bêdzie najlepsze: powiadaj¹, ¿e Onar zatrudni³ najemników, których zadaniem jest odpêdzanie oddzia³ów stra¿y miejskiej!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//NAJEMNICY! Mówiê ci, to wszystko skoñczy siê wojn¹! Jakby JEDNEJ by³o nam za ma³o!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "Co wiesz o najemnikach Onara?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Co wiesz o najemnikach Onara?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//S³ysza³em, ¿e wiêkszoœæ z nich to byli skazañcy z kolonii górniczej.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//Ich przywódca by³ chyba jak¹œ grub¹ ryb¹ na królewskim dworze - genera³em, czy kimœ takim. Wygnano go jako zdrajcê.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Ciê¿kie czasy nasta³y.
};

