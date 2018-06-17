
func void b_kommmit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//ChodŸmy!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Nie potrzebujê ciê, ¿ebyœ robi³ ze mnie g³upca.
};

func void b_biffsanteil_berechnung()
{
	var int momentankohle;
	var int ueberschusskohle;
	momentankohle = Npc_HasItems(hero,itmi_gold);
	ueberschusskohle = momentankohle - DJG_BIFF_SCGOLD;
	BIFFSANTEIL = ueberschusskohle / 2;
};

func void b_biffsanteil_printscreen()
{
	var string biffsanteiltext_teil;
	var string biffsanteiltext;
	var string anteil;
	anteil = IntToString(BIFFSANTEIL);
	biffsanteiltext_teil = ConcatStrings(PRINT_BIFFSANTEIL,anteil);
	biffsanteiltext = ConcatStrings(biffsanteiltext_teil,PRINT_BIFFGOLD);
	AI_PrintScreen(biffsanteiltext,-1,45,FONT_SCREENSMALL,4);
};

func void b_biff_setrefusetalk()
{
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		Npc_SetRefuseTalk(biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(biff,600);
	};
};


instance DIA_BIFF_EXIT(C_INFO)
{
	npc = djg_713_biff;
	nr = 999;
	condition = dia_biff_exit_condition;
	information = dia_biff_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_exit_condition()
{
	return TRUE;
};

func void dia_biff_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_HALLO(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_hallo_condition;
	information = dia_biff_hallo_info;
	description = "Co tu porabiasz?";
};


func int dia_biff_hallo_condition()
{
	return TRUE;
};

func void dia_biff_hallo_info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Co tu robisz?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//To naprawdê najg³upsze pytanie, jakie od dawna s³ysza³em. A na co to wygl¹da?
	Info_AddChoice(dia_biff_hallo,"Nie potrafiê siê domyœliæ po twojej idiotycznej minie.",dia_biff_hallo_spott);
	Info_AddChoice(dia_biff_hallo,"Nie mam pojêcia.",dia_biff_hallo_keineahnung);
	Info_AddChoice(dia_biff_hallo,"Niewa¿ne.",dia_biff_hallo_doof);
};

func void dia_biff_hallo_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Niewa¿ne.
	Info_ClearChoices(dia_biff_hallo);
};

func void dia_biff_hallo_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//Nie potrafiê siê domyœliæ po twojej idiotycznej minie. Dlatego musia³em zapytaæ.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//Za du¿o gadasz, jak na mój gust. Pora, ¿eby ktoœ ciê uciszy³.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};

func void dia_biff_hallo_keineahnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Nie mam pojêcia.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//Czekam, a¿ coœ siê wreszcie stanie.
	Info_AddChoice(dia_biff_hallo,"A co ma siê staæ?",dia_biff_hallo_keineahnung_was);
};

func void dia_biff_hallo_keineahnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//A co ma siê staæ?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Och, stary, naprawdê nie jesteœ specjalnie bystry. Gdybym to wiedzia³, to bym nie musia³ czekaæ.
	Info_AddChoice(dia_biff_hallo,"Wiêc co mo¿e siê zdarzyæ?",dia_biff_hallo_keineahnung_was_was2);
};

func void dia_biff_hallo_keineahnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//Wiêc co mo¿e siê zdarzyæ?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Dzia³asz mi na nerwy. S³uchaj, nie obchodzi mnie, co siê stanie. Wa¿ne, ¿eby w ogóle coœ siê sta³o.
	Info_AddChoice(dia_biff_hallo,"Wiêc czemu czegoœ nie zrobisz?",dia_biff_hallo_keineahnung_was_was2_was3);
};

func void dia_biff_hallo_keineahnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//Wiêc czemu czegoœ nie zrobisz?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Jak nie przestaniesz zadawaæ g³upich pytañ, to ci zamknê tê parszyw¹ gêbê.
	Info_AddChoice(dia_biff_hallo,"Jeœli bêdziesz tak bezczynnie czeka³, to nic siê nie stanie!",dia_biff_hallo_keineahnung_was_was2_was3_was4);
};

func void dia_biff_hallo_keineahnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Jeœli bêdziesz tak bezczynnie czeka³, to nic siê nie stanie!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Doœæ tego!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_WASHIERIMTAL(C_INFO)
{
	npc = djg_713_biff;
	nr = 7;
	condition = dia_biff_washierimtal_condition;
	information = dia_biff_washierimtal_info;
	description = "Co chcesz znaleŸæ tu, w Górniczej Dolinie?";
};


func int dia_biff_washierimtal_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_hallo))
	{
		return TRUE;
	};
};

func void dia_biff_washierimtal_info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Co chcesz znaleŸæ tu, w Górniczej Dolinie?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Z³oto i s³awê. A co innego? Kiedy uporam siê ze smokiem, bêdê siê tarza³ w z³ocie.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//Bêdê go mia³ tyle, ¿e resztê ¿ycia spêdzê w gospodach i zamtuzach.
	Info_AddChoice(dia_biff_washierimtal,"No có¿, wiêc ¿yczê ci szczêœcia.",dia_biff_washierimtal_vielglueck);
	Info_AddChoice(dia_biff_washierimtal,"Tak, albo zginiesz.",dia_biff_washierimtal_ihrtot);
};

func void dia_biff_washierimtal_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Tak, albo zginiesz.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//No to co? To nieuniknione. Jeœli chcesz byæ bogaty, musisz trochê zaryzykowaæ.
	Info_ClearChoices(dia_biff_washierimtal);
};

func void dia_biff_washierimtal_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//No có¿, wiêc ¿yczê ci szczêœcia.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//Nie potrzebujê szczêœcia. Wystarczy mi mój topór.
	Info_ClearChoices(dia_biff_washierimtal);
};


instance DIA_BIFF_ARBEITEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 8;
	condition = dia_biff_arbeiten_condition;
	information = dia_biff_arbeiten_info;
	permanent = TRUE;
	description = "Mo¿e chcesz dla mnie od tej pory pracowaæ?";
};


func int dia_biff_arbeiten_condition()
{
	if((DJG_BIFFPARTY == FALSE) && Npc_KnowsInfo(other,dia_biff_hallo) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_arbeiten_info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Mo¿e chcesz dla mnie od tej pory pracowaæ?
	b_logentry(TOPIC_DRAGONHUNTER,"£owca smoków Biff to typowy najemnik. Jeœli mu zap³acê, bêdzie dla mnie walczy³.");
	if(DJG_BIFFPARTY_NOMORE >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//Raz tego próbowaliœmy. Nie bardzo wysz³o. Dziêki, to mnie nie interesuje.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Mmm. Czemu nie. Ile p³acisz?
	};
	Info_ClearChoices(dia_biff_arbeiten);
	Info_AddChoice(dia_biff_arbeiten,"Bêdziesz móg³ uwa¿aæ siê za szczêœciarza, jeœli oszczêdzê ci ¿ycie.",dia_biff_arbeiten_lebenlassen);
	Info_AddChoice(dia_biff_arbeiten,"Dostaniesz po³owê ³upów.",dia_biff_arbeiten_halbehalbe);
	Info_AddChoice(dia_biff_arbeiten,"Na razie zap³acê ci 100 sztuk z³ota.",dia_biff_arbeiten_100);
};

func void dia_biff_arbeiten_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//Na razie zap³acê ci 100 sztuk z³ota.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Dobra. Tak czy inaczej, to pocz¹tek. Ruszaj. Pójdê za tob¹.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		b_biff_setrefusetalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BIFFPARTY = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
	};
};

func void dia_biff_arbeiten_halbehalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Dostaniesz po³owê ³upów.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//To brzmi nieŸle. Ale ostrzegam ciê, nie próbuj mnie oszukaæ, bo po¿a³ujesz.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//I jeszcze jedno. Nie chcê ¿adnej broni ani innego z³omu, który pozbierasz. Biorê tylko z³oto, jasne?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BIFFPARTY = TRUE;
	DJG_BIFF_HALBEHALBE = TRUE;
	b_biff_setrefusetalk();
	if(DJG_BIFF_HALBEHALBE_AGAIN == FALSE)
	{
		DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		DJG_BIFF_HALBEHALBE_AGAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Ale po co ja to mówiê. Ty ju¿ to przecie¿ wiesz.
	};
};

func void dia_biff_arbeiten_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Bêdziesz móg³ uwa¿aæ siê za szczêœciarza, jeœli oszczêdzê ci ¿ycie.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_GELDEINTREIBEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 9;
	condition = dia_biff_geldeintreiben_condition;
	information = dia_biff_geldeintreiben_info;
	important = TRUE;
	permanent = TRUE;
};


var int biff_labert_geldeintreiben;

func int dia_biff_geldeintreiben_condition()
{
	if((DJG_BIFF_SCGOLD < (Npc_HasItems(hero,itmi_gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void dia_biff_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Zaraz! Mówi³eœ, ¿e po³owa ³upów jest moja! Dawaj to tutaj!
	b_biffsanteil_berechnung();
	b_biffsanteil_printscreen();
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Nie staæ mnie na twoje us³ugi.",dia_biff_geldeintreiben_zuteuer);
	Info_AddChoice(dia_biff_geldeintreiben,"Oto twoja dzia³ka.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Oto twoja czêœæ.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//W porz¹dku. Ruszajmy dalej.
	AI_StopProcessInfos(self);
	b_giveinvitems(other,self,itmi_gold,BIFFSANTEIL);
	b_biff_setrefusetalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};

func void dia_biff_geldeintreiben_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//Nie staæ mnie na twoje us³ugi.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Przestañ jêczeæ. Umawialiœmy siê, pó³ na pó³.
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"Obawiam siê, ¿e teraz musimy siê rozstaæ.",dia_biff_geldeintreiben_zuteuer_trennen);
	Info_AddChoice(dia_biff_geldeintreiben,"Oto twoja dzia³ka.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_zuteuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//Obawiam siê, ¿e teraz musimy siê rozstaæ.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Skoro tak mówisz. Wiêc chyba muszê zabraæ moj¹ czêœæ.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_ICHBLEIBHIER(C_INFO)
{
	npc = djg_713_biff;
	nr = 6;
	condition = dia_biff_ichbleibhier_condition;
	information = dia_biff_ichbleibhier_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_ichbleibhier_condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(swampdragon) == FALSE) && (swampdragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(rockdragon) == FALSE) && (rockdragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(firedragon) == FALSE) && (firedragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(icedragon) == FALSE) && (icedragon.flags != 0))) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void dia_biff_ichbleibhier_info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Naprawdê rozrywkowa okolica. IdŸ przodem. Ja bêdê w pobli¿u.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_BIFF_STAY = TRUE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_STAY_AWAYFROMOC(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_stay_awayfromoc_condition;
	information = dia_biff_stay_awayfromoc_info;
	nr = 3;
	permanent = TRUE;
	description = "(Ponownie zabierz Biffa ze sob¹)";
};


func int dia_biff_stay_awayfromoc_condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 500) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 500)) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_stay_awayfromoc_info()
{
	b_kommmit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_BIFF_STAY = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_KOHLEWEGGEBEN(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_kohleweggeben_condition;
	information = dia_biff_kohleweggeben_info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_kohleweggeben_condition()
{
	if((DJG_BIFF_SCGOLD > Npc_HasItems(hero,itmi_gold)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
	};
};

func void dia_biff_kohleweggeben_info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Nie rozsypuj wszêdzie z³ota.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Lepiej daj je mnie.
	AI_StopProcessInfos(self);
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_BIFFLOSWERDEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 11;
	condition = dia_biff_biffloswerden_condition;
	information = dia_biff_biffloswerden_info;
	permanent = TRUE;
	description = "S¹dzê, ¿e tutaj powinna zakoñczyæ siê nasza wspó³praca.";
};


func int dia_biff_biffloswerden_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_biffloswerden_info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//S¹dzê, ¿e tutaj powinna zakoñczyæ siê nasza wspó³praca.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Jak chcesz. Ja te¿ wolê zaj¹æ siê czymœ ciekawszym. Na razie.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_MEHRGELD(C_INFO)
{
	npc = djg_713_biff;
	nr = 12;
	condition = dia_biff_mehrgeld_condition;
	information = dia_biff_mehrgeld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_mehrgeld_condition()
{
	if((DJG_BIFFPARTY == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};


var int dia_biff_mehrgeld_info_onetime;

func void dia_biff_mehrgeld_info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//Zaczynam uwa¿aæ, ¿e powinienem dostawaæ od ciebie wiêcej pieniêdzy.
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 sztuk z³ota powinno wystarczyæ.
		if(dia_biff_mehrgeld_info_onetime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Spokojnie. Oczywiœcie, nie zapomnia³em, ¿e dzielimy ³upy.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//Dlatego nie naprzykrzam ci siê zbyt czêsto, jeœli chodzi o pieni¹dze.
			dia_biff_mehrgeld_info_onetime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Chcê nastêpne 100 z³otych monet.
	};
	Info_ClearChoices(dia_biff_mehrgeld);
	Info_AddChoice(dia_biff_mehrgeld,"Nie staæ mnie na twoje us³ugi.",dia_biff_mehrgeld_zuteuer);
	Info_AddChoice(dia_biff_mehrgeld,"W porz¹dku. Jesteœ tego warty.",dia_biff_mehrgeld_ok);
};

func void dia_biff_mehrgeld_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//W porz¹dku. Jesteœ tego warty.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Te¿ tak myœlê. No to ruszajmy.
		AI_StopProcessInfos(self);
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		};
		b_biff_setrefusetalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//Ty frajerze, nawet nie mo¿esz zap³aciæ najemnikowi.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//Chyba poszukam sobie innego wspólnika.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_BIFF_HALBEHALBE = FALSE;
		DJG_BIFFPARTY = FALSE;
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
	};
};

func void dia_biff_mehrgeld_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//Nie staæ mnie na twoje us³ugi.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//No, to od tej pory sam siê pakuj w tarapaty.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
};


instance DIA_BIFF_HEILUNG(C_INFO)
{
	npc = djg_713_biff;
	nr = 4;
	condition = dia_biff_heilung_condition;
	information = dia_biff_heilung_info;
	permanent = TRUE;
	description = "Potrzebujesz mikstury leczniczej?";
};


func int dia_biff_heilung_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_heilung_info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Potrzebujesz mikstury leczniczej?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Jasne. Nie zaszkodzi.
	Info_ClearChoices(dia_biff_heilung);
	Info_AddChoice(dia_biff_heilung,"Dam ci póŸniej.",dia_biff_heilung_spaeter);
	Info_AddChoice(dia_biff_heilung,"(najmniejsza mikstura lecznicza)",dia_biff_heilung_heiltranklow);
	Info_AddChoice(dia_biff_heilung,"(najlepsza mikstura lecznicza)",dia_biff_heilung_heiltrank);
};

func void dia_biff_heilung_heiltrank()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//No to chyba musimy zaczekaæ, a¿ bêdziesz mia³ coœ dla mnie.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltranklow()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	}
	else if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	}
	else if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//Niestety, nie mam nic w tej chwili. Wrócimy to tego póŸniej.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//Dam ci póŸniej.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Tylko nie zapomnij.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DRACHENTOT(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_drachentot_condition;
	information = dia_biff_drachentot_info;
	description = "Gotowe. Wszystkie smoki nie ¿yj¹.";
};


func int dia_biff_drachentot_condition()
{
	if(DJG_BIFFSURVIVEDLASTDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_drachentot_info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//Gotowe. Wszystkie smoki nie ¿yj¹.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Taaa. A ja nadal stojê.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Jesteœ pewien, ¿e to by³ ostatni?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//Tak s¹dzê.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//Szkoda. Dopiero siê rozgrza³em.
	b_giveplayerxp(XP_BIFFSURVIVEDLASTDRAGON);
};


instance DIA_BIFF_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_713_biff;
	nr = 2;
	condition = dia_biff_knowwhereenemy_condition;
	information = dia_biff_knowwhereenemy_info;
	permanent = TRUE;
	description = "Masz ochotê na ma³¹ wycieczkê po œwiecie?";
};


func int dia_biff_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BIFF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Masz ochotê na ma³¹ wycieczkê po œwiecie?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Co?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Niewa¿ne. I tak mam kompletn¹ za³ogê.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Przestañ mnie irytowaæ cz³owieku.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Zamierzam opuœciæ Khorinis. Wybieram siê na wyspê, ¿eby poszukaæ nowych przeciwników.
		Info_ClearChoices(dia_biff_knowwhereenemy);
		Info_AddChoice(dia_biff_knowwhereenemy,"Tak sobie tylko pomyœla³em, ¿e o tym wspomnê.",dia_biff_knowwhereenemy_no);
		Info_AddChoice(dia_biff_knowwhereenemy,"Nie chcesz iœæ ze mn¹?",dia_biff_knowwhereenemy_yes);
	};
};

func void dia_biff_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Nie chcesz iœæ ze mn¹?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Nie obchodz¹ mnie kolejni wrogowie. Chcê...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Tam, gdzie idziemy, bêdzie wiêcej z³ota, ni¿ jesteœ w stanie unieœæ.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//W takim razie, wchodzê w to. Gdzie idziemy?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Ale najpierw musimy wydostaæ siê z Górniczej Doliny.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//Nie ma sprawy. Ruszam w drogê. Spotkamy siê na prze³êczy.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Biff, zachêcony perspektyw¹ bogactwa, postanowi³ udaæ siê ze mn¹. Mogê na niego liczyæ, dopóki staæ mnie na jego us³ugi.");
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BIFF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	BIFF_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(dia_biff_knowwhereenemy);
};

func void dia_biff_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Tak sobie tylko pomyœla³em, ¿e o tym wspomnê.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Proszê, proszê. No to mi³ej zabawy.
	BIFF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_biff_knowwhereenemy);
};


instance DIA_BIFF_PASS(C_INFO)
{
	npc = djg_713_biff;
	nr = 55;
	condition = dia_biff_pass_condition;
	information = dia_biff_pass_info;
	permanent = TRUE;
	description = "Dasz radê przejœæ przez prze³êcz?";
};


func int dia_biff_pass_condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (BIFF_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_biff_pass_info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Dasz radê przejœæ przez prze³êcz?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Przestañ marudziæ. Dalej. Chcê w koñcu dostaæ siê na szczyt.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff;
	nr = 900;
	condition = dia_biff_pickpocket_condition;
	information = dia_biff_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_pickpocket_condition()
{
	return c_beklauen(92,320);
};

func void dia_biff_pickpocket_info()
{
	Info_ClearChoices(dia_biff_pickpocket);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_BACK,dia_biff_pickpocket_back);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_PICKPOCKET,dia_biff_pickpocket_doit);
};

func void dia_biff_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_pickpocket);
};

func void dia_biff_pickpocket_back()
{
	Info_ClearChoices(dia_biff_pickpocket);
};

