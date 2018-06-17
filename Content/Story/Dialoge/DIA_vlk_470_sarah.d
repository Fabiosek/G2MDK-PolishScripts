
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Ach! To znowu ty!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "Jak idzie interes?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Jak idzie interes?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Kiedy pojawili si� paladyni, pomy�la�am, �e to dobra okazja na zarobek.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Zlecili jednak produkcj� swojej broni Haradowi, wi�c ani Hakon, ani ja nie zarobili�my nawet sztuki z�ota.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Co wi�cej, wie�niacy odci�li dostawy po�ywienia i ceny bardzo posz�y w g�r�.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Pocieszam si� jeszcze tylko tym, �e paladyni p�ac� za moje pokoje w gospodzie.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Sara sprzedaje bro� na targowisku.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "Na czym polega problem z ch�opami?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//Na czym polega problem z ch�opami?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Odmawiaj� dostaw towar�w.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Teraz, kiedy szlaki morskie zosta�y zamkni�te, miasto jest ca�kowicie zale�ne od dostaw z okolicznych farm.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//A Onar, w�a�ciciel ziemski, wynaj�� najemnik�w, by chroni� si� przed oddzia�ami stra�y. Inaczej stra�nicy sami zabraliby jedzenie.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Najemnicy jednak nie tylko broni� farmy Onara.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Zastraszaj� te� rolnik�w, kt�rzy prowadz� mniejsze gospodarstwa.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Widzia�am ich, kiedy mija�am farm� Akila. Nie chcia�abym by� teraz na jego miejscu.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "Gdzie znajduje si� farma Akila?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Gdzie znajduje si� farma Akila?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Je�li wyjdziesz wschodni� bram�, a potem skr�cisz w prawo, dojdziesz do schod�w.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//Prowadz� one na farm� Akila.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Jednak nie odwa�y�abym si� tam teraz i��. Z pewno�ci� najemnicy jeszcze nie odeszli.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Poka� mi swoje towary.";
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Poka� mi swoje towary.
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ty! Jak �miesz si� tu pokazywa�! Nie mog� tego udowodni�, ale jestem pewna, �e macza�e� �apska w tych brudnych machlojkach.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//To przez ciebie teraz tu jestem. Przez ciebie, i tego cholernego Canthara - niech dosi�gnie was gniew Innosa!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "Canthar pr�bowa� ci� wrobi�...";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar pr�bowa� ci� wrobi� i przej�� tw�j interes. Wyda�em go jednak stra�y miejskiej.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//W ten spos�b sprowadzi�e� na siebie gniew pot�nego cz�owieka. Znam tego drania od dawna, zawsze chcia� zaj�� moje miejsce.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Przyjmij t� bro� jako wyraz mojej wdzi�czno�ci.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

