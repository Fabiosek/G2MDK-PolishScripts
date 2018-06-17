
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
	description = "Co� nie tak?";
};


func int dia_kervo_wasist_condition()
{
	return TRUE;
};

func void dia_kervo_wasist_info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//Co� nie tak?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//Naprawd� musisz o to pyta�? Nie wystarczy rozejrze� si� dooko�a?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//Odk�d tu przyby�em, ci cholerni topielcy zd��yli si� pojawi� na ca�ej d�ugo�ci rzeki.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//Na pocz�tku by�o ich tylko dw�ch. Wczoraj widzia�em ju� przynajmniej pi�ciu.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//Nie mam poj�cia, jak si� st�d wydostan�.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "Pr�bowa�e� drogi przez prze��cz?";
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
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Pr�bowa�e� drogi przez prze��cz?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Czy wygl�dam na szale�ca? Dwudziestu �o�nierzy nie zdo�a�oby mnie st�d wyci�gn��, dop�ki grasuj� tam te bestie. Nienawidz� ich.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//Ju� sam ich smr�d wywo�uje u mnie zimne dreszcze. A ich gulgotanie dos�ownie mrozi krew w �y�ach.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//Je�li tak strasznie chcesz, �eby obdarli ci� ze sk�ry, to prosz� bardzo, id� do nich.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"Dobrze, a zatem ruszam.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"Ale przecie� nie mo�esz tu zosta� na zawsze.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"Co dostan�, je�li ich zabij�?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//Ale przecie� nie mo�esz tu zosta� na zawsze.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//Nie mam poj�cia, czego ode mnie chcesz, ale powiem ci tylko jedno: nigdzie si� st�d nie rusz�.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//Co dostan�, je�li ich zabij�?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Hm. W zasadzie wystarczy�oby, gdyby� pozby� si� tych topielc�w sprzed jaskini.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//Znalaz�em czarny kamie� runiczny. Poniewa� jeste� magiem, z pewno�ci� znajdziesz dla niego jakie� zastosowanie.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//Znalaz�em bry�� rudy.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//Dostaniesz j� jako zap�at�.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Dobrze, a zatem ruszam.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Jasne. Nie b�d� ci� zatrzymywa�.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "Pozby�em si� topielc�w sprzed wej�cia do jaskini.";
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
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//Pozby�em si� topielc�w sprzed wej�cia do jaskini.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Doskonale. Nareszcie znowu czuj� si� wolny.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Prosz�, zgodnie z obietnic�.
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
	description = "Czy teraz zechcesz przekroczy� prze��cz?";
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
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Czy teraz zechcesz przekroczy� prze��cz?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Nic z tego. Je�li mnie z�api�, zabior� mnie z powrotem do kopalni. Nigdzie si� nie ruszam.
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

