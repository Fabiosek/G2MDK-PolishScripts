
instance DIA_WASILI_EXIT(C_INFO)
{
	npc = bau_907_wasili;
	nr = 999;
	condition = dia_wasili_exit_condition;
	information = dia_wasili_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wasili_exit_condition()
{
	return TRUE;
};

func void dia_wasili_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WASILI_HALLO(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_hallo_condition;
	information = dia_wasili_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wasili_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wasili_hallo_info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Nie próbuj tu nawet niczego dotykaæ. W przeciwnym razie oberwiesz w ³eb, rozumiesz?
};


instance DIA_WASILI_JOB(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_job_condition;
	information = dia_wasili_job_info;
	permanent = FALSE;
	description = "Na czym polega twoja praca?";
};


func int dia_wasili_job_condition()
{
	return TRUE;
};

func void dia_wasili_job_info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//Na czym polega twoja praca?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Onar ka¿e mi nadzorowaæ jego w³asnoœæ.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//Martwi siê, ¿e coœ mo¿e znikn¹æ. W³aœciwie, to mu siê nie dziwiê.
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//Wiêkszoœæ jego najemników to byli skazañcy z kolonii karnej.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//Kiedy nikt nie patrzy, rozkradaj¹ wszystko, co da siê ukraœæ.
};


instance DIA_WASILI_SAMMLER(C_INFO)
{
	npc = bau_907_wasili;
	nr = 4;
	condition = dia_wasili_sammler_condition;
	information = dia_wasili_sammler_info;
	permanent = FALSE;
	description = "Jest tu mnóstwo ró¿nych rupieci.";
};


func int dia_wasili_sammler_condition()
{
	return TRUE;
};

func void dia_wasili_sammler_info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//Jest tu mnóstwo ró¿nych rupieci.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//To prawda, zaœ wiêkszoœæ z nich to doœæ cenne rupiecie. Onar kolekcjonuje wartoœciowe przedmioty.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//Prostemu cz³owiekowi, jak ja, trudno by³oby sobie pozwoliæ na te wszystkie luksusy. Zbieram inne rzeczy.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//Na przyk³ad co?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//Stare monety.
	MIS_WASILI_BRINGOLDCOIN = LOG_RUNNING;
};


instance DIA_WASILI_FIRSTOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_firstoldcoin_condition;
	information = dia_wasili_firstoldcoin_info;
	permanent = TRUE;
	description = "Mam przy sobie pewn¹ star¹ monetê.";
};


var int wasili_bringoldcoin_nomore;

func int dia_wasili_firstoldcoin_condition()
{
	if((MIS_WASILI_BRINGOLDCOIN == LOG_RUNNING) && (WASILISOLDCOINOFFER == 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int wasilisoldcoinoffer;
var int firstoldcoin_angebotenxp_onetime;
var int dia_wasili_firstoldcoin_mehr_onetime;

func void dia_wasili_firstoldcoin_info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//Mam przy sobie pewn¹ star¹ monetê.
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Mmm. Poka¿ mi j¹, proszê.
	};
	b_giveinvitems(other,self,itmi_oldcoin,1);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Och, tak. Niewiele móg³byœ za ni¹ kupiæ.
	};
	if(DIA_WASILI_FIRSTOLDCOIN_MEHR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//Dam ci za ni¹ jedn¹ sztukê z³ota, zgodnie z nomina³em.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//Wiesz ile ci za ni¹ zap³acê. Jedna sztuka z³ota, nie wiêcej.
	};
	Info_ClearChoices(dia_wasili_firstoldcoin);
	Info_AddChoice(dia_wasili_firstoldcoin,"Niee, chyba j¹ jednak zachowam.",dia_wasili_firstoldcoin_nein);
	Info_AddChoice(dia_wasili_firstoldcoin,"Trochê to ma³o, co powiesz na dwie?",dia_wasili_firstoldcoin_mehr);
	Info_AddChoice(dia_wasili_firstoldcoin,"Umowa stoi.",dia_wasili_firstoldcoin_ok);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_giveplayerxp(XP_BRINGOLDCOIN);
		FIRSTOLDCOIN_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_wasili_firstoldcoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//Umowa stoi.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Wspaniale.
	if(WASILISOLDCOINOFFER == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Oto dwie sztuki z³ota.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//Jeœli bêdziesz mia³ takich wiêcej, przynieœ je MNIE.
		WASILISOLDCOINOFFER = 1;
	};
	CreateInvItems(self,itmi_gold,WASILISOLDCOINOFFER);
	b_giveinvitems(self,other,itmi_gold,WASILISOLDCOINOFFER);
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//Trochê to ma³o, co powiesz na dwie?
	if(dia_wasili_firstoldcoin_mehr_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Chyba ¿artujesz! Jeszcze do reszty nie zg³upia³em! Wynocha.
		dia_wasili_firstoldcoin_mehr_onetime = TRUE;
		b_giveinvitems(self,other,itmi_oldcoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Ach. Cholera. Niech bêdzie. Dwie sztuki z³ota za ka¿d¹ star¹ monetê, któr¹ do mnie przyniesiesz. To moja ostateczna oferta.
		WASILISOLDCOINOFFER = 2;
		Info_AddChoice(dia_wasili_firstoldcoin,"W tej sytuacji trzy to chyba niez³a oferta.",dia_wasili_firstoldcoin_zumteufel);
	};
};

func void dia_wasili_firstoldcoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//Niee, chyba j¹ jednak zachowam.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//Zobaczysz, jeszcze wrócisz. Dla ciebie nie maj¹ one ¿adnej wartoœci.
	b_giveinvitems(self,other,itmi_oldcoin,1);
	WASILISOLDCOINOFFER = 0;
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_zumteufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//W tej sytuacji trzy to chyba niez³a oferta.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//IdŸ do diab³a, obdartusie.
	AI_StopProcessInfos(self);
	WASILI_BRINGOLDCOIN_NOMORE = TRUE;
	WASILISOLDCOINOFFER = 0;
};


instance DIA_WASILI_BRINGOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_bringoldcoin_condition;
	information = dia_wasili_bringoldcoin_info;
	permanent = TRUE;
	description = "Interesuj¹ ciê jeszcze stare monety?";
};


func int dia_wasili_bringoldcoin_condition()
{
	if((WASILISOLDCOINOFFER > 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int oldcoincounter;

func void dia_wasili_bringoldcoin_info()
{
	var int oldcoincount;
	var int xp_bringoldcoins;
	var int oldcoingeld;
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//Interesuj¹ ciê jeszcze stare monety?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Jasne. Masz jakieœ?
	oldcoincount = Npc_HasItems(other,itmi_oldcoin);
	if(oldcoincount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//Jedn¹.
		b_giveplayerxp(XP_BRINGOLDCOIN);
		b_giveinvitems(other,self,itmi_oldcoin,1);
		OLDCOINCOUNTER = OLDCOINCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//Kilka.
		b_giveinvitems(other,self,itmi_oldcoin,oldcoincount);
		xp_bringoldcoins = oldcoincount * XP_BRINGOLDCOIN;
		OLDCOINCOUNTER = OLDCOINCOUNTER + oldcoincount;
		b_giveplayerxp(xp_bringoldcoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//Dziêki. Oto twoje pieni¹dze. Przynieœ mi wszystkie, które znajdziesz.
	oldcoingeld = oldcoincount * WASILISOLDCOINOFFER;
	CreateInvItems(self,itmi_gold,oldcoingeld);
	b_giveinvitems(self,other,itmi_gold,oldcoingeld);
};


instance DIA_WASILI_PERM(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_perm_condition;
	information = dia_wasili_perm_info;
	permanent = TRUE;
	description = "Czy ktoœ próbowa³ ju¿ coœ ukraœæ?";
};


func int dia_wasili_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wasili_job))
	{
		return TRUE;
	};
};

func void dia_wasili_perm_info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//Czy ktoœ próbowa³ ju¿ coœ ukraœæ?
	if(KAPITEL <= 2)
	{
		if(PETZCOUNTER_FARM_THEFT > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//Oprócz ciebie, ma siê rozumieæ?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//By³o kilku! Ale wszystkich z³apa³em!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//Kilka wieczorów temu jeden z najemników zakrad³ siê do domu.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//Mia³ na sobie czarn¹ szatê z kapturem, przez co nie mog³em dojrzeæ jego twarzy.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//Uda³o mi siê jednak go sp³oszyæ.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//Nie. Ostatnimi czasy nie.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//Wydaje siê, ¿e czêœæ najemników chce siê oderwaæ od reszty.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//Nie zdziwi³bym siê, gdyby Lee i jego ch³opcy pewnej nocy po prostu odeszli bez s³owa.
	};
};


instance DIA_WASILI_PICKPOCKET(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_pickpocket_condition;
	information = dia_wasili_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wasili_pickpocket_condition()
{
	return c_beklauen(55,90);
};

func void dia_wasili_pickpocket_info()
{
	Info_ClearChoices(dia_wasili_pickpocket);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_BACK,dia_wasili_pickpocket_back);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_PICKPOCKET,dia_wasili_pickpocket_doit);
};

func void dia_wasili_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wasili_pickpocket);
};

func void dia_wasili_pickpocket_back()
{
	Info_ClearChoices(dia_wasili_pickpocket);
};

