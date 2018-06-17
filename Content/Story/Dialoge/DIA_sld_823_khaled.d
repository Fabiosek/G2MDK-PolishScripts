
instance DIA_KHALED_EXIT(C_INFO)
{
	npc = sld_823_khaled;
	nr = 999;
	condition = dia_khaled_exit_condition;
	information = dia_khaled_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_khaled_exit_condition()
{
	return TRUE;
};

func void dia_khaled_exit_info()
{
	AI_StopProcessInfos(self);
};


var int khaled_weiter;

instance DIA_KHALED_HALLO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 1;
	condition = dia_khaled_hallo_condition;
	information = dia_khaled_hallo_info;
	permanent = TRUE;
	description = "Jak leci?";
};


func int dia_khaled_hallo_condition()
{
	if(KHALED_WEITER == FALSE)
	{
		return TRUE;
	};
};

func void dia_khaled_hallo_info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//Jak leci?
	if(Npc_KnowsInfo(other,dia_lee_wannajoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//A zatem chcesz siê do nas przy³¹czyæ? Masz jak¹œ przyzwoit¹ broñ?
		KHALED_WEITER = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Khaled sprzedaje broñ.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Jeœli chodzi o coœ wa¿nego, porozmawiaj z Lee. Jeœli nie, daj mi œwiêty spokój.
		AI_StopProcessInfos(self);
	};
};


instance DIA_KHALED_TRADE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 700;
	condition = dia_khaled_trade_condition;
	information = dia_khaled_trade_info;
	permanent = TRUE;
	description = "Jak¹ broñ mo¿esz mi zaoferowaæ?";
	trade = TRUE;
};


func int dia_khaled_trade_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_trade_info()
{
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Jak¹ broñ mo¿esz mi zaoferowaæ?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Najlepsz¹. Tylko popatrz.
};


instance DIA_KHALED_WANNAJOIN(C_INFO)
{
	npc = sld_823_khaled;
	nr = 10;
	condition = dia_khaled_wannajoin_condition;
	information = dia_khaled_wannajoin_info;
	permanent = TRUE;
	description = "Czy móg³bym siê do was przy³¹czyæ?";
};


func int dia_khaled_wannajoin_condition()
{
	if((KHALED_WEITER == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_khaled_wannajoin_info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Czy móg³bym siê do was przy³¹czyæ?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Jeœli przejdziesz próbê, zyskasz moje poparcie.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//Ju¿ j¹ przeszed³em.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//Dobrze, jeœli tak, to w porz¹dku.
	};
};


instance DIA_KHALED_WOHER(C_INFO)
{
	npc = sld_823_khaled;
	nr = 3;
	condition = dia_khaled_woher_condition;
	information = dia_khaled_woher_info;
	permanent = FALSE;
	description = "Jak trafi³eœ do najemników?";
};


func int dia_khaled_woher_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_woher_info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Jak trafi³eœ do najemników?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//Przyby³em tu wraz z Sylviem z po³udnia. Nale¿eliœmy do armii najemników, którzy walczyli z orkami.
};


instance DIA_KHALED_ABOUTSYLVIO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 4;
	condition = dia_khaled_aboutsylvio_condition;
	information = dia_khaled_aboutsylvio_info;
	permanent = FALSE;
	description = "Jaka jest twoja opinia na temat Sylvia?";
};


func int dia_khaled_aboutsylvio_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Jaka jest twoja opinia na temat Sylvia?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//To bardzo niebezpieczny cz³owiek! I ma pos³uch wœród wielu najemników. Lepiej z nim nie zadzieraæ.
};


instance DIA_KHALED_ABOUTLEE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 5;
	condition = dia_khaled_aboutlee_condition;
	information = dia_khaled_aboutlee_info;
	permanent = FALSE;
	description = "Jaka jest twoja opinia o Lee?";
};


func int dia_khaled_aboutlee_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutlee_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Jaka jest twoja opinia o Lee?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//S¹dzê, ¿e nie interesuje go nic poza wydostaniem siê z tej wyspy.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Chce siê udaæ na kontynent. Chyba ma tam z kimœ na pieñku.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//Zdecydowanie robi lepsz¹ robotê ni¿ Sylvio.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Co wiêcej, to dobry przywódca. Przez wiêkszoœæ czasu mo¿emy robiæ, co nam siê ¿ywnie spodoba.
};


instance DIA_KHALED_PICKPOCKET(C_INFO)
{
	npc = sld_823_khaled;
	nr = 900;
	condition = dia_khaled_pickpocket_condition;
	information = dia_khaled_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_khaled_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_khaled_pickpocket_info()
{
	Info_ClearChoices(dia_khaled_pickpocket);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_BACK,dia_khaled_pickpocket_back);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_PICKPOCKET,dia_khaled_pickpocket_doit);
};

func void dia_khaled_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_khaled_pickpocket);
};

func void dia_khaled_pickpocket_back()
{
	Info_ClearChoices(dia_khaled_pickpocket);
};

