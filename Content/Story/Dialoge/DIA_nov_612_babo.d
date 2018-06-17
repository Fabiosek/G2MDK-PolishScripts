
instance DIA_BABO_KAP1_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap1_exit_condition;
	information = dia_babo_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_babo_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_hello_condition;
	information = dia_babo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_babo_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_hello_info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//Ty te¿ tu jesteœ nowy, prawda?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Tak. D³ugo tu jesteœ?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Od czterech tygodni. Dosta³eœ ju¿ kij do walki?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Jeszcze nie.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//No to weŸ ten. Wszyscy nowicjusze nosz¹ takie kije jako znak, ¿e potrafimy siê broniæ. Potrafisz walczyæ?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No có¿, mia³em ju¿ kiedyœ w rêkach broñ...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Jeœli chcesz, mogê ciê czegoœ nauczyæ. Ale mam proœbê...
	b_giveinvitems(self,other,itmw_1h_nov_mace,1);
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_BABO_ANLIEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_anliegen_condition;
	information = dia_babo_anliegen_info;
	permanent = FALSE;
	description = "Co to za proœba?";
};


func int dia_babo_anliegen_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
	{
		return TRUE;
	};
};

func void dia_babo_anliegen_info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co to za proœba?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//No có¿, jeden z paladynów, Sergio, jest w tej chwili w klasztorze.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Jeœli namówisz go, ¿eby ze mn¹ trochê poæwiczy³, to ciê wyszkolê.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Zobaczê, co da siê zrobiæ.
	Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
	b_logentry(TOPIC_BABOTRAIN,"Jeœli przekonam paladyna Sergia, aby poæwiczy³ z Babo, ten ostatni nauczy mnie walczyæ orê¿em dwurêcznym.");
};


instance DIA_BABO_SERGIO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_sergio_condition;
	information = dia_babo_sergio_info;
	permanent = FALSE;
	description = "Rozmawia³em z Sergiem.";
};


func int dia_babo_sergio_condition()
{
	if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_sergio_info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Rozmawia³em z Sergiem. Codziennie rano bêdzie z tob¹ trenowa³ przez dwie godziny, od pi¹tej.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Dziêkujê! To dla mnie zaszczyt!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Jeœli chcesz, wyjaœniê ci te¿ tajniki walki.
	BABO_TEACHPLAYER = TRUE;
	BABO_TRAINING = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Babo mo¿e mnie nauczyæ walki orê¿em dwurêcznym.");
};


instance DIA_BABO_TEACH(C_INFO)
{
	npc = nov_612_babo;
	nr = 100;
	condition = dia_babo_teach_condition;
	information = dia_babo_teach_info;
	permanent = TRUE;
	description = "Jestem gotów do treningu.";
};


var int dia_babo_teach_permanent;
var int babo_labercount;

func int dia_babo_teach_condition()
{
	if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void dia_babo_teach_info()
{
	BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jestem gotów do treningu.
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Przekaza³em ci ju¿ ca³¹ swoj¹ wiedzê o walce orê¿em oburêcznym.
		DIA_BABO_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_babo_teach);
};

func void dia_babo_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Walcz za Innosa. Innos jest naszym ¿yciem, a wiara - najpotê¿niejszym orê¿em.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//S³uga Innosa nigdy nie prowokuje swojego przeciwnika - zawsze dzia³a z zaskoczenia!
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Wszêdzie, gdzie siê udasz, miej ze sob¹ swój kostur.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//S³uga Innosa zawsze jest gotów do walki. Jeœli nie posiadasz mocy magicznej, twoj¹ podstawow¹ broni¹ jest kostur.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Broni¹ s³ugi Innosa jest nie tylko jego kostur, lecz równie¿ waleczne serce.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Musisz wiedzieæ, kiedy mo¿esz siê wycofaæ.
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Pamiêtaj, dobra walka to taka, w której to ty kontrolujesz swojego przeciwnika, nie daj¹c mu najmniejszej szansy na przejêcie kontroli nad tob¹.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Przegrywasz tylko wtedy, gdy siê poddasz.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};


instance DIA_BABO_WURST(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_wurst_condition;
	information = dia_babo_wurst_info;
	permanent = FALSE;
	description = "Proszê, weŸ kie³basê.";
};


func int dia_babo_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_babo_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Proszê, weŸ kie³basê.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Och, kie³basy z barana, wspaniale! S¹ najlepsze - no, daj mi jeszcze jedn¹!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Wtedy nie wystarczy dla pozosta³ych.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//I tak masz o jedn¹ za du¿o. Tê, która jest dla ciebie. A co znaczy jedna kie³baska dla przyjaciela?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Daj spokój. Dam ci za ni¹ zwój z czarem 'Ognista strza³a'.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_babo_wurst);
	Info_AddChoice(dia_babo_wurst,"Dobrze, weŸ jeszcze jedn¹.",dia_babo_wurst_ja);
	Info_AddChoice(dia_babo_wurst,"Nie, nie zrobiê tego.",dia_babo_wurst_nein);
};

func void dia_babo_wurst_ja()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//Dobrze, weŸ jeszcze jedn¹.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Dobrze. Oto twój zwój z czarem.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	b_giveinvitems(self,other,itsc_firebolt,1);
	Info_ClearChoices(dia_babo_wurst);
};

func void dia_babo_wurst_nein()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Nie, nie zrobiê tego.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Cz³owieku, jesteœ z tych, co to s¹ zawsze bardzo skrupulatni, no nie?
	Info_ClearChoices(dia_babo_wurst);
};


instance DIA_BABO_YOUANDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_youandagon_condition;
	information = dia_babo_youandagon_info;
	permanent = FALSE;
	description = "Co zasz³o miêdzy tob¹ i Agonem?";
};


func int dia_babo_youandagon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_youandagon_info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co zasz³o miêdzy tob¹ i Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Och, mieliœmy odmienne pogl¹dy na temat ognistych pokrzyw.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon za bardzo je podlewa³ i zgni³y im korzenie.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A kiedy tak siê sta³o, mnie za to obwini³.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//Od tej pory ka¿¹ mi przez ca³y dzieñ zamiataæ dziedziniec.
};


instance DIA_BABO_WHYDIDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 4;
	condition = dia_babo_whydidagon_condition;
	information = dia_babo_whydidagon_info;
	permanent = FALSE;
	description = "Dlaczego Agon to zrobi³?";
};


func int dia_babo_whydidagon_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_whydidagon_info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Dlaczego Agon to zrobi³?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Musisz go o to zapytaæ. Wydaje mi siê, ¿e on po prostu nie znosi, kiedy ktoœ jest lepszy od niego.
};


instance DIA_BABO_PLANTLORE(C_INFO)
{
	npc = nov_612_babo;
	nr = 5;
	condition = dia_babo_plantlore_condition;
	information = dia_babo_plantlore_info;
	permanent = FALSE;
	description = "Wygl¹da na to, ¿e wiesz co nieco o roœlinach?";
};


func int dia_babo_plantlore_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_plantlore_info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Wygl¹da na to, ¿e wiesz co nieco o roœlinach?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//Mieliœmy ogród z zio³ami i tam nauczy³em siê paru sztuczek od mojego dziadka.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Naprawdê wola³bym znowu pracowaæ w ogrodzie.
	MIS_HELPBABO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
	b_logentry(TOPIC_BABOGAERTNER,"Babo wola³by pracowaæ w ogrodzie, ni¿ zamiataæ podwórze.");
};


instance DIA_BABO_FEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_fegen_condition;
	information = dia_babo_fegen_info;
	permanent = FALSE;
	description = "Mam posprz¹taæ komnaty nowicjuszy.";
};


func int dia_babo_fegen_condition()
{
	if(MIS_PARLANFEGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_babo_fegen_info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Mam posprz¹taæ komnaty nowicjuszy.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//Wzi¹³eœ spory ciê¿ar na barki. Wiesz co - pomogê ci. Sam nigdy tego nie skoñczysz.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Ale naprawdê potrzebujê zwoju z czarem 'Piêœæ wichru' - wiesz, mia³em szczêœcie i pozwolili mi przeczytaæ o tym ksi¹¿kê.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//No i teraz, oczywiœcie, chcê wypróbowaæ ten czar. Wiêc przynieœ mi ten zwój, a chêtnie ci pomogê.
	b_logentry(TOPIC_PARLANFEGEN,"Babo pomo¿e mi pozamiataæ komnaty nowicjuszy, jeœli przyniosê mu zwój Piêœci wichru.");
};


instance DIA_BABO_WINDFAUST(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_windfaust_condition;
	information = dia_babo_windfaust_info;
	permanent = TRUE;
	description = "Co do tego zwoju... (oddaj zwój Piêœci wichru)";
};


var int dia_babo_windfaust_permanent;

func int dia_babo_windfaust_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_babo_windfaust_info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//Co do tego zwoju z zaklêciem...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Czy masz dla mnie zaklêcie 'Piêœæ wichru'?
	if(b_giveinvitems(other,self,itsc_windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tu jest zwój, o który ci chodzi³o.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//To dobrze. A wiêc pomogê ci posprz¹taæ komnaty.
		NOV_HELFER = NOV_HELFER + 1;
		DIA_BABO_WINDFAUST_PERMANENT = TRUE;
		b_giveplayerxp(XP_FEGER);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		b_logentry(TOPIC_PARLANFEGEN,"Babo pomo¿e mi pozamiataæ komnaty nowicjuszy.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Nie, jeszcze nie.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//A wiêc poczekam, a¿ je zdobêdziesz.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_LIFE(C_INFO)
{
	npc = nov_612_babo;
	nr = 10;
	condition = dia_babo_life_condition;
	information = dia_babo_life_info;
	permanent = TRUE;
	description = "Jak tu siê ¿yje, w klasztorze?";
};


func int dia_babo_life_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_babo_life_info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak tu siê ¿yje, w klasztorze?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nie chcê narzekaæ, ale nie s¹dzi³em, ¿e obowi¹zuje tutaj taki rygor. Jeœli nie trzymasz siê œciœle zasad, spotyka ciê kara.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Oczywiœcie, wielu nowicjuszy chce studiowaæ nauki Innosa w bibliotece. Pragn¹ byæ gotowi, kiedy zostan¹ wybrani.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Ale ja myœlê, ¿e najlepszym przygotowaniem do Próby Magii jest wykonywanie w³asnych zadañ.
	if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//O co chodzi z tym Wybranym i Prób¹?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Porozmawiaj z bratem Igarazem. On wie du¿o na ten temat.
	};
};


instance DIA_BABO_HOWISIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 1;
	condition = dia_babo_howisit_condition;
	information = dia_babo_howisit_info;
	permanent = TRUE;
	description = "Jak siê masz?";
};


func int dia_babo_howisit_condition()
{
	if((hero.guild == GIL_KDF) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int babo_xpgiven;

func void dia_babo_howisit_info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Jak siê masz?
	if(MIS_HELPBABO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//Dziêkujê magom za moje zadanie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Cieszy mnie praca w ogrodzie i mam nadziejê, ¿e magowie s¹ ze mnie zadowoleni, Panie.
		if(BABO_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			BABO_XPGIVEN = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//D... d... dobrze, Panie.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Pracujê ciê¿ko i staram siê nie zawieœæ magów.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP2_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap2_exit_condition;
	information = dia_babo_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_babo_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap3_exit_condition;
	information = dia_babo_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_hello_condition;
	information = dia_babo_kap3_hello_info;
	permanent = FALSE;
	description = "Co tu porabiasz?";
};


func int dia_babo_kap3_hello_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_hello_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tu robisz?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//Staram siê wykonaæ moje zadania dla dobra klasztoru.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Nie wolno mi z tob¹ rozmawiaæ. Naszym prze³o¿onym nie podoba siê, kiedy kontaktujemy siê z obcymi.
	};
};


instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_keepthefaith_condition;
	information = dia_babo_kap3_keepthefaith_info;
	permanent = FALSE;
	description = "Nie wolno ci traciæ wiary.";
};


func int dia_babo_kap3_keepthefaith_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_keepthefaith_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nie wolno ci traciæ wiary.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//Nie... To znaczy, nigdy bym czegoœ takiego nie zrobi³. Naprawdê!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Ka¿dy z nas wystawiany jest na ciê¿kie próby.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Tak, Panie. Bêdê o tym pamiêta³. Dziêkujê ci.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_unhappy_condition;
	information = dia_babo_kap3_unhappy_info;
	permanent = FALSE;
	description = "To nie brzmia³o, jakbyœ by³ zadowolony.";
};


func int dia_babo_kap3_unhappy_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_unhappy_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//To nie brzmia³o, jakbyœ by³ zadowolony.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//No có¿... To znaczy, wszystko w porz¹dku, naprawdê.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Tylko... Och, nie chcê narzekaæ.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Wiêc przestañ jêczeæ.",dia_babo_kap3_unhappy_lament);
	Info_AddChoice(dia_babo_kap3_unhappy,"No dalej, mnie mo¿esz powiedzieæ.",dia_babo_kap3_unhappy_tellme);
};

func void dia_babo_kap3_unhappy_lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Wiêc przestañ jêczeæ.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//Tylko... proszê... nie mów magom.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nie chcê, ¿eby mnie znowu ukarali.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Zastanowiê siê.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_tellme()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//No dalej, mnie mo¿esz powiedzieæ.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//I naprawdê nie dasz znaæ magom?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Czy wygl¹dam na takiego, który by to zrobi³?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//W porz¹dku. Mam problem z jednym z nowicjuszy. Ma mnie w garœci.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No dalej, wykrztuœ to z siebie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, tak siê nazywa, znalaz³ moje prywatne dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Zagrozi³, ¿e da je magom, jeœli nie bêdê robi³, co mi ka¿e.
	MIS_BABOSDOCS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
	b_logentry(TOPIC_BABOSDOCS,"Igaraz szanta¿uje nowicjusza Babo jakimiœ dokumentami.");
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"S¹dzê, ¿e to zbyt osobista sprawa.",dia_babo_kap3_unhappy_privat);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co masz dla niego zrobiæ?",dia_babo_kap3_unhappy_shoulddo);
	Info_AddChoice(dia_babo_kap3_unhappy,"Co to za dokumenty?",dia_babo_kap3_unhappy_documents);
	Info_AddChoice(dia_babo_kap3_unhappy,"Mogê ci jakoœ pomóc?",dia_babo_kap3_unhappy_canhelpyou);
};

func void dia_babo_kap3_unhappy_privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//S¹dzê, ¿e to zbyt osobista sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Rozumiem, nie chcesz mieæ k³opotów. Wiêc bêdê musia³ siê tym sam zaj¹æ.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//Jakoœ sobie poradzisz.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_shoulddo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co masz dla niego zrobiæ?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//Nie lubiê o tym mówiæ. W ka¿dym razie, nie spodoba³oby siê to Innosowi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Wolê nie myœleæ, co by siê sta³o, gdyby to wysz³o na jaw.
};

func void dia_babo_kap3_unhappy_documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Co to za dokumenty?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//To wy³¹cznie moja prywatna sprawa.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No dalej, powiedz mi.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//To s¹, eee... ca³kiem zwyczajne dokumenty. Nic szczególnego.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Nie bêdê wiêcej pyta³.
};

func void dia_babo_kap3_unhappy_canhelpyou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Mogê ci jakoœ pomóc?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Zrobi³byœ to?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//To zale¿y, oczywiœcie.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//Oczywiœcie, zap³acê ci za to.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Ile?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Rzecz jasna, nie mam wiele pieniêdzy, ale mogê daæ ci zwój z czarem. Mam czar leczniczy.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Wola³bym siê w to nie mieszaæ.",dia_babo_kap3_unhappy_no);
	Info_AddChoice(dia_babo_kap3_unhappy,"Zobaczê, co da siê zrobiæ.",dia_babo_kap3_unhappy_yes);
};

func void dia_babo_kap3_unhappy_no()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Wola³bym siê w to nie mieszaæ
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//A wiêc nie mam wyboru, muszê tañczyæ, jak mi zagraj¹.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Zobaczê, co da siê zrobiæ.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//Naprawdê, to siê musi udaæ. Musi!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Musisz siê tylko dowiedzieæ, gdzie Igaraz schowa³ te rzeczy. Potem je zakosisz i wszystko bêdzie w porz¹dku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Spokojnie. Wróæ do swoich zajêæ. Ja zajmê siê reszt¹.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};


instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_haveyourdocs_condition;
	information = dia_babo_kap3_haveyourdocs_info;
	permanent = FALSE;
	description = "Mam twoje dokumenty.";
};


func int dia_babo_kap3_haveyourdocs_condition()
{
	if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_haveyourdocs_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Mam twoje dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Naprawdê? Dziêki, uratowa³eœ mnie. Nie wiem, jak ci dziêkowaæ.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Tak, tak, uspokój siê.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//To na pewno moje? Jesteœ pewien? Poka¿.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Zamierzam je na razie zatrzymaæ.",dia_babo_kap3_haveyourdocs_keepthem);
	if(BABOSDOCSOPEN == TRUE)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Pewne okolicznoœci spowodowa³y, ¿e cena posz³a w górê.",dia_babo_kap3_haveyourdocs_iwantmore);
	};
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Trzymaj.",dia_babo_kap3_haveyourdocs_heretheyare);
};

func void dia_babo_kap3_haveyourdocs_keepthem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Zamierzam je na razie zatrzymaæ.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//Co?! Co to ma znaczyæ?! Co zamierzasz?
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Tylko ¿artowa³em.",dia_babo_kap3_haveyourdocs_keepthem_justjoke);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To ju¿ moje zmartwienie.",dia_babo_kap3_haveyourdocs_keepthem_myconcern);
	if(IGARAZ_ISPARTNER == LOG_SUCCESS)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Igaraz to mój wspólnik.",dia_babo_kap3_haveyourdocs_keepthem_partner);
	};
};

func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Tylko ¿artowa³em.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//Ha, ha, jakoœ mnie to nie œmieszy. A wiêc gdzie one s¹?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tutaj.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Nie chcia³em ciê obraziæ, ale ca³a ta sytuacja trochê mnie niepokoi.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//W porz¹dku. Mi³ej zabawy z tymi DOKUMENTAMI.
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//To moja sprawa.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Te dokumenty s¹ moje. Nie masz prawa ich zatrzymywaæ.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Na razie.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz jest teraz moim wspólnikiem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//Co?! Nie mo¿esz tego zrobiæ.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Wygl¹da na to, ¿e mogê. Zatrzymam te papiery i nic siê nie zmieni.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//Kwestie finansowe za³atwiê z Igarazem.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//No có¿, zatem dbaj dobrze o roœliny.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//Jesteœ œwini¹. Nêdzn¹, chciw¹ œwini¹. Innos ciê uka¿e.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Uwa¿aj na to, co mówisz.",dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Nie masz co robiæ?",dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo);
};

func void dia_babo_kap3_haveyourdocs_end()
{
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Uwa¿aj na to, co mówisz.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//Jestem jak zwykle zbyt uprzejmy.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Nie masz co robiæ?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Dobrze to rozumiem, ale uwierz mi, to bêdzie mia³o pewne konsekwencje.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_iwantmore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Pewne okolicznoœci spowodowa³y, ¿e cena posz³a w górê.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nie jesteœ lepszy od pozosta³ych. Czego chcesz?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co masz?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Mogê ci daæ 121 sztuk z³ota. To wszystko, co mam.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"To nie wystarczy.",dia_babo_kap3_haveyourdocs_iwantmore_notenough);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Zgoda.",dia_babo_kap3_haveyourdocs_iwantmore_thatsenough);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To nie wystarczy.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Ale ja ju¿ nie mam pieniêdzy. Gdybym przypuszcza³, ¿e tak siê stanie, nigdy nie wszed³bym do tego klasztoru.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Zgoda.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tu masz pieni¹dze i zwój z czarem.
	CreateInvItems(self,itsc_mediumheal,1);
	CreateInvItems(self,itmi_gold,121);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	b_giveinvitems(self,other,itmi_gold,121);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_heretheyare()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Trzymaj.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Tak, s¹ w komplecie.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Zagl¹da³eœ do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//A czy to jakaœ ró¿nica?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Nie, pod warunkiem, ¿e dostanê je z powrotem.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Mam nadziejê, ¿e teraz bêdê móg³ odpocz¹æ w spokoju.
	CreateInvItems(self,itsc_mediumheal,1);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};


instance DIA_BABO_KAP3_PERM(C_INFO)
{
	npc = nov_612_babo;
	nr = 39;
	condition = dia_babo_kap3_perm_condition;
	information = dia_babo_kap3_perm_info;
	permanent = TRUE;
	description = "Czy jesteœ zadowolony ze swojego zadania?";
};


func int dia_babo_kap3_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Czy jesteœ zadowolony ze swojego zadania?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//Tak, oczywiœcie. Wiara w m¹droœæ i potêgê Innosa daje mi si³ê.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//Nie chcê okazaæ braku szacunku, ale mam dziœ du¿o do zrobienia.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Mo¿esz kontynuowaæ.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//Dziêkujê.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Jakoœ idzie, ale muszê wracaæ do pracy, bo w przeciwnym razie dzisiaj jej nie skoñczê.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Nie chcê znowu pracowaæ przez pó³ nocy, ¿eby wype³niæ moje obowi¹zki i unikn¹æ k³opotów.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP4_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap4_exit_condition;
	information = dia_babo_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_babo_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP5_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap5_exit_condition;
	information = dia_babo_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_babo_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_PICKPOCKET(C_INFO)
{
	npc = nov_612_babo;
	nr = 900;
	condition = dia_babo_pickpocket_condition;
	information = dia_babo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_babo_pickpocket_condition()
{
	return c_beklauen(17,25);
};

func void dia_babo_pickpocket_info()
{
	Info_ClearChoices(dia_babo_pickpocket);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};

func void dia_babo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babo_pickpocket);
};

func void dia_babo_pickpocket_back()
{
	Info_ClearChoices(dia_babo_pickpocket);
};

