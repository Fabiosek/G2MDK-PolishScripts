
instance DIA_ADDON_MIGUEL_EXIT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 999;
	condition = dia_addon_miguel_exit_condition;
	information = dia_addon_miguel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_miguel_exit_condition()
{
	return TRUE;
};

func void dia_addon_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_PICKPOCKET(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 900;
	condition = dia_addon_miguel_pickpocket_condition;
	information = dia_addon_miguel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_miguel_pickpocket_condition()
{
	return c_beklauen(40,48);
};

func void dia_addon_miguel_pickpocket_info()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_BACK,dia_addon_miguel_pickpocket_back);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_PICKPOCKET,dia_addon_miguel_pickpocket_doit);
};

func void dia_addon_miguel_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};

func void dia_addon_miguel_pickpocket_back()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};


instance DIA_ADDON_MIGUEL_HI(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 1;
	condition = dia_addon_miguel_hi_condition;
	information = dia_addon_miguel_hi_info;
	permanent = FALSE;
	description = "Co tu robisz?";
};


func int dia_addon_miguel_hi_condition()
{
	return TRUE;
};

func void dia_addon_miguel_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//Co tu robisz?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Szukasz czegoœ?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Roœlin - szukam roœlin.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Zwykle szukam roœlin.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Wiêkszoœæ tego, co tu roœnie, mo¿na wykorzystaæ.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Wiele zió³ ma w³aœciwoœci lecznicze, a bagienne ziele mo¿na paliæ.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Zanim umieœcili mnie za barier¹, pracowa³em u alchemika.
};


instance DIA_ADDON_MIGUEL_STORY(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 2;
	condition = dia_addon_miguel_story_condition;
	information = dia_addon_miguel_story_info;
	permanent = FALSE;
	description = "Za co ciê zamknêli za barier¹?";
};


func int dia_addon_miguel_story_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_story_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Za co ciê zamknêli za barier¹?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//Eksperymentowa³em z ró¿nymi miksturami, które wp³ywaj¹ na umys³ i pozwalaj¹ nim manipulowaæ.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//Ignaz, mój mistrz, wypi³ kiedyœ jeden z moich "eksperymentów" zamiast wina.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//No... zacz¹³ siê zachowywaæ... nieco irracjonalnie. Od tamtej pory jest... troszkê niezrównowa¿ony.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//Magowie zes³ali mnie do kolonii karnej za "prowadzenie badañ w zakazanej dziedzinie".
};


instance DIA_ADDON_MIGUEL_LAGER(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 3;
	condition = dia_addon_miguel_lager_condition;
	information = dia_addon_miguel_lager_info;
	permanent = FALSE;
	description = "Co mo¿esz mi powiedzieæ o obozowisku?";
};


func int dia_addon_miguel_lager_condition()
{
	return TRUE;
};

func void dia_addon_miguel_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//Co mo¿esz mi powiedzieæ o obozowisku?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Niewiele. Nigdy tam nie by³em.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Tylko ludzie Kruka byli tam od pocz¹tku. Wszyscy pozostali przyszli póŸniej albo wci¹¿ czekaj¹ na przyjêcie. Tak jak ja.
};


instance DIA_ADDON_MIGUEL_WHEREFROM(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_wherefrom_condition;
	information = dia_addon_miguel_wherefrom_info;
	permanent = FALSE;
	description = "Jak siê tu dosta³eœ?";
};


func int dia_addon_miguel_wherefrom_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi) || Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_wherefrom_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Jak siê tu dosta³eœ?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Myœlê, ¿e t¹ sam¹ drog¹ co ty. Z piratami przez morze.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//Ta dolina jest niedostêpna z wyspy. Mo¿na siê do niej dostaæ tylko morzem.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//Dok³adnie.
};


instance DIA_ADDON_MIGUEL_ANGEFORDERT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_angefordert_condition;
	information = dia_addon_miguel_angefordert_info;
	permanent = FALSE;
	description = "Kiedy zwykle potrzebuj¹ nowych ludzi?";
};


func int dia_addon_miguel_angefordert_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_angefordert_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//Kiedy zwykle potrzebuj¹ nowych ludzi?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//Gdy jest ich za ma³o...
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//Gdy kogoœ zabije kopalniany pe³zacz, potrzebuj¹ drugiego na wymianê.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//No i czasem ch³opaki siê pozabijaj¹. Ale ostatnio nie jest tak Ÿle.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Kruk zdo³a³ to jakoœ zorganizowaæ i pilnuje, ¿eby w kopalni nie pracowali wszyscy naraz.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//Nie mam pojêcia, jak to dok³adnie funkcjonuje. Nigdy tam nie by³em.
};


instance DIA_ADDON_MIGUEL_FORTUNO(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 6;
	condition = dia_addon_miguel_fortuno_condition;
	information = dia_addon_miguel_fortuno_info;
	permanent = FALSE;
	description = "Fortuno sprawia wra¿enie ob³¹kanego.";
};


func int dia_addon_miguel_fortuno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_free))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_fortuno_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno sprawia wra¿enie ob³¹kanego. Myœlê, ¿e jakaœ mikstura mo¿e przywróciæ mu pamiêæ.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? To jeden ze s³u¿¹cych Kruka.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//Teraz to tylko wrak. A wszystko z winy Kruka.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Kruk. Nigdy o nim wiele nie myœla³em. Hmm, dobra. Niestety, nie mogê warzyæ mikstur tutaj, na bagnach.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//Móg³bym przyrz¹dziæ miksturê. W obozie jest odpowiedni stó³. Gdybym tylko mia³ przepis...
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Lepiej b¹dŸ ostro¿ny z tym przepisem. Warzenie mikstur to niebezpieczne zajêcie.
	b_giveinvitems(self,other,itwr_addon_mcelixier_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//Je¿eli u¿yjesz nieodpowiednich sk³adników albo coœ pójdzie nie tak, mikstura bêdzie œmierteln¹ trucizn¹.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//Bêdê uwa¿a³.
	b_logentry(TOPIC_ADDON_FORTUNO,"Miguel da³ mi przepis na miksturê, która ma pomóc Fortuna w odzyskaniu pamiêci. Powinienem przyrz¹dziæ j¹ dopiero wtedy, gdy dobrze poznam dzia³anie wszystkich sk³adników. Inaczej mo¿e byæ zabójcza.");
};


instance DIA_ADDON_MIGUEL_BRAU(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 7;
	condition = dia_addon_miguel_brau_condition;
	information = dia_addon_miguel_brau_info;
	permanent = FALSE;
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};


func int dia_addon_miguel_brau_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_story))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_brau_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//Nie mam na to czasu. Przyszed³em tu zdobyæ trochê z³ota. Na razie, dopóki nie wpuszcz¹ mnie do obozowiska, zarabiam na handlu zio³ami.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//Mogê jednak zaopatrzyæ ciê w mikstury.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Od Miguela mogê kupiæ roœliny i mikstury.");
};


instance DIA_ADDON_MIGUEL_TRADE(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 888;
	condition = dia_addon_miguel_trade_condition;
	information = dia_addon_miguel_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};


func int dia_addon_miguel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_brau))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

