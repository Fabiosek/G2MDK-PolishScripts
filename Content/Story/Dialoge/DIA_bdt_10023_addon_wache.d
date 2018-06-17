
instance DIA_ADDON_10023_WACHE_EXIT(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 999;
	condition = dia_addon_10023_wache_exit_condition;
	information = dia_addon_10023_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10023_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_10023_WACHE_HI(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 2;
	condition = dia_addon_10023_wache_hi_condition;
	information = dia_addon_10023_wache_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10023_wache_hi_condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void dia_addon_10023_wache_hi_info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hej, dok¹d idziesz? Zamierzasz ruszyæ t¹ œcie¿k¹?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//No tak, dlaczego nie?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Na dole jest wiêcej niewolników. Nie bij ich za bardzo, jeœli nie s¹ w stanie pracowaæ.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//Nie chcemy, ¿eby siê obijali. Maj¹ wydobywaæ z³oto.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Rozumiem, a kto tak kaza³?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//To rozkaz Bloodwyna.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//Wydawa³o mi siê, ¿e szefem jest tu Kruk.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//To prawda. Niewolników da³ jednak w prezencie Bloodwynowi. Ju¿ ich nie potrzebuje.
	pardos.attribute[ATR_HITPOINTS] = 70;
	b_logentry(TOPIC_ADDON_SKLAVEN,"Kruk nie potrzebuje ju¿ niewolników. Teraz ich w³aœcicielem jest Bloodwyn.");
};


var int prisonguard_rules;

instance DIA_ADDON_10023_WACHE_GO(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 99;
	condition = dia_addon_10023_wache_go_condition;
	information = dia_addon_10023_wache_go_info;
	permanent = TRUE;
	description = "Uwolnij niewolników!";
};


func int dia_addon_10023_wache_go_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_go_info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Uwolnij niewolników!
	if(PRISONGUARD_RULES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//S³uchaj, rozkazy wydaje tu Bloodwyn. Niewolnicy s¹ jego w³asnoœci¹ i tylko on mo¿e ich uwolniæ.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Poza tym Thorus tak¿e ma tutaj pewn¹ w³adzê. A ty co robisz?
		PRISONGUARD_RULES = TRUE;
		b_logentry(TOPIC_ADDON_SKLAVEN,"Tylko Bloodwyn i Thorus mog¹ pozwoliæ na uwolnienie niewolników.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Sprawujesz tu jak¹œ wa¿n¹ funkcjê?
	Info_ClearChoices(dia_addon_10023_wache_go);
	Info_AddChoice(dia_addon_10023_wache_go,DIALOG_BACK,dia_addon_10023_wache_go_back);
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"Rozmawia³em z Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else if(Npc_IsDead(bloodwyn) && (Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"(Poka¿ g³owê Bloodwyna)",dia_addon_10023_wache_go_blood);
	}
	else
	{
		Info_AddChoice(dia_addon_10023_wache_go,"To ja decydujê, KTO mo¿e wejœæ do kopalni.",dia_addon_10023_wache_go_wer);
	};
};

func void dia_addon_10023_wache_go_back()
{
	Info_ClearChoices(dia_addon_10023_wache_go);
};

func void dia_addon_10023_wache_go_wer()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//To ja decydujê, KTO mo¿e wejœæ do kopalni.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//A zatem wykonujesz teraz pracê Estebana. A to oznacza, ¿e nie masz tu ¯ADNYCH wp³ywów. Zje¿d¿aj.
	Info_ClearChoices(dia_addon_10023_wache_go);
};


var int wache_einmal;

func void dia_addon_10023_wache_go_blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//Wystarczy?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//Nie chcê TEGO ogl¹daæ!
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Lepiej bêdzie, jak NATYCHMIAST uwolnisz niewolników.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//S³uchaj, nie mogê nikogo wypuœciæ, jeœli nie mam takiego rozkazu od Thorusa.
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_ClearChoices(dia_addon_10023_wache_go);
		Info_AddChoice(dia_addon_10023_wache_go,"Rozmawia³em z Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else
	{
		if(WACHE_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//Mówi³eœ, ¿e niewolnicy nale¿¹ do Bloodwyna.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Tak. Ale wspomina³em te¿, ¿e nie mogê ich zwolniæ bez pozwolenia Thorusa.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Jesteœ z tych typów, którzy nawet nie pójd¹ siê odlaæ bez pozwolenia, co?
			WACHE_EINMAL = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//No có¿, wspomnia³em, ¿e...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//...dobrze, daruj sobie resztê.
		};
		Info_ClearChoices(dia_addon_10023_wache_go);
	};
};

func void dia_addon_10023_wache_go_thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Rozmawia³em z Thorusem. Masz uwolniæ niewolników.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Dobrze, jeœli tak sobie ¿yczy Thorus. Zastanawia mnie, dlaczego wyda³ taki rozkaz...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//...ale nie p³ac¹ ci za zadawanie pytañ.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Dobrze, dobrze - widzê, ¿e nie mam ju¿ kogo pilnowaæ. Idê zjeœæ trochê tej smacznej zupy.
	READY_TOGO = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

