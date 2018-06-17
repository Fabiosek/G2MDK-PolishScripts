
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "Widzê, ¿e przy³¹czy³eœ siê do ³owców smoków.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Widzê, ¿e przy³¹czy³eœ siê do ³owców smoków.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//Poszed³em z Sylviem do Górniczej Doliny, bo nikt nie zna okolicy lepiej ode mnie. Zreszt¹ chcia³em sam rozejrzeæ siê w sytuacji.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Wiesz, co ci powiem? Coœ tu siê szykuje. Pierwszy raz widzê tylu orków naraz w jednym miejscu.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Nie zdziwi³bym siê, gdyby Garond i jego paladyni zostali do tej pory wybici do nogi.
	Info_AddChoice(dia_gorndjg_startcamp,"Do zobaczenia!",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"Co zamierzasz teraz robiæ?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Co zamierzasz teraz robiæ?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Najpierw pójdê z ch³opakami do Górniczej Doliny. Potem pewnie siê st¹d ulotniê.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Muszê siê dowiedzieæ, co planuj¹ orkowie.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Do zobaczenia!
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Uwa¿aj na siebie.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "A wiêc tutaj siê schowa³eœ!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//A wiêc tutaj siê schowa³eœ!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Ty te¿ nie dasz siê tak ³atwo zabiæ, co?
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "Znalaz³eœ coœ ciekawego?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Znalaz³eœ coœ ciekawego?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Ci¹gle szukam. Myœlê, ¿e coœ dzieje siê w starych ruinach, w górach. W nocy widaæ tam dziwne œwiat³a i s³ychaæ jakieœ wrzaski.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"Mo¿e Lester?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"Myœlisz, ¿e to sprawka smoka?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn przebywa u podnó¿a p³askowy¿u przy fortecy orków. Dziêki temu mo¿e obserwowaæ jednoczeœnie równinê i orkowe barykady.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Mo¿e Lester wróci³ na swoje œmieci?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//Raczej nie. O ile wiem, Lester ju¿ tam nie mieszka.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Myœlisz, ¿e to sprawka smoka?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Bardzo mo¿liwe. Tamten p³askowy¿ jest lepiej strze¿ony ni¿ królewski skarbiec, a koniec koñców - to jedyna droga do fortecy.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Jakby ma³o by³o samych smoków - krêci siê tam mnóstwo innego plugastwa.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn twierdzi, ¿e w starej skalnej fortecy przebywa smok.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "O czym mówisz?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//O czym mówisz?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Nie przyjrza³em im siê jeszcze dok³adniej, ale czymkolwiek s¹ - chodz¹ wyprostowane i maj¹ ³uskowat¹ skórê. Skacz¹ po ska³ach jak stado zêbaczy w poœcigu za ofiar¹.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//S³ysza³em parê razy, jak wêszy³y po okolicy. Myœlê, ¿e zajê³y ca³¹ wy¿ynê.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "A co z orkami?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//A co z orkami?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Obserwujê je od d³u¿szego czasu. Za t¹ ich palisad¹ musi siê kryæ coœ wa¿nego. Myœlê, ¿e trzymaj¹ tam swoje g³ówne si³y.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//Myœlisz, ¿e jest ich tam jeszcze wiêcej ni¿ tutaj?!
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Nie zdziwi³bym siê, gdyby pewnego dnia przewrócili tê swoj¹ palisadê i zalali nas jak powódŸ. Nie podoba mi siê to...
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Gdyby rzeczywiœcie ruszyli do ataku, bêdê musia³ ostrzec Lee. On i tak chce siê wynieœæ z tej wyspy, a w obecnej sytuacji to chyba niez³y pomys³.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "Pomo¿esz mi dostaæ siê do fortecy?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Pomo¿esz mi dostaæ siê do fortecy?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//Sam nie wiem. Bojê siê spuœciæ orków z oka, choæby na chwilê.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//Nie przesadzasz przypadkiem?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Mo¿e, ale nigdy sobie nie wybaczê, gdybym nie zd¹¿y³ ostrzec pozosta³ych. Chocia¿, z drugiej strony...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//A co mi tam! W koñcu, po co tu jestem? W porz¹dku, pomogê ci przebiæ siê do fortecy.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Trochê ruchu mi nie zaszkodzi. Zreszt¹ i tak chcia³em siê lepiej przyjrzeæ tym dziwnym bestiom.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Daj mi znaæ, kiedy bêdziesz gotowy.
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn chce mi pomóc przedostaæ siê do skalnej fortecy na p³askowy¿u.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "Mo¿emy ruszaæ!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Mo¿emy ruszaæ!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Jak za dawnych czasów, co? Ale coœ sobie wyjaœnijmy: to MOJA bitwa. Tym razem to JA idê z przodu!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Ha! £atwizna! Có¿, przyjacielu, reszt¹ musisz zaj¹æ siê sam. Spuœæ im ciêgi! Ja wrócê na swój posterunek i bêdê dalej obserwowa³ orków.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//Nie ma sprawy! Do zobaczenia!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//No, mam nadziejê!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn powróci³ na swój posterunek. Zamierza nadal obserwowaæ poczynania orków.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "Kamienny smok nie ¿yje!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Kamienny smok nie ¿yje!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Od jakiegoœ czasu nie s³yszê ¿adnych wrzasków. By³eœ w fortecy?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Tak!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha, ha! Tak myœla³em. Po tobie nie zostaje nawet kamieñ na kamieniu!
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Co zamierzasz robiæ dalej?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Zostanê tu jeszcze trochê, a potem wrócê do Lee. Mo¿e spotkamy siê u niego!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Mam ju¿ doœæ tej okolicy. Najwy¿sza pora zwijaæ manatki.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Na razie!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

