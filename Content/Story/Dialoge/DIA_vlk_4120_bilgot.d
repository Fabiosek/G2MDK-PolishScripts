
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Hej, sk¹d przyszed³eœ? Mo¿e z zamku?
	Info_AddChoice(dia_bilgot_hallo,"Tak, przyszed³em z zamku, a co?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"Wpad³em tu przez przypadek...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//Wpad³em tu przez przypadek...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Ej, nikt tu nie trafia przez PRZYPADEK. Wszyscy jesteœmy skazani - otoczeni przez zêbacze!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//Codziennie kolejny z nas gryzie ziemiê.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//Nie chcesz mi powiedzieæ, sk¹d przyszed³eœ? Dobra - w takim razie niech ciê zêbacze ze¿r¹!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Tak, przyszed³em z zamku, a co?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//Jak wygl¹da sytuacja?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//Nie lepiej ni¿ tu. Orkowie nadal tam s¹, jeœli o to pytasz.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Cholera. Nigdzie nie jesteœ bezpieczny.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//Coœ ci powiem. Gdybym nie by³ tak przera¿ony, ju¿ dawno bym siê st¹d zmy³.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "A co tu w³aœciwie robisz?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//A co tu w³aœciwie robisz?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//A, robiê tu za ch³opca na posy³ki. Zanieœ to tam, miej na oku zêbacze, Bilgot chodŸ tu, Bilgot idŸ tam...
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//Mog³em zostaæ w domu z moj¹ star¹. Tam by³o tak samo, ale mog³em przynajmniej porz¹dnie zjeœæ.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//A teraz jestem ostatnim niedobitkiem z kontyngentu przydzielonego do Fajetha.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//Sk¹d mia³em wiedzieæ, ¿e ta ekspedycja nie wróci?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//Mój kumpel, Olav, ulotni³ siê. Mo¿e JEMU siê uda³o...
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "Co wiesz o zêbaczach?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//Co wiesz o zêbaczach?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//A czemu chcesz to wiedzieæ? Tylko nie mów, ¿e jesteœ po prostu ciekawy!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//Zamierzam zapolowaæ na te zêbacze.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//To szaleñstwo. Obserwowa³em je - to krwio¿ercze bestie.
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//No to powiedz mi, co o nich wiesz.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Hmmm... Móg³bym ci pomóc, ale pod jednym warunkiem!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//Czego chcesz?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//Jeœli uda ci siê pozabijaæ zêbacze, to mnie st¹d wyci¹gniesz!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//Nie wytrzymam tu d³u¿ej. Rozmawia³eœ z Fedem? Ten facet to kompletny wrak - nie chcê skoñczyæ jak on.
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "Powiedz mi, co wiesz. Wtedy ciê st¹d zabiorê.";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Powiedz mi, co wiesz. Wtedy ciê st¹d zabiorê.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//Wiedzia³em, ¿e mogê na ciebie liczyæ. No to s³uchaj. Doœæ d³ugo obserwowa³em zêbacze.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//S¹ bardzo sprytne i jakoœ siê... porozumiewaj¹. Nigdy nie chodz¹ same. Atakuj¹ ca³ym stadem.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//Ale jest coœ jeszcze. Wœród nich jest jakiœ inny jaszczur. Rzadko siê pokazuje, ale go widzia³em.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//Inne zêbacze pochylaj¹ ³by, kiedy przechodzi, ale ci¹gle go obserwuj¹.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//Dopóki ten jeden siê nie ruszy, reszta te¿ nie.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Gdzie znajdê to cholerne bydlê?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//Widzia³em go ko³o schodów prowadz¹cych do starej wie¿y stra¿niczej.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Œwietnie. Chyba zrozumia³em. Dziêkujê!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Pamiêtaj, da³eœ mi s³owo!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Bilgot opowiedzia³ mi o przywódcy stada zêbaczy. Znajdê go na schodach starej wie¿y stra¿niczej.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"Bilgot chce, abym pomóg³ mu wydostaæ siê z doliny.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "(Dotrzymaj obietnicy)";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//Pora ruszaæ, Bilgot! Pakuj manatki.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//Jestem gotowy!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "Nie mo¿esz iœæ trochê szybciej?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Nie mo¿esz iœæ trochê szybciej?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//Idê tak szybko, jak dajê radê.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Dobra, jesteœmy. A teraz szybko. Ten teren jest niepewny!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Dziêkujê!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Nie daj siê zjeœæ. Szkoda by ciê by³o.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//¯egnaj!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "Co tu robisz? Myœla³em, ¿e szed³eœ do prze³êczy?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//Co tu robisz? Myœla³em, ¿e szed³eœ do prze³êczy?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//Ju¿ nie mogê. Pozwól mi chwilê odpocz¹æ. Dam radê. Nie martw siê!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//Skoro tak twierdzisz.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Tylko krótka przerwa.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "Znalaz³em Olava.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//Znalaz³em Olava.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//Jak siê ma?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//Nie ¿yje. Wilki go zjad³y.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//O, cholera. Mam nadziejê, ¿e chocia¿ ja zdo³am siê st¹d wyrwaæ.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

