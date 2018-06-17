
instance DIA_ROSI_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_exit_condition;
	information = dia_rosi_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_rosi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_HALLO(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_hallo_condition;
	information = dia_rosi_hallo_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_rosi_hallo_condition()
{
	return TRUE;
};

func void dia_rosi_hallo_info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Có¿, w³aœciwie nie do koñca. Krêgos³up strasznie mnie boli od ciê¿kiej pracy. Co ciê tu sprowadza? Tak rzadko miewam goœci.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Na ogó³ odwiedzaj¹ mnie albo zbiry z gór, albo ci okropni stra¿nicy miejscy.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//Ostatnio doœæ czêsto nachodz¹ farmy, ale ty nie wygl¹dasz jak jeden z nich.
	};
};


instance DIA_ROSI_WASMACHSTDU(C_INFO)
{
	npc = bau_936_rosi;
	nr = 4;
	condition = dia_rosi_wasmachstdu_condition;
	information = dia_rosi_wasmachstdu_info;
	description = "Co tu porabiasz?";
};


func int dia_rosi_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_rosi_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//Czym siê zajmujesz?
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//Od lat sama siê o to pytam. Mój m¹¿, Sekob, ma na pieñku ju¿ chyba ze wszystkimi w okolicy.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//Jest zad³u¿ony po uszy. Dlatego te¿ podkrada ró¿ne towary Onarowi, sprzedaj¹c je póŸniej w mieœcie.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//Dziêki tym machlojkom uda³o mu siê zbiæ fortunê.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//Ka¿e ludziom pracowaæ tak d³ugo, a¿ biedakom zaczynaj¹ siê ³amaæ krêgos³upy. Dosz³o do tego, ¿e nazywaj¹ go nadzorc¹ niewolników.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//Nie jestem specjalnie dumna z tego, ¿e Sekob jest moim mê¿em, uwierz mi. Czasem ¿a³ujê, ¿e nie ma ju¿ Bariery.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Mo¿e chcia³byœ kupiæ coœ do jedzenia albo broñ do polowania w lesie?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,"Rosi sprzedaje na farmie Sekoba przeró¿ne towary.");
};


instance DIA_ROSI_WAREZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 2;
	condition = dia_rosi_warez_condition;
	information = dia_rosi_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Co mo¿esz mi zaoferowaæ?";
};


func int dia_rosi_warez_condition()
{
	if((Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)) || Npc_IsDead(sekob)) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_rosi_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//Co mo¿esz mi zaoferowaæ?
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//A czego potrzebujesz?
};


instance DIA_ROSI_BARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 6;
	condition = dia_rosi_barriere_condition;
	information = dia_rosi_barriere_info;
	description = "Bariery?";
};


func int dia_rosi_barriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_barriere_info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Bariery?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//No wiesz, kopu³y otaczaj¹cej do niedawna Górnicz¹ Dolinê.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Wielu robotników i farmerów, którzy pope³nili jakieœ przestêpstwa, po prostu tam wrzucano, ju¿ nigdy nie wracali.
};


instance DIA_ROSI_DUINBARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 10;
	condition = dia_rosi_duinbarriere_condition;
	information = dia_rosi_duinbarriere_info;
	description = "Widzia³aœ kiedykolwiek Barierê?";
};


func int dia_rosi_duinbarriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_barriere))
	{
		return TRUE;
	};
};

func void dia_rosi_duinbarriere_info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Widzia³aœ kiedykolwiek Barierê?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//Nie. Jedynie o niej s³ysza³am. Bengar, farmer z pastwisk po³o¿onych nieco wy¿ej, na pewno bêdzie móg³ powiedzieæ ci wiêcej.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//Jego farma znajduje siê niedaleko prze³êczy prowadz¹cej do Górniczej Doliny.
};


instance DIA_ROSI_BENGAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 11;
	condition = dia_rosi_bengar_condition;
	information = dia_rosi_bengar_info;
	description = "Jak dojœæ do farmy Bengara?";
};


func int dia_rosi_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_duinbarriere) && (Npc_IsDead(balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_bengar_info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//Jak dojœæ do farmy Bengara?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Zapytaj o to Balthasara. To nasz pasterz. Czasem prowadzi stado na pastwiska Bengara.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//Jestem pewna, ¿e powie ci, jak tam dojœæ.
};


instance DIA_ROSI_MILIZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 7;
	condition = dia_rosi_miliz_condition;
	information = dia_rosi_miliz_info;
	description = "Dlaczego stra¿ atakuje wasze farmy?";
};


func int dia_rosi_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_rosi_miliz_info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//Dlaczego stra¿ miejska atakuje wasze farmy?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Poniewa¿ nie ma ich kto chroniæ, ³atwiej jest je spl¹drowaæ i okraœæ, ni¿ kupowaæ towary.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//Król jest daleko st¹d, musimy wiêc pracowaæ dla Onara i mieæ nadziejê, ¿e przyœle na czas swoich ludzi, ¿eby uchronili nas przed atakami.
};


instance DIA_ROSI_ONAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 8;
	condition = dia_rosi_onar_condition;
	information = dia_rosi_onar_info;
	description = "Jak wygl¹da pomoc ze strony Onara?";
};


func int dia_rosi_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_miliz))
	{
		return TRUE;
	};
};

func void dia_rosi_onar_info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//Jak wygl¹da pomoc ze strony Onara?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Czasami wiemy wczeœniej o planowanym przez stra¿ ataku.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Wtedy wysy³amy kogoœ na farmê w³aœciciela ziemskiego i prosimy o pomoc.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//Z regu³y najemnicy, których op³aca, przybywaj¹ tu na czas, by rozprawiæ siê ze stra¿nikami.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//Ale tak po prawdzie, najemnicy wcale nie s¹ du¿o lepsi od najeŸdŸców.
};


instance DIA_ROSI_PERMKAP1(C_INFO)
{
	npc = bau_936_rosi;
	nr = 80;
	condition = dia_rosi_permkap1_condition;
	information = dia_rosi_permkap1_info;
	permanent = TRUE;
	description = "G³owa do góry.";
};


func int dia_rosi_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)))
	{
		return TRUE;
	};
};

func void dia_rosi_permkap1_info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//G³owa do góry.
	if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//IdŸ siê utop w jeziorze!
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//Uwa¿aj na siebie i nie pozwól, by ciê dopadli.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP3_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap3_exit_condition;
	information = dia_rosi_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_rosi_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP4_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap4_exit_condition;
	information = dia_rosi_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_rosi_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP5_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap5_exit_condition;
	information = dia_rosi_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_rosi_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_FLEEFROMSEKOB(C_INFO)
{
	npc = bau_936_rosi;
	nr = 50;
	condition = dia_rosi_fleefromsekob_condition;
	information = dia_rosi_fleefromsekob_info;
	description = "Co robisz w tej dziczy?";
};


func int dia_rosi_fleefromsekob_condition()
{
	if((KAPITEL == 5) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_fleefromsekob_info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//Co robisz w tej dziczy?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//Nie mog³am ju¿ d³u¿ej wytrzymaæ na farmie Sekoba. Kl¹³ jak szewc.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//Krzycza³ i krzycza³, w koñcu w ogóle nie da³o siê z nim rozmawiaæ.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//Muszê siê st¹d wynosiæ, ale nie wiem, dok¹d iœæ.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Mo¿e zechcia³byœ mi pomóc?
	b_giveplayerxp(XP_AMBIENT);
	ROSIFOUNDKAP5 = TRUE;
};


instance DIA_ROSI_HILFE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 51;
	condition = dia_rosi_hilfe_condition;
	information = dia_rosi_hilfe_info;
	description = "Chcê ciê st¹d zabraæ.";
};


func int dia_rosi_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_fleefromsekob) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_hilfe_info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//Chcê ciê st¹d zabraæ.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//Móg³bym odprowadziæ ciê do miasta.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//Zaprowadzê ciê na farmê w³aœciciela.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//ChodŸ ze mn¹ do klasztoru, znajdziesz tam gor¹ce przyjêcie.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//Nigdy nie zapomnê co dla mnie zrobi³eœ i oczywiœcie zap³acê.
	if(Npc_IsDead(till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//IdŸ przodem, bêdê sz³a za tob¹.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//IdŸ przodem, bêdziemy szli za tob¹
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		b_startotherroutine(till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		b_startotherroutine(till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		b_startotherroutine(till,"FollowKloster");
	};
	Log_CreateTopic(TOPIC_ROSISFLUCHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ROSISFLUCHT,LOG_RUNNING);
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi nie mog³a wytrzymaæ na farmie Sekoba, ale teraz nie wie, gdzie siê udaæ. Wyprowadzê j¹ z tej g³uszy.");
	MIS_ROSISFLUCHT = LOG_RUNNING;
};


instance DIA_ROSI_ANGEKOMMEN(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_angekommen_condition;
	information = dia_rosi_angekommen_info;
	important = TRUE;
};


func int dia_rosi_angekommen_condition()
{
	if((KAPITEL == 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && (hero.guild == GIL_PAL)) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG)) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void dia_rosi_angekommen_info()
{
	var int xpforboth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//Dalej ju¿ sobie poradzê.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Bardzo ci dziêkujê. Có¿ ja bym bez ciebie zrobi³a.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_BRINGROSIBACKTOSEKOB = LOG_OBSOLETE;
	MIS_ROSISFLUCHT = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Proszê, przyjmij w podziêce ten skromny podarek.
	CreateInvItems(rosi,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,450);
	if(Npc_IsDead(till))
	{
		b_giveplayerxp(XP_SAVEDROSI);
	}
	else
	{
		xpforboth = XP_SAVEDROSI + XP_AMBIENT;
		b_giveplayerxp(xpforboth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		b_startotherroutine(till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"BIGFARM") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		b_startotherroutine(till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		b_startotherroutine(till,"KLOSTER");
	};
};


instance DIA_ROSI_TRAIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_trait_condition;
	information = dia_rosi_trait_info;
	description = "Widzisz, jesteœmy w domu.";
};


func int dia_rosi_trait_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_trait_info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//Widzisz, jesteœmy w domu.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//Ty brudna œwinio, jesteœ najgorszym chamem, jakiego spotka³am w ¿yciu.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_ROSISFLUCHT = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_MINENANTEIL(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_minenanteil_condition;
	information = dia_rosi_minenanteil_info;
	description = "Sprzedajesz nielegalne udzia³y w kopalni, nie wstyd ci?";
};


func int dia_rosi_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rosi_minenanteil_info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//Sprzedajesz nielegalne udzia³y w kopalni, nie wstyd ci?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//Nie. Ja te¿ muszê z czegoœ ¿yæ. Nie ja, zreszt¹, wprowadzi³am je do obiegu.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_KAP6_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap6_exit_condition;
	information = dia_rosi_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_rosi_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_PICKPOCKET(C_INFO)
{
	npc = bau_936_rosi;
	nr = 900;
	condition = dia_rosi_pickpocket_condition;
	information = dia_rosi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rosi_pickpocket_condition()
{
	return c_beklauen(30,75);
};

func void dia_rosi_pickpocket_info()
{
	Info_ClearChoices(dia_rosi_pickpocket);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_BACK,dia_rosi_pickpocket_back);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_PICKPOCKET,dia_rosi_pickpocket_doit);
};

func void dia_rosi_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rosi_pickpocket);
};

func void dia_rosi_pickpocket_back()
{
	Info_ClearChoices(dia_rosi_pickpocket);
};

