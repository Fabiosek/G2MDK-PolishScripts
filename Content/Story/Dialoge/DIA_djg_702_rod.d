
instance DIA_RODDJG_EXIT(C_INFO)
{
	npc = djg_702_rod;
	nr = 999;
	condition = dia_roddjg_exit_condition;
	information = dia_roddjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_roddjg_exit_condition()
{
	return TRUE;
};

func void dia_roddjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_HALLO(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_hallo_condition;
	information = dia_roddjg_hallo_info;
	description = "Wszystko w porz¹dku?";
};


func int dia_roddjg_hallo_condition()
{
	if(DJG_SWAMPPARTY == FALSE)
	{
		return TRUE;
	};
};

func void dia_roddjg_hallo_info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//Wszystko w porz¹dku?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//Te buty mnie wykoñcz¹! Ca³a zbroja jest naprawdê w porz¹dku, ale czy te wi¹zania musz¹ byæ tak cholernie ciasne?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//Jeœli je trochê poluzujê, buty pospadaj¹ mi z nóg.
	if((Npc_IsDead(swampdragon) == FALSE) && (DJG_SWAMPPARTY == FALSE))
	{
		Info_AddChoice(dia_roddjg_hallo,"Na kogo czekasz?",dia_roddjg_hallo_warten);
	};
	Info_AddChoice(dia_roddjg_hallo,"Sk¹d masz te buty?",dia_roddjg_hallo_woher);
};

func void dia_roddjg_hallo_woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//Sk¹d masz te buty?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//Stary wiarus Bennet zrobi³ je dla nas, ³owców smoków, a my s³ono za ten szmelc zap³aciliœmy.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//Jeœli kiedyœ dorwê tego drania, to ka¿ê mu ze¿reæ te buty wraz z podeszwami, a do tego oddaæ pieni¹dze.
};

func void dia_roddjg_hallo_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//Na kogo czekasz?
	Info_ClearChoices(dia_roddjg_hallo);
	if(Npc_IsDead(djg_cipher) == FALSE)
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//Czekam, a¿ Cipher przywlecze tutaj swój szanowny ty³ek. Musimy wyruszaæ.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//Pomyœla³em sobie, ¿e mo¿na by zerkn¹æ nieco dok³adniej na pobliskie bagna.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//Jak myœlisz, powinniœmy sprawdziæ, co mo¿na na nich znaleŸæ?
		Info_AddChoice(dia_roddjg_hallo,"Pójdê sam.",dia_roddjg_hallo_warten_allein);
		Info_AddChoice(dia_roddjg_hallo,"Co wiesz o bagnach?",dia_roddjg_hallo_warten_wasweisstdu);
		Info_AddChoice(dia_roddjg_hallo,"ChodŸmy tam razem.",dia_roddjg_hallo_warten_zusammen);
	};
};

func void dia_roddjg_hallo_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//ChodŸmy tam razem.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//W porz¹dku. W takim razie, za mn¹!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void dia_roddjg_hallo_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//Co wiesz o bagnach?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//Tylko tyle, ¿e niemi³osiernie cuchn¹, i pewnie kryj¹ w sobie duuu¿o z³ota. Czy to nie wystarczy?
};

func void dia_roddjg_hallo_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//Pójdê sam.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//Có¿, ¿yczê powodzenia.
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_WARTEMAL(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_wartemal_condition;
	information = dia_roddjg_wartemal_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_roddjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_roddjg_hallo) || (DJG_SWAMPPARTY == TRUE))
	{
		return TRUE;
	};
};

func void dia_roddjg_wartemal_info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//Co siê z tob¹ dzieje?
	if(((DJG_SWAMPPARTY == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(djg_cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//S³uchaj cz³owieku! Wszystko wymknê³o siê spod kontroli. Po prostu siê st¹d ulotniê.
		DJG_SWAMPPARTY = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//Te buty! Te zafajdane buty!
	};
	if(Npc_IsDead(swampdragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//I co teraz poczniesz?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//Te¿ pytania zadajesz... Zacznê od tego, ¿e kupiê sobie nowe buty!
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROD_PICKPOCKET(C_INFO)
{
	npc = djg_702_rod;
	nr = 900;
	condition = dia_rod_pickpocket_condition;
	information = dia_rod_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rod_pickpocket_condition()
{
	return c_beklauen(16,320);
};

func void dia_rod_pickpocket_info()
{
	Info_ClearChoices(dia_rod_pickpocket);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_BACK,dia_rod_pickpocket_back);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_PICKPOCKET,dia_rod_pickpocket_doit);
};

func void dia_rod_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rod_pickpocket);
};

func void dia_rod_pickpocket_back()
{
	Info_ClearChoices(dia_rod_pickpocket);
};

