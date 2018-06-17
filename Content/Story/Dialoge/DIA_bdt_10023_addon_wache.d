
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
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hej, dok�d idziesz? Zamierzasz ruszy� t� �cie�k�?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//No tak, dlaczego nie?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//Na dole jest wi�cej niewolnik�w. Nie bij ich za bardzo, je�li nie s� w stanie pracowa�.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//Nie chcemy, �eby si� obijali. Maj� wydobywa� z�oto.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//Rozumiem, a kto tak kaza�?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//To rozkaz Bloodwyna.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//Wydawa�o mi si�, �e szefem jest tu Kruk.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//To prawda. Niewolnik�w da� jednak w prezencie Bloodwynowi. Ju� ich nie potrzebuje.
	pardos.attribute[ATR_HITPOINTS] = 70;
	b_logentry(TOPIC_ADDON_SKLAVEN,"Kruk nie potrzebuje ju� niewolnik�w. Teraz ich w�a�cicielem jest Bloodwyn.");
};


var int prisonguard_rules;

instance DIA_ADDON_10023_WACHE_GO(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 99;
	condition = dia_addon_10023_wache_go_condition;
	information = dia_addon_10023_wache_go_info;
	permanent = TRUE;
	description = "Uwolnij niewolnik�w!";
};


func int dia_addon_10023_wache_go_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_go_info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Uwolnij niewolnik�w!
	if(PRISONGUARD_RULES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//S�uchaj, rozkazy wydaje tu Bloodwyn. Niewolnicy s� jego w�asno�ci� i tylko on mo�e ich uwolni�.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Poza tym Thorus tak�e ma tutaj pewn� w�adz�. A ty co robisz?
		PRISONGUARD_RULES = TRUE;
		b_logentry(TOPIC_ADDON_SKLAVEN,"Tylko Bloodwyn i Thorus mog� pozwoli� na uwolnienie niewolnik�w.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Sprawujesz tu jak�� wa�n� funkcj�?
	Info_ClearChoices(dia_addon_10023_wache_go);
	Info_AddChoice(dia_addon_10023_wache_go,DIALOG_BACK,dia_addon_10023_wache_go_back);
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"Rozmawia�em z Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else if(Npc_IsDead(bloodwyn) && (Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"(Poka� g�ow� Bloodwyna)",dia_addon_10023_wache_go_blood);
	}
	else
	{
		Info_AddChoice(dia_addon_10023_wache_go,"To ja decyduj�, KTO mo�e wej�� do kopalni.",dia_addon_10023_wache_go_wer);
	};
};

func void dia_addon_10023_wache_go_back()
{
	Info_ClearChoices(dia_addon_10023_wache_go);
};

func void dia_addon_10023_wache_go_wer()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//To ja decyduj�, KTO mo�e wej�� do kopalni.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//A zatem wykonujesz teraz prac� Estebana. A to oznacza, �e nie masz tu �ADNYCH wp�yw�w. Zje�d�aj.
	Info_ClearChoices(dia_addon_10023_wache_go);
};


var int wache_einmal;

func void dia_addon_10023_wache_go_blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//Wystarczy?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//Nie chc� TEGO ogl�da�!
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//Lepiej b�dzie, jak NATYCHMIAST uwolnisz niewolnik�w.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//S�uchaj, nie mog� nikogo wypu�ci�, je�li nie mam takiego rozkazu od Thorusa.
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_ClearChoices(dia_addon_10023_wache_go);
		Info_AddChoice(dia_addon_10023_wache_go,"Rozmawia�em z Thorusem.",dia_addon_10023_wache_go_thorus);
	}
	else
	{
		if(WACHE_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//M�wi�e�, �e niewolnicy nale�� do Bloodwyna.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Tak. Ale wspomina�em te�, �e nie mog� ich zwolni� bez pozwolenia Thorusa.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//Jeste� z tych typ�w, kt�rzy nawet nie p�jd� si� odla� bez pozwolenia, co?
			WACHE_EINMAL = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//No c�, wspomnia�em, �e...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//...dobrze, daruj sobie reszt�.
		};
		Info_ClearChoices(dia_addon_10023_wache_go);
	};
};

func void dia_addon_10023_wache_go_thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//Rozmawia�em z Thorusem. Masz uwolni� niewolnik�w.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Dobrze, je�li tak sobie �yczy Thorus. Zastanawia mnie, dlaczego wyda� taki rozkaz...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//...ale nie p�ac� ci za zadawanie pyta�.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//Dobrze, dobrze - widz�, �e nie mam ju� kogo pilnowa�. Id� zje�� troch� tej smacznej zupy.
	READY_TOGO = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

