
instance DIA_KERVO_EXIT(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 999;
	condition = dia_kervo_exit_condition;
	information = dia_kervo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kervo_exit_condition()
{
	return TRUE;
};

func void dia_kervo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_WASIST(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 4;
	condition = dia_kervo_wasist_condition;
	information = dia_kervo_wasist_info;
	description = "Coœ nie tak?";
};


func int dia_kervo_wasist_condition()
{
	return TRUE;
};

func void dia_kervo_wasist_info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//Coœ nie tak?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Naprawdê musisz o to pytaæ? Nie wystarczy rozejrzeæ siê dooko³a?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Odk¹d tu przyby³em, ci cholerni topielcy zd¹¿yli siê pojawiæ na ca³ej d³ugoœci rzeki.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Na pocz¹tku by³o ich tylko dwóch. Wczoraj widzia³em ju¿ przynajmniej piêciu.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Nie mam pojêcia, jak siê st¹d wydostanê.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "Próbowa³eœ drogi przez prze³êcz?";
};


func int dia_kervo_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_kervo_wasist))
	{
		return TRUE;
	};
};

func void dia_kervo_hilfe_info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Próbowa³eœ drogi przez prze³êcz?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Czy wygl¹dam na szaleñca? Dwudziestu ¿o³nierzy nie zdo³a³oby mnie st¹d wyci¹gn¹æ, dopóki grasuj¹ tam te bestie. Nienawidzê ich.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//Ju¿ sam ich smród wywo³uje u mnie zimne dreszcze. A ich gulgotanie dos³ownie mrozi krew w ¿y³ach.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Jeœli tak strasznie chcesz, ¿eby obdarli ciê ze skóry, to proszê bardzo, idŸ do nich.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"Dobrze, a zatem ruszam.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"Ale przecie¿ nie mo¿esz tu zostaæ na zawsze.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"Co dostanê, jeœli ich zabijê?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Ale przecie¿ nie mo¿esz tu zostaæ na zawsze.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Nie mam pojêcia, czego ode mnie chcesz, ale powiem ci tylko jedno: nigdzie siê st¹d nie ruszê.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Co dostanê, jeœli ich zabijê?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Hm. W zasadzie wystarczy³oby, gdybyœ pozby³ siê tych topielców sprzed jaskini.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Znalaz³em czarny kamieñ runiczny. Poniewa¿ jesteœ magiem, z pewnoœci¹ znajdziesz dla niego jakieœ zastosowanie.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Znalaz³em bry³ê rudy.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//Dostaniesz j¹ jako zap³atê.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Dobrze, a zatem ruszam.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Jasne. Nie bêdê ciê zatrzymywa³.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "Pozby³em siê topielców sprzed wejœcia do jaskini.";
};


func int dia_kervo_lurkerplatt_condition()
{
	if((MIS_KERVO_KILLLURKER == LOG_RUNNING) && Npc_IsDead(kervo_lurker1) && Npc_IsDead(kervo_lurker2) && Npc_IsDead(kervo_lurker3) && Npc_IsDead(kervo_lurker4) && Npc_IsDead(kervo_lurker5) && Npc_IsDead(kervo_lurker6))
	{
		return TRUE;
	};
};

func void dia_kervo_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Pozby³em siê topielców sprzed wejœcia do jaskini.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Doskonale. Nareszcie znowu czujê siê wolny.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Proszê, zgodnie z obietnic¹.
		if(hero.guild == GIL_KDF)
		{
			b_giveinvitems(self,other,itmi_runeblank,1);
		}
		else
		{
			b_giveinvitems(self,other,itmi_nugget,1);
		};
	};
	b_giveplayerxp(XP_KERVOKILLLURKER);
	MIS_KERVO_KILLLURKER = LOG_SUCCESS;
};


instance DIA_KERVO_VERGISSES(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_vergisses_condition;
	information = dia_kervo_vergisses_info;
	permanent = TRUE;
	description = "Czy teraz zechcesz przekroczyæ prze³êcz?";
};


func int dia_kervo_vergisses_condition()
{
	if(MIS_KERVO_KILLLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_kervo_vergisses_info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Czy teraz zechcesz przekroczyæ prze³êcz?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Nic z tego. Jeœli mnie z³api¹, zabior¹ mnie z powrotem do kopalni. Nigdzie siê nie ruszam.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_PICKPOCKET(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 900;
	condition = dia_kervo_pickpocket_condition;
	information = dia_kervo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kervo_pickpocket_condition()
{
	return c_beklauen(34,10);
};

func void dia_kervo_pickpocket_info()
{
	Info_ClearChoices(dia_kervo_pickpocket);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_BACK,dia_kervo_pickpocket_back);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_PICKPOCKET,dia_kervo_pickpocket_doit);
};

func void dia_kervo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kervo_pickpocket);
};

func void dia_kervo_pickpocket_back()
{
	Info_ClearChoices(dia_kervo_pickpocket);
};

