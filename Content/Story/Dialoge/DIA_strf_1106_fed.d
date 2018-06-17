
instance DIA_FED_EXIT(C_INFO)
{
	npc = strf_1106_fed;
	nr = 999;
	condition = dia_fed_exit_condition;
	information = dia_fed_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fed_exit_condition()
{
	return TRUE;
};

func void dia_fed_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FED_HALLO(C_INFO)
{
	npc = strf_1106_fed;
	nr = 2;
	condition = dia_fed_hallo_condition;
	information = dia_fed_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fed_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_FAJETH_KILL_SNAPPER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_fed_hallo_info()
{
	AI_Output(self,other,"DIA_Fed_HALLO_08_00");	//Czego ode mnie chcesz? Nigdzie nie idê!
	AI_Output(other,self,"DIA_Fed_HALLO_15_01");	//Spokojnie, odprê¿ siê - nikt nie wymaga od ciebie, ¿ebyœ siê st¹d rusza³.
	AI_Output(self,other,"DIA_Fed_HALLO_08_02");	//Chwa³a Innosowi. Wiesz, przez ostatnie kilka dni wielu naszych ludzi opuœci³o obóz i ¿aden z nich nie wróci³.
	AI_Output(self,other,"DIA_Fed_HALLO_08_03");	//Wszyscy zostali po¿arci przez zêbacze. Ale nie ja. Ja zostanê tutaj, dopóki to wszystko siê nie skoñczy.
};


instance DIA_FED_SNAPPER(C_INFO)
{
	npc = strf_1106_fed;
	nr = 3;
	condition = dia_fed_snapper_condition;
	information = dia_fed_snapper_info;
	permanent = FALSE;
	description = "Co wiesz o zêbaczach?";
};


func int dia_fed_snapper_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fed_snapper_info()
{
	AI_Output(other,self,"DIA_Fed_Snapper_15_00");	//Co wiesz o zêbaczach?
	AI_Output(self,other,"DIA_Fed_Snapper_08_01");	//Bilgot obserwuje je przez ca³¹ noc. Kilka z nich jest na dole, w stawie obok mrocznej wie¿y.
	AI_Output(self,other,"DIA_Fed_Snapper_08_02");	//Inne czaj¹ siê na górze... Czekaj¹, a¿ bêdziemy wyczerpani. Wtedy staniemy siê ³atwym ³upem...
	AI_Output(self,other,"DIA_Fed_Snapper_08_03");	//ZnaleŸliœmy siê w pu³apce. Wkrótce zaatakuj¹ obóz i po¿r¹ nas wszystkich...
	AI_Output(other,self,"DIA_Fed_Snapper_15_04");	//Rozumiem.
};


instance DIA_FED_PERM(C_INFO)
{
	npc = strf_1106_fed;
	nr = 5;
	condition = dia_fed_perm_condition;
	information = dia_fed_perm_info;
	permanent = TRUE;
	description = "Wszystko w porz¹dku?";
};


func int dia_fed_perm_condition()
{
	return TRUE;
};

func void dia_fed_perm_info()
{
	AI_Output(other,self,"DIA_Fed_Perm_15_00");	//Wszystko w porz¹dku?
	if(MIS_FAJETH_KILL_SNAPPER != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_01");	//Wszêdzie dooko³a czaj¹ siê zêbacze. Potrafisz je wyczuæ? Ja potrafiê... Czujê ich smród...
	}
	else
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_02");	//Zêbacze chyba siê wycofa³y. Ale to nic nie oznacza. Jeszcze tu wróc¹ - a jeœli nie one, to wilki, jaszczury albo orkowie.
		AI_Output(self,other,"DIA_Fed_Perm_08_03");	//Prêdzej czy póŸniej nas dostan¹, zabij¹ i po¿r¹ nasze zw³oki...
	};
	AI_StopProcessInfos(self);
};


instance DIA_FED_PICKPOCKET(C_INFO)
{
	npc = strf_1106_fed;
	nr = 900;
	condition = dia_fed_pickpocket_condition;
	information = dia_fed_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fed_pickpocket_condition()
{
	return c_beklauen(32,8);
};

func void dia_fed_pickpocket_info()
{
	Info_ClearChoices(dia_fed_pickpocket);
	Info_AddChoice(dia_fed_pickpocket,DIALOG_BACK,dia_fed_pickpocket_back);
	Info_AddChoice(dia_fed_pickpocket,DIALOG_PICKPOCKET,dia_fed_pickpocket_doit);
};

func void dia_fed_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fed_pickpocket);
};

func void dia_fed_pickpocket_back()
{
	Info_ClearChoices(dia_fed_pickpocket);
};

