
instance DIA_ADDON_MATT_EXIT(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 999;
	condition = dia_addon_matt_exit_condition;
	information = dia_addon_matt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_matt_exit_condition()
{
	return TRUE;
};

func void dia_addon_matt_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_PICKPOCKET(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 900;
	condition = dia_addon_matt_pickpocket_condition;
	information = dia_addon_matt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_matt_pickpocket_condition()
{
	return c_beklauen(55,91);
};

func void dia_addon_matt_pickpocket_info()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_BACK,dia_addon_matt_pickpocket_back);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_PICKPOCKET,dia_addon_matt_pickpocket_doit);
};

func void dia_addon_matt_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_matt_pickpocket);
};

func void dia_addon_matt_pickpocket_back()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
};


instance DIA_ADDON_MATT_HELLO(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 1;
	condition = dia_addon_matt_hello_condition;
	information = dia_addon_matt_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//Nowy? I dobrze. Przyda nam siê ka¿da para r¹k!
};


instance DIA_ADDON_MATT_PERM(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 2;
	condition = dia_addon_matt_perm_condition;
	information = dia_addon_matt_perm_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_addon_matt_perm_condition()
{
	return TRUE;
};

func void dia_addon_matt_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//Jak leci?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//Miksturê uzdrawiaj¹c¹!!! Którego z tych dwóch s³ów nie rozumiesz?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//Wszystko w porz¹dku, 'kapitanie'!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Nie dra¿nij mnie. Nie mamy ju¿ naszych statków.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//Zobaczymy, co wymyœli Greg.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Na razie w obozie jest cicho. Myœlê, ¿e trochê odpocznê.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//Na twoim miejscu zrobi³bym to samo.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Od kiedy s¹ tu bandyci, ³atwo o k³opoty.
	};
};


instance DIA_ADDON_MATT_BANDITS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 3;
	condition = dia_addon_matt_bandits_condition;
	information = dia_addon_matt_bandits_info;
	description = "Co wiesz o bandytach?";
};


func int dia_addon_matt_bandits_condition()
{
	return TRUE;
};

func void dia_addon_matt_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//Co wiesz o bandytach?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//Poza tym, ¿e s¹ niebezpiecznymi mordercami i maj¹ przewagê liczebn¹?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//Maj¹ du¿o z³ota, które wydaj¹ jak najêci.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//A w³aœciwie to wydawali du¿o z³ota, bo za ostatni¹ dostawê nie zap³acili.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//Nie s¹dzê, ¿eby zabrak³o im z³ota.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//Pewnie pomyœleli, ¿e wszystko ujdzie im na sucho.
};


instance DIA_ADDON_MATT_FRANCIS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 4;
	condition = dia_addon_matt_francis_condition;
	information = dia_addon_matt_francis_info;
	description = "Co wiesz o Francisie?";
};


func int dia_addon_matt_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_matt_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//Co wiesz o Francisie?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//Masz na myœli coœ innego, ni¿ to, ¿e jest leniwy i niezaradny?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Tak.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Pomyœlmy... Nie, nic innego nie przychodzi mi do g³owy.
};


instance DIA_ADDON_MATT_ANHEUERN(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 11;
	condition = dia_addon_matt_anheuern_condition;
	information = dia_addon_matt_anheuern_info;
	permanent = FALSE;
	description = "ChodŸ ze mn¹.";
};


func int dia_addon_matt_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_matt_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//ChodŸ ze mn¹.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//Nie widzisz, ¿e próbujê tu odpocz¹æ?
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//To rozkaz Grega.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//To czemu nie mówisz od razu? Ju¿ idê!
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//Dok¹d idziemy?
	Info_ClearChoices(dia_addon_matt_anheuern);
	Info_AddChoice(dia_addon_matt_anheuern,"Zamknij siê i idŸ za mn¹.",dia_addon_matt_anheuern_shutup);
	Info_AddChoice(dia_addon_matt_anheuern,"Musimy oczyœciæ kanion.",dia_addon_matt_anheuern_clearcanyon);
};

func void dia_addon_matt_anheuern_shutup()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Zamknij siê i idŸ za mn¹.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//Tak jest, 'kapitanie'!
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void dia_addon_matt_anheuern_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//Musimy oczyœciæ kanion.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//Oszala³eœ? Tam jest pe³no dzikich bestii! I do tego te brzytwiaki!
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//Wiem o tym. A teraz chodŸ.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//Lepiej zdob¹dŸ mikstury uzdrawiaj¹ce, bo coœ mi siê widzi, ¿e bêdziemy ich potrzebowaæ.
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_MATT_COMEON(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 12;
	condition = dia_addon_matt_comeon_condition;
	information = dia_addon_matt_comeon_info;
	permanent = TRUE;
	description = "ChodŸ.";
};


func int dia_addon_matt_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_matt_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_matt_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//ChodŸ.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//Ta jest, 'kapitanie'!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_MATT_GOHOME(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 13;
	condition = dia_addon_matt_gohome_condition;
	information = dia_addon_matt_gohome_info;
	permanent = TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};


func int dia_addon_matt_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_matt_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//Nie potrzebujê ju¿ twojej pomocy.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//Chocia¿ ³yczek grogu!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_MATT_TOOFAR(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 14;
	condition = dia_addon_matt_toofar_condition;
	information = dia_addon_matt_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_matt_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//Mo¿esz dalej iœæ sam, 'kapitanie'!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//Wracam z ch³opakami do obozu.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//Wracam do obozu!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_HEALING(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 15;
	condition = dia_addon_matt_healing_condition;
	information = dia_addon_matt_healing_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_healing_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void dia_addon_matt_healing_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//Kapitanie! Przyda³aby mi siê mikstura uzdrawiaj¹ca.
};

