
instance DIA_BABERA_EXIT(C_INFO)
{
	npc = bau_934_babera;
	nr = 999;
	condition = dia_babera_exit_condition;
	information = dia_babera_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babera_exit_condition()
{
	return TRUE;
};

func void dia_babera_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_HALLO(C_INFO)
{
	npc = bau_934_babera;
	nr = 1;
	condition = dia_babera_hallo_condition;
	information = dia_babera_hallo_info;
	description = "Witaj, œlicznotko.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Witaj, œlicznotko.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Nie zagaduj mnie, ch³opcze. Mów, czego chcesz. Jestem zajêta.
};


instance DIA_BABERA_WIESIEHTSAUS(C_INFO)
{
	npc = bau_934_babera;
	nr = 2;
	condition = dia_babera_wiesiehtsaus_condition;
	information = dia_babera_wiesiehtsaus_info;
	description = "Jak idzie praca?";
};


func int dia_babera_wiesiehtsaus_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_hallo))
	{
		return TRUE;
	};
};

func void dia_babera_wiesiehtsaus_info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//Jak idzie praca?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Popatrz na te wielkie pola, które musimy jeszcze obrobiæ, to zrozumiesz, jak idzie.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Chcesz siê naj¹æ do pracy w polu?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"Nie. Tak naprawdê to chcê zostaæ najemnikiem.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"Mo¿e.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Mo¿e.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//W takim razie powinieneœ poszukaæ naszego farmera, Sekoba. By³ kiedyœ poganiaczem niewolników. Mo¿e on coœ ci znajdzie.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Rzecz jasna, mo¿esz te¿ spróbowaæ w gospodarstwie Onara, na koñcu tamtej d³ugiej drogi.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Ale uwa¿aj na najemników. Nie przepadaj¹ za obcymi.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//Nie. Tak naprawdê to chcê zostaæ najemnikiem.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//A wiêc jesteœ w niew³aœciwym miejscu. Najemników mo¿na zazwyczaj znaleŸæ w gospodarstwie Onara.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};


instance DIA_BABERA_BRONKO(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_bronko_condition;
	information = dia_babera_bronko_info;
	description = "(Zapytaj o Bronka)";
};


func int dia_babera_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && Npc_KnowsInfo(other,dia_babera_wiesiehtsaus))
	{
		return TRUE;
	};
};

func void dia_babera_bronko_info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//S³uchaj, ten paskudny koleœ, który tam stoi...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//To Bronko. A co?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//To ten twój farmer?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//Tak ci powiedzia³? Sekob jest naszym farmerem. Bronko to obibok i leñ. Ale jest silny jak wó³.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//Dlatego nikt nie protestuje, kiedy siê obija.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Nie boi siê nikogo oprócz was, najemników.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Tylko najemnicy potrafi¹ zmusiæ go do pracy. Boi siê ich.
	};
	BABERA_BRONKOKEINBAUER = TRUE;
};


instance DIA_BABERA_ROSI(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_rosi_condition;
	information = dia_babera_rosi_info;
	description = "Gdzie jest Rosi?";
};


func int dia_babera_rosi_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING) && (KAPITEL >= 5) && (ROSIFOUNDKAP5 == FALSE))
	{
		return TRUE;
	};
};

func void dia_babera_rosi_info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//Gdzie jest Rosi?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//Nie mog³a ju¿ tu wytrzymaæ i posz³a na pó³noc, do lasu.
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi uciek³a z farmy Sekoba. Babera twierdzi, ¿e pobieg³a na pó³noc, w stronê lasów.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Rosi uciek³a z farmy Sekoba. Babera twierdzi, ¿e pobieg³a na pó³noc, w stronê lasów.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "Coœ jeszcze?";
};


func int dia_babera_dustoerst_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_bronko))
	{
		return TRUE;
	};
};

func void dia_babera_dustoerst_info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//A poza tym?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Jestem zajêta.
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_PICKPOCKET(C_INFO)
{
	npc = bau_934_babera;
	nr = 900;
	condition = dia_babera_pickpocket_condition;
	information = dia_babera_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_babera_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_babera_pickpocket_info()
{
	Info_ClearChoices(dia_babera_pickpocket);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_BACK,dia_babera_pickpocket_back);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_PICKPOCKET,dia_babera_pickpocket_doit);
};

func void dia_babera_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babera_pickpocket);
};

func void dia_babera_pickpocket_back()
{
	Info_ClearChoices(dia_babera_pickpocket);
};

