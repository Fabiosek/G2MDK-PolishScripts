
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
	description = "Witaj, �licznotko.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Witaj, �licznotko.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Nie zagaduj mnie, ch�opcze. M�w, czego chcesz. Jestem zaj�ta.
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
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Popatrz na te wielkie pola, kt�re musimy jeszcze obrobi�, to zrozumiesz, jak idzie.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Chcesz si� naj�� do pracy w polu?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"Nie. Tak naprawd� to chc� zosta� najemnikiem.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"Mo�e.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Mo�e.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//W takim razie powiniene� poszuka� naszego farmera, Sekoba. By� kiedy� poganiaczem niewolnik�w. Mo�e on co� ci znajdzie.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Rzecz jasna, mo�esz te� spr�bowa� w gospodarstwie Onara, na ko�cu tamtej d�ugiej drogi.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Ale uwa�aj na najemnik�w. Nie przepadaj� za obcymi.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//Nie. Tak naprawd� to chc� zosta� najemnikiem.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//A wi�c jeste� w niew�a�ciwym miejscu. Najemnik�w mo�na zazwyczaj znale�� w gospodarstwie Onara.
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
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//S�uchaj, ten paskudny kole�, kt�ry tam stoi...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//To Bronko. A co?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//To ten tw�j farmer?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//Tak ci powiedzia�? Sekob jest naszym farmerem. Bronko to obibok i le�. Ale jest silny jak w�.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//Dlatego nikt nie protestuje, kiedy si� obija.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Nie boi si� nikogo opr�cz was, najemnik�w.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Tylko najemnicy potrafi� zmusi� go do pracy. Boi si� ich.
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
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//Nie mog�a ju� tu wytrzyma� i posz�a na p�noc, do lasu.
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi uciek�a z farmy Sekoba. Babera twierdzi, �e pobieg�a na p�noc, w stron� las�w.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Rosi uciek�a z farmy Sekoba. Babera twierdzi, �e pobieg�a na p�noc, w stron� las�w.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "Co� jeszcze?";
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
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Jestem zaj�ta.
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

